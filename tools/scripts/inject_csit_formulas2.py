import re

filepath = 'd:/Flutter/Gate DA/lib/screens/formula_sheet_screen.dart'
with open(filepath, 'r', encoding='utf-8') as f:
    content = f.read()

# Replace _buildDigitalLogicTab
dl_regex = re.compile(r'Widget _buildDigitalLogicTab\(BuildContext context\) \{.*?\n  \}', re.DOTALL)
new_dl = """Widget _buildDigitalLogicTab(BuildContext context) {
    return _buildSubjectTab(context, [
      _buildFormulaCard(
        context,
        title: 'Boolean Algebra',
        items: [
          _FormulaItem(name: 'De Morgan\\'s Laws', formula: '(A + B)\\' = A\\' . B\\'\\n(A . B)\\' = A\\' + B\\'', explanation: 'NOR is AND of complements. NAND is OR of complements.'),
          _FormulaItem(name: 'Consensus Theorem', formula: 'AB + A\\'C + BC = AB + A\\'C\\n(A+B)(A\\'+C)(B+C) = (A+B)(A\\'+C)', explanation: 'Used to minimize boolean expressions. Find term with uncomplemented and complemented variable.'),
          _FormulaItem(name: 'Number of Boolean Functions', formula: 'For n variables = 2^(2^n)', explanation: 'Total possible logic functions.'),
          _FormulaItem(name: 'Self-Dual Functions', formula: 'f(A,B,...) = [f(A\\',B\\',...)]\\'', explanation: 'Number of self-dual functions = 2^(2^(n-1)).'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Combinational Circuits',
        items: [
          _FormulaItem(name: 'Multiplexer (MUX)', formula: 'n selection lines => 2^n input lines, 1 output line.', explanation: 'Acts as a data selector. Universal logic block.'),
          _FormulaItem(name: 'Decoder', formula: 'n inputs => 2^n outputs.', explanation: 'Generates all minterms. Used for memory addressing.'),
          _FormulaItem(name: 'Half Adder', formula: 'Sum = A ⊕ B\\nCarry = AB', explanation: 'Adds two bits.'),
          _FormulaItem(name: 'Full Adder', formula: 'Sum = A ⊕ B ⊕ Cin\\nCarry = AB + Cin(A ⊕ B)', explanation: 'Adds three bits. Can be made using 2 HA and 1 OR.'),
          _FormulaItem(name: 'Ripple Carry Adder Delay', formula: 'Total Delay = (n-1) * (Carry Delay) + Max(Carry, Sum Delay)', explanation: 'Slow because carry propagates.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Sequential Circuits',
        items: [
          _FormulaItem(name: 'SR Flip-Flop', formula: 'Q(t+1) = S + R\\'Q(t)\\nCondition: SR = 0', explanation: 'Set-Reset. S=R=1 is invalid.'),
          _FormulaItem(name: 'D Flip-Flop', formula: 'Q(t+1) = D', explanation: 'Delay or Data flip-flop.'),
          _FormulaItem(name: 'JK Flip-Flop', formula: 'Q(t+1) = J Q(t)\\' + K\\' Q(t)', explanation: 'Toggle when J=K=1. Overcomes SR invalid state.'),
          _FormulaItem(name: 'T Flip-Flop', formula: 'Q(t+1) = T ⊕ Q(t)', explanation: 'Toggle flip-flop. Divides frequency by 2.'),
          _FormulaItem(name: 'Synchronous Counter', formula: 'Max frequency f_max = 1 / (T_ff + T_comb)', explanation: 'All flip-flops clocked simultaneously.'),
          _FormulaItem(name: 'Ripple (Asynchronous) Counter', formula: 'Total delay = n * T_ff\\nf_max = 1 / (n * T_ff)', explanation: 'Output of one FF clocks the next.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Data Representation',
        items: [
          _FormulaItem(name: '1\\'s Complement Range', formula: '-(2^(n-1) - 1) to +(2^(n-1) - 1)', explanation: 'Two zeros (+0 and -0).'),
          _FormulaItem(name: '2\\'s Complement Range', formula: '-(2^(n-1)) to +(2^(n-1) - 1)', explanation: 'Unique zero. Asymmetric range.'),
          _FormulaItem(name: 'IEEE 754 Single Precision', formula: '1 bit Sign, 8 bits Exponent (bias 127), 23 bits Mantissa.', explanation: 'Value = (-1)^S * 1.M * 2^(E - 127)'),
          _FormulaItem(name: 'IEEE 754 Double Precision', formula: '1 bit Sign, 11 bits Exponent (bias 1023), 52 bits Mantissa.', explanation: 'Value = (-1)^S * 1.M * 2^(E - 1023)'),
        ]
      )
    ]);
  }"""
