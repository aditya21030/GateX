#!/usr/bin/env python3
"""
GateX Mock Publisher & OTA Question Sync Tool
=============================================
Allows authoring GATE questions with pure LaTeX ($math$), options, solutions,
and local diagram images, and compiling/publishing them Over-The-Air to Firestore.

Usage:
  1. Validate questions & LaTeX syntax:
     python tools/scripts/publish_mock.py --input tools/sample_mock/ --validate

  2. Compile to JSON ready for app:
     python tools/scripts/publish_mock.py --input tools/sample_mock/ --output da_full_mock_1.json

  3. Upload directly to Firebase (OTA):
     python tools/scripts/publish_mock.py --input tools/sample_mock/ --mock-id da_full_mock_1 --upload --service-account serviceAccountKey.json
"""

import os
import re
import sys
import json
import argparse
from pathlib import Path

# Ensure UTF-8 output on Windows consoles
if sys.platform == 'win32':
    try:
        sys.stdout.reconfigure(encoding='utf-8')
        sys.stderr.reconfigure(encoding='utf-8')
    except Exception:
        pass

def parse_markdown_questions(md_text, images_dir=None):
    """
    Parses a Markdown file containing multiple questions separated by '---' frontmatter blocks.
    """
    questions = []
    
    # Split questions by YAML frontmatter delimiter
    # Pattern matches: --- \n (yaml block) \n --- \n (body)
    blocks = re.split(r'\n---\s*\n', md_text)
    
    i = 0
    while i < len(blocks):
        block = blocks[i].strip()
        if not block:
            i += 1
            continue
            
        # Check if block looks like YAML metadata
        if ('id:' in block or 'type:' in block or 'subject:' in block) and i + 1 < len(blocks):
            yaml_part = block
            body_part = blocks[i + 1].strip()
            i += 2
        else:
            # Inline YAML frontmatter
            parts = block.split('---')
            if len(parts) >= 2:
                yaml_part = parts[0].strip()
                body_part = parts[1].strip()
                i += 1
            else:
                i += 1
                continue

        # Parse YAML fields
        meta = {}
        for line in yaml_part.split('\n'):
            line = line.strip()
            if not line or line.startswith('#'):
                continue
            if ':' in line:
                key, val = line.split(':', 1)
                meta[key.strip().lower()] = val.strip().strip('"').strip("'")

        # Parse Body: Question text, Options, and Explanation
        lines = body_part.split('\n')
        q_lines = []
        options = []
        explanation_lines = []
        in_explanation = False

        for line in lines:
            stripped = line.strip()
            
            # Check for Explanation quote block
            if stripped.startswith('>') or in_explanation:
                in_explanation = True
                cleaned_exp = stripped.lstrip('>').strip()
                if cleaned_exp.lower().startswith('explanation:'):
                    cleaned_exp = cleaned_exp[len('explanation:'):].strip()
                if cleaned_exp:
                    explanation_lines.append(cleaned_exp)
                continue

            # Check for MCQ Options: - (A) ..., - (B) ..., A) ...
            opt_match = re.match(r'^(?:-\s*)?\(?([A-Da-d])\)[\s.:]+(.*)$', stripped)
            if opt_match:
                options.append(opt_match.group(2).strip())
                continue

            q_lines.append(line)

        question_text = '\n'.join(q_lines).strip()
        explanation = '\n'.join(explanation_lines).strip()
        
        q_type = meta.get('type', 'MCQ').upper()
        if q_type not in ['MCQ', 'MSQ', 'NAT']:
            q_type = 'MCQ' if options else 'NAT'

        q_id = meta.get('id', f"Q_{len(questions) + 1}")
        image_name = meta.get('image', None)
        has_image = bool(image_name)

        q_obj = {
            'id': q_id,
            'subject': meta.get('subject', 'General Aptitude'),
            'topic': meta.get('topic', 'General'),
            'questionText': question_text,
            'options': options,
            'correctAnswer': meta.get('correct', meta.get('answer', 'A')),
            'isMCQ': q_type in ['MCQ', 'MSQ'],
            'type': q_type,
            'explanation': explanation,
            'year': int(meta.get('year', 2026)),
            'difficulty': meta.get('difficulty', 'Medium'),
            'hasImage': has_image,
            'imagePath': image_name,
            'isCompleted': False,
            'isBookmarked': False,
            'isFlaggedForRevision': False,
            'userAnswer': None,
        }
        questions.append(q_obj)

    return questions

