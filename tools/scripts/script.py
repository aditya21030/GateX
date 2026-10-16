import datetime

syllabus = [
    ('Engineering Mathematics', [
        'Discrete Mathematics: Propositional and first order logic',
        'Discrete Mathematics: Sets',
        'Discrete Mathematics: relations',
        'Discrete Mathematics: functions',
        'Discrete Mathematics: partial orders and lattices',
        'Discrete Mathematics: Monoids',
        'Discrete Mathematics: Groups',
        'Discrete Mathematics: Graphs: connectivity',
        'Discrete Mathematics: matching',
        'Discrete Mathematics: coloring',
        'Discrete Mathematics: Combinatorics: counting',
        'Discrete Mathematics: recurrence relations',
        'Discrete Mathematics: generating functions',
        'Linear Algebra: Matrices',
        'Linear Algebra: determinants',
        'Linear Algebra: system of linear equations',
        'Linear Algebra: eigenvalues and eigenvectors',
        'Linear Algebra: LU decomposition',
        'Calculus: Limits',
        'Calculus: continuity and differentiability',
        'Calculus: Maxima and minima',
        'Calculus: Mean value theorem',
        'Calculus: Integration',
        'Probability and Statistics: Random variables',
        'Probability and Statistics: Uniform',
        'Probability and Statistics: normal',
        'Probability and Statistics: exponential',
        'Probability and Statistics: poisson and binomial distributions',
        'Probability and Statistics: Mean',
        'Probability and Statistics: median',
        'Probability and Statistics: mode and standard deviation',
        'Probability and Statistics: Conditional probability and Bayes theorem',
    ]),
    ('Digital Logic', [
        'Boolean algebra',
        'Combinational and sequential circuits',
        'Minimization',
        'Number representations and computer arithmetic (fixed and floating point)',
    ]),
    ('Computer Organization', [
        'Machine instructions and addressing modes',
        'ALU',
        'data-path and control unit',
        'Instruction pipelining',
        'pipeline hazards',
        'Memory hierarchy: cache',
        'main memory and secondary storage',
        'I/O interface (interrupt and DMA mode)',
    ]),
    ('Programming & Data Structures', [
        'Programming in C',
        'Recursion',
        'Arrays',
        'stacks',
        'queues',
        'linked lists',
        'trees',
        'binary search trees',
        'binary heaps',
        'graphs',
    ]),
    ('Algorithms', [
        'Searching',
        'sorting',
        'hashing',
        'Asymptotic worst case time and space complexity',
        'Algorithm design techniques: greedy',
        'dynamic programming and divide-and-conquer',
        'Graph traversals',
        'minimum spanning trees',
        'shortest paths',
    ]),
    ('Theory of Computation', [
        'Regular expressions and finite automata',
        'Context-free grammars and push-down automata',
        'Regular and contex-free languages',
        'pumping lemma',
        'Turing machines and undecidability',
    ]),
    ('Compiler Design', [
        'Lexical analysis',
        'parsing',
        'syntax-directed translation',
        'Runtime environments',
        'Intermediate code generation',
        'Local optimisation',
        'Data flow analyses: constant propagation',
        'liveness analysis',
        'common sub expression elimination',
    ]),
    ('Operating System', [
        'System calls',
        'processes',
        'threads',
        'inter-process communication',
        'concurrency and synchronization',
        'Deadlock',
        'CPU and I/O scheduling',
        'Memory management and virtual memory',
        'File systems',
    ]),
    ('Databases', [
        'ER-model',
        'Relational model: relational algebra',
        'tuple calculus',
        'SQL',
        'Integrity constraints',
        'normal forms',
        'File organization',
        'indexing (e.g. B and B+ trees)',
        'Transactions and concurrency control',
    ]),
    ('Computer Networks', [
        'Concept of layering: OSI and TCP/IP Protocol Stacks',
        'Basics of packet',
        'circuit and virtual circuit-switching',
        'Data link layer: framing',
        'error detection',
        'Medium Access Control',
        'Ethernet bridging',
        'Routing protocols: shortest path',
        'flooding',
        'distance vector and link state routing',
        'Fragmentation and IP addressing',
        'IPv4',
        'CIDR notation',
        'Basics of IP support protocols (ARP, DHCP, ICMP)',
        'Network Address Translation (NAT)',
        'Transport layer: flow control and congestion control',
        'UDP',
        'TCP',
        'sockets',
        'Application layer protocols: DNS',
        'SMTP',
        'HTTP',
        'FTP',
        'Email',
    ])
]

out = '''// Generated CSIT Study Plan data
import "study_plan.dart";

const List<StudyPlanItem> csitStudyPlanItems = [
'''

day = 1
start_date = datetime.date(2026, 5, 1)

for subject, topics in syllabus:
    for topic in topics:
        current_date = start_date + datetime.timedelta(days=day-1)
        out += f'''  StudyPlanItem(
    day: {day},
    date: "{current_date.strftime('%Y-%m-%d')}",
    dayOfWeek: "{current_date.strftime('%A')}",
    phase: "{subject}",
    subject: "{subject}",
    topic: "{topic}",
    type: "core",
    studyHours: 2.5,
    aptitudeMinutes: 20,
    totalHours: 2.8,
    notes: "",
  ),
'''
        day += 1

out += '];\n'

with open('d:/Flutter/Gate DA/lib/data/csit_study_plan.dart', 'w', encoding='utf-8') as f:
    f.write(out)
print('Done!')
