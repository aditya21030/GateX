import json
import re

subject_map = {
    'Artificial Intelligence': 'AI',
    'Calculus': 'Calculus and Optimization',
    'Data Structures and Algorithms': 'DSA (Data Structures and Algorithms)',
    'Database Management': 'Database Management and Warehousing',
    'General Aptitude': 'General Aptitude',
    'Linear Algebra': 'Linear Algebra',
    'Machine Learning': 'Machine Learning',
    'Probability and Statistics': 'Probability and Statistics',
    'Programming in Python': 'Python (Main Topics Only)',
}

def escape_str(s):
    if s is None:
        return 'null'
    s = s.replace('\\', '\\\\')
    s = s.replace('$', '\\$')
    s = s.replace('"', '\\"')
    s = s.replace('\n', '\\n')
    return f'"{s}"'

with open('gate_da_mock1_fixed.json', 'r', encoding='utf-8') as f:
    data = json.load(f)

dart_code = "import '../models/models.dart';\n\nList<PYQ> daMockQuestions = [\n"

for q in data:
    subject = subject_map.get(q.get('subject', ''), q.get('subject', ''))
    
    original_id = str(q['id'])
    new_id = f"da_mock1_{original_id}"
    
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

with open('lib/data/mock_pyqs.dart', 'w', encoding='utf-8') as f:
    f.write(dart_code)

print('Generated DA mock questions')
