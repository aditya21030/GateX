import re

with open('lib/data/csit_set2_pyqs.dart', 'r', encoding='utf-8') as f:
    content = f.read()

image_map = {
    'CS2_2026_GA_2': 'assets/images/CS2_2026_GA_2.png',
    'CS2_2026_GA_7': 'assets/images/CS2_2026_GA_7.png',
    'CS2_2026_GA_8': 'assets/images/CS2_2026_GA_8.png',
    'CS2_2026_GA_9': 'assets/images/CS2_2026_GA_9.png',
    'CS2_2026_CS_15': 'assets/images/CS2_2026_CS_15.png',
    'CS2_2026_CS_30': 'assets/images/q2026_30.png',
    'CS2_2026_CS_39': 'assets/images/q2026_39.png',
    'CS2_2026_CS_41': 'assets/images/q2026_41.png',
    'CS2_2026_CS_45': 'assets/images/CS2_2026_CS_45.png',
    'CS2_2026_CS_47': 'assets/images/CS2_2026_CS_47.png',
    'CS2_2026_CS_51': 'assets/images/q51_dag.png',
    'CS2_2026_CS_59': 'assets/images/CS2_2026_CS_59.png',
}

def replacer(block):
    id_match = re.search(r'id:\s*[\'\"]([^\'\"]+)[\'\"]', block)
    if not id_match: return block
    qid = id_match.group(1)
    
    if qid in image_map:
        if 'hasImage: false' in block:
            block = block.replace('hasImage: false', f"hasImage: true,\n    imagePath: '{image_map[qid]}'")
        elif 'hasImage: true' in block and 'imagePath' not in block:
            block = block.replace('hasImage: true', f"hasImage: true,\n    imagePath: '{image_map[qid]}'")
            
    return block

questions = re.split(r'(PYQ\()', content)
for i in range(2, len(questions), 2):
    questions[i] = replacer(questions[i])
content = "".join(questions)

# 2. Fix C-code and Pseudocode blocks
q19_old = r'"Consider the following three ANSI-C programs, P1, P2, and P3.\nP1:\n#include <stdio.h>\nint a=5;\nint main(){\n  int a=7;\n  return(0);\n}\nP2:\n#include <stdio.h>\nint main(){\n  int a=5;\n  int a=7;\n  return(0);\n}\nP3:\n#include <stdio.h>\nint main(){\n  int a=5;\n  float a=7;\n  return(0);\n}\nWhich one of the following statements is true?"'
q19_new = r"'''Consider the following three ANSI-C programs, P1, P2, and P3.\n\nP1:\n```c\n#include <stdio.h>\nint a=5;\nint main(){\n  int a=7;\n  return(0);\n}\n```\n\nP2:\n```c\n#include <stdio.h>\nint main(){\n  int a=5;\n  int a=7;\n  return(0);\n}\n```\n\nP3:\n```c\n#include <stdio.h>\nint main(){\n  int a=5;\n  float a=7;\n  return(0);\n}\n```\n\nWhich one of the following statements is true?'''"

