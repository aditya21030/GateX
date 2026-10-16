import json
import re

subject_map = {
    'Algorithms': 'Algorithms',
    'Compiler Design': 'Compiler Design',
    'Computer Networks': 'Computer Networks',
    'Computer Organization': 'Computer Organization',
    'Data Structures': 'Programming & Data Structures',
    'Database Management Systems': 'Databases',
    'Digital Logic': 'Digital Logic',
    'Discrete Mathematics': 'Engineering Mathematics',
    'Engineering Mathematics': 'Engineering Mathematics',
    'General Aptitude': 'General Aptitude',
    'Operating Systems': 'Operating System',
    'Programming and Data Structures': 'Programming & Data Structures',
    'Theory of Computation': 'Theory of Computation',
}

def escape_str(s):
    if s is None:
        return 'null'
    # Escape backslashes first
    s = s.replace('\\', '\\\\')
    # Escape dollar signs
    s = s.replace('$', '\\$')
    # Escape double quotes
    s = s.replace('"', '\\"')
    # Escape newlines
    s = s.replace('\n', '\\n')
    return f'"{s}"'

with open('Gate_csit_mock1.json', 'r', encoding='utf-8') as f:
    data = json.load(f)

dart_code = "import '../models/models.dart';\n\nList<PYQ> csitMockQuestions = [\n"

for q in data:
    subject = subject_map.get(q.get('subject', ''), q.get('subject', ''))
    
    # Prefix ID with 'csit_mock1_' to match the filtering logic in app_provider.dart if necessary, 
    # but the JSON already has IDs like 'CS_2026_GA_1'.
    # Actually, the user asked to implement "this full length mock". For mockTests, 
    # we just provide the list. In `AppProvider`:
    # List<PYQ> get mockQuestions => _activeExam == 'CSIT' ? csitMockQuestions : daMockQuestions;
    # So the exact ID prefix isn't strictly enforced for mock questions.
    # However, to be safe, I'll prepend 'csit_mock1_' to ensure uniqueness.
    original_id = str(q['id'])
    new_id = f"csit_mock1_{original_id}"
    
    dart_code += "  PYQ(\n"
    dart_code += f"    id: {escape_str(new_id)},\n"
    dart_code += f"    year: {q.get('year', 2026)},\n"
    
    set_val = q.get('set')
    if set_val is not None:
        dart_code += f"    setNumber: {set_val},\n"
        
    dart_code += f"    subject: {escape_str(subject)},\n"
    dart_code += f"    topic: {escape_str(q.get('topic', 'General'))},\n"
    dart_code += f"    type: {escape_str(q.get('type', 'MCQ'))},\n"
    is_mcq = q.get('type', 'MCQ') in ['MCQ', 'MSQ']
    dart_code += f"    isMCQ: {'true' if is_mcq else 'false'},\n"
    dart_code += f"    questionText: {escape_str(q.get('question', ''))},\n"
    
    options_str = "[" + ", ".join([escape_str(opt) for opt in q.get('options', [])]) + "]"
    dart_code += f"    options: {options_str},\n"
    dart_code += f"    correctAnswer: {escape_str(q.get('correct_answer', ''))},\n"
    dart_code += f"    explanation: {escape_str(q.get('solution', ''))},\n"
    dart_code += f"    difficulty: {escape_str(q.get('difficulty', 'Medium'))},\n"
    
    has_img = q.get('has_image', False)
    dart_code += f"    hasImage: {'true' if has_img else 'false'},\n"
    if has_img:
        dart_code += f"    imagePath: 'assets/images/{original_id}.png',\n"
    
    img_desc = q.get('image_description')
    if img_desc:
        dart_code += f"    imageDescription: {escape_str(img_desc)},\n"
        
    dart_code += "  ),\n"

dart_code += "];\n"

with open('lib/data/csit_mock_pyqs.dart', 'w', encoding='utf-8') as f:
    f.write(dart_code)

print('Generated mock questions')
