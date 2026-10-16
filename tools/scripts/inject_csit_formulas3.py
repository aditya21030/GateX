import re

filepath = 'd:/Flutter/Gate DA/lib/screens/formula_sheet_screen.dart'
with open(filepath, 'r', encoding='utf-8') as f:
    content = f.read()

# Replace _buildCompilerTab
cd_regex = re.compile(r'Widget _buildCompilerTab\(BuildContext context\) \{.*?\n  \}', re.DOTALL)
new_cd = """Widget _buildCompilerTab(BuildContext context) {
    return _buildSubjectTab(context, [
      _buildFormulaCard(
        context,
        title: 'Lexical & Syntax Analysis',
        items: [
          _FormulaItem(name: 'Lexical Analysis', formula: 'Uses Finite Automata (DFA) to recognize tokens.', explanation: 'Outputs stream of tokens. Strips whitespace/comments.'),
          _FormulaItem(name: 'Syntax Analysis (Parsing)', formula: 'Uses Push Down Automata (PDA) to check grammar rules.', explanation: 'Outputs Parse Tree or Syntax Tree.'),
          _FormulaItem(name: 'Left Recursion Elimination', formula: 'A -> Aα | β  ====>  A -> βA\\', A\\' -> αA\\' | ε', explanation: 'Top-down parsers cannot handle left recursion.'),
          _FormulaItem(name: 'Left Factoring', formula: 'A -> αβ1 | αβ2 ====> A -> αA\\', A\\' -> β1 | β2', explanation: 'Removes non-determinism for predictive parsers.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Parsing Techniques',
        items: [
          _FormulaItem(name: 'FIRST(α)', formula: 'Set of terminals that begin strings derived from α.', explanation: 'If α =>* ε, then ε is in FIRST(α).'),
          _FormulaItem(name: 'FOLLOW(A)', formula: 'Set of terminals that can appear immediately to the right of A.', explanation: 'Never contains ε. $ is in FOLLOW(Start symbol).'),
          _FormulaItem(name: 'LL(1) Parser', formula: 'Top-down. Requires grammar to be unambiguous, no left recursion, left factored.', explanation: 'Table constructed using FIRST and FOLLOW.'),
          _FormulaItem(name: 'LR Parsers Power', formula: 'LR(0) < SLR(1) < LALR(1) < CLR(1)', explanation: 'CLR(1) is most powerful. LALR(1) is widely used (YACC).'),
          _FormulaItem(name: 'LR Parser Conflicts', formula: 'Shift-Reduce (SR) or Reduce-Reduce (RR) conflicts.', explanation: 'If table has multiple entries in a cell, it is not LR.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Translation & Optimization',
        items: [
          _FormulaItem(name: 'Syntax Directed Translation', formula: 'S-Attributed: Only synthesized attributes (Bottom-up).\\nL-Attributed: Synthesized + Inherited (Top-down & Bottom-up).', explanation: 'Attaching rules to grammar productions.'),
          _FormulaItem(name: 'Intermediate Code', formula: 'Three Address Code (3AC), Syntax Trees, DAG.', explanation: 'Machine independent representation.'),
          _FormulaItem(name: 'Local Optimization', formula: 'Constant folding, Constant propagation, Common subexpression elimination, Dead code elimination.', explanation: 'Usually performed on Basic Blocks.'),
          _FormulaItem(name: 'Data Flow Analysis', formula: 'Liveness analysis, Reaching definitions.', explanation: 'Used for global optimization across basic blocks.'),
        ]
      )
    ]);
  }"""
content = cd_regex.sub(new_cd, content)

# Replace _buildOSTab
os_regex = re.compile(r'Widget _buildOSTab\(BuildContext context\) \{.*?\n  \}', re.DOTALL)
new_os = """Widget _buildOSTab(BuildContext context) {
    return _buildSubjectTab(context, [
      _buildFormulaCard(
        context,
        title: 'CPU Scheduling',
        items: [
          _FormulaItem(name: 'Turn Around Time (TAT)', formula: 'TAT = Completion Time - Arrival Time', explanation: 'Total time spent in the system.'),
          _FormulaItem(name: 'Waiting Time (WT)', formula: 'WT = TAT - Burst Time', explanation: 'Time spent waiting in ready queue.'),
          _FormulaItem(name: 'First Come First Serve (FCFS)', formula: 'Non-preemptive. High average waiting time.', explanation: 'Convoy effect occurs.'),
          _FormulaItem(name: 'Shortest Job First (SJF)', formula: 'Greedy approach. Preemptive version is SRTF.', explanation: 'Optimal for average waiting time.'),
          _FormulaItem(name: 'Round Robin (RR)', formula: 'Time quantum q. Response time is good.', explanation: 'If q is very large, RR becomes FCFS.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Synchronization & Deadlocks',
        items: [
          _FormulaItem(name: 'Semaphore Operations', formula: 'Wait(S): while(S<=0); S--;\\nSignal(S): S++;', explanation: 'Hardware atomic operations.'),
          _FormulaItem(name: 'Deadlock Necessary Conditions', formula: '1. Mutual Exclusion\\n2. Hold and Wait\\n3. No Preemption\\n4. Circular Wait', explanation: 'Coffman conditions. All 4 must hold for deadlock.'),
          _FormulaItem(name: 'Banker\\'s Algorithm (Avoidance)', formula: 'Need[i,j] = Max[i,j] - Allocation[i,j]\\nIf Need <= Available, state is safe.', explanation: 'Checks for safe state before granting resource.'),
          _FormulaItem(name: 'Deadlock Prevention', formula: 'Eliminate at least one of the 4 necessary conditions.', explanation: 'E.g., order resources to prevent circular wait.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Memory Management',
        items: [
          _FormulaItem(name: 'Paging', formula: 'Logical Address = Page Number (p) + Offset (d)\\nPhysical Address = Frame Number (f) + Offset (d)', explanation: 'Eliminates external fragmentation. Causes internal frag.'),
          _FormulaItem(name: 'Page Table Size', formula: 'Size = Number of Pages × Page Table Entry Size\\nNum Pages = Logical Memory Size / Page Size', explanation: 'Stored in main memory (PTBR points to it).'),
          _FormulaItem(name: 'Translation Lookaside Buffer (TLB)', formula: 'Effective Access Time (EAT) = HitRatio × (TLB Time + Mem Time) + MissRatio × (TLB Time + 2 × Mem Time)', explanation: 'Cache for page table entries.'),
          _FormulaItem(name: 'Page Fault Rate (p)', formula: 'EAT = (1 - p) × Memory_Access + p × Page_Fault_Service_Time', explanation: 'Demand paging performance.'),
          _FormulaItem(name: 'Page Replacement Algorithms', formula: 'FIFO (Belady\\'s Anomaly possible).\\nLRU (Good approximation of optimal).\\nOptimal (Replaces page used furthest in future).', explanation: 'Minimizing page faults.'),
        ]
      )
    ]);
  }"""
