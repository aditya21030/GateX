import json
import os

input_file = 'gate_csit_subjecwise_full.json'
output_file = 'lib/data/csit_subjectwise_mock_data.dart'

if not os.path.exists(input_file):
    print(f"Error: {input_file} not found.")
    exit(1)

with open(input_file, 'r', encoding='utf-8') as f:
    data = json.load(f)

output = "import '../models/models.dart';\n\n"
output += "final Map<String, List<PYQ>> csitSubjectWiseMockQuestions = {\n"

for subject in data['subjects']:
    subject_name = subject['name']
    output += f"  '{subject_name}': [\n"
    
    for q in subject['questions']:
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
        
        output += f"""    PYQ(
      id: 'submock_{q_id}',
      subject: '{subject_name}',
      topic: 'Subject-wise Test',
      questionText: '{question}',
      options: {options_str},
      correctAnswer: '{answer_str}',
      isMCQ: {is_mcq},
      type: '{q_type}',
      explanation: 'Refer to standard solutions.',
      year: 2026,
    ),
"""
    output += "  ],\n"

output += "};\n"

with open(output_file, 'w', encoding='utf-8') as f:
    f.write(output)

print("Conversion completed successfully.")
