import re

# Read csit_mock_pyqs.dart
content = open('lib/data/csit_mock_pyqs.dart', 'r', encoding='utf-8').read()

# Separate CS1_2026 lines and mock_csit lines
lines = content.split('\n')
header = []
cs1_lines = []
mock_lines = []
footer = []

in_list = False
for line in lines:
    if line.startswith('List<PYQ> csitMockQuestions = ['):
        header.append(line)
        in_list = True
    elif in_list and line.strip() == '];':
        footer.append(line)
        in_list = False
    elif in_list:
        if "id: 'CS1_2026_" in line:
            cs1_lines.append(line)
        elif "id: 'mock_csit_" in line:
            mock_lines.append(line)
    else:
        if not in_list and line.strip() != '':
            header.append(line)

# Write back to csit_mock_pyqs.dart (only mock_csit lines)
with open('lib/data/csit_mock_pyqs.dart', 'w', encoding='utf-8') as f:
    f.write('\n'.join(header) + '\n')
    f.write('\n'.join(mock_lines) + '\n')
    f.write('];\n')

# Prepare csit_sample_pyqs.dart content
sample_content = "import '../models/models.dart';\n\nList<PYQ> csitSamplePYQs = [\n"
for line in cs1_lines:
    sample_content += line.replace("id: 'CS1_2026_", "id: 'CSIT_2026_") + '\n'
sample_content += "];\n"

# Write to csit_sample_pyqs.dart
with open('lib/data/csit_sample_pyqs.dart', 'w', encoding='utf-8') as f:
    f.write(sample_content)

print(f"Moved {len(cs1_lines)} PYQs to csit_sample_pyqs.dart")
