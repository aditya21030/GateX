import re
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('lib/data/csit_set2_pyqs.dart', 'r', encoding='utf-8') as f:
    content = f.read()

questions = re.split(r'PYQ\(', content)
for q in questions[1:]:
    if re.search(r'(?i)(figure|shown|diagram|table|panel)', q):
        match = re.search(r'id:\s*[\'"]([^\'"]+)[\'"]', q)
        if match:
            print(match.group(1))
