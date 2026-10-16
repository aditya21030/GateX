import re
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('lib/data/csit_set2_pyqs.dart', 'r', encoding='utf-8') as f:
    content = f.read()

questions = re.split(r'PYQ\(', content)
for q in questions[1:]:
    match = re.search(r'id:\s*[\'\"]([^\'\"]+)[\'\"]', q)
    if not match: continue
    qid = match.group(1)
    
    qtext_match = re.search(r'questionText:\s*[\'\"]{3}([\s\S]*?)[\'\"]{3}', q)
    if not qtext_match:
        qtext_match = re.search(r'questionText:\s*[\'\"](.*?)[\'\"]', q)
        if not qtext_match: continue
    
    qtext = qtext_match.group(1)
    
    needs_formatting = False
    reasons = []
    
    if 'void main' in qtext or 'int main' in qtext or '#include' in qtext or 'char ' in qtext or 'while (' in qtext:
        reasons.append('CODE')
        needs_formatting = True
    if 'Table' in qtext or 'table' in qtext or '  ' in qtext or '|' in qtext:
        reasons.append('TABLE/SPACING')
        needs_formatting = True
        
    if needs_formatting:
        print(f'{qid}: {", ".join(reasons)}')
