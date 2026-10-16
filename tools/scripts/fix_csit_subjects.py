import re

with open('lib/data/csit_sample_pyqs.dart', 'r', encoding='utf-8') as f:
    content = f.read()

replacements = {
    "'Calculus'": "'Engineering Mathematics'",
    "'Discrete Mathematics'": "'Engineering Mathematics'",
    "'Linear Algebra'": "'Engineering Mathematics'",
    "'Probability & Statistics'": "'Engineering Mathematics'",
    "'Computer Organization & Architecture'": "'Computer Organization'",
    "'Data Structures'": "'Programming & Data Structures'",
    "'Programming in C'": "'Programming & Data Structures'",
    "'Database Management Systems'": "'Databases'",
}

for old_val, new_val in replacements.items():
    content = content.replace(f"subject: {old_val}", f"subject: {new_val}")

with open('lib/data/csit_sample_pyqs.dart', 'w', encoding='utf-8') as f:
    f.write(content)
