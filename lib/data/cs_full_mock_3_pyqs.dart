// AUTO-GENERATED GATE CS MOCK 3 QUESTIONS (ULTRA-TOUGH FACULTY LEVEL)
import '../models/models.dart';

final List<PYQ> csFullMock3Questions = [
  PYQ(
    id: 'CS_MOCK3_Q01',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Verbal Ability''',
    questionText: '''Choose the word that is most nearly OPPOSITE in meaning to the capitalized word in the given sentence:
"The chief software architect maintained a TRACTABLE disposition during the tense outage post-mortem, readily accepting critical peer feedback and adjusting the migration roadmap."''',
    options: ['''Docile and compliant''', '''Intransigent and obstinate''', '''Malleable and adaptable''', '''Equivocal and evasive'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: ''''Tractable' means easily managed, pliable, or willing to comply with guidance. Its antonym is 'intransigent' or 'obstinate' (stubbornly refusing to compromise). Hence, Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q02',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Critical Reasoning''',
    questionText: '''Consider the following statements:
1. If an operating system kernel is formally verified, then it does not suffer from buffer overflow vulnerabilities.
2. Kernel SeL4 is formally verified.
Which of the following is a logically valid conclusion?''',
    options: ['''Kernel SeL4 does not suffer from buffer overflow vulnerabilities.''', '''Kernel SeL4 contains zero software bugs of any kind.''', '''Any operating system kernel that does not suffer from buffer overflow vulnerabilities must be formally verified.''', '''If an operating system kernel is not formally verified, it must suffer from buffer overflow vulnerabilities.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Let P = 'kernel is formally verified' and Q = 'kernel does not suffer from buffer overflow vulnerabilities'.
Premise 1: P → Q.
Premise 2: P is true for SeL4.
By Modus Ponens, Q must hold for SeL4 (it does not suffer from buffer overflow vulnerabilities). The converse (Q → P) and inverse (¬P → ¬Q) are logical fallacies. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q03',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude''',
    questionText: '''In how many distinct ways can the letters of the word 'SYSTEM' be arranged such that the two 'S's are never adjacent to each other?''',
    options: ['''180''', '''240''', '''300''', '''360'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The word SYSTEM has 6 letters: S, Y, S, T, E, M (where 'S' appears twice, and Y, T, E, M appear once each).
Total distinct permutations without restrictions = 6! / 2! = 720 / 2 = 360.
Permutations where the two 'S's are adjacent: treat 'SS' as a single block. Now we have 5 items: (SS), Y, T, E, M.
Number of arrangements with adjacent 'S's = 5! = 120.
Permutations where the two 'S's are NEVER adjacent = Total - Adjacent = 360 - 120 = 240.
Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q04',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Spatial Aptitude''',
    questionText: '''A solid right circular cylinder with radius R = 3 cm and height H = 4 cm is sliced along a flat plane passing through its central axis into two identical semicircular halves. What is the total increase in the surface area of the two resulting pieces compared to the original cylinder?''',
    options: ['''24 cm²''', '''48 cm²''', '''36 cm²''', '''12π cm²'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''When the cylinder is sliced along its axial plane, two new flat rectangular cross-sectional faces are exposed, one on each half.
Each exposed rectangular face has:
- Width = Diameter = 2R = 2 * 3 = 6 cm.
- Height = H = 4 cm.
Area of one new face = 6 * 4 = 24 cm².
Since both halves expose one such face, the total increase in surface area = 2 * 24 = 48 cm².
Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q05',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Verbal Ability''',
    questionText: '''Fill in the blank with the most grammatically and contextually appropriate pair of words:
"The senior network engineer ______ that the packet routing anomalies were ______ to transient fiber degradation rather than a malicious distributed attack."''',
    options: ['''concluded, attributable''', '''concluding, attribute''', '''conclude, attributed''', '''concludes, attribution'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The past-tense verb 'concluded' pairs with the predicate adjective 'attributable' ('attributable to' is the standard idiomatic construction meaning caused by or resulting from). Option A is grammatically and syntactically flawless.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q06',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Analytical Reading Comprehension''',
    questionText: '''Read the following passage carefully:
"In Byzantine Fault Tolerant (BFT) consensus algorithms operating over an asynchronous network with n nodes, up to f Byzantine (arbitrarily malicious or faulty) nodes can be tolerated only if n ≥ 3f + 1. The fundamental intuition arises from quorum intersection: to make progress, a non-faulty node must decide after receiving responses from n - f nodes, because f faulty nodes might remain completely silent. Among those n - f responses, at most f could originate from Byzantine nodes actively transmitting conflicting messages. To ensure that honest nodes constitute a strict majority in every intersection, (n - f) - f must be strictly greater than f, directly yielding n > 3f, or n ≥ 3f + 1 for integer nodes."

Based strictly on the passage, why must a non-faulty node be prepared to decide based on receiving only n - f responses?''',
    options: ['''Because Byzantine nodes always transmit cryptographically corrupt signatures that are immediately dropped.''', '''Because up to f faulty nodes may fail-stop and never send any messages, preventing the system from waiting for all n responses without risking permanent deadlock.''', '''Because a majority quorum in any network requires fewer than half of the total nodes.''', '''Because asynchronous networks automatically drop at least f packets during peak transmission.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The passage explicitly provides the rationale: 'a non-faulty node must decide after receiving responses from n - f nodes, because f faulty nodes might remain completely silent.' If a protocol waited for more than n - f nodes, and f nodes crashed silently, the system would stall indefinitely (losing liveness). Hence, Option B is directly and validly inferred.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q07',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude / Probability''',
    questionText: '''An urn contains 4 red balls and 6 black balls. Two balls are drawn uniformly at random without replacement. If it is known that at least one of the drawn balls is red, what is the conditional probability that both drawn balls are red?''',
    options: ['''1/5''', '''2/11''', '''1/6''', '''6/25'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Total balls = 10 (4 Red, 6 Black).
Total ways to choose 2 balls out of 10 = C(10, 2) = 45.
Event B: 'Both balls are black'. Number of ways = C(6, 2) = 15.
Event A: 'At least one ball is red' = Complement of both black.
Number of outcomes in A = Total - Both Black = 45 - 15 = 30.
Event C: 'Both balls are red'. Number of ways = C(4, 2) = 6.
Notice that C is a subset of A (both red implies at least one red).
Conditional probability Pr(Both Red | At least one Red) = |C| / |A| = 6 / 30 = 1/5.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q08',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Time, Speed & Distance''',
    questionText: '''Two automated testing drones D1 and D2 travel along a straight transmission line of length 120 km. D1 starts from station P heading towards station Q at a constant speed of 40 km/h. Thirty minutes later, D2 starts from station Q heading towards station P at a constant speed of 60 km/h. How many kilometers from station P will the two drones cross each other?''',
    options: ['''56 km''', '''60 km''', '''64 km''', '''70 km'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''1. In the first 30 minutes (0.5 hours), D1 travels alone:
   Distance covered by D1 = 40 km/h * 0.5 h = 20 km.
2. Remaining distance between D1 and D2 at the moment D2 starts = 120 - 20 = 100 km.
3. Both drones now travel towards each other with relative speed:
   v_rel = 40 + 60 = 100 km/h.
4. Time until they meet = Remaining distance / v_rel = 100 km / 100 km/h = 1 hour.
5. In this 1 hour, D1 covers an additional distance = 40 km/h * 1 h = 40 km.
6. Total distance from station P where they cross = 20 km + 40 km = 60 km.
Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q09',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude / Progressions''',
    questionText: '''Consider the infinite arithmetic-geometric series:
S = 1/3 + 2/9 + 3/27 + 4/81 + ... + n/(3^n) + ...
What is the exact sum S of this series?''',
    options: ['''1/2''', '''3/4''', '''2/3''', '''1'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Let S = ∑_{n=1}^∞ n / (3^n).
Multiply S by 1/3:
(1/3) S = 1/9 + 2/27 + 3/81 + ...
Subtract the second equation from the first:
S - (1/3) S = 1/3 + (2/9 - 1/9) + (3/27 - 2/27) + (4/81 - 3/81) + ...
(2/3) S = 1/3 + 1/9 + 1/27 + 1/81 + ...
The right side is an infinite geometric progression with first term a = 1/3 and common ratio r = 1/3:
Sum of GP = (1/3) / (1 - 1/3) = (1/3) / (2/3) = 1/2.
So (2/3) S = 1/2 ⇒ S = (1/2) * (3/2) = 3/4.
Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q10',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Graph & Network Logic''',
    questionText: '''A compiler dependency DAG consists of four tasks {T1, T2, T3, T4} with directed edges: (T1 → T2), (T1 → T3), (T2 → T4), and (T3 → T4). How many valid topological execution orderings of the four tasks are possible?''',
    options: ['''1''', '''2''', '''3''', '''4'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Examining the prerequisites:
- T1 has in-degree 0, so T1 MUST execute first.
- T4 has in-degree 2 with dependencies on both T2 and T3, so T4 MUST execute last.
- Between T2 and T3, there is no directed edge connecting them; they can execute in either relative order.
Thus, the only valid topological orderings are:
1. T1, T2, T3, T4
2. T1, T3, T2, T4
Total valid orderings = 2. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q11',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Predicate Logic''',
    questionText: '''Which of the following first-order predicate logic statements is a VALID formula (tautology) for any non-empty domain D and arbitrary predicate P(x)?''',
    options: ['''(∀x P(x)) → (∃x P(x))''', '''(∃x P(x)) → (∀x P(x))''', '''(∀x P(x)) ↔ (∃x P(x))''', '''¬(∀x P(x)) → (∀x ¬P(x))'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''In any non-empty domain D, if every element x satisfies P(x), there exists at least one element in D that satisfies P(x). Therefore, (∀x P(x)) → (∃x P(x)) is universally valid. In contrast, ∃x P(x) does not imply ∀x P(x), and ¬(∀x P(x)) is equivalent to ∃x ¬P(x), which does not imply ∀x ¬P(x). Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q12',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Block Matrices & Determinants''',
    questionText: '''Consider a 4 x 4 block upper triangular matrix M partitioned as:
M = 
[[A, B],
 [0, C]]
where A is a 2 x 2 matrix with det(A) = 5, C is a 2 x 2 matrix with det(C) = -3, and B is an arbitrary 2 x 2 matrix. What is the determinant of matrix M?''',
    options: ['''-15''', '''15''', '''2''', '''-2'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''For any block triangular matrix where the diagonal blocks are square matrices A and C, the determinant is the product of the determinants of the diagonal blocks: det(M) = det(A) * det(C).
Here, det(A) = 5 and det(C) = -3.
Therefore, det(M) = 5 * (-3) = -15, regardless of the entries in B. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q13',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Rolle's Theorem & Roots''',
    questionText: '''Consider the polynomial function f(x) = x³ - 3x + 1 over the real interval [-2, 2]. What is the total number of distinct real values c in the open interval (-2, 2) that satisfy f'(c) = 0? (Answer in integer)''',
    options: [],
    correctAnswer: '''2''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Differentiating f(x):
f'(x) = 3x² - 3 = 3(x² - 1) = 3(x - 1)(x + 1).
Setting f'(c) = 0:
3(c - 1)(c + 1) = 0 ⇒ c = 1 or c = -1.
Both c = -1 and c = 1 lie strictly inside the open interval (-2, 2).
Thus, there are exactly 2 distinct real values in (-2, 2) where the derivative vanishes.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q14',
    year: 2026,
    subject: '''Probability and Statistics''',
    topic: '''Poisson Distribution''',
    questionText: '''Incoming requests to a cloud web service follow a Poisson process with an average rate of 2 requests per millisecond. What is the variance of the number of requests arriving in a 3-millisecond time window? (Answer in integer)''',
    options: [],
    correctAnswer: '''6''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''For a Poisson process with arrival rate λ = 2 requests/ms, the number of arrivals X in a time interval of duration t = 3 ms is a Poisson random variable with parameter:
μ = λ * t = 2 * 3 = 6.
For any Poisson distribution with parameter μ, the variance is identically equal to the mean:
Var(X) = μ = 6.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q15',
    year: 2026,
    subject: '''Digital Logic''',
    topic: '''Multiplexers''',
    questionText: '''A 4-to-1 multiplexer has select lines S1 (MSB) and S0 (LSB), and data inputs I0, I1, I2, I3. It is used to implement a Boolean function F(A, B, C) where select lines are connected as S1 = A and S0 = B. If the minterm expansion is F(A, B, C) = ∑ m(1, 2, 6, 7), what are the required input values for (I0, I1, I2, I3)?''',
    options: ['''(C, C', 0, 1)''', '''(C, C, 1, 0)''', '''(C', C, 0, 1)''', '''(0, 1, C, C')'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Express F(A, B, C) for each combination of (A, B):
- AB = 00 (minterms m0, m1): m1 is present (C=1), m0 is absent (C=0) ⇒ I0 = C.
- AB = 01 (minterms m2, m3): m2 is present (C=0), m3 is absent (C=1) ⇒ I1 = C'.
- AB = 10 (minterms m4, m5): neither m4 nor m5 is present ⇒ I2 = 0.
- AB = 11 (minterms m6, m7): both m6 and m7 are present ⇒ I3 = 1.
Thus, the inputs are (I0, I1, I2, I3) = (C, C', 0, 1). Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q16',
    year: 2026,
    subject: '''Digital Logic''',
    topic: '''Hazards in Combinational Circuits''',
    questionText: '''Which of the following statements is/are TRUE regarding hazards in combinational logic circuits?''',
    options: ['''A static-1 hazard occurs when the circuit output temporarily drops to 0 when it was expected to remain at constant 1.''', '''Static hazards can be eliminated by adding redundant prime implicants (consensus terms) to the Boolean expression.''', '''Dynamic hazards can occur in two-level sum-of-products (AND-OR) circuits.''', '''A static-0 hazard occurs when the circuit output temporarily pulses to 1 when it was expected to remain at constant 0.'''],
    correctAnswer: '''A, B, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''1. By definition, a static-1 hazard is a transient 0 glitch when the output should stay 1 (Option A is true).
2. Adding consensus terms (redundant implicants bridging adjacent 1s in the K-map) eliminates static hazards (Option B is true).
3. Dynamic hazards require a minimum of three levels of logic; they NEVER occur in strictly two-level (AND-OR or OR-AND) combinational circuits (Option C is false).
4. A static-0 hazard is a transient 1 glitch when the output should stay 0 (Option D is true).
Hence, A, B, and D are TRUE.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q17',
    year: 2026,
    subject: '''Computer Organization and Architecture''',
    topic: '''Instruction Formats & Opcode Expansion''',
    questionText: '''A processor uses 16-bit instructions and has 32 general-purpose registers (requiring 5 bits each). A two-address instruction specifies two register operands. If there are 48 distinct two-address instructions defined, what is the maximum number of one-address instructions (each specifying one register operand) that can be supported?''',
    options: ['''256''', '''512''', '''1024''', '''128'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''1. Instruction width = 16 bits.
2. In a two-address instruction: [Opcode (6 bits)] [Reg1 (5 bits)] [Reg2 (5 bits)].
   Total 6-bit opcode combinations = 2⁶ = 64.
   Used for two-address instructions = 48.
   Unused 6-bit opcode prefixes = 64 - 48 = 16.
3. In a one-address instruction: [Opcode (11 bits)] [Reg1 (5 bits)].
   Each unused 6-bit prefix provides 5 free bits (the unused Reg2 field), giving 2⁵ = 32 distinct one-address instructions.
4. Total one-address instructions possible = 16 * 32 = 512.
Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q18',
    year: 2026,
    subject: '''Computer Organization and Architecture''',
    topic: '''Interrupts & I/O''',
    questionText: '''Which of the following statements is/are TRUE regarding CPU interrupts and interrupt handling?''',
    options: ['''In a vectored interrupt system, the interrupting device provides the interrupt vector address or vector number directly to the CPU over the bus.''', '''Non-maskable interrupts (NMI) have higher priority than maskable interrupts and cannot be disabled by program instructions.''', '''Before jumping to the Interrupt Service Routine (ISR), the CPU hardware automatically saves the contents of all general-purpose registers to the stack.''', '''An interrupt can be serviced only after the CPU completes the execution of the current instruction.'''],
    correctAnswer: '''A, B, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''1. In vectored interrupts, the peripheral device supplies the vector address or index to the CPU (Option A is true).
2. Non-maskable interrupts (like power failure, bus error) bypass software masking flags and possess top priority (Option B is true).
3. CPU hardware automatically saves ONLY the Program Counter (PC) and processor status register/flags; saving general-purpose registers is the responsibility of the software ISR code (Option C is false).
4. In non-pipelined processors, interrupt lines are checked at the end of the instruction cycle; execution of the currently executing instruction is completed before branching to the ISR (Option D is true).
Hence, A, B, and D are TRUE.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q19',
    year: 2026,
    subject: '''Programming and Data Structures''',
    topic: '''C Bitwise Operations''',
    questionText: '''Consider the following C code segment:
#include <stdio.h>
int main() {
    int x = 29;
    int count = 0;
    while (x) {
        count++;
        x = x & (x - 1);
    }
    printf("%d", count);
    return 0;
}
What is the exact output printed by the program?''',
    options: ['''3''', '''4''', '''5''', '''6'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Brian Kernighan's bit-counting algorithm: the expression `x = x & (x - 1)` clears the lowest set bit (rightmost 1) of x in each iteration.
For x = 29 in binary: 29 = 16 + 8 + 4 + 1 = 11101₂.
There are four set bits (1s) in the binary representation of 29.
- Iteration 1: 11101 & 11100 = 11100 (28), count = 1
- Iteration 2: 11100 & 11011 = 11000 (24), count = 2
- Iteration 3: 11000 & 10111 = 10000 (16), count = 3
- Iteration 4: 10000 & 01111 = 00000 (0), count = 4
The loop terminates with count = 4. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q20',
    year: 2026,
    subject: '''Programming and Data Structures''',
    topic: '''Recursion Call Tree''',
    questionText: '''Consider the following recursive C function:
int count = 0;
void solve(int n) {
    count++;
    if (n <= 1) return;
    solve(n - 1);
    solve(n - 2);
}
If the call solve(5) is executed, what is the final integer value of count? (Answer in integer)''',
    options: [],
    correctAnswer: '''15''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Let C(n) denote the total number of calls made when invoking solve(n):
C(n) = 1 for n ≤ 1.
For n > 1: C(n) = 1 + C(n - 1) + C(n - 2).
Computing sequentially:
- C(0) = 1
- C(1) = 1
- C(2) = 1 + C(1) + C(0) = 1 + 1 + 1 = 3
- C(3) = 1 + C(2) + C(1) = 1 + 3 + 1 = 5
- C(4) = 1 + C(3) + C(2) = 1 + 5 + 3 = 9
- C(5) = 1 + C(4) + C(3) = 1 + 9 + 5 = 15.
Thus, count = 15.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q21',
    year: 2026,
    subject: '''Programming and Data Structures''',
    topic: '''AVL Trees''',
    questionText: '''Which of the following statements is/are TRUE regarding AVL Trees?''',
    options: ['''The balance factor of every node in an AVL tree must strictly belong to {-1, 0, +1}.''', '''The minimum number of nodes in an AVL tree of height h (where height of single-node tree is 0) satisfies N(h) = N(h - 1) + N(h - 2) + 1 for h ≥ 2.''', '''Inserting a key into an AVL tree with n nodes may require at most two rotations (either single or double) to restore balance.''', '''Deleting a key from an AVL tree can require at most one rotation to restore balance across the entire tree.'''],
    correctAnswer: '''A, B, C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''1. By definition, an AVL tree requires the balance factor of every node (height(left) - height(right)) to be in {-1, 0, 1} (Option A is true).
2. Minimum nodes recurrence: N(0) = 1, N(1) = 2, and N(h) = N(h - 1) + N(h - 2) + 1 (Fibonacci-like growth) (Option B is true).
3. In an AVL tree, insertion causes an imbalance at the lowest unbalanced ancestor; performing a single or double rotation at that ancestor completely restores the balance factor and original subtree height, requiring at most 2 tree rotations (Option C is true).
4. In deletion, rebalancing a subtree reduces its height, which can propagate imbalances all the way up to the root, requiring up to O(log n) rotations (Option D is false).
Hence, A, B, and C are TRUE.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q22',
    year: 2026,
    subject: '''Programming and Data Structures''',
    topic: '''Stacks & Postfix Evaluation''',
    questionText: '''Consider the following postfix arithmetic expression where each single-digit operand is pushed onto a stack and operators evaluate the top two operands:
6 3 2 + * 5 /
What is the integer value resulting from evaluating this postfix expression using standard integer division?''',
    options: ['''4''', '''5''', '''6''', '''7'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Trace postfix evaluation with an operand stack:
1. Push 6 -> Stack: [6]
2. Push 3 -> Stack: [6, 3]
3. Push 2 -> Stack: [6, 3, 2]
4. Operator '+': Pop 2 and 3, compute 3 + 2 = 5, push 5 -> Stack: [6, 5]
5. Operator '*': Pop 5 and 6, compute 6 * 5 = 30, push 30 -> Stack: [30]
6. Push 5 -> Stack: [30, 5]
7. Operator '/': Pop 5 and 30, compute 30 / 5 = 6, push 6 -> Stack: [6]
Final result = 6. Option C is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q23',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Divide and Conquer''',
    questionText: '''What is the optimal worst-case time complexity to count the number of inversions (pairs (i, j) such that i < j and A[i] > A[j]) in an array of n distinct integers?''',
    options: ['''Θ(n)''', '''Θ(n log n)''', '''Θ(n²)''', '''Θ(n log² n)'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Counting inversions can be solved by modifying the Merge Sort divide-and-conquer algorithm. During the merge step of two sorted subarrays L and R, whenever an element from R is smaller than an element from L, it contributes an inversion with all remaining elements in L. The recurrence is T(n) = 2T(n/2) + O(n), which solves to Θ(n log n). This is asymptotically optimal. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q24',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Greedy Algorithms''',
    questionText: '''Which of the following problems can ALWAYS be solved to global optimality using a greedy approach?''',
    options: ['''Fractional Knapsack Problem''', '''0/1 Knapsack Problem''', '''Activity Selection Problem (maximizing number of non-overlapping activities)''', '''Single-Source Shortest Path in directed graphs with non-negative edge weights'''],
    correctAnswer: '''A, C, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''1. Fractional Knapsack can be solved greedily by sorting items by value-to-weight ratio (Option A is true).
2. 0/1 Knapsack exhibits optimal substructure but lacks the greedy choice property; it is NP-hard and requires dynamic programming (Option B is false).
3. Activity Selection is optimally solved by greedily choosing the activity with the earliest finish time (Option C is true).
4. Dijkstra's algorithm uses a greedy approach to find single-source shortest paths on graphs with non-negative edge weights (Option D is true).
Hence, A, C, and D are TRUE.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q25',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''Regular Grammars''',
    questionText: '''Which of the following statements is/are TRUE regarding formal grammars and regular languages?''',
    options: ['''Every right-linear grammar generates a regular language.''', '''Every left-linear grammar generates a regular language.''', '''A grammar containing both right-linear productions (A → w B) and left-linear productions (C → D v) always generates a regular language.''', '''Every regular language can be generated by a right-linear grammar.'''],
    correctAnswer: '''A, B, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''1. Right-linear grammars generate regular languages (Option A is true).
2. Left-linear grammars also generate regular languages (Option B is true).
3. Mixing right-linear and left-linear productions in the same grammar can generate non-regular context-free languages (e.g. S → a A, A → S b | ε generates {aⁿ bⁿ}, which is not regular) (Option C is false).
4. Any DFA can be directly converted into an equivalent right-linear grammar; hence every regular language has a right-linear grammar (Option D is true).
Hence, A, B, and D are TRUE.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q26',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''NFA to DFA Conversion''',
    questionText: '''Consider an NFA M over alphabet {0, 1} with states {q0, q1, q2}, where q0 is the start state and q2 is the only accept state. The transition function δ is defined as:
δ(q0, 0) = {q0, q1}, δ(q0, 1) = {q0}
δ(q1, 0) = ∅, δ(q1, 1) = {q2}
δ(q2, 0) = ∅, δ(q2, 1) = ∅
How many states are reachable from the start state in the equivalent minimal DFA? (Answer in integer)''',
    options: [],
    correctAnswer: '''3''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Apply subset construction starting from {q0}:
1. State S0 = {q0} (start state, non-accepting):
   - on '0': δ(q0, 0) = {q0, q1} ⇒ State S1 = {q0, q1}
   - on '1': δ(q0, 1) = {q0} ⇒ State S0
2. State S1 = {q0, q1} (non-accepting):
   - on '0': δ(q0, 0) ∪ δ(q1, 0) = {q0, q1} ∪ ∅ = {q0, q1} ⇒ State S1
   - on '1': δ(q0, 1) ∪ δ(q1, 1) = {q0} ∪ {q2} = {q0, q2} ⇒ State S2 = {q0, q2}
3. State S2 = {q0, q2} (accepting, contains q2):
   - on '0': δ(q0, 0) ∪ δ(q2, 0) = {q0, q1} ⇒ State S1
   - on '1': δ(q0, 1) ∪ δ(q2, 1) = {q0} ⇒ State S0
Total reachable states in the subset construction = 3 ({q0}, {q0, q1}, {q0, q2}).
Check minimality: S2 is accepting while S0 and S1 are non-accepting. S0 and S1 are distinguished by input '1' (S0 goes to non-accepting S0, S1 goes to accepting S2). All 3 states are pairwise distinguishable. Thus, the minimal DFA has exactly 3 states.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q27',
    year: 2026,
    subject: '''Compiler Design''',
    topic: '''Operator Precedence Parsing''',
    questionText: '''Which of the following conditions is required for a context-free grammar to be an Operator Grammar?''',
    options: ['''No production has an ε (empty string) on its right-hand side, and no production has two adjacent non-terminals on its right-hand side.''', '''Every production must be left-recursive.''', '''The grammar must contain no terminal symbols.''', '''Every non-terminal must derive at most one terminal.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''An Operator Grammar has two defining restrictions:
1. No production has an empty right-hand side (no ε-productions).
2. No production has two consecutive non-terminals on its right-hand side.
This enables defining operator precedence relations directly between pairs of terminals. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q28',
    year: 2026,
    subject: '''Compiler Design''',
    topic: '''LR Parsing Tables''',
    questionText: '''Which of the following statements is/are TRUE when comparing Canonical LR (CLR(1)) and Lookahead LR (LALR(1)) parsers for the same grammar?''',
    options: ['''The number of states in an LALR(1) parser is strictly equal to the number of states in an SLR(1) parser.''', '''Merging states with identical core LR(0) items in CLR(1) can never introduce shift-reduce conflicts in the resulting LALR(1) parser.''', '''Merging states with identical core LR(0) items in CLR(1) can introduce reduce-reduce conflicts in the resulting LALR(1) parser.''', '''Every grammar that is accepted by an LALR(1) parser is also accepted by a CLR(1) parser.'''],
    correctAnswer: '''A, B, C, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''1. LALR(1) merges states having identical LR(0) cores, so the number of states in LALR(1) is identical to the number of states in SLR(1) and LR(0) (Option A is true).
2. Merging states never introduces new shift-reduce conflicts because shift actions depend only on the core and terminal symbol, not the lookahead of a reduction (Option B is true).
3. Merging states CAN combine lookaheads of different reduce productions, potentially introducing reduce-reduce conflicts (Option C is true).
4. The class of LALR(1) grammars is a strict subset of CLR(1) grammars; hence any LALR(1) grammar is CLR(1) (Option D is true).
All statements A, B, C, and D are TRUE.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q29',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''CPU Scheduling''',
    questionText: '''Three processes P1, P2, and P3 arrive at time t = 0 with CPU burst times of 4 ms, 5 ms, and 3 ms, respectively. The system uses Round Robin scheduling with a time quantum Q = 2 ms and ready queue order P1, P2, P3. When a process finishes its time slice with remaining CPU time, it is appended to the rear of the ready queue. How many context switches occur between processes until all three processes terminate? (Do not count the initial dispatch at t = 0). (Answer in integer)''',
    options: [],
    correctAnswer: '''6''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Trace process execution with quantum Q = 2 ms:
- [0 - 2 ms]: P1 runs (rem: 2). Switches to P2 (CS 1).
- [2 - 4 ms]: P2 runs (rem: 3). Switches to P3 (CS 2).
- [4 - 6 ms]: P3 runs (rem: 1). Switches to P1 (CS 3).
- [6 - 8 ms]: P1 runs (rem: 0, terminates). Switches to P2 (CS 4).
- [8 - 10 ms]: P2 runs (rem: 1). Switches to P3 (CS 5).
- [10 - 11 ms]: P3 runs (rem: 0, terminates). Switches to P2 (CS 6).
- [11 - 12 ms]: P2 runs (rem: 0, terminates).
Total context switches between processes = 6.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q30',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''Disk Scheduling''',
    questionText: '''In disk scheduling, how does the Circular SCAN (C-SCAN) algorithm differ from the standard SCAN (Elevator) algorithm?''',
    options: ['''C-SCAN services requests in only one direction; upon reaching the end cylinder, it immediately returns to the beginning without servicing any requests on the return trip.''', '''C-SCAN reverses its direction at the final request rather than travelling all the way to the disk boundary.''', '''C-SCAN services requests based strictly on shortest seek distance.''', '''C-SCAN operates without an elevator sweep mechanism.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''C-SCAN (Circular SCAN) is designed to provide a more uniform wait time. The head services requests while moving in one direction until it reaches the edge, then immediately returns to the opposite end without servicing any requests during the return sweep, before repeating the scan. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q31',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''Threads & Concurrency''',
    questionText: '''Which of the following statements is/are TRUE regarding User-Level Threads (ULT) and Kernel-Level Threads (KLT)?''',
    options: ['''Thread switching between User-Level Threads does not require entering kernel mode (no trap/context switch to OS kernel).''', '''In a pure User-Level Threading model, if one thread makes a blocking system call, the entire process is blocked.''', '''Kernel-Level Threads cannot take advantage of multi-core hardware to achieve true parallelism.''', '''User-level thread management is faster than kernel-level thread management because thread creation and scheduling occur entirely in user space.'''],
    correctAnswer: '''A, B, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''1. ULT switching is handled by a user-space runtime thread library without kernel traps (Option A is true).
2. Because the kernel sees only one process scheduling entity in pure ULT, any blocking system call blocks the entire process (Option B is true).
3. KLTs are directly scheduled by the kernel and CAN run on separate cores simultaneously (Option C is false).
4. ULT creation and synchronization involve simple function calls without kernel mode switches, making them substantially faster (Option D is true).
Hence, A, B, and D are TRUE.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q32',
    year: 2026,
    subject: '''Databases''',
    topic: '''Canonical Cover of FDs''',
    questionText: '''Consider a relational database schema R(A, B, C, D) with the set of functional dependencies:
F = { A → BC, B → C, A → B, AB → C }
What is the number of functional dependencies in the canonical (minimal) cover of F? (Answer in integer)''',
    options: [],
    correctAnswer: '''2''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Compute canonical cover Fc:
1. Decompose RHS: {A → B, A → C, B → C, AB → C}.
2. Remove extraneous LHS attributes in AB → C: since B → C is already in F, B⁺ contains C. Thus attribute A in AB → C is extraneous, reducing AB → C to B → C.
3. Unique set of FDs: {A → B, A → C, B → C}.
4. Check for redundancy: In A → C, with remaining FDs {A → B, B → C}, attribute closure A⁺ = {A, B, C}, which derives C via transitivity. Hence A → C is redundant and removed.
5. Remaining FDs {A → B, B → C} are both non-redundant and minimal.
Thus, the canonical cover contains exactly 2 functional dependencies.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q33',
    year: 2026,
    subject: '''Databases''',
    topic: '''SQL Joins & Nulls''',
    questionText: '''Consider two tables T1(A, B) and T2(B, C) containing 5 tuples and 3 tuples, respectively. Which of the following statements is ALWAYS TRUE regarding the result of the SQL query:
SELECT * FROM T1 LEFT OUTER JOIN T2 ON T1.B = T2.B;''',
    options: ['''The result contains at least 5 rows.''', '''The result contains exactly 15 rows.''', '''The result contains at most 5 rows.''', '''The result contains zero NULL values.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''A LEFT OUTER JOIN preserves ALL rows from the left table (T1). If a tuple in T1 does not match any tuple in T2 on T1.B = T2.B, it is still included in the result with NULLs padded for T2 attributes. If a tuple in T1 matches multiple tuples in T2, it produces multiple rows. Hence, the result must contain AT LEAST as many rows as T1 (at least 5 rows). Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q34',
    year: 2026,
    subject: '''Computer Networks''',
    topic: '''Error Detection & CRC''',
    questionText: '''A bit stream 1101011011 is to be transmitted using the standard Cyclic Redundancy Check (CRC) polynomial generator G(x) = x⁴ + x + 1 (binary 10011). How many check bits (redundant CRC bits) are appended to the message stream before transmission?''',
    options: ['''3 bits''', '''4 bits''', '''5 bits''', '''6 bits'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The degree of the generator polynomial G(x) = x⁴ + x + 1 is 4 (the highest power of x). The number of redundant CRC check bits appended to the message stream is always equal to the degree of the generator polynomial, which is 4 bits. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q35',
    year: 2026,
    subject: '''Computer Networks''',
    topic: '''Transport Layer Protocols''',
    questionText: '''Which of the following statements is/are TRUE when comparing TCP and UDP protocols?''',
    options: ['''TCP is a byte-stream-oriented connection protocol, whereas UDP is a message-oriented connectionless protocol.''', '''The minimum header size of a standard TCP segment is 20 bytes, whereas the header size of a UDP datagram is fixed at 8 bytes.''', '''Both TCP and UDP header structures contain a 16-bit Checksum field.''', '''UDP provides built-in congestion control mechanisms to prevent buffer saturation in intermediate routers.'''],
    correctAnswer: '''A, B, C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''1. TCP provides a structured byte stream with sequencing, while UDP preserves application message boundaries without connections (Option A is true).
2. Standard TCP header without options is 20 bytes; UDP header is always 8 bytes (Option B is true).
3. Both protocols include a 16-bit checksum covering pseudo-header, header, and payload (Option C is true).
4. UDP does NOT provide any flow control or congestion control mechanisms (Option D is false).
Hence, A, B, and C are TRUE.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q36',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Graph Coloring & Brooks' Theorem''',
    questionText: '''Let G be a connected, simple, undirected graph with maximum vertex degree Δ = 4. Suppose G is neither a complete graph nor an odd cycle. According to Brooks' Theorem, what is the maximum possible value of the chromatic number χ(G)?''',
    options: ['''3''', '''4''', '''5''', '''6'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Brooks' Theorem states that for any connected simple undirected graph G with maximum degree Δ, the chromatic number χ(G) ≤ Δ, provided G is neither a complete graph K_{Δ+1} nor an odd cycle.
Here Δ = 4, and G is neither K5 nor an odd cycle.
Therefore, χ(G) ≤ 4.
Hence, the maximum possible value of the chromatic number is 4. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q37',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Posets and Lattices''',
    questionText: '''Consider a poset (L, ≤) that forms a lattice. Which of the following statements is/are TRUE?''',
    options: ['''Every pair of elements in L has a unique greatest lower bound (meet) and a unique least upper bound (join).''', '''Every finite lattice has a unique least element (bottom) and a unique greatest element (top).''', '''Every distributive lattice is also a complemented lattice.''', '''The power set of any set S ordered by subset inclusion (P(S), ⊆) is a Boolean algebra (distributive and complemented lattice).'''],
    correctAnswer: '''A, B, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''1. By definition, a lattice requires every pair of elements to have a unique meet (a ∧ b) and join (a ∨ b) (Option A is true).
2. In any finite lattice, the join of all elements is the unique top (1) and the meet of all elements is the unique bottom (0) (Option B is true).
3. Not every distributive lattice is complemented (e.g. the chain of 3 elements {0, 1/2, 1} is distributive but 1/2 has no complement) (Option C is false).
4. (P(S), ⊆) satisfies distributivity, identity (∅, S), and complements (set complement S - A), forming a Boolean algebra (Option D is true).
Hence, A, B, and D are TRUE.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q38',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Recurrence Relations''',
    questionText: '''Consider the linear homogeneous recurrence relation:
a_n = 5 a_{n-1} - 6 a_{n-2} for n ≥ 2
with the initial conditions a_0 = 1 and a_1 = 4. What is the value of a_5? (Answer in integer)''',
    options: [],
    correctAnswer: '''454''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''1. Characteristic equation: r² - 5r + 6 = 0 ⇒ (r - 2)(r - 3) = 0 ⇒ roots r1 = 2, r2 = 3.
2. General solution: a_n = c1 · 2ⁿ + c2 · 3ⁿ.
3. Using initial conditions:
   - For n = 0: c1 + c2 = 1
   - For n = 1: 2 c1 + 3 c2 = 4
   Solving: 2(1 - c2) + 3 c2 = 4 ⇒ 2 + c2 = 4 ⇒ c2 = 2, c1 = -1.
4. Closed-form formula: a_n = 2 · 3ⁿ - 2ⁿ.
5. For n = 5:
   a_5 = 2 · 3⁵ - 2⁵ = 2 · 243 - 32 = 486 - 32 = 454.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q39',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Symmetric Matrices & Orthogonality''',
    questionText: '''Let A be an n x n real symmetric matrix (A = Aᵀ). Which of the following statements is/are ALWAYS TRUE?''',
    options: ['''All eigenvalues of A are real numbers.''', '''Eigenvectors corresponding to distinct eigenvalues of A are mutually orthogonal.''', '''Matrix A is always diagonalizable over the real numbers ℝ by an orthogonal matrix.''', '''The determinant of A is strictly positive.'''],
    correctAnswer: '''A, B, C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''By the Spectral Theorem for real symmetric matrices:
1. All roots of the characteristic polynomial (eigenvalues) of a real symmetric matrix are guaranteed to be real (Option A is true).
2. If λ1 ≠ λ2, then their respective eigenvectors v1, v2 satisfy v1 · v2 = 0 (mutually orthogonal) (Option B is true).
3. Any real symmetric matrix can be factored as A = Q Λ Qᵀ where Q is an orthogonal matrix (Option C is true).
4. The determinant is the product of eigenvalues, which can be negative or zero (e.g. A = [[-1, 0], [0, 1]] has det(A) = -1) (Option D is false).
Hence, A, B, and C are TRUE.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q40',
    year: 2026,
    subject: '''Probability and Statistics''',
    topic: '''Continuous Joint Distribution''',
    questionText: '''Let X and Y be two independent continuous random variables, both distributed uniformly over the interval [0, 4]. What is the probability Pr(X + Y ≤ 3)? (rounded off to two decimal places)''',
    options: [],
    correctAnswer: '''0.28''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''1. Since X and Y are independent and uniform on [0, 4], the joint probability density function is:
   f(x, y) = (1/4) * (1/4) = 1/16 for 0 ≤ x ≤ 4, 0 ≤ y ≤ 4.
2. Total area of the sample space square = 4 * 4 = 16.
3. The favorable region is defined by: x ≥ 0, y ≥ 0, and x + y ≤ 3.
   This forms a right triangle in the first quadrant with vertices at (0, 0), (3, 0), and (0, 3).
4. Area of favorable region = (1/2) * base * height = (1/2) * 3 * 3 = 4.5.
5. Pr(X + Y ≤ 3) = Favorable Area / Total Area = 4.5 / 16 = 9 / 32 = 0.28125.
Rounding off to two decimal places yields 0.28.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q41',
    year: 2026,
    subject: '''Digital Logic''',
    topic: '''Sequential Circuits & FSM Minimization''',
    questionText: '''Consider a Mealy machine with 4 states {S0, S1, S2, S3}. On input x = 0, states S0 and S2 transition to S1 with output 0, and states S1 and S3 transition to S0 with output 1. On input x = 1, states S0 and S2 transition to S3 with output 1, and states S1 and S3 transition to S2 with output 0. What is the minimum number of states in an equivalent minimized finite state machine?''',
    options: ['''1''', '''2''', '''3''', '''4'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Partition equivalence states:
1. 0-equivalence partition P0 based on output signatures for inputs (x=0, x=1):
   - S0 output: (0, 1)
   - S1 output: (1, 0)
   - S2 output: (0, 1)
   - S3 output: (1, 0)
   P0 = { (S0, S2), (S1, S3) }.
2. 1-equivalence partition P1:
   - For group (S0, S2):
     On x=0: both transition to S1 (in group {S1, S3}).
     On x=1: both transition to S3 (in group {S1, S3}).
     Transitions land in identical equivalence groups, so S0 and S2 remain equivalent.
   - For group (S1, S3):
     On x=0: both transition to S0 (in group {S0, S2}).
     On x=1: both transition to S2 (in group {S0, S2}).
     Transitions land in identical equivalence groups, so S1 and S3 remain equivalent.
Since P1 = P0, the equivalence partition has stabilized with exactly 2 states. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q42',
    year: 2026,
    subject: '''Digital Logic''',
    topic: '''Adders & Propagation Delay''',
    questionText: '''A 4-bit Ripple Carry Adder is constructed by cascading four identical 1-bit Full Adders (FA0 to FA3). In each Full Adder, the propagation delay from any input to the Sum output is 3 nanoseconds, and the propagation delay from any input to the Carry output is 2 nanoseconds. Assuming all inputs (operands A, B, and initial carry C0) are applied simultaneously at time t = 0, what is the propagation delay (in nanoseconds) until the final carry-out bit C4 is guaranteed to be valid and stable? (Answer in integer)''',
    options: [],
    correctAnswer: '''8''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''The carry chain propagates sequentially through all four stages:
- Carry out C1 of FA0 is valid at t = 2 ns.
- Carry out C2 of FA1 is valid at t = 2 + 2 = 4 ns.
- Carry out C3 of FA2 is valid at t = 4 + 2 = 6 ns.
- Carry out C4 of FA3 is valid at t = 6 + 2 = 8 ns.
Thus, the final carry out C4 is stable after 8 nanoseconds.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q43',
    year: 2026,
    subject: '''Computer Organization and Architecture''',
    topic: '''Cache Memory''',
    questionText: '''A direct-mapped cache consists of 8 cache blocks (indexed from 0 to 7), with each block holding one memory word. Initially, the cache is completely empty. A program generates a sequence of 9 memory accesses with word block addresses:
0, 4, 8, 0, 4, 8, 0, 4, 8
How many cache misses occur during the execution of this reference stream? (Answer in integer)''',
    options: [],
    correctAnswer: '''7''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''In a direct-mapped cache of 8 blocks, block address B maps to cache index (B mod 8):
- Block 0: 0 mod 8 = 0
- Block 4: 4 mod 8 = 4
- Block 8: 8 mod 8 = 0 (conflicts directly with Block 0 in cache line 0)
Trace accesses:
1. Access 0: Line 0 empty ⇒ MISS (Line 0 stores 0)
2. Access 4: Line 4 empty ⇒ MISS (Line 4 stores 4)
3. Access 8: Line 0 stores 0 ⇒ MISS (evicts 0, Line 0 stores 8)
4. Access 0: Line 0 stores 8 ⇒ MISS (evicts 8, Line 0 stores 0)
5. Access 4: Line 4 stores 4 ⇒ HIT
6. Access 8: Line 0 stores 0 ⇒ MISS (evicts 0, Line 0 stores 8)
7. Access 0: Line 0 stores 8 ⇒ MISS (evicts 8, Line 0 stores 0)
8. Access 4: Line 4 stores 4 ⇒ HIT
9. Access 8: Line 0 stores 0 ⇒ MISS (evicts 0, Line 0 stores 8)
Total misses = 7 (and 2 hits at accesses 5 and 8).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q44',
    year: 2026,
    subject: '''Computer Organization and Architecture''',
    topic: '''Branch Prediction''',
    questionText: '''A dynamic 2-bit branch predictor uses a 2-bit saturating counter with four states:
00: Strongly Not Taken
01: Weakly Not Taken
10: Weakly Taken
11: Strongly Taken
The predictor predicts Taken when in states 10 or 11, and predicts Not Taken when in states 00 or 01. The counter is initialized to Strongly Not Taken (00). The branch is evaluated 6 times with the actual outcomes:
Taken, Taken, Taken, Not Taken, Taken, Taken
How many times does the predictor correctly predict the actual branch outcome? (Answer in integer)''',
    options: [],
    correctAnswer: '''3''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Trace the 2-bit saturating counter across the 6 evaluations:
1. State = 00 (predicts Not Taken). Actual = Taken ⇒ INCORRECT. Next state = 01.
2. State = 01 (predicts Not Taken). Actual = Taken ⇒ INCORRECT. Next state = 10.
3. State = 10 (predicts Taken). Actual = Taken ⇒ CORRECT (1). Next state = 11.
4. State = 11 (predicts Taken). Actual = Not Taken ⇒ INCORRECT. Next state = 10.
5. State = 10 (predicts Taken). Actual = Taken ⇒ CORRECT (2). Next state = 11.
6. State = 11 (predicts Taken). Actual = Taken ⇒ CORRECT (3). Next state = 11.
Total correct predictions = 3.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q45',
    year: 2026,
    subject: '''Programming and Data Structures''',
    topic: '''C Function Pointers''',
    questionText: '''Consider the following C program:
#include <stdio.h>
int add(int a, int b) { return a + b; }
int mul(int a, int b) { return a * b; }
int main() {
    int (*ops[])(int, int) = {add, mul};
    int result = ops[1](ops[0](2, 3), 4);
    printf("%d", result);
    return 0;
}
What is the exact output printed by the program?''',
    options: ['''20''', '''14''', '''24''', '''10'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''1. `ops` is an array of function pointers: `ops[0]` points to function `add`, and `ops[1]` points to function `mul`.
2. In `result = ops[1](ops[0](2, 3), 4)`:
   - `ops[0](2, 3)` calls `add(2, 3)` = 2 + 3 = 5.
   - `ops[1](5, 4)` calls `mul(5, 4)` = 5 * 4 = 20.
3. `result` receives the value 20, which is printed.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q46',
    year: 2026,
    subject: '''Programming and Data Structures''',
    topic: '''C Strings & Pointers''',
    questionText: '''Consider the following C program:
#include <stdio.h>
#include <string.h>
int main() {
    char str[] = "GATECS2026";
    char *p = str + 4;
    int len = strlen(p);
    printf("%d", len);
    return 0;
}
What integer value is printed by the program? (Answer in integer)''',
    options: [],
    correctAnswer: '''6''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''1. `str` is an array initialized with "GATECS2026" (characters at indices: str[0]='G', str[1]='A', str[2]='T', str[3]='E', str[4]='C', str[5]='S', str[6]='2', str[7]='0', str[8]='2', str[9]='6', str[10]='\\0').
2. Pointer `p = str + 4` points to the substring starting at index 4, which is "CS2026".
3. `strlen(p)` computes the length of string "CS2026", which consists of 6 characters before the null terminator.
Thus, the program prints 6.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q47',
    year: 2026,
    subject: '''Programming and Data Structures''',
    topic: '''Binary Heaps & Build-Heap''',
    questionText: '''Which of the following statements is/are TRUE regarding binary heaps and the Build-Heap procedure?''',
    options: ['''Building a binary max-heap from an arbitrary array of n elements takes Θ(n) time in the worst case using Floyd's bottom-up algorithm.''', '''In a binary max-heap of n distinct elements, the minimum element can be found in O(1) time.''', '''In a binary heap of height h containing n elements, the maximum number of nodes at height i (where a leaf has height 0) is ⌈n / 2^(i + 1)⌉.''', '''Extract-Max operation in a binary max-heap with n elements requires O(log n) time in the worst case.'''],
    correctAnswer: '''A, C, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''1. Floyd's bottom-up Build-Heap performs sink operations on internal nodes; the sum ∑_{i=0}^h (i · ⌈n / 2^(i + 1)⌉) converges to O(n), running in linear Θ(n) time (Option A is true).
2. In a max-heap, the minimum element can reside at ANY of the ⌈n/2⌉ leaf nodes; finding it requires scanning all leaves in O(n) time (Option B is false).
3. By binary heap properties, the number of nodes at height i is at most ⌈n / 2^(i + 1)⌉ (Option C is true).
4. Extract-Max swaps root with the last leaf and calls max-heapify along the tree height, taking O(log n) time (Option D is true).
Hence, A, C, and D are TRUE.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q48',
    year: 2026,
    subject: '''Programming and Data Structures''',
    topic: '''Trie Data Structure''',
    questionText: '''A standard prefix Trie is constructed for the dictionary of four lowercase words:
{"cat", "car", "cart", "dog"}
How many total nodes (including the empty root node) are present in the resulting Trie? (Answer in integer)''',
    options: [],
    correctAnswer: '''9''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Count nodes level by level starting from the empty root:
1. Root node: 1 node
2. For "cat":
   - root -> 'c' (node 1)
   - 'c' -> 'a' (node 2)
   - 'a' -> 't' (node 3)
3. For "car":
   - 'c' and 'a' already exist; add 'r' under 'a' (node 4)
4. For "cart":
   - 'c', 'a', 'r' already exist; add 't' under 'r' (node 5)
5. For "dog":
   - add 'd' under root (node 6)
   - add 'o' under 'd' (node 7)
   - add 'g' under 'o' (node 8)
Total nodes in the Trie = 1 (root) + 8 = 9 nodes.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q49',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Dynamic Programming & LCS''',
    questionText: '''Consider the two sequences X = 'ABCBDAB' and Y = 'BDCAB'. What is the length of the Longest Common Subsequence (LCS) between strings X and Y? (Answer in integer)''',
    options: [],
    correctAnswer: '''4''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Construct the dynamic programming LCS table L[i, j]:
- Subsequence 'BCAB' is present in X (A-B-C-B-D-A-B -> B, C, A, B) and in Y (B-D-C-A-B -> B, C, A, B).
- Subsequence 'BDAB' is also present in X and in Y.
Both have length 4.
No common subsequence of length 5 exists between X and Y.
Thus, the length of the longest common subsequence is 4.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q50',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''NP-Completeness & Reductions''',
    questionText: '''Which of the following computational decision problems is/are known to be NP-Complete?''',
    options: ['''Boolean 3-Satisfiability (3-SAT)''', '''Vertex Cover Problem''', '''Hamiltonian Cycle Problem''', '''Single-Source Shortest Path in directed graphs with non-negative edge weights'''],
    correctAnswer: '''A, B, C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''1. 3-SAT was proven NP-complete by Cook-Levin (Option A is true).
2. Vertex Cover was proven NP-complete by Karp via reduction from 3-SAT/Clique (Option B is true).
3. Hamiltonian Cycle is one of Karp's 21 NP-complete problems (Option C is true).
4. Single-Source Shortest Path with non-negative weights is solved in polynomial time O(|E| + |V| log |V|) by Dijkstra's algorithm, so it is in P (Option D is false).
Hence, A, B, and C are TRUE.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q51',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Topological Sort''',
    questionText: '''A directed acyclic graph (DAG) G has 5 vertices {V1, V2, V3, V4, V5} and edges: (V1 → V3), (V2 → V3), (V3 → V4), and (V3 → V5). How many distinct valid topological orderings exist for G?''',
    options: ['''2''', '''4''', '''6''', '''8'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Analyze topological precedence constraints:
- V1 and V2 have in-degree 0; they must both appear before V3.
  There are 2 ways to order {V1, V2}: (V1, V2) or (V2, V1).
- V3 has in-degree from both V1 and V2, so V3 must appear immediately after both V1 and V2 have appeared.
- V4 and V5 have in-degree only from V3, so they must both appear after V3.
  There are 2 ways to order {V4, V5}: (V4, V5) or (V5, V4).
- Thus, any valid topological ordering has the structure: [ordering of V1, V2] followed by V3, followed by [ordering of V4, V5].
Total valid topological orderings = 2 * 1 * 2 = 4.
Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q52',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''Pushdown Automata''',
    questionText: '''Which of the following statements is/are TRUE regarding Pushdown Automata (PDA) and Context-Free Languages?''',
    options: ['''Non-deterministic Pushdown Automata (NPDA) are strictly more expressive than Deterministic Pushdown Automata (DPDA).''', '''Every regular language can be accepted by a DPDA.''', '''The language L = { w wᴿ | w ∈ {a, b}* } can be accepted by a DPDA.''', '''The class of languages accepted by DPDAs is closed under complementation.'''],
    correctAnswer: '''A, B, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''1. NPDAs accept all Context-Free Languages, whereas DPDAs accept only Deterministic CFLs (a proper subset); hence NPDA is strictly more powerful (Option A is true).
2. Any regular language can be recognized with a finite state control without even using the stack; hence DPDAs can accept all regular languages (Option B is true).
3. L = { w wᴿ | w ∈ {a, b}* } has an un-marked middle boundary, requiring non-deterministic guessing of the center; it cannot be accepted by any DPDA (Option C is false).
4. The class of Deterministic Context-Free Languages (DCFLs) is closed under complementation (proven by converting DPDA to canonical form and flipping accepting/non-accepting states) (Option D is true).
Hence, A, B, and D are TRUE.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q53',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''Pumping Lemma & Non-CFL''',
    questionText: '''Consider the language L = { aⁿ bⁿ cⁿ | n ≥ 1 } over the alphabet Σ = {a, b, c}. Which of the following formal methods is correctly used to prove that L is NOT a context-free language?''',
    options: ['''Pumping Lemma for Context-Free Languages''', '''Myhill-Nerode Theorem''', '''Rice's Theorem''', '''Cook's Theorem'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The standard formal mathematical technique to prove that a language is not context-free is the Pumping Lemma for Context-Free Languages (which shows that any string s = u v w x y with |vwx| ≤ p and |vx| ≥ 1 cannot pump all three symbol counts a, b, and c simultaneously). Myhill-Nerode is used for regular languages, Rice's theorem for undecidability of TMs, and Cook's theorem for NP-completeness. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q54',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''Chomsky Normal Form''',
    questionText: '''In any context-free grammar in Chomsky Normal Form (CNF), all productions are of the form A → BC or A → a. How many total derivation steps are required to derive a terminal string of length n = 15? (Answer in integer)''',
    options: [],
    correctAnswer: '''29''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''In Chomsky Normal Form:
1. Each production A → BC replaces one non-terminal with two non-terminals, increasing the number of non-terminals by 1.
   Starting from the start symbol S (1 non-terminal), deriving a sentential form of n non-terminals requires exactly n - 1 applications of A → BC.
2. Then, each of the n non-terminals must be replaced by a terminal symbol using productions of the form A → a, requiring exactly n steps.
Total derivation steps = (n - 1) + n = 2n - 1.
For n = 15:
Total steps = 2(15) - 1 = 30 - 1 = 29.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q55',
    year: 2026,
    subject: '''Compiler Design''',
    topic: '''Dataflow Analysis & Liveness''',
    questionText: '''Which of the following statements is/are TRUE regarding Live Variable Analysis in compiler optimization?''',
    options: ['''Live variable analysis is a backward dataflow analysis problem.''', '''A variable v is live at program point p if there exists an execution path from p to a read of v along which v is not redefined.''', '''The confluence (meet) operator across multiple outgoing control paths in live variable analysis is set union (∪).''', '''Live variable analysis is primarily used for common subexpression elimination.'''],
    correctAnswer: '''A, B, C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''1. Live variables propagate information backwards from exit to entry (Option A is true).
2. By definition, v is live if its current value may be read along some future path before being overwritten (Option B is true).
3. Because liveness holds if v is live along ANY branch path, the dataflow equation is IN[B] = USE[B] ∪ (OUT[B] - DEF[B]), with OUT[B] = ⋃_{S ∈ succ(B)} IN[S] (Option C is true).
4. Liveness analysis is primarily used for dead code elimination and register allocation, while Available Expressions analysis is used for common subexpression elimination (Option D is false).
Hence, A, B, and C are TRUE.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q56',
    year: 2026,
    subject: '''Compiler Design''',
    topic: '''LR(0) Parser Items & States''',
    questionText: '''Consider the augmented grammar G with start symbol S':
S' → S
S → A A
A → a A | b
How many states are present in the canonical collection of LR(0) items for grammar G? (Answer in integer)''',
    options: [],
    correctAnswer: '''7''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Compute canonical LR(0) collection:
- I0 = closure({S' → ·S}) = {S' → ·S, S → ·AA, A → ·aA, A → ·b}
- goto(I0, S) = I1 = {S' → S·} (Accepting state)
- goto(I0, A) = I2 = closure({S → A·A}) = {S → A·A, A → ·aA, A → ·b}
- goto(I0, a) = I3 = closure({A → a·A}) = {A → a·A, A → ·aA, A → ·b}
- goto(I0, b) = I4 = {A → b·}
- goto(I2, A) = I5 = {S → AA·}
- goto(I2, a) = I3, goto(I2, b) = I4
- goto(I3, A) = I6 = {A → aA·}
- goto(I3, a) = I3, goto(I3, b) = I4
States are: {I0, I1, I2, I3, I4, I5, I6}.
Total number of LR(0) states = 7.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q57',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''Inverted Page Tables''',
    questionText: '''A 64-bit computer architecture uses a 48-bit virtual address space, a 36-bit physical address space, and a page size of 8 KB (2¹³ bytes). An inverted page table is used to map virtual pages to physical memory frames. If the total number of entries in the inverted page table is expressed as 2^k, what is the integer value of k? (Answer in integer)''',
    options: [],
    correctAnswer: '''23''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''1. In an inverted page table, there is exactly one entry for each physical frame in real physical memory (not for each virtual page).
2. Physical address space = 36 bits.
3. Page frame size = 8 KB = 2¹³ bytes.
4. Total number of physical page frames = 2³⁶ / 2¹³ = 2^(36 - 13) = 2²³ frames.
5. Therefore, the inverted page table contains exactly 2²³ entries.
The value of k is 23.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q58',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''Banker's Algorithm & Deadlock Avoidance''',
    questionText: '''A system has 5 processes {P0, P1, P2, P3, P4} and 3 resource types {A, B, C}. The current Available vector is (3, 3, 2). The Allocation and Max matrices are:
Process | Allocation (A, B, C) | Max (A, B, C)
P0: (0, 1, 0) | (7, 5, 3)
P1: (2, 0, 0) | (3, 2, 2)
P2: (3, 0, 2) | (9, 0, 2)
P3: (2, 1, 1) | (2, 2, 2)
P4: (0, 0, 2) | (4, 3, 3)
How many processes among {P0, P1, P2, P3, P4} can be selected as the VERY FIRST process in a valid safety sequence? (Answer in integer)''',
    options: [],
    correctAnswer: '''2''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Compute Need = Max - Allocation for each process:
- Need(P0) = (7-0, 5-1, 3-0) = (7, 4, 3)
- Need(P1) = (3-2, 2-0, 2-0) = (1, 2, 2)
- Need(P2) = (9-3, 0-0, 2-2) = (6, 0, 0)
- Need(P3) = (2-2, 2-1, 2-1) = (0, 1, 1)
- Need(P4) = (4-0, 3-0, 3-2) = (4, 3, 1)
Current Available = (3, 3, 2).
Check which processes satisfy Need ≤ Available:
- P0: (7, 4, 3) ≤ (3, 3, 2) is False.
- P1: (1, 2, 2) ≤ (3, 3, 2) is TRUE! (P1 can execute first; subsequent execution of P3, P0, P2, P4 finishes safely).
- P2: (6, 0, 0) ≤ (3, 3, 2) is False.
- P3: (0, 1, 1) ≤ (3, 3, 2) is TRUE! (P3 can execute first; subsequent execution of P1, P0, P2, P4 finishes safely).
- P4: (4, 3, 1) ≤ (3, 3, 2) is False (4 > 3).
Thus, exactly 2 processes (P1 and P3) can be selected as the very first process in a valid safety sequence.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q59',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''Process Synchronization''',
    questionText: '''Which of the following statements is/are TRUE regarding the Readers-Writers synchronization problem?''',
    options: ['''In the first reader-preference solution, writer processes may suffer from indefinite postponement (starvation).''', '''Multiple reader processes can access the shared resource concurrently without violating mutual exclusion.''', '''A writer process requires exclusive access to the shared resource, blocking both other writers and all readers.''', '''In a writer-preference solution, readers are guaranteed to never starve.'''],
    correctAnswer: '''A, B, C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''1. In reader-preference (first readers-writers), as long as at least one reader is active, incoming readers are admitted, starving waiting writers (Option A is true).
2. Reading is a non-mutating operation, so multiple concurrent readers do not corrupt data (Option B is true).
3. Writers modify shared state, requiring strictly exclusive mutual exclusion against all readers and other writers (Option C is true).
4. In writer-preference solutions, if writers arrive continuously, readers will suffer from starvation (Option D is false).
Hence, A, B, and C are TRUE.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q60',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''File Systems & UNIX Inodes''',
    questionText: '''In a UNIX-like file system, an inode has 10 direct block pointers, 1 single indirect pointer, and 1 double indirect pointer. Disk block size is 4 KB (4096 bytes), and each disk block address pointer requires 4 bytes. How many data blocks can be addressed by the single indirect pointer alone? (Answer in integer)''',
    options: [],
    correctAnswer: '''1024''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''1. Disk block size = 4096 bytes.
2. Disk block address pointer size = 4 bytes.
3. Number of pointers per indirect block = Block size / Pointer size = 4096 / 4 = 1024 pointers.
4. The single indirect pointer points to exactly one disk block that contains data block pointers.
Therefore, the single indirect pointer addresses exactly 1024 data blocks.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q61',
    year: 2026,
    subject: '''Databases''',
    topic: '''Transaction Serializability''',
    questionText: '''Which of the following statements is/are TRUE regarding transaction schedules and serializability in database systems?''',
    options: ['''Every conflict serializable schedule is also view serializable.''', '''Every view serializable schedule that contains no blind writes is conflict serializable.''', '''View serializability testing is an NP-complete problem in the general case.''', '''Conflict serializability can be tested in polynomial time O(V + E) using cycle detection on the precedence graph.'''],
    correctAnswer: '''A, B, C, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''1. Conflict serializability is a strict subset of view serializability: every conflict serializable schedule is view serializable (Option A is true).
2. View serializability differs from conflict serializability ONLY when blind writes (writes without preceding reads by the same transaction) are present; without blind writes, view serializability is identical to conflict serializability (Option B is true).
3. Testing view serializability involves testing all polygraph acyclicity combinations, which is proven to be NP-complete (Papadimitriou, 1979) (Option C is true).
4. Conflict serializability requires constructing the precedence graph and running cycle detection (DFS/BFS), taking O(|V| + |E|) polynomial time (Option D is true).
All statements A, B, C, and D are TRUE.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q62',
    year: 2026,
    subject: '''Databases''',
    topic: '''Relational Calculus & Safety''',
    questionText: '''In Relational Calculus, what is meant by a 'safe' relational calculus expression?''',
    options: ['''An expression that is guaranteed to evaluate to a finite relation whose domain is restricted to the constants appearing in the query or the database relations.''', '''An expression that contains no NOT (¬) logical operators.''', '''An expression that uses only universal quantifiers (∀).''', '''An expression that runs without creating deadlocks in concurrent transactions.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''A relational calculus expression is defined as 'safe' if it is guaranteed to generate a finite result and all attribute values in the resulting tuples belong to the domain of the expression (Dom(E)), which consists of all constants occurring in the formula or within the referenced relations. Expressions violating safety (like { t | ¬(t ∈ R) }) could return an infinite number of tuples from an infinite domain. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q63',
    year: 2026,
    subject: '''Databases''',
    topic: '''B-Trees & Indexing''',
    questionText: '''A B-tree of order 5 (meaning each node can contain at most 4 keys and at most 5 child pointers) is used to index database records. The tree has a height of 3 (where the root is at level 1, its children at level 2, and leaves at level 3). What is the maximum number of keys that can be stored in this 3-level B-tree? (Answer in integer)''',
    options: [],
    correctAnswer: '''124''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''To maximize keys in a B-tree of order m = 5:
- Level 1 (root): 1 node with maximum 4 keys and 5 children.
- Level 2: 5 nodes, each containing maximum 4 keys and 5 children ⇒ 5 * 4 = 20 keys, 5 * 5 = 25 children.
- Level 3 (leaves): 25 leaf nodes, each containing maximum 4 keys ⇒ 25 * 4 = 100 keys.
Total maximum keys = Level 1 + Level 2 + Level 3 = 4 + 20 + 100 = 124 keys.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q64',
    year: 2026,
    subject: '''Computer Networks''',
    topic: '''Distance Vector Routing & Count-to-Infinity''',
    questionText: '''In a network running Distance Vector Routing, node A and node B are connected by a link of cost 1. Node B is directly connected to destination D with cost 1. Initially, node A reaches D via B with cost 2, and node B reaches D directly with cost 1. The link between B and D abruptly fails. Node B detects the failure and updates its route to D using node A's advertised cost: cost = 1 (link AB) + 2 (A's cost) = 3 via A. If the network protocol sets the count-to-infinity metric at 16, how many total route update packets will node B transmit to node A before both nodes recognize destination D as unreachable (cost = 16)? (Answer in integer)''',
    options: [],
    correctAnswer: '''8''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Trace updates transmitted by B as the count-to-infinity progresses:
1. B updates to 3 via A, transmits update [D: 3] to A. (Update 1)
   A receives 3, updates its cost to 3 + 1 = 4 via B, transmits [D: 4] to B.
2. B receives 4, updates its cost to 4 + 1 = 5 via A, transmits [D: 5] to A. (Update 2)
   A receives 5, updates its cost to 5 + 1 = 6 via B, transmits [D: 6] to B.
3. B receives 6, updates to 7, transmits [D: 7]. (Update 3) -> A sets 8.
4. B receives 8, updates to 9, transmits [D: 9]. (Update 4) -> A sets 10.
5. B receives 10, updates to 11, transmits [D: 11]. (Update 5) -> A sets 12.
6. B receives 12, updates to 13, transmits [D: 13]. (Update 6) -> A sets 14.
7. B receives 14, updates to 15, transmits [D: 15]. (Update 7) -> A sets 16 (infinity).
8. B receives 16, recognizes that D is unreachable, sets cost to 16, and transmits [D: 16]. (Update 8)
Total update messages transmitted by node B = 8.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK3_Q65',
    year: 2026,
    subject: '''Computer Networks''',
    topic: '''IPv4 Fragmentation''',
    questionText: '''An IPv4 datagram has a total length of 4500 bytes (including a 20-byte IP header and 4480 bytes of data payload). It must traverse a network link whose Maximum Transmission Unit (MTU) is 1500 bytes (including 20 bytes of IP header). What is the integer value of the Fragment Offset field in the THIRD fragment? (Recall that Fragment Offset counts 8-byte blocks). (Answer in integer)''',
    options: [],
    correctAnswer: '''370''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''1. MTU = 1500 bytes. With 20-byte IP header, the maximum data payload per fragment = 1500 - 20 = 1480 bytes.
2. Since 1480 is divisible by 8 (1480 / 8 = 185 blocks), each full fragment carries 1480 bytes of payload.
3. Fragment 1: carries data bytes 0 to 1479. Fragment Offset = 0 / 8 = 0, MF = 1.
4. Fragment 2: carries data bytes 1480 to 2959. Fragment Offset = 1480 / 8 = 185, MF = 1.
5. Fragment 3: carries data bytes 2960 to 4439. Fragment Offset = 2960 / 8 = 370, MF = 1.
6. Fragment 4: carries the remaining data bytes 4440 to 4479 (40 bytes). Fragment Offset = 4440 / 8 = 555, MF = 0.
Thus, the Fragment Offset in the THIRD fragment is 370.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
];
