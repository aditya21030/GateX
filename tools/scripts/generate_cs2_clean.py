import json

subject_map = {
    'Algorithms': 'Algorithms',
    'Calculus': 'Engineering Mathematics',
    'Compiler Design': 'Compiler Design',
    'Computer Networks': 'Computer Networks',
    'Computer Organization and Architecture': 'Computer Organization',
    'Data Structures': 'Programming & Data Structures',
    'Databases': 'Databases',
    'Digital Logic': 'Digital Logic',
    'Discrete Mathematics': 'Engineering Mathematics',
    'Linear Algebra': 'Engineering Mathematics',
    'Operating Systems': 'Operating System',
    'Probability and Statistics': 'Engineering Mathematics',
    'Programming and Data Structures': 'Programming & Data Structures',
    'Theory of Computation': 'Theory of Computation',
    'Numerical Ability': 'General Aptitude',
    'Spatial Aptitude': 'General Aptitude',
    'Verbal Ability': 'General Aptitude',
}

def escape_str(s):
    if s is None:
        return 'null'
    s = s.replace('\\', '\\\\').replace('$', '\\$').replace('"', '\\"').replace('\n', '\\n')
    return f'"{s}"'

with open('GATE_CS2_2026_PYQ.json', 'r', encoding='utf-8') as f:
    data = json.load(f)

dart_code = "import '../models/models.dart';\n\nList<PYQ> csitSet2PYQs = [\n"

for q in data:
    subject = subject_map.get(q.get('subject', ''), q.get('subject', ''))
    
    dart_code += "  PYQ(\n"
    dart_code += f"    id: {escape_str(q['id'])},\n"
    dart_code += f"    year: {q.get('year', 2026)},\n"
    dart_code += f"    setNumber: 2,\n"
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
        dart_code += f"    imagePath: 'assets/images/{q['id']}.png',\n"
    
    dart_code += "  ),\n"

dart_code += "];\n"

with open('lib/data/csit_set2_pyqs.dart', 'w', encoding='utf-8') as f:
    f.write(dart_code)

print("Generated lib/data/csit_set2_pyqs.dart successfully!")
