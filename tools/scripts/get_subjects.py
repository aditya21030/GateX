import re

content = open('lib/data/csit_sample_pyqs.dart', 'r', encoding='utf-8').read()
subjects = set(re.findall(r"subject:\s*'([^']+)'", content))
print("Subjects in csit_sample_pyqs:")
for s in sorted(subjects):
    print(f" - {s}")
