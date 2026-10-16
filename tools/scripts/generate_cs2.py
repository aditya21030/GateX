import json
import re

subject_map = {
    'Numerical Ability': 'General Aptitude',
    'Spatial Aptitude': 'General Aptitude',
    'Verbal Ability': 'General Aptitude',
    'Algorithms': 'Algorithms',
    'Calculus': 'Engineering Mathematics',
    'Discrete Mathematics': 'Engineering Mathematics',
    'Linear Algebra': 'Engineering Mathematics',
    'Probability and Statistics': 'Engineering Mathematics',
    'Compiler Design': 'Compiler Design',
    'Computer Networks': 'Computer Networks',
    'Computer Organization and Architecture': 'Computer Organization',
    'Data Structures': 'Programming & Data Structures',
    'Databases': 'Databases',
    'Digital Logic': 'Digital Logic',
    'Operating Systems': 'Operating System',
    'Programming and Data Structures': 'Programming & Data Structures',
    'Theory of Computation': 'Theory of Computation',
}

def escape_str(s):
    if s is None:
        return 'null'
    s = s.replace('\\', '\\\\').replace('$', '\\$').replace('"', '\\"').replace('\n', '\\n')
    return f'"{s}"'

with open('GATE_CS2_2026_PYQ.json', 'r', encoding='utf-8') as f:
    data = json.load(f)

dart_code = "import '../models/models.dart';\n\nconst List<PYQ> csitSet2PYQs = [\n"

for q in data:
    subject = subject_map.get(q['subject'], q['subject'])
    
    dart_code += "  PYQ(\n"
    dart_code += f"    id: {escape_str(q['id'])},\n"
    dart_code += f"    year: {q['year']},\n"
    dart_code += f"    subject: {escape_str(subject)},\n"
    dart_code += f"    topic: {escape_str(q['topic'])},\n"
    dart_code += f"    type: {escape_str(q['type'])},\n"
    dart_code += f"    question: {escape_str(q['question'])},\n"
    
    options_str = "[" + ", ".join([escape_str(opt) for opt in q.get('options', [])]) + "]"
    dart_code += f"    options: {options_str},\n"
    dart_code += f"    correctAnswer: {escape_str(q['correct_answer'])},\n"
    dart_code += f"    solution: {escape_str(q['solution'])},\n"
    
    has_img = q.get('has_image', False)
    dart_code += f"    hasImage: {'true' if has_img else 'false'},\n"
    if has_img:
        dart_code += f"    imagePath: 'assets/images/{q['id']}.png',\n"
    
    img_desc = q.get('image_description')
    if img_desc:
        dart_code += f"    imageDescription: {escape_str(img_desc)},\n"
        
    dart_code += f"    isLatex: {'true' if q.get('latex', False) else 'false'},\n"
    dart_code += f"    setNumber: 2,\n"
    dart_code += "  ),\n"

dart_code += "];\n"

with open('lib/data/csit_set2_pyqs.dart', 'w', encoding='utf-8') as f:
    f.write(dart_code)

print("Generated lib/data/csit_set2_pyqs.dart successfully!")
