import json
from collections import OrderedDict

with open('d:/Flutter/Gate DA/gate_csit_schedule.json', 'r', encoding='utf-8') as f:
    data = json.load(f)

schedule = data['schedule']
sections = OrderedDict()

for item in schedule:
    sec = item['section']
    if sec not in sections:
        sections[sec] = {'start': item['date'], 'end': item['date'], 'days': 0}
    
    sections[sec]['end'] = item['date']
    sections[sec]['days'] += 1

print('static final List<Map<String, dynamic>> csitPhasesData = [')
num = 1
for sec, info in sections.items():
    start_date = info['start']
    end_date = info['end']
    from datetime import datetime
    s_dt = datetime.strptime(start_date, '%Y-%m-%d')
    e_dt = datetime.strptime(end_date, '%Y-%m-%d')
    
    s_str = s_dt.strftime('%b %#d').replace(' 0', ' ')
    e_str = e_dt.strftime('%b %#d').replace(' 0', ' ')
    dates_str = f"{s_str} - {e_str}"
    
    hours = info['days'] * 2.8
    print(f"    {{")
    print(f"      'num': '{num}',")
    print(f"      'jsonName': '{sec}',")
    print(f"      'displayName': '{sec}',")
    print(f"      'dates': '{dates_str}',")
    print(f"      'days': {info['days']},")
    print(f"      'hours': {int(hours)},")
    print(f"    }},")
    num += 1
print('];')

print('// active phase logic')
num = 1
for sec, info in sections.items():
    print(f"    if (todayStr.compareTo('{info['end']}') <= 0) return {num};")
    num += 1
