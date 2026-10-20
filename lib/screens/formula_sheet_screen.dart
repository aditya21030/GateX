import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../providers/app_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/neu_widgets.dart';

class FormulaSheetScreen extends StatefulWidget {
  const FormulaSheetScreen({super.key});

  @override
  State<FormulaSheetScreen> createState() => _FormulaSheetScreenState();
}

class _FormulaSheetScreenState extends State<FormulaSheetScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _copyToClipboard(BuildContext context, String text, String label) {
    HapticFeedback.selectionClick();
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle_rounded, color: AppTheme.accentMint, size: 18),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Copied "$label" formula to clipboard!',
                style: GoogleFonts.outfit(fontWeight: FontWeight.w600, fontSize: 12.5),
              ),
            ),
          ],
        ),
        backgroundColor: context.isDarkMode ? const Color(0xFF1E202B) : const Color(0xFF2D3142),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final isCSIT = provider.activeExam == 'CSIT';

    final daTabs = const [
      Tab(text: 'Probability & Stats'),
      Tab(text: 'Linear Algebra'),
      Tab(text: 'Calculus & Opt'),
      Tab(text: 'Machine Learning'),
      Tab(text: 'DBMS'),
      Tab(text: 'AI & Logic'),
      Tab(text: 'DSA & Python'),
      Tab(text: 'General Aptitude'),
    ];

    final csitTabs = const [
      Tab(text: 'Engineering Math'),
      Tab(text: 'Digital Logic'),
      Tab(text: 'Comp. Organization'),
      Tab(text: 'Prog. & DSA'),
      Tab(text: 'Algorithms'),
      Tab(text: 'Theory of Comp.'),
      Tab(text: 'Compiler Design'),
      Tab(text: 'Operating System'),
      Tab(text: 'DBMS'),
      Tab(text: 'Computer Networks'),
      Tab(text: 'General Aptitude'),
    ];

    final tabs = isCSIT ? csitTabs : daTabs;

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: context.colorBackground,
        appBar: AppBar(
          backgroundColor: context.colorSurface,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded, color: context.textColor),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Formula & Concept Sheet',
            style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: context.textColor),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.share_rounded, size: 20, color: AppTheme.accentPurple),
              tooltip: 'Share Formulas',
              onPressed: () {
                HapticFeedback.selectionClick();
                final exam = provider.activeExam ?? 'DA';
                Share.share(
                  'GATE $exam Complete Formula & Concept Cheatsheet on GateX.\nIncludes Linear Algebra, Calculus, Probability & Stats, ML/AI, and Core Engineering formulas.\nDownload GateX now on Google Play!',
                  subject: 'GATE $exam Formula Cheatsheet',
                );
              },
            ),
            const SizedBox(width: 6),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Container(
              height: 38,
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 10),
              child: TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                indicator: BoxDecoration(
                  color: AppTheme.accentPurple,
                  borderRadius: BorderRadius.circular(19),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.accentPurple.withValues(alpha: 0.35),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                labelColor: Colors.white,
                unselectedLabelColor: context.textSecondaryColor,
                labelStyle: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 12.5),
                unselectedLabelStyle: GoogleFonts.outfit(fontWeight: FontWeight.w500, fontSize: 12.5),
                padding: EdgeInsets.zero,
                labelPadding: const EdgeInsets.symmetric(horizontal: 14),
                tabs: tabs,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            _buildSearchBar(context),
            Expanded(
              child: TabBarView(
                physics: const BouncingScrollPhysics(),
                children: isCSIT
                    ? [
                        _buildCSITMathTab(context),
                        _buildDigitalLogicTab(context),
                        _buildCOATab(context),
                        _buildCSITDSATab(context),
                        _buildCSITAlgorithmsTab(context),
                        _buildTOCTab(context),
                        _buildCompilerTab(context),
                        _buildOSTab(context),
                        _buildCSITDBMSTab(context),
                        _buildCNTab(context),
                        _buildAptitudeTab(context),
                      ]
                    : [
                        _buildProbabilityTab(context),
                        _buildLinearAlgebraTab(context),
                        _buildCalculusTab(context),
                        _buildMLTab(context),
                        _buildDBMSTab(context),
                        _buildAITab(context),
                        _buildDSATab(context),
                        _buildAptitudeTab(context),
                      ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: NeuContainer(
          isRecessed: true,
          borderRadius: 14,
          margin: const EdgeInsets.fromLTRB(16, 8, 16, 6),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          child: Row(
            children: [
              Icon(Icons.search_rounded, size: 18, color: context.textSecondaryColor),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: _searchController,
                  onChanged: (val) => setState(() => _searchQuery = val),
                  style: GoogleFonts.outfit(fontSize: 13, color: context.textColor),
                  decoration: InputDecoration(
                    hintText: 'Search formulas, theorems, derivations...',
                    hintStyle: GoogleFonts.outfit(fontSize: 12, color: context.textSecondaryColor.withValues(alpha: 0.7)),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                ),
              ),
              if (_searchQuery.isNotEmpty)
                GestureDetector(
                  onTap: () {
                    _searchController.clear();
                    setState(() => _searchQuery = '');
                  },
                  child: Icon(Icons.close_rounded, size: 16, color: context.textSecondaryColor),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubjectTab(BuildContext context, List<Widget> children) {
    final query = _searchQuery.trim().toLowerCase();
    List<Widget> filteredChildren = children;

    if (query.isNotEmpty) {
      filteredChildren = children.map((c) {
        if (c is _FormulaCardGroup) {
          final matchedItems = c.items.where((it) {
            return it.name.toLowerCase().contains(query) ||
                it.formula.toLowerCase().contains(query) ||
                it.explanation.toLowerCase().contains(query) ||
                c.title.toLowerCase().contains(query);
          }).toList();
          if (matchedItems.isNotEmpty) {
            return _FormulaCardGroup(
              title: c.title,
              items: matchedItems,
              onCopy: _copyToClipboard,
            );
          }
          return const SizedBox.shrink();
        }
        return c;
      }).where((w) => w is! SizedBox).toList();
    }

    if (filteredChildren.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.search_off_rounded, size: 48, color: context.textSecondaryColor),
              const SizedBox(height: 12),
              Text(
                'No formulas found for "$_searchQuery"',
                style: GoogleFonts.outfit(fontSize: 15, fontWeight: FontWeight.bold, color: context.textColor),
              ),
              const SizedBox(height: 4),
              Text(
                'Try searching another keyword (e.g. Bayes, Eigen, TCP, Turing, LCS)',
                style: GoogleFonts.outfit(fontSize: 12, color: context.textSecondaryColor),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: filteredChildren,
          ),
        ),
      ),
    );
  }

  Widget _buildFormulaCard(
    BuildContext context, {
    required String title,
    required List<_FormulaItem> items,
  }) {
    return _FormulaCardGroup(
      title: title,
      items: items,
      onCopy: _copyToClipboard,
    );
  }

  Widget _buildCSITMathTab(BuildContext context) {
    return _buildSubjectTab(context, [
      _buildFormulaCard(
        context,
        title: 'Discrete Mathematics',
        items: [
          _FormulaItem(name: 'Propositional Logic equivalences', formula: '''p → q ≡ ¬p ∨ q
p ↔ q ≡ (p → q) ∧ (q → p)
p ⊕ q ≡ (p ∧ ¬q) ∨ (¬p ∧ q)''', explanation: 'Implication, Bi-conditional, XOR'),
          _FormulaItem(name: 'De Morgan\'s Laws', formula: '''¬(p ∧ q) ≡ ¬p ∨ ¬q
¬(p ∨ q) ≡ ¬p ∧ ¬q''', explanation: 'Negation of AND/OR'),
          _FormulaItem(name: 'Set Theory Basics', formula: '''|A ∪ B| = |A| + |B| - |A ∩ B|
|A ∪ B ∪ C| = |A| + |B| + |C| - |A ∩ B| - |A ∩ C| - |B ∩ C| + |A ∩ B ∩ C|''', explanation: 'Principle of Inclusion-Exclusion'),
          _FormulaItem(name: 'Relations', formula: '''Reflexive: (a,a) ∈ R
Symmetric: (a,b) ∈ R → (b,a) ∈ R
Transitive: (a,b) ∈ R ∧ (b,c) ∈ R → (a,c) ∈ R''', explanation: 'Equivalence relation requires all three.'),
          _FormulaItem(name: 'Partial Order (POSET)', formula: '''Reflexive, Antisymmetric, Transitive.''', explanation: 'Lattice: every pair has LUB and GLB.'),
          _FormulaItem(name: 'Graph Theory: Handshaking', formula: '''∑ deg(v) = 2|E|''', explanation: 'Sum of degrees is twice number of edges.'),
          _FormulaItem(name: 'Euler\'s Formula', formula: '''V - E + F = 2''', explanation: 'For connected planar graphs.'),
          _FormulaItem(name: 'Complete Graph K_n', formula: '''Edges = n(n-1)/2''', explanation: 'Every vertex connected to every other.'),
          _FormulaItem(name: 'Chromatic Number', formula: '''Bipartite graph: χ(G) = 2
Planar graph: χ(G) ≤ 4''', explanation: 'Minimum colors to color vertices.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Linear Algebra',
        items: [
          _FormulaItem(name: 'Matrix Multiplication', formula: '''C_ij = ∑(A_ik * B_kj)''', explanation: 'Requires A cols = B rows.'),
          _FormulaItem(name: 'Determinant Properties', formula: '''|AB| = |A||B|
|A^T| = |A|
|cA| = c^n|A| (n is order)''', explanation: 'Scalar multiplication scales determinant by c^n.'),
          _FormulaItem(name: 'Inverse of Matrix', formula: '''A^-1 = adj(A) / |A|''', explanation: 'Exists iff |A| ≠ 0.'),
          _FormulaItem(name: 'Eigenvalues & Eigenvectors', formula: '''det(A - λI) = 0 (Characteristic Eq)
Ax = λx''', explanation: 'λ is eigenvalue, x is eigenvector.'),
          _FormulaItem(name: 'Trace & Determinant', formula: '''Trace(A) = ∑ λ_i
|A| = ∏ λ_i''', explanation: 'Sum of diag elements = sum of eigenvalues.'),
          _FormulaItem(name: 'Rank of Matrix', formula: '''Max number of linearly independent rows/cols.''', explanation: 'System has unique solution if rank(A) = rank(A|B) = n.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Calculus',
        items: [
          _FormulaItem(name: 'L\'Hopital\'s Rule', formula: '''lim(x→a) f(x)/g(x) = lim(x→a) f\'(x)/g\'(x)''', explanation: 'If 0/0 or ∞/∞ indeterminate form.'),
          _FormulaItem(name: 'Mean Value Theorem', formula: '''f\'(c) = [f(b) - f(a)] / (b - a)''', explanation: 'Exists c in (a,b).'),
          _FormulaItem(name: 'Taylor Series Expansion', formula: '''f(x) = f(a) + f\'(a)(x-a) + f\"(a)(x-a)^2/2! + ...''', explanation: 'Maclaurin is Taylor at a=0.'),
          _FormulaItem(name: 'Maxima & Minima', formula: '''f\'(x) = 0 (critical point)
If f\"(x) < 0 => Maxima
If f\"(x) > 0 => Minima''', explanation: 'Second derivative test.'),
          _FormulaItem(name: 'Integration by Parts', formula: '''∫ u dv = uv - ∫ v du''', explanation: 'Choose u using ILATE rule.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Probability & Statistics',
        items: [
          _FormulaItem(name: 'Conditional Probability', formula: '''P(A|B) = P(A ∩ B) / P(B)''', explanation: 'Probability of A given B.'),
          _FormulaItem(name: 'Bayes Theorem', formula: '''P(A|B) = [P(B|A) * P(A)] / P(B)''', explanation: 'Reverse conditional probability.'),
          _FormulaItem(name: 'Random Variables', formula: '''E(X) = ∑ x*P(x)
Var(X) = E(X^2) - [E(X)]^2''', explanation: 'Expected value and variance.'),
          _FormulaItem(name: 'Binomial Distribution', formula: '''P(X=k) = nCr * p^k * q^(n-k)''', explanation: 'n trials, k successes. Mean=np, Var=npq.'),
          _FormulaItem(name: 'Poisson Distribution', formula: '''P(X=k) = (e^-λ * λ^k) / k!''', explanation: 'Mean=λ, Var=λ.'),
          _FormulaItem(name: 'Normal Distribution', formula: '''Z = (X - μ) / σ''', explanation: 'Standard normal variable. Mean=0, Var=1.'),
        ]
      )
    ]);
  }

  Widget _buildDigitalLogicTab(BuildContext context) {
    return _buildSubjectTab(context, [
      _buildFormulaCard(
        context,
        title: 'Boolean Algebra',
        items: [
          _FormulaItem(name: 'De Morgan\'s Laws', formula: '''(A + B)\' = A\' . B\'
(A . B)\' = A\' + B\'''', explanation: 'NOR is AND of complements. NAND is OR of complements.'),
          _FormulaItem(name: 'Consensus Theorem', formula: '''AB + A\'C + BC = AB + A\'C
(A+B)(A\'+C)(B+C) = (A+B)(A\'+C)''', explanation: 'Used to minimize boolean expressions. Find term with uncomplemented and complemented variable.'),
          _FormulaItem(name: 'Number of Boolean Functions', formula: '''For n variables = 2^(2^n)''', explanation: 'Total possible logic functions.'),
          _FormulaItem(name: 'Self-Dual Functions', formula: '''f(A,B,...) = [f(A\',B\',...)]\'''', explanation: 'Number of self-dual functions = 2^(2^(n-1)).'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Combinational Circuits',
        items: [
          _FormulaItem(name: 'Multiplexer (MUX)', formula: '''n selection lines => 2^n input lines, 1 output line.''', explanation: 'Acts as a data selector. Universal logic block.'),
          _FormulaItem(name: 'Decoder', formula: '''n inputs => 2^n outputs.''', explanation: 'Generates all minterms. Used for memory addressing.'),
          _FormulaItem(name: 'Half Adder', formula: '''Sum = A ⊕ B
Carry = AB''', explanation: 'Adds two bits.'),
          _FormulaItem(name: 'Full Adder', formula: '''Sum = A ⊕ B ⊕ Cin
Carry = AB + Cin(A ⊕ B)''', explanation: 'Adds three bits. Can be made using 2 HA and 1 OR.'),
          _FormulaItem(name: 'Ripple Carry Adder Delay', formula: '''Total Delay = (n-1) * (Carry Delay) + Max(Carry, Sum Delay)''', explanation: 'Slow because carry propagates.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Sequential Circuits',
        items: [
          _FormulaItem(name: 'SR Flip-Flop', formula: '''Q(t+1) = S + R\'Q(t)
Condition: SR = 0''', explanation: 'Set-Reset. S=R=1 is invalid.'),
          _FormulaItem(name: 'D Flip-Flop', formula: '''Q(t+1) = D''', explanation: 'Delay or Data flip-flop.'),
          _FormulaItem(name: 'JK Flip-Flop', formula: '''Q(t+1) = J Q(t)\' + K\' Q(t)''', explanation: 'Toggle when J=K=1. Overcomes SR invalid state.'),
          _FormulaItem(name: 'T Flip-Flop', formula: '''Q(t+1) = T ⊕ Q(t)''', explanation: 'Toggle flip-flop. Divides frequency by 2.'),
          _FormulaItem(name: 'Synchronous Counter', formula: '''Max frequency f_max = 1 / (T_ff + T_comb)''', explanation: 'All flip-flops clocked simultaneously.'),
          _FormulaItem(name: 'Ripple (Asynchronous) Counter', formula: '''Total delay = n * T_ff
f_max = 1 / (n * T_ff)''', explanation: 'Output of one FF clocks the next.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Data Representation',
        items: [
          _FormulaItem(name: '1\'s Complement Range', formula: '''-(2^(n-1) - 1) to +(2^(n-1) - 1)''', explanation: 'Two zeros (+0 and -0).'),
          _FormulaItem(name: '2\'s Complement Range', formula: '''-(2^(n-1)) to +(2^(n-1) - 1)''', explanation: 'Unique zero. Asymmetric range.'),
          _FormulaItem(name: 'IEEE 754 Single Precision', formula: '''1 bit Sign, 8 bits Exponent (bias 127), 23 bits Mantissa.''', explanation: 'Value = (-1)^S * 1.M * 2^(E - 127)'),
          _FormulaItem(name: 'IEEE 754 Double Precision', formula: '''1 bit Sign, 11 bits Exponent (bias 1023), 52 bits Mantissa.''', explanation: 'Value = (-1)^S * 1.M * 2^(E - 1023)'),
        ]
      )
    ]);
  }

  Widget _buildCOATab(BuildContext context) {
    return _buildSubjectTab(context, [
      _buildFormulaCard(
        context,
        title: 'Addressing Modes',
        items: [
          _FormulaItem(name: 'Effective Address (EA)', formula: '''The actual memory location accessed by an instruction.''', explanation: 'Depends on the mode.'),
          _FormulaItem(name: 'Immediate Mode', formula: '''Operand is specified in the instruction itself.''', explanation: 'No memory reference required.'),
          _FormulaItem(name: 'Direct Mode', formula: '''EA = Address field of instruction.''', explanation: 'One memory reference.'),
          _FormulaItem(name: 'Indirect Mode', formula: '''EA = Memory[Address field]''', explanation: 'Two memory references (pointers).'),
          _FormulaItem(name: 'Register Indirect', formula: '''EA = Register Content''', explanation: 'Pointer is stored in a register.'),
          _FormulaItem(name: 'Indexed Mode', formula: '''EA = Base Address + Index Register''', explanation: 'Used for array iteration.'),
          _FormulaItem(name: 'PC Relative', formula: '''EA = PC + Offset''', explanation: 'Used for branching/jumping.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Cache Memory',
        items: [
          _FormulaItem(name: 'Average Memory Access Time (AMAT)', formula: '''AMAT = Hit_Time + (Miss_Rate × Miss_Penalty)''', explanation: 'Miss Penalty = Time to fetch from lower level.'),
          _FormulaItem(name: 'Direct Mapping', formula: '''Block mapped to (Block Address) mod (Number of Cache Blocks)
Tag | Cache Line | Word Offset''', explanation: '1 block maps to exactly 1 cache line.'),
          _FormulaItem(name: 'Fully Associative', formula: '''Block can be placed anywhere.
Tag | Word Offset''', explanation: 'Highest hit rate, most expensive search.'),
          _FormulaItem(name: 'k-Way Set Associative', formula: '''Block mapped to (Block Address) mod (Sets in Cache)
Tag | Set Index | Word Offset''', explanation: 'Compromise between direct and fully associative.'),
          _FormulaItem(name: 'Cache Size', formula: '''Size = Number of Blocks × Block Size''', explanation: 'Usually in Bytes.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Instruction Pipelining',
        items: [
          _FormulaItem(name: 'Pipeline Execution Time', formula: '''T_pipe = (k + n - 1) × t_p''', explanation: 'k = stages, n = instructions, t_p = cycle time.'),
          _FormulaItem(name: 'Pipeline Speedup', formula: '''Speedup (S) = T_non_pipe / T_pipe
Ideal S = k''', explanation: 'Maximum speedup equals number of stages.'),
          _FormulaItem(name: 'Pipeline Efficiency', formula: '''Efficiency (η) = Speedup / k''', explanation: 'Ratio of actual speedup to ideal speedup.'),
          _FormulaItem(name: 'Throughput', formula: '''Throughput = n / T_pipe''', explanation: 'Instructions completed per unit time.'),
          _FormulaItem(name: 'Hazards', formula: '''Structural (Resource conflict), Data (RAW, WAR, WAW), Control (Branches)''', explanation: 'Causes pipeline stalls (bubbles).'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'I/O & Disk Organization',
        items: [
          _FormulaItem(name: 'Disk Access Time', formula: '''Seek Time + Rotational Latency + Transfer Time''', explanation: 'Time to read/write disk sector.'),
          _FormulaItem(name: 'Average Rotational Latency', formula: '''(1/2) * (1 / RPM) * 60 seconds''', explanation: 'Time for half a rotation.'),
          _FormulaItem(name: 'DMA Transfer', formula: '''Cycle Stealing: CPU and DMA interleave.
Burst Mode: DMA holds bus until transfer is complete.''', explanation: 'Bypasses CPU for memory-IO transfers.'),
        ]
      )
    ]);
  }

  Widget _buildTOCTab(BuildContext context) {
    return _buildSubjectTab(context, [
      _buildFormulaCard(
        context,
        title: 'Automata Theory',
        items: [
          _FormulaItem(name: 'Chomsky Hierarchy', formula: '''Type 0: Recursively Enumerable (Turing Machine)
Type 1: Context Sensitive (LBA)
Type 2: Context Free (PDA)
Type 3: Regular (DFA/NFA)''', explanation: 'Each type is a strict subset of the one above.'),
          _FormulaItem(name: 'DFA vs NFA', formula: '''Every NFA can be converted to DFA.
Max states in DFA = 2^(states in NFA)''', explanation: 'Both recognize exactly Regular Languages.'),
          _FormulaItem(name: 'Pumping Lemma for Regular Langs', formula: '''If L is regular, ∃ p ≥ 1 s.t. ∀ w ∈ L with |w| ≥ p, w = xyz:
1. |xy| ≤ p
2. |y| > 0
3. ∀ i ≥ 0, xy^iz ∈ L''', explanation: 'Used to prove a language is NOT regular.'),
          _FormulaItem(name: 'Myhill-Nerode Theorem', formula: '''Language is regular iff equivalence classes of indistinguishability relation are FINITE.''', explanation: 'Number of classes = Min states in DFA.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Closure Properties (Important)',
        items: [
          _FormulaItem(name: 'Regular Languages', formula: '''Closed under: Union, Intersection, Complement, Kleene Star, Concatenation, Reversal, Homomorphism.''', explanation: 'Closed under almost everything.'),
          _FormulaItem(name: 'Context-Free Languages (CFL)', formula: '''Closed under: Union, Kleene Star, Concatenation.
NOT closed under: Intersection, Complement.''', explanation: 'Intersection of CFL and Regular is CFL.'),
          _FormulaItem(name: 'Deterministic CFL (DCFL)', formula: '''Closed under: Complement.
NOT closed under: Union, Intersection.''', explanation: 'Recognized by DPDA.'),
          _FormulaItem(name: 'Recursive Languages (REC)', formula: '''Closed under: Union, Intersection, Complement, Kleene Star.''', explanation: 'Turing Machines that always halt.'),
          _FormulaItem(name: 'Recursively Enumerable (RE)', formula: '''Closed under: Union, Intersection, Kleene Star.
NOT closed under: Complement.''', explanation: 'If L and L\' are RE, then L is Recursive.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Decidability',
        items: [
          _FormulaItem(name: 'Regular & DCFL', formula: '''Almost all problems (Membership, Emptiness, Finiteness, Equivalence) are DECIDABLE.''', explanation: 'Highly restricted, thus highly decidable.'),
          _FormulaItem(name: 'CFL', formula: '''Decidable: Membership, Emptiness, Finiteness.
Undecidable: Equivalence, Ambiguity, Is it Regular?''', explanation: 'Cannot compare two CFLs generally.'),
          _FormulaItem(name: 'Turing Machines (RE / REC)', formula: '''Membership is Undecidable for RE.
Emptiness, Finiteness, Equivalence are UNDECIDABLE.''', explanation: 'Rice\'s Theorem: Any non-trivial property of RE languages is undecidable.'),
          _FormulaItem(name: 'Halting Problem', formula: '''Given TM M and input w, does M halt on w? -> UNDECIDABLE.''', explanation: 'Classic undecidable problem.'),
        ]
      )
    ]);
  }

  Widget _buildCompilerTab(BuildContext context) {
    return _buildSubjectTab(context, [
      _buildFormulaCard(
        context,
        title: 'Lexical & Syntax Analysis',
        items: [
          _FormulaItem(name: 'Lexical Analysis', formula: '''Uses Finite Automata (DFA) to recognize tokens.''', explanation: 'Outputs stream of tokens. Strips whitespace/comments.'),
          _FormulaItem(name: 'Syntax Analysis (Parsing)', formula: '''Uses Push Down Automata (PDA) to check grammar rules.''', explanation: 'Outputs Parse Tree or Syntax Tree.'),
          _FormulaItem(name: 'Left Recursion Elimination', formula: '''A -> Aα | β  ====>  A -> βA\', A\' -> αA\' | ε''', explanation: 'Top-down parsers cannot handle left recursion.'),
          _FormulaItem(name: 'Left Factoring', formula: '''A -> αβ1 | αβ2 ====> A -> αA\', A\' -> β1 | β2''', explanation: 'Removes non-determinism for predictive parsers.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Parsing Techniques',
        items: [
          _FormulaItem(name: 'FIRST(α)', formula: '''Set of terminals that begin strings derived from α.''', explanation: 'If α =>* ε, then ε is in FIRST(α).'),
          _FormulaItem(name: 'FOLLOW(A)', formula: '''Set of terminals that can appear immediately to the right of A.''', explanation: 'Never contains ε. \$ is in FOLLOW(Start symbol).'),
          _FormulaItem(name: 'LL(1) Parser', formula: '''Top-down. Requires grammar to be unambiguous, no left recursion, left factored.''', explanation: 'Table constructed using FIRST and FOLLOW.'),
          _FormulaItem(name: 'LR Parsers Power', formula: '''LR(0) < SLR(1) < LALR(1) < CLR(1)''', explanation: 'CLR(1) is most powerful. LALR(1) is widely used (YACC).'),
          _FormulaItem(name: 'LR Parser Conflicts', formula: '''Shift-Reduce (SR) or Reduce-Reduce (RR) conflicts.''', explanation: 'If table has multiple entries in a cell, it is not LR.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Translation & Optimization',
        items: [
          _FormulaItem(name: 'Syntax Directed Translation', formula: '''S-Attributed: Only synthesized attributes (Bottom-up).
L-Attributed: Synthesized + Inherited (Top-down & Bottom-up).''', explanation: 'Attaching rules to grammar productions.'),
          _FormulaItem(name: 'Intermediate Code', formula: '''Three Address Code (3AC), Syntax Trees, DAG.''', explanation: 'Machine independent representation.'),
          _FormulaItem(name: 'Local Optimization', formula: '''Constant folding, Constant propagation, Common subexpression elimination, Dead code elimination.''', explanation: 'Usually performed on Basic Blocks.'),
          _FormulaItem(name: 'Data Flow Analysis', formula: '''Liveness analysis, Reaching definitions.''', explanation: 'Used for global optimization across basic blocks.'),
        ]
      )
    ]);
  }

  Widget _buildOSTab(BuildContext context) {
    return _buildSubjectTab(context, [
      _buildFormulaCard(
        context,
        title: 'CPU Scheduling',
        items: [
          _FormulaItem(name: 'Turn Around Time (TAT)', formula: '''TAT = Completion Time - Arrival Time''', explanation: 'Total time spent in the system.'),
          _FormulaItem(name: 'Waiting Time (WT)', formula: '''WT = TAT - Burst Time''', explanation: 'Time spent waiting in ready queue.'),
          _FormulaItem(name: 'First Come First Serve (FCFS)', formula: '''Non-preemptive. High average waiting time.''', explanation: 'Convoy effect occurs.'),
          _FormulaItem(name: 'Shortest Job First (SJF)', formula: '''Greedy approach. Preemptive version is SRTF.''', explanation: 'Optimal for average waiting time.'),
          _FormulaItem(name: 'Round Robin (RR)', formula: '''Time quantum q. Response time is good.''', explanation: 'If q is very large, RR becomes FCFS.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Synchronization & Deadlocks',
        items: [
          _FormulaItem(name: 'Semaphore Operations', formula: '''Wait(S): while(S<=0); S--;
Signal(S): S++;''', explanation: 'Hardware atomic operations.'),
          _FormulaItem(name: 'Deadlock Necessary Conditions', formula: '''1. Mutual Exclusion
2. Hold and Wait
3. No Preemption
4. Circular Wait''', explanation: 'Coffman conditions. All 4 must hold for deadlock.'),
          _FormulaItem(name: 'Banker\'s Algorithm (Avoidance)', formula: '''Need[i,j] = Max[i,j] - Allocation[i,j]
If Need <= Available, state is safe.''', explanation: 'Checks for safe state before granting resource.'),
          _FormulaItem(name: 'Deadlock Prevention', formula: '''Eliminate at least one of the 4 necessary conditions.''', explanation: 'E.g., order resources to prevent circular wait.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Memory Management',
        items: [
          _FormulaItem(name: 'Paging', formula: '''Logical Address = Page Number (p) + Offset (d)
Physical Address = Frame Number (f) + Offset (d)''', explanation: 'Eliminates external fragmentation. Causes internal frag.'),
          _FormulaItem(name: 'Page Table Size', formula: '''Size = Number of Pages × Page Table Entry Size
Num Pages = Logical Memory Size / Page Size''', explanation: 'Stored in main memory (PTBR points to it).'),
          _FormulaItem(name: 'Translation Lookaside Buffer (TLB)', formula: '''Effective Access Time (EAT) = HitRatio × (TLB Time + Mem Time) + MissRatio × (TLB Time + 2 × Mem Time)''', explanation: 'Cache for page table entries.'),
          _FormulaItem(name: 'Page Fault Rate (p)', formula: '''EAT = (1 - p) × Memory_Access + p × Page_Fault_Service_Time''', explanation: 'Demand paging performance.'),
          _FormulaItem(name: 'Page Replacement Algorithms', formula: '''FIFO (Belady\'s Anomaly possible).
LRU (Good approximation of optimal).
Optimal (Replaces page used furthest in future).''', explanation: 'Minimizing page faults.'),
        ]
      )
    ]);
  }

  Widget _buildCNTab(BuildContext context) {
    return _buildSubjectTab(context, [
      _buildFormulaCard(
        context,
        title: 'Data Link Layer & MAC',
        items: [
          _FormulaItem(name: 'Transmission Time (Tt)', formula: '''Tt = L / B''', explanation: 'L = Packet length (bits), B = Bandwidth (bps). Time to put data on wire.'),
          _FormulaItem(name: 'Propagation Delay (Tp)', formula: '''Tp = d / v''', explanation: 'd = Distance, v = Speed of signal. Time to travel wire.'),
          _FormulaItem(name: 'Stop and Wait ARQ Efficiency', formula: '''Efficiency (η) = Tt / (Tt + 2*Tp) = 1 / (1 + 2a)
where a = Tp / Tt''', explanation: 'Very low efficiency for high Tp.'),
          _FormulaItem(name: 'Go-Back-N ARQ', formula: '''Sender Window = N
Receiver Window = 1
Efficiency = N / (1 + 2a)''', explanation: 'Pipelined protocol. Max N = 2^m - 1 (m bits).'),
          _FormulaItem(name: 'Selective Repeat ARQ', formula: '''Sender Window = N
Receiver Window = N
Max N = 2^(m-1)''', explanation: 'Only resends lost frames.'),
          _FormulaItem(name: 'CSMA/CD', formula: '''Min Frame Size (L_min) = 2 * Tp * B''', explanation: 'Collision detection condition. Used in Ethernet.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Network Layer (IPv4)',
        items: [
          _FormulaItem(name: 'IPv4 Classes', formula: '''Class A: 0... (0-127), Mask /8
Class B: 10... (128-191), Mask /16
Class C: 110... (192-223), Mask /24
Class D: 1110... (224-239, Multicast)''', explanation: 'Classful addressing.'),
          _FormulaItem(name: 'Subnetting', formula: '''If x bits borrowed for subnet:
Number of subnets = 2^x
Hosts per subnet = 2^(h-x) - 2''', explanation: '-2 for Network ID and Broadcast Address.'),
          _FormulaItem(name: 'Fragmentation', formula: '''Fragment size must be multiple of 8 (except last).
Offset = Data inserted so far / 8.''', explanation: 'MF=1 for all fragments except last.'),
          _FormulaItem(name: 'Routing Protocols', formula: '''RIP: Distance Vector (Bellman-Ford), Max hops=15.
OSPF: Link State (Dijkstra), Intra-AS.
BGP: Path Vector, Inter-AS.''', explanation: 'Finding shortest paths.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Transport & Application Layer',
        items: [
          _FormulaItem(name: 'TCP Headers & Connections', formula: '''Header Size: 20 to 60 Bytes.
Connection: 3-way Handshake.
Teardown: 4-way Handshake.''', explanation: 'Reliable, connection-oriented.'),
          _FormulaItem(name: 'TCP Congestion Control', formula: '''Slow Start: Window grows exponentially.
Congestion Avoidance: Grows linearly.
Threshold (ssthresh) cuts in half on timeout/dup ACKs.''', explanation: 'AIMD (Additive Increase Multiplicative Decrease).'),
          _FormulaItem(name: 'UDP', formula: '''Header Size: 8 Bytes.''', explanation: 'Unreliable, connectionless, low overhead.'),
          _FormulaItem(name: 'Application Protocols', formula: '''HTTP: TCP 80
FTP: TCP 20 (Data), 21 (Control)
SMTP: TCP 25
DNS: UDP 53''', explanation: 'Standard port numbers.'),
        ]
      )
    ]);
  }

  Widget _buildProbabilityTab(BuildContext context) {
    return _buildSubjectTab(context, [
      _buildFormulaCard(
        context,
        title: 'Probability Axioms & Rules',
        items: [
          _FormulaItem(
            name: 'Addition Rule for Two Events',
            formula: '''P(A ∪ B) = P(A) + P(B) - P(A ∩ B)''', explanation: 'General rule. If events are mutually exclusive, P(A ∩ B) = 0.',
          ),
          _FormulaItem(
            name: 'Conditional Probability',
            formula: '''P(A|B) = P(A ∩ B) / P(B)   (where P(B) > 0)''', explanation: 'Probability of event A occurring given that event B has occurred.',
          ),
          _FormulaItem(
            name: 'Multiplication Rule',
            formula: '''P(A ∩ B) = P(A|B) * P(B) = P(B|A) * P(A)''', explanation: 'Used to find the joint probability of two events.',
          ),
          _FormulaItem(
            name: 'Bayes\' Theorem',
            formula: '''P(Ai | B) = [ P(B | Ai) * P(Ai) ] / [ Σ_j P(B | Aj) * P(Aj) ]''', explanation: 'Calculates posterior probability. The denominator represents total probability P(B).',
          ),
          _FormulaItem(
            name: 'Law of Total Probability',
            formula: '''P(B) = Σ_j P(B | Aj) * P(Aj)''', explanation: 'For a partition of sample space A1, A2, ..., An.',
          ),
          _FormulaItem(
            name: 'Conditional Independence',
            formula: '''P(A ∩ B | C) = P(A|C) * P(B|C)\n=> P(A | B ∩ C) = P(A|C)''', explanation: 'Events A and B are conditionally independent given C.',
          ),
        ],
      ),
      _buildFormulaCard(
        context,
        title: 'Discrete Distributions',
        items: [
          _FormulaItem(
            name: 'Bernoulli Distribution',
            formula: '''P(X = x) = p^x * (1 - p)^(1 - x)   for x ∈ {0, 1}\nMean = p\nVariance = p * (1 - p)\nMGF: M_X(t) = (1 - p) + p * e^t''', explanation: 'Single trial with success probability p.',
          ),
          _FormulaItem(
            name: 'Binomial Distribution',
            formula: '''P(X = k) = (n C k) * p^k * (1 - p)^(n - k)\nMean = n * p\nVariance = n * p * (1 - p)\nMGF: M_X(t) = ( (1 - p) + p * e^t )^n''', explanation: 'k successes in n independent Bernoulli trials.',
          ),
          _FormulaItem(
            name: 'Poisson Distribution',
            formula: '''P(X = k) = (λ^k * e^-λ) / k!\nMean = λ\nVariance = λ\nMGF: M_X(t) = e^(λ * (e^t - 1))''', explanation: 'Models events occurring in a fixed interval of time/space with average rate λ.',
          ),
          _FormulaItem(
            name: 'Geometric Distribution',
            formula: '''P(X = k) = (1 - p)^(k - 1) * p   for k ∈ {1, 2, ...}\nMean = 1 / p\nVariance = (1 - p) / p²\nMGF: M_X(t) = (p * e^t) / (1 - (1 - p) * e^t)''', explanation: 'Number of trials until the first success (memoryless discrete distribution).',
          ),
          _FormulaItem(
            name: 'Negative Binomial Distribution',
            formula: '''P(X = k) = ((k - 1) C (r - 1)) * p^r * (1 - p)^(k - r)   for k ∈ {r, r+1, ...}\nMean = r / p\nVariance = r * (1 - p) / p²''', explanation: 'Number of trials until the r-th success.',
          ),
          _FormulaItem(
            name: 'Discrete Uniform Distribution',
            formula: '''P(X = x) = 1 / n   for x ∈ {x1, x2, ..., xn}\nMean = (a + b) / 2\nVariance = (n² - 1) / 12''', explanation: 'All outcomes are equally likely on the discrete range.',
          ),
        ],
      ),
      _buildFormulaCard(
        context,
        title: 'Continuous Distributions',
        items: [
          _FormulaItem(
            name: 'Continuous Uniform Distribution',
            formula: '''f(x) = 1 / (b - a)   for a ≤ x ≤ b\nMean = (a + b) / 2\nVariance = (b - a)² / 12''', explanation: 'Equally likely continuous outcomes on interval [a, b].',
          ),
          _FormulaItem(
            name: 'Exponential Distribution',
            formula: '''f(x) = λ * e^(-λx)   for x ≥ 0\nMean = 1 / λ\nVariance = 1 / λ²\nCDF: F(x) = 1 - e^(-λx)\nMemoryless: P(X > s + t | X > s) = P(X > t)''', explanation: 'Models time between events in Poisson process.',
          ),
          _FormulaItem(
            name: 'Normal (Gaussian) Distribution',
            formula: '''f(x) = [ 1 / (σ * √(2π)) ] * e^( -0.5 * ((x - μ) / σ)² )\nStandardized: Z = (X - μ) / σ  ~  N(0, 1)\nMean = μ\nVariance = σ²''', explanation: 'Standard Normal has mean 0, variance 1.',
          ),
          _FormulaItem(
            name: 't-Distribution (Student\'s t)',
            formula: '''t = (X̄ - μ) / (s / √n)   with df = n - 1''', explanation: 'Approaches standard normal as degrees of freedom (df) n -> ∞. Used when population variance is unknown.',
          ),
          _FormulaItem(
            name: 'Chi-Squared (χ²) Distribution',
            formula: '''χ² = Sum(Z_i²)   for i ∈ {1, ..., k} independent standard normals\nMean = k (degrees of freedom)\nVariance = 2k''', explanation: 'Used for hypothesis testing of sample variances and goodness-of-fit.',
          ),
          _FormulaItem(
            name: 'F-Distribution',
            formula: '''F = (U / d1) / (V / d2)   where U ~ χ²(d1), V ~ χ²(d2) independent''', explanation: 'Ratio of two normalized chi-square variables. Used in ANOVA and testing equality of variances.',
          ),
        ],
      ),
      _buildFormulaCard(
        context,
        title: 'Expectation, Moments & Joint Distributions',
        items: [
          _FormulaItem(
            name: 'Linearity of Expectation',
            formula: '''E[aX + bY + c] = a * E[X] + b * E[Y] + c''', explanation: 'Holds for ALL random variables, whether they are independent or dependent.',
          ),
          _FormulaItem(
            name: 'Variance & Properties',
            formula: '''Var(X) = E[X²] - (E[X])²\nVar(aX + b) = a² * Var(X)\nStd Dev (σ) = √(Var(X))''', explanation: 'Measures spread of data. Adding constant b does not change variance.',
          ),
          _FormulaItem(
            name: 'Covariance',
            formula: '''Cov(X, Y) = E[XY] - E[X]*E[Y] = E[(X - E[X])*(Y - E[Y])]\nCov(aX, bY) = a * b * Cov(X, Y)''', explanation: 'Measures linear relationship between X and Y.',
          ),
          _FormulaItem(
            name: 'Correlation (ρ)',
            formula: '''ρ_XY = Cov(X, Y) / ( σ_X * σ_Y )   where -1 ≤ ρ_XY ≤ 1''', explanation: 'Normalized measure of linear dependency. If independent, Cov(X,Y) = 0 and ρ = 0.',
          ),
          _FormulaItem(
            name: 'Variance of Sum / Difference',
            formula: '''Var(X ± Y) = Var(X) + Var(Y) ± 2*Cov(X, Y)\nIf X, Y independent: Var(X ± Y) = Var(X) + Var(Y)''', explanation: 'Calculates variance of combined variables.',
          ),
          _FormulaItem(
            name: 'Conditional Expectation & Variance',
            formula: '''Law of Total Expectation: E[X] = E_Y[ E_X[X|Y] ]\nLaw of Total Variance: Var(X) = E[Var(X|Y)] + Var(E[X|Y])''', explanation: 'Calculates expectation/variance by conditioning on another variable.',
          ),
        ],
      ),
      _buildFormulaCard(
        context,
        title: 'Limit Theorems & Sampling Distributions',
        items: [
          _FormulaItem(
            name: 'Markov\'s Inequality',
            formula: '''P(X ≥ a) ≤ E[X] / a   for non-negative X and a > 0''', explanation: 'Gives an upper bound on the probability that a non-negative random variable exceeds a.',
          ),
          _FormulaItem(
            name: 'Chebyshev\'s Inequality',
            formula: '''P(|X - μ| ≥ k*σ) ≤ 1 / k²\nAlternatively: P(|X - μ| ≥ ε) ≤ Var(X) / ε²''', explanation: 'Guarantees bounds on dispersion for any distribution with finite mean and variance.',
          ),
          _FormulaItem(
            name: 'Central Limit Theorem (CLT)',
            formula: '''Let X1..Xn be i.i.d. with mean μ and variance σ².\nAs n → ∞: Z = (X̄_n - μ) / (σ / √n)  --->  N(0, 1)''', explanation: 'Sample mean of independent variables approaches a normal distribution as sample size grows.',
          ),
          _FormulaItem(
            name: 'Weak Law of Large Numbers (WLLN)',
            formula: '''For any ε > 0: lim (n→∞) P( |X̄_n - μ| ≥ ε ) = 0''', explanation: 'The sample mean converges in probability to the population mean.',
          ),
        ],
      ),
      _buildFormulaCard(
        context,
        title: 'Hypothesis Testing & Estimation',
        items: [
          _FormulaItem(
            name: 'Bias & Mean Squared Error (MSE)',
            formula: '''Bias(θ̂) = E[θ̂] - θ\nMSE(θ̂) = Var(θ̂) + (Bias(θ̂))²''', explanation: 'Evaluates the quality of an estimator θ̂. If unbiased, Bias = 0 and MSE = Var.',
          ),
          _FormulaItem(
            name: 'z-Test Statistic',
            formula: '''z = (X̄ - μ₀) / (σ / √n)''', explanation: 'Used for hypothesis testing of a single mean when population standard deviation σ is KNOWN.',
          ),
          _FormulaItem(
            name: 't-Test Statistic',
            formula: '''t = (X̄ - μ₀) / (s / √n)   with df = n - 1''', explanation: 'Used for hypothesis testing of a single mean when population standard deviation is UNKNOWN.',
          ),
          _FormulaItem(
            name: 'Chi-Square (χ²) Test Statistic',
            formula: '''χ² = Σ [ (O_i - E_i)² / E_i ]''', explanation: 'O_i: Observed count, E_i: Expected count. Used for goodness-of-fit and contingency tables.',
          ),
          _FormulaItem(
            name: 'Confidence Intervals for Mean',
            formula: '''Known σ: X̄ ± z_(α/2) * (σ / √n)\nUnknown σ: X̄ ± t_(α/2, n-1) * (s / √n)''', explanation: 'Range of values likely to contain the true population mean.',
          ),
          _FormulaItem(
            name: 'Errors in Hypothesis Testing',
            formula: '''Type I Error (α) = P(Reject H₀ | H₀ is True)  [Significance Level]\nType II Error (β) = P(Accept H₀ | H₀ is False)\nPower of Test = 1 - β = P(Reject H₀ | H₀ is False)''', explanation: 'Type I is false alarm. Type II is failing to detect an effect.',
          ),
        ],
      ),
    ]);
  }

  Widget _buildLinearAlgebraTab(BuildContext context) {
    return _buildSubjectTab(context, [
      _buildFormulaCard(
        context,
        title: 'Systems & Vector Spaces',
        items: [
          _FormulaItem(
            name: 'System of Linear Equations',
            formula: '''A * x = b\nConsistent iff rank(A) = rank([A|b])\nUnique solution iff rank = n (number of variables)\nInfinitely many solutions iff rank < n''', explanation: '[A|b] is the augmented matrix.',
          ),
          _FormulaItem(
            name: 'Linear Independence',
            formula: '''c₁*v₁ + c₂*v₂ + ... + c_k*v_k = 0   =>   c₁ = c₂ = ... = c_k = 0''', explanation: 'Vectors are linearly independent if none can be written as a linear combination of others.',
          ),
          _FormulaItem(
            name: 'Rank-Nullity Theorem',
            formula: '''rank(A) + nullity(A) = n   (where A is m x n matrix)''', explanation: 'rank(A) is dimensions of column space. nullity(A) is dimension of null space.',
          ),
        ],
      ),
      _buildFormulaCard(
        context,
        title: 'Eigenvalues & Eigenvectors',
        items: [
          _FormulaItem(
            name: 'Eigenvalue Equation',
            formula: '''A * v = λ * v   =>   (A - λ * I) * v = 0\nCharacteristic Polynomial: p(λ) = det(A - λ * I) = 0''', explanation: 'λ is eigenvalue, v is corresponding non-zero eigenvector.',
          ),
          _FormulaItem(
            name: 'Trace & Determinant Relations',
            formula: '''trace(A) = Σ a_ii = Σ λ_i (sum of eigenvalues)\ndet(A) = Π λ_i (product of eigenvalues)''', explanation: 'Holds for all square matrices.',
          ),
          _FormulaItem(
            name: 'Cayley-Hamilton Theorem',
            formula: '''p(A) = 0   where p(λ) is the characteristic polynomial of A''', explanation: 'Every square matrix satisfies its own characteristic equation. Highly useful to compute A⁻¹.',
          ),
          _FormulaItem(
            name: 'Diagonalization Condition',
            formula: '''A = P * D * P⁻¹   where D = diag(λ1, ..., λn)\nP contains n linearly independent eigenvectors of A''', explanation: 'A square matrix is diagonalizable iff it has n linearly independent eigenvectors.',
          ),
          _FormulaItem(
            name: 'Multiplicities of Eigenvalues',
            formula: '''Algebraic Multiplicity (AM): multiplicity of λ as root of det(A-λI)=0\nGeometric Multiplicity (GM): nullity(A-λI) = dim of Eigenspace\nRelation: 1 ≤ GM ≤ AM''', explanation: 'A is diagonalizable iff GM = AM for all eigenvalues.',
          ),
        ],
      ),
      _buildFormulaCard(
        context,
        title: 'Inner Products & Projections',
        items: [
          _FormulaItem(
            name: 'Dot Product & Vector Norm',
            formula: '''u · v = u^T * v = Σ u_i * v_i\nL2 Norm: ||v|| = √(v · v) = √(Σ v_i²)''', explanation: 'Inner product in Euclidean space.',
          ),
          _FormulaItem(
            name: 'Orthogonal Projection onto Vector',
            formula: '''proj_u(v) = [ (v · u) / (u · u) ] * u''', explanation: 'Finds the projection of vector v onto vector u.',
          ),
          _FormulaItem(
            name: 'Projection Matrix onto Subspace Col(A)',
            formula: '''P = A * (A^T * A)⁻¹ * A^T\nSatisfies: P² = P  and  P^T = P''', explanation: 'Projects vector onto the column space of matrix A.',
          ),
          _FormulaItem(
            name: 'Gram-Schmidt Orthogonalization',
            formula: '''u₁ = v₁\nu₂ = v₂ - [ (v₂·u₁) / (u₁·u₁) ] * u₁\nu_k = v_k - Σ_{j=1}^{k-1} [ (v_k·u_j) / (u_j·u_j) ] * u_j''', explanation: 'Constructs an orthogonal basis from a set of linearly independent vectors.',
          ),
          _FormulaItem(
            name: 'Least-Squares Solution',
            formula: '''A^T * A * x̂ = A^T * b\nx̂ = (A^T * A)⁻¹ * A^T * b''', explanation: 'Finds best approximate solution to Ax = b when no exact solution exists.',
          ),
        ],
      ),
      _buildFormulaCard(
        context,
        title: 'Matrix Decompositions',
        items: [
          _FormulaItem(
            name: 'LU Decomposition',
            formula: '''A = L * U''', explanation: 'L: Lower triangular matrix (with 1s on main diagonal), U: Upper triangular matrix.',
          ),
          _FormulaItem(
            name: 'Cholesky Decomposition',
            formula: '''A = L * L^T''', explanation: 'For symmetric, positive-definite matrices. L is lower triangular with positive diagonal elements.',
          ),
          _FormulaItem(
            name: 'QR Decomposition',
            formula: '''A = Q * R''', explanation: 'Q: Orthogonal matrix (Q^T * Q = I), R: Upper triangular matrix.',
          ),
          _FormulaItem(
            name: 'Singular Value Decomposition (SVD)',
            formula: '''A = U * Σ * V^T''', explanation: 'U: eigenvectors of AA^T (m x m), V: eigenvectors of A^TA (n x n), Σ: singular values (m x n) σ_i = √λ_i.',
          ),
        ],
      ),
      _buildFormulaCard(
        context,
        title: 'Principal Component Analysis (PCA)',
        items: [
          _FormulaItem(
            name: 'Covariance Matrix',
            formula: '''C = (1 / (n - 1)) * X_centered^T * X_centered''', explanation: 'X_centered is standardized/mean-centered data matrix (n x d).',
          ),
          _FormulaItem(
            name: 'PCA Dimension Reduction Projection',
            formula: '''Z = X_centered * V_k\nwhere V_k contains top k eigenvectors of Covariance matrix C''', explanation: 'Projects data along directions of maximum variance.',
          ),
          _FormulaItem(
            name: 'Proportion of Variance Explained',
            formula: '''Var_explained = [ Σ_{i=1}^k λ_i ] / [ Σ_{j=1}^d λ_j ]''', explanation: 'Measures how much information is retained after projecting to k dimensions.',
          ),
        ],
      ),
    ]);
  }

  Widget _buildCalculusTab(BuildContext context) {
    return _buildSubjectTab(context, [
      _buildFormulaCard(
        context,
        title: 'Single Variable Calculus',
        items: [
          _FormulaItem(
            name: 'L\'Hôpital\'s Rule',
            formula: '''If lim f(x)/g(x) = 0/0 or ±∞/±∞:\nlim [ f(x) / g(x) ] = lim [ f\'(x) / g\'(x) ]''', explanation: 'Differentiate numerator and denominator separately.',
          ),
          _FormulaItem(
            name: 'Taylor Series Expansion',
            formula: '''f(x) = Σ_{n=0}^∞ [ (f^(n)(a) / n!) * (x - a)^n ]''', explanation: 'Approximates a smooth function using derivatives at point a.',
          ),
          _FormulaItem(
            name: 'Maclaurin Series Expansion',
            formula: '''f(x) = Σ_{n=0}^∞ [ (f^(n)(0) / n!) * x^n ]''', explanation: 'Taylor series expanded around a = 0.',
          ),
          _FormulaItem(
            name: 'Mean Value Theorem (MVT)',
            formula: '''f\'(c) = [ f(b) - f(a) ] / (b - a)   for some c ∈ (a, b)''', explanation: 'If f is continuous on [a,b] and differentiable on (a,b).',
          ),
        ],
      ),
      _buildFormulaCard(
        context,
        title: 'Multivariable Derivatives',
        items: [
          _FormulaItem(
            name: 'Gradient Vector',
            formula: '''∇f(x) = [ ∂f/∂x₁, ∂f/∂x₂, ..., ∂f/∂x_n ]^T''', explanation: 'Points in the direction of maximum rate of increase of the function.',
          ),
          _FormulaItem(
            name: 'Directional Derivative',
            formula: '''D_u f(x) = ∇f(x) · u   (where u is a unit vector)''', explanation: 'Rate of change of f in direction of unit vector u.',
          ),
          _FormulaItem(
            name: 'Jacobian Matrix',
            formula: '''J = [ ∂f_i / ∂x_j ]   (m x n matrix for f: ℝ^n → ℝ^m)''', explanation: 'Matrix of all first-order partial derivatives of a vector-valued function.',
          ),
          _FormulaItem(
            name: 'Hessian Matrix',
            formula: '''H = [ ∂²f / (∂x_i * ∂x_j) ]   (n x n matrix for f: ℝ^n → ℝ)''', explanation: 'Square matrix of second-order partial derivatives of a scalar-valued function.',
          ),
          _FormulaItem(
            name: 'Multivariable Chain Rule',
            formula: '''dz/dt = (∂f/∂x) * (dx/dt) + (∂f/∂y) * (dy/dt)   where z = f(x, y)''', explanation: 'Used when x and y are functions of parameter t.',
          ),
        ],
      ),
      _buildFormulaCard(
        context,
        title: 'Unconstrained Optimization',
        items: [
          _FormulaItem(
            name: 'First-Order Necessary Condition (FONC)',
            formula: '''∇f(x*) = 0''', explanation: 'Gradient is zero at any local extreme point (critical point).',
          ),
          _FormulaItem(
            name: 'Second-Order Sufficiency Conditions (SOSC)',
            formula: '''Local Minima: H(x*) ≻ 0 (Positive Definite, eigenvalues > 0)\nLocal Maxima: H(x*) ≺ 0 (Negative Definite, eigenvalues < 0)\nSaddle Point: H(x*) is Indefinite (both positive & negative eigenvalues)''', explanation: 'Classifies the critical point found by FONC.',
          ),
        ],
      ),
      _buildFormulaCard(
        context,
        title: 'Constrained Optimization & KKT',
        items: [
          _FormulaItem(
            name: 'Lagrange Multipliers Method',
            formula: '''∇L(x, λ) = 0\nwhere L(x, λ) = f(x) + λ * h(x)   (for h(x) = 0)''', explanation: 'Used to optimize f(x) subject to equality constraint h(x) = 0.',
          ),
          _FormulaItem(
            name: 'Karush-Kuhn-Tucker (KKT) Conditions',
            formula: '''Stationarity: ∇f(x*) + Σ μ_i * ∇g_i(x*) + Σ λ_j * ∇h_j(x*) = 0\nPrimal Feasibility: g_i(x*) ≤ 0  and  h_j(x*) = 0\nDual Feasibility: μ_i ≥ 0\nComplementary Slackness: μ_i * g_i(x*) = 0   for all i''', explanation: 'Necessary conditions for an optimal solution with inequality constraints g_i(x) <= 0.',
          ),
        ],
      ),
      _buildFormulaCard(
        context,
        title: 'Convex Sets & Functions',
        items: [
          _FormulaItem(
            name: 'Convex Set Definition',
            formula: '''x, y ∈ S  =>  λ*x + (1 - λ)*y ∈ S   for all λ ∈ [0, 1]''', explanation: 'Line segment between any two points in the set lies entirely in the set.',
          ),
          _FormulaItem(
            name: 'Convex Function Definition',
            formula: '''f(λ*x + (1 - λ)*y) ≤ λ*f(x) + (1 - λ)*f(y)   for all λ ∈ [0, 1]''', explanation: 'Chord line segment lies above the graph of the function.',
          ),
          _FormulaItem(
            name: 'First-Order Convexity Condition',
            formula: '''f(y) ≥ f(x) + ∇f(x)^T * (y - x)   for all x, y in domain''', explanation: 'Tangent line lies below the graph of a convex function.',
          ),
          _FormulaItem(
            name: 'Second-Order Convexity Condition',
            formula: '''∇²f(x) (Hessian H) ⪰ 0 (Positive Semi-Definite) for all x''', explanation: 'A twice-differentiable function is convex iff its Hessian is positive semi-definite.',
          ),
          _FormulaItem(
            name: 'Global Optimality in Convex Problems',
            formula: '''Any local minimum of a convex function on a convex set is a global minimum.''', explanation: 'Key reason why convex optimization is highly desired in Machine Learning.',
          ),
        ],
      ),
    ]);
  }

  Widget _buildMLTab(BuildContext context) {
    return _buildSubjectTab(context, [
      _buildFormulaCard(
        context,
        title: 'Supervised Learning - Regression',
        items: [
          _FormulaItem(
            name: 'OLS Cost Function',
            formula: '''J(θ) = (1 / 2m) * Σ_{i=1}^m ( h_θ(x^(i)) - y^(i) )²''', explanation: 'Mean Squared Error (MSE) cost function for linear regression.',
          ),
          _FormulaItem(
            name: 'Gradient Descent Update Rule',
            formula: '''θ_j := θ_j - α * (1 / m) * Σ_{i=1}^m ( h_θ(x^(i)) - y^(i) ) * x_j^(i)''', explanation: 'Steps down cost function parameter-wise with learning rate α.',
          ),
          _FormulaItem(
            name: 'Normal Equation (Closed-form)',
            formula: '''θ = (X^T * X)⁻¹ * X^T * y''', explanation: 'Analytical solution to find optimal parameters without iteration.',
          ),
          _FormulaItem(
            name: 'Ridge (L2) Regularized Loss',
            formula: '''J(θ) = MSE(θ) + (λ / 2) * Σ_{j=1}^d θ_j²''', explanation: 'Prevents overfitting by shrinking weights close to zero (adds weight decay).',
          ),
          _FormulaItem(
            name: 'Lasso (L1) Regularized Loss',
            formula: '''J(θ) = MSE(θ) + λ * Σ_{j=1}^d |θ_j|''', explanation: 'Forces weights of irrelevant features to exactly zero, producing sparse models.',
          ),
        ],
      ),
      _buildFormulaCard(
        context,
        title: 'Supervised Learning - Classification',
        items: [
          _FormulaItem(
            name: 'Logistic Sigmoid Hypothesis',
            formula: '''h_θ(x) = 1 / ( 1 + e^(-θ^T * x) )''', explanation: 'Maps any real value to a probability interval [0, 1].',
          ),
          _FormulaItem(
            name: 'Binary Cross-Entropy Loss (Log Loss)',
            formula: '''J(θ) = -1/m * Σ_{i=1}^m [ y^(i)*log(h_θ(x^(i))) + (1 - y^(i))*log(1 - h_θ(x^(i))) ]''', explanation: 'Derives from Maximum Likelihood Estimation for binomial class outputs.',
          ),
          _FormulaItem(
            name: 'Naive Bayes Decision Rule',
            formula: '''y_pred = argmax_y P(y) * Π_{j=1}^d P(x_j | y)''', explanation: 'Assumes features x_j are conditionally independent given the class label y.',
          ),
          _FormulaItem(
            name: 'Support Vector Machine (Hard Margin)',
            formula: '''Minimize: 0.5 * ||w||²\nSubject to: y^(i) * (w^T * x^(i) + b) ≥ 1   for all i''', explanation: 'Maximizes the margin distance (2/||w||) between support vectors.',
          ),
          _FormulaItem(
            name: 'SVM Soft Margin & Hinge Loss',
            formula: '''Minimize: 0.5 * ||w||² + C * Σ_{i=1}^m max( 0, 1 - y^(i)*(w^T*x^(i) + b) )''', explanation: 'C is regularizer. Hinge loss penalizes points violating the margin boundary.',
          ),
          _FormulaItem(
            name: 'SVM Kernel Trick',
            formula: '''K(x, z) = Φ(x)^T * Φ(z)\nRBF Kernel: K(x, z) = e^( -γ * ||x - z||² )''', explanation: 'Implicitly projects features into infinite-dimensional spaces without computing Φ(x).',
          ),
        ],
      ),
      _buildFormulaCard(
        context,
        title: 'Decision Trees & Ensembles',
        items: [
          _FormulaItem(
            name: 'Entropy & Information Gain',
            formula: '''Entropy(S) = - Σ p_i * log₂(p_i)\nInfo Gain(S, A) = Entropy(S) - Σ (|S_v| / |S|) * Entropy(S_v)''', explanation: 'Used in ID3 trees. Chooses attribute split maximizing Info Gain.',
          ),
          _FormulaItem(
            name: 'Gini Impurity Index',
            formula: '''Gini(S) = 1 - Σ p_i²''', explanation: 'Alternative split metric used in CART decision trees.',
          ),
          _FormulaItem(
            name: 'Variance-Bias Tradeoff',
            formula: '''MSE = Bias² + Variance + Irreducible_Error''', explanation: 'High Bias = Underfitting. High Variance = Overfitting.',
          ),
        ],
      ),
      _buildFormulaCard(
        context,
        title: 'Unsupervised Learning',
        items: [
          _FormulaItem(
            name: 'K-Means WCSS Objective',
            formula: '''J = Σ_{k=1}^K Σ_{i ∈ S_k} || x_i - μ_k ||²''', explanation: 'Within-Cluster Sum of Squares. Minimizes squared distance of points to centroids.',
          ),
          _FormulaItem(
            name: 'Silhouette Coefficient',
            formula: '''s(i) = ( b(i) - a(i) ) / max( a(i), b(i) )''', explanation: 'a(i): mean intra-cluster distance. b(i): mean nearest-cluster distance. Range [-1, 1].',
          ),
        ],
      ),
      _buildFormulaCard(
        context,
        title: 'Neural Networks & Deep Learning',
        items: [
          _FormulaItem(
            name: 'Forward Pass equations',
            formula: '''z^(l) = W^(l) * a^(l-1) + b^(l)\na^(l) = σ(z^(l))''', explanation: 'a^(l-1) is the input activation. σ is the element-wise non-linear activation.',
          ),
          _FormulaItem(
            name: 'Common Activation Functions',
            formula: '''Sigmoid: σ(z) = 1 / (1 + e^-z)\nTanh: tanh(z) = (e^z - e^-z) / (e^z + e^-z)\nReLU: f(z) = max(0, z)\nLeaky ReLU: f(z) = max(αz, z)\nSoftmax: a_i = e^(z_i) / [ Σ_j e^(z_j) ]''', explanation: 'Softmax is used at output layer for multi-class classification probabilities.',
          ),
          _FormulaItem(
            name: 'Backpropagation Error Delta (δ)',
            formula: '''Output Layer (L): δ^(L) = ∇_a J ⊙ σ\'(z^(L))\nHidden Layer (l): δ^(l) = ( (W^(l+1))^T * δ^(l+1) ) ⊙ σ\'(z^(l))''', explanation: '⊙: Hadamard (element-wise) product. Delta represents partial derivative of loss w.r.t z.',
          ),
          _FormulaItem(
            name: 'Weight & Bias Gradient Formulas',
            formula: '''∂J / ∂W^(l) = δ^(l) * (a^(l-1))^T\n∂J / ∂b^(l) = δ^(l)''', explanation: 'Gradients used by optimizers to update parameters during training.',
          ),
        ],
      ),
    ]);
  }

  Widget _buildDBMSTab(BuildContext context) {
    return _buildSubjectTab(context, [
      _buildFormulaCard(
        context,
        title: 'Relational Algebra',
        items: [
          _FormulaItem(
            name: 'Fundamental Operators',
            formula: '''Selection: σ_c(R)   (selects rows satisfying condition c)\nProjection: π_a(R)   (projects attribute columns a)\nCartesian Product: R × S   (cross combines tuples)\nNatural Join: R ⋈ S = π_attrs( σ_equality(R × S) )''', explanation: 'Natural join merges columns on attributes having the same name.',
          ),
          _FormulaItem(
            name: 'Relational Division Operator',
            formula: '''R ÷ S = { t ∈ π_{R - S}(R) | ∀ s ∈ S, (t, s) ∈ R }''', explanation: 'Finds values in R that match with ALL values in S (e.g. "employees who worked on all projects").',
          ),
        ],
      ),
      _buildFormulaCard(
        context,
        title: 'Functional Dependencies & Keys',
        items: [
          _FormulaItem(
            name: 'Attribute Closure Algorithm (X⁺)',
            formula: '''Initialize X⁺ := X\nRepeat until no changes:\n  If Y → Z is in F and Y ⊆ X⁺, then X⁺ := X⁺ ∪ Z''', explanation: 'Finds the set of all attributes functionally determined by X.',
          ),
          _FormulaItem(
            name: 'Candidate Key Definition',
            formula: '''K is a Candidate Key of R iff:\n1. K⁺ contains all attributes of R\n2. No proper subset of K satisfies condition 1''', explanation: 'Minimal super key.',
          ),
          _FormulaItem(
            name: 'Canonical Cover (F_c)',
            formula: '''1. No FD in F_c contains extraneous attributes.\n2. Left-hand side of all FDs are unique (collapsed).\n3. Right-hand side has singletons.''', explanation: 'Minimal equivalent set of functional dependencies.',
          ),
        ],
      ),
      _buildFormulaCard(
        context,
        title: 'Normalization Conditions',
        items: [
          _FormulaItem(
            name: 'Boyce-Codd Normal Form (BCNF)',
            formula: '''For every non-trivial FD X → Y:\n  X must be a Super Key.''', explanation: 'Strictest normal form for functional dependencies. Eliminates all redundancy.',
          ),
          _FormulaItem(
            name: 'Third Normal Form (3NF)',
            formula: '''For every non-trivial FD X → Y, either:\n  1. X is a Super Key  OR\n  2. Y is a Prime Attribute (part of some Candidate Key)''', explanation: 'Allows some redundancy to preserve all functional dependencies.',
          ),
          _FormulaItem(
            name: 'Lossless-Join Decomposition Condition',
            formula: '''Decomposition of R into R1, R2 is lossless iff:\n  (R1 ∩ R2) → R1   or   (R1 ∩ R2) → R2   is in F⁺''', explanation: 'Ensures the tables can be joined back without creating spurious tuples.',
          ),
          _FormulaItem(
            name: 'Dependency Preservation Condition',
            formula: '''( F1 ∪ F2 ∪ ... ∪ Fn )⁺ = F⁺''', explanation: 'Decomposition preserves functional dependencies if union of closures equals original closure.',
          ),
        ],
      ),
      _buildFormulaCard(
        context,
        title: 'Concurrency Control & Transactions',
        items: [
          _FormulaItem(
            name: 'Conflict Serializability condition',
            formula: '''A schedule is Conflict Serializable iff its Precedence Graph is Acyclic.''', explanation: 'Precedence graph: Draw edge Ti -> Tj if Ti executes conflicting action on item Q before Tj.',
          ),
          _FormulaItem(
            name: 'Two-Phase Locking Protocol (2PL)',
            formula: '''Growing Phase: Acquire locks, release none.\nLock Point: Point where last lock is acquired.\nShrinking Phase: Release locks, acquire none.''', explanation: 'Guarantees conflict serializability but does not prevent deadlocks.',
          ),
          _FormulaItem(
            name: 'Strict 2PL',
            formula: '''Follows 2PL rules, and holds all exclusive (write) locks until commit/abort.''', explanation: 'Guarantees serializability and ensures schedules are recoverable and cascade-free.',
          ),
          _FormulaItem(
            name: 'Timestamp Ordering Concurrency Rules',
            formula: '''Read(Q) by T: Reject & Rollback if TS(T) < Write_TS(Q)\nWrite(Q) by T: Reject & Rollback if TS(T) < Read_TS(Q) or TS(T) < Write_TS(Q)''', explanation: 'Orders transactions based on their start timestamps.',
          ),
        ],
      ),
    ]);
  }

  Widget _buildAITab(BuildContext context) {
    return _buildSubjectTab(context, [
      _buildFormulaCard(
        context,
        title: 'Logic & Equivalences',
        items: [
          _FormulaItem(
            name: 'Logical Connectives Equivalences',
            formula: '''Implication: P → Q  ≡  ¬P ∨ Q\nContrapositive: P → Q  ≡  ¬Q → ¬P\nBiconditional: P ↔ Q  ≡  (P → Q) ∧ (Q → P)  ≡  (¬P ∨ Q) ∧ (¬Q ∨ P)''', explanation: 'Converts implications to disjunctions/conjunctions for normal form conversions.',
          ),
          _FormulaItem(
            name: 'De Morgan\'s Logic Equivalences',
            formula: '''¬(P ∧ Q) ≡ ¬P ∨ ¬Q\n¬(P ∨ Q) ≡ ¬P ∧ ¬Q''', explanation: 'Flips operators when distributing negation.',
          ),
          _FormulaItem(
            name: 'Distributive Laws in Logic',
            formula: '''P ∧ (Q ∨ R) ≡ (P ∧ Q) ∨ (P ∧ R)\nP ∨ (Q ∧ R) ≡ (P ∨ Q) ∧ (P ∨ R)''', explanation: 'Distributes AND/OR over each other.',
          ),
          _FormulaItem(
            name: 'First-Order Logic Quantifiers Negation',
            formula: '''¬( ∀x P(x) ) ≡ ∃x ¬P(x)\n¬( ∃x P(x) ) ≡ ∀x ¬P(x)''', explanation: 'Flips quantifiers when negated.',
          ),
          _FormulaItem(
            name: 'Resolution Inference Rule',
            formula: '''P ∨ Q  ,  ¬P ∨ R   ⊢   Q ∨ R''', explanation: 'Resolvent clause Q ∨ R is logically derived from unit clauses.',
          ),
        ],
      ),
      _buildFormulaCard(
        context,
        title: 'Informed & Uninformed Search',
        items: [
          _FormulaItem(
            name: 'A* Search Evaluation Function',
            formula: '''f(n) = g(n) + h(n)''', explanation: 'g(n): exact cost from start to node n. h(n): heuristic estimate of cost from n to goal.',
          ),
          _FormulaItem(
            name: 'Heuristic Admissibility Condition',
            formula: '''h(n) ≤ h*(n)   for all nodes n''', explanation: 'h*(n): true cost to reach goal. An admissible heuristic never overestimates the path cost.',
          ),
          _FormulaItem(
            name: 'Heuristic Consistency (Monotonicity) Condition',
            formula: '''h(n) ≤ c(n, a, n\') + h(n\')   for all successor nodes n\' generated by action a''', explanation: 'Ensures f(n) is non-decreasing along any path. Consistent heuristics are always admissible.',
          ),
        ],
      ),
      _buildFormulaCard(
        context,
        title: 'Bayesian Networks',
        items: [
          _FormulaItem(
            name: 'Joint Probability Factorization',
            formula: '''P(X₁, X₂, ..., X_n) = Π_{i=1}^n P( X_i | Parents(X_i) )''', explanation: 'Exploits conditional independence properties represented by the directed acyclic graph (DAG).',
          ),
          _FormulaItem(
            name: 'd-Separation Conditional Independence Rules',
            formula: '''1. Cascade: X -> Y -> Z. Blocked if Y is observed.\n2. Common Cause: X <- Y -> Z. Blocked if Y is observed.\n3. Common Effect: X -> Y <- Z. Blocked if NEITHER Y nor descendants are observed.''', explanation: 'd-separation determines if variables X and Z are conditionally independent given observed set Y.',
          ),
        ],
      ),
    ]);
  }

  Widget _buildDSATab(BuildContext context) {
    return _buildSubjectTab(context, [
      _buildFormulaCard(
        context,
        title: 'Asymptotic Analysis & Complexities',
        items: [
          _FormulaItem(
            name: 'Asymptotic Definitions',
            formula: '''Big-O: f(n) = O(g(n)) iff f(n) ≤ c * g(n)  for c, n₀ > 0, n ≥ n₀\nBig-Omega: f(n) = Ω(g(n)) iff f(n) ≥ c * g(n)  for c, n₀ > 0, n ≥ n₀\nBig-Theta: f(n) = Θ(g(n)) iff f(n) = O(g(n)) and f(n) = Ω(g(n))''', explanation: 'Upper bound, lower bound, and tight bound respectively.',
          ),
          _FormulaItem(
            name: 'Asymptotic Growth Order Hierarchy',
            formula: '''1  <  log n  <  √n  <  n  <  n log n  <  n²  <  n³  <  2^n  <  n!''', explanation: 'Ascending order of growth rate (efficiency decreases from left to right).',
          ),
          _FormulaItem(
            name: 'Master Theorem for Recurrences',
            formula: '''T(n) = a * T(n/b) + f(n)   where f(n) = Θ(n^k * log^p n)\nCase 1: log_b(a) > k  =>  T(n) = Θ(n^(log_b a))\nCase 2: log_b(a) = k  =>  T(n) = Θ(n^k * log^(p+1) n)\nCase 3: log_b(a) < k  =>  T(n) = Θ(f(n))   (if regularity holds)''', explanation: 'Used to solve divide-and-conquer recurrence relations.',
          ),
        ],
      ),
      _buildFormulaCard(
        context,
        title: 'Sorting Algorithms',
        items: [
          _FormulaItem(
            name: 'Common Sorting Time & Space Complexities',
            formula: '''Bubble Sort:    O(n²) [Worst/Avg]   | Space: O(1)    | Stable\nInsertion Sort: O(n²) [Worst/Avg]   | Space: O(1)    | Stable\nMerge Sort:     O(n log n)          | Space: O(n)    | Stable\nQuick Sort:     O(n log n) [Avg]    | Space: O(log n)| Unstable\nHeap Sort:      O(n log n)          | Space: O(1)    | Unstable''', explanation: 'Insertion Sort is O(n) when already sorted. Quick Sort worst case is O(n²).',
          ),
        ],
      ),
      _buildFormulaCard(
        context,
        title: 'Tree & Graph Data Structures',
        items: [
          _FormulaItem(
            name: 'Binary Search Tree & AVL Tree Properties',
            formula: '''BST Search/Insert: O(h)  where h is height (worst case O(n))\nAVL Balance Factor: BF(node) = Height(Left_Subtree) - Height(Right_Subtree) ∈ {-1, 0, 1}\nAVL Max Height: h < 1.44 * log₂(n)''', explanation: 'AVL is self-balancing BST which maintains O(log n) search/insert time.',
          ),
          _FormulaItem(
            name: 'Binary Heap Operations',
            formula: '''Insert / Extract Min: O(log n)\nGet Min (Peeking):   O(1)\nHeapify Array:       O(n)   [Build Heap]''', explanation: 'A binary heap is a complete binary tree satisfying the heap property.',
          ),
          _FormulaItem(
            name: 'Graph Algorithms Complexity',
            formula: '''BFS & DFS:     O(V + E)   | Space: O(V)\nDijkstra:      O( (V + E) log V )   (with binary heap)\nBellman-Ford:  O(V * E)   (handles negative edge weights)\nPrim & Kruskal: O(E log V)   (Minimum Spanning Tree)''', explanation: 'V is number of vertices. E is number of edges.',
          ),
        ],
      ),
      _buildFormulaCard(
        context,
        title: 'Python Libraries (NumPy & Pandas)',
        items: [
          _FormulaItem(
            name: 'NumPy Vectorized Algebra',
            formula: '''Matrix Multiplication: A @ B   or   np.dot(A, B)\nInverse:              np.linalg.inv(A)\nEigenvalues/vectors:  evals, evecs = np.linalg.eig(A)\nDeterminant:          np.linalg.det(A)''', explanation: 'Compiled vector libraries bypassing slow python loops.',
          ),
          _FormulaItem(
            name: 'Pandas Data Handling & Aggregations',
            formula: '''Label Indexing:       df.loc[row_labels, col_labels]\nInteger Indexing:     df.iloc[row_indices, col_indices]\nGroup & Aggregate:    df.groupby(\'col\')[\'val\'].agg([\'mean\', \'std\'])\nDataFrame Merge/Join:  pd.merge(df1, df2, on=\'key_col\', how=\'inner\')''', explanation: 'Used for tabular structured data analysis.',
          ),
        ],
      ),
    ]);
  }

  Widget _buildAptitudeTab(BuildContext context) {
    return _buildSubjectTab(context, [
      _buildFormulaCard(
        context,
        title: 'Percentages & Profit/Loss',
        items: [
          _FormulaItem(
            name: 'Percentage Change',
            formula: '''% Change = [ (Final - Initial) / Initial ] * 100\nSuccessive % Changes A and B: Net % = A + B + (A*B)/100''', explanation: 'Use positive for increase, negative for decrease.',
          ),
          _FormulaItem(
            name: 'Profit & Loss Basics',
            formula: '''Profit = SP - CP\nLoss = CP - SP\nProfit % = (Profit / CP) * 100\nLoss % = (Loss / CP) * 100''', explanation: 'All percentages are calculated on Cost Price (CP) unless stated otherwise.',
          ),
          _FormulaItem(
            name: 'Discount & Marked Price',
            formula: '''SP = MP - Discount\nDiscount % = (Discount / MP) * 100\nCP = MP * (100 - Discount%) / (100 + Profit%)''', explanation: 'Discount is always calculated on Marked Price (MP).',
          ),
          _FormulaItem(
            name: 'Simple & Compound Interest',
            formula: '''SI = (P * R * T) / 100\nAmount (CI) = P * (1 + R/100)^T\nCI = Amount - P''', explanation: 'P: Principal, R: Rate per annum, T: Time in years.',
          ),
        ],
      ),
      _buildFormulaCard(
        context,
        title: 'Combinatorics',
        items: [
          _FormulaItem(
            name: 'Permutations & Combinations',
            formula: '''Permutations: nPr = n! / (n - r)!\nCombinations: nCr = n! / ( r! * (n - r)! )\nCircular Permutations: (n - 1)!\nArrangements with identical items: n! / ( n₁! * n₂! * ... * n_k! )''', explanation: 'Combinations represents selection. Permutations represents arrangement.',
          ),
          _FormulaItem(
            name: 'Handshake Formula',
            formula: '''Handshakes = n * (n - 1) / 2''', explanation: 'Equivalent to nC2. For n people shaking hands with everyone else once.',
          ),
        ],
      ),
      _buildFormulaCard(
        context,
        title: 'Mathematical Progressions',
        items: [
          _FormulaItem(
            name: 'Arithmetic Progression (AP)',
            formula: '''n-th term: a_n = a + (n - 1)*d\nSum of n terms: S_n = (n/2) * [ 2a + (n - 1)*d ] = (n/2) * (a + a_n)''', explanation: 'd is common difference, a is first term.',
          ),
          _FormulaItem(
            name: 'Geometric Progression (GP)',
            formula: '''n-th term: a_n = a * r^(n - 1)\nSum of n terms: S_n = a * (1 - r^n) / (1 - r)   [r != 1]\nInfinite Sum:   S_inf = a / (1 - r)   [for |r| < 1]''', explanation: 'r is common ratio, a is first term.',
          ),
          _FormulaItem(
            name: 'Means Inequality Relation',
            formula: '''Arithmetic Mean (AM) ≥ Geometric Mean (GM) ≥ Harmonic Mean (HM)\nAM = (a + b) / 2\nGM = √(a * b)\nHM = (2 * a * b) / (a + b) = GM² / AM''', explanation: 'Holds for positive real numbers. Equality holds iff a = b.',
          ),
        ],
      ),
      _buildFormulaCard(
        context,
        title: 'Speed, Time & Work',
        items: [
          _FormulaItem(
            name: 'Relative Speed',
            formula: '''Same Direction:       S_rel = |S₁ - S₂|\nOpposite Direction:   S_rel = S₁ + S₂\nAverage Speed:        Total Distance / Total Time\nEqual Distance Segs:  Avg Speed = ( 2 * S₁ * S₂ ) / ( S₁ + S₂ )''', explanation: 'Average speed of equal distance segments is the harmonic mean of their speeds.',
          ),
          _FormulaItem(
            name: 'Work Rate Formula',
            formula: '''Work done together in D_both days:\n  D_both = ( D₁ * D₂ ) / ( D₁ + D₂ )   days\nMen-Days-Hours equivalence: ( M₁ * D₁ * H₁ ) / W₁ = ( M₂ * D₂ * H₂ ) / W₂''', explanation: 'M: number of men, D: days, H: hours per day, W: units of work.',
          ),
        ],
      ),
      _buildFormulaCard(
        context,
        title: 'Logical Reasoning & Geometry',
        items: [
          _FormulaItem(
            name: 'Clocks',
            formula: '''Angle = | 30*H - 5.5*M |\nCoincide: 11 times in 12 hours\nOpposite: 11 times in 12 hours\nRight Angle: 22 times in 12 hours''', explanation: 'H is hours, M is minutes. 5.5 is relative speed of minute and hour hands.',
          ),
          _FormulaItem(
            name: '2D & 3D Mensuration Formulas',
            formula: '''Circle:       Area = π * r²  |  Circumference = 2 * π * r\nCylinder:     Volume = π * r² * h  |  TSA = 2 * π * r * (r + h)\nCone:         Volume = (1/3)*π * r² * h  |  Curved Surface Area = π * r * l\nSphere:       Volume = (4/3)*π * r³  |  Surface Area = 4 * π * r²''', explanation: 'l is slant height = √(r² + h²). TSA: Total Surface Area.',
          ),
          _FormulaItem(
            name: 'Triangle Area (Heron\'s Formula)',
            formula: '''Area = √( s * (s - a) * (s - b) * (s - c) )\nwhere semi-perimeter s = (a + b + c) / 2''', explanation: 'Used to calculate area of any triangle when all three sides a, b, c are known.',
          ),
        ],
      ),
    ]);
  }
  Widget _buildCSITDSATab(BuildContext context) {
    return _buildSubjectTab(context, [
      _buildFormulaCard(
        context,
        title: 'Arrays & Strings',
        items: [
          _FormulaItem(name: '1D Array Address', formula: '''Loc(A[i]) = Base + w * (i - LB)''', explanation: 'Address calculation for 1D Array. w = word size.'),
          _FormulaItem(name: 'Row Major 2D Array', formula: '''Loc(A[i][j]) = Base + w * [N * (i - Lr) + (j - Lc)]''', explanation: 'N is number of columns.'),
          _FormulaItem(name: 'Column Major 2D Array', formula: '''Loc(A[i][j]) = Base + w * [M * (j - Lc) + (i - Lr)]''', explanation: 'M is number of rows.'),
          _FormulaItem(name: 'String Length', formula: '''Length = Index of NULL (\\0) character''', explanation: 'Strings are character arrays terminated by NULL.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Stacks & Queues',
        items: [
          _FormulaItem(name: 'Stack Operations', formula: '''Push: Top = Top + 1; A[Top] = val\nPop: val = A[Top]; Top = Top - 1''', explanation: 'LIFO data structure.'),
          _FormulaItem(name: 'Queue Operations', formula: '''Enqueue: Rear = Rear + 1; A[Rear] = val\nDequeue: val = A[Front]; Front = Front + 1''', explanation: 'FIFO data structure.'),
          _FormulaItem(name: 'Circular Queue', formula: '''Next pos = (Current + 1) % Size\nFull: (Rear + 1) % Size == Front''', explanation: 'Efficient memory utilization.'),
          _FormulaItem(name: 'Infix to Postfix', formula: '''Operands to output, Operators to Stack based on precedence.''', explanation: 'Standard expression conversion.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Trees & Binary Search Trees',
        items: [
          _FormulaItem(name: 'Max Nodes in Binary Tree', formula: '''Max Nodes at level L = 2^L\nMax Nodes total (height H) = 2^(H+1) - 1''', explanation: 'Level starts at 0.'),
          _FormulaItem(name: 'Leaf Nodes', formula: '''Leaves (L) = Internal Nodes with 2 children (I2) + 1\nL = I2 + 1''', explanation: 'Strictly binary tree property.'),
          _FormulaItem(name: 'BST Search', formula: '''If x == root, return. If x < root, search left. Else search right.''', explanation: 'O(h) time complexity.'),
          _FormulaItem(name: 'Tree Traversals', formula: '''Inorder: L N R\nPreorder: N L R\nPostorder: L R N''', explanation: 'N = Node, L = Left, R = Right.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Heaps & Graphs',
        items: [
          _FormulaItem(name: 'Min Heap Property', formula: '''A[Parent(i)] <= A[i]''', explanation: 'Root is minimum element.'),
          _FormulaItem(name: 'Max Heap Property', formula: '''A[Parent(i)] >= A[i]''', explanation: 'Root is maximum element.'),
          _FormulaItem(name: 'Graph Representation', formula: '''Adjacency Matrix: V x V space, O(1) edge query.\nAdjacency List: V + E space, O(Degree) edge query.''', explanation: 'Space vs Time tradeoff.'),
          _FormulaItem(name: 'Graph Traversals', formula: '''BFS uses Queue.\nDFS uses Stack.''', explanation: 'Fundamental graph exploration.'),
        ]
      )
    ]);
  }

  Widget _buildCSITAlgorithmsTab(BuildContext context) {
    return _buildSubjectTab(context, [
      _buildFormulaCard(
        context,
        title: 'Asymptotic Analysis',
        items: [
          _FormulaItem(name: 'Big-O (Upper Bound)', formula: '''f(n) = O(g(n)) iff f(n) <= c * g(n) for n >= n0''', explanation: 'Worst case complexity.'),
          _FormulaItem(name: 'Omega (Lower Bound)', formula: '''f(n) = Ω(g(n)) iff f(n) >= c * g(n) for n >= n0''', explanation: 'Best case complexity.'),
          _FormulaItem(name: 'Theta (Tight Bound)', formula: '''f(n) = Θ(g(n)) iff c1*g(n) <= f(n) <= c2*g(n)''', explanation: 'Average case complexity.'),
          _FormulaItem(name: 'Master Theorem', formula: '''T(n) = aT(n/b) + f(n)\nCompare n^(log_b(a)) with f(n)''', explanation: 'For divide and conquer recurrences.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Sorting Algorithms',
        items: [
          _FormulaItem(name: 'Bubble/Insertion/Selection', formula: '''Worst/Avg Case: O(n^2)\nBest Case (Insertion): O(n)''', explanation: 'Basic comparison sorts.'),
          _FormulaItem(name: 'Merge Sort', formula: '''T(n) = 2T(n/2) + O(n) => O(n log n)''', explanation: 'Stable, Not in-place. Divide & Conquer.'),
          _FormulaItem(name: 'Quick Sort', formula: '''Worst: O(n^2)\nAvg/Best: O(n log n)''', explanation: 'In-place, Not stable. Pivot based partitioning.'),
          _FormulaItem(name: 'Heap Sort', formula: '''Build Heap: O(n)\nExtract Max n times: O(n log n)\nTotal: O(n log n)''', explanation: 'In-place, Not stable.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Graph Algorithms',
        items: [
          _FormulaItem(name: 'Dijkstra (Shortest Path)', formula: '''Time: O((V+E)log V) with Min-Heap''', explanation: 'Single source shortest path. No negative edges.'),
          _FormulaItem(name: 'Bellman-Ford', formula: '''Time: O(VE)''', explanation: 'Single source shortest path. Handles negative edges.'),
          _FormulaItem(name: 'Floyd-Warshall', formula: '''Time: O(V^3)''', explanation: 'All-pairs shortest path. Dynamic Programming.'),
          _FormulaItem(name: 'Kruskal (MST)', formula: '''Time: O(E log E)''', explanation: 'Greedy. Sorts edges. Uses Disjoint Sets.'),
          _FormulaItem(name: 'Prim (MST)', formula: '''Time: O((V+E)log V)''', explanation: 'Greedy. Grows tree from arbitrary vertex.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Dynamic Programming & Greedy',
        items: [
          _FormulaItem(name: '0/1 Knapsack', formula: '''DP[i][w] = max(DP[i-1][w], val[i] + DP[i-1][w-wt[i]])''', explanation: 'Dynamic Programming approach. Time O(nW).'),
          _FormulaItem(name: 'Fractional Knapsack', formula: '''Sort by Value/Weight ratio''', explanation: 'Greedy approach. Time O(n log n).'),
          _FormulaItem(name: 'Longest Common Subsequence', formula: '''If matching: 1 + LCS(i-1, j-1)\nElse: max(LCS(i-1, j), LCS(i, j-1))''', explanation: 'DP Time O(mn).'),
          _FormulaItem(name: 'Matrix Chain Multiplication', formula: '''M[i,j] = min(M[i,k] + M[k+1,j] + p_{i-1}p_kp_j)''', explanation: 'DP Time O(n^3).'),
        ]
      )
    ]);
  }

  Widget _buildCSITDBMSTab(BuildContext context) {
    return _buildSubjectTab(context, [
      _buildFormulaCard(
        context,
        title: 'Relational Model & Algebra',
        items: [
          _FormulaItem(name: 'Super Key', formula: '''Set of attributes that uniquely identifies a tuple.''', explanation: 'May contain redundant attributes.'),
          _FormulaItem(name: 'Candidate Key', formula: '''Minimal Super Key.''', explanation: 'No redundant attributes.'),
          _FormulaItem(name: 'Selection (σ)', formula: '''σ_condition(Relation)''', explanation: 'Selects rows.'),
          _FormulaItem(name: 'Projection (π)', formula: '''π_attributes(Relation)''', explanation: 'Selects columns.'),
          _FormulaItem(name: 'Cartesian Product (×)', formula: '''R × S''', explanation: 'Combines every tuple of R with every tuple of S.'),
          _FormulaItem(name: 'Natural Join (⨝)', formula: '''R ⨝ S''', explanation: 'Join over common attributes. Eliminates duplicate columns.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Normalization',
        items: [
          _FormulaItem(name: '1NF', formula: '''Domain of each attribute is atomic.''', explanation: 'No multi-valued attributes.'),
          _FormulaItem(name: '2NF', formula: '''1NF + No partial dependencies.''', explanation: 'Non-prime attribute fully functionally dependent on Candidate Key.'),
          _FormulaItem(name: '3NF', formula: '''2NF + No transitive dependencies.''', explanation: 'For X -> Y, X is Super Key OR Y is prime attribute.'),
          _FormulaItem(name: 'BCNF', formula: '''For every non-trivial FD X -> Y, X must be a Super Key.''', explanation: 'Stricter than 3NF.'),
          _FormulaItem(name: 'Lossless Join', formula: '''(R1 ∩ R2) -> R1 OR (R1 ∩ R2) -> R2''', explanation: 'Intersection must be a key for at least one decomposed relation.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Transactions & Concurrency',
        items: [
          _FormulaItem(name: 'ACID Properties', formula: '''Atomicity, Consistency, Isolation, Durability''', explanation: 'Fundamental transaction requirements.'),
          _FormulaItem(name: 'Conflict Serializability', formula: '''Precedence graph has no cycles.''', explanation: 'Ensures equivalent to some serial schedule.'),
          _FormulaItem(name: 'Two-Phase Locking (2PL)', formula: '''Phase 1: Growing (Acquire locks)\nPhase 2: Shrinking (Release locks)''', explanation: 'Guarantees conflict serializability. May cause deadlock.'),
          _FormulaItem(name: 'Timestamp Ordering', formula: '''Transaction T_i gets timestamp TS(T_i).\nRead/Write operations ordered by TS.''', explanation: 'Prevents deadlocks. Ensures serializability.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Indexing & B/B+ Trees',
        items: [
          _FormulaItem(name: 'Primary Index', formula: '''Ordered file, index on Key field.''', explanation: 'Sparse index.'),
          _FormulaItem(name: 'Clustering Index', formula: '''Ordered file, index on Non-Key field.''', explanation: 'Sparse index.'),
          _FormulaItem(name: 'Secondary Index', formula: '''Unordered file, index on Key/Non-Key.''', explanation: 'Dense index.'),
          _FormulaItem(name: 'B-Tree Node Capacity', formula: '''Order m: Each internal node has at most m children, min ceil(m/2) children.''', explanation: 'Balanced search tree.'),
          _FormulaItem(name: 'B+ Tree Structure', formula: '''Data pointers only in leaf nodes.\nInternal nodes only have search keys.''', explanation: 'Higher fan-out, faster search.'),
        ]
      )
    ]);
  }



}

class _FormulaDisplayBox extends StatefulWidget {
  final String formula;
  const _FormulaDisplayBox({required this.formula});

  @override
  State<_FormulaDisplayBox> createState() => _FormulaDisplayBoxState();
}

class _FormulaDisplayBoxState extends State<_FormulaDisplayBox> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NeuContainer(
      isRecessed: true,
      borderRadius: 12,
      padding: const EdgeInsets.all(12),
      child: RawScrollbar(
        controller: _scrollController,
        thumbColor: AppTheme.accentPurple.withValues(alpha: 0.35),
        radius: const Radius.circular(4),
        thickness: 4,
        thumbVisibility: true,
        child: SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 6.0),
            child: Text(
              widget.formula,
              style: AppTheme.monospaceStyle(fontSize: 12.0, color: context.textColor),
              softWrap: false,
            ),
          ),
        ),
      ),
    );
  }
}

class _FormulaItem {
  final String name;
  final String formula;
  final String explanation;

  _FormulaItem({
    required this.name,
    required this.formula,
    this.explanation = '',
  });
}

class _FormulaCardGroup extends StatelessWidget {
  final String title;
  final List<_FormulaItem> items;
  final void Function(BuildContext, String, String) onCopy;

  const _FormulaCardGroup({
    required this.title,
    required this.items,
    required this.onCopy,
  });

  @override
  Widget build(BuildContext context) {
    return NeuContainer(
      margin: const EdgeInsets.only(bottom: 14),
      borderRadius: 20,
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 14,
                decoration: BoxDecoration(
                  color: AppTheme.accentPurple,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                title.toUpperCase(),
                style: GoogleFonts.outfit(
                  color: AppTheme.accentPurple,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ...items.asMap().entries.map((entry) {
            final idx = entry.key;
            final item = entry.value;
            final isLast = idx == items.length - 1;

            return Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          item.name,
                          style: GoogleFonts.outfit(
                            color: context.textColor,
                            fontSize: 13.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.copy_rounded, size: 15, color: AppTheme.accentPurple),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        tooltip: 'Copy Formula',
                        onPressed: () => onCopy(context, item.formula, item.name),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  _FormulaDisplayBox(formula: item.formula),
                  if (item.explanation.isNotEmpty && item.explanation.length <= 50) ...[
                    const SizedBox(height: 6),
                    Text(
                      item.explanation,
                      style: GoogleFonts.outfit(
                        color: context.textSecondaryColor.withValues(alpha: 0.8),
                        fontSize: 11,
                        height: 1.3,
                      ),
                    ),
                  ],
                  if (!isLast) ...[
                    const SizedBox(height: 14),
                    Divider(
                      height: 1,
                      thickness: 0.5,
                      color: context.isDarkMode
                          ? Colors.white.withValues(alpha: 0.06)
                          : Colors.black.withValues(alpha: 0.06),
                    ),
                  ],
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
