import os
import re

files = [
    'lib/data/csit_set2_pyqs.dart',
    'lib/data/csit_mock_pyqs.dart',
    'lib/data/mock_pyqs.dart'
]

for file in files:
    with open(file, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Remove 'isLatex: true,' or 'isLatex: false,'
    content = re.sub(r'\s*isLatex:\s*(true|false),?', '', content)
    
    with open(file, 'w', encoding='utf-8') as f:
        f.write(content)

print('Fixed isLatex in pyq darts')