content = dl_regex.sub(new_dl, content)

# Replace _buildCOATab
coa_regex = re.compile(r'Widget _buildCOATab\(BuildContext context\) \{.*?\n  \}', re.DOTALL)
new_coa = """Widget _buildCOATab(BuildContext context) {
    return _buildSubjectTab(context, [
      _buildFormulaCard(
        context,
        title: 'Addressing Modes',
        items: [
          _FormulaItem(name: 'Effective Address (EA)', formula: 'The actual memory location accessed by an instruction.', explanation: 'Depends on the mode.'),
          _FormulaItem(name: 'Immediate Mode', formula: 'Operand is specified in the instruction itself.', explanation: 'No memory reference required.'),
          _FormulaItem(name: 'Direct Mode', formula: 'EA = Address field of instruction.', explanation: 'One memory reference.'),
          _FormulaItem(name: 'Indirect Mode', formula: 'EA = Memory[Address field]', explanation: 'Two memory references (pointers).'),
          _FormulaItem(name: 'Register Indirect', formula: 'EA = Register Content', explanation: 'Pointer is stored in a register.'),
          _FormulaItem(name: 'Indexed Mode', formula: 'EA = Base Address + Index Register', explanation: 'Used for array iteration.'),
          _FormulaItem(name: 'PC Relative', formula: 'EA = PC + Offset', explanation: 'Used for branching/jumping.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Cache Memory',
        items: [
          _FormulaItem(name: 'Average Memory Access Time (AMAT)', formula: 'AMAT = Hit_Time + (Miss_Rate × Miss_Penalty)', explanation: 'Miss Penalty = Time to fetch from lower level.'),
          _FormulaItem(name: 'Direct Mapping', formula: 'Block mapped to (Block Address) mod (Number of Cache Blocks)\\nTag | Cache Line | Word Offset', explanation: '1 block maps to exactly 1 cache line.'),
          _FormulaItem(name: 'Fully Associative', formula: 'Block can be placed anywhere.\\nTag | Word Offset', explanation: 'Highest hit rate, most expensive search.'),
          _FormulaItem(name: 'k-Way Set Associative', formula: 'Block mapped to (Block Address) mod (Sets in Cache)\\nTag | Set Index | Word Offset', explanation: 'Compromise between direct and fully associative.'),
          _FormulaItem(name: 'Cache Size', formula: 'Size = Number of Blocks × Block Size', explanation: 'Usually in Bytes.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Instruction Pipelining',
        items: [
          _FormulaItem(name: 'Pipeline Execution Time', formula: 'T_pipe = (k + n - 1) × t_p', explanation: 'k = stages, n = instructions, t_p = cycle time.'),
          _FormulaItem(name: 'Pipeline Speedup', formula: 'Speedup (S) = T_non_pipe / T_pipe\\nIdeal S = k', explanation: 'Maximum speedup equals number of stages.'),
          _FormulaItem(name: 'Pipeline Efficiency', formula: 'Efficiency (η) = Speedup / k', explanation: 'Ratio of actual speedup to ideal speedup.'),
          _FormulaItem(name: 'Throughput', formula: 'Throughput = n / T_pipe', explanation: 'Instructions completed per unit time.'),
          _FormulaItem(name: 'Hazards', formula: 'Structural (Resource conflict), Data (RAW, WAR, WAW), Control (Branches)', explanation: 'Causes pipeline stalls (bubbles).'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'I/O & Disk Organization',
        items: [
          _FormulaItem(name: 'Disk Access Time', formula: 'Seek Time + Rotational Latency + Transfer Time', explanation: 'Time to read/write disk sector.'),
          _FormulaItem(name: 'Average Rotational Latency', formula: '(1/2) * (1 / RPM) * 60 seconds', explanation: 'Time for half a rotation.'),
          _FormulaItem(name: 'DMA Transfer', formula: 'Cycle Stealing: CPU and DMA interleave.\\nBurst Mode: DMA holds bus until transfer is complete.', explanation: 'Bypasses CPU for memory-IO transfers.'),
        ]
      )
    ]);
  }"""
