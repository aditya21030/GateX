import json
import os

input_file = 'gate_minimock.json'
output_file = 'lib/data/minimock_data.dart'

if not os.path.exists(input_file):
    print(f"Error: {input_file} not found.")
    exit(1)

with open(input_file, 'r', encoding='utf-8') as f:
    data = json.load(f)

output = "import '../models/models.dart';\n\n"

for exam_key in ['gate_da', 'gate_csit']:
    var_name = 'daMiniMockQuestions' if exam_key == 'gate_da' else 'csitMiniMockQuestions'
    exam_data = data[exam_key]
    
    output += f"final List<PYQ> {var_name} = [\n"
    
    for q in exam_data['questions']:
        q_id = q['id']
        q_type = q['type']
        question = q['question'].replace("'", "\\'").replace('\n', '\\n')
        
        options = q.get('options', [])
        options_str = "[" + ", ".join([f"'{opt.replace('\'', '\\\'')}'" for opt in options]) + "]"
        
        answer = q['answer']
        if isinstance(answer, list):
            correct_letters = []
            for a in answer:
                if a in options:
                    correct_letters.append(chr(65 + options.index(a)))
                else:
                    print(f"Warning: Answer {a} not found in options for {q_id}")
            answer_str = ";".join(sorted(correct_letters))
        else:
            if q_type == 'MCQ':
                if answer in options:
                    answer_str = chr(65 + options.index(answer))
                else:
                    print(f"Warning: Answer {answer} not found in options for {q_id}")
                    answer_str = answer
            else:
                answer_str = str(answer).replace("'", "\\'")

        is_mcq = "true" if q_type in ["MCQ", "MSQ"] else "false"
        
        output += f"""  PYQ(
    id: 'minimock_{q_id}',
    subject: 'Mixed Subjects',
    topic: 'Mini Mock',
    questionText: '{question}',
    options: {options_str},
    correctAnswer: '{answer_str}',
    isMCQ: {is_mcq},
    type: '{q_type}',
    explanation: 'Refer to standard solutions.',
    year: 2026,
  ),
"""
    output += "];\n\n"

with open(output_file, 'w', encoding='utf-8') as f:
    f.write(output)

print("Conversion completed successfully.")
