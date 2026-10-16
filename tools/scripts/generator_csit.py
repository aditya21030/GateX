import json

data = json.load(open('gate_csit_subjectwise.json', encoding='utf-8'))
out = ""

for s_idx, subj in enumerate(data.get('subjects', [])):
    subject_name = subj.get('subject', f'Subject_{s_idx}')
    for q_idx, q in enumerate(subj.get('questions', [])):
        q_id = f"mock_csit_{subject_name.replace(' ', '')}_{q_idx}"
        options = q.get('options', [])
        is_mcq = (q.get('type') != 'NAT')
        ans = q.get('answer', '')
        if isinstance(ans, list):
            ans = ','.join(ans)
        out += f"  PYQ(id: {repr(q_id)}, year: 2026, setNumber: 1, subject: {repr(subject_name)}, topic: 'General', questionText: {repr(q.get('question', ''))}, options: {repr(options)}, correctAnswer: {repr(ans)}, isMCQ: {str(is_mcq).lower()}, type: {repr(q.get('type', 'MCQ'))}, explanation: '', difficulty: 'Medium', hasImage: false, imagePath: null),\n"

# Read existing file, strip the closing bracket and semicolon, append new items, and close.
existing_path = 'lib/data/csit_mock_pyqs.dart'
existing_content = open(existing_path, 'r', encoding='utf-8').read()

if existing_content.strip().endswith('];'):
    new_content = existing_content.rsplit('];', 1)[0] + out + '];\n'
    open(existing_path, 'w', encoding='utf-8').write(new_content)
    print("Successfully appended CSIT subject-wise questions.")
else:
    print("Error: Could not find closing ]; in csit_mock_pyqs.dart")
