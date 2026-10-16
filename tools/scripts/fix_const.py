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
    
    # Replace 'const List<PYQ>' with 'List<PYQ>'
    content = re.sub(r'\bconst List<PYQ>', 'List<PYQ>', content)
    
    with open(file, 'w', encoding='utf-8') as f:
        f.write(content)

print('Fixed const List<PYQ> in pyq darts')