content = os_regex.sub(new_os, content)

# Replace _buildCNTab
cn_regex = re.compile(r'Widget _buildCNTab\(BuildContext context\) \{.*?\n  \}', re.DOTALL)
new_cn = """Widget _buildCNTab(BuildContext context) {
    return _buildSubjectTab(context, [
      _buildFormulaCard(
        context,
        title: 'Data Link Layer & MAC',
        items: [
          _FormulaItem(name: 'Transmission Time (Tt)', formula: 'Tt = L / B', explanation: 'L = Packet length (bits), B = Bandwidth (bps). Time to put data on wire.'),
          _FormulaItem(name: 'Propagation Delay (Tp)', formula: 'Tp = d / v', explanation: 'd = Distance, v = Speed of signal. Time to travel wire.'),
          _FormulaItem(name: 'Stop and Wait ARQ Efficiency', formula: 'Efficiency (η) = Tt / (Tt + 2*Tp) = 1 / (1 + 2a)\\nwhere a = Tp / Tt', explanation: 'Very low efficiency for high Tp.'),
          _FormulaItem(name: 'Go-Back-N ARQ', formula: 'Sender Window = N\\nReceiver Window = 1\\nEfficiency = N / (1 + 2a)', explanation: 'Pipelined protocol. Max N = 2^m - 1 (m bits).'),
          _FormulaItem(name: 'Selective Repeat ARQ', formula: 'Sender Window = N\\nReceiver Window = N\\nMax N = 2^(m-1)', explanation: 'Only resends lost frames.'),
          _FormulaItem(name: 'CSMA/CD', formula: 'Min Frame Size (L_min) = 2 * Tp * B', explanation: 'Collision detection condition. Used in Ethernet.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Network Layer (IPv4)',
        items: [
          _FormulaItem(name: 'IPv4 Classes', formula: 'Class A: 0... (0-127), Mask /8\\nClass B: 10... (128-191), Mask /16\\nClass C: 110... (192-223), Mask /24\\nClass D: 1110... (224-239, Multicast)', explanation: 'Classful addressing.'),
          _FormulaItem(name: 'Subnetting', formula: 'If x bits borrowed for subnet:\\nNumber of subnets = 2^x\\nHosts per subnet = 2^(h-x) - 2', explanation: '-2 for Network ID and Broadcast Address.'),
          _FormulaItem(name: 'Fragmentation', formula: 'Fragment size must be multiple of 8 (except last).\\nOffset = Data inserted so far / 8.', explanation: 'MF=1 for all fragments except last.'),
          _FormulaItem(name: 'Routing Protocols', formula: 'RIP: Distance Vector (Bellman-Ford), Max hops=15.\\nOSPF: Link State (Dijkstra), Intra-AS.\\nBGP: Path Vector, Inter-AS.', explanation: 'Finding shortest paths.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Transport & Application Layer',
        items: [
          _FormulaItem(name: 'TCP Headers & Connections', formula: 'Header Size: 20 to 60 Bytes.\\nConnection: 3-way Handshake.\\nTeardown: 4-way Handshake.', explanation: 'Reliable, connection-oriented.'),
          _FormulaItem(name: 'TCP Congestion Control', formula: 'Slow Start: Window grows exponentially.\\nCongestion Avoidance: Grows linearly.\\nThreshold (ssthresh) cuts in half on timeout/dup ACKs.', explanation: 'AIMD (Additive Increase Multiplicative Decrease).'),
          _FormulaItem(name: 'UDP', formula: 'Header Size: 8 Bytes.', explanation: 'Unreliable, connectionless, low overhead.'),
          _FormulaItem(name: 'Application Protocols', formula: 'HTTP: TCP 80\\nFTP: TCP 20 (Data), 21 (Control)\\nSMTP: TCP 25\\nDNS: UDP 53', explanation: 'Standard port numbers.'),
        ]
      )
    ]);
  }"""
content = cn_regex.sub(new_cn, content)

with open(filepath, 'w', encoding='utf-8') as f:
    f.write(content)

print("Injected CD, OS, CN formulas.")
