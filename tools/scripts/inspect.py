import json
import re

content = open('Gate_da_fullmock.json', 'r', encoding='utf-8').read()
content = re.sub(r':\s*-1/3', ': "-1/3"', content)
content = re.sub(r':\s*-2/3', ': "-2/3"', content)
content = re.sub(r':\s*0\s*,', ': "0",', content)

open('Gate_da_fullmock_fixed.json', 'w', encoding='utf-8').write(content)

data = json.loads(content)
print(f'Total questions: {data.get("total_questions")}')
for section in data.get('sections', []):
    print(f"Section: {section['name']}, Qs: {len(section['questions'])}")
    if section['questions']:
        print(f"First Q keys: {list(section['questions'][0].keys())}")
