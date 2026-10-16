import os
import re

file_path = 'lib/data/csit_set2_pyqs.dart'

with open(file_path, 'r', encoding='utf-8') as f:
    lines = f.readlines()

new_lines = []
current_type = ''

for line in lines:
    new_lines.append(line)
    if "type: " in line:
        # e.g. type: "MCQ",
        if "MCQ" in line or "MSQ" in line:
            new_lines.append("    isMCQ: true,\n")
        else:
            new_lines.append("    isMCQ: false,\n")

with open(file_path, 'w', encoding='utf-8') as f:
    f.writelines(new_lines)

print('Added isMCQ to csit_set2_pyqs.dart')
