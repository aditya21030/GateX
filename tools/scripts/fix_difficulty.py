import os

file_path = 'lib/data/csit_set2_pyqs.dart'

with open(file_path, 'r', encoding='utf-8') as f:
    lines = f.readlines()

new_lines = []

for line in lines:
    new_lines.append(line)
    if "isMCQ:" in line:
        new_lines.append("    difficulty: 'Medium',\n")

with open(file_path, 'w', encoding='utf-8') as f:
    f.writelines(new_lines)

print('Added difficulty to csit_set2_pyqs.dart')
