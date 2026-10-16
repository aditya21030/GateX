import glob

files = glob.glob('lib/data/*.dart')
for file in files:
    with open(file, 'r', encoding='utf-8') as f:
        content = f.read()
    if r"\''''" in content:
        # Undo previous bad replacement
        content = content.replace(r"\''''", "''''")
        
        # Now fix the issue properly:
        # If '''' appears at the START of a string like options: ['''' or explanation: ''''
        content = content.replace("[''''", "[''' '")
        content = content.replace(" ''''", " ''' '")
        content = content.replace("(''''", "(''' '")
        
        # If '''' appears at the END of a string like '''], or ''',
        content = content.replace("'''']", "' ''']")
        content = content.replace("'''',", "' ''',")
        
        with open(file, 'w', encoding='utf-8') as f:
            f.write(content)
        print(f'Fixed {file}')
