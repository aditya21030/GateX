// AUTO-GENERATED GATE CS MOCK 7 QUESTIONS (ULTRA-TOUGH FACULTY LEVEL)
import '../models/models.dart';

final List<PYQ> csFullMock7Questions = [
  PYQ(
    id: 'CS_MOCK7_Q01',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Verbal Ability''',
    questionText: '''Select the word that best completes the sentence to convey precise meaning:

"Although the early software prototypes suffered from _______ security vulnerabilities, the finalized kernel release proved resilient against even the most sophisticated attack vectors."''',
    options: ['''deleterious''', '''salubrious''', '''ubiquitous''', '''esoteric'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Vocabulary in Context:
1. The contrast signaled by "Although ... the finalized kernel release proved resilient" indicates that the early prototypes had vulnerabilities that caused severe harm, damage, or compromise to system integrity.
2. "Deleterious" means causing harm, injury, or damage, perfectly matching the negative context of severe vulnerabilities.
3. "Salubrious" means health-giving or beneficial; "esoteric" means understood by only an enlightened few; "ubiquitous" means present everywhere (which lacks the qualitative destructive implication needed here).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q02',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Critical Reasoning''',
    questionText: '''Identify the logically correct statement from the following premises:
Premise 1: Every recursive algorithm with overlapping subproblems can be optimized using dynamic programming.
Premise 2: Some divide-and-conquer algorithms do not exhibit overlapping subproblems.

Which of the following conclusions is validly deduced?''',
    options: ['''Not all divide-and-conquer algorithms can be optimized using dynamic programming solely based on Premise 1.''', '''All divide-and-conquer algorithms can be optimized using dynamic programming.''', '''Dynamic programming cannot be applied to any divide-and-conquer algorithm.''', '''Overlapping subproblems are unnecessary for dynamic programming optimization.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Categorical Logic:
- Premise 1 establishes overlapping subproblems as a condition where dynamic programming provides optimization.
- Premise 2 states that some divide-and-conquer algorithms lack overlapping subproblems (e.g., standard merge sort divides into completely disjoint subproblems).
- Therefore, we cannot deduce from Premise 1 that all divide-and-conquer algorithms can be optimized using DP. Thus statement A is validly deduced.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q03',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude''',
    questionText: '''A server cluster completes a batch processing job in 12 hours using 6 worker nodes. If 2 nodes fail at the start and the job must run with only 4 worker nodes of identical capacity, how many hours will it take to complete the job?''',
    options: ['''15 hours''', '''18 hours''', '''20 hours''', '''24 hours'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Work and Time:
1. Total computational work required = 6 nodes * 12 hours = 72 node-hours.
2. With 2 nodes failing, available nodes = 6 - 2 = 4 nodes.
3. Time required = 72 node-hours / 4 nodes = 18 hours.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q04',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Spatial Aptitude''',
    questionText: '''A regular 3D cube has its 6 faces painted with six distinct colors: Red, Blue, Green, Yellow, White, and Black. If Blue is opposite to Green, Red is opposite to Yellow, and White is opposite to Black, which of the following pairs of faces CANNOT be adjacent?''',
    options: ['''Blue and Green''', '''Blue and Red''', '''Red and White''', '''Yellow and Black'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Spatial Geometry:
- Opposite faces of a cube can never share an edge or vertex, meaning they can never be adjacent.
- Since Blue is given as opposite to Green, Blue and Green can never be adjacent.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q05',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude''',
    questionText: '''If log_2(x) + log_4(x) = 6, what is the value of x?''',
    options: ['''8''', '''16''', '''32''', '''64'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Logarithm Change of Base:
1. log_4(x) = log_2(x) / log_2(4) = log_2(x) / 2.
2. Equation becomes: log_2(x) + (1/2)*log_2(x) = 6.
3. (3/2)*log_2(x) = 6 => log_2(x) = 4 => x = 2^4 = 16.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q06',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude''',
    questionText: '''Two trains A and B of lengths 180 m and 220 m travel on parallel tracks in opposite directions with speeds of 72 km/h and 54 km/h, respectively. How many seconds do they take to completely pass each other from the moment they first meet?''',
    options: ['''10.29 s''', '''11.43 s''', '''12.80 s''', '''14.00 s'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Relative Speed and Distance:
1. Total distance to be covered = L_A + L_B = 180 + 220 = 400 m.
2. Speed of train A = 72 * (5/18) = 20 m/s.
3. Speed of train B = 54 * (5/18) = 15 m/s.
4. Relative speed in opposite directions = 20 + 15 = 35 m/s.
5. Time taken = 400 / 35 = 80 / 7 ≈ 11.43 seconds.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q07',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Data Interpretation''',
    questionText: '''The monthly expenses of an IT firm across four categories are given: Infrastructure: 40%, Payroll: 35%, Operations: 15%, R&D: 10%. If Payroll expenses exceed Operations expenses by Rs. 60,000, what is the total monthly expenditure of the firm?''',
    options: ['''Rs. 2,50,000''', '''Rs. 2,80,000''', '''Rs. 3,00,000''', '''Rs. 3,60,000'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Data Interpretation:
1. Payroll percentage = 35%. Operations percentage = 15%.
2. Difference = 35% - 15% = 20% of total expenditure.
3. Let total expenditure be E. Then 0.20 * E = 60,000 => E = 60,000 / 0.20 = 300,000 (Rs. 3,00,000).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q08',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Logical Reasoning (Grid Puzzle)''',
    questionText: '''Four engineers—Arun, Bina, Chetan, and Deepa—specialize in four distinct domains: Security, Cloud, AI, and DevOps, and are based in four cities: Bengaluru, Hyderabad, Pune, and Delhi (not necessarily in order).
1. The Cloud engineer is based in Bengaluru.
2. Bina specializes in Security and is based in Pune.
3. Chetan is based in Delhi.
4. Arun specializes in AI.

Who is based in Bengaluru and what is their specialization?''',
    options: ['''Deepa, Cloud''', '''Arun, AI''', '''Chetan, DevOps''', '''Bina, Security'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Grid Deduction Steps:
1. Clue 2: Bina is in Pune (Security).
2. Clue 3: Chetan is in Delhi.
3. Clue 1: Cloud engineer is in Bengaluru.
4. Clue 4: Arun specializes in AI.
5. Arun cannot be in Bengaluru because the Bengaluru engineer specializes in Cloud (whereas Arun is AI).
6. Cities remaining for Arun and Deepa: Bengaluru and Hyderabad.
7. Since Arun cannot be in Bengaluru, Arun is in Hyderabad (AI).
8. Therefore, Deepa is based in Bengaluru, specializing in Cloud.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q09',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude (Geometry)''',
    questionText: '''A right-angled triangle ABC has perpendicular sides AB = 6 cm, BC = 8 cm, and hypotenuse AC = 10 cm. A circle is inscribed inside triangle ABC such that it is tangent to all three sides. What is the radius of this incircle?''',
    options: ['''1.5 cm''', '''2.0 cm''', '''2.5 cm''', '''3.0 cm'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Incircle of a Right Triangle:
Method 1 (Standard formula for right triangle):
r = (a + b - c) / 2 = (6 + 8 - 10) / 2 = 4 / 2 = 2.0 cm.

Method 2 (Area and Semiperimeter):
Area = 1/2 * base * height = 1/2 * 6 * 8 = 24 cm^2.
Semiperimeter s = (6 + 8 + 10) / 2 = 12 cm.
Since Area = r * s:
r = Area / s = 24 / 12 = 2.0 cm.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q10',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Critical Reading''',
    questionText: '''Read the following excerpt:
"A software monoculture arises when an entire digital ecosystem standardizes on an identical operating system, library, or framework. While standardization significantly reduces maintenance overhead and streamlines integration, it introduces severe systemic vulnerability: a zero-day exploit found in that monoculture endangers the entire network simultaneously, analogous to how genetic uniformity exposes an entire agricultural crop to sudden extinction from a single pathogen."

Which of the following statements is most strongly supported by the passage?''',
    options: ['''Standardization completely eliminates security risks across distributed enterprise systems.''', '''Heterogeneous software architectures, despite greater maintenance overhead, provide systemic resilience against widespread catastrophic exploitation.''', '''Agricultural pathogens propagate along identical communication channels as computer malware.''', '''Open-source frameworks are inherently immune to zero-day supply chain vulnerabilities.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Critical Reading Analysis:
- The text contrasts standardization (low maintenance overhead but high systemic vulnerability due to uniformity) with the metaphor of genetic uniformity.
- This directly supports the inference that diversity/heterogeneity across software stacks confers resilience against systemic catastrophic failures, even though it incurs higher maintenance overhead.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q11',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Graph Theory (Handshaking Lemma)''',
    questionText: '''Let G = (V, E) be any simple undirected graph with n vertices and m edges. Which of the following statements is ALWAYS TRUE for G?''',
    options: ['''The number of vertices with odd degree is always even.''', '''If every vertex has degree at least 2, G must be bipartite.''', '''The sum of the degrees of all vertices equals m.''', '''If G is connected and has n edges, it cannot contain any cycles.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Handshaking Lemma:
1. By Euler's Handshaking Lemma: sum_{v in V} deg(v) = 2m.
2. The total sum 2m is always an even integer.
3. The sum of degrees can be split into: (sum of even degrees) + (sum of odd degrees) = 2m.
4. Since (sum of even degrees) is even, (sum of odd degrees) must also be even.
5. The sum of an odd number of odd terms is odd; thus, there must be an EVEN number of odd-degree vertices.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q12',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Combinatorics (Derangements)''',
    questionText: '''Four distinct letters addressed to four different individuals are placed randomly into four pre-addressed envelopes, one letter per envelope. What is the number of permutations where NO letter is placed into its correct envelope?''',
    options: ['''6''', '''8''', '''9''', '''12'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Derangements of n items (D_n):
Formula: D_n = n! * sum_{k=0}^n ((-1)^k / k!)
For n = 4:
D_4 = 4! * (1/0! - 1/1! + 1/2! - 1/3! + 1/4!)
    = 24 * (1 - 1 + 1/2 - 1/6 + 1/24)
    = 24 * (12/24 - 4/24 + 1/24)
    = 24 * (9/24) = 9.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q13',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Vector Spaces (Subspace Dimension)''',
    questionText: '''Let W be a subspace of R^4 defined by:
W = {(x1, x2, x3, x4) in R^4 | 2*x1 - x2 + 3*x3 - 4*x4 = 0}.
What is the dimension of the subspace W?''',
    options: ['''1''', '''2''', '''3''', '''4'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Subspace Dimension via Rank-Nullity:
1. The ambient space is R^4, which has dimension n = 4.
2. W is the null space (kernel) of the 1 x 4 matrix A = [2, -1, 3, -4].
3. Since A is a non-zero row vector, rank(A) = 1.
4. By the Rank-Nullity Theorem: dim(null(A)) = n - rank(A) = 4 - 1 = 3.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q14',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Definite Integrals (Symmetry)''',
    questionText: '''Evaluate the definite integral:
I = ∫_{-π}^{π} (x^5 * cos(2x)) / (1 + x^4) dx''',
    options: ['''0''', '''π''', '''2*π''', '''π^2 / 2'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Odd Function Integration:
1. Let f(x) = (x^5 * cos(2x)) / (1 + x^4).
2. Test symmetry:
   f(-x) = ((-x)^5 * cos(-2x)) / (1 + (-x)^4)
         = (-x^5 * cos(2x)) / (1 + x^4) = -f(x).
3. Since f(x) is an odd continuous function on [-π, π], ∫_{-a}^a f(x) dx = 0.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q15',
    year: 2026,
    subject: '''Probability''',
    topic: '''Geometric Distribution (Memoryless Property)''',
    questionText: '''Let X be a discrete random variable representing the number of independent Bernoulli trials until the first success, with success probability p (0 < p < 1). Which of the following relationships is satisfied by X for all positive integers s and t?''',
    options: ['''P(X > s + t | X > s) = P(X > t)''', '''P(X > s + t | X > s) = P(X > s) * P(X > t)''', '''P(X = s + t) = P(X = s) + P(X = t)''', '''E[X^2] = (E[X])^2'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Memoryless Property of Geometric Distribution:
1. For geometric RV X, P(X > k) = (1 - p)^k.
2. P(X > s + t | X > s) = P(X > s + t) / P(X > s) = (1 - p)^(s + t) / (1 - p)^s = (1 - p)^t.
3. Since P(X > t) = (1 - p)^t, P(X > s + t | X > s) = P(X > t).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q16',
    year: 2026,
    subject: '''Digital Logic''',
    topic: '''Universal Logic Gates (NOR Implementation)''',
    questionText: '''What is the minimum number of 2-input NOR gates required to implement a 2-input AND gate?''',
    options: ['''2''', '''3''', '''4''', '''5'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Universal NOR Implementation of AND:
1. By De Morgan's Law: A * B = NOT(NOT(A) + NOT(B)) = NOR(NOT(A), NOT(B)).
2. Gate 1: NOT(A) = NOR(A, A).
3. Gate 2: NOT(B) = NOR(B, B).
4. Gate 3: NOR(NOT(A), NOT(B)) = NOT(NOT(A) + NOT(B)) = A * B.
5. Thus, exactly 3 two-input NOR gates are required.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q17',
    year: 2026,
    subject: '''Digital Logic''',
    topic: '''K-Maps (Essential Prime Implicants)''',
    questionText: '''Consider the 3-variable Boolean function:
F(A, B, C) = ∑ m(0, 1, 4, 6) + d(2, 5)
where d represents don't-care conditions. How many Essential Prime Implicants (EPIs) does F possess?''',
    options: ['''1''', '''2''', '''3''', '''4'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''K-Map Minimization:
1. Cells with 1: m0 (000), m1 (001), m4 (100), m6 (110).
2. Don't-cares: d2 (010), d5 (101).
3. Prime Implicant Quad 1: {m0, m1, m4, d5} -> combines 000, 001, 100, 101.
   Term = B' (since A and C vary across all combinations, B=0).
4. Prime Implicant Quad 2: {m0, d2, m4, m6} -> combines 000, 010, 100, 110.
   Term = C' (since A and B vary across all combinations, C=0).
5. Essentiality check:
   - Minterm m1 (001) is covered ONLY by Quad 1 (B'). Thus B' is an EPI.
   - Minterm m6 (110) is covered ONLY by Quad 2 (C'). Thus C' is an EPI.
6. Therefore, F has exactly 2 Essential Prime Implicants.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q18',
    year: 2026,
    subject: '''Computer Organization and Architecture''',
    topic: '''IEEE-754 Floating Point Representation''',
    questionText: '''In the IEEE-754 single-precision (32-bit) floating-point representation, which bit configuration defines a NaN (Not-a-Number) value?''',
    options: ['''Exponent = 0, Fraction = 0''', '''Exponent = 255 (all 1s), Fraction = 0''', '''Exponent = 255 (all 1s), Fraction ≠ 0''', '''Exponent = 0, Fraction ≠ 0'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''IEEE-754 Special Value Encodings:
- Exponent = 0, Fraction = 0: Represents ±0.
- Exponent = 0, Fraction ≠ 0: Represents Subnormal (denormalized) numbers.
- Exponent = 255, Fraction = 0: Represents ±Infinity.
- Exponent = 255, Fraction ≠ 0: Represents NaN (Not-a-Number).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q19',
    year: 2026,
    subject: '''Computer Organization and Architecture''',
    topic: '''Memory Organization (Interleaving)''',
    questionText: '''In a multi-module memory system, which interleaving scheme assigns consecutive memory addresses to consecutive physical memory modules, thereby enabling pipelined concurrent access during sequential instruction fetches?''',
    options: ['''High-order interleaving''', '''Low-order interleaving''', '''Associative interleaving''', '''Block interleaving'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Memory Interleaving:
- In low-order interleaving, the least significant bits of the memory address select the memory module number, while the most significant bits select the word within the module.
- Consequently, consecutive addresses map to consecutive modules, allowing concurrent access and higher memory bandwidth during sequential program execution.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q20',
    year: 2026,
    subject: '''Programming and Data Structures''',
    topic: '''C Preprocessor (Macro Expansion)''',
    questionText: '''Consider the following C program fragment:

```c
#include <stdio.h>
#define MULTIPLY(a, b) a * b

int main() {
    int x = 2 + 3;
    int y = MULTIPLY(x, 2 + 3);
    printf("%d", y);
    return 0;
}
```
What is the output printed by the program?''',
    options: ['''13''', '''25''', '''15''', '''21'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Macro Substitution in C:
1. x evaluates to 2 + 3 = 5.
2. MULTIPLY(x, 2 + 3) expands textually to: x * 2 + 3.
3. Substituting x = 5 gives: 5 * 2 + 3.
4. By operator precedence, multiplication precedes addition: 10 + 3 = 13.
5. Therefore, the program prints 13.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q21',
    year: 2026,
    subject: '''Programming and Data Structures''',
    topic: '''Binary Trees (Unique Reconstruction)''',
    questionText: '''Which of the following pairs of tree traversals is SUFFICIENT to uniquely reconstruct any binary tree whose nodes have distinct keys?''',
    options: ['''Inorder and Preorder''', '''Preorder and Postorder''', '''Level-order and Preorder''', '''Postorder and Level-order'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Tree Reconstruction Properties:
- An arbitrary binary tree can be uniquely reconstructed if and only if the Inorder traversal is given along with either Preorder, Postorder, or Level-order traversal.
- Preorder and Postorder together can uniquely reconstruct a FULL binary tree (where every internal node has exactly 2 children), but cannot distinguish left vs right single children in an arbitrary binary tree.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q22',
    year: 2026,
    subject: '''Programming and Data Structures''',
    topic: '''Hashing (Open Addressing & Clustering)''',
    questionText: '''In open-address hash tables with collision resolution via quadratic probing h(k, i) = (h'(k) + c1*i + c2*i^2) mod m, which of the following statements regarding clustering is correct?''',
    options: ['''Quadratic probing eliminates primary clustering but may suffer from secondary clustering.''', '''Quadratic probing eliminates both primary and secondary clustering completely.''', '''Quadratic probing suffers from severe primary clustering but avoids secondary clustering.''', '''Quadratic probing produces identical probe sequences for all distinct keys.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Clustering in Hash Tables:
- Linear probing suffers from primary clustering (long contiguous runs of occupied slots).
- Quadratic probing uses a non-linear step size, thereby eliminating primary clustering.
- However, if two distinct keys hash to the same initial slot (h'(k1) = h'(k2)), they trace the exact same probe sequence. This is secondary clustering. Double hashing eliminates both.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q23',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Master Theorem (Case 3 Regularity Condition)''',
    questionText: '''Consider the Master Theorem recurrence T(n) = a*T(n/b) + f(n), with a ≥ 1, b > 1. In Case 3, where f(n) = Ω(n^(log_b(a) + ε)) for some constant ε > 0, what additional regularity condition must f(n) satisfy for T(n) = Θ(f(n)) to hold?''',
    options: ['''a * f(n/b) ≤ c * f(n) for some constant c < 1 and all sufficiently large n.''', '''a * f(n/b) ≥ c * f(n) for some constant c > 1 and all sufficiently large n.''', '''f(n) = O(n^(log_b(a) - ε)) for some constant ε > 0.''', '''f(n) must be a monotonically decreasing function.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Master Theorem Case 3:
- For Case 3, f(n) must be polynomially larger than n^(log_b(a)).
- In addition, f(n) must satisfy the regularity condition: a * f(n/b) ≤ c * f(n) for some constant c < 1 and all sufficiently large n.
- If the regularity condition fails, the Master Theorem cannot be applied.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q24',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Dynamic Programming Foundations''',
    questionText: '''Which two key properties MUST an optimization problem exhibit in order for Dynamic Programming to be successfully applied to obtain an optimal solution?''',
    options: ['''Optimal substructure and overlapping subproblems''', '''Greedy choice property and independent subproblems''', '''Strict divide-and-conquer structure and disjoint subproblems''', '''Linear programming duality and total unimodularity'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Foundations of Dynamic Programming:
1. Optimal Substructure: An optimal solution to the problem contains optimal solutions to subproblems.
2. Overlapping Subproblems: A recursive algorithm revisits the same subproblems repeatedly rather than always generating new ones. Memorization or tabulation saves recomputation.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q25',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''Regular Grammars & Linear Grammars''',
    questionText: '''Consider context-free grammars containing only linear productions. Which of the following grammar designs can generate a NON-REGULAR language?''',
    options: ['''A grammar combining both left-linear productions (A -> B a) and right-linear productions (A -> a B).''', '''A grammar containing exclusively right-linear productions of the form A -> w B or A -> w.''', '''A grammar containing exclusively left-linear productions of the form A -> B w or A -> w.''', '''A grammar where every production RHS consists of exactly one terminal symbol.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Regular vs Linear Grammars:
- Pure right-linear grammars generate exactly regular languages.
- Pure left-linear grammars also generate exactly regular languages.
- However, mixing left-linear and right-linear productions allows generating non-regular context-free languages, such as S -> a B, B -> S b, S -> ε, which generates {a^n b^n | n ≥ 0}.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q26',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''Turing Machines (Deterministic vs Non-deterministic)''',
    questionText: '''Which of the following statements correctly compares the computational recognition power of standard Deterministic Turing Machines (DTMs) and Non-deterministic Turing Machines (NTMs)?''',
    options: ['''DTMs and NTMs recognize the exact same class of languages (recursively enumerable languages).''', '''NTMs can recognize strictly more languages than DTMs.''', '''DTMs can decide all recursively enumerable languages, whereas NTMs cannot.''', '''Any language decided by an NTM in polynomial time can always be decided by a DTM in identical time.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Turing Machine Equivalence:
- Non-determinism does not add any computational power to Turing machines in terms of language recognition.
- Any language accepted by an NTM can be simulated and accepted by a deterministic 3-tape TM (or single-tape DTM) using breadth-first search on the computation tree.
- Both recognize exactly the recursively enumerable (RE) languages.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q27',
    year: 2026,
    subject: '''Compiler Design''',
    topic: '''SLR(1) Parsing Table Construction''',
    questionText: '''In SLR(1) parser table construction, how are reduce actions assigned to parsing table entries compared to LR(0)?''',
    options: ['''SLR(1) places the reduce action A -> α only in columns corresponding to terminals in FOLLOW(A), whereas LR(0) places it in all terminal columns.''', '''SLR(1) places reduce actions in columns corresponding to FIRST(A), whereas LR(0) uses FOLLOW(A).''', '''SLR(1) computes lookaheads directly within LR items as [A -> α • β, a].''', '''SLR(1) eliminates all shift-reduce conflicts for every context-free grammar.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''SLR(1) vs LR(0) Reduce Actions:
- In LR(0), whenever a state contains a complete item A -> α •, reduce action r_k is placed in all input symbol columns (including \$).
- In SLR(1), reduce action r_k is placed only in columns for a in FOLLOW(A). This resolves many shift-reduce and reduce-reduce conflicts present in LR(0).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q28',
    year: 2026,
    subject: '''Compiler Design''',
    topic: '''Runtime Environments (Access Links vs Control Links)''',
    questionText: '''In block-structured programming languages with nested procedures, what is the role of the static link (access link) stored in an activation record?''',
    options: ['''It points to the activation record of the lexically enclosing (static parent) procedure to access non-local variables.''', '''It points to the activation record of the caller procedure to restore the stack frame upon return.''', '''It stores the return CPU instruction pointer address.''', '''It points to the dynamic heap memory allocated during activation.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Activation Record Links:
- Control link (dynamic link): Points to the caller's activation record, used to unwind the stack when the procedure returns.
- Access link (static link): Points to the activation record of the static/lexical parent scope, enabling resolution of non-local variables declared in outer enclosing blocks.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q29',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''Process Synchronization (Spinlocks vs Sleeping Mutexes)''',
    questionText: '''What is the fundamental operational difference between a spinlock and a blocking (sleeping) mutex semaphore?''',
    options: ['''A spinlock busy-waits in a CPU loop consuming cycles, whereas a blocking mutex puts the waiting thread to sleep and yields the CPU.''', '''A spinlock can only be used in user space, while a blocking mutex is exclusive to kernel mode.''', '''A spinlock prevents priority inversion automatically, whereas a blocking mutex cannot.''', '''A spinlock can protect multiple resources simultaneously, while a mutex protects only one.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Spinlock vs Blocking Mutex:
- Spinlocks execute a busy-waiting loop (e.g., using test-and-set), consuming CPU time until the lock becomes available. They are ideal for very short critical sections (especially in kernel interrupt handlers where sleeping is forbidden).
- Blocking mutexes suspend the thread (context-switching it to blocked state), yielding the processor to other runnable threads.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q30',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''Disk Scheduling (SSTF Starvation)''',
    questionText: '''Which disk scheduling algorithm is prone to indefinite starvation of I/O requests located far away from the current read/write head position?''',
    options: ['''Shortest Seek Time First (SSTF)''', '''First-Come, First-Served (FCFS)''', '''SCAN (Elevator Algorithm)''', '''C-SCAN (Circular SCAN)'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Disk Scheduling Starvation:
- SSTF selects the request with minimum seek time from the current head position.
- If a continuous stream of requests arrives near the head, requests located at distant cylinders will starve indefinitely.
- SCAN and C-SCAN prevent starvation by systematically sweeping across all cylinders.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q31',
    year: 2026,
    subject: '''Databases''',
    topic: '''Relational Query Languages (Codd's Theorem)''',
    questionText: '''According to Codd's Theorem, which of the following formal relational query languages are equivalent in expressive power?''',
    options: ['''Relational Algebra, Safe Tuple Relational Calculus (TRC), and Safe Domain Relational Calculus (DRC)''', '''Unrestricted Tuple Relational Calculus, Relational Algebra, and SQL SELECT without aggregations''', '''Relational Algebra and Extended Entity-Relationship models''', '''Tuple Relational Calculus and propositional logic without quantifiers'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Codd's Theorem:
- Codd's Theorem states that the basic Relational Algebra, Safe Tuple Relational Calculus, and Safe Domain Relational Calculus have identical expressive power.
- A query language capable of expressing all queries expressible in relational algebra is called relationally complete.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q32',
    year: 2026,
    subject: '''Databases''',
    topic: '''Transaction Management (Conflict vs View Serializability)''',
    questionText: '''Which of the following statements correctly describes the relationship between Conflict Serializability and View Serializability for concurrent database schedules?''',
    options: ['''Every conflict serializable schedule is view serializable, but not every view serializable schedule is conflict serializable.''', '''Every view serializable schedule is conflict serializable, but not every conflict serializable schedule is view serializable.''', '''The sets of conflict serializable and view serializable schedules are identical.''', '''Testing a schedule for view serializability can always be done in polynomial time O(n^2).'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Serializability Relationships:
- Conflict Serializability (CSR) is a strict subset of View Serializability (VSR).
- Every CSR schedule is VSR.
- Schedules with blind writes may be VSR without being CSR.
- Furthermore, testing CSR is in P (cycle detection in precedence graph), whereas testing VSR is NP-complete.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q33',
    year: 2026,
    subject: '''Computer Networks''',
    topic: '''Address Resolution Protocol (ARP)''',
    questionText: '''In a local IPv4 Ethernet network, how are Address Resolution Protocol (ARP) Request and ARP Reply frames transmitted?''',
    options: ['''ARP Request is Broadcast, ARP Reply is Unicast''', '''ARP Request is Unicast, ARP Reply is Broadcast''', '''Both ARP Request and ARP Reply are Broadcast''', '''Both ARP Request and ARP Reply are Unicast'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''ARP Transmission Modes:
- ARP Request: Broadcast (destination MAC FF:FF:FF:FF:FF:FF) because the sender does not yet know the target's MAC address.
- ARP Reply: Unicast directly to the requester's MAC address, because the target learnt the sender's MAC from the request frame.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q34',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Posets, Lattices & Dilworth's Theorem''',
    questionText: '''Let (P, ≤) be a finite non-empty partially ordered set (poset). Which of the following statements are ALWAYS TRUE?''',
    options: ['''P contains at least one maximal element and at least one minimal element.''', '''By Dilworth's Theorem, the minimum number of chains needed to partition P equals the size of a maximum antichain in P.''', '''Every lattice is a distributive lattice.''', '''In any finite Boolean lattice, the total number of elements is 2^k for some positive integer k.'''],
    correctAnswer: '''A, B, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Poset and Lattice Properties:
- Statement A is TRUE: A finite non-empty poset cannot have infinite descending or ascending chains, guaranteeing at least one minimal and one maximal element.
- Statement B is TRUE: Dilworth's theorem states that width(P) (maximum antichain size) equals the minimum number of chains required to cover all elements of P.
- Statement C is FALSE: There exist non-distributive lattices, such as M3 (diamond) and N5 (pentagon).
- Statement D is TRUE: Every finite Boolean algebra is isomorphic to the power set of a set of k atoms, giving 2^k elements.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q35',
    year: 2026,
    subject: '''Digital Logic''',
    topic: '''Number Representation (Sign-Magnitude)''',
    questionText: '''An 8-bit register stores an integer using sign-magnitude representation. The bit pattern stored in the register is 10101100. Calculate the decimal value of the stored integer.''',
    options: [],
    correctAnswer: '''-44''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Sign-Magnitude Conversion:
1. Register contents: 10101100.
2. Sign bit (MSB) = 1, indicating a negative integer.
3. Magnitude bits (7 bits): 0101100_2.
4. Convert magnitude to decimal:
   0*64 + 1*32 + 0*16 + 1*8 + 1*4 + 0*2 + 0*1 = 32 + 8 + 4 = 44.
5. Attaching the negative sign gives -44.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q36',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Graph Theory (Whitney's Inequality)''',
    questionText: '''Let G be a connected simple undirected graph with vertex connectivity κ(G), edge connectivity λ(G), and minimum vertex degree δ(G). Which inequality ALWAYS holds according to Whitney's Theorem?''',
    options: ['''κ(G) ≤ λ(G) ≤ δ(G)''', '''δ(G) ≤ κ(G) ≤ λ(G)''', '''λ(G) ≤ κ(G) ≤ δ(G)''', '''κ(G) ≤ δ(G) ≤ λ(G)'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Whitney's Theorem:
- In graph theory, Hassler Whitney proved in 1932 that for any graph G:
  κ(G) ≤ λ(G) ≤ δ(G)
- That is, vertex connectivity never exceeds edge connectivity, which never exceeds minimum degree.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q37',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Gram-Schmidt & Orthogonal Projection''',
    questionText: '''Consider the subspace W of R^3 spanned by the orthogonal vectors u1 = (1, 1, 1)^T and u2 = (1, -1, 0)^T. Let v = (1, 2, 3)^T. What is the orthogonal projection of vector v onto the subspace W?''',
    options: ['''(1.5, 2.5, 2.0)^T''', '''(2.0, 1.0, 3.0)^T''', '''(1.0, 1.0, 1.0)^T''', '''(0.5, 1.5, 1.0)^T'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Orthogonal Projection:
1. Verify u1 and u2 are orthogonal: u1 • u2 = 1(1) + 1(-1) + 1(0) = 0.
2. proj_W(v) = (v • u1 / ||u1||^2) * u1 + (v • u2 / ||u2||^2) * u2.
3. v • u1 = 1*1 + 2*1 + 3*1 = 6; ||u1||^2 = 1^2 + 1^2 + 1^2 = 3.
   Component 1 = (6 / 3) * (1, 1, 1)^T = (2, 2, 2)^T.
4. v • u2 = 1*1 + 2*(-1) + 3*0 = -1; ||u2||^2 = 1^2 + (-1)^2 + 0^2 = 2.
   Component 2 = (-1 / 2) * (1, -1, 0)^T = (-0.5, 0.5, 0)^T.
5. proj_W(v) = (2 - 0.5, 2 + 0.5, 2 + 0)^T = (1.5, 2.5, 2.0)^T.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q38',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Volume of Solid of Revolution''',
    questionText: '''The region bounded by the curve y = √x, the line x = 4, and the x-axis (y = 0) is rotated 360° about the x-axis. What is the volume of the resulting solid of revolution?''',
    options: ['''8*π''', '''16*π''', '''4*π''', '''32*π / 3'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Solid of Revolution (Disk Method):
1. V = π * ∫_{a}^{b} [f(x)]^2 dx.
2. Here f(x) = √x, from x = 0 to x = 4.
3. [f(x)]^2 = (√x)^2 = x.
4. V = π * ∫_{0}^{4} x dx = π * [x^2 / 2]_{0}^{4} = π * (16 / 2) = 8*π.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q39',
    year: 2026,
    subject: '''Probability''',
    topic: '''Joint Continuous Distributions''',
    questionText: '''Let continuous random variables X and Y have joint probability density function:
f(x, y) = c * (x + 2y), for 0 ≤ x ≤ 1, 0 ≤ y ≤ 1, and 0 otherwise.
What are the values of the normalization constant c and the probability P(X < 0.5)?''',
    options: ['''c = 2/3, P(X < 0.5) = 5/12''', '''c = 1/2, P(X < 0.5) = 1/4''', '''c = 2/3, P(X < 0.5) = 7/12''', '''c = 3/2, P(X < 0.5) = 1/3'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Joint Density Integration:
1. Normalization: ∫_0^1 ∫_0^1 (x + 2y) dx dy = ∫_0^1 [x^2/2 + 2xy]_0^1 dy = ∫_0^1 (1/2 + 2y) dy = [y/2 + y^2]_0^1 = 3/2.
   So c * (3/2) = 1 => c = 2/3.
2. Marginal density f_X(x) = ∫_0^1 (2/3)(x + 2y) dy = (2/3)[xy + y^2]_0^1 = (2/3)(x + 1).
3. P(X < 0.5) = ∫_0^0.5 (2/3)(x + 1) dx = (2/3)[x^2/2 + x]_0^0.5 = (2/3)(0.125 + 0.5) = (2/3)(5/8) = 10/24 = 5/12.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q40',
    year: 2026,
    subject: '''Digital Logic''',
    topic: '''Flip-Flops (Master-Slave Race-Around Elimination)''',
    questionText: '''In a standard level-triggered JK flip-flop, the race-around condition occurs when J = 1, K = 1 and clock pulse width exceeds flip-flop propagation delay. Which architectural mechanism in a Master-Slave JK flip-flop eliminates this race-around condition?''',
    options: ['''The master is active on clock HIGH while slave is disabled, and the slave updates on clock LOW while master is disabled, isolating input from output during state transitions.''', '''Increasing the clock pulse width to exceed twice the circuit propagation delay.''', '''Adding an external AND gate to feedback output Q directly to the clock line.''', '''Operating both master and slave flip-flops simultaneously on the rising clock edge.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Master-Slave Operation:
- The Master flip-flop is clocked with CLK, and the Slave with NOT(CLK).
- When CLK is HIGH, Master responds to inputs J and K while Slave remains disabled and holds the external outputs steady.
- When CLK transitions to LOW, Master is disabled (inputs isolated), and Slave transfers the state from Master to output.
- Because Master and Slave are never active at the same time, outputs cannot loop back to inputs during the same clock pulse, eliminating race-around.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q41',
    year: 2026,
    subject: '''Computer Organization and Architecture''',
    topic: '''Cache Memory Addressing''',
    questionText: '''A processor utilizes a 32 KB direct-mapped cache with 64-byte block size on a 32-bit byte-addressable system. What are the sizes of the cache Index and Block Offset fields (in bits)?''',
    options: ['''Index = 9 bits, Offset = 6 bits''', '''Index = 10 bits, Offset = 5 bits''', '''Index = 8 bits, Offset = 7 bits''', '''Index = 15 bits, Offset = 6 bits'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Cache Addressing Calculation:
1. Block size = 64 bytes = 2^6 bytes => Offset field = 6 bits.
2. Cache size = 32 KB = 32 * 1024 bytes = 32768 bytes = 2^15 bytes.
3. Number of lines = 2^15 / 2^6 = 2^9 = 512 lines.
4. In direct-mapped cache, number of sets = number of lines = 512 = 2^9.
5. Index field = log_2(512) = 9 bits.
6. Tag field = 32 - (9 + 6) = 17 bits.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q42',
    year: 2026,
    subject: '''Programming and Data Structures''',
    topic: '''Binary Search Trees (Deletion with Two Children)''',
    questionText: '''When deleting a node Z that has two children from a Binary Search Tree (BST), the standard algorithm replaces Z's key with that of its in-order successor Y. Which of the following statements is ALWAYS TRUE regarding Y?''',
    options: ['''Y has no left child, and its key is the smallest key strictly greater than Z's key in Z's right subtree.''', '''Y has no right child and must always be a leaf node.''', '''Y is always the immediate root of the left subtree of Z.''', '''Y must be an internal node with two non-empty children.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''In-order Successor in BST Deletion:
- The in-order successor of Z (when Z has two children) is the minimum node in Z's right subtree.
- To find the minimum in a subtree, one moves down along left children until no left child exists.
- Thus, Y can NEVER have a left child (though it may or may not have a right child).
- Its key is the minimum element in Z's right subtree, making it the smallest key strictly greater than Z.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q43',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Heaps (Build-Heap Linear Time Complexity)''',
    questionText: '''The algorithm BUILD-MAX-HEAP constructs a heap of n elements in O(n) worst-case time by invoking MAX-HEAPIFY bottom-up. Which of the following mathematical summations rigorously establishes this O(n) bound (where h denotes node height)?''',
    options: ['''∑_{h=0}^{⌊lg n⌋} ⌈n / 2^(h+1)⌉ * O(h) = O(n * ∑_{h=0}^∞ (h / 2^h)) = O(n)''', '''∑_{i=1}^n O(lg n) = O(n lg n)''', '''∑_{h=1}^n (n / h) = O(n ln n)''', '''∑_{k=1}^{lg n} 2^k * 2^k = O(n^2)'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Build-Heap Complexity Analysis:
- An n-element heap has height ⌊lg n⌋.
- At height h, there are at most ⌈n / 2^(h+1)⌉ nodes.
- MAX-HEAPIFY takes O(h) time at height h.
- Total time = ∑_{h=0}^{⌊lg n⌋} ⌈n / 2^(h+1)⌉ * O(h) = O(n * ∑_{h=0}^∞ (h / 2^h)).
- Since ∑_{h=0}^∞ (h / 2^h) converges to 2, the overall bound is O(n * 2) = O(n).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q44',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Graph Algorithms (Kosaraju's SCC)''',
    questionText: '''Kosaraju's algorithm identifies the Strongly Connected Components (SCCs) of a directed graph G = (V, E) using two passes of DFS. Why is the second DFS pass executed on the transposed graph G^T in decreasing order of vertices' finish times from the first pass?''',
    options: ['''Reversing edges in G^T inverts the component DAG into a sink DAG, preventing DFS from escaping into subsequent components.''', '''Reversing edges transforms cyclic dependencies into acyclic trees.''', '''G^T reduces the time complexity of DFS from O(V^2) to O(V + E).''', '''Reversing edges guarantees that all back-edges in G become cross-edges in G^T.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Kosaraju's Invariance:
- In the component DAG of G, the SCC with the highest finish time is a source SCC.
- When edges are transposed to form G^T, this source SCC becomes a sink SCC (no outgoing edges to other components).
- Running DFS on G^T starting at the highest finish time vertex explores ONLY that component because there are no outbound edges from sink components in G^T.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q45',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Dynamic Programming (Floyd-Warshall Recurrence)''',
    questionText: '''In the Floyd-Warshall algorithm for All-Pairs Shortest Paths, let d_ij^(k) denote the shortest path distance from vertex i to vertex j using intermediate vertices from {1, 2, ..., k}. What is the correct dynamic programming recurrence for d_ij^(k)?''',
    options: ['''d_ij^(k) = min( d_ij^(k-1), d_ik^(k-1) + d_kj^(k-1) )''', '''d_ij^(k) = min( d_ij^(k-1), d_ki^(k-1) + d_jk^(k-1) )''', '''d_ij^(k) = d_ik^(k-1) + d_kj^(k-1)''', '''d_ij^(k) = min_{1 ≤ m ≤ n} ( d_im^(k-1) + w(m, j) )'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Floyd-Warshall Recurrence:
- If vertex k is NOT an intermediate vertex on the shortest path from i to j, then d_ij^(k) = d_ij^(k-1).
- If vertex k IS an intermediate vertex on the shortest path, then the path consists of a subpath from i to k and a subpath from k to j, both using intermediate vertices from {1, ..., k-1}. Hence distance = d_ik^(k-1) + d_kj^(k-1).
- Therefore, d_ij^(k) = min( d_ij^(k-1), d_ik^(k-1) + d_kj^(k-1) ).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q46',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''Undecidability (Post Correspondence Problem Reduction)''',
    questionText: '''The Post Correspondence Problem (PCP) is known to be undecidable. Which of the following undecidability results in formal language theory is proven by a reduction directly from PCP?''',
    options: ['''Determining whether an arbitrary Context-Free Grammar is ambiguous.''', '''Determining whether a Deterministic Finite Automaton accepts an infinite language.''', '''Determining whether an arbitrary regular expression generates the empty string.''', '''Determining whether a Deterministic Pushdown Automaton accepts the empty language.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''PCP Reductions:
- A foundational result in formal language theory reduces PCP to the ambiguity problem for CFGs.
- Specifically, given a PCP instance with pairs (x_i, y_i), one constructs a CFG that is ambiguous if and only if the PCP instance has a match. Hence CFG ambiguity is undecidable.
- In contrast, DFA infiniteness and emptiness are decidable in polynomial time, regex emptiness is trivial, and DPDA emptiness is decidable.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q47',
    year: 2026,
    subject: '''Compiler Design''',
    topic: '''Static Single Assignment (SSA Dominance Frontiers)''',
    questionText: '''In Static Single Assignment (SSA) form construction, φ-functions are placed at join points in the control flow graph. According to the Cytron et al. criterion, at which basic blocks must a φ-function for variable v be inserted?''',
    options: ['''In the iterated dominance frontier DF+(S) of the set S of basic blocks containing definitions of v.''', '''Exclusively in the immediate dominator idom(B) of the procedure entry block.''', '''In all basic blocks that strictly post-dominate the CFG exit node.''', '''In every basic block that has two or more predecessor blocks in the CFG regardless of where v is defined.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''SSA φ-function Placement:
- Cytron et al. (1991) proved that placing φ-functions minimally requires computing the dominance frontier DF(X) for each block X.
- For a variable v defined in a set of blocks S, φ-functions must be inserted in the iterated dominance frontier DF+(S).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q48',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''Deadlock (Banker's Algorithm Safety Check)''',
    questionText: '''A system contains 5 processes (P0, P1, P2, P3, P4) and 3 resource types (A, B, C) with total instances (10, 5, 7).
At time T0, current allocation is:
P0: (0, 1, 0), P1: (2, 0, 0), P2: (3, 0, 2), P3: (2, 1, 1), P4: (0, 0, 2).
Total allocated = (7, 2, 5). Available = (3, 3, 2).
Maximum demands are:
P0: (7, 5, 3), P1: (3, 2, 2), P2: (9, 0, 2), P3: (2, 2, 2), P4: (4, 3, 3).
Which of the following is a VALID safe sequence of execution?''',
    options: ['''<P1, P3, P4, P0, P2>''', '''<P0, P1, P2, P3, P4>''', '''<P2, P1, P3, P4, P0>''', '''<P4, P3, P2, P1, P0>'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Banker's Algorithm Verification:
1. Need matrix = Max - Allocation:
   Need(P0) = (7, 4, 3)
   Need(P1) = (1, 2, 2)
   Need(P2) = (6, 0, 0)
   Need(P3) = (0, 1, 1)
   Need(P4) = (4, 3, 1)
2. Available = (3, 3, 2).
   Only P1 and P3 can be satisfied initially (Need ≤ Available).
   P0, P2, P4 require more than 3 units of A initially.
3. Test sequence <P1, P3, P4, P0, P2>:
   - P1 runs: Available becomes (3,3,2) + (2,0,0) = (5,3,2).
   - P3 runs: Need(P3)=(0,1,1) ≤ (5,3,2). Available becomes (5,3,2) + (2,1,1) = (7,4,3).
   - P4 runs: Need(P4)=(4,3,1) ≤ (7,4,3). Available becomes (7,4,3) + (0,0,2) = (7,4,5).
   - P0 runs: Need(P0)=(7,4,3) ≤ (7,4,5). Available becomes (7,4,5) + (0,1,0) = (7,5,5).
   - P2 runs: Need(P2)=(6,0,0) ≤ (7,5,5). Available becomes (7,5,5) + (3,0,2) = (10,5,7).
4. All processes safely terminate. Hence <P1, P3, P4, P0, P2> is valid.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q49',
    year: 2026,
    subject: '''Databases''',
    topic: '''Query Optimization (Heuristic Transformation Rules)''',
    questionText: '''In heuristic relational query optimization, which transformation rule is prioritized earliest to minimize intermediate relation sizes before performing expensive joins?''',
    options: ['''Pushing selection operators (σ) as far down the query tree as possible.''', '''Delaying projection operators (π) until the final root node.''', '''Replacing all inner joins with cartesian products followed by filters.''', '''Grouping all unary operators at the root of the relational algebraic tree.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Relational Query Optimization:
- The fundamental heuristic in relational algebraic optimization is to perform selections (σ) as early as possible.
- Pushing selections down reduces the number of tuples in intermediate relations before joins are computed, drastically decreasing memory footprint and I/O cost.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q50',
    year: 2026,
    subject: '''Computer Networks''',
    topic: '''Sliding Window Protocols (Selective Repeat Window Size)''',
    questionText: '''In a Selective Repeat (SR) sliding window protocol using k-bit sequence numbers, what is the maximum allowable sender window size W_s (assuming sender window size equals receiver window size W_r) to prevent sequence number ambiguity?''',
    options: ['''W_s ≤ 2^(k-1)''', '''W_s ≤ 2^k - 1''', '''W_s ≤ 2^k''', '''W_s ≤ 2^(k+1)'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Selective Repeat Window Constraint:
- In Selective Repeat, the condition to prevent overlap between the current receiver window and the sender's retransmission window is:
  W_s + W_r ≤ 2^k
- Since W_s = W_r, we have 2 * W_s ≤ 2^k => W_s ≤ 2^(k-1).
- (In Go-Back-N, receiver window W_r = 1, so W_s ≤ 2^k - 1).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q51',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Dynamic Programming (Memoization vs Tabulation)''',
    questionText: '''Which of the following statements regarding Dynamic Programming (Memoization vs Tabulation) are TRUE?''',
    options: ['''Tabulation (bottom-up) avoids call stack overhead by iteratively filling a table in topological order of the subproblem DAG.''', '''Memoization (top-down) computes solutions only for the subproblems that are actually required along the recursive execution path.''', '''Tabulation always examines every subproblem in the subproblem space, even if some subproblems are never reachable from the initial state.''', '''Memoization cannot be used when the underlying subproblem dependency graph contains directed cycles.'''],
    correctAnswer: '''A, B, C, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Memoization vs Tabulation:
- A is TRUE: Tabulation evaluates subproblems iteratively according to a topological ordering, avoiding recursion stack overhead.
- B is TRUE: Top-down memoization evaluates only states reachable from the root request.
- C is TRUE: Tabulation fills the entire array/table systematically regardless of reachability.
- D is TRUE: Both memoization and tabulation require an acyclic subproblem graph (DAG); cycles create infinite recursion or circular deadlock.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q52',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''Myhill-Nerode Theorem & DFA Minimality''',
    questionText: '''Let L ⊆ Σ* be a formal language. Which of the following statements are TRUE according to the Myhill-Nerode Theorem?''',
    options: ['''L is regular if and only if the Myhill-Nerode equivalence relation ≡_L has a finite number of equivalence classes (finite index).''', '''The number of states in the minimal Deterministic Finite Automaton (DFA) accepting L is strictly equal to the index of ≡_L.''', '''The minimal DFA for any regular language is unique up to state renaming (isomorphism).''', '''If an equivalence relation has an infinite index, the corresponding language can never be accepted by any Turing Machine.'''],
    correctAnswer: '''A, B, C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Myhill-Nerode Theorem:
- A is TRUE: The fundamental criterion for regularity is that the prefix equivalence relation has finite index.
- B is TRUE: Each equivalence class corresponds to exactly one state in the minimal DFA.
- C is TRUE: The minimal DFA is unique up to isomorphism.
- D is FALSE: Non-regular languages such as {a^n b^n | n ≥ 0} have infinite index under Myhill-Nerode equivalence, but are readily decidable and accepted by Turing Machines.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q53',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''Dining Philosophers (Deadlock Prevention)''',
    questionText: '''Consider the classic Dining Philosophers problem with 5 philosophers and 5 chopsticks placed in a circle. Which of the following strategies successfully PREVENT deadlock?''',
    options: ['''Allow at most 4 philosophers to sit at the table simultaneously.''', '''Asymmetric strategy: Odd-numbered philosophers pick up left chopstick first, then right; even-numbered philosophers pick up right chopstick first, then left.''', '''A philosopher acquires chopsticks only if both adjacent chopsticks are simultaneously available inside a critical section.''', '''Allow all 5 philosophers to pick up their left chopstick first, and wait indefinitely until the right chopstick becomes available.'''],
    correctAnswer: '''A, B, C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Dining Philosophers Deadlock Prevention:
- A is TRUE: By Pigeonhole Principle, with at most 4 philosophers and 5 chopsticks, at least one philosopher is guaranteed both chopsticks, breaking circular wait.
- B is TRUE: Eliminates circular wait by breaking the structural symmetry of resource ordering.
- C is TRUE: Eliminates hold-and-wait by making chopstick acquisition atomic.
- D is FALSE: If all 5 philosophers pick up their left chopstick simultaneously, a circular wait deadlock immediately occurs.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q54',
    year: 2026,
    subject: '''Databases''',
    topic: '''ARIES Crash Recovery Protocol''',
    questionText: '''Which of the following statements regarding the ARIES (Algorithms for Recovery and Isolation Exploiting Semantics) database crash recovery algorithm are TRUE?''',
    options: ['''ARIES employs a Write-Ahead Logging (WAL) protocol supporting steal and no-force buffer management policies.''', '''The Analysis pass determines the system state at crash time, identifying dirty pages in buffer pool and active uncommitted transactions.''', '''The Redo pass repeats history, redoing actions of both committed and uncommitted (loser) transactions starting from the smallest recLSN in the Dirty Page Table.''', '''During the Undo pass, Compensation Log Records (CLRs) are written so that undo actions are never undone if repeated crashes occur during recovery.'''],
    correctAnswer: '''A, B, C, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''ARIES Recovery Protocol:
- A is TRUE: ARIES supports steal (uncommitted pages can be flushed to disk) and no-force (committed pages need not be flushed immediately).
- B is TRUE: Analysis phase scans forward from checkpoint to reconstruct transaction table and dirty page table.
- C is TRUE: Redo phase repeats history starting from minimum recLSN across all dirty pages, bringing the database to the exact state at crash.
- D is TRUE: Undo phase undoes active loser transactions and writes CLRs with UndoNextLSN pointers to ensure idempotent recovery across multiple crashes.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q55',
    year: 2026,
    subject: '''Computer Networks''',
    topic: '''Network Security & Cryptography''',
    questionText: '''Which of the following statements regarding cryptographic mechanisms are TRUE?''',
    options: ['''RSA is an asymmetric cipher whose security is based on the computational difficulty of factoring large composite integers.''', '''AES (Advanced Encryption Standard) is a symmetric block cipher that operates on 128-bit blocks of data using key sizes of 128, 192, or 256 bits.''', '''Digital signatures provide message non-repudiation, sender authentication, and message integrity.''', '''Symmetric key ciphers are computationally much slower than asymmetric key ciphers for large file bulk encryption.'''],
    correctAnswer: '''A, B, C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Cryptographic Principles:
- A is TRUE: RSA relies on the hardness of the integer factorization problem.
- B is TRUE: AES has a fixed block size of 128 bits and supports 128, 192, and 256-bit key lengths.
- C is TRUE: A digital signature provides sender authentication, message integrity, and non-repudiation.
- D is FALSE: Symmetric encryption is 100 to 1000 times FASTER than asymmetric encryption; hence symmetric encryption is used for bulk data transfer.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q56',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Matrix Similarity Invariants''',
    questionText: '''Let A and B be two n x n matrices over R such that B = P^(-1) * A * P for some invertible matrix P (similar matrices). Which of the following properties are IDENTICAL for A and B?''',
    options: ['''Eigenvalues''', '''Determinant''', '''Trace''', '''Eigenvectors'''],
    correctAnswer: '''A, B, C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Similarity Invariants:
- Characteristic polynomial: det(B - λI) = det(P^(-1)(A - λI)P) = det(A - λI).
- Because characteristic polynomials are identical:
  - Eigenvalues are identical (A is TRUE).
  - Determinant is identical (B is TRUE).
  - Trace is identical (C is TRUE).
- Eigenvectors are NOT identical: if v is an eigenvector of A, then P^(-1)v is an eigenvector of B (D is FALSE).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q57',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Combinatorics (Derangements of 5 Elements)''',
    questionText: '''Five people attend a conference and check their coats at the reception. At departure, the attendant distributes coats completely at random, one coat to each person. Calculate the number of permutations where NO person receives their own coat.''',
    options: [],
    correctAnswer: '''44''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Derangement Formula for n = 5:
D_5 = 5! * [1/0! - 1/1! + 1/2! - 1/3! + 1/4! - 1/5!]
    = 120 * [1 - 1 + 1/2 - 1/6 + 1/24 - 1/120]
    = 120 * [60/120 - 20/120 + 5/120 - 1/120]
    = 60 - 20 + 5 - 1 = 44.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q58',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Max-Flow Min-Cut Theorem''',
    questionText: '''Consider a flow network with source s, sink t, and intermediate vertices u and v. The directed edge capacities are: c(s, u) = 10, c(s, v) = 10, c(u, v) = 2, c(u, t) = 4, and c(v, t) = 9. Calculate the maximum flow from s to t.''',
    options: [],
    correctAnswer: '''13''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Max-Flow Min-Cut Calculation:
1. Cut S = {s, u, v}, T = {t}.
   Capacity of cut = c(u, t) + c(v, t) = 4 + 9 = 13.
2. Verify flow augmentation:
   - Augment path s -> u -> t with 4 units (saturating (u, t)).
   - Augment path s -> u -> v -> t with 2 units (saturating (u, v)).
   - Remaining capacity on (v, t) = 9 - 2 = 7 units.
   - Augment path s -> v -> t with 7 units (saturating (v, t)).
   - Total flow = 4 + 2 + 7 = 13.
3. By Max-Flow Min-Cut Theorem, maximum flow = 13.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q59',
    year: 2026,
    subject: '''Digital Logic''',
    topic: '''Counters (Frequency Division)''',
    questionText: '''A square-wave clock signal with a frequency of 32 MHz is applied to the clock input of a ripple counter constructed by cascading 4 T-flip-flops, each configured in toggle mode (T = 1). Calculate the frequency of the output signal from the final flip-flop in MHz.''',
    options: [],
    correctAnswer: '''2''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Frequency Division via T-Flip-Flops:
1. Each toggle-mode flip-flop divides the input clock frequency by 2.
2. With n = 4 cascaded flip-flops, the total division factor is 2^4 = 16.
3. Output frequency = 32 MHz / 16 = 2 MHz.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q60',
    year: 2026,
    subject: '''Computer Organization and Architecture''',
    topic: '''Pipelining (Execution Time)''',
    questionText: '''A 5-stage pipelined processor operates with a clock cycle time of 2 ns. An application executes a loop of 1000 independent instructions on this pipeline with zero stall cycles. Calculate the total execution time of the program on the pipelined processor in nanoseconds.''',
    options: [],
    correctAnswer: '''2008''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Pipelined Execution Time:
1. Number of stages k = 5.
2. Number of instructions n = 1000.
3. Clock cycle time τ = 2 ns.
4. Total clock cycles required = k + (n - 1) = 5 + (1000 - 1) = 1004 cycles.
5. Total execution time = 1004 * 2 ns = 2008 ns.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q61',
    year: 2026,
    subject: '''Programming and Data Structures''',
    topic: '''C Nested Loops & Iteration Count''',
    questionText: '''Consider the following C code snippet:

int count = 0;
for (int i = 1; i <= 10; i++) {
    for (int j = 1; j <= i; j++) {
        count += 2;
    }
}

Calculate the final value of the variable count after the loops terminate.''',
    options: [],
    correctAnswer: '''110''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Nested Loop Execution Trace:
1. Outer loop runs for i = 1 to 10.
2. Inner loop runs i times for each i.
3. Total number of inner loop executions = sum_{i=1}^{10} i = (10 * 11) / 2 = 55.
4. In each execution, count increments by 2.
5. Final value of count = 55 * 2 = 110.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q62',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''Page Replacement (Optimal Algorithm Fault Count)''',
    questionText: '''A virtual memory system has 3 initially empty page frames. Consider the page reference string:
1, 2, 3, 4, 1, 2, 5, 1, 2, 3, 4, 5.
Calculate the total number of page faults that occur under the Optimal (OPT) page replacement policy.''',
    options: [],
    correctAnswer: '''7''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Optimal Page Replacement Trace (3 frames):
1. Ref 1: Miss -> Frames: [1] (Fault 1)
2. Ref 2: Miss -> Frames: [1, 2] (Fault 2)
3. Ref 3: Miss -> Frames: [1, 2, 3] (Fault 3)
4. Ref 4: Miss -> Frames: [1, 2, 3]. Next uses: 1 (at 5), 2 (at 6), 3 (at 10). Evict 3. Frames: [1, 2, 4] (Fault 4)
5. Ref 1: Hit -> Frames: [1, 2, 4]
6. Ref 2: Hit -> Frames: [1, 2, 4]
7. Ref 5: Miss -> Frames: [1, 2, 4]. Next uses: 1 (at 8), 2 (at 9), 4 (at 11). Evict 4. Frames: [1, 2, 5] (Fault 5)
8. Ref 1: Hit -> Frames: [1, 2, 5]
9. Ref 2: Hit -> Frames: [1, 2, 5]
10. Ref 3: Miss -> Frames: [1, 2, 5]. Neither 1 nor 2 will be referenced again. Evict 1. Frames: [3, 2, 5] (Fault 6)
11. Ref 4: Miss -> Frames: [3, 2, 5]. Ref 5 used at 12. Evict 2. Frames: [3, 4, 5] (Fault 7)
12. Ref 5: Hit -> Frames: [3, 4, 5]
Total page faults = 7.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q63',
    year: 2026,
    subject: '''Databases''',
    topic: '''B+ Trees (Internal Node Maximum Order)''',
    questionText: '''A B+ tree index is constructed on an attribute of size 12 bytes. Disk block size is 1024 bytes. Tree pointers and record pointers are each 8 bytes in size. Calculate the maximum order (maximum number of block pointers) of an internal node in this B+ tree.''',
    options: [],
    correctAnswer: '''51''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''B+ Tree Internal Node Order:
1. An internal node with order p contains p tree pointers and (p - 1) search key values.
2. Space occupied = p * (pointer_size) + (p - 1) * (key_size) ≤ block_size.
3. p * 8 + (p - 1) * 12 ≤ 1024.
4. 8p + 12p - 12 ≤ 1024 => 20p ≤ 1036 => p ≤ 51.8.
5. Since p must be an integer, max order p = 51.
6. Check: 51 * 8 + 50 * 12 = 408 + 600 = 1008 bytes ≤ 1024 bytes.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q64',
    year: 2026,
    subject: '''Computer Networks''',
    topic: '''MAC Protocols (Slotted ALOHA Throughput)''',
    questionText: '''A shared broadcast channel operates at a data rate of 1000 kbps using the Slotted ALOHA protocol. Assuming maximum theoretical channel efficiency S_max = 1/e ≈ 0.368, calculate the maximum achievable throughput of the channel in kbps.''',
    options: [],
    correctAnswer: '''368''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Slotted ALOHA Throughput:
1. Maximum theoretical efficiency S_max = 1/e ≈ 0.368 (36.8%).
2. Channel bandwidth = 1000 kbps.
3. Maximum throughput = 0.368 * 1000 kbps = 368 kbps.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK7_Q65',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''Minimal DFA State Count''',
    questionText: '''Consider the language L over {0, 1} defined by: L = {w in {0, 1}* | |w| is divisible by 2 or |w| is divisible by 3}. Calculate the number of states in the minimal Deterministic Finite Automaton (DFA) that accepts L.''',
    options: [],
    correctAnswer: '''6''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Minimal DFA State Calculation:
1. The condition depends only on the length |w| modulo lcm(2, 3) = 6.
2. The possible remainder states are r in {0, 1, 2, 3, 4, 5}.
3. Accept states are those where r is divisible by 2 or 3: {0, 2, 3, 4}.
4. Reject states: {1, 5}.
5. Pairwise distinguishability:
   - Reject states {1, 5}: from state 1, string of length 2 leads to remainder 3 (Accept). From state 5, string of length 2 leads to remainder 1 (Reject). Hence state 1 ≠ state 5.
   - Accept states {0, 2, 3, 4} are similarly distinguishable by future transitions to reject states.
6. All 6 remainder states are pairwise distinguishable under Myhill-Nerode equivalence.
7. Therefore, the minimal DFA contains exactly 6 states.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
];
