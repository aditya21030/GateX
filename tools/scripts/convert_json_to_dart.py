import json

with open('gateda_subjectwise_all.json', 'r', encoding='utf-8') as f:
    data = json.load(f)

output = "import '../models/models.dart';\n\n"
output += "final Map<String, List<PYQ>> daSubjectWiseMockQuestions = {\n"

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
            # For MSQ, it's a list. The code expects a semicolon-separated string of option characters (A, B, C...) or just the strings.
            # Wait, the app's PYQ model `correctAnswer` usually expects A, B, C, D for MCQ, A;B for MSQ.
            # Let's map the string answers back to A, B, C, D based on `options` array.
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

with open('lib/data/da_subjectwise_mock_data.dart', 'w', encoding='utf-8') as f:
    f.write(output)

print("Conversion completed successfully.")