q39_old = r'"Consider a table T, where the elements T[i][j], 0 ≤ i,j ≤ n, represent the cost of the optimal solutions of different subproblems of a problem that is being solved using a dynamic programming algorithm. The recursive formulation to compute the table entries is as follows:\nT[0][k] = T[k][0] = 1 for k = 0,1,2,…,n\nT[i][j] = 2T[i−1][j] + 3T[i][j−1] for 1 ≤ i,j ≤ n\nConsider the following two algorithms to compute entries of T. Assume that for both the algorithms, for all 0 ≤ i,j ≤ n, T[i][j] has been initialized to 1.\nAlgorithm B1: For i = 1,2,…,n\n  For j = 1,2,…,n\n    T[i][j] = 2T[i−1][j] + 3T[i][j−1]\nAlgorithm B2: For s = 2,3,…,2n\n  For i = 1,2,…,n\n    For j = 1,2,…,n\n      If (i+j == s)\n        T[i][j] = 2T[i−1][j] + 3T[i][j−1]\nWhich one of the following statements is true?"'
q39_new = r"'''Consider a table T, where the elements T[i][j], 0 ≤ i,j ≤ n, represent the cost of the optimal solutions of different subproblems of a problem that is being solved using a dynamic programming algorithm. The recursive formulation to compute the table entries is as follows:\n\n```text\nT[0][k] = T[k][0] = 1 for k = 0,1,2,…,n\nT[i][j] = 2T[i−1][j] + 3T[i][j−1] for 1 ≤ i,j ≤ n\n```\n\nConsider the following two algorithms to compute entries of T. Assume that for both the algorithms, for all 0 ≤ i,j ≤ n, T[i][j] has been initialized to 1.\n\n```text\nAlgorithm B1: For i = 1,2,…,n\n  For j = 1,2,…,n\n    T[i][j] = 2T[i−1][j] + 3T[i][j−1]\n\nAlgorithm B2: For s = 2,3,…,2n\n  For i = 1,2,…,n\n    For j = 1,2,…,n\n      If (i+j == s)\n        T[i][j] = 2T[i−1][j] + 3T[i][j−1]\n```\n\nWhich one of the following statements is true?'''"

q41_old = r'"Consider the canonical LR(0) parsing of the grammar below using terminals {a, b, c} and non-terminals {A, B, C, S} with S as the start symbol.\nS → ACB\nA → aA | ε\nC → cC | ε\nB → bB | b\nWhich one of the following options gives the number of shift-reduce conflicts that will occur in the LR(0) ACTION table?"'
q41_new = r"'''Consider the canonical LR(0) parsing of the grammar below using terminals {a, b, c} and non-terminals {A, B, C, S} with S as the start symbol.\n```text\nS → ACB\nA → aA | ε\nC → cC | ε\nB → bB | b\n```\nWhich one of the following options gives the number of shift-reduce conflicts that will occur in the LR(0) ACTION table?'''"

q51_old = r'"Consider three processes P1, P2, and P3 running identical code, as shown in the pseudocode below. A and B are two binary semaphores initialized to 1 and 0, respectively. X is a shared variable initialized to 0. Each line in the pseudocode is executed atomically.\nPseudocode:\n  Wait(A);\n  Print(*);\n  X = X+1;\n  If (X == 2) { Print($); Signal(B); }\n  Signal(A);\n  Wait(B);\n  Print(#);\n  Signal(B);\nAssume that any of the three processes can start to execute first and context switching can happen between these processes at any arbitrary time and in any arbitrary order.\nWhich of the following patterns is/are possible to be generated as an outcome of the execution of these three processes?"'
q51_new = r"'''Consider three processes P1, P2, and P3 running identical code, as shown in the pseudocode below. A and B are two binary semaphores initialized to 1 and 0, respectively. X is a shared variable initialized to 0. Each line in the pseudocode is executed atomically.\n\nPseudocode:\n```text\n  Wait(A);\n  Print(*);\n  X = X+1;\n  If (X == 2) { Print(\\$); Signal(B); }\n  Signal(A);\n  Wait(B);\n  Print(#);\n  Signal(B);\n```\n\nAssume that any of the three processes can start to execute first and context switching can happen between these processes at any arbitrary time and in any arbitrary order.\nWhich of the following patterns is/are possible to be generated as an outcome of the execution of these three processes?'''"