content = coa_regex.sub(new_coa, content)

# Replace _buildTOCTab
toc_regex = re.compile(r'Widget _buildTOCTab\(BuildContext context\) \{.*?\n  \}', re.DOTALL)
new_toc = """Widget _buildTOCTab(BuildContext context) {
    return _buildSubjectTab(context, [
      _buildFormulaCard(
        context,
        title: 'Automata Theory',
        items: [
          _FormulaItem(name: 'Chomsky Hierarchy', formula: 'Type 0: Recursively Enumerable (Turing Machine)\\nType 1: Context Sensitive (LBA)\\nType 2: Context Free (PDA)\\nType 3: Regular (DFA/NFA)', explanation: 'Each type is a strict subset of the one above.'),
          _FormulaItem(name: 'DFA vs NFA', formula: 'Every NFA can be converted to DFA.\\nMax states in DFA = 2^(states in NFA)', explanation: 'Both recognize exactly Regular Languages.'),
          _FormulaItem(name: 'Pumping Lemma for Regular Langs', formula: 'If L is regular, ∃ p ≥ 1 s.t. ∀ w ∈ L with |w| ≥ p, w = xyz:\\n1. |xy| ≤ p\\n2. |y| > 0\\n3. ∀ i ≥ 0, xy^iz ∈ L', explanation: 'Used to prove a language is NOT regular.'),
          _FormulaItem(name: 'Myhill-Nerode Theorem', formula: 'Language is regular iff equivalence classes of indistinguishability relation are FINITE.', explanation: 'Number of classes = Min states in DFA.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Closure Properties (Important)',
        items: [
          _FormulaItem(name: 'Regular Languages', formula: 'Closed under: Union, Intersection, Complement, Kleene Star, Concatenation, Reversal, Homomorphism.', explanation: 'Closed under almost everything.'),
          _FormulaItem(name: 'Context-Free Languages (CFL)', formula: 'Closed under: Union, Kleene Star, Concatenation.\\nNOT closed under: Intersection, Complement.', explanation: 'Intersection of CFL and Regular is CFL.'),
          _FormulaItem(name: 'Deterministic CFL (DCFL)', formula: 'Closed under: Complement.\\nNOT closed under: Union, Intersection.', explanation: 'Recognized by DPDA.'),
          _FormulaItem(name: 'Recursive Languages (REC)', formula: 'Closed under: Union, Intersection, Complement, Kleene Star.', explanation: 'Turing Machines that always halt.'),
          _FormulaItem(name: 'Recursively Enumerable (RE)', formula: 'Closed under: Union, Intersection, Kleene Star.\\nNOT closed under: Complement.', explanation: 'If L and L\\' are RE, then L is Recursive.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Decidability',
        items: [
          _FormulaItem(name: 'Regular & DCFL', formula: 'Almost all problems (Membership, Emptiness, Finiteness, Equivalence) are DECIDABLE.', explanation: 'Highly restricted, thus highly decidable.'),
          _FormulaItem(name: 'CFL', formula: 'Decidable: Membership, Emptiness, Finiteness.\\nUndecidable: Equivalence, Ambiguity, Is it Regular?', explanation: 'Cannot compare two CFLs generally.'),
          _FormulaItem(name: 'Turing Machines (RE / REC)', formula: 'Membership is Undecidable for RE.\\nEmptiness, Finiteness, Equivalence are UNDECIDABLE.', explanation: 'Rice\\'s Theorem: Any non-trivial property of RE languages is undecidable.'),
          _FormulaItem(name: 'Halting Problem', formula: 'Given TM M and input w, does M halt on w? -> UNDECIDABLE.', explanation: 'Classic undecidable problem.'),
        ]
      )
    ]);
  }"""
content = toc_regex.sub(new_toc, content)

with open(filepath, 'w', encoding='utf-8') as f:
    f.write(content)

print("Injected DL, COA, TOC formulas.")
