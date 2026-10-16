import glob

files = glob.glob('lib/data/*.dart')
for file in files:
    with open(file, 'r', encoding='utf-8') as f:
        content = f.read()
    if "''''" in content:
        # replace '''' with \'''' to escape the first quote before the triple quote closure
        content = content.replace("''''", r"\''''")
        with open(file, 'w', encoding='utf-8') as f:
            f.write(content)
        print(f'Fixed {file}')
