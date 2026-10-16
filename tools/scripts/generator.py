import json

data = json.load(open('gate_da_subjectwise.json', encoding='utf-8'))
out = "import '../models/models.dart';\n\nList<PYQ> daMockQuestions = [\n"

for s_idx, subj in enumerate(data.get('subjects', [])):
    subject_name = subj.get('subject', f'Subject_{s_idx}')
    for q_idx, q in enumerate(subj.get('questions', [])):
        q_id = f"mock_da_{subject_name.replace(' ', '')}_{q_idx}"
        options = q.get('options', [])
        is_mcq = (q.get('type') != 'NAT')
        ans = q.get('answer', '')
        if isinstance(ans, list):
            ans = ','.join(ans)
        out += f"  PYQ(id: {repr(q_id)}, year: 2026, setNumber: 1, subject: {repr(subject_name)}, topic: 'General', questionText: {repr(q.get('question', ''))}, options: {repr(options)}, correctAnswer: {repr(ans)}, isMCQ: {str(is_mcq).lower()}, type: {repr(q.get('type', 'MCQ'))}, explanation: '', difficulty: 'Medium', hasImage: false, imagePath: null),\n"
out += '];\n'

open('lib/data/mock_pyqs.dart', 'w', encoding='utf-8').write(out)
