import re

filepath = 'd:/Flutter/Gate DA/lib/screens/formula_sheet_screen.dart'
with open(filepath, 'r', encoding='utf-8') as f:
    content = f.read()

# We need to extract the methods from the bottom and put them inside the FormulaSheetScreen class.
# The methods start with `  Widget _buildCSITDSATab(BuildContext context) {`
# And end right before `class _FormulaDisplayBox extends StatefulWidget {`
start_idx = content.find("  Widget _buildCSITDSATab(BuildContext context) {")
if start_idx != -1:
    end_idx = content.find("class _FormulaDisplayBox extends StatefulWidget {", start_idx)
    if end_idx != -1:
        methods = content[start_idx:end_idx]
        
        # Remove them from the current location
        content = content[:start_idx] + content[end_idx:]
        
        # Insert them before the `}` of FormulaSheetScreen
        # FormulaSheetScreen ends with:
        # 1352:   }
        # 1353: }
        # Let's find the closing brace before the start of what we just removed.
        # Actually, before `class _FormulaDisplayBox extends StatefulWidget {` there is a `}`.
        # Let's find the `}` that precedes `class _FormulaDisplayBox`.
        
        box_idx = content.find("class _FormulaDisplayBox extends StatefulWidget {")
        last_brace_idx = content.rfind("}", 0, box_idx)
        
        if last_brace_idx != -1:
            content = content[:last_brace_idx] + methods + "\n}\n\n" + content[last_brace_idx+1:]
        else:
            print("Error finding brace")
    else:
        print("Error finding end")
else:
    print("Error finding start")

with open(filepath, 'w', encoding='utf-8') as f:
    f.write(content)

print("Moved methods inside FormulaSheetScreen class.")