def validate_questions(questions, images_dir=None):
    """
    Validates question formats, LaTeX syntax, and image references.
    """
    errors = []
    warnings = []

    print(f"\n🔍 Validating {len(questions)} questions...")

    for idx, q in enumerate(questions, start=1):
        prefix = f"Q#{idx} [{q['id']}]:"

        # 1. Question Text
        if not q['questionText']:
            errors.append(f"{prefix} Question text is empty!")

        # 2. LaTeX Delimiter Balance
        # Check single dollar count ($)
        single_dollars = len(re.findall(r'(?<!\$)\$(?!\$)', q['questionText']))
        if single_dollars % 2 != 0:
            warnings.append(f"{prefix} Unbalanced single '$' LaTeX delimiters in question text.")

        # 3. Type & Options
        if q['type'] in ['MCQ', 'MSQ']:
            if len(q['options']) < 2:
                errors.append(f"{prefix} MCQ/MSQ must have at least 2 options, found {len(q['options'])}.")
            if not q['correctAnswer']:
                errors.append(f"{prefix} Missing correct answer!")
        elif q['type'] == 'NAT':
            if q['options']:
                warnings.append(f"{prefix} NAT question has options listed, but NAT questions take numerical inputs.")

        # 4. Image Check
        if q['hasImage'] and q['imagePath']:
            img_path = q['imagePath']
            if not img_path.startswith('http'):
                if images_dir:
                    full_local = Path(images_dir) / img_path
                    if not full_local.exists():
                        errors.append(f"{prefix} Referenced image '{img_path}' not found in '{images_dir}'!")
                else:
                    warnings.append(f"{prefix} Image '{img_path}' is a local reference but no images_dir provided.")

    print(f"   Errors: {len(errors)}")
    print(f"   Warnings: {len(warnings)}")

    for w in warnings:
        print(f"   ⚠️  {w}")
    for e in errors:
        print(f"   ❌ {e}")

    return len(errors) == 0

def upload_to_firebase(mock_id, questions, images_dir=None, service_account_path=None, bucket_name=None):
    """
    Uploads images to Firebase Storage and publishes the mock document to Firestore with version bump.
    """
    try:
        import firebase_admin
        from firebase_admin import credentials, firestore, storage
    except ImportError:
        print("❌ Error: firebase-admin Python package not installed.")
        print("   Run: pip install firebase-admin")
        return False

    if not service_account_path or not Path(service_account_path).exists():
        print(f"❌ Error: Service account JSON key not found at '{service_account_path}'.")
        print("   Download your service account from Firebase Console -> Project Settings -> Service Accounts.")
        return False

    # Initialize Firebase Admin
    if not firebase_admin._apps:
        cred = credentials.Certificate(service_account_path)
        firebase_admin.initialize_app(cred, {'storageBucket': bucket_name} if bucket_name else None)

    db = firestore.client()

    # 1. Upload Images to Firebase Storage (if any local images)
    if images_dir and Path(images_dir).exists():
        print("\n📤 Uploading diagrams to Firebase Storage...")
        bucket = storage.bucket() if bucket_name else None

        for q in questions:
            if q['hasImage'] and q['imagePath'] and not q['imagePath'].startswith('http'):
                img_file = Path(images_dir) / q['imagePath']
                if img_file.exists() and bucket:
                    remote_blob_name = f"mock_diagrams/{mock_id}/{q['imagePath']}"
                    blob = bucket.blob(remote_blob_name)
                    blob.upload_from_filename(str(img_file))
                    blob.make_public()
                    public_url = blob.public_url
                    q['imagePath'] = public_url
                    print(f"   ✓ Uploaded {img_file.name} -> {public_url}")

    # 2. Upload Mock to Firestore (/mocks/{mock_id})
    print(f"\n🚀 Publishing mock '{mock_id}' to Firestore...")
    mock_doc = {
        'id': mock_id,
        'updated_at': firestore.SERVER_TIMESTAMP,
        'question_count': len(questions),
        'questions': questions,
    }
    db.collection('mocks').doc(mock_id).set(mock_doc)

    # 3. Bump version in /metadata/mock_version
    meta_ref = db.collection('metadata').doc('mock_version')
    meta_doc = meta_ref.get()
    current_ver = meta_doc.data().get('version', 0) if meta_doc.exists else 0
    new_ver = current_ver + 1
    meta_ref.set({
        'version': new_ver,
        'last_updated': firestore.SERVER_TIMESTAMP,
        'last_published_mock': mock_id,
    }, merge=True)

    print(f"✅ Successfully published '{mock_id}'!")
    print(f"   Version bumped from {current_ver} -> {new_ver}.")
    print("   All user devices will automatically download this update upon next app open!")
    return True

