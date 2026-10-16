import json
import re

def generate_dart_file():
    with open('Gate_da_fullmock.json', 'r', encoding='utf-8') as f:
        content = f.read()

    # Fix invalid numbers in the original JSON
    content = content.replace('"mcq_1mark": -1/3', '"mcq_1mark": "-1/3"')
    content = content.replace('"mcq_2mark": -2/3', '"mcq_2mark": "-2/3"')
    content = content.replace('"msq": 0,', '"msq": "0",')
    content = content.replace('"nat": 0', '"nat": "0"')

    data = json.loads(content)
    questions = []

    for section in data.get('sections', []):
        subject = section.get('name', 'Full Mock Test')
        
        # Collect all questions from the section
        section_questions = []
        if 'questions' in section:
            section_questions.extend(section['questions'])
        if 'questions_1mark' in section:
            section_questions.extend(section['questions_1mark'])
        if 'questions_2mark' in section:
            section_questions.extend(section['questions_2mark'])
            
        for idx, q in enumerate(section_questions):
            q_type = q.get('type', 'MCQ')
            q_num = str(q.get('number', idx + 1)).zfill(2)
            q_id = f"DA_FULL_2026_{q_num}"
            is_mcq = "true" if q_type in ["MCQ", "MSQ"] else "false"

            correct_ans = q.get('correct_answer', '')
            if isinstance(correct_ans, list):
                correct_ans = ','.join(correct_ans)

            options = q.get('options', [])
            options_str = "[" + ", ".join([f"'''{opt}'''" for opt in options]) + "]"

            questions.append(f"""
  PYQ(
    id: '{q_id}',
    year: 2026,
    subject: '''{subject}''',
    topic: 'Full Length Mock',
    questionText: '''{q.get('question', '')}''',
    options: {options_str},
    correctAnswer: '''{correct_ans}''',
    isMCQ: {is_mcq},
    type: '{q_type}',
    explanation: '''{q.get('explanation', '')}''',
    difficulty: 'Medium',
    hasImage: false,
  ),
""")

    out_content = f"""// AUTO-GENERATED FILE
import '../models/models.dart';

final List<PYQ> daFullMockQuestions = [
{''.join(questions)}
];
"""
    with open('lib/data/da_full_mock_pyqs.dart', 'w', encoding='utf-8') as f:
        f.write(out_content)

if __name__ == "__main__":
    generate_dart_file()
