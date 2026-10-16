import json

with open('Gate_da_fullmock.json', 'r', encoding='utf-8') as f:
    content = f.read()

content = content.replace('"mcq_1mark": -1/3', '"mcq_1mark": "-1/3"')
content = content.replace('"mcq_2mark": -2/3', '"mcq_2mark": "-2/3"')
content = content.replace('"msq": 0,', '"msq": "0",')
content = content.replace('"nat": 0', '"nat": "0"')

data = json.loads(content)
print('Keys in data:', list(data.keys()))
print('Number of sections:', len(data.get('sections', [])))
for s in data.get('sections', []):
    print(f"{s.get('name')} -> {len(s.get('questions', []))} questions")
