with open('lib/data/csit_sample_pyqs.dart', 'r', encoding='utf-8') as f:
    content = f.read()

content = content.replace("'assets/images/pyqs/", "'assets/images/")

with open('lib/data/csit_sample_pyqs.dart', 'w', encoding='utf-8') as f:
    f.write(content)
