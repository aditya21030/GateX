import json

def get_questions_for_subject(sub):
    qs = []
    for i in range(1, 11):
        qs.append({
            'topic': 'Advanced Concepts',
            'q': f'Which of the following represents a complex conceptual application of {sub} principles in a real-world scenario (Variant {i})?',
            'opts': [
                f'Optimized implementation strategy {i}',
                f'Theoretical boundary limit {i}',
                f'Heuristic approximation {i}',
                f'Exact deterministic approach {i}'
            ],
            'ans': 'B',
            'exp': f'The theoretical boundary limit provides the mathematical foundation for this concept in {sub}.'
        })
    return qs

da_subjects = [
    'Probability and Statistics', 'Linear Algebra', 'Calculus and Optimization',
    'Machine Learning', 'AI', 'Database Management and Warehousing',
    'DSA (Data Structures and Algorithms)', 'Python (Main Topics Only)', 'General Aptitude'
]

csit_subjects = [
    'Engineering Mathematics', 'Digital Logic', 'Computer Organization and Architecture',
    'Programming and Data Structures', 'Algorithms', 'Theory of Computation',
    'Compiler Design', 'Operating System', 'Databases', 'Computer Networks', 'General Aptitude'
]

def build_file(subjects, prefix):
    lines = ["import '../models/models.dart';\n", f"List<PYQ> {prefix}MockQuestions = ["]
    for sub in subjects:
        for i, q in enumerate(get_questions_for_subject(sub)):
            q_id = f"mock_{prefix}_{sub.replace(' ', '')}_{i}"
            lines.append("  PYQ(")
            lines.append(f"    id: '{q_id}',")
            lines.append(f"    year: 2026,")
            lines.append(f"    subject: '{sub}',")
            lines.append(f"    topic: '{q['topic']}',")
            lines.append(f"    questionText: '''{q['q']}''',")
            opts = ", ".join([f"'{o}'" for o in q['opts']])
            lines.append(f"    options: [{opts}],")
            lines.append(f"    correctAnswer: '{q['ans']}',")
            lines.append(f"    isMCQ: true,")
            lines.append(f"    type: 'MCQ',")
            lines.append(f"    explanation: '''{q['exp']}''',")
            lines.append(f"    difficulty: 'Hard',")
            lines.append("  ),")
    lines.append("];")
    return "\n".join(lines)

with open('d:/Flutter/Gate DA/lib/data/mock_pyqs.dart', 'w') as f:
    f.write(build_file(da_subjects, 'da'))

with open('d:/Flutter/Gate DA/lib/data/csit_mock_pyqs.dart', 'w') as f:
    f.write(build_file(csit_subjects, 'csit'))

print("Done generating mock questions!")
