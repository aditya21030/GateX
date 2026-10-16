import re
import codecs

with codecs.open('gate_da_mock1.json', 'r', 'utf-8') as f:
    text = f.read()

# The issue is unescaped double quotes inside the string values, specifically for "solution".
# We can find all lines starting with "solution": " and ending with ", (or just ")
# and replace any inner double quotes with single quotes.

lines = text.split('\n')
for i in range(len(lines)):
    line = lines[i]
    if '"solution": "' in line:
        # Extract the content inside the "solution": "..." string
        prefix_idx = line.find('"solution": "') + len('"solution": "')
        # Find the last double quote before the end of the line (or before the comma)
        if line.endswith('",'):
            suffix_idx = len(line) - 2
            suffix = '",'
        else:
            suffix_idx = len(line) - 1
            suffix = '"'
            
        content = line[prefix_idx:suffix_idx]
        # Replace double quotes with single quotes
        content = content.replace('"', "'")
        lines[i] = line[:prefix_idx] + content + suffix

    if '"question": "' in line:
        # Same for question
        prefix_idx = line.find('"question": "') + len('"question": "')
        if line.endswith('",'):
            suffix_idx = len(line) - 2
            suffix = '",'
        else:
            suffix_idx = len(line) - 1
            suffix = '"'
        content = line[prefix_idx:suffix_idx]
        content = content.replace('"', "'")
        lines[i] = line[:prefix_idx] + content + suffix

with codecs.open('gate_da_mock1_fixed.json', 'w', 'utf-8') as f:
    f.write('\n'.join(lines))
print("Fixed json written to gate_da_mock1_fixed.json")
