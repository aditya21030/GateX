// AUTO-GENERATED GATE CS MOCK 2 QUESTIONS (ULTRA-TOUGH FACULTY LEVEL)
import '../models/models.dart';

final List<PYQ> csFullMock2Questions = [
  PYQ(
    id: 'CS_MOCK2_Q01',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Verbal Ability''',
    questionText: '''Select the word that is closest in meaning to the capitalized word in the given context:
"The research committee criticized the initial dissertation for containing several SPECIOUS arguments that appeared sound and mathematically rigorous on the surface, but collapsed under rigorous formal counterexamples."''',
    options: ['''Deceptively plausible but actually fallacious''', '''Deeply obscure and mathematically intractable''', '''Empirically verified and irrefutable''', '''Pedantically trivial and overly verbose'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: ''''Specious' denotes an argument or claim that is superficially plausible or attractive, but is fundamentally wrong or deceptive upon deeper scrutiny. Hence, Option A ('Deceptively plausible but actually fallacious') is the exact contextual synonym.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q02',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Logical Reasoning''',
    questionText: '''Consider the following premises:
1. Every polynomial-time verifiable language belongs to NP.
2. If language L is NP-complete, then L is in P if and only if P = NP.
3. Language SAT is NP-complete.
4. An engineer discovers a deterministic algorithm that decides SAT in O(n^4) time.
Which one of the following is a logically necessary deduction?''',
    options: ['''SAT does not belong to the complexity class P.''', '''Every language in NP can be decided in deterministic polynomial time.''', '''SAT requires exponential time on at least one deterministic Turing machine.''', '''P is a proper subset of NP.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Since SAT is NP-complete and is decided in deterministic O(n^4) polynomial time, SAT belongs to P. By the definition of NP-completeness, if any NP-complete language is in P, then P = NP. Consequently, every problem in NP can be decided by a deterministic Turing machine in polynomial time. Thus, Option B is a logically necessary deduction.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q03',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude''',
    questionText: '''In an engineering department of 40 students, the initial average score on a coding benchmark was calculated as 72.5 marks. During re-evaluation, the professor found two data-entry errors:
- One student's score of 88 was mistakenly entered as 48.
- Another student's score of 54 was mistakenly entered as 74.
What is the correct average score of the 40 students after rectifying both errors?''',
    options: ['''72.0''', '''73.0''', '''73.5''', '''74.0'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Initial total score = 40 * 72.5 = 2900.
Net score correction = (Correct1 - Incorrect1) + (Correct2 - Incorrect2)
= (88 - 48) + (54 - 74) = +40 - 20 = +20 marks.
Correct total score = 2900 + 20 = 2920.
Correct average = 2920 / 40 = 73.0 marks. Hence, Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q04',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Spatial Aptitude''',
    questionText: '''A solid wooden cube of edge length 4 cm has a square tunnel of cross-section 2 cm x 2 cm drilled completely through from the center of the top face to the center of the bottom face. What is the total surface area of the resulting solid (including the interior tunnel walls)?''',
    options: ['''112 cm²''', '''120 cm²''', '''128 cm²''', '''104 cm²'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''1. Original surface area of 6 faces = 6 * (4 * 4) = 96 cm².
2. When drilling the square tunnel, the top and bottom faces each lose an area of 2 * 2 = 4 cm².
   Remaining exterior surface area = 96 - (2 * 4) = 88 cm².
3. Drilling introduces 4 interior tunnel faces. Each interior rectangular face has width 2 cm and height 4 cm (the full height of the cube).
   Interior surface area = 4 * (2 * 4) = 32 cm².
4. Total surface area = 88 + 32 = 120 cm². Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q05',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Verbal / Critical Reasoning''',
    questionText: '''Statement: "Unless the cache hit latency is strictly below 1.5 nanoseconds, the processor pipeline will stall on every load instruction."
Assuming the statement is true, which of the following statements MUST also be true?''',
    options: ['''If the cache hit latency is strictly below 1.5 nanoseconds, the pipeline will never stall on any load instruction.''', '''If the processor pipeline does not stall on every load instruction, then the cache hit latency is strictly below 1.5 nanoseconds.''', '''If the processor pipeline stalls on every load instruction, then the cache hit latency must be at least 1.5 nanoseconds.''', '''If the cache hit latency is at least 1.5 nanoseconds, the processor pipeline will never stall.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''In formal propositional logic, 'Unless P, Q' translates to '¬P → Q' (or equivalently '¬Q → P' by contrapositive law).
Here, P = 'cache hit latency is strictly below 1.5 ns' and Q = 'pipeline stalls on every load instruction'.
The contrapositive statement is: 'If NOT Q, then P' — i.e., 'If the pipeline does not stall on every load instruction, then the cache hit latency is strictly below 1.5 nanoseconds.' Thus, Option B is logically valid.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q06',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Reading Comprehension''',
    questionText: '''Read the following passage carefully:
"In distributed consensus protocols, the FLP impossibility theorem establishes that no deterministic asynchronous algorithm can guarantee consensus in the presence of even a single unannounced fail-stop crash failure. However, real-world distributed systems circumvent this barrier by relaxing either the determinism requirement—via randomized algorithms like Ben-Or's protocol—or the strict asynchrony assumption—via partially synchronous models equipped with failure detectors, as exemplified by Paxos and Raft. Crucially, partially synchronous protocols deliberately sacrifice liveness during periods of severe network partitions, but they strictly preserve safety (consistency) under all operating circumstances."

Based strictly on the passage, which of the following statements is validly inferred?''',
    options: ['''Randomized consensus protocols like Ben-Or's protocol guarantee termination in a bounded number of steps under all conditions.''', '''Paxos and Raft guarantee both safety and liveness simultaneously even during prolonged network partitions.''', '''In partially synchronous consensus systems, data consistency is never compromised even when network delays cause consensus progress to halt temporarily.''', '''The FLP impossibility theorem proves that consensus cannot be reached in fully synchronous networks.'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The passage explicitly states that partially synchronous protocols like Paxos/Raft 'deliberately sacrifice liveness during periods of severe network partitions, but they strictly preserve safety (consistency) under all operating circumstances.' Halting progress corresponds to sacrificing liveness, while maintaining data consistency corresponds to safety. Hence, Option C is validly and directly inferred.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q07',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Combinatorics & Probability''',
    questionText: '''A coding competition has 8 participating teams labelled T1, T2, ..., T8. In the quarter-finals, the 8 teams are partitioned into 4 distinct match pairings chosen uniformly at random. What is the probability that team T1 and team T2 are paired to play against each other in this round?''',
    options: ['''1/8''', '''1/7''', '''1/4''', '''1/28'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Consider team T1. There are 7 other teams available that could be paired with T1, namely {T2, T3, ..., T8}. Since all pairings are generated uniformly at random, T1 is equally likely to be paired with any one of the remaining 7 teams. Therefore, the probability that T1 is paired specifically with T2 is exactly 1/7.
Alternatively, total unordered pairings of 8 teams into 4 matches = 8! / (4! * 2^4) = 105. Pairings where T1 and T2 are matched leave 6 teams to be paired into 3 matches = 6! / (3! * 2^3) = 15. Probability = 15 / 105 = 1/7. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q08',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude''',
    questionText: '''Three compute nodes W1, W2, and W3 process a batch of independent data chunks.
- Nodes W1 and W2 working together finish the entire batch in 12 minutes.
- Nodes W2 and W3 working together finish the batch in 15 minutes.
- Nodes W1 and W3 working together finish the batch in 20 minutes.
How many minutes would node W1 take to complete the entire batch working alone?''',
    options: ['''20 minutes''', '''24 minutes''', '''30 minutes''', '''40 minutes'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Let the processing rates of W1, W2, W3 in batch/min be r1, r2, r3.
1) r1 + r2 = 1/12
2) r2 + r3 = 1/15
3) r1 + r3 = 1/20
Summing all three equations:
2 * (r1 + r2 + r3) = 1/12 + 1/15 + 1/20 = (5 + 4 + 3) / 60 = 12 / 60 = 1/5.
So r1 + r2 + r3 = 1/10.
To find r1:
r1 = (r1 + r2 + r3) - (r2 + r3) = 1/10 - 1/15 = (3 - 2) / 30 = 1/30 batch/min.
Therefore, node W1 takes 30 minutes working alone. Option C is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q09',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Spatial & Functional Analysis''',
    questionText: '''For all real x >= 0, a signal amplitude function G(x) is defined by:
G(x) = max(x - 4, 0) - 2 * max(x - 8, 0) + max(x - 12, 0)
What is the maximum value attained by G(x) over the real interval [0, 16]?''',
    options: ['''2''', '''4''', '''6''', '''8'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Evaluating G(x) piecewise across critical boundary points:
- For x in [0, 4]: G(x) = 0 - 0 + 0 = 0.
- For x in [4, 8]: G(x) = (x - 4) - 0 + 0 = x - 4. At x = 4, G(4) = 0; at x = 8, G(8) = 8 - 4 = 4.
- For x in [8, 12]: G(x) = (x - 4) - 2(x - 8) + 0 = 12 - x. At x = 8, G(8) = 4; at x = 12, G(12) = 0.
- For x in [12, 16]: G(x) = (x - 4) - 2(x - 8) + (x - 12) = 0.
The function rises linearly from 0 at x = 4 to a peak of 4 at x = 8, and decreases back to 0 at x = 12. Thus, the global maximum value is 4. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q10',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Analytical Network Reasoning''',
    questionText: '''Five microservices S1, S2, S3, S4, S5 communicate along strictly directed network channels:
- S1 can transmit directly to S2 and S3.
- S2 can transmit directly to S4.
- S3 can transmit directly to S4 and S5.
- S4 can transmit directly to S5.
If microservice S3 experiences a complete hardware crash and cannot receive or forward any packets, which of the services in {S2, S4, S5} can still successfully receive messages originating from S1?''',
    options: ['''S2 only''', '''S2 and S4 only''', '''S4 and S5 only''', '''S2, S4, and S5'''],
    correctAnswer: '''D''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Examining alternate directed paths from S1 when S3 is removed:
1. Path to S2: S1 -> S2 (intact, independent of S3).
2. Path to S4: S1 -> S2 -> S4 (intact, independent of S3).
3. Path to S5: S1 -> S2 -> S4 -> S5 (intact, independent of S3).
All three microservices {S2, S4, S5} remain reachable from S1 via node S2. Option D is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q11',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Propositional Logic''',
    questionText: '''Consider the following two propositional logic formulas:
α = (p → q) → r
β = p → (q → r)
Which of the following statements is CORRECT?''',
    options: ['''α and β are logically equivalent.''', '''α logically implies β, but β does not logically imply α.''', '''β logically implies α, but α does not logically imply β.''', '''Neither formula logically implies the other.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Truth table evaluation:
1. Consider the truth assignment p = F, q = T, r = F:
   In α: (F → T) = T; then T → F is FALSE.
   In β: (q → r) = (T → F) = F; then p → F = (F → F) is TRUE.
   Since α is False while β is True, α and β are not logically equivalent, and β does not imply α.
2. Checking α → β across all 8 truth assignments reveals that whenever α is True, β is also True (the only case where β is False is p=T, q=T, r=F, where α is also False: (T→T)→F = F). Thus, α → β is a tautology (α logically implies β). Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q12',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Eigenvalues & Matrices''',
    questionText: '''Let A be a 3 x 3 real matrix such that trace(A) = 6 and det(A) = 6. If λ = 1 is one of the eigenvalues of A, what are the other two eigenvalues of A?''',
    options: ['''2 and 3''', '''-2 and -3''', '''1 and 6''', '''0 and 5'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Let the three eigenvalues of A be λ1 = 1, λ2, and λ3.
Properties of eigenvalues of matrix A:
1. Sum of eigenvalues = trace(A) ⇒ 1 + λ2 + λ3 = 6 ⇒ λ2 + λ3 = 5.
2. Product of eigenvalues = det(A) ⇒ 1 * λ2 * λ3 = 6 ⇒ λ2 * λ3 = 6.
The quadratic equation with roots λ2 and λ3 is:
t² - (sum)t + (product) = 0 ⇒ t² - 5t + 6 = 0 ⇒ (t - 2)(t - 3) = 0.
Thus, the other two eigenvalues are 2 and 3. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q13',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Limits & Continuity''',
    questionText: '''Consider the function f: ℝ → ℝ defined by:
f(x) = (sin(4x) + k * x) / (2x) for x ≠ 0, and f(0) = 7
If f(x) is continuous at x = 0, what is the value of the constant k? (Answer in integer)''',
    options: [],
    correctAnswer: '''10''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''For f(x) to be continuous at x = 0, we must have lim_{x → 0} f(x) = f(0) = 7.
Evaluating the limit:
lim_{x → 0} [(sin(4x) + k*x) / (2x)] = lim_{x → 0} [sin(4x) / (2x)] + lim_{x → 0} [(k*x) / (2x)]
= lim_{x → 0} [2 * (sin(4x) / (4x))] + k/2
= 2 * (1) + k/2 = 2 + k/2.
Setting the limit equal to f(0):
2 + k/2 = 7 ⇒ k/2 = 5 ⇒ k = 10.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q14',
    year: 2026,
    subject: '''Probability and Statistics''',
    topic: '''Bayes' Theorem''',
    questionText: '''A static analyzer for detecting concurrency bugs has a false positive rate of 5% (i.e., Pr(Alarm | Bug Absent) = 0.05) and a sensitivity of 95% (i.e., Pr(Alarm | Bug Present) = 0.95). In a repository of microservices, 1% of all modules actually contain a concurrency bug. A randomly selected module triggers an alarm. The posterior probability that this module actually contains the bug is ________% (rounded off to the nearest integer).''',
    options: [],
    correctAnswer: '''16''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Let B denote the event that the module has a bug, and A denote the event that an alarm is raised.
Given:
Pr(B) = 0.01, Pr(¬B) = 0.99
Pr(A | B) = 0.95
Pr(A | ¬B) = 0.05
Using Bayes' Theorem:
Pr(B | A) = [Pr(A | B) * Pr(B)] / [Pr(A | B) * Pr(B) + Pr(A | ¬B) * Pr(¬B)]
Numerator = 0.95 * 0.01 = 0.0095
Denominator = 0.0095 + (0.05 * 0.99) = 0.0095 + 0.0495 = 0.0590
Pr(B | A) = 0.0095 / 0.0590 = 19 / 118 ≈ 0.161017 (or 16.10%).
Rounding to the nearest integer yields 16.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q15',
    year: 2026,
    subject: '''Digital Logic''',
    topic: '''Boolean Algebra & K-Maps''',
    questionText: '''Consider the Boolean function F(A, B, C, D) given by the sum of minterms:
F(A, B, C, D) = ∑ m(0, 2, 5, 7, 8, 10, 13, 15)
Which of the following is the minimal sum-of-products (SOP) expression for F?''',
    options: ['''B' D' + B D''', '''A' C' + A C''', '''A' B + C D\'''', '''A' D' + B' D'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Group the minterms in a 4-variable K-map:
1. Minterms {0, 2, 8, 10}:
   0 = 0000, 2 = 0010, 8 = 1000, 10 = 1010.
   Here B = 0 and D = 0, while A and C vary over all four combinations. This corner quad simplifies to B' D'.
2. Minterms {5, 7, 13, 15}:
   5 = 0101, 7 = 0111, 13 = 1101, 15 = 1111.
   Here B = 1 and D = 1, while A and C vary over all four combinations. This quad simplifies to B D.
Together, these two 4-cell implicants cover all 8 minterms without redundancy.
Thus, F = B' D' + B D (which also equals B ⊙ D). Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q16',
    year: 2026,
    subject: '''Digital Logic''',
    topic: '''Number Representation & Overflow''',
    questionText: '''Let X and Y be two 8-bit signed integers represented in 2's complement format. Which of the following conditions indicate(s) that an arithmetic overflow occurs during the addition Z = X + Y?''',
    options: ['''X > 0 and Y > 0, but the result Z is negative.''', '''X < 0 and Y < 0, but the result Z is non-negative.''', '''The carry into the most significant sign bit position (c_in) differs from the carry out of the sign bit position (c_out).''', '''X > 0 and Y < 0, and the carry out of the sign bit is 1.'''],
    correctAnswer: '''A, B, C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''In 2's complement arithmetic:
1. Adding two positive numbers that yield a negative result indicates positive overflow (Option A is true).
2. Adding two negative numbers that yield a non-negative result indicates negative overflow (Option B is true).
3. In digital hardware, the overflow flag V is generated as V = c_in ⊕ c_out for the MSB sign bit (Option C is true).
4. Adding two numbers of opposite signs (one positive, one negative) can NEVER result in an overflow because the magnitude of the sum is strictly smaller than the larger operand (Option D is false).
Hence, A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q17',
    year: 2026,
    subject: '''Computer Organization and Architecture''',
    topic: '''Machine Instructions & Addressing Modes''',
    questionText: '''Which of the following CPU addressing modes is most suitable for implementing position-independent (relocatable) code where program code can be loaded into arbitrary memory segments without modifying branch target addresses?''',
    options: ['''Absolute (Direct) Addressing''', '''Program Counter (PC) Relative Addressing''', '''Indirect Addressing''', '''Base Register Addressing with Absolute Displacement'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''In Program Counter (PC) Relative Addressing, target branch addresses are specified as a signed offset relative to the current instruction pointer (PC + offset). When the code block is relocated to a different base memory address, the relative distance (offset) between the branch instruction and target label remains constant. Hence, no link-time or load-time address patching is required. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q18',
    year: 2026,
    subject: '''Computer Organization and Architecture''',
    topic: '''Pipelining & Hazards''',
    questionText: '''Consider a standard 5-stage RISC instruction pipeline with stages IF, ID, EX, MEM, WB. Which of the following statements is/are TRUE regarding pipeline hazards and bypass forwarding?''',
    options: ['''A Read-After-Write (RAW) data dependency between two consecutive ALU instructions can be resolved with zero stall cycles using EX-to-EX operand forwarding.''', '''A Read-After-Write (RAW) dependency between a LOAD instruction and an immediately following ALU instruction using the loaded register can be resolved with zero stall cycles using MEM-to-EX forwarding.''', '''Write-After-Read (WAR) and Write-After-Write (WAW) hazards cannot occur in a classic strictly in-order 5-stage pipeline.''', '''Operand forwarding requires bypass multiplexers at the inputs of the Execution (EX) stage.'''],
    correctAnswer: '''A, C, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''1. EX-to-EX forwarding allows the result computed in EX stage of instruction i to be fed directly to the ALU input in EX stage of instruction i+1 with 0 stalls (Option A is true).
2. For a LOAD instruction, data is only retrieved at the end of the MEM stage. An immediately dependent instruction requires the data at the start of its EX stage; hence, at least 1 stall cycle is mandatory (load-use stall) even with forwarding (Option B is false).
3. In a classic strictly in-order pipeline, operand reads always take place in the ID stage and register writes always take place in the WB stage. Because instruction order is strictly maintained, later instructions can never overwrite operands before earlier instructions read them (no WAR) or overwrite earlier writes out of order (no WAW) (Option C is true).
4. Forwarding paths wire results from pipeline registers (EX/MEM and MEM/WB) back to MUXes placed right before the ALU inputs (Option D is true).
Thus, A, C, and D are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q19',
    year: 2026,
    subject: '''Programming and Data Structures''',
    topic: '''C Pointers & Arrays''',
    questionText: '''Consider the following C code snippet:
#include <stdio.h>
int main() {
    int arr[] = {10, 20, 30, 40, 50};
    int *ptr = arr;
    printf("%d ", *(ptr + 3));
    printf("%d", *ptr++);
    return 0;
}
What is the exact output printed by the program?''',
    options: ['''40 10''', '''40 20''', '''30 10''', '''50 20'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''1. `ptr` points initially to `arr[0]` (value 10).
2. `*(ptr + 3)` dereferences the element 3 positions ahead, which is `arr[3]` = 40. Thus, '40 ' is printed first.
3. In `*ptr++`, postfix `++` has higher precedence than `*`, but the value of the postfix expression is the un-incremented pointer. Thus, `*ptr` evaluates to `arr[0]` = 10, after which `ptr` is incremented to point to `arr[1]`. Thus, '10' is printed.
The total output is '40 10'. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q20',
    year: 2026,
    subject: '''Programming and Data Structures''',
    topic: '''Recursion & Static Variables''',
    questionText: '''Consider the following recursive function in C:
int f(int n) {
    static int count = 0;
    count++;
    if (n <= 1) return 1;
    if (n % 2 == 0) return f(n / 2) + count;
    return f(n - 1) + count;
}
What integer value is returned by the call f(6)? (Answer in integer)''',
    options: [],
    correctAnswer: '''13''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Because `count` is static, its value persists across all recursive calls:
1. Call f(6): count increments from 0 to 1. 6 is even -> calls f(3) and will return f(3) + count.
2. Call f(3): count increments from 1 to 2. 3 is odd -> calls f(2) and will return f(2) + count.
3. Call f(2): count increments from 2 to 3. 2 is even -> calls f(1) and will return f(1) + count.
4. Call f(1): count increments from 3 to 4. Base case n <= 1 is met -> returns 1.
Now unwinding the call stack with count = 4:
- Return from f(2): returns f(1) + count = 1 + 4 = 5.
- Return from f(3): returns f(2) + count = 5 + 4 = 9.
- Return from f(6): returns f(3) + count = 9 + 4 = 13.
Hence, the function call f(6) returns 13.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q21',
    year: 2026,
    subject: '''Programming and Data Structures''',
    topic: '''Binary Search Trees''',
    questionText: '''Which of the following statements is/are TRUE for any Binary Search Tree (BST) containing n distinct keys?''',
    options: ['''An inorder traversal of the BST visits all keys in strictly monotonically increasing sorted order.''', '''The node containing the minimum key in any non-empty BST is always a leaf node.''', '''The worst-case time complexity to search for a key in an unaugmented BST is O(n).''', '''If a node in a BST has two children, its in-order predecessor has at most one child.'''],
    correctAnswer: '''A, C, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''1. Inorder traversal (Left, Root, Right) of any valid BST yields keys in strictly increasing order (Option A is true).
2. The minimum key in a BST is the leftmost node; this node may have a right child (e.g., in a tree where root has only a right child, the root is the minimum key and is not a leaf) (Option B is false).
3. In a degenerate skewed BST (e.g. inserting already sorted elements), height is n-1, leading to O(n) search time (Option C is true).
4. The in-order predecessor of a node is the maximum key in its left subtree (the rightmost node of that left subtree). By definition, it cannot possess a right child; therefore, it has at most one child (its left child) (Option D is true).
Hence, A, C, and D are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q22',
    year: 2026,
    subject: '''Programming and Data Structures''',
    topic: '''Binary Heaps''',
    questionText: '''A complete binary max-heap containing 31 distinct elements is stored in an array A[1..31] indexed starting from 1. At which index range are the leaf nodes located in the array?''',
    options: ['''1 to 15''', '''16 to 31''', '''15 to 30''', '''8 to 16'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''In a 1-indexed array representation of a complete binary tree with n elements, the parent of node i is at ⌊i/2⌋, and its children are at 2i and 2i + 1.
An element at index i is an internal node if 2i ≤ n ⇒ i ≤ ⌊n/2⌋.
For n = 31:
Internal nodes are located at indices 1 through ⌊31/2⌋ = 15.
Therefore, the leaf nodes occupy indices ⌊n/2⌋ + 1 through n, which is 16 to 31. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q23',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Recurrences & Asymptotic Analysis''',
    questionText: '''Consider the recurrence relation:
T(n) = 8 T(n/2) + Θ(n³ log n) for n > 1, with T(1) = 1.
Which one of the following is the tight asymptotic bound for T(n)?''',
    options: ['''Θ(n³)''', '''Θ(n³ log n)''', '''Θ(n³ log² n)''', '''Θ(n⁴)'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''We apply the extended Master Theorem to T(n) = a T(n/b) + f(n):
Here a = 8, b = 2, so n^(log_b a) = n^(log₂ 8) = n³.
The driving function is f(n) = Θ(n³ log n) = Θ(n^(log_b a) · log^k n) with k = 1.
According to Master Theorem Case 2 (extended for k ≥ 0):
T(n) = Θ(n^(log_b a) · log^(k+1) n) = Θ(n³ · log² n).
Hence, Option C is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q24',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Graph Traversals & DFS Forest''',
    questionText: '''Let G = (V, E) be a connected, undirected graph with |V| ≥ 3. A Depth-First Search (DFS) is executed on G from an arbitrary source vertex. Which of the following statements is/are TRUE regarding the edge classification in the resulting DFS tree/forest?''',
    options: ['''Every edge in G is classified either as a tree edge or as a back edge.''', '''Cross edges and forward edges never appear during a DFS on an undirected graph.''', '''A back edge in G always connects a vertex to one of its proper ancestors in the DFS tree.''', '''If the DFS discovers no back edges, then G is a tree.'''],
    correctAnswer: '''A, B, C, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''1. In an undirected graph, when an edge (u, v) is explored, if v is already visited, it must be an ancestor of u in the active DFS recursion stack; thus it is a back edge. There are no cross edges or forward edges (Options A and B are true).
2. Back edges by definition connect a descendant node to a proper ancestor in the DFS tree (Option C is true).
3. If no back edges exist, the graph contains no cycles. A connected, acyclic undirected graph is a tree (Option D is true).
Hence, all options A, B, C, and D are TRUE.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q25',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''Regular Languages & Closure''',
    questionText: '''Let L1 and L2 be regular languages over an alphabet Σ, and let L3 be an arbitrary non-regular language. Which of the following languages is/are ALWAYS guaranteed to be regular?''',
    options: ['''L1 ∩ L2''', '''L1 - L2 (Set difference)''', '''L1 ∩ L3''', '''L1ᴿ (Reversal of L1)'''],
    correctAnswer: '''A, B, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''1. Regular languages are closed under intersection: L1 ∩ L2 is always regular (Option A is true).
2. Set difference L1 - L2 = L1 ∩ L2'. Since regular languages are closed under complementation and intersection, L1 - L2 is always regular (Option B is true).
3. For L1 ∩ L3: if we choose L1 = Σ*, then L1 ∩ L3 = L3, which is non-regular by definition. Hence, L1 ∩ L3 is not necessarily regular (Option C is false).
4. Regular languages are closed under string reversal: L1ᴿ is always regular (Option D is true).
Therefore, A, B, and D are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q26',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''DFA Minimization''',
    questionText: '''Consider the language L over the alphabet {0, 1} defined by:
L = { w ∈ {0, 1}* | w contains the substring '101' }
What is the minimum number of states in a Deterministic Finite Automaton (DFA) that accepts L? (Answer in integer)''',
    options: [],
    correctAnswer: '''4''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''To accept strings containing substring '101', the DFA tracks the longest matching prefix of '101':
- State q0 (start): ε (no match yet). On '0' → q0; on '1' → q1.
- State q1: matched prefix '1'. On '1' → q1; on '0' → q2.
- State q2: matched prefix '10'. On '0' → q0; on '1' → q3.
- State q3 (accepting/trap): matched '101'. On '0' → q3; on '1' → q3.
Each of these 4 states represents a distinct equivalence class under the Myhill-Nerode equivalence relation (pairwise distinguishable via strings '01', '1', ε). Thus, exactly 4 states are necessary and sufficient.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q27',
    year: 2026,
    subject: '''Compiler Design''',
    topic: '''Grammar & FOLLOW Sets''',
    questionText: '''Consider the context-free grammar G with start symbol S:
S → A a | b
A → c | ε
Which of the following is the correct set FOLLOW(A)?''',
    options: ['''{ a }''', '''{ a, \$ }''', '''{ c, \$ }''', '''{ b, \$ }'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''To find FOLLOW(A), inspect all productions where A appears on the right-hand side:
In S → A a, the terminal symbol 'a' immediately follows A.
By rule, FIRST('a') = {'a'} is added to FOLLOW(A).
There are no other productions containing A on the RHS, and 'a' cannot derive ε.
Since A is not the start symbol, the end-marker '\$' is not added to FOLLOW(A).
Thus, FOLLOW(A) = { a }. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q28',
    year: 2026,
    subject: '''Compiler Design''',
    topic: '''Compiler Phases & Error Handling''',
    questionText: '''Which of the following programming language errors is/are correctly matched with the compiler phase in which they are detected?''',
    options: ['''Unterminated string literal ("hello) → Lexical Analysis''', '''Mismatched parentheses in an expression ( (a + b) * c ) ) → Syntax Analysis''', '''Type incompatibility in assignment (int x = "compiler";) → Semantic Analysis''', '''Division by zero occurring during program execution with user input → Lexical Analysis'''],
    correctAnswer: '''A, B, C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''1. Scanning an unclosed quotation mark fails to form a valid string token, causing a lexical error (Option A is true).
2. Parentheses mismatch violates the context-free grammar production rules of expressions, detected by the parser (Option B is true).
3. Assigning a string constant to an integer type violates language typing rules, detected by the semantic type checker (Option C is true).
4. Dynamic division by zero depending on runtime input is a runtime execution exception, not a compile-time lexical error (Option D is false).
Hence, A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q29',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''CPU Scheduling''',
    questionText: '''Three processes P1, P2, and P3 arrive simultaneously at time t = 0 with CPU burst times of 5 ms, 8 ms, and 2 ms, respectively. The operating system schedules them using non-preemptive Shortest Job First (SJF). Any tie-breakers favor the process with smaller ID. What is the average turnaround time (in milliseconds) of the three processes? (Answer in integer)''',
    options: [],
    correctAnswer: '''8''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''All processes arrive at t = 0.
Burst times: P1 = 5 ms, P2 = 8 ms, P3 = 2 ms.
Non-preemptive SJF execution schedule:
1. P3 (burst = 2 ms): executes from t = 0 to 2 ms. Completion time = 2 ms.
2. P1 (burst = 5 ms): executes from t = 2 to 7 ms. Completion time = 7 ms.
3. P2 (burst = 8 ms): executes from t = 7 to 15 ms. Completion time = 15 ms.
Turnaround time (TAT = Completion - Arrival):
TAT(P3) = 2 - 0 = 2 ms
TAT(P1) = 7 - 0 = 7 ms
TAT(P2) = 15 - 0 = 15 ms
Average Turnaround Time = (2 + 7 + 15) / 3 = 24 / 3 = 8 ms.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q30',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''Memory Management & Paging''',
    questionText: '''A system uses a 32-bit virtual address space with demand paging. The page size is 4 KB (2¹² bytes). Each Page Table Entry (PTE) requires 4 bytes. If a single-level flat page table is used to map the entire virtual address space of a process, what is the total size of the page table?''',
    options: ['''1 MB''', '''4 MB''', '''8 MB''', '''16 MB'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Virtual address size = 32 bits.
Page size = 4 KB = 2¹² bytes ⇒ Offset = 12 bits.
Number of virtual pages = 2^(32 - 12) = 2²⁰ pages = 1,048,576 pages.
Each Page Table Entry (PTE) takes 4 bytes = 2² bytes.
Total page table size = (Number of entries) * (Size per entry)
= 2²⁰ * 4 bytes = 4 * 2²⁰ bytes = 4 MB. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q31',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''Deadlocks & Coffman Conditions''',
    questionText: '''Which of the following conditions is/are NECESSARY for a deadlock to arise among concurrent processes sharing resources?''',
    options: ['''Mutual Exclusion''', '''Hold and Wait''', '''No Preemption''', '''Circular Wait'''],
    correctAnswer: '''A, B, C, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''According to Coffman et al. (1971), a deadlock can occur if and only if all four Coffman conditions hold simultaneously in the system:
1. Mutual Exclusion: at least one resource must be held in a non-shareable mode.
2. Hold and Wait: a process holding allocated resources can request additional resources.
3. No Preemption: resources cannot be forcibly seized from a process; they can only be released voluntarily.
4. Circular Wait: a closed directed cycle of processes exists where each process waits for a resource held by the next.
All four are strictly necessary conditions. Hence, A, B, C, and D are all correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q32',
    year: 2026,
    subject: '''Databases''',
    topic: '''Functional Dependencies & Superkeys''',
    questionText: '''Consider a relational database schema R(A, B, C, D, E) with the set of functional dependencies:
F = { A → B, A → C, B → D, C → E }
What is the total number of superkeys for relation schema R? (Answer in integer)''',
    options: [],
    correctAnswer: '''16''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''1. Attribute closure of A: A⁺ = {A, B, C, D, E}.
   Since A⁺ contains all attributes of R, {A} is a candidate key.
2. Looking at the right-hand sides of FDs in F: B, C, D, and E all appear on the RHS. Attribute A NEVER appears on the RHS of any functional dependency. Therefore, A must be present in every candidate key of R.
3. Since {A} alone determines all attributes and A is essential, {A} is the sole candidate key of R.
4. A superkey is any superset of a candidate key. Any subset of {A, B, C, D, E} that contains attribute A forms a valid superkey.
   The remaining 4 attributes {B, C, D, E} can either be included or excluded independently.
   Total number of superkeys = 2⁴ = 16.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q33',
    year: 2026,
    subject: '''Databases''',
    topic: '''Relational Algebra''',
    questionText: '''Let R(A, B) and S(B, C) be two relations. Which of the following relational algebra expressions is strictly equivalent to the natural join R ⋈ S?''',
    options: ['''Π_{R.A, R.B, S.C} ( σ_{R.B = S.B} (R × S) )''', '''σ_{R.B = S.B} ( Π_{R.A, S.C} (R × S) )''', '''Π_{R.A, S.C} (R × S)''', '''σ_{R.A = S.C} (R × S)'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''By definition, the natural join R ⋈ S over common attribute B:
1. Computes the Cartesian product R × S.
2. Selects tuples where common join attributes are equal: σ_{R.B = S.B} (R × S).
3. Projects the distinct attributes {R.A, R.B, S.C}, thereby removing duplicate join columns.
This corresponds precisely to Option A.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q34',
    year: 2026,
    subject: '''Computer Networks''',
    topic: '''IP Addressing & CIDR Subnetting''',
    questionText: '''An organization is assigned the network block 198.51.100.0/24. The network administrator partitions this block into 8 equal-sized subnets. What is the subnet mask and the maximum number of usable host IP addresses in each subnet?''',
    options: ['''Subnet mask 255.255.255.224, with 30 usable host addresses per subnet''', '''Subnet mask 255.255.255.240, with 14 usable host addresses per subnet''', '''Subnet mask 255.255.255.192, with 62 usable host addresses per subnet''', '''Subnet mask 255.255.255.224, with 32 usable host addresses per subnet'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Original prefix: /24.
To create 8 subnets: 8 = 2³, so 3 bits are borrowed from the host portion.
New subnet prefix length = 24 + 3 = /27.
Subnet mask for /27: 24 ones followed by 3 ones and 5 zeros = 255.255.255.224 (since 128 + 64 + 32 = 224).
Host bits remaining per subnet = 32 - 27 = 5 bits.
Total IP addresses per subnet = 2⁵ = 32.
Usable host addresses = 2⁵ - 2 = 30 (excluding the network identifier and directed broadcast address).
Hence, Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q35',
    year: 2026,
    subject: '''Computer Networks''',
    topic: '''Network Protocols & OSI Layers''',
    questionText: '''Which of the following statements is/are TRUE regarding internet protocols and OSI layer architecture?''',
    options: ['''DNS standard queries normally use UDP port 53, but DNS zone transfers between servers use TCP port 53.''', '''BGP (Border Gateway Protocol) establishes reliable routing sessions over TCP on well-known port 179.''', '''ARP (Address Resolution Protocol) maps an IPv4 address to its corresponding physical MAC address on a local area network.''', '''ICMP messages are transmitted directly over Data Link frames without requiring an IP header encapsulation.'''],
    correctAnswer: '''A, B, C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''1. DNS uses UDP port 53 for lightweight lookup queries, but switches to TCP port 53 for large zone transfers (AXFR) or replies exceeding 512 bytes (Option A is true).
2. BGP uses TCP port 179 for reliability across autonomous systems (Option B is true).
3. ARP broadcasts requests on the local Ethernet segment to map a known 32-bit IP address to a 48-bit MAC address (Option C is true).
4. ICMP messages are encapsulated directly within IP datagrams (IP protocol field = 1); they do not bypass the IP network layer (Option D is false).
Hence, A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q36',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Graph Theory & Planar Graphs''',
    questionText: '''Let G = (V, E) be a connected simple planar graph with |V| = 20 vertices and girth at least 5 (i.e., every cycle in G has length at least 5). What is the maximum possible number of edges in G?''',
    options: ['''27''', '''30''', '''36''', '''54'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''For any connected planar graph with |V| vertices, |E| edges, and |F| faces, Euler's formula states:
|V| - |E| + |F| = 2.
Since the girth is at least 5, every face in any planar embedding is bounded by at least 5 edges:
2|E| = ∑_{f ∈ F} deg(f) ≥ 5|F| ⇒ |F| ≤ (2/5)|E|.
Substituting into Euler's formula:
|V| - |E| + (2/5)|E| ≥ 2
|V| - (3/5)|E| ≥ 2
20 - 2 ≥ (3/5)|E|
18 ≥ (3/5)|E| ⇒ |E| ≤ (18 * 5) / 3 = 30.
Thus, the maximum possible number of edges is 30. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q37',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Algebraic Structures & Monoids''',
    questionText: '''Consider the set S of all functions from the set of integers ℤ to ℤ, under the binary operation of function composition (∘), defined by (f ∘ g)(x) = f(g(x)). Which of the following statements is/are TRUE?''',
    options: ['''(S, ∘) is a monoid.''', '''(S, ∘) is a commutative (Abelian) monoid.''', '''The subset of all bijective functions from ℤ to ℤ forms a non-Abelian group under composition.''', '''Every element in S has a two-sided inverse in S.'''],
    correctAnswer: '''A, C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''1. Function composition is universally associative: (f ∘ (g ∘ h)) = ((f ∘ g) ∘ h). The identity function id(x) = x satisfies (f ∘ id) = (id ∘ f) = f. Thus, (S, ∘) is a monoid with identity id (Option A is true).
2. Function composition is generally non-commutative (e.g. f(x) = x + 1, g(x) = 2x gives f(g(x)) = 2x + 1 ≠ 2x + 2 = g(f(x))) (Option B is false).
3. Bijective functions form the symmetric group Sym(ℤ), which satisfies closure, associativity, identity, and inverses, and is non-Abelian (Option C is true).
4. Non-bijective functions (such as constant functions f(x) = 0) do not possess inverses (Option D is false).
Hence, A and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q38',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Combinatorics & Generating Functions''',
    questionText: '''What is the number of integer solutions to the equation:
x1 + x2 + x3 + x4 = 20
subject to the constraints 1 ≤ x1 ≤ 6, 1 ≤ x2 ≤ 6, 1 ≤ x3 ≤ 6, and 1 ≤ x4 ≤ 6? (Answer in integer)''',
    options: [],
    correctAnswer: '''35''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Substitute y_i = x_i - 1. Since 1 ≤ x_i ≤ 6, we have 0 ≤ y_i ≤ 5 for all i ∈ {1, 2, 3, 4}.
The equation becomes:
y1 + y2 + y3 + y4 = 20 - 4 = 16, with 0 ≤ y_i ≤ 5.
Using the transformation z_i = 5 - y_i:
Since 0 ≤ y_i ≤ 5, we have 0 ≤ z_i ≤ 5.
Summing: z1 + z2 + z3 + z4 = 4 * 5 - (y1 + y2 + y3 + y4) = 20 - 16 = 4.
Since each z_i ≥ 0 and their sum is 4, the condition z_i ≤ 5 is automatically satisfied for all variables!
Thus, the problem reduces to finding the number of non-negative integer solutions to:
z1 + z2 + z3 + z4 = 4.
By stars and bars formula:
C(n + k - 1, k) = C(4 + 4 - 1, 4) = C(7, 4) = 7! / (4! * 3!) = (7 * 6 * 5) / 6 = 35.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q39',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''System of Linear Equations & Rank-Nullity''',
    questionText: '''Consider the 3 x 4 coefficient matrix A:
A = 
[[1, 2, 0, 1],
 [2, 4, 1, 3],
 [3, 6, 1, 4]]
Which of the following statements is/are TRUE?''',
    options: ['''The rank of matrix A is 2.''', '''The dimension of the null space (nullity) of A is 2.''', '''The non-homogeneous linear system A x = [1, 2, 3]ᵀ has infinitely many solutions.''', '''The vector [2, -1, 0, 0]ᵀ belongs to the null space of A.'''],
    correctAnswer: '''A, B, C, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''1. Perform Gaussian elimination on A:
   R2 ← R2 - 2*R1 ⇒ [0, 0, 1, 1]
   R3 ← R3 - 3*R1 ⇒ [0, 0, 1, 1]
   R3 ← R3 - R2 ⇒ [0, 0, 0, 0]
   The row echelon form has 2 non-zero rows, so rank(A) = 2 (Option A is true).
2. By the Rank-Nullity theorem: rank(A) + nullity(A) = number of columns = 4 ⇒ nullity(A) = 4 - 2 = 2 (Option B is true).
3. For b = [1, 2, 3]ᵀ, notice Row 3 = Row 1 + Row 2. The RHS satisfies 3 = 1 + 2; hence rank([A | b]) = rank(A) = 2 < 4. Therefore, the system is consistent with infinitely many solutions (Option C is true).
4. Multiplying A with [2, -1, 0, 0]ᵀ:
   Row 1: 1(2) + 2(-1) = 0
   Row 2: 2(2) + 4(-1) = 0
   Row 3: 3(2) + 6(-1) = 0
   Thus A * [2, -1, 0, 0]ᵀ = [0, 0, 0]ᵀ, confirming it is in the null space (Option D is true).
Hence, all statements A, B, C, and D are TRUE.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q40',
    year: 2026,
    subject: '''Probability and Statistics''',
    topic: '''Continuous Random Variables & Variance''',
    questionText: '''Let X be a continuous random variable with probability density function (PDF):
f(x) = c * (4 - x²) for -2 ≤ x ≤ 2, and f(x) = 0 otherwise.
What is the variance of X, Var(X)? (rounded off to two decimal places)''',
    options: [],
    correctAnswer: '''0.80''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''1. Find normalizing constant c:
   ∫_{-2}^{2} c (4 - x²) dx = 2c ∫_{0}^{2} (4 - x²) dx = 2c [4x - x³/3]_0^2 = 2c (8 - 8/3) = 2c (16/3) = 32c/3 = 1 ⇒ c = 3/32.
2. Since f(x) is an even function centered about 0, the expected value E[X] = 0.
3. Variance Var(X) = E[X²] - (E[X])² = E[X²]:
   E[X²] = ∫_{-2}^{2} x² · (3/32)(4 - x²) dx = 2 · (3/32) ∫_{0}^{2} (4x² - x⁴) dx
   = (3/16) [ (4x³/3) - (x⁵/5) ]_0^2 = (3/16) [ (32/3) - (32/5) ] = (3/16) * 32 * [1/3 - 1/5]
   = 6 * (2/15) = 12/15 = 4/5 = 0.80.
Rounding to two decimal places gives 0.80.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q41',
    year: 2026,
    subject: '''Digital Logic''',
    topic: '''Sequential Circuits & Counters''',
    questionText: '''A synchronous 3-bit counter is constructed using three D flip-flops with outputs Q2, Q1, Q0 (where Q2 is the most significant bit). The flip-flop inputs are connected as:
D2 = Q1 ⊕ Q0
D1 = Q2'
D0 = Q1
If the counter is initialized to the state Q2 Q1 Q0 = 0 0 1, what will be the state of the counter after 4 clock pulses?''',
    options: ['''0 0 0''', '''1 0 0''', '''1 1 0''', '''0 1 1'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Trace the synchronous state transitions step-by-step:
- Initial State (t = 0): Q2 = 0, Q1 = 0, Q0 = 1
  Inputs: D2 = 0 ⊕ 1 = 1, D1 = 0' = 1, D0 = 0
- After Clock 1 (t = 1): Q2 = 1, Q1 = 1, Q0 = 0
  Inputs: D2 = 1 ⊕ 0 = 1, D1 = 1' = 0, D0 = 1
- After Clock 2 (t = 2): Q2 = 1, Q1 = 0, Q0 = 1
  Inputs: D2 = 0 ⊕ 1 = 1, D1 = 1' = 0, D0 = 0
- After Clock 3 (t = 3): Q2 = 1, Q1 = 0, Q0 = 0
  Inputs: D2 = 0 ⊕ 0 = 0, D1 = 1' = 0, D0 = 0
- After Clock 4 (t = 4): Q2 = 0, Q1 = 0, Q0 = 0
Thus, after 4 clock pulses, the counter state is 0 0 0. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q42',
    year: 2026,
    subject: '''Digital Logic''',
    topic: '''IEEE 754 Floating-Point Arithmetic''',
    questionText: '''Consider two real numbers X and Y represented in the IEEE 754 single-precision (32-bit) floating-point format given in hexadecimal notation:
X = 0x41400000
Y = 0x41C00000
Let Z = X + Y. Which one of the following is the IEEE 754 hexadecimal representation of Z?''',
    options: ['''0x42100000''', '''0x42080000''', '''0x41E00000''', '''0x42200000'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''1. Decode X = 0x41400000:
   Binary: 0 10000010 10000000000000000000000
   Sign = 0 (positive)
   Biased exponent = 10000010₂ = 130 ⇒ True exponent e = 130 - 127 = 3
   Mantissa = 1.100...₂ = 1.5
   Value of X = 1.5 * 2³ = 12.0
2. Decode Y = 0x41C00000:
   Binary: 0 10000011 10000000000000000000000
   Sign = 0 (positive)
   Biased exponent = 10000011₂ = 131 ⇒ True exponent e = 131 - 127 = 4
   Mantissa = 1.100...₂ = 1.5
   Value of Y = 1.5 * 2⁴ = 24.0
3. Compute sum Z = X + Y = 12.0 + 24.0 = 36.0
4. Encode 36.0 into IEEE 754 format:
   36 = 32 + 4 = 100100₂ = 1.00100₂ * 2⁵
   Sign bit = 0
   Biased exponent = 5 + 127 = 132 = 10000100₂
   Fraction (23 bits) = 00100000000000000000000
   Binary: 0100 0010 0001 0000 0000 0000 0000 0000
   Hexadecimal: 0x42100000. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q43',
    year: 2026,
    subject: '''Computer Organization and Architecture''',
    topic: '''Cache Memory Organization''',
    questionText: '''A computer system features a 36-bit physical byte address. The processor utilizes a 4-way set-associative cache with a total data capacity of 256 KB. Each cache block (line) contains 64 bytes. What is the length of the TAG field in bits? (Answer in integer)''',
    options: [],
    correctAnswer: '''20''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''1. Block size = 64 bytes = 2⁶ bytes ⇒ Block offset field = 6 bits.
2. Total cache capacity = 256 KB = 256 * 2¹⁰ bytes = 2¹⁸ bytes.
3. Total number of cache lines = Capacity / Block size = 2¹⁸ / 2⁶ = 2¹² lines = 4096 lines.
4. Since it is 4-way set-associative (K = 4 = 2²):
   Number of sets = (Total lines) / 4 = 2¹² / 2² = 2¹⁰ sets = 1024 sets.
   Set index field = log₂(1024) = 10 bits.
5. Address breakdown: Physical Address (36 bits) = Tag + Set Index (10 bits) + Block Offset (6 bits).
   Tag bits = 36 - (10 + 6) = 36 - 16 = 20 bits.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q44',
    year: 2026,
    subject: '''Computer Organization and Architecture''',
    topic: '''Pipelining & Stalls''',
    questionText: '''A 5-stage instruction pipeline (IF, ID, EX, MEM, WB) operates with a clock cycle of 1 nanosecond. A program comprising 100 instructions is executed. In this benchmark:
- 20% of the instructions are branch instructions.
- 75% of the branch instructions are taken.
- Branch outcomes are resolved at the end of the EX stage, incurring a 2-cycle penalty for every taken branch.
- 30% of the instructions are LOAD instructions, and 50% of these LOAD instructions are immediately followed by an instruction that depends on the loaded value, incurring a 1-cycle stall.
- There are no other hazards or stalls in the pipeline.
What is the total execution time of the program in clock cycles? (Answer in integer)''',
    options: [],
    correctAnswer: '''149''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''1. In an ideal 5-stage pipeline with no stalls, the base clock cycles for N = 100 instructions and k = 5 stages is:
   Cycles_ideal = k + N - 1 = 5 + 100 - 1 = 104 cycles.
2. Branch penalty stalls:
   Total branch instructions = 20% of 100 = 20.
   Taken branches = 75% of 20 = 15 instructions.
   Each taken branch incurs 2 stall cycles.
   Stall_branch = 15 * 2 = 30 clock cycles.
3. Load-use hazard stalls:
   Total LOAD instructions = 30% of 100 = 30.
   Hazardous LOAD instructions = 50% of 30 = 15 instructions.
   Each incurs 1 stall cycle.
   Stall_load = 15 * 1 = 15 clock cycles.
4. Total clock cycles = Cycles_ideal + Stall_branch + Stall_load = 104 + 30 + 15 = 149 cycles.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q45',
    year: 2026,
    subject: '''Programming and Data Structures''',
    topic: '''C Pointers to Pointers''',
    questionText: '''Consider the following C program:
#include <stdio.h>
int main() {
    char *s[] = {"GATE", "CSIT", "EXAM", "TOPPER"};
    char **ptr[] = {s + 3, s + 2, s + 1, s};
    char ***pptr = ptr;
    printf("%s ", **++pptr);
    printf("%s", *--*++pptr + 1);
    return 0;
}
What is the exact output printed by the program?''',
    options: ['''EXAM ATE''', '''EXAM GATE''', '''CSIT ATE''', '''EXAM SIT'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Trace pointer operations with right-to-left associativity:
1. Array s contains: s[0]="GATE", s[1]="CSIT", s[2]="EXAM", s[3]="TOPPER".
2. Array ptr contains: ptr[0]=s+3, ptr[1]=s+2, ptr[2]=s+1, ptr[3]=s.
3. pptr points initially to ptr[0].
4. First statement: `printf("%s ", **++pptr);`
   - `++pptr` advances pptr to point to ptr[1].
   - `*pptr` yields ptr[1] = (s + 2).
   - `**pptr` yields *(s + 2) = s[2] = "EXAM".
   - Prints 'EXAM '.
5. Second statement: `printf("%s", *--*++pptr + 1);`
   - `++pptr` advances pptr to point to ptr[2] (which currently holds value s + 1).
   - `*++pptr` evaluates to the lvalue ptr[2].
   - `--(*++pptr)` decrements the pointer stored at ptr[2] from (s + 1) to s.
   - `*(--*++pptr)` dereferences s to yield s[0] = "GATE".
   - `+ 1` offsets the string pointer to "GATE" + 1 = "ATE".
   - Prints 'ATE'.
Total output is 'EXAM ATE'. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q46',
    year: 2026,
    subject: '''Programming and Data Structures''',
    topic: '''2D Arrays & Pointer Arithmetic''',
    questionText: '''Consider the following C program segment:
#include <stdio.h>
int main() {
    int A[3][3] = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
    int *p = (int *)A;
    int sum = 0;
    for (int i = 0; i < 9; i += 2) {
        sum += *(p + i);
    }
    printf("%d", sum);
    return 0;
}
What integer value is printed by the program? (Answer in integer)''',
    options: [],
    correctAnswer: '''25''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''In C, a 2D array `A[3][3]` is stored contiguously in row-major memory order:
Index 0: A[0][0] = 1
Index 1: A[0][1] = 2
Index 2: A[0][2] = 3
Index 3: A[1][0] = 4
Index 4: A[1][1] = 5
Index 5: A[1][2] = 6
Index 6: A[2][0] = 7
Index 7: A[2][1] = 8
Index 8: A[2][2] = 9
The pointer `p` points to index 0. The loop iterates over indices i = 0, 2, 4, 6, 8 (stepping by 2):
sum = *(p+0) + *(p+2) + *(p+4) + *(p+6) + *(p+8)
= 1 + 3 + 5 + 7 + 9 = 25.
Thus, the printed value is 25.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q47',
    year: 2026,
    subject: '''Programming and Data Structures''',
    topic: '''B+ Trees & File Indexing''',
    questionText: '''Consider a B+ tree of order m = 5, where the order m denotes the maximum number of child pointers that an internal node can hold. Assume that each internal node contains at most m - 1 keys and each leaf node can store at most m - 1 keys and at least ⌈(m - 1)/2⌉ keys. Which of the following statements is/are TRUE?''',
    options: ['''Every internal node other than the root must contain at least 3 child pointers.''', '''Each leaf node can store at most 4 keys.''', '''If the root node is not a leaf node, it must have at least 2 children.''', '''The minimum number of keys that any non-root leaf node can contain is 2.'''],
    correctAnswer: '''A, B, C, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''For a B+ tree of order m = 5:
1. Non-root internal nodes must have at least ⌈m/2⌉ child pointers: ⌈5/2⌉ = 3 children (Option A is true).
2. Maximum keys in any node (internal or leaf) is m - 1 = 5 - 1 = 4 keys (Option B is true).
3. By B+ tree definition, the root node has at least 2 children if it is not a leaf (Option C is true).
4. Minimum keys in a non-root leaf node is ⌈(m - 1)/2⌉ = ⌈4/2⌉ = 2 keys (Option D is true).
Hence, all statements A, B, C, and D are TRUE.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q48',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Hashing & Double Hashing''',
    questionText: '''An open addressing hash table of size m = 11 uses double hashing with the primary and secondary hash functions:
h1(k) = k mod 11
h2(k) = 1 + (k mod 7)
The probe sequence for an insertion is given by: h(k, i) = (h1(k) + i * h2(k)) mod 11, for i = 0, 1, 2, ...
The following keys are inserted into an initially empty hash table in this exact order:
52, 38, 73, 29, 41
At which index slot in the hash table will the key 41 be stored? (Answer in integer)''',
    options: [],
    correctAnswer: '''4''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Trace key insertions in order:
1. Key 52: h1(52) = 52 mod 11 = 8. Slot 8 is empty ⇒ 52 stored at slot 8.
2. Key 38: h1(38) = 38 mod 11 = 5. Slot 5 is empty ⇒ 38 stored at slot 5.
3. Key 73: h1(73) = 73 mod 11 = 7. Slot 7 is empty ⇒ 73 stored at slot 7.
4. Key 29: h1(29) = 29 mod 11 = 7 (Collision with 73 at slot 7).
   h2(29) = 1 + (29 mod 7) = 1 + 1 = 2.
   i = 1: (7 + 1 * 2) mod 11 = 9 mod 11 = 9. Slot 9 is empty ⇒ 29 stored at slot 9.
5. Key 41: h1(41) = 41 mod 11 = 8 (Collision with 52 at slot 8).
   h2(41) = 1 + (41 mod 7) = 1 + 6 = 7.
   i = 1: (8 + 1 * 7) mod 11 = 15 mod 11 = 4. Slot 4 is empty ⇒ 41 stored at slot 4.
Hence, key 41 is stored at slot 4.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q49',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Dynamic Programming & Matrix Chain Multiplication''',
    questionText: '''Consider computing the matrix product A1 × A2 × A3 × A4 with the following matrix dimensions:
A1: 10 x 30
A2: 30 x 5
A3: 5 x 60
A4: 60 x 10
What is the minimum number of scalar multiplications required to evaluate this matrix chain multiplication? (Answer in integer)''',
    options: [],
    correctAnswer: '''5000''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Dimension array p = [10, 30, 5, 60, 10].
1. Chains of length 2:
   m[1, 2] = 10 * 30 * 5 = 1500
   m[2, 3] = 30 * 5 * 60 = 9000
   m[3, 4] = 5 * 60 * 10 = 3000
2. Chains of length 3:
   m[1, 3] = min(
     m[1, 1] + m[2, 3] + 10*30*60 = 0 + 9000 + 18000 = 27000,
     m[1, 2] + m[3, 3] + 10*5*60 = 1500 + 0 + 3000 = 4500
   ) = 4500 (split at k = 2).
   m[2, 4] = min(
     m[2, 2] + m[3, 4] + 30*5*10 = 0 + 3000 + 1500 = 4500,
     m[2, 3] + m[4, 4] + 30*60*10 = 9000 + 0 + 18000 = 27000
   ) = 4500 (split at k = 2).
3. Chain of length 4 (m[1, 4]):
   - k = 1: m[1, 1] + m[2, 4] + 10*30*10 = 0 + 4500 + 3000 = 7500
   - k = 2: m[1, 2] + m[3, 4] + 10*5*10 = 1500 + 3000 + 500 = 5000
   - k = 3: m[1, 3] + m[4, 4] + 10*60*10 = 4500 + 0 + 6000 = 10500
Minimum cost = 5000 (corresponding to parenthesization ((A1 A2) (A3 A4))).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q50',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Minimum Spanning Trees''',
    questionText: '''Let G = (V, E) be a connected undirected graph with distinct positive edge weights, and let T be its unique minimum spanning tree (MST). Which of the following statements is/are ALWAYS TRUE?''',
    options: ['''For every cut (S, V - S) of G, the edge crossing the cut with the minimum weight belongs to T.''', '''Every edge e in T is the minimum weight edge for some cut of G.''', '''If an edge e is not in T, then adding e to T creates a cycle in which e has strictly greater weight than every other edge in that cycle.''', '''If the weight of every edge in G is increased by a fixed positive constant c > 0, the minimum spanning tree of the modified graph remains T.'''],
    correctAnswer: '''A, B, C, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''1. Cut Property: For any cut (S, V - S), the unique light edge crossing the cut must belong to every MST (Option A is true).
2. Reverse Cut Property: Removing an edge e from T partitions T into two components, defining a cut across which e is strictly the minimum weight edge (Option B is true).
3. Cycle Property: Adding a non-tree edge e to T creates a unique fundamental cycle in which e is strictly the heaviest edge (since weights are distinct) (Option C is true).
4. A spanning tree on |V| vertices always has exactly |V| - 1 edges. Adding c to each edge increases the total weight of EVERY spanning tree by exactly (|V| - 1) * c, preserving their exact relative cost ordering. Hence, T remains the unique MST (Option D is true).
All options A, B, C, and D are TRUE.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q51',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Shortest Paths''',
    questionText: '''Consider a directed graph G = (V, E) where some edge weights may be negative, but G contains no negative-weight cycles reachable from the source vertex s. Which of the following statements is CORRECT?''',
    options: ['''Dijkstra's algorithm is guaranteed to compute correct shortest paths from s if G has at least one negative-weight edge.''', '''The Bellman-Ford algorithm correctly computes shortest paths from s in O(|V| · |E|) time and can detect unreachable negative cycles.''', '''The Bellman-Ford algorithm correctly computes shortest paths from s in O(|V| · |E|) time and can detect whether a negative-weight cycle reachable from s exists.''', '''Dijkstra's algorithm implemented with a Fibonacci heap requires O(|V| · |E|) time in the worst case.'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''1. Dijkstra's greedy invariant assumes that once a vertex is marked finalized with minimum distance, no shorter path can be discovered; this property fails when negative edges exist (Option A is false).
2. The Bellman-Ford algorithm performs |V| - 1 passes of edge relaxation in O(|V| · |E|) time. If a |V|-th pass further relaxes any distance, a negative-weight cycle reachable from source s exists (Option C is correct, whereas Option B is false because it cannot detect unreachable negative cycles).
3. Dijkstra with Fibonacci heap runs in O(|E| + |V| log |V|), not O(|V| · |E|) (Option D is false).
Hence, Option C is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q52',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''Context-Free Languages & Decidability''',
    questionText: '''Which of the following decision problems is/are DECIDABLE for the class of Context-Free Grammars (CFGs)?''',
    options: ['''Given a CFG G and a string w, whether w ∈ L(G) (Membership problem)''', '''Given a CFG G, whether L(G) = ∅ (Emptiness problem)''', '''Given a CFG G, whether L(G) = Σ* (Universality problem)''', '''Given two CFGs G1 and G2, whether L(G1) = L(G2) (Equivalence problem)'''],
    correctAnswer: '''A, B''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''1. Membership for CFGs is decidable in O(n³) time using the CYK parsing algorithm or Earley parser (Option A is decidable).
2. Emptiness for CFGs is decidable by determining whether the start symbol S can derive any string composed entirely of terminals via reachability analysis (Option B is decidable).
3. Universality (L(G) = Σ*) for CFGs is well-known to be UNDECIDABLE via reduction from the Post Correspondence Problem (PCP) or valid Turing machine computations (Option C is undecidable).
4. Equivalence (L(G1) = L(G2)) for CFGs is undecidable; if equivalence were decidable, universality would be decidable by comparing with a grammar for Σ* (Option D is undecidable).
Thus, only A and B are decidable.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q53',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''Turing Machines & Undecidability''',
    questionText: '''Consider the following two formal languages:
L_halt = { ⟨M, w⟩ | M is a Turing machine and M halts on input w }
L_empty = { ⟨M⟩ | M is a Turing machine and L(M) = ∅ }
Which one of the following statements is CORRECT regarding their computability?''',
    options: ['''L_halt is recursively enumerable (RE), and L_empty is recursively enumerable (RE).''', '''L_halt is recursively enumerable (RE), but L_empty is NOT recursively enumerable (not RE).''', '''L_halt is NOT recursively enumerable, but L_empty is recursively enumerable.''', '''Neither L_halt nor L_empty is recursively enumerable.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''1. L_halt is the classic Turing Halting problem. A universal Turing machine can simulate M on w; if M halts, the simulator halts and accepts. Thus, L_halt is recursively enumerable (Turing-recognizable/RE), although undecidable.
2. L_empty is the language of TMs whose accepted language is empty. Its complement, L_nonempty = { ⟨M⟩ | ∃w, M accepts w }, is recursively enumerable (can be recognized by dovetailing simulations). Since L_nonempty is RE but not decidable, its complement L_empty is co-RE but NOT recursively enumerable.
Therefore, L_halt is RE, while L_empty is not RE. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q54',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''Deterministic Context-Free Languages''',
    questionText: '''Consider the following four formal languages over the alphabet Σ = {a, b}:
L1 = { aⁿ bⁿ | n ≥ 0 }
L2 = { aⁿ bᵐ | n ≠ m }
L3 = { w w | w ∈ {a, b}* }
L4 = { aᵖ | p is a prime number }
How many of these four languages are Deterministic Context-Free Languages (DCFLs)? (Answer in integer)''',
    options: [],
    correctAnswer: '''2''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Analyzing each language:
1. L1 = { aⁿ bⁿ | n ≥ 0 }: A Deterministic Pushdown Automaton (DPDA) pushes 'a's and deterministically pops an 'a' for each 'b', accepting when input and stack are empty. Thus, L1 is a DCFL.
2. L2 = { aⁿ bᵐ | n ≠ m }: A DPDA pushes all 'a's onto the stack. Upon seeing 'b's, it pops 'a's. If the input ends while stack still has 'a's (m < n) or stack empties while more 'b's arrive (m > n), the DPDA enters an accepting state. Thus, L2 is a DCFL.
3. L3 = { w w | w ∈ {a, b}* }: Requires remembering the first half of an arbitrary string and matching it synchronously; this cannot be done with a single LIFO stack. L3 is not even context-free (CFL), hence not a DCFL.
4. L4 = { aᵖ | p is prime }: By Parikh's Theorem, every context-free language over a single-letter alphabet is regular. Since the set of prime lengths does not form an ultimately periodic arithmetic progression, L4 is not regular, and therefore not context-free, hence not a DCFL.
Thus, exactly 2 languages (L1 and L2) are DCFLs.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q55',
    year: 2026,
    subject: '''Compiler Design''',
    topic: '''Syntax-Directed Definitions''',
    questionText: '''Consider an attributed context-free grammar with semantic rules defining synthesized and inherited attributes. Which of the following statements is/are TRUE?''',
    options: ['''In an S-attributed Syntax-Directed Definition (SDD), every attribute associated with grammar symbols is synthesized.''', '''Every S-attributed SDD is also an L-attributed SDD.''', '''An L-attributed SDD can be evaluated during a single depth-first, left-to-right traversal of the parse tree.''', '''In an L-attributed SDD, an inherited attribute of a grammar symbol on the right-hand side of a production may depend on attributes of symbols appearing to its right.'''],
    correctAnswer: '''A, B, C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''1. By definition, an SDD is S-attributed if every attribute is synthesized (Option A is true).
2. S-attributed SDDs are a special case of L-attributed SDDs with zero inherited attributes (Option B is true).
3. L-attributed definitions are designed specifically so that attributes can always be evaluated in a single depth-first left-to-right pass (Option C is true).
4. In an L-attributed definition, inherited attributes of a RHS symbol can depend ONLY on inherited attributes of the LHS non-terminal or attributes of symbols appearing to its LEFT. Depending on symbols to its right creates a right-to-left dependency cycle, which violates L-attribution (Option D is false).
Hence, A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q56',
    year: 2026,
    subject: '''Compiler Design''',
    topic: '''Code Optimization & Basic Blocks''',
    questionText: '''Consider the following three-address code sequence:
1: i = 1
2: sum = 0
3: if i > 10 goto 11
4: t1 = i * 4
5: t2 = arr[t1]
6: sum = sum + t2
7: i = i + 1
8: if i <= 10 goto 4
9: print sum
10: goto 12
11: print 0
12: exit
How many basic blocks are formed when partitioning this intermediate code? (Answer in integer)''',
    options: [],
    correctAnswer: '''5''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''To identify basic blocks, find all leader statements:
1. Rule 1: The first statement is a leader ⇒ Statement 1 is a leader.
2. Rule 2: Any statement that is the target of a conditional or unconditional goto is a leader:
   - Line 3 jumps to 11 ⇒ Statement 11 is a leader.
   - Line 8 jumps to 4 ⇒ Statement 4 is a leader.
   - Line 10 jumps to 12 ⇒ Statement 12 is a leader.
3. Rule 3: Any statement that immediately follows a conditional or unconditional goto is a leader:
   - Follows Line 3 goto ⇒ Statement 4 (already identified).
   - Follows Line 8 goto ⇒ Statement 9 is a leader.
   - Follows Line 10 goto ⇒ Statement 11 (already identified).
The complete set of leader statements is: { 1, 4, 9, 11, 12 }.
Each leader defines a basic block extending up to (but not including) the next leader:
- Block 1: statements 1 to 3
- Block 2: statements 4 to 8
- Block 3: statements 9 to 10
- Block 4: statement 11
- Block 5: statement 12
Total number of basic blocks = 5.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q57',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''Virtual Memory & TLB''',
    questionText: '''In a demand-paged computer system:
- Main memory access time = 100 nanoseconds.
- TLB lookup time = 20 nanoseconds.
- TLB hit ratio = 90% (0.90).
- A 2-level hierarchical page table is used.
- On a TLB miss, each level of the page table is accessed sequentially in main memory.
- The page fault rate is 1 in 10,000 memory references (p = 0.0001).
- When a page fault occurs, the total page fault service time is 10 milliseconds (10,000,000 ns).
Assuming memory accesses and TLB search are performed sequentially, what is the Effective Memory Access Time (EMAT) in nanoseconds? (rounded off to the nearest integer)''',
    options: [],
    correctAnswer: '''1140''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''1. Effective access time when no page fault occurs (T_mem):
   - On TLB Hit (probability 0.90): TLB lookup (20 ns) + 1 Memory access to fetch target data (100 ns) = 120 ns.
   - On TLB Miss (probability 0.10): TLB lookup (20 ns) + Level 1 page table memory access (100 ns) + Level 2 page table memory access (100 ns) + Target data memory access (100 ns) = 320 ns.
   T_mem = 0.90 * 120 + 0.10 * 320 = 108 + 32 = 140 ns.
2. Overall Effective Memory Access Time considering page fault rate p = 0.0001:
   EMAT = (1 - p) * T_mem + p * (Page Fault Service Time + T_mem)
   EMAT = T_mem + p * (Page Fault Service Time)
   = 140 + 0.0001 * 10,000,000 ns
   = 140 + 1000 = 1140 ns.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q58',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''Page Replacement Algorithms''',
    questionText: '''A system allocates 3 physical memory frames to a process, which are initially empty. Consider the page reference string:
7, 0, 1, 2, 0, 3, 0, 4, 2, 3, 0, 3, 2
How many page faults will occur when using the Least Recently Used (LRU) page replacement algorithm? (Answer in integer)''',
    options: [],
    correctAnswer: '''9''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Step-by-step trace of LRU with 3 frames:
1. Ref 7: Frames [7]. Fault (1)
2. Ref 0: Frames [7, 0]. Fault (2)
3. Ref 1: Frames [7, 0, 1]. Fault (3)
4. Ref 2: 7 is LRU, evicted. Frames [0, 1, 2]. Fault (4)
5. Ref 0: Already in memory. Frames updated [1, 2, 0]. Hit
6. Ref 3: 1 is LRU, evicted. Frames [2, 0, 3]. Fault (5)
7. Ref 0: Already in memory. Frames updated [2, 3, 0]. Hit
8. Ref 4: 2 is LRU, evicted. Frames [3, 0, 4]. Fault (6)
9. Ref 2: 3 is LRU, evicted. Frames [0, 4, 2]. Fault (7)
10. Ref 3: 0 is LRU, evicted. Frames [4, 2, 3]. Fault (8)
11. Ref 0: 4 is LRU, evicted. Frames [2, 3, 0]. Fault (9)
12. Ref 3: Already in memory. Frames updated [2, 0, 3]. Hit
13. Ref 2: Already in memory. Frames updated [0, 3, 2]. Hit
Total page faults = 9.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q59',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''Process Synchronization & Semaphores''',
    questionText: '''Consider two concurrent processes P0 and P1 sharing two counting semaphores S1 and S2, both initialized to 0.
Process P0:
while (1) {
    wait(S1);
    printf("0");
    signal(S2);
}
Process P1:
while (1) {
    signal(S1);
    wait(S2);
    printf("1");
}
Which of the following statements is/are TRUE regarding the execution of P0 and P1?''',
    options: ['''The printed output is strictly alternating between 0 and 1 starting with 0 (e.g. 010101...).''', '''The output string can begin with 1.''', '''Deadlock can never occur between processes P0 and P1.''', '''At any given point in execution, the number of 0s printed minus the number of 1s printed is always either 0 or 1.'''],
    correctAnswer: '''A, C, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Trace semaphore coordination:
1. Initially S1 = 0, S2 = 0.
2. P0 begins with wait(S1); since S1 = 0, P0 blocks.
3. P1 begins with signal(S1); S1 becomes 1, unblocking P0. P1 immediately executes wait(S2); since S2 = 0, P1 blocks.
4. P0 executes printf("0"), then signal(S2); S2 becomes 1, unblocking P1. P0 loops back and executes wait(S1); since S1 was decremented to 0, P0 blocks.
5. P1 unblocks, executes printf("1"), loops back, executes signal(S1) (unblocking P0) and wait(S2) (blocking P1).
Notice the strict sequence:
- P0 must print "0" before P1 can print "1". The printed stream is strictly "01010101...". (Option A is true, Option B is false).
- Handshaking prevents any circular wait; no deadlock can occur (Option C is true).
- Since digits alternate strictly starting with 0, count('0') - count('1') is 1 right after P0 prints and 0 right after P1 prints (Option D is true).
Hence, A, C, and D are TRUE.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q60',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''Disk Scheduling''',
    questionText: '''A disk drive has requests for I/O to blocks on cylinders:
98, 183, 37, 122, 14, 124, 65, 67
The read/write head is currently positioned at cylinder 53. The disk controller uses Shortest Seek Time First (SSTF) scheduling. What is the total head movement (in cylinders) required to service all the requests? (Answer in integer)''',
    options: [],
    correctAnswer: '''236''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Trace SSTF from initial position 53:
1. From 53: closest request is 65 (distance |65 - 53| = 12). Move to 65.
2. From 65: closest is 67 (distance |67 - 65| = 2). Move to 67.
3. From 67: remaining are {98, 183, 37, 122, 14, 124}. Closest is 37 (|37 - 67| = 30 vs |98 - 67| = 31). Move to 37.
4. From 37: closest is 14 (distance |14 - 37| = 23). Move to 14.
5. From 14: remaining are {98, 122, 124, 183}. Closest is 98 (distance |98 - 14| = 84). Move to 98.
6. From 98: closest is 122 (distance |122 - 98| = 24). Move to 122.
7. From 122: closest is 124 (distance |124 - 122| = 2). Move to 124.
8. From 124: closest is 183 (distance |183 - 124| = 59). Move to 183.
Total head movement = 12 + 2 + 30 + 23 + 84 + 24 + 2 + 59 = 236 cylinders.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q61',
    year: 2026,
    subject: '''Databases''',
    topic: '''Normalization & Lossless Decompositions''',
    questionText: '''Consider a relational schema R(A, B, C, D) with functional dependencies:
F = { A → B, B → C, C → D, D → A }
The relation R is decomposed into R1(A, B), R2(B, C), and R3(C, D). Which of the following statements is/are TRUE?''',
    options: ['''The decomposition {R1, R2, R3} is a lossless join decomposition.''', '''The decomposition {R1, R2, R3} preserves all functional dependencies in F.''', '''Each of the decomposed relations R1, R2, and R3 is in Boyce-Codd Normal Form (BCNF).''', '''The original relation R has exactly 4 candidate keys.'''],
    correctAnswer: '''A, C, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''1. In F, every attribute forms a cycle: A⁺ = B⁺ = C⁺ = D⁺ = {A, B, C, D}. Thus, each individual attribute {A}, {B}, {C}, and {D} is a candidate key of R. The number of candidate keys is exactly 4 (Option D is true).
2. For relations R1(A, B), R2(B, C), R3(C, D):
   - In R1: A → B and B → A hold. Both attributes are superkeys. Thus R1 is in BCNF.
   - In R2: B → C and C → B hold. Both are superkeys. Thus R2 is in BCNF.
   - In R3: C → D and D → C hold. Both are superkeys. Thus R3 is in BCNF (Option C is true).
3. Lossless join check:
   Join R1 and R2: R1 ∩ R2 = {B}. Since B → C in R2, B is a key for R2. Hence R12(A, B, C) is lossless.
   Join R12 and R3: R12 ∩ R3 = {C}. Since C → D in R3, C is a key for R3. Hence R12 ⋈ R3 is lossless (Option A is true).
4. Dependency preservation: The projections give F1={A→B}, F2={B→C}, F3={C→D}. The functional dependency D → A cannot be derived from F1 ∪ F2 ∪ F3 because D⁺ with respect to {A→B, B→C, C→D} is only {D}. Thus D → A is not preserved (Option B is false).
Hence, A, C, and D are TRUE.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q62',
    year: 2026,
    subject: '''Databases''',
    topic: '''Transaction Serializability''',
    questionText: '''Consider the following concurrent schedule S involving transactions T1, T2, and T3:
S: R1(X); R2(Y); W1(X); R3(X); W2(Y); R2(X); W3(Y); W2(X)
Which of the following statements is CORRECT regarding schedule S?''',
    options: ['''S is conflict serializable with equivalent serial schedule T1 → T2 → T3.''', '''S is conflict serializable with equivalent serial schedule T1 → T3 → T2.''', '''S is NOT conflict serializable because its precedence graph contains a cycle.''', '''S is conflict equivalent to T2 → T1 → T3.'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Construct the precedence (serialization) graph for conflicting operations (same data item, at least one write, different transactions):
1. On data item Y:
   - W2(Y) occurs before W3(Y) ⇒ directed edge T2 → T3.
2. On data item X:
   - W1(X) occurs before R3(X) and R2(X) ⇒ edges T1 → T3, T1 → T2.
   - R3(X) occurs before W2(X) ⇒ directed edge T3 → T2.
Observe the directed edges between T2 and T3:
We have T2 → T3 (from conflict on Y) AND T3 → T2 (from conflict on X).
This produces a direct cycle: T2 → T3 → T2.
Since the precedence graph contains a cycle, the schedule S is NOT conflict serializable. Option C is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q63',
    year: 2026,
    subject: '''Databases''',
    topic: '''SQL & Correlated Subqueries''',
    questionText: '''Consider the relational table Employee(EmpId, DeptId, Salary) with the following rows:
EmpId: 101, DeptId: 10, Salary: 50000
EmpId: 102, DeptId: 10, Salary: 60000
EmpId: 103, DeptId: 10, Salary: 55000
EmpId: 104, DeptId: 20, Salary: 40000
EmpId: 105, DeptId: 20, Salary: 70000
EmpId: 106, DeptId: 30, Salary: 80000
EmpId: 107, DeptId: 30, Salary: 90000

Consider the SQL query:
SELECT COUNT(*)
FROM Employee E
WHERE E.Salary > (
    SELECT AVG(Salary)
    FROM Employee
    WHERE DeptId = E.DeptId
);
What is the integer count returned by the query? (Answer in integer)''',
    options: [],
    correctAnswer: '''3''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Compute the department-level average salaries:
1. DeptId 10: Salaries are {50000, 60000, 55000}.
   Average = (50000 + 60000 + 55000) / 3 = 165000 / 3 = 55000.
   Employees in Dept 10 with Salary > 55000: EmpId 102 (60000). (1 employee)
2. DeptId 20: Salaries are {40000, 70000}.
   Average = (40000 + 70000) / 2 = 110000 / 2 = 55000.
   Employees in Dept 20 with Salary > 55000: EmpId 105 (70000). (1 employee)
3. DeptId 30: Salaries are {80000, 90000}.
   Average = (80000 + 90000) / 2 = 170000 / 2 = 85000.
   Employees in Dept 30 with Salary > 85000: EmpId 107 (90000). (1 employee)
Total matching employees = 1 + 1 + 1 = 3.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q64',
    year: 2026,
    subject: '''Computer Networks''',
    topic: '''TCP Congestion Control''',
    questionText: '''A TCP connection uses the Reno congestion control mechanism. During data transmission, the current congestion window (cwnd) reaches 20 Maximum Segment Sizes (MSS). At this point, a retransmission timeout (RTO) occurs. What is the new slow-start threshold (ssthresh) in MSS set by the sender immediately following the timeout? (Answer in integer)''',
    options: [],
    correctAnswer: '''10''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''In standard TCP Reno congestion control:
When packet loss is detected via a retransmission timeout (RTO):
1. The slow-start threshold is updated as:
   ssthresh = max(⌊cwnd / 2⌋, 2 MSS).
   Given cwnd = 20 MSS when the timeout occurs:
   ssthresh = ⌊20 / 2⌋ = 10 MSS.
2. cwnd is subsequently reset to 1 MSS, and the connection re-enters the Slow Start phase.
Thus, the new ssthresh is 10 MSS.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK2_Q65',
    year: 2026,
    subject: '''Computer Networks''',
    topic: '''Sliding Window Protocol''',
    questionText: '''A sender transmits data frames of size 1000 bytes over a point-to-point link of bandwidth 10 Mbps (where 1 Mbps = 10⁶ bps). The one-way propagation delay of the link is 19.6 milliseconds. Acknowledgements are of negligible size and processing delay is zero. What is the minimum window size W (in frames) needed in a sliding window protocol to achieve 100% link utilization? (Answer in integer)''',
    options: [],
    correctAnswer: '''50''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''1. Frame size L = 1000 bytes = 1000 * 8 = 8000 bits.
2. Bandwidth B = 10 Mbps = 10 * 10⁶ bps.
3. Transmission time T_t = L / B = 8000 / (10 * 10⁶) = 0.0008 seconds = 0.8 milliseconds.
4. One-way propagation delay T_p = 19.6 milliseconds.
5. Total round-trip cycle time = T_t + 2 * T_p = 0.8 + 2 * (19.6) = 0.8 + 39.2 = 40.0 milliseconds.
6. For 100% link utilization (efficiency η = 1):
   η = (W * T_t) / (T_t + 2 * T_p) ≥ 1
   W ≥ (T_t + 2 * T_p) / T_t = 40.0 / 0.8 = 50 frames.
Thus, the minimum window size is 50 frames.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
];
