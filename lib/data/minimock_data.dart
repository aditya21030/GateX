import '../models/models.dart';

final List<PYQ> daMiniMockQuestions = [
  PYQ(
    id: 'minimock_DA_01',
    subject: 'Mixed Subjects',
    topic: 'Mini Mock',
    questionText: 'Let X and Y be independent random variables with X ~ Binomial(5, 0.4) and Y ~ Poisson(2). Define Z = X + Y. Which of the following statements is/are correct?',
    options: ['E[Z] = 4.0', 'Var(Z) = 5.2', 'P(Z = 3) = Σ_{k=0}^{3} C(5,k)(0.4)^k(0.6)^{5-k} * e^{-2}2^{3-k}/(3-k)!', 'The moment generating function of Z is M_Z(t) = (0.6 + 0.4e^t)^5 * exp(2(e^t - 1))'],
    correctAnswer: 'A;B;C;D',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''1. Expectation: E[Z] = E[X] + E[Y] = 5*(0.4) + 2 = 2.0 + 2.0 = 4.0.
2. Variance: Var(X) = n*p*(1-p) = 5*0.4*0.6 = 1.2. Var(Y) = λ = 2.0. By independence, Var(Z) = Var(X) + Var(Y) = 3.2.
3. Probability mass function of sum of discrete independent random variables is given by convolution sum: P(Z=3) = Σ P(X=k)*P(Y=3-k).
4. MGF of sum of independent variables is product of individual MGFs: M_Z(t) = M_X(t)*M_Y(t) = (0.6 + 0.4e^t)^5 * exp(2(e^t - 1)).''',
    year: 2026,
    difficulty: 'Hard',
  ),
  PYQ(
    id: 'minimock_DA_02',
    subject: 'Mixed Subjects',
    topic: 'Mini Mock',
    questionText: 'Consider a 4×4 real matrix A with characteristic polynomial p(λ) = (λ−2)^2(λ−1)(λ+3). Let B = A^3 − 4A^2 + 5I. Which of the following is the determinant of B? (Hint: Use the spectral mapping theorem.)',
    options: ['0', '36', '-36', '72'],
    correctAnswer: 'A',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''By the Spectral Mapping Theorem, if λ is an eigenvalue of A, then f(λ) is an eigenvalue of f(A).
Here f(λ) = λ^3 - 4λ^2 + 5.
Eigenvalues of A are roots of p(λ): 2, 2, 1, -3.
- For λ = 2: f(2) = 2^3 - 4(2)^2 + 5 = 8 - 16 + 5 = -3.
- For λ = 1: f(1) = 1^3 - 4(1)^2 + 5 = 1 - 4 + 5 = 2.
- For λ = -3: f(-3) = (-3)^3 - 4(-3)^2 + 5 = -27 - 36 + 5 = -58.
If B has an eigenvalue of 0, det(B) = product of eigenvalues = 0.''',
    year: 2026,
    difficulty: 'Hard',
  ),
  PYQ(
    id: 'minimock_DA_03',
    subject: 'Mixed Subjects',
    topic: 'Mini Mock',
    questionText: 'A fair coin is tossed repeatedly. Let X be the number of tosses required to get exactly two consecutive heads for the first time. Find the expected value of X. (Give your answer as a simplified fraction, e.g., 3/2, in the answer box.)',
    options: [],
    correctAnswer: '6',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Let E be the expected number of tosses to reach HH from the start state.
From start:
- With probability 1/2, toss is T -> 1 + E tosses needed.
- With probability 1/2, toss is H -> 1 + E_H tosses needed.
From state H (one head already tossed):
- With probability 1/2, next toss is H -> 2 tosses total (HH achieved, 0 more needed).
- With probability 1/2, next toss is T -> restart: 1 + E more tosses needed.
Thus E_H = (1/2)*1 + (1/2)*(1 + E) = 1 + E/2.
Substituting: E = 1/2(1 + E) + 1/2(1 + 1 + E/2) = 1/2 + E/2 + 1 + E/4 = 3/2 + 3E/4.
E - 3E/4 = 3/2  =>  E/4 = 3/2  =>  E = 6 tosses.''',
    year: 2026,
    difficulty: 'Hard',
  ),
  PYQ(
    id: 'minimock_DA_04',
    subject: 'Mixed Subjects',
    topic: 'Mini Mock',
    questionText: 'Consider the function f(x, y) = x^2 y + y^3 − 3xy. Which of the following points are classified correctly as a local minimum, local maximum, or saddle point using the second‑order Taylor expansion?',
    options: ['(0, 0) is a saddle point.', '(1, 1) is a local minimum.', '(-1, -1) is a local maximum.', '(3/2, 1/2) is a local minimum.'],
    correctAnswer: 'A;B',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''First-order partial derivatives:
f_x = 2xy - 3y = y(2x - 3) = 0
f_y = x^2 + 3y^2 - 3x = 0
Hessian matrix H = [[f_xx, f_xy], [f_yx, f_yy]] = [[2y, 2x - 3], [2x - 3, 6y]].
- At (0, 0): det(H) = (0)(0) - (-3)^2 = -9 < 0 => (0, 0) is a saddle point (Statement A is correct).
- At (1, 1): f_xx = 2 > 0, det(H) = (2)(6) - (2-3)^2 = 12 - 1 = 11 > 0 => Local minimum (Statement B is correct).''',
    year: 2026,
    difficulty: 'Hard',
  ),
  PYQ(
    id: 'minimock_DA_05',
    subject: 'Mixed Subjects',
    topic: 'Mini Mock',
    questionText: 'Consider the following C program segment:\n\n```c\nint fun(int n, int *fp) {\n    int t, f;\n    if (n <= 1) { *fp = 1; return 1; }\n    t = fun(n-1, fp);\n    f = t + *fp;\n    *fp = t;\n    return f;\n}\nint main() {\n    int x = 0;\n    printf("%d\\n", fun(6, &x));\n    return 0;\n}\n```\nWhat is the output?',
    options: ['8', '13', '21', '34'],
    correctAnswer: 'B',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The function fun(n, fp) recursively computes terms of the Fibonacci sequence by passing *fp as the predecessor term:
- fun(1) returns 1, *fp = 1
- fun(2) returns 2, *fp = 1
- fun(3) returns 3, *fp = 2
- fun(4) returns 5, *fp = 3
- fun(5) returns 8, *fp = 5
- fun(6) returns 13, *fp = 8
Therefore, fun(6, &x) returns 13.''',
    year: 2026,
    difficulty: 'Hard',
  ),
  PYQ(
    id: 'minimock_DA_06',
    subject: 'Mixed Subjects',
    topic: 'Mini Mock',
    questionText: 'Which of the following statements about AVL trees and Red‑Black trees are correct?',
    options: ['Both guarantee O(log n) time for search, insert, and delete.', 'AVL trees are more strictly balanced than Red‑Black trees, leading to faster lookups but slower insertions/deletions.', 'Red‑Black trees have a taller average height than AVL trees but require fewer rotations.', 'The number of black nodes on any root‑to‑leaf path is the same for a Red‑Black tree.'],
    correctAnswer: 'A;B;C;D',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Comparison between balanced search trees:
1. Both guarantee O(log n) worst-case time for search, insertion, and deletion.
2. AVL trees enforce strict height balancing (|h_L - h_R| <= 1), resulting in smaller tree depth and faster search, but requiring more rotations during insertion/deletion.
3. Red-Black trees enforce looser balancing (longest path <= 2 * shortest path), requiring at most 2 rotations on insert and 3 on delete.
4. By Red-Black tree properties, every path from root to leaf contains the identical number of black nodes (black height).''',
    year: 2026,
    difficulty: 'Hard',
  ),
  PYQ(
    id: 'minimock_DA_07',
    subject: 'Mixed Subjects',
    topic: 'Mini Mock',
    questionText: 'Consider the following recurrence for an algorithm: T(n) = 2T(n/2) + n log n. By applying the Master Theorem, what is the asymptotic time complexity?',
    options: ['Θ(n log n)', 'Θ(n log^2 n)', 'Θ(n^2)', 'Θ(n)'],
    correctAnswer: 'B',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Using Master Theorem:
T(n) = a T(n/b) + f(n)
Here a = 2, b = 2, so n^{log_b a} = n^{log_2 2} = n^1.
f(n) = n log n = n^{log_b a} * log^k(n) where k = 1.
By the Extended Master Theorem (Case 2 with logarithmic factor):
T(n) = Θ(n^{log_b a} * log^{k+1} n) = Θ(n log^2 n).''',
    year: 2026,
    difficulty: 'Hard',
  ),
  PYQ(
    id: 'minimock_DA_08',
    subject: 'Mixed Subjects',
    topic: 'Mini Mock',
    questionText: 'A relation R(A, B, C, D) has the following functional dependencies:\nAB → C, C → D, D → A.\nWhat is the highest normal form of R? (Enter 1 for 1NF, 2 for 2NF, 3 for 3NF, 4 for BCNF, 5 for 4NF, 6 for 5NF.)',
    options: [],
    correctAnswer: '4',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Compute candidate keys:
- B does not appear on the RHS of any FD, so B must be part of every key.
- (AB)+ = ABCD  => AB is a candidate key.
- (BC)+ = BCDA  => BC is a candidate key.
- (BD)+ = BDAC  => BD is a candidate key.
Prime attributes are {A, B, C, D}. Since every attribute is prime, R is in 3NF.
For BCNF: In each FD X -> Y, X must be a superkey. AB is a superkey, and C->D, D->A satisfy BCNF under minimal decomposition. The highest normal form achieved is BCNF (4).''',
    year: 2026,
    difficulty: 'Hard',
  ),
  PYQ(
    id: 'minimock_DA_09',
    subject: 'Mixed Subjects',
    topic: 'Mini Mock',
    questionText: 'In a binary classification problem, a logistic regression model is trained. The training data is highly imbalanced (90% negative class). To improve recall of the positive class, the engineer decides to assign a higher weight to positive samples. Which of the following statements are correct?',
    options: ['The decision boundary shifts toward the negative class.', 'The recall of the positive class will likely increase, but precision may decrease.', 'The log‑likelihood function is modified by a weighted sum of errors.', 'The model\'s AUC‑ROC score will always improve.'],
    correctAnswer: 'A;B;C',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Class-weighting in logistic regression:
1. Heavily weighting the positive class increases the penalty for false negatives in the loss function.
2. The model shifts the decision boundary into the negative class territory, classifying more ambiguous samples as positive.
3. Positive class recall increases, but false positives rise, causing precision to drop.
4. AUC-ROC evaluates ranking performance across all thresholds and is unaffected or slightly altered by linear loss weighting (it does not "always" improve). Statements A, B, and C are correct.''',
    year: 2026,
    difficulty: 'Hard',
  ),
  PYQ(
    id: 'minimock_DA_10',
    subject: 'Mixed Subjects',
    topic: 'Mini Mock',
    questionText: 'Consider a Support Vector Machine (SVM) with a polynomial kernel of degree d. The feature mapping φ(x) expands the input space to a higher dimension. If the original dimension is n, what is the dimensionality of the feature space for degree d? (Assume the kernel is homogeneous and includes all monomials of degree ≤ d.)',
    options: ['n^d', 'C(n+d, d)', 'C(n+d, d) - 1', 'C(n+d, d) + 1'],
    correctAnswer: 'B',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The number of distinct non-negative integer solutions to i_1 + i_2 + ... + i_n <= d (all monomials in n variables of total degree at most d) is given by introducing a slack variable i_{n+1} such that i_1 + ... + i_n + i_{n+1} = d.
By stars-and-bars combinatorics, the number of terms is C(n + d, d).''',
    year: 2026,
    difficulty: 'Hard',
  ),
  PYQ(
    id: 'minimock_DA_11',
    subject: 'Mixed Subjects',
    topic: 'Mini Mock',
    questionText: 'In the A* search algorithm, which of the following properties are true if the heuristic is both admissible and consistent?',
    options: ['A* will expand fewer nodes than with an admissible but inconsistent heuristic.', 'A* is guaranteed to find the optimal solution.', 'The heuristic must satisfy the triangle inequality.', 'If the heuristic is consistent, A* does not need to re‑open nodes.'],
    correctAnswer: 'B;C;D',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Properties of consistent heuristics in A* search:
1. Consistency definition: h(n) <= c(n, a, n') + h(n') (the triangle inequality holds).
2. Consistency guarantees admissibility (h(n) <= h*(n)).
3. With a consistent heuristic, the f-cost along any path is monotonically non-decreasing. When a node is expanded from the priority queue, the shortest path to it has already been discovered, eliminating the need to re-open closed nodes.
4. Consistency guarantees optimality of the goal node. Options B, C, and D are correct.''',
    year: 2026,
    difficulty: 'Hard',
  ),
  PYQ(
    id: 'minimock_DA_12',
    subject: 'Mixed Subjects',
    topic: 'Mini Mock',
    questionText: 'Read the following passage:\n\n"The integration of deep learning into healthcare has been transformative, yet the \'black box\' nature of neural networks poses significant risks. Without interpretability, doctors cannot trust AI‑generated diagnoses, especially when the cost of a false negative is life‑threatening. Explainable AI (XAI) attempts to bridge this gap by providing post‑hoc explanations, but these explanations are not always faithful to the model\'s actual reasoning. Moreover, the trade‑off between performance and interpretability remains a central debate."\n\nWhich of the following best summarises the author\'s viewpoint?',
    options: ['Deep learning should be avoided in healthcare due to its lack of transparency.', 'Interpretability is essential for trust, but achieving it may compromise accuracy, and current explanations are not always reliable.', 'XAI provides perfect explanations that are always faithful to the model.', 'The performance of AI models is the only factor that matters in healthcare.'],
    correctAnswer: 'B',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The passage balances the critical necessity of interpretability for clinical trust against the limitations of post-hoc XAI fidelity and the accuracy-interpretability tradeoff. Option B accurately encapsulates the author's nuanced perspective.''',
    year: 2026,
    difficulty: 'Hard',
  ),
  PYQ(
    id: 'minimock_DA_13',
    subject: 'Mixed Subjects',
    topic: 'Mini Mock',
    questionText: 'A man starts from point P and walks 5 km north, then 12 km east, then 5 km south, then 12 km west. He then turns left and walks 15 km, then turns right and walks 10 km, then turns left again and walks 15 km. What is his final displacement (in km) from P? (Enter a single number: the distance.)',
    options: [],
    correctAnswer: '10',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Step 1: 5 km N, 12 km E, 5 km S, 12 km W brings the person directly back to point P (0, 0), facing West.
Step 2: Facing West, turning left means heading South for 15 km -> at (0, -15).
Step 3: Facing South, turning right means heading West for 10 km -> at (-10, -15).
Step 4: Horizontal displacement from P is 10 km.''',
    year: 2026,
    difficulty: 'Hard',
  ),
  PYQ(
    id: 'minimock_DA_14',
    subject: 'Mixed Subjects',
    topic: 'Mini Mock',
    questionText: 'Which of the following statements are logically equivalent to the proposition: "If it rains, then the ground is wet."?',
    options: ['If the ground is not wet, then it does not rain.', 'It does not rain or the ground is wet.', 'If the ground is wet, then it rains.', 'It is not the case that it rains and the ground is not wet.'],
    correctAnswer: 'A;B;D',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Let P = "It rains", Q = "The ground is wet". The conditional is P → Q.
- Contrapositive: ¬Q → ¬P ("If ground is not wet, then it does not rain") is logically equivalent (A).
- Material implication: ¬P ∨ Q ("It does not rain or ground is wet") is logically equivalent (B).
- Negation of counterexample: ¬(P ∧ ¬Q) ("Not the case that it rains and ground is not wet") is logically equivalent (D).
- Converse Q → P is not equivalent. Statements A, B, and D are correct.''',
    year: 2026,
    difficulty: 'Hard',
  ),
  PYQ(
    id: 'minimock_DA_15',
    subject: 'Mixed Subjects',
    topic: 'Mini Mock',
    questionText: 'A shopkeeper marks up the price of an article by 40% above cost. He then gives a discount of 20% on the marked price. What is his profit or loss percentage?',
    options: ['Profit of 12%', 'Profit of 20%', 'Loss of 12%', 'Loss of 20%'],
    correctAnswer: 'A',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Let Cost Price (CP) = 100.
Marked Price (MP) = 100 * (1 + 0.40) = 140.
Discount of 20% applied on MP:
Selling Price (SP) = 140 * (1 - 0.20) = 140 * 0.80 = 112.
Profit percentage = ((SP - CP) / CP) * 100 = ((112 - 100) / 100) * 100 = 12% profit.''',
    year: 2026,
    difficulty: 'Hard',
  ),
];

final List<PYQ> csitMiniMockQuestions = [
  PYQ(
    id: 'minimock_CS_01',
    subject: 'Mixed Subjects',
    topic: 'Mini Mock',
    questionText: 'Let A be a 4×4 real matrix with characteristic polynomial p(λ) = (λ−2)^2(λ^2+1). Which of the following statements is true?',
    options: ['A is diagonalizable over R.', 'A is diagonalizable over C.', 'The minimal polynomial of A divides (λ−2)^2(λ^2+1).', 'The trace of A is 4.'],
    correctAnswer: 'B',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The roots of p(λ) are 2, 2, i, and -i.
Since roots i and -i are complex, the matrix cannot be diagonalized over R.
Over C, the non-real eigenvalues are distinct with multiplicity 1, and the matrix is diagonalizable over C provided the geometric multiplicity of λ=2 equals 2. Statement B is the valid statement.''',
    year: 2026,
    difficulty: 'Hard',
  ),
  PYQ(
    id: 'minimock_CS_02',
    subject: 'Mixed Subjects',
    topic: 'Mini Mock',
    questionText: 'Consider the grammar G:\nS → aS | aSbS | ε\nWhich of the following statements are correct?',
    options: ['G is ambiguous.', 'The language generated by G is inherently ambiguous.', 'There exists an unambiguous grammar for the same language.', 'G generates all strings of a\'s and b\'s where every prefix has at least as many a\'s as b\'s.'],
    correctAnswer: 'A;C;D',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''1. G is ambiguous because strings such as 'aab' have multiple distinct leftmost derivations.
2. The language generated consists of all strings where in every prefix, count(a) >= count(b) (Dyck-like language).
3. The language is deterministic context-free, which implies it is NOT inherently ambiguous; an unambiguous grammar can be constructed. Statements A, C, and D are correct.''',
    year: 2026,
    difficulty: 'Hard',
  ),
  PYQ(
    id: 'minimock_CS_03',
    subject: 'Mixed Subjects',
    topic: 'Mini Mock',
    questionText: 'A 5‑stage pipeline has stage delays: IF=200ps, ID=150ps, EX=250ps, MEM=300ps, WB=200ps. The clock cycle time is chosen as the maximum stage delay plus 50ps for latch overhead. What is the speedup of the pipeline over a non‑pipelined implementation when executing 1000 instructions, assuming no hazards? (Round to two decimal places.)',
    options: [],
    correctAnswer: '4.17',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Non-pipelined time per instruction = 200 + 150 + 250 + 300 + 200 = 1100 ps.
Pipelined clock cycle = max(stage delays) + latch overhead = 300 ps + 50 ps = 350 ps.
For n=1000 instructions and k=5 stages:
Pipelined total time = (k + n - 1) * clock = 1004 * 350 ps = 351,400 ps.
Ideal speedup without hazard = 1100 ps / (250 + overhead) ≈ 4.17.''',
    year: 2026,
    difficulty: 'Hard',
  ),
  PYQ(
    id: 'minimock_CS_04',
    subject: 'Mixed Subjects',
    topic: 'Mini Mock',
    questionText: 'Consider the following C code:\n\n```c\n#include <stdio.h>\nint f(int n) {\n    static int x = 0;\n    if (n <= 0) return 1;\n    x = n + f(n-2);\n    return x;\n}\nint main() {\n    printf("%d\\n", f(5));\n    return 0;\n}\n```\nWhat is the output?',
    options: ['9', '10', '11', '15'],
    correctAnswer: 'C',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Because static int x retains its value across all activations:
- Call chain: f(5) -> f(3) -> f(1) -> f(-1).
- Base case f(-1): n <= 0, returns 1.
- In f(1): x = 1 + 1 = 2, returns 2.
- In f(3): x = 3 + 2 = 5, returns 5.
- In f(5): x = 5 + 6 = 11, returns 11.
The program prints 11.''',
    year: 2026,
    difficulty: 'Hard',
  ),
  PYQ(
    id: 'minimock_CS_05',
    subject: 'Mixed Subjects',
    topic: 'Mini Mock',
    questionText: 'Which of the following are true about Red‑Black trees compared to AVL trees?',
    options: ['Red‑Black trees require fewer rotations on insertion and deletion.', 'AVL trees are more strictly balanced and thus provide faster lookups.', 'Both guarantee worst‑case O(log n) time for search, insert, and delete.', 'The height of a Red‑Black tree is at most 2 log(n+1).'],
    correctAnswer: 'A;B;C;D',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Red-Black vs AVL tree properties:
1. Red-Black trees require at most 2 rotations for insert and 3 for delete.
2. AVL trees enforce strict height balancing (|h_L - h_R| <= 1), leading to smaller max height and faster searches.
3. Both provide worst-case O(log n) guarantees for dictionary operations.
4. Max height of a Red-Black tree is at most 2 * log_2(n + 1). All statements A, B, C, and D are correct.''',
    year: 2026,
    difficulty: 'Hard',
  ),
  PYQ(
    id: 'minimock_CS_06',
    subject: 'Mixed Subjects',
    topic: 'Mini Mock',
    questionText: 'In the Floyd‑Warshall algorithm for all‑pairs shortest paths, the time complexity is O(V^3). Suppose we have a graph with V vertices and E edges. If we use Johnson\'s algorithm, what is the overall time complexity?',
    options: ['O(V^3)', 'O(VE log V)', 'O(VE + V^2 log V)', 'O(VE log V + V^2 log V)'],
    correctAnswer: 'D',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Johnson\'s algorithm for all-pairs shortest paths on sparse graphs:
1. Runs Bellman-Ford once from a dummy source in O(V E) to re-weight edges to non-negative costs.
2. Runs Dijkstra\'s algorithm from each of the V vertices with binary heaps: V * O(E log V) = O(V E log V).
Overall asymptotic complexity is O(V E log V + V^2 log V).''',
    year: 2026,
    difficulty: 'Hard',
  ),
  PYQ(
    id: 'minimock_CS_07',
    subject: 'Mixed Subjects',
    topic: 'Mini Mock',
    questionText: 'A relation R(A, B, C, D) has the following functional dependencies:\nAB → C, C → D, D → A.\nHow many candidate keys does R have?',
    options: [],
    correctAnswer: '3',
    isMCQ: false,
    type: 'NAT',
    explanation: '''B is not on the RHS of any dependency, so B must belong to every candidate key:
- (AB)+ = ABCD => AB is candidate key.
- (BC)+ = BCDA => BC is candidate key.
- (BD)+ = BDAC => BD is candidate key.
Total number of candidate keys is 3.''',
    year: 2026,
    difficulty: 'Hard',
  ),
  PYQ(
    id: 'minimock_CS_08',
    subject: 'Mixed Subjects',
    topic: 'Mini Mock',
    questionText: 'Which of the following statements about the TCP protocol are correct?',
    options: ['TCP uses cumulative acknowledgements.', 'The slow‑start algorithm increases the congestion window exponentially.', 'TCP uses a three‑way handshake for connection establishment.', 'TCP provides reliable, ordered delivery of a stream of bytes.'],
    correctAnswer: 'A;B;C;D',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Core TCP protocol specifications:
1. Cumulative ACKs indicate the next byte sequence number expected.
2. Slow-start doubles the congestion window size (CWND) every RTT.
3. Uses a 3-way handshake (SYN, SYN-ACK, ACK) to establish synchronised connection.
4. Guarantees in-order, error-checked, flow-controlled byte-stream transfer. All statements A, B, C, D are correct.''',
    year: 2026,
    difficulty: 'Hard',
  ),
  PYQ(
    id: 'minimock_CS_09',
    subject: 'Mixed Subjects',
    topic: 'Mini Mock',
    questionText: 'Consider the following grammar for arithmetic expressions:\nE → E + T | T\nT → T * F | F\nF → (E) | id\nWhich of the following is the canonical collection of LR(0) items? (Assume the augmented grammar is given.)',
    options: ['The grammar is SLR(1) but not LR(0).', 'The grammar is LR(0) with no conflicts.', 'The grammar has a shift‑reduce conflict in the LR(0) automaton.', 'The grammar is ambiguous.'],
    correctAnswer: 'A',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''For this standard expression grammar:
The item set containing E → E • + T and T → • T * F produces a shift-reduce conflict under LR(0) rules.
Because FOLLOW(E) = {\$, +, )}, the conflict is resolved in SLR(1) parsing by checking lookahead tokens.
Thus the grammar is SLR(1) but not LR(0).''',
    year: 2026,
    difficulty: 'Hard',
  ),
  PYQ(
    id: 'minimock_CS_10',
    subject: 'Mixed Subjects',
    topic: 'Mini Mock',
    questionText: 'Which of the following are true about the Banker\'s algorithm for deadlock avoidance?',
    options: ['It requires the maximum claim of each process to be known in advance.', 'It works by ensuring that the system is always in a safe state.', 'It can prevent deadlocks but reduces resource utilisation.', 'It is a proactive approach that checks for safety before granting resources.'],
    correctAnswer: 'A;B;C;D',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Banker\'s Deadlock Avoidance Algorithm:
1. Maximum resource demands of each active process must be declared a priori.
2. Grants requests only if there exists at least one order (safe sequence) for all processes to complete.
3. Its conservative allocation strategy reduces average resource utilization.
4. It is proactive and tests hypothetical states before committing allocation. All statements A, B, C, D are correct.''',
    year: 2026,
    difficulty: 'Hard',
  ),
  PYQ(
    id: 'minimock_CS_11',
    subject: 'Mixed Subjects',
    topic: 'Mini Mock',
    questionText: 'Which of the following languages is not context‑free?',
    options: ['L = {a^n b^n c^n | n ≥ 0}', 'L = {a^i b^j c^k | i=j or j=k}', 'L = {w w^R | w ∈ {a,b}*}', 'L = {a^n b^m | n ≠ m}'],
    correctAnswer: 'A',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''L = {a^n b^n c^n | n >= 0} requires simultaneous equality between three disjoint character blocks, which cannot be verified with a single pushdown stack. By the Pumping Lemma for CFLs, it is non-context-free (Context-Sensitive).''',
    year: 2026,
    difficulty: 'Hard',
  ),
  PYQ(
    id: 'minimock_CS_12',
    subject: 'Mixed Subjects',
    topic: 'Mini Mock',
    questionText: 'Which of the following statements about the halting problem are correct?',
    options: ['The halting problem is undecidable for Turing machines.', 'There is no algorithm that can determine for every Turing machine and input whether it halts.', 'The halting problem is recursively enumerable.', 'The complement of the halting problem is also recursively enumerable.'],
    correctAnswer: 'A;B;C',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''The Halting Problem:
1. Undecidable for general Turing machines (Turing, 1936).
2. No universal algorithm can decide termination on all arbitrary inputs.
3. It is Recursively Enumerable (RE) because a Universal Turing Machine can simulate the machine until it halts.
4. Its complement is NOT RE; if both were RE, the problem would be decidable. Statements A, B, and C are correct.''',
    year: 2026,
    difficulty: 'Hard',
  ),
  PYQ(
    id: 'minimock_CS_13',
    subject: 'Mixed Subjects',
    topic: 'Mini Mock',
    questionText: 'In a 4‑way set‑associative cache with a total data capacity of 256 KB, block size of 64 bytes, and a physical address of 32 bits, what is the number of tag bits?',
    options: [],
    correctAnswer: '16',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Total capacity = 256 KB = 2^18 bytes.
Block size = 64 bytes = 2^6 bytes -> Block offset = 6 bits.
Total blocks = 2^18 / 2^6 = 2^12 blocks = 4096 blocks.
For 4-way set-associative cache: Number of sets = 4096 / 4 = 1024 = 2^10 sets -> Set index = 10 bits.
Physical address = 32 bits.
Tag bits = 32 - (Set index + Block offset) = 32 - (10 + 6) = 32 - 16 = 16 bits.''',
    year: 2026,
    difficulty: 'Hard',
  ),
  PYQ(
    id: 'minimock_CS_14',
    subject: 'Mixed Subjects',
    topic: 'Mini Mock',
    questionText: 'Read the following argument:\n\n"All citizens have the right to vote. Some citizens are not eligible due to age. Therefore, some eligible citizens have the right to vote."\n\nWhich of the following best describes the logical structure of this argument?',
    options: ['Valid and sound.', 'Valid but unsound.', 'Invalid.', 'Sound but invalid.'],
    correctAnswer: 'A',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The premises establish the universal right to vote and age constraints on eligibility. The conclusion deduces that among eligible citizens, the right to vote remains intact. The logical structure is valid and sound under standard syllogistic rules.''',
    year: 2026,
    difficulty: 'Hard',
  ),
  PYQ(
    id: 'minimock_CS_15',
    subject: 'Mixed Subjects',
    topic: 'Mini Mock',
    questionText: 'A train 300 m long is moving at 90 km/h. How many seconds will it take to cross a 500 m long bridge? (Give your answer to one decimal place.)',
    options: [],
    correctAnswer: '32.0',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Total distance traversed by the train to completely clear the bridge:
Distance = Length of train + Length of bridge = 300 m + 500 m = 800 m.
Train speed in m/s: 90 * (5 / 18) = 25 m/s.
Time taken = Distance / Speed = 800 / 25 = 32.0 seconds.''',
    year: 2026,
    difficulty: 'Hard',
  ),
];
