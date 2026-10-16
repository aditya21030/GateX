import re
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('lib/data/csit_set2_pyqs.dart', 'r', encoding='utf-8') as f:
    content = f.read()

questions = re.split(r'PYQ\(', content)
target_ids = ['CS2_2026_CS_19', 'CS2_2026_CS_30', 'CS2_2026_CS_35', 'CS2_2026_CS_39', 'CS2_2026_CS_41', 'CS2_2026_CS_48', 'CS2_2026_CS_51', 'CS2_2026_CS_60', 'CS2_2026_CS_61', 'CS2_2026_CS_63']

for q in questions[1:]:
    match = re.search(r'id:\s*[\'\"]([^\'\"]+)[\'\"]', q)
    if not match: continue
    qid = match.group(1)
    
    if qid in target_ids:
        qtext_match = re.search(r'questionText:\s*([\'\"]{3}[\s\S]*?[\'\"]{3}|[\'\"][^\'\"]*?[\'\"])', q)
        if qtext_match:
            print(f'--- {qid} ---')
            print(qtext_match.group(1))
            print('-' * 40)