def main():
    parser = argparse.ArgumentParser(description="GateX Mock Question OTA Publisher")
    parser.add_argument('--input', '-i', required=True, help="Path to input Markdown file or folder")
    parser.add_argument('--output', '-o', help="Output JSON file path")
    parser.add_argument('--mock-id', default='da_full_mock_1', help="Unique mock identifier (e.g. da_full_mock_1, cs_full_mock_2)")
    parser.add_argument('--images-dir', help="Directory containing referenced diagram images")
    parser.add_argument('--validate', action='store_true', help="Validate syntax, questions count, and LaTeX without publishing")
    parser.add_argument('--upload', action='store_true', help="Upload directly to Firebase Firestore/Storage")
    parser.add_argument('--service-account', help="Path to Firebase Service Account JSON credentials")
    parser.add_argument('--bucket', help="Firebase Storage bucket name (e.g. your-app.appspot.com)")

    args = parser.parse_args()

    input_path = Path(args.input)
    images_dir = args.images_dir

    if input_path.is_dir():
        # Look for questions.md in folder
        md_file = input_path / 'questions.md'
        if not md_file.exists():
            md_files = list(input_path.glob('*.md'))
            if not md_files:
                print(f"❌ Error: No .md files found in directory '{input_path}'")
                sys.exit(1)
            md_file = md_files[0]
        if not images_dir and (input_path / 'images').exists():
            images_dir = str(input_path / 'images')
    else:
        md_file = input_path
        if not images_dir and (input_path.parent / 'images').exists():
            images_dir = str(input_path.parent / 'images')

    print(f"📖 Reading questions from: {md_file}")
    with open(md_file, 'r', encoding='utf-8') as f:
        md_content = f.read()

    questions = parse_markdown_questions(md_content, images_dir)
    print(f"✓ Parsed {len(questions)} questions.")

    is_valid = validate_questions(questions, images_dir)

    if args.validate:
        if is_valid:
            print("\n✨ All questions validated successfully! Ready to publish.")
            sys.exit(0)
        else:
            print("\n❌ Validation failed. Fix errors above.")
            sys.exit(1)

    # Save to JSON if requested or default
    output_path = args.output or f"{args.mock_id}.json"
    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump({'mock_id': args.mock_id, 'questions': questions}, f, indent=2, ensure_ascii=False)
    print(f"💾 Saved compiled mock to: {output_path}")

    # Upload to Firebase if requested
    if args.upload:
        if not is_valid:
            print("❌ Cannot upload: Questions failed validation.")
            sys.exit(1)
        upload_to_firebase(
            mock_id=args.mock_id,
            questions=questions,
            images_dir=images_dir,
            service_account_path=args.service_account,
            bucket_name=args.bucket,
        )

if __name__ == '__main__':
    main()
