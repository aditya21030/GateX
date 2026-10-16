import re

filepath = 'd:/Flutter/Gate DA/lib/screens/formula_sheet_screen.dart'
with open(filepath, 'r', encoding='utf-8') as f:
    content = f.read()

# Replace formula: '...' with formula: '''...''' where there are newlines.
# But simply replacing formula: ' with formula: ''' and matching up to ', explanation: is easier.

# Find all occurrences of `formula: 'something', explanation:`
# where 'something' might contain newlines.
# We will use a regex that matches `formula: '` then anything non-greedy up to `', explanation:`
# and change the outer quotes to triple quotes.

def replacer(match):
    inner = match.group(1)
    # We must ensure we don't accidentally match too much if there are multiple on one line,
    # but the structure is very regular.
    return f"formula: '''{inner}''', explanation:"

# match formula: '(anything)', explanation:
fixed_content = re.sub(r"formula:\s*'(.*?)',\s*explanation:", replacer, content, flags=re.DOTALL)

with open(filepath, 'w', encoding='utf-8') as f:
    f.write(fixed_content)

print("Fixed syntax errors by replacing single quotes with triple quotes for formulas.")