q60_old = r'"Consider the following ANSI-C program.\n#include <stdio.h>\nint main(){\n  int *ptr, a, b, c;\n  a=5; b=11; c=20;\n  ptr=&a; *ptr=c; ptr=&c;\n  a=*(&b); c=*ptr-a;\n  printf(\"%d, %d, %d\", a, b, c);\n  return(0);\n}\nThe output of the program is __________."'
q60_new = r"'''Consider the following ANSI-C program.\n\n```c\n#include <stdio.h>\nint main(){\n  int *ptr, a, b, c;\n  a=5; b=11; c=20;\n  ptr=&a; *ptr=c; ptr=&c;\n  a=*(&b); c=*ptr-a;\n  printf(\"%d, %d, %d\", a, b, c);\n  return(0);\n}\n```\n\nThe output of the program is __________.'''"

q61_old = r'"Consider the following ANSI-C function.\nint func(int start, int end){\n  int length=end+1-start;\n  if((length<1)||(start<0)||(end<0)){ return(0); }\n  if(length%3==0){ return(func(start+1, end)); }\n  else if(length%3==1){ return(1+func(start, end-1)); }\n  else { return(func(start+2, end)); }\n}\nThe maximum possible value that can be returned from this function is ____________. (answer in integer)\nNote: Ignore syntax errors (if any) in the function."'
q61_new = r"'''Consider the following ANSI-C function.\n\n```c\nint func(int start, int end){\n  int length=end+1-start;\n  if((length<1)||(start<0)||(end<0)){ return(0); }\n  if(length%3==0){ return(func(start+1, end)); }\n  else if(length%3==1){ return(1+func(start, end-1)); }\n  else { return(func(start+2, end)); }\n}\n```\n\nThe maximum possible value that can be returned from this function is ____________. (answer in integer)\nNote: Ignore syntax errors (if any) in the function.'''"

q35_old = r'"A lexical analyzer uses the following token definitions:\n• letter → [A−Za−z]\n• digit → [0−9]\n• id → letter (letter | digit)*\n• number → digit+\n• ws → (blank | tab | newline)+\nFor the string given below,\nx1  23mm  78  y  7z  zz5  14A  8H  AaYcD\nthe number of tokens (excluding ws) that will be produced by the lexical analyzer is __________. (answer in integer)"'
q35_new = r"'''A lexical analyzer uses the following token definitions:\n• letter → [A−Za−z]\n• digit → [0−9]\n• id → letter (letter | digit)*\n• number → digit+\n• ws → (blank | tab | newline)+\n\nFor the string given below,\n`x1  23mm  78  y  7z  zz5  14A  8H  AaYcD`\nthe number of tokens (excluding ws) that will be produced by the lexical analyzer is __________. (answer in integer)'''"

q48_old = r'"Let Σ = {a, b, c, d} and let L = {a^i b^j c^k d^ℓ | i, j, k, ℓ ≥ 0}.\nWhich of the following constraints ensure(s) that the language L is context-free?"'
q48_new = r"'''Let \(\Sigma = \{a, b, c, d\}\) and let \(L = \{a^i b^j c^k d^\ell \mid i, j, k, \ell \ge 0\}\).\nWhich of the following constraints ensure(s) that the language L is context-free?'''"

content = content.replace(q19_old, q19_new)
content = content.replace(q39_old, q39_new)
content = content.replace(q41_old, q41_new)
content = content.replace(q51_old, q51_new)
content = content.replace(q60_old, q60_new)
content = content.replace(q61_old, q61_new)
content = content.replace(q35_old, q35_new)
content = content.replace(q48_old, q48_new)

# Auto replace math tags for CS_48 options if necessary
content = content.replace('"i = j and k = ℓ"', '"""\\(i = j\\) and \\(k = \\ell\\)"""')
content = content.replace('"i = k and j = ℓ"', '"""\\(i = k\\) and \\(j = \\ell\\)"""')
content = content.replace('"i = ℓ and j = k"', '"""\\(i = \\ell\\) and \\(j = k\\)"""')
content = content.replace('"i = j = k = ℓ"', '"""\\(i = j = k = \\ell\\)"""')

with open('lib/data/csit_set2_pyqs.dart', 'w', encoding='utf-8') as f:
    f.write(content)
