// AUTO-GENERATED MOCK 9 QUESTIONS (LEVEL 9: GRANDMASTER ELITE DIFFICULTY)
import '../models/models.dart';

final List<PYQ> daFullMock9Questions = [
  PYQ(
    id: 'DA_MOCK9_GA_01',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Verbal Ability''',
    questionText: '''Choose the word that best completes the sentence:
"The senior architect's ________ analysis revealed subtle security flaws in the cryptographic protocol that multiple external audit teams had previously overlooked."''',
    options: ['''perspicacious''', '''lugubrious''', '''meretricious''', '''intransigent'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''"Perspicacious" means having a ready insight into and understanding of things; mentally acute or discerning.
A perspicacious analysis successfully uncovers subtle, non-obvious flaws.
Lugubrious means looking or sounding sad; meretricious means apparently attractive but having no real value; intransigent means unwilling to change one's views.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_GA_02',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Critical Reasoning''',
    questionText: '''Consider the statements:
1. No pure mathematician in the department accepts unverified empirical heuristics.
2. All data engineers in the laboratory accept unverified empirical heuristics.
Which of the following conclusions is logically valid?''',
    options: ['''No pure mathematician in the department is a data engineer in the laboratory.''', '''Some pure mathematicians are data engineers.''', '''All data engineers in the laboratory are pure mathematicians.''', '''Anyone who rejects empirical heuristics is a pure mathematician.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Let M be the set of pure mathematicians, E be the set of people who accept unverified empirical heuristics, and D be the set of data engineers.
Premise 1: M cap E = empty set (No mathematician accepts heuristics).
Premise 2: D subset E (All data engineers accept heuristics).
Since M and E are disjoint, and D is contained entirely within E, M and D must also be completely disjoint:
M cap D = empty set.
Thus, "No pure mathematician in the department is a data engineer in the laboratory" is logically guaranteed.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_GA_03',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude''',
    questionText: '''An engineer walks up a moving escalator from the ground floor to the first floor.
When walking at a rate of 1 step per second, the engineer takes 40 steps to reach the top.
When walking at a rate of 2 steps per second, the engineer takes 60 steps to reach the top.
How many steps would the engineer have to climb if the escalator were stationary?''',
    options: ['''120 steps''', '''100 steps''', '''80 steps''', '''150 steps'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Let N be the total number of visible steps on the stationary escalator, and v_e be the speed of the escalator in steps per second.
Case 1:
Walking speed = 1 step/sec.
Number of steps walked = 40.
Time taken t_1 = 40 / 1 = 40 seconds.
In 40 seconds, the escalator moves 40 * v_e steps.
Total steps: N = 40 + 40 * v_e.

Case 2:
Walking speed = 2 steps/sec.
Number of steps walked = 60.
Time taken t_2 = 60 / 2 = 30 seconds.
In 30 seconds, the escalator moves 30 * v_e steps.
Total steps: N = 60 + 30 * v_e.

Equating the two expressions for N:
40 + 40 * v_e = 60 + 30 * v_e
10 * v_e = 20 => v_e = 2 steps/sec.

Substitute v_e back into N:
N = 40 + 40(2) = 40 + 80 = 120 steps.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_GA_04',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Spatial Aptitude''',
    questionText: '''A square sheet of paper is folded in half from left to right, and then folded in half from top to bottom, forming a smaller square of one-quarter the original area.
A circular hole is punched through the center of this folded quarter-square.
When the sheet of paper is completely unfolded, how many circular holes are visible on the paper?''',
    options: ['''4''', '''1''', '''2''', '''8'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The paper was folded twice, creating 2 * 2 = 4 layers of paper.
Since the hole is punched through the center of the folded quadrant (which corresponds to non-boundary interior points in each quadrant upon unfolding), the punch penetrates all 4 layers.
Unfolding the paper reveals exactly 1 hole in each of the 4 quadrants, for a total of 4 holes.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_GA_05',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Analytical Aptitude''',
    questionText: '''Find the missing number in the following 3 x 3 grid:
|  4 |  9 |  2 |
|  3 |  5 |  7 |
|  8 |  1 |  ? |''',
    options: ['''6''', '''5''', '''7''', '''4'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''This is the canonical 3 x 3 Lo Shu Magic Square where the sum of numbers along every row, column, and main diagonal equals 15:
Row 1: 4 + 9 + 2 = 15.
Row 2: 3 + 5 + 7 = 15.
Row 3: 8 + 1 + ? = 15 => ? = 15 - 9 = 6.
Check columns:
Column 1: 4 + 3 + 8 = 15.
Column 2: 9 + 5 + 1 = 15.
Column 3: 2 + 7 + 6 = 15.
Diagonals: 4 + 5 + 6 = 15 and 2 + 5 + 8 = 15.
The missing number is 6. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_GA_06',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude''',
    questionText: '''What is the remainder when 28! is divided by the prime number 29?''',
    options: ['''28''', '''1''', '''0''', '''27'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''By Wilson's Theorem:
If p is a prime number, then:
(p - 1)! = -1 = p - 1 (mod p).

Here p = 29, which is prime.
Therefore:
(29 - 1)! = 28! = -1 = 28 (mod 29).
The remainder is 28. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_GA_07',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude''',
    questionText: '''The difference between the compound interest (compounded annually) and the simple interest on a principal sum of money P at an annual interest rate of R = 10% for 3 years is Rs. 930.
What is the principal sum of money P?''',
    options: ['''Rs. 30,000''', '''Rs. 25,000''', '''Rs. 32,000''', '''Rs. 28,000'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The formula for the difference D_3 between compound interest and simple interest for 3 years is:
D_3 = P * (R / 100)^2 * ( (300 + R) / 100 ).

Given:
D_3 = 930, R = 10.
Substitute R = 10:
(R / 100)^2 = (10 / 100)^2 = (1 / 10)^2 = 1 / 100.
(300 + R) / 100 = 310 / 100 = 31 / 10.

Therefore:
930 = P * (1 / 100) * (31 / 10)
930 = P * (31 / 1000).

Solving for P:
P = 930 * (1000 / 31)
Since 930 / 31 = 30:
P = 30 * 1000 = Rs. 30,000.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_GA_08',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Data Interpretation''',
    questionText: '''In a software performance profiling log, 5 categories of database queries contribute to total latency:
- Cat A: 40% of latency
- Cat B: 25% of latency
- Cat C: 15% of latency
- Cat D: 12% of latency
- Cat E: 8% of latency.
If an optimization initiative reduces the latency of Cat A by 50% and Cat B by 40%, leaving the other categories unchanged:
What is the overall percentage reduction in total latency?''',
    options: ['''30%''', '''35%''', '''25%''', '''28%'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Let the initial total latency be 100 units.
Latency contributed by Cat A = 40 units.
Latency contributed by Cat B = 25 units.

Reductions achieved:
Reduction in Cat A = 50% of 40 = 20 units.
Reduction in Cat B = 40% of 25 = 10 units.

Total latency reduction = 20 + 10 = 30 units.
Percentage reduction = (30 / 100) * 100% = 30%.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_GA_09',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Combinatorics''',
    questionText: '''How many non-negative integer solutions (x_1, x_2, x_3, x_4) satisfy the equation:
x_1 + x_2 + x_3 + x_4 = 12
subject to the condition that x_1 >= 2, x_2 >= 1, x_3 >= 0, and x_4 >= 0?''',
    options: ['''220''', '''455''', '''165''', '''286'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Transform variables to standard non-negative form:
Let y_1 = x_1 - 2 >= 0  => x_1 = y_1 + 2.
Let y_2 = x_2 - 1 >= 0  => x_2 = y_2 + 1.
Let y_3 = x_3 >= 0.
Let y_4 = x_4 >= 0.

Substitute into the equation:
(y_1 + 2) + (y_2 + 1) + y_3 + y_4 = 12
y_1 + y_2 + y_3 + y_4 + 3 = 12
y_1 + y_2 + y_3 + y_4 = 9.

By the Stars and Bars theorem, the number of non-negative integer solutions to y_1 + ... + y_k = n is:
binom(n + k - 1, k - 1).

Here n = 9 and k = 4:
Number of solutions = binom(9 + 4 - 1, 4 - 1) = binom(12, 3)
binom(12, 3) = (12 * 11 * 10) / (3 * 2 * 1) = 1320 / 6 = 220.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_GA_10',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Geometry''',
    questionText: '''In a triangle ABC, side AB = 7 cm, side AC = 9 cm, and side BC = 8 cm.
AD is the median drawn from vertex A to side BC (so D is the midpoint of BC).
What is the exact length of the median AD?''',
    options: ['''7 cm''', '''6 cm''', '''8 cm''', '''sqrt(48) cm'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''By Apollonius' Theorem for triangle ABC with median AD to side BC:
AB^2 + AC^2 = 2 * (AD^2 + BD^2).

Given:
AB = 7, AC = 9, BC = 8.
Since D is the midpoint of BC, BD = BC / 2 = 8 / 2 = 4.

Substitute values:
7^2 + 9^2 = 2 * (AD^2 + 4^2)
49 + 81 = 2 * (AD^2 + 16)
130 = 2 * (AD^2 + 16)
AD^2 + 16 = 65
AD^2 = 65 - 16 = 49.
AD = sqrt(49) = 7 cm.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_11',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Schur Decomposition Theorem''',
    questionText: '''The Schur Decomposition Theorem states that for every square complex matrix A in C^{n x n}, there exists a unitary matrix Q such that Q* A Q = T, where T is an upper-triangular matrix.
Which of the following is an immediate consequence of this theorem?''',
    options: ['''The diagonal entries of T are the eigenvalues of A.''', '''T is always a diagonal matrix.''', '''All eigenvalues of A must be purely real.''', '''Q is always a symmetric real matrix.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Because Q is unitary (Q* Q = I), the transformation Q* A Q is a similarity transformation, preserving the spectrum of A.
The eigenvalues of any triangular matrix are precisely its main diagonal entries.
Hence, the diagonal entries of the upper-triangular matrix T are exactly the eigenvalues of A.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_12',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Trace of Complement Projector''',
    questionText: '''Let P in R^{6 x 6} be an orthogonal projection matrix onto a 2-dimensional subspace W of R^6.
What is the trace of the orthogonal complement projection matrix, tr(I_6 - P)? (Answer as an integer).''',
    options: [],
    correctAnswer: '''4''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''The trace is linear:
tr(I_6 - P) = tr(I_6) - tr(P).

For the 6 x 6 identity matrix, tr(I_6) = 6.
For any projection matrix, the trace equals its rank (the dimension of the subspace onto which it projects):
tr(P) = rank(P) = dim(W) = 2.

Therefore:
tr(I_6 - P) = 6 - 2 = 4.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_13',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''SVD Properties and Invariants''',
    questionText: '''Let A in R^{m x n} have Singular Value Decomposition A = U Sigma V^T with singular values sigma_1 >= sigma_2 >= ... >= sigma_r > 0.
Which of the following statements is/are ALWAYS TRUE?''',
    options: ['''The non-zero singular values sigma_i are uniquely determined by matrix A.''', '''rank(A) = r (the number of strictly positive singular values).''', '''||A||_2 = sigma_1 (the spectral norm equals the largest singular value).''', '''The matrices U and V are always uniquely determined for any matrix A.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis of statements:
A. The singular values are the unique positive square roots of the eigenvalues of A^T A. (TRUE)
B. The rank of A equals the number of non-zero singular values. (TRUE)
C. ||A||_2 = sup_{||x||=1} ||A x|| = sigma_1. (TRUE)
D. The singular vectors U and V are not uniquely determined: signs of columns can be flipped simultaneously (u_i -> -u_i, v_i -> -v_i), and repeated singular values permit arbitrary rotations within eigenspaces. (FALSE)

Correct options: A, B, C.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_14',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Block Triangular Matrix Determinant''',
    questionText: '''Consider the 4 x 4 block upper-triangular matrix:
M = [[ 2,  3,  7, -4],
     [ 1,  4,  5,  2],
     [ 0,  0,  3,  1],
     [ 0,  0,  2,  5]].
What is the determinant det(M)? (Answer as an integer).''',
    options: [],
    correctAnswer: '''65''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''For a block upper-triangular matrix M = [[A, B], [0, D]]:
det(M) = det(A) * det(D).

Compute det(A):
A = [[2, 3], [1, 4]].
det(A) = (2)(4) - (3)(1) = 8 - 3 = 5.

Compute det(D):
D = [[3, 1], [2, 5]].
det(D) = (3)(5) - (1)(2) = 15 - 2 = 13.

Therefore:
det(M) = det(A) * det(D) = 5 * 13 = 65.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_15',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Gradient Vector at Local Extremum''',
    questionText: '''Let f: R^n -> R be a continuously differentiable function.
If x* in R^n is an unconstrained local minimum of f, what is the Euclidean norm of the gradient vector, ||grad f(x*)||_2? (Answer as an integer).''',
    options: [],
    correctAnswer: '''0''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''By Fermat's First-Order Necessary Condition for unconstrained optimization of differentiable functions:
At any interior local extremum (minimum or maximum) x*, the gradient vector must vanish identically:
grad f(x*) = [0, 0, ..., 0]^T.

The Euclidean norm of the zero vector is:
||grad f(x*)||_2 = 0.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_16',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Clairauts Theorem on Mixed Partials''',
    questionText: '''Clairaut's Theorem (Schwarz's Theorem) guarantees that the mixed second-order partial derivatives satisfy:
d^2 f / (dx dy) = d^2 f / (dy dx)
provided that:''',
    options: ['''Both mixed partial derivatives exist and are continuous on an open disk containing the point.''', '''f(x, y) is a polynomial function.''', '''The Hessian matrix is positive definite everywhere.''', '''f(x, y) = f(y, x) is symmetric.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Clairaut's Theorem states that if the partial derivatives f_{xy} and f_{yx} exist and are continuous on an open domain, then they are identically equal: f_{xy} = f_{yx}.
Option A is the precise mathematical condition.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_17',
    year: 2026,
    subject: '''Optimization''',
    topic: '''Lipschitz Gradient Descent Step Size Upper Bound''',
    questionText: '''Let f: R^n -> R be convex and L-smooth, meaning its gradient is Lipschitz continuous with constant L = 5:
||grad f(x) - grad f(y)||_2 <= L ||x - y||_2.
To guarantee that standard Gradient Descent x_{k+1} = x_k - alpha grad f(x_k) monotonically decreases the objective function, what is the theoretical upper bound on the constant step size alpha (i.e., alpha < c)? (Answer as a decimal).''',
    options: [],
    correctAnswer: '''0.4''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''By the Descent Lemma for L-smooth functions:
f(x - alpha grad f(x)) <= f(x) - alpha * (1 - (L * alpha) / 2) * ||grad f(x)||^2.
For the objective to strictly decrease whenever grad f(x) != 0:
1 - (L * alpha) / 2 > 0  =>  alpha < 2 / L.

Given L = 5:
alpha < 2 / 5 = 0.40 (or 0.4).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_18',
    year: 2026,
    subject: '''Optimization''',
    topic: '''Convex Set Preserving Operations''',
    questionText: '''Which of the following operations on convex sets ALWAYS yields a convex set?''',
    options: ['''The intersection of an arbitrary collection of convex sets: bigcap_{i in I} S_i.''', '''The image of a convex set under an affine mapping: f(S) = {A x + b : x in S}.''', '''The Minkowski sum of two convex sets: S_1 + S_2 = {x_1 + x_2 : x_1 in S_1, x_2 in S_2}.''', '''The union of two disjoint convex sets: S_1 cup S_2.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis of operations:
A. The intersection of any family of convex sets is always convex. (TRUE)
B. Affine maps preserve line segments and convex combinations, so affine images of convex sets are convex. (TRUE)
C. The Minkowski sum of convex sets is convex. (TRUE)
D. The union of two disjoint convex sets is almost never convex (e.g. [0, 1] cup [2, 3] is not convex since the segment connecting 1 and 2 is not in the union). (FALSE)

Correct options: A, B, C.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_19',
    year: 2026,
    subject: '''Probability''',
    topic: '''Independent Events Union Probability''',
    questionText: '''Let A and B be two independent events such that P(A) = 0.40 and P(B) = 0.50.
What is the probability of their union, P(A union B)? (Answer as a decimal).''',
    options: [],
    correctAnswer: '''0.7''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''By the Addition Rule of Probability:
P(A union B) = P(A) + P(B) - P(A cap B).

Since events A and B are independent:
P(A cap B) = P(A) * P(B) = 0.40 * 0.50 = 0.20.

Therefore:
P(A union B) = 0.40 + 0.50 - 0.20 = 0.70 (or 0.7).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_20',
    year: 2026,
    subject: '''Probability''',
    topic: '''Jensens Inequality for Strictly Convex Function''',
    questionText: '''Let X be a non-degenerate random variable with finite variance, and let g(t) = t^2.
According to Jensen's Inequality, which relation strictly holds?''',
    options: ['''E[X^2] > (E[X])^2''', '''E[X^2] < (E[X])^2''', '''E[X^2] = (E[X])^2''', '''E[X^2] = 0'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Since g(t) = t^2 is strictly convex, Jensen's inequality states:
E[g(X)] >= g(E[X])  =>  E[X^2] >= (E[X])^2.
Furthermore, because X is non-degenerate (Var(X) > 0):
Var(X) = E[X^2] - (E[X])^2 > 0  =>  E[X^2] > (E[X])^2.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_21',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Sample Variance Degrees of Freedom''',
    questionText: '''For an i.i.d. sample of size n = 16 drawn from a Normal distribution N(mu, sigma^2), where mu is unknown:
The sample variance is defined as S^2 = (1 / (n - 1)) * sum_{i=1}^n (X_i - X_bar)^2.
What is the number of degrees of freedom associated with the chi-squared distribution of (n - 1) S^2 / sigma^2? (Answer as an integer).''',
    options: [],
    correctAnswer: '''15''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''By Cochran's Theorem for normal samples:
(n - 1) S^2 / sigma^2 ~ chi^2(n - 1).
One degree of freedom is lost due to estimating the population mean mu with the sample mean X_bar.
For n = 16:
Degrees of freedom = n - 1 = 16 - 1 = 15.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_22',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Type I Error and Significance Level''',
    questionText: '''In statistical hypothesis testing, the significance level alpha represents:''',
    options: ['''The maximum acceptable probability of committing a Type I error (rejecting H_0 when H_0 is true).''', '''The probability of committing a Type II error (failing to reject H_0 when H_0 is false).''', '''The power of the statistical test.''', '''The probability that the null hypothesis is true given the observed data.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The significance level alpha is the predetermined upper bound on the probability of committing a Type I error:
alpha = P(Reject H_0 | H_0 is true).
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_23',
    year: 2026,
    subject: '''Probability''',
    topic: '''Variance of Bernoulli Random Variable''',
    questionText: '''A Bernoulli random variable X has success probability p = 0.30.
What is the variance Var(X)? (Answer as a decimal).''',
    options: [],
    correctAnswer: '''0.21''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''For a Bernoulli(p) random variable:
Var(X) = p * (1 - p).
Given p = 0.30:
1 - p = 0.70.
Var(X) = 0.30 * 0.70 = 0.21.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_24',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Neyman Factorization Theorem Sufficient Statistic''',
    questionText: '''By the Fisher-Neyman Factorization Theorem, a statistic T(X) is sufficient for parameter theta if and only if the joint likelihood f(x; theta) can be factored as:''',
    options: ['''g(T(x), theta) * h(x), where h(x) does not depend on theta, and g depends on x only through T(x).''', '''g(x) + h(theta)''', '''g(T(x)) / h(theta)''', '''g(theta) * h(T(x))'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The Fisher-Neyman Factorization Theorem states that T(X) is a sufficient statistic for theta iff:
f(x; theta) = g(T(x), theta) * h(x).
Option A is the formal statement.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_25',
    year: 2026,
    subject: '''Data Structures''',
    topic: '''Trie Prefix Search Complexity''',
    questionText: '''In a Trie (Prefix Tree) storing a dictionary of N strings over an alphabet of fixed size Sigma:
What is the worst-case time complexity of searching for a query string of length L?''',
    options: ['''Theta(L)''', '''Theta(N * L)''', '''Theta(log N)''', '''Theta(L * log N)'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''In a trie, each character of the query string corresponds to advancing one step down the tree.
Since the tree depth traversed is bounded by the length of the string L, searching takes Theta(L) time, completely independent of the number of words N stored in the dictionary.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_26',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Bellman Ford Relaxation Passes Limit''',
    questionText: '''On a directed graph G = (V, E) containing |V| = 8 vertices and no negative weight cycles:
What is the maximum number of edge relaxation passes over the entire edge set E required by the Bellman-Ford algorithm to guarantee shortest path distances to all reachable vertices? (Answer as an integer).''',
    options: [],
    correctAnswer: '''7''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''In any graph without negative cycles, every simple shortest path contains at most |V| - 1 edges.
Since each pass of Bellman-Ford correctly resolves shortest paths that use one additional edge, at most |V| - 1 passes are required.
For |V| = 8:
Passes = 8 - 1 = 7.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_27',
    year: 2026,
    subject: '''Programming in Python''',
    topic: '''Defaultdict Missing Key Factory Invocation''',
    questionText: '''Consider the following Python 3 code:
from collections import defaultdict
d = defaultdict(list)
d['k1'].append(10)
d['k1'].append(20)
print(len(d['k2']) + len(d['k1']))

What integer value is printed? (Answer as an integer).''',
    options: [],
    correctAnswer: '''2''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Trace code:
1. d['k1'].append(10) creates key 'k1' with an empty list [], then appends 10.
2. d['k1'].append(20) appends 20. So d['k1'] = [10, 20], len = 2.
3. Accessing d['k2'] triggers the default_factory (list()), which inserts 'k2': [] into the dictionary and returns [].
len(d['k2']) = len([]) = 0.
4. Total sum = len(d['k2']) + len(d['k1']) = 0 + 2 = 2.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_28',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Dynamic Programming Core Invariants''',
    questionText: '''Which two fundamental characteristics must a problem exhibit for Dynamic Programming to be an effective algorithmic solution technique?''',
    options: ['''Optimal Substructure and Overlapping Subproblems''', '''Greedy Choice Property and Independence''', '''Divide and Conquer and Disjoint Subproblems''', '''Exponential Growth and Random Walks'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The two essential prerequisites for Dynamic Programming are:
1. Optimal Substructure: An optimal solution to the problem contains optimal solutions to its subproblems.
2. Overlapping Subproblems: A recursive algorithm revisits the same subproblems repeatedly rather than generating new subproblems.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_29',
    year: 2026,
    subject: '''DBMS''',
    topic: '''Precedence Graph Cycle and Conflict Serializability''',
    questionText: '''In database transaction management, a concurrent schedule S is Conflict Serializable if and only if:''',
    options: ['''Its precedence (serialization) graph contains no directed cycles.''', '''All transactions commit at the exact same logical timestamp.''', '''Every transaction executes under exclusive locks only.''', '''It produces an empty deadlock graph.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''By the Conflict Serializability Theorem:
A schedule S is conflict serializable iff the serialization (precedence) graph G(S) is acyclic (contains no directed cycles). A topological sort of the acyclic graph yields an equivalent serial schedule.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_30',
    year: 2026,
    subject: '''DBMS''',
    topic: '''Candidate Keys Count for Symmetric FDs''',
    questionText: '''Consider a relation schema R(A, B, C) with functional dependencies:
A -> B
B -> C
C -> A.
How many distinct candidate keys does relation R possess? (Answer as an integer).''',
    options: [],
    correctAnswer: '''3''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Compute attribute closures:
- A^+: A -> B, and B -> C, so A^+ = {A, B, C}. Thus A is a candidate key.
- B^+: B -> C, and C -> A, so B^+ = {A, B, C}. Thus B is a candidate key.
- C^+: C -> A, and A -> B, so C^+ = {A, B, C}. Thus C is a candidate key.
No proper subset of a single attribute can be a key.
Thus there are exactly 3 candidate keys: {A}, {B}, and {C}.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_31',
    year: 2026,
    subject: '''DBMS''',
    topic: '''Write Ahead Logging WAL Fundamental Protocol''',
    questionText: '''Which of the following describes the core rule enforced by the Write-Ahead Logging (WAL) protocol in database systems?''',
    options: ['''The log record for an update must be written to stable storage on disk BEFORE the corresponding dirty data page is written to disk.''', '''Data pages must be written to disk immediately whenever an update occurs.''', '''Log records are written to disk only after the entire database shuts down.''', '''Transactions can only read uncommitted data.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The fundamental WAL rule dictates:
1. Before a dirty page in memory is flushed to disk, all log records describing updates to that page must already be safely flushed to stable disk storage.
2. A transaction cannot commit until all of its log records have been flushed to disk.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_32',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Decision Tree Splitting Metrics''',
    questionText: '''In decision tree induction algorithms (such as CART and ID3/C4.5), which metrics are commonly used to measure node impurity?''',
    options: ['''Gini Impurity''', '''Information Gain (based on Shannon Entropy)''', '''Misclassification Error''', '''Mahalanobis Distance'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis of splitting criteria:
A. Gini Impurity = 1 - sum p_i^2 is the standard metric in CART. (TRUE)
B. Information Gain / Entropy = -sum p_i log_2 p_i is used in ID3 and C4.5. (TRUE)
C. Misclassification Error = 1 - max(p_i) is a valid impurity metric used in tree pruning. (TRUE)
D. Mahalanobis distance is a metric distance between feature vectors, not a node impurity criterion. (FALSE)

Correct options: A, B, C.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_33',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Logistic Sigmoid Output from Logit''',
    questionText: '''In a logistic regression binary classification model, the pre-activation logit is:
z = w^T x + b = ln(3).
What is the predicted probability p = sigma(z) = 1 / (1 + e^(-z))? (Answer as a decimal).''',
    options: [],
    correctAnswer: '''0.75''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Given z = ln(3):
e^(-z) = e^(-ln(3)) = 1 / e^(ln(3)) = 1 / 3.

Compute sigmoid:
sigma(z) = 1 / (1 + e^(-z)) = 1 / (1 + 1/3) = 1 / (4/3) = 3 / 4 = 0.75.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_34',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''Uniform Cost Search Equivalence to BFS''',
    questionText: '''Uniform Cost Search (Dijkstra's algorithm on uniform edge weights) behaves identically to Breadth-First Search (BFS) if and only if:''',
    options: ['''All step (edge) costs in the graph are identical and strictly positive constants.''', '''The heuristic function h(n) is identically zero.''', '''The state space is a complete binary tree.''', '''The graph contains no cycles.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Uniform Cost Search expands nodes in order of cumulative path cost g(n).
If every edge has an identical positive cost c > 0, then a path of k edges has cost k * c.
Expanding in increasing order of g(n) is exactly equivalent to expanding in increasing order of edge depth k, which is the definition of Breadth-First Search.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_35',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''Heuristic Admissibility and Optimality''',
    questionText: '''Which of the following statements regarding heuristics in informed search algorithms is/are TRUE?''',
    options: ['''In A* Tree Search, admissibility (h(n) <= h*(n)) is sufficient to guarantee finding an optimal solution.''', '''In A* Graph Search, consistency (monotonicity) of h(n) guarantees finding an optimal solution without re-opening closed nodes.''', '''If h_1 and h_2 are admissible heuristics, then h(n) = max(h_1(n), h_2(n)) is also an admissible heuristic.''', '''Every admissible heuristic is guaranteed to be consistent.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis of statements:
A. For Tree Search, admissibility alone guarantees optimality because nodes are never prematurely discarded by a closed set. (TRUE)
B. For Graph Search, consistency guarantees that when a node is selected from OPEN, its g-value is minimal, avoiding re-opening closed nodes. (TRUE)
C. Since h_1(n) <= h*(n) and h_2(n) <= h*(n), max(h_1(n), h_2(n)) <= h*(n), so it remains admissible and dominates both. (TRUE)
D. Consistency implies admissibility, but the converse is false: there exist admissible heuristics that violate consistency in graph search. (FALSE)

Correct options: A, B, C.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_36',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Sylvester Law of Inertia Signature''',
    questionText: '''Consider the real symmetric matrix representing a quadratic form in R^3:
A = [[ 2, -1,  0],
     [-1,  2, -1],
     [ 0, -1,  2]].
By Sylvester's Criterion, examine the leading principal minors:
Delta_1 = 2
Delta_2 = (2)(2) - (-1)^2 = 4 - 1 = 3
Delta_3 = det(A) = 2(3) - (-1)(-2) = 6 - 2 = 4.
What is the signature of A, defined as (number of positive eigenvalues) - (number of negative eigenvalues)? (Answer as an integer).''',
    options: [],
    correctAnswer: '''3''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''By Sylvester's Criterion:
A real symmetric matrix is strictly positive definite iff all of its leading principal minors are strictly positive:
Delta_1 = 2 > 0
Delta_2 = 3 > 0
Delta_3 = 4 > 0.

Since all three leading principal minors are strictly positive, matrix A has 3 positive eigenvalues and 0 negative eigenvalues.
The signature is:
(number of positive eigenvalues) - (number of negative eigenvalues) = 3 - 0 = 3.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_37',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Neumann Resolvent Series Inverse''',
    questionText: '''Let A be a 2 x 2 matrix with spectral radius rho(A) < 1, such that:
(I - A)^(-1) = sum_{k=0}^inf A^k.
Suppose A = [[0.2, 0.0],
             [0.5, 0.2]].
What is the entry in row 2, column 1 of the inverse matrix (I - A)^(-1)? (Round off to two decimal places).''',
    options: [],
    correctAnswer: '''0.78''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Compute I - A:
I - A = [[1 - 0.2, 0.0    ],
         [-0.5,    1 - 0.2]]
= [[ 0.8,  0.0],
   [-0.5,  0.8]].

Compute determinant:
det(I - A) = (0.8)(0.8) - (0)(-0.5) = 0.64.

Invert I - A:
(I - A)^(-1) = (1 / 0.64) * [[0.8, 0.0],
                             [0.5, 0.8]]
= [[ 0.8 / 0.64, 0.0       ],
   [ 0.5 / 0.64, 0.8 / 0.64]]
= [[ 1.25,       0.0       ],
   [ 0.78125,    1.25      ]].

The entry in row 2, column 1 is 0.5 / 0.64 = 50 / 64 = 25 / 32 = 0.78125.
Rounded to two decimal places: 0.78.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_38',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Polar Decomposition of Square Matrices''',
    questionText: '''Every square real matrix A in R^{n x n} can be factored as A = U P, where U is an orthogonal matrix and P is a symmetric positive semidefinite matrix.
Which of the following statements is/are TRUE?''',
    options: ['''P is uniquely determined by P = sqrt(A^T A).''', '''If A is invertible, the orthogonal factor U is uniquely determined as U = A P^(-1).''', '''The eigenvalues of P are the singular values of A.''', '''P is always an orthogonal matrix.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis of Polar Decomposition:
A. P^2 = P^T P = (U^T A)^T (U^T A) = A^T U U^T A = A^T A. Since P is symmetric positive semidefinite, P is the unique positive square root sqrt(A^T A). (TRUE)
B. When A is invertible, P is strictly positive definite and invertible, uniquely fixing U = A P^(-1). (TRUE)
C. By definition, singular values of A are square roots of eigenvalues of A^T A, which are precisely the eigenvalues of P = sqrt(A^T A). (TRUE)
D. P is symmetric positive semidefinite, not orthogonal in general. (FALSE)

Correct options: A, B, C.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_39',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Orthogonal Projection Matrix Entry onto Line''',
    questionText: '''Let v = [1, 2, 2]^T in R^3.
The orthogonal projection matrix onto the 1D subspace spanned by v is:
P = (v v^T) / (v^T v).
What is the entry in row 2, column 2 of matrix P, P_{2,2}? (Answer as a decimal rounded to two decimal places).''',
    options: [],
    correctAnswer: '''0.44''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Compute v^T v:
v^T v = 1^2 + 2^2 + 2^2 = 1 + 4 + 4 = 9.

Compute outer product v v^T:
Entry (2, 2) is v_2 * v_2 = 2 * 2 = 4.

Therefore, entry P_{2,2} is:
P_{2,2} = 4 / 9 = 0.4444...
Rounded to two decimal places: 0.44.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_40',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Greens Theorem Area via Line Integral''',
    questionText: '''By Green's Theorem, the area of a plane region D bounded by a positively oriented simple closed curve C is:
Area(D) = (1/2) * oint_C (x dy - y dx).
Consider the ellipse parametrized by:
x(t) = 3 cos(t),  y(t) = 4 sin(t),  for 0 <= t <= 2*pi.
What is the value of Area(D) / pi? (Answer as an integer).''',
    options: [],
    correctAnswer: '''12''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Compute differentials:
dx = -3 sin(t) dt
dy = 4 cos(t) dt.

Evaluate integrand:
x dy - y dx = (3 cos t)(4 cos t dt) - (4 sin t)(-3 sin t dt)
= 12 cos^2(t) dt + 12 sin^2(t) dt
= 12 (cos^2 t + sin^2 t) dt = 12 dt.

Area formula:
Area(D) = (1/2) * int_0^{2*pi} 12 dt = (1/2) * 12 * (2*pi) = 12 * pi.

Area(D) / pi = 12.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_41',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Lagrange Multipliers with Two Simultaneous Constraints''',
    questionText: '''To optimize f(x, y, z) subject to two equality constraints g_1(x, y, z) = 0 and g_2(x, y, z) = 0:
At a regular optimal point, the gradient grad f must satisfy:''',
    options: ['''grad f is a linear combination of grad g_1 and grad g_2: grad f = lambda_1 grad g_1 + lambda_2 grad g_2.''', '''grad f is orthogonal to both grad g_1 and grad g_2.''', '''grad f = 0 identically.''', '''grad g_1 . grad g_2 = 0 must hold.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''By the Lagrange Multiplier Theorem for multiple constraints:
The feasible tangent space is the intersection of the tangent spaces of the constraints, orthogonal to span{grad g_1, grad g_2}.
For the directional derivative of f to vanish along all feasible directions, grad f must lie in span{grad g_1, grad g_2}:
grad f = lambda_1 grad g_1 + lambda_2 grad g_2.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_42',
    year: 2026,
    subject: '''Optimization''',
    topic: '''Exact Line Search Step on Quadratic Function''',
    questionText: '''Consider the quadratic objective function:
f(x_1, x_2) = (3/2) x_1^2 + (1/2) x_2^2.
Starting from x_0 = [2, 6]^T, a gradient descent step with exact line search is performed:
x_1 = x_0 - alpha* grad f(x_0),
where alpha* = argmin_{alpha >= 0} f(x_0 - alpha grad f(x_0)).
What is the optimal step size alpha*? (Answer as a decimal).''',
    options: [],
    correctAnswer: '''0.5''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Hessian matrix A = [[3, 0], [0, 1]].
Compute gradient at x_0 = [2, 6]^T:
df/dx_1 = 3 x_1 = 3(2) = 6.
df/dx_2 = 1 x_2 = 6.
d = grad f(x_0) = [6, 6]^T.

Compute d^T d:
d^T d = 6^2 + 6^2 = 36 + 36 = 72.

Compute d^T A d:
A d = [[3, 0], [0, 1]] * [6, 6]^T = [18, 6]^T.
d^T A d = 6(18) + 6(6) = 108 + 36 = 144.

For a quadratic objective, the exact line search step size is:
alpha* = (d^T d) / (d^T A d) = 72 / 144 = 0.50 (or 0.5).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_43',
    year: 2026,
    subject: '''Optimization''',
    topic: '''Fenchel Rockafellar Strong Duality''',
    questionText: '''Which of the following conditions guarantees Strong Duality (zero duality gap, p* = d*) in convex optimization?''',
    options: ['''Slater's condition: The primal problem is convex and there exists a strictly feasible point x in the relative interior of the constraint set.''', '''The objective function and inequality constraints are affine, and the feasible set is non-empty.''', '''The objective function is strictly convex and unconstrained.''', '''Slater's condition guarantees strong duality for non-convex integer programming.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis of strong duality conditions:
A. Slater's Condition is the standard constraint qualification guaranteeing strong duality for convex programs. (TRUE)
B. For linear/affine constraints with convex objective, strict feasibility is not needed; simple feasibility guarantees strong duality. (TRUE)
C. Unconstrained convex problems trivially satisfy strong duality (dual problem is trivial and gap is 0). (TRUE)
D. Strong duality does not hold in general for integer programming or non-convex problems. (FALSE)

Correct options: A, B, C.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_44',
    year: 2026,
    subject: '''Probability''',
    topic: '''Bivariate Normal Quadrant Probability''',
    questionText: '''Let (X, Y) be standard bivariate normal random variables with means 0, unit variances, and correlation coefficient rho = 0.
What is the joint probability P(X > 0 and Y > 0)? (Answer as a decimal).''',
    options: [],
    correctAnswer: '''0.25''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''By Sheppard's Theorem for bivariate normal variables:
P(X > 0, Y > 0) = 1/4 + (1 / (2*pi)) * arcsin(rho).
When rho = 0 (independent standard normal variables):
arcsin(0) = 0.
P(X > 0, Y > 0) = 1/4 + 0 = 0.25.
(Alternatively, by independence: P(X > 0) * P(Y > 0) = 0.5 * 0.5 = 0.25).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_45',
    year: 2026,
    subject: '''Probability''',
    topic: '''Gamblers Ruin Fair Random Walk''',
    questionText: '''A gambler starts with an initial fortune of Rs. 3 and plays a fair game where each round wins Rs. 1 with probability p = 0.50 or loses Rs. 1 with probability 1 - p = 0.50.
The game terminates when the gambler reaches Rs. 10 (goal) or Rs. 0 (ruin).
What is the probability of the gambler reaching Rs. 10 before ruin? (Answer as a decimal).''',
    options: [],
    correctAnswer: '''0.3''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''For a symmetric (fair) random walk with absorbing barriers at 0 and N, starting at position k:
The probability of absorption at N (reaching the goal) is linear:
P(reach N | start at k) = k / N.

Here k = 3 and N = 10:
Probability = 3 / 10 = 0.30 (or 0.3).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_46',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Poisson MVUE Variance''',
    questionText: '''Let X_1, X_2, ..., X_n be an i.i.d. sample from a Poisson(lambda) distribution.
The sample mean X_bar is the unique Uniformly Minimum Variance Unbiased Estimator (UMVUE) of lambda.
If n = 5 and lambda = 10:
What is the variance of this UMVUE, Var(X_bar)? (Answer as an integer).''',
    options: [],
    correctAnswer: '''2''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''For a Poisson(lambda) distribution, Var(X_i) = lambda.
The variance of the sample mean is:
Var(X_bar) = Var(X_i) / n = lambda / n.

Given lambda = 10 and n = 5:
Var(X_bar) = 10 / 5 = 2.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_47',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Bartlett vs Levene Test for Equality of Variances''',
    questionText: '''In testing the null hypothesis of equal variances across k independent groups:
Why is Levene's Test often preferred over Bartlett's Test in practical data science applications?''',
    options: ['''Levene's test is robust to departures from normality, whereas Bartlett's test is notoriously sensitive to non-normality.''', '''Bartlett's test can only be applied when k = 2.''', '''Levene's test requires calculating matrix inverses.''', '''Bartlett's test has zero statistical power.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Bartlett's test assumes strict normality of the underlying distributions; if the data departs even slightly from normality, Bartlett's test can falsely reject the null hypothesis of equal variances.
Levene's test measures deviations from the group median or trimmed mean, making it substantially more robust against non-normal distributions.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_48',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Likelihood Ratio Test Statistic Value for Normal Variance''',
    questionText: '''Let X_1, ..., X_n be i.i.d. N(0, sigma^2).
The MLE of sigma^2 is sigma_hat^2 = (1/n) sum_{i=1}^n X_i^2.
To test H_0: sigma^2 = sigma_0^2 vs H_1: sigma^2 != sigma_0^2, the deviance statistic is:
-2 ln(Lambda) = n * [ (sigma_hat^2 / sigma_0^2) - 1 - ln(sigma_hat^2 / sigma_0^2) ].
If n = 20 and sigma_hat^2 / sigma_0^2 = 1.0 (exact agreement with H_0):
What is the value of the deviance test statistic -2 ln(Lambda)? (Answer as an integer).''',
    options: [],
    correctAnswer: '''0''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Let r = sigma_hat^2 / sigma_0^2 = 1.0.
Substitute r = 1.0:
r - 1 - ln(r) = 1.0 - 1 - ln(1.0) = 0 - 0 = 0.
Therefore:
-2 ln(Lambda) = 20 * 0 = 0.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_49',
    year: 2026,
    subject: '''Probability''',
    topic: '''Negative Binomial Variance''',
    questionText: '''Let X be the number of failures before the r-th success in a sequence of independent Bernoulli trials with success probability p.
X follows a Negative Binomial distribution with PMF:
P(X = k) = binom(k + r - 1, k) p^r (1 - p)^k.
If r = 4 and p = 0.50:
What is the variance Var(X)? (Answer as an integer).''',
    options: [],
    correctAnswer: '''8''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''The variance of a Negative Binomial distribution (number of failures before r successes) is:
Var(X) = r * (1 - p) / p^2.

Given r = 4 and p = 0.50:
1 - p = 0.50
p^2 = 0.50^2 = 0.25.

Var(X) = 4 * 0.50 / 0.25 = 2.0 / 0.25 = 8.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_50',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Ridge vs Lasso Feature Selection Geometry''',
    questionText: '''Why does L1 regularization (Lasso) perform automatic feature selection (setting coefficients exactly to zero), whereas L2 regularization (Ridge) only shrinks coefficients toward zero without setting them exactly to zero?''',
    options: ['''The L1 norm constraint region is a diamond (polyhedron) with sharp corners on the coordinate axes where the elliptical contours of the loss function frequently intersect, whereas the L2 ball is smooth and rounded.''', '''Lasso optimization is unconstrained while Ridge is constrained.''', '''Ridge regression cannot be formulated in dual form.''', '''L1 regularization requires all features to be strictly binary.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The geometric explanation for sparsity in Lasso:
The L1 norm constraint ball {w : ||w||_1 <= t} is a rhombus/polyhedron with sharp vertices located along the coordinate axes where one or more w_i = 0.
The smooth elliptical contours of the RSS loss function are mathematically much more likely to make first contact with the constraint region at one of these sharp corners, forcing corresponding coefficients to exactly zero.
The L2 ball {w : ||w||_2^2 <= t} is smooth and has no corners, so contact points rarely lie precisely on the axes.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_51',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Matrix Chain Multiplication Minimum Cost''',
    questionText: '''Find the minimum number of scalar multiplications required to compute the product of three matrices A_1 A_2 A_3 with dimensions:
A_1 is 10 x 30
A_2 is 30 x 5
A_3 is 5 x 60.
(Answer as an integer).''',
    options: [],
    correctAnswer: '''4500''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Dimensions: p = [10, 30, 5, 60].
Two possible parenthesizations:
Parenthesization 1: (A_1 A_2) A_3
Cost to multiply A_1 (10 x 30) and A_2 (30 x 5) = 10 * 30 * 5 = 1500.
Resulting matrix is 10 x 5.
Cost to multiply (A_1 A_2) by A_3 (5 x 60) = 10 * 5 * 60 = 3000.
Total cost = 1500 + 3000 = 4500.

Parenthesization 2: A_1 (A_2 A_3)
Cost to multiply A_2 (30 x 5) and A_3 (5 x 60) = 30 * 5 * 60 = 9000.
Resulting matrix is 30 x 60.
Cost to multiply A_1 (10 x 30) by (A_2 A_3) = 10 * 30 * 60 = 18000.
Total cost = 9000 + 18000 = 27000.

The optimal parenthesization is (A_1 A_2) A_3 with minimum cost 4500.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_52',
    year: 2026,
    subject: '''Data Structures''',
    topic: '''Disjoint Set Union Rank Invariant''',
    questionText: '''In a Disjoint Set Union (Union-Find) data structure implementing union by rank (without path compression):
If a tree in the forest has rank r, what is the MINIMUM number of nodes that this tree must contain?''',
    options: ['''2^r''', '''r + 1''', '''r^2''', '''2 * r'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''By the structural induction property of union by rank:
A tree of rank 0 has 2^0 = 1 node.
To increase the rank of a tree from r to r + 1, it must be merged with another tree of equal rank r.
By induction:
Size(r + 1) >= Size(r) + Size(r) >= 2^r + 2^r = 2^(r + 1).
Thus, any tree of rank r must contain at least 2^r nodes.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_53',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''KMP Prefix Function Table Value''',
    questionText: '''In the Knuth-Morris-Pratt (KMP) string matching algorithm, the failure function pi[i] computes the length of the longest proper prefix of the pattern P[0..i] that is also a suffix of P[0..i].
For the pattern string P = "ABACABA":
What is the value of pi[6] (for the complete pattern string)? (Answer as an integer).''',
    options: [],
    correctAnswer: '''3''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Trace pattern P = "ABACABA" (indices 0 to 6):
i = 0: "A" -> pi[0] = 0.
i = 1: "AB" -> pi[1] = 0.
i = 2: "ABA" -> prefix "A" matches suffix "A" -> pi[2] = 1.
i = 3: "ABAC" -> pi[3] = 0.
i = 4: "ABACA" -> prefix "A" matches suffix "A" -> pi[4] = 1.
i = 5: "ABACAB" -> prefix "AB" matches suffix "AB" -> pi[5] = 2.
i = 6: "ABACABA" -> prefix "ABA" matches suffix "ABA" -> pi[6] = 3.

The length of the longest proper prefix that is also a suffix is 3 ("ABA").''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_54',
    year: 2026,
    subject: '''Programming in Python''',
    topic: '''Generator Coroutine Send Flow''',
    questionText: '''Consider the following Python 3 generator coroutine:
def accumulator():
    total = 0
    while True:
        val = yield total
        if val is None:
            break
        total += val

acc = accumulator()
s0 = next(acc)
s1 = acc.send(10)
s2 = acc.send(25)
print(s2)

What integer value is printed? (Answer as an integer).''',
    options: [],
    correctAnswer: '''35''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Trace execution:
1. acc = accumulator() creates the generator object.
2. s0 = next(acc) starts execution: total = 0, runs to 'yield total', yielding 0. (s0 = 0).
3. acc.send(10) resumes execution: 'yield total' receives 10, so val = 10.
total becomes 0 + 10 = 10. Loop repeats, yielding 10. (s1 = 10).
4. acc.send(25) resumes execution: val = 25.
total becomes 10 + 25 = 35. Loop repeats, yielding 35. (s2 = 35).
5. print(s2) prints 35.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_55',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Fractional Knapsack Greedy Optimal Value''',
    questionText: '''In a Fractional Knapsack problem, the knapsack has weight capacity W = 50 kg.
Three items are available:
Item 1: Weight = 10 kg, Value = Rs. 60
Item 2: Weight = 20 kg, Value = Rs. 100
Item 3: Weight = 30 kg, Value = Rs. 120.
Fractions of items can be taken. What is the maximum total value achievable? (Answer as an integer).''',
    options: [],
    correctAnswer: '''240''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Compute value-to-weight ratios:
Item 1: 60 / 10 = Rs. 6 / kg.
Item 2: 100 / 20 = Rs. 5 / kg.
Item 3: 120 / 30 = Rs. 4 / kg.

Greedy selection:
1. Take all of Item 1 (highest density):
Weight taken = 10 kg, Value = 60. Remaining capacity = 50 - 10 = 40 kg.

2. Take all of Item 2 (next highest density):
Weight taken = 20 kg, Value = 100. Remaining capacity = 40 - 20 = 20 kg.

3. Take fraction of Item 3 to fill remaining 20 kg:
Fraction = 20 / 30 = 2/3 of Item 3.
Value from Item 3 = (2/3) * 120 = 80. Remaining capacity = 0.

Total optimal value = 60 + 100 + 80 = Rs. 240.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_56',
    year: 2026,
    subject: '''DBMS''',
    topic: '''Block Nested Loop Join IO Cost Calculation''',
    questionText: '''Consider two database relations:
Outer relation R has B(R) = 100 pages.
Inner relation S has B(S) = 400 pages.
The buffer pool has B = 22 pages available for the join.
In a Block Nested Loop Join (BNLJ):
B - 2 = 20 pages are allocated to hold blocks of the outer relation R, 1 page is allocated for reading relation S, and 1 page for output.
Number of chunks of R = ceil(100 / 20) = 5 chunks.
What is the total number of page I/Os required to perform the join (reading R and S)? (Answer as an integer).''',
    options: [],
    correctAnswer: '''2100''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Cost formula for Block Nested Loop Join:
Total I/O = B(R) + ceil( B(R) / (B - 2) ) * B(S).

Given:
B(R) = 100 pages.
B(S) = 400 pages.
Buffer pages for R = B - 2 = 20 pages.
Number of passes over inner relation S = ceil(100 / 20) = 5 passes.

Total I/O:
Total = 100 + 5 * 400
= 100 + 2000 = 2100 page I/Os.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_57',
    year: 2026,
    subject: '''DBMS''',
    topic: '''Multiple Granularity Locking Intent Locks''',
    questionText: '''In Multi-Granularity Locking (MGL) across a hierarchy (Database -> File -> Page -> Record):
Before a transaction can obtain an Exclusive (X) lock on a leaf node record, what type of intention lock must it hold on all ancestor nodes in the hierarchy?''',
    options: ['''Intention Exclusive (IX) lock''', '''Intention Shared (IS) lock''', '''Shared (S) lock''', '''Shared Intention Exclusive (SIX) lock'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''In the Multi-Granularity Locking protocol:
To acquire an exclusive (X) lock on any node, the transaction must first acquire Intention Exclusive (IX) locks on all ancestor nodes from the root down to the parent of that node.
This alerts concurrent transactions that exclusive locking is underway in a lower-level subtree, preventing coarse-grained conflicting locks.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_58',
    year: 2026,
    subject: '''DBMS''',
    topic: '''Tuple Relational Calculus Safe Queries''',
    questionText: '''Which of the following statements regarding the safety of queries in Tuple Relational Calculus (TRC) is/are TRUE?''',
    options: ['''A TRC expression is called "safe" if all of its results are composed exclusively of domain values appearing in the database relations or in the query constant set.''', '''The query { t | NOT (t in R) } is unsafe because it can evaluate to an infinite relation depending on the underlying domain.''', '''Every safe TRC query can be translated into an equivalent relational algebra expression.''', '''Unsafe queries can be executed in finite time on any relational database engine.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis of statements:
A. Codd's definition of a safe query guarantees domain independence: the result depends solely on values appearing in the database relations or explicitly in the query constants. (TRUE)
B. { t | not(t in R) } produces all tuples in the universe not in R, which is infinite if the attribute domain is infinite (e.g. integers or strings), making it unsafe. (TRUE)
C. By Codd's Equivalence Theorem, Safe Relational Calculus is strictly equivalent in expressive power to Basic Relational Algebra. (TRUE)
D. Unsafe queries can yield infinite relations and cannot be executed directly by standard engines without domain restriction. (FALSE)

Correct options: A, B, C.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_59',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''CNN Output Spatial Dimension Formula''',
    questionText: '''A 2D convolutional layer receives an input image of spatial dimension 64 x 64.
The convolution uses a square filter of size K = 5 x 5, stride S = 2, and zero-padding P = 2.
What is the spatial width of the output feature map? (Answer as an integer).''',
    options: [],
    correctAnswer: '''32''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''The formula for the spatial dimension of a 2D convolutional output is:
O = floor[ (W - K + 2*P) / S ] + 1.

Given:
W = 64
K = 5
P = 2
S = 2.

Substitute values:
W - K + 2*P = 64 - 5 + 2(2) = 59 + 4 = 63.
O = floor[ 63 / 2 ] + 1 = 31 + 1 = 32.

The output spatial dimension is 32 x 32.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_60',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Batch Normalization Inference Mechanics''',
    questionText: '''In Batch Normalization (BatchNorm), how are the mean mu and variance sigma^2 handled during inference (evaluation mode) compared to training mode?''',
    options: ['''During inference, fixed running exponential moving averages of mean and variance accumulated during training are used, rather than mini-batch statistics.''', '''During inference, mini-batch mean and variance are computed fresh for each test batch.''', '''Batch Normalization is completely disabled during inference without any scaling.''', '''The running variance is always set to 1.0 during inference.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''During training, BatchNorm computes the mean and variance across the current mini-batch to normalize activations.
Simultaneously, it maintains running exponential moving averages:
mu_running = (1 - m) * mu_running + m * mu_batch.
During inference, to produce deterministic, instance-independent predictions that do not vary based on what other examples happen to be in the test batch, BatchNorm uses these fixed pre-computed running statistics.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_61',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Naive Bayes Posterior Odds Ratio''',
    questionText: '''In a binary classification problem with classes C_1 and C_2:
The prior probabilities are equal: P(C_1) = P(C_2) = 0.50.
A feature vector x = (x_1, x_2) is observed.
Under the class-conditional independence assumption of Naive Bayes:
P(x_1 | C_1) = 0.60,  P(x_1 | C_2) = 0.20
P(x_2 | C_1) = 0.50,  P(x_2 | C_2) = 0.25.
What is the posterior odds ratio P(C_1 | x) / P(C_2 | x)? (Answer as an integer).''',
    options: [],
    correctAnswer: '''6''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''By Bayes' theorem under conditional independence:
P(C_1 | x) / P(C_2 | x) = [ P(C_1) / P(C_2) ] * [ P(x_1 | C_1) / P(x_1 | C_2) ] * [ P(x_2 | C_1) / P(x_2 | C_2) ].

Given:
P(C_1) / P(C_2) = 0.50 / 0.50 = 1.
P(x_1 | C_1) / P(x_1 | C_2) = 0.60 / 0.20 = 3.
P(x_2 | C_1) / P(x_2 | C_2) = 0.50 / 0.25 = 2.

Posterior odds ratio:
1 * 3 * 2 = 6.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_62',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Multi Head Attention Low Rank Constraints''',
    questionText: '''Consider a Transformer model where input tokens have dimension d_model = 512.
A Multi-Head Attention layer uses h = 8 heads, each with key and query projection dimension d_k = d_model / h = 64.
Which of the following statements regarding the attention matrices is/are TRUE?''',
    options: ['''Each individual attention head produces an attention score matrix Q_i K_i^T of rank at most d_k = 64, regardless of the sequence length n.''', '''Multi-Head Attention allows the model to jointly attend to information from different representation subspaces at different positions.''', '''The output projection matrix W_O has dimensions (h * d_v) x d_model = 512 x 512.''', '''Increasing the number of heads h without changing d_model increases the total number of floating point operations quadratically.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis of statements:
A. Q_i and K_i have dimensions n x d_k. Since the rank of a matrix product is bounded by the inner dimension, rank(Q_i K_i^T) <= min(n, d_k) = min(n, 64) <= 64. (TRUE)
B. Multi-head attention projects queries, keys, and values into h distinct representation subspaces, enabling diverse contextual focus. (TRUE)
C. Concat(head_1, ..., head_h) has dimension h * d_v = 512. The final linear projection W_O maps this back to d_model = 512, with matrix shape 512 x 512. (TRUE)
D. The total FLOPs for multi-head attention is O(n^2 * d_model), which is independent of the number of heads h (since h * d_k = d_model). (FALSE)

Correct options: A, B, C.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_63',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''Minimax Value Depth 3 Game Tree''',
    questionText: '''Consider a two-player zero-sum game tree of depth 3 evaluated by Minimax:
- Level 0 (Root) is a MAX node.
- Level 1 has 2 children of the root (MIN nodes M_1 and M_2).
- Level 2 has 2 children per MIN node (MAX nodes A, B under M_1, and C, D under M_2).
- Level 3 contains terminal leaves:
Leaves under A: 4, 7
Leaves under B: 2, 5
Leaves under C: 1, 3
Leaves under D: 2, 4.
What is the minimax value backed up to the root node? (Answer as an integer).''',
    options: [],
    correctAnswer: '''5''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Trace bottom-up minimax values:
Level 2 (MAX nodes):
Node A: max(4, 7) = 7.
Node B: max(2, 5) = 5.
Node C: max(1, 3) = 3.
Node D: max(2, 4) = 4.

Level 1 (MIN nodes):
Node M_1: min(A, B) = min(7, 5) = 5.
Node M_2: min(C, D) = min(3, 4) = 3.

Level 0 (Root MAX node):
Root: max(M_1, M_2) = max(5, 3) = 5.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_64',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''First Order Logic Most General Unifier''',
    questionText: '''Consider the two First-Order Logic atomic sentences:
Sentence 1: P(x, f(y), z)
Sentence 2: P(a, f(b), g(w))
where a, b are constant symbols, f, g are function symbols, and x, y, z, w are variable symbols.
What is the Most General Unifier (MGU) theta that unifies Sentence 1 and Sentence 2?''',
    options: ['''{ x / a, y / b, z / g(w) }''', '''{ x / a, y / b, w / z }''', '''{ x / f(a), y / b, z / g(w) }''', '''Sentences 1 and 2 cannot be unified.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Unification matches arguments from left to right:
1. Argument 1: Variable x and constant a. MGU substitution: { x / a }.
2. Argument 2: f(y) and f(b). Function names match. Unify y and b: { y / b }.
3. Argument 3: Variable z and term g(w). Variable z does not appear inside g(w) (occurs check succeeds). MGU substitution: { z / g(w) }.

Composing substitutions yields:
theta = { x / a, y / b, z / g(w) }.
Applying theta to both sentences yields identical atom: P(a, f(b), g(w)).
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK9_CORE_65',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Softmax Temperature Scaling Shannon Entropy''',
    questionText: '''In temperature-scaled softmax over K = 4 logits:
p_i(T) = exp( z_i / T ) / sum_{j=1}^K exp( z_j / T ).
Suppose the logits are z = [10, 5, 2, -1].
As the temperature parameter T -> infinity, the probability distribution p(T) converges to a uniform distribution over the 4 classes.
What is the Shannon entropy H(p) = -sum_{i=1}^4 p_i ln(p_i) in the limit T -> infinity, expressed in terms of natural logarithm ln(C)? What is the integer C?''',
    options: [],
    correctAnswer: '''4''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''As temperature T -> infinity:
For any finite logits z_i, z_i / T -> 0.
exp(z_i / T) -> exp(0) = 1.
The probabilities converge to the discrete uniform distribution over K = 4 classes:
p_i = 1 / 4 for all i in {1, 2, 3, 4}.

The Shannon entropy of a uniform distribution over K classes is:
H(p) = -sum_{i=1}^4 (1/4) ln(1/4) = -ln(1/4) = ln(4).

Thus C = 4.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
];
