import json
import datetime

with open('D:/Flutter/Gate DA/gate_csit_schedule.json', 'r', encoding='utf-8') as f:
    data = json.load(f)

schedule = data['schedule']

out = '''// Generated CSIT Study Plan data
import "study_plan.dart";

const List<StudyPlanItem> csitStudyPlanItems = [
'''

for item in schedule:
    # Example format: 
    # {
    #   "day": 1,
    #   "date": "2026-05-01",
    #   "phase": "phase_1_syllabus",
    #   "section": "Engineering Mathematics",
    #   "topic": "Discrete Math \u2013 Propositional & First Order Logic",
    #   "type": "study"
    # }
    day = item['day']
    date_str = item['date']
    
    # Calculate Day of Week
    date_obj = datetime.datetime.strptime(date_str, "%Y-%m-%d")
    day_of_week = date_obj.strftime("%A")
    
    phase = item['phase']
    subject = item['section']
    topic = item.get('topic', 'General Study')
    item_type = item.get('type', 'study')
    if item_type == 'study':
        item_type = 'core'
    elif item_type == 'revision_test':
        item_type = 'revision'
    elif item_type == 'mock_test':
        item_type = 'exam'
    elif item_type == 'revision':
        item_type = 'revision'
        
    study_hours = 2.5
    aptitude_minutes = 20
    total_hours = 2.8

    # Escape quotes
    topic_escaped = topic.replace('"', '\\"').replace('\u2013', '-')
    
    out += f'''  StudyPlanItem(
    day: {day},
    date: "{date_str}",
    dayOfWeek: "{day_of_week}",
    phase: "{phase}",
    subject: "{subject}",
    topic: "{topic_escaped}",
    type: "{item_type}",
    studyHours: {study_hours},
    aptitudeMinutes: {aptitude_minutes},
    totalHours: {total_hours},
    notes: "",
  ),
'''

out += '];\n'

with open('d:/Flutter/Gate DA/lib/data/csit_study_plan.dart', 'w', encoding='utf-8') as f:
    f.write(out)
print('Done!')
