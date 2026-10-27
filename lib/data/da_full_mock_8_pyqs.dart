// AUTO-GENERATED MOCK 8 QUESTIONS (LEVEL 8: OLYMPIAD-RESEARCH DIFFICULTY)
import '../models/models.dart';

final List<PYQ> daFullMock8Questions = [
  PYQ(
    id: 'DA_MOCK8_GA_01',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Verbal Ability''',
    questionText: '''Choose the word that best completes the sentence:
"The lead scientist noted that relying on vacuum-tube calculations in a modern supercomputing cluster was entirely ________, given the pervasive adoption of quantum and neuromorphic processors."''',
    options: ['''anachronistic''', '''recalcitrant''', '''perfunctory''', '''obsequious'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''"Anachronistic" means belonging or appropriate to a period other than that in which it exists, especially conspicuously old-fashioned.
Using vacuum-tube calculations in a modern computing environment is anachronistic.
Recalcitrant means stubbornly uncooperative; perfunctory means carried out with minimal effort; obsequious means obedient or attentive to an excessive degree.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_GA_02',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Critical Reasoning''',
    questionText: '''Consider the following argument:
"If a neural network model experiences catastrophic forgetting during sequential training, its validation loss on earlier tasks increases dramatically. The validation loss of Model X on earlier tasks has increased dramatically. Therefore, Model X must have experienced catastrophic forgetting."
Which formal logical fallacy does this argument commit?''',
    options: ['''Affirming the consequent''', '''Denying the antecedent''', '''Begging the question (Circular reasoning)''', '''False dilemma'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The structure of the argument is:
Premise 1: P -> Q (If catastrophic forgetting occurs, validation loss on earlier tasks spikes).
Premise 2: Q (Validation loss on earlier tasks has spiked).
Conclusion: Therefore, P (Catastrophic forgetting occurred).
This is the classic formal fallacy of "Affirming the Consequent" (since other factors, such as hardware degradation or corrupt evaluation data, could also cause the loss spike).
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_GA_03',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude''',
    questionText: '''A storage container initially holds 80 liters of pure liquid coolant.
From this container, 16 liters of coolant are removed and replaced with 16 liters of distilled water.
The mixture is thoroughly stirred, and again 16 liters of the mixture are removed and replaced with 16 liters of distilled water.
How many liters of pure coolant remain in the container after these two replacement cycles?''',
    options: ['''51.2 liters''', '''48.0 liters''', '''54.4 liters''', '''45.6 liters'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''By the repeated dilution formula:
Remaining pure liquid = Initial Volume * (1 - x / V)^n.

Given:
V = 80 liters
x = 16 liters replaced each time
n = 2 cycles.

Remaining coolant = 80 * (1 - 16 / 80)^2
= 80 * (1 - 0.20)^2
= 80 * (0.80)^2
= 80 * 0.64 = 51.2 liters.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_GA_04',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Spatial Aptitude''',
    questionText: '''A standard die has faces numbered 1 through 6. The net of the cube is folded such that:
- Face 1 is opposite Face 6
- Face 2 is opposite Face 5
- Face 3 is opposite Face 4.
If the die is placed on a table with Face 3 facing the table (bottom face) and Face 2 facing North, which number is on the face directed South?''',
    options: ['''5''', '''6''', '''1''', '''4'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The face directed South is opposite the face directed North.
Since Face 2 is directed North, the opposite face directed South must be Face 5 (since 2 is opposite 5).
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_GA_05',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Analytical Aptitude''',
    questionText: '''Find the next alphanumeric term in the sequence:
A2Z, C4X, F8U, J16Q, ?''',
    options: ['''O32L''', '''N32L''', '''O32M''', '''P32K'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Analyze each component of the terms:
1. First letter:
A (1) + 2 -> C (3)
C (3) + 3 -> F (6)
F (6) + 4 -> J (10)
J (10) + 5 -> O (15). Next letter is O.

2. Middle number:
2 * 2 = 4
4 * 2 = 8
8 * 2 = 16
16 * 2 = 32. Next number is 32.

3. Third letter (moving backwards):
Z (26) - 2 -> X (24)
X (24) - 3 -> U (21)
U (21) - 4 -> Q (17)
Q (17) - 5 -> L (12). Next letter is L.

Combining all components yields O32L.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_GA_06',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude''',
    questionText: '''What is the smallest positive integer n that leaves a remainder of 2 when divided by 3, a remainder of 3 when divided by 5, and a remainder of 2 when divided by 7?''',
    options: ['''23''', '''53''', '''38''', '''68'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''System of modular congruences:
n = 2 (mod 3)
n = 3 (mod 5)
n = 2 (mod 7).

Observe the congruences mod 3 and mod 7:
n = 2 (mod 3) and n = 2 (mod 7).
Since gcd(3, 7) = 1, n = 2 (mod 21).

Thus n can be written in the form:
n = 21 k + 2.
We need n = 3 (mod 5):
21 k + 2 = 3 (mod 5)
(1) k + 2 = 3 (mod 5)
k = 1 (mod 5).

Smallest non-negative integer k is k = 1:
n = 21(1) + 2 = 23.

Verification:
23 / 3 = 7 with remainder 2.
23 / 5 = 4 with remainder 3.
23 / 7 = 3 with remainder 2.
The smallest positive integer is 23. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_GA_07',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Combinatorics''',
    questionText: '''Five distinct software packages (P1, P2, P3, P4, P5) are to be assigned to five distinct virtual servers (S1, S2, S3, S4, S5), with exactly one package per server.
Initially, package P_i was deployed on server S_i for all i in {1, 2, 3, 4, 5}.
In how many ways can the packages be completely redeployed such that NO package is deployed on its original server (i.e., a complete derangement of 5 items)?''',
    options: ['''44''', '''53''', '''120''', '''24'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The number of derangements of n distinct items is given by the subfactorial formula:
!n = n! * sum_{k=0}^n (-1)^k / k!.

For n = 5:
!5 = 5! * [ 1/0! - 1/1! + 1/2! - 1/3! + 1/4! - 1/5! ]
= 120 * [ 1 - 1 + 1/2 - 1/6 + 1/24 - 1/120 ]
= 120 * [ 0 + 60/120 - 20/120 + 5/120 - 1/120 ]
= 60 - 20 + 5 - 1 = 44.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_GA_08',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude''',
    questionText: '''In a circle, two chords AB and CD intersect at an interior point P.
If AP = 6 cm, PB = 8 cm, and CP = 4 cm, what is the length of chord CD?''',
    options: ['''16 cm''', '''12 cm''', '''14 cm''', '''18 cm'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''By the Intersecting Chords Theorem:
AP * PB = CP * PD.

Given:
AP = 6 cm, PB = 8 cm, CP = 4 cm.
6 * 8 = 4 * PD
48 = 4 * PD => PD = 12 cm.

The total length of chord CD is:
CD = CP + PD = 4 + 12 = 16 cm.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_GA_09',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Logical Deduction''',
    questionText: '''Four researchers (Alpha, Beta, Gamma, Delta) each specialize in a distinct AI field: Robotics, NLP, Vision, or Bio-AI.
1. The Vision specialist and Alpha attended the same conference in Zurich.
2. The Bio-AI specialist is younger than Gamma.
3. Beta and the Robotics specialist are co-authors on a paper.
4. Delta is older than both the Bio-AI specialist and the NLP specialist.
5. Alpha does not specialize in Bio-AI.
Who is the Bio-AI specialist?''',
    options: ['''Beta''', '''Alpha''', '''Gamma''', '''Delta'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Deduce identities step by step:
From 1: Alpha is not Vision.
From 5: Alpha is not Bio-AI.
From 2: Gamma is not Bio-AI (Bio-AI is younger than Gamma).
From 4: Delta is not Bio-AI (Delta is older than Bio-AI).
Thus, among {Alpha, Beta, Gamma, Delta}, the only person who can be the Bio-AI specialist is Beta!
Let us verify consistency:
- Beta is Bio-AI.
- By 3, Beta (Bio-AI) co-authored with Robotics, consistent.
- By 2, Beta is younger than Gamma.
- By 4, Delta is older than Beta and NLP.
Therefore, Beta is indeed the Bio-AI specialist. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_GA_10',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Data Sufficiency''',
    questionText: '''Is the positive integer N divisible by 36?
Statement 1: N is divisible by 4 and 9.
Statement 2: N is divisible by 6 and 12.
Which of the following is correct?''',
    options: ['''Statement 1 ALONE is sufficient, but Statement 2 ALONE is not sufficient.''', '''Statement 2 ALONE is sufficient, but Statement 1 ALONE is not sufficient.''', '''BOTH statements TOGETHER are sufficient, but NEITHER statement ALONE is sufficient.''', '''Statements 1 and 2 TOGETHER are NOT sufficient.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Analysis:
36 = 2^2 * 3^2 = 4 * 9, where gcd(4, 9) = 1.
Statement 1: N is divisible by 4 and 9.
Since gcd(4, 9) = 1, lcm(4, 9) = 36. Hence N must be divisible by 36. Statement 1 ALONE is sufficient.

Statement 2: N is divisible by 6 and 12.
Since 12 is already a multiple of 6, lcm(6, 12) = 12.
Divisibility by 12 does NOT imply divisibility by 36 (e.g., N = 24 is divisible by 6 and 12, but not by 36). Statement 2 ALONE is NOT sufficient.

Thus, Statement 1 ALONE is sufficient, but Statement 2 ALONE is not sufficient. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_11',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Simultaneous Diagonalization Commuting Matrices''',
    questionText: '''Let A and B be two diagonalizable n x n complex matrices.
Which condition is necessary and sufficient for A and B to be simultaneously diagonalizable (i.e., there exists an invertible matrix P such that both P^(-1) A P and P^(-1) B P are diagonal)?''',
    options: ['''A and B commute (A B = B A).''', '''tr(A B) = tr(A) * tr(B).''', '''det(A + B) = det(A) + det(B).''', '''A and B are both symmetric.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''By the Simultaneous Diagonalization Theorem:
Two diagonalizable matrices A and B can be diagonalized by the same similarity transformation if and only if they commute, i.e., A B = B A.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_12',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Companion Matrix Determinant''',
    questionText: '''Consider the 3 x 3 companion matrix of the polynomial p(lambda) = lambda^3 + 2 lambda^2 - 5 lambda + 6:
C = [[ 0,  0, -6],
     [ 1,  0,  5],
     [ 0,  1, -2]].
What is the determinant det(C)? (Answer as an integer).''',
    options: [],
    correctAnswer: '''-6''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''For a monic polynomial p(lambda) = lambda^n + c_{n-1} lambda^(n-1) + ... + c_1 lambda + c_0:
The characteristic polynomial of its companion matrix is p(lambda).
The determinant of an n x n matrix equals (-1)^n times its constant term, or product of eigenvalues:
p(0) = (-1)^n * det(C) => c_0 = (-1)^n * det(C).
Here n = 3, c_0 = 6:
6 = (-1)^3 * det(C) = -det(C) => det(C) = -6.

Direct expansion across row 1:
det(C) = -6 * (1*1 - 0*0) = -6 * 1 = -6.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_13',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Positive Semidefinite Matrix Invariants''',
    questionText: '''Let A in R^{n x n} be a real symmetric positive semidefinite matrix (A >= 0).
Which of the following statements is/are ALWAYS TRUE?''',
    options: ['''All eigenvalues of A are non-negative real numbers.''', '''All diagonal entries of A are non-negative (a_ii >= 0 for all i).''', '''Every principal submatrix of A is positive semidefinite.''', '''det(A) must be strictly greater than 0.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis of statements:
A. By definition, x^T A x >= 0 for all x. For eigenvector v with A v = lambda v, v^T A v = lambda ||v||^2 >= 0 => lambda >= 0. (TRUE)
B. Choosing standard basis vector e_i, e_i^T A e_i = a_ii >= 0. (TRUE)
C. Restricting x to have non-zero entries only on the index subset of a principal submatrix retains non-negativity of the quadratic form. (TRUE)
D. A positive semidefinite matrix can have zero eigenvalues, in which case det(A) = 0 (e.g. the zero matrix). (FALSE)

Correct options: A, B, C.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_14',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Frobenius Norm of Rank One Outer Product''',
    questionText: '''Let u = [1, 2, 2]^T and v = [2, -1, 2]^T.
Let M = u v^T be their outer product matrix.
What is the Frobenius norm ||M||_F? (Answer as an integer).''',
    options: [],
    correctAnswer: '''9''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''The Frobenius norm of an outer product M = u v^T is simply the product of their Euclidean norms:
||u v^T||_F = ||u||_2 * ||v||_2.

Compute ||u||_2:
||u||_2 = sqrt(1^2 + 2^2 + 2^2) = sqrt(1 + 4 + 4) = sqrt(9) = 3.

Compute ||v||_2:
||v||_2 = sqrt(2^2 + (-1)^2 + 2^2) = sqrt(4 + 1 + 4) = sqrt(9) = 3.

Therefore:
||M||_F = 3 * 3 = 9.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_15',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Critical Point of Quadratic Surface''',
    questionText: '''Find the value of x at the stationary (critical) point of the function:
f(x, y) = 3 x^2 + 2 y^2 - 2 x y - 8 x - 4 y + 10.
(Answer as an integer).''',
    options: [],
    correctAnswer: '''2''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Set the partial derivatives to zero:
df/dx = 6 x - 2 y - 8 = 0  =>  3 x - y = 4  (Equation 1)
df/dy = 4 y - 2 x - 4 = 0  =>  -x + 2 y = 2 (Equation 2).

From Equation 1: y = 3 x - 4.
Substitute into Equation 2:
-x + 2(3 x - 4) = 2
-x + 6 x - 8 = 2
5 x = 10 => x = 2.

(y = 3(2) - 4 = 2).
The value of x at the critical point is 2.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_16',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Eulers Theorem for Homogeneous Functions''',
    questionText: '''A function f(x, y) is homogeneous of degree k = 4, meaning f(t x, t y) = t^4 f(x, y) for all t > 0.
By Euler's Homogeneous Function Theorem, the expression:
x * (df / dx) + y * (df / dy)
evaluates to:''',
    options: ['''4 * f(x, y)''', '''16 * f(x, y)''', '''2 * f(x, y)''', '''f(x, y)'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Euler's Theorem for Homogeneous Functions states that if f(x, y) is continuously differentiable and homogeneous of degree k, then:
x * (df/dx) + y * (df/dy) = k * f(x, y).
Here k = 4, so the expression equals 4 * f(x, y). Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_17',
    year: 2026,
    subject: '''Optimization''',
    topic: '''Fenchel Conjugate of Quadratic Function''',
    questionText: '''Let f(x) = (1/2) * a * x^2 for x in R, where a = 4.
The Fenchel convex conjugate function is defined as f*(y) = sup_{x} { y * x - f(x) }.
What is the value of f*(8)? (Answer as an integer).''',
    options: [],
    correctAnswer: '''8''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''For f(x) = (1/2) * a * x^2:
The conjugate is f*(y) = sup_{x} { y * x - (1/2) * a * x^2 }.
Differentiating with respect to x:
y - a * x = 0 => x* = y / a.

Substituting x*:
f*(y) = y * (y / a) - (1/2) * a * (y / a)^2
= y^2 / a - y^2 / (2 a)
= y^2 / (2 a).

Given a = 4 and y = 8:
f*(8) = 8^2 / (2 * 4) = 64 / 8 = 8.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_18',
    year: 2026,
    subject: '''Optimization''',
    topic: '''Strict Convexity and Uniqueness of Minimizer''',
    questionText: '''Let C subset R^n be a non-empty closed convex set, and let f: C -> R be a strictly convex function.
Which of the following statements is/are ALWAYS TRUE?''',
    options: ['''If a local minimizer of f on C exists, it is the unique global minimizer of f on C.''', '''Any local minimizer of f on C is a global minimizer.''', '''The sublevel sets {x in C : f(x) <= alpha} are convex sets for every alpha in R.''', '''f must achieve a minimum on C even if C is unbounded.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis of statements:
A. Strict convexity ensures that if a minimizer exists, it is strictly unique. (TRUE)
B. Convexity guarantees that every local minimizer is a global minimizer. (TRUE)
C. Convex functions have convex sublevel sets (quasi-convexity property). (TRUE)
D. Strict convexity does not guarantee existence of a minimizer if C is unbounded and f is not coercive (e.g. f(x) = e^x on R has no minimizer). (FALSE)

Correct options: A, B, C.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_19',
    year: 2026,
    subject: '''Probability''',
    topic: '''Characteristic Function of Standard Normal''',
    questionText: '''The characteristic function of a random variable X is defined as phi_X(t) = E[e^(i t X)].
If X ~ N(0, 1), what is the value of ln(phi_X(4))? (Answer as an integer).''',
    options: [],
    correctAnswer: '''-8''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''For a standard normal distribution X ~ N(0, 1):
The characteristic function is:
phi_X(t) = exp( -t^2 / 2 ).

For t = 4:
phi_X(4) = exp( -4^2 / 2 ) = exp( -16 / 2 ) = exp(-8).

Taking natural logarithm:
ln(phi_X(4)) = -8.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_20',
    year: 2026,
    subject: '''Probability''',
    topic: '''Lindeberg Levy Central Limit Theorem''',
    questionText: '''The classical Lindeberg-Levy Central Limit Theorem guarantees that the standardized sample mean:
Z_n = (X_bar_n - mu) / (sigma / sqrt(n))
converges in distribution to N(0, 1) under which minimal assumption?''',
    options: ['''X_1, X_2, ... are i.i.d. random variables with finite mean mu and finite positive variance sigma^2.''', '''X_1, X_2, ... must follow a symmetric distribution.''', '''The moment generating function of X_i must exist in an open neighborhood around 0.''', '''The sample size n must be strictly greater than 10,000.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The Lindeberg-Levy CLT requires only that the sequence of random variables is independent and identically distributed (i.i.d.) with finite mean and finite non-zero variance sigma^2 < infinity. No symmetry or higher moment requirements are needed. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_21',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Sample Size for Confidence Interval Margin of Error''',
    questionText: '''A polling analyst wants to estimate an unknown population proportion p.
Using the conservative bound p*(1 - p) <= 0.25 and a critical value z_{alpha/2} = 2.0 (for approximately 95% confidence):
What is the minimum sample size n required so that the margin of error E = z_{alpha/2} * sqrt(p(1-p)/n) is at most 0.05? (Answer as an integer).''',
    options: [],
    correctAnswer: '''400''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Set margin of error E <= 0.05:
z * sqrt(0.25 / n) <= 0.05
2.0 * (0.5 / sqrt(n)) <= 0.05
1.0 / sqrt(n) <= 0.05
sqrt(n) >= 1.0 / 0.05 = 20.

Squaring both sides:
n >= 20^2 = 400.
The minimum sample size is 400.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_22',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Neyman Pearson Lemma Cutoff Form''',
    questionText: '''In testing a simple null hypothesis H_0: theta = theta_0 against a simple alternative H_1: theta = theta_1 based on an observed sample x:
The Neyman-Pearson Lemma guarantees that the Most Powerful (MP) test rejects H_0 in favor of H_1 when:''',
    options: ['''The likelihood ratio Lambda(x) = L(theta_1; x) / L(theta_0; x) >= k, for some threshold k > 0.''', '''The p-value is strictly greater than 0.50.''', '''The sample mean equals theta_1.''', '''L(theta_0; x) / L(theta_1; x) >= 1.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The Neyman-Pearson fundamental lemma states that the likelihood ratio test of the form:
Lambda(x) = L(theta_1; x) / L(theta_0; x) >= k
achieves the maximum power (1 - beta) among all tests having significance level alpha <= alpha_0.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_23',
    year: 2026,
    subject: '''Probability''',
    topic: '''Geometric Distribution Memoryless Probability''',
    questionText: '''Let X be the number of Bernoulli trials until the first success, where the success probability is p = 0.20 (Geometric distribution with PMF P(X = k) = (1 - p)^(k-1) p for k = 1, 2, ...).
What is the conditional probability P(X > 7 | X > 4)? (Answer as a decimal rounded to three decimal places).''',
    options: [],
    correctAnswer: '''0.512''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''By the memoryless property of the Geometric distribution:
P(X > s + t | X > s) = P(X > t).

Here s = 4 and s + t = 7 => t = 3:
P(X > 7 | X > 4) = P(X > 3).

The probability of requiring strictly more than 3 trials is the probability of 3 consecutive failures:
P(X > 3) = (1 - p)^3.
Given p = 0.20:
1 - p = 0.80.
P(X > 3) = 0.80^3 = 0.512.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_24',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Maximum Likelihood Estimator Asymptotic Invariants''',
    questionText: '''Under standard Fisher regularity conditions, which of the following asymptotic properties is/are ALWAYS satisfied by Maximum Likelihood Estimators (MLEs)?''',
    options: ['''Asymptotic Normality: sqrt(n) * (theta_hat_MLE - theta) -> N(0, I_1^(-1)(theta)) in distribution.''', '''Functional Invariance (Equivariance): If theta_hat is the MLE of theta, then g(theta_hat) is the MLE of g(theta).''', '''Asymptotic Efficiency: The asymptotic variance of the MLE attains the Cramer-Rao Lower Bound.''', '''The MLE is guaranteed to be strictly unbiased for all finite sample sizes n.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis of statements:
A. By asymptotic normality of MLEs, the distribution converges to a Gaussian centered at true theta with variance equal to inverse Fisher information. (TRUE)
B. The Zehna Invariance Property proves that for any function g, MLE of g(theta) is g(theta_hat_MLE). (TRUE)
C. MLEs are asymptotically efficient, achieving the CRLB as n -> inf. (TRUE)
D. MLEs are often biased for small finite samples (e.g. the MLE of Gaussian variance is (1/n) sum (X_i - X_bar)^2, which has expectation ((n-1)/n) sigma^2 != sigma^2). (FALSE)

Correct options: A, B, C.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_25',
    year: 2026,
    subject: '''Data Structures''',
    topic: '''Number of Distinct BSTs with n Keys''',
    questionText: '''How many structurally distinct Binary Search Trees (BSTs) can be formed using n = 4 distinct keys? (Answer as an integer).''',
    options: [],
    correctAnswer: '''14''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''The number of structurally distinct binary search trees with n unique keys is given by the n-th Catalan number:
C_n = (1 / (n + 1)) * binom(2n, n).

For n = 4:
C_4 = (1 / 5) * binom(8, 4)
binom(8, 4) = (8 * 7 * 6 * 5) / (4 * 3 * 2 * 1) = 1680 / 24 = 70.
C_4 = 70 / 5 = 14.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_26',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Master Theorem Logarithmic Factor Case''',
    questionText: '''Consider the divide-and-conquer recurrence relation:
T(n) = 2 T(n/2) + Theta(n * log_2 n).
According to the extended Master Theorem, what is the asymptotic time complexity of T(n)?''',
    options: ['''Theta(n * (log_2 n)^2)''', '''Theta(n * log_2 n)''', '''Theta(n^2)''', '''Theta(n^(log_2 3))'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''In T(n) = a T(n/b) + f(n):
a = 2, b = 2 => n^(log_b a) = n^(log_2 2) = n^1 = n.
Here f(n) = Theta(n * log_2 n) = Theta(n^(log_b a) * log^k n), where k = 1.
By Case 2 of the extended Master Theorem:
When f(n) = Theta(n^(log_b a) * log^k n) for k >= 0:
T(n) = Theta(n^(log_b a) * log^(k+1) n).
For k = 1:
T(n) = Theta(n * (log_2 n)^2).
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_27',
    year: 2026,
    subject: '''Programming in Python''',
    topic: '''Generator Expression State and Next''',
    questionText: '''Consider the following Python 3 code:
gen = (x * 2 for x in range(5) if x % 2 == 1)
a = next(gen)
b = next(gen)
print(a + b)

What integer value is printed? (Answer as an integer).''',
    options: [],
    correctAnswer: '''8''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Analyze the generator:
range(5) produces 0, 1, 2, 3, 4.
The condition x % 2 == 1 filters odd numbers: x = 1, 3.
The expression evaluates x * 2:
For x = 1: 1 * 2 = 2.
For x = 3: 3 * 2 = 6.

Calls to next(gen):
First next: a = 2.
Second next: b = 6.

Sum a + b = 2 + 6 = 8.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_28',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Topological Sort Invariants in DAGs''',
    questionText: '''Which of the following statements regarding Topological Sorting on a Directed Graph G = (V, E) is/are TRUE?''',
    options: ['''A valid topological sort exists if and only if G contains no directed cycles (G is a DAG).''', '''If a directed graph G has a unique topological ordering, then G contains a directed Hamiltonian path.''', '''Topological sort can be computed in O(|V| + |E|) time using Depth-First Search or Kahn's in-degree algorithm.''', '''Every directed acyclic graph has exactly one valid topological sort.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis of statements:
A. The presence of any directed cycle creates a circular precedence dependency u -> ... -> v -> u, making topological order impossible. (TRUE)
B. A DAG has a unique topological order iff there is an edge between every consecutive pair in the order, forming a directed Hamiltonian path. (TRUE)
C. Both DFS-based post-order reversal and Kahn's in-degree queue algorithm visit each vertex and edge once in O(|V| + |E|) time. (TRUE)
D. Many DAGs have multiple topological orders (e.g. an empty graph with 3 vertices has 3! = 6 topological sorts). (FALSE)

Correct options: A, B, C.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_29',
    year: 2026,
    subject: '''DBMS''',
    topic: '''Lossless Join and Dependency Preservation in Normal Forms''',
    questionText: '''Which of the following statements correctly characterizes Boyce-Codd Normal Form (BCNF) versus Third Normal Form (3NF)?''',
    options: ['''A lossless-join decomposition into 3NF that also preserves all functional dependencies is always achievable, whereas BCNF decompositions may not preserve all functional dependencies.''', '''BCNF decompositions are always guaranteed to preserve all functional dependencies.''', '''3NF decompositions never achieve a lossless join.''', '''Any relation in 3NF is automatically in BCNF.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''A fundamental trade-off in relational database design:
Every relation schema can be decomposed into 3NF with guaranteed Lossless-Join AND Dependency Preservation.
However, for BCNF, while a Lossless-Join decomposition is always guaranteed, Dependency Preservation cannot always be achieved (e.g. schema R(A, B, C) with FDs AB -> C, C -> B).
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_30',
    year: 2026,
    subject: '''DBMS''',
    topic: '''Superkeys Count for Composite Candidate Key''',
    questionText: '''Consider a relation schema R with 5 attributes: R(A, B, C, D, E).
Suppose the ONLY candidate key of R is the composite key {A, B}.
How many distinct superkeys does relation R have? (Answer as an integer).''',
    options: [],
    correctAnswer: '''8''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''A superkey is any subset of attributes that contains a candidate key.
Here the only candidate key is {A, B}.
Any superkey must contain both A and B.
The remaining attributes are {C, D, E} (3 attributes).
Any subset of {C, D, E} can be combined with {A, B} to form a unique superkey:
Number of subsets = 2^3 = 8.
Thus there are exactly 8 superkeys.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_31',
    year: 2026,
    subject: '''DBMS''',
    topic: '''MVCC and Lock Avoidance Mechanisms''',
    questionText: '''Which of the following statements regarding Multi-Version Concurrency Control (MVCC) in database systems is/are TRUE?''',
    options: ['''In MVCC, read transactions view a timestamped snapshot of data and do not acquire shared locks on data items.''', '''Writers in MVCC do not block concurrent readers.''', '''Old tuple versions must eventually be cleaned up by a garbage collection (vacuum) mechanism.''', '''MVCC completely prevents all serializability anomalies without any additional conflict checks or locks.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis of statements:
A. MVCC allows transactions to read historical versions corresponding to their read timestamp, eliminating shared read locks. (TRUE)
B. Because writers create a new version of the tuple rather than overwriting in-place, concurrent readers continue reading the older visible version without blocking. (TRUE)
C. Once no active transaction needs an older version, that version is dead and must be vacuumed to reclaim storage. (TRUE)
D. MVCC alone implements Snapshot Isolation, which allows Write Skew; full serializability requires additional techniques (like Serializable Snapshot Isolation SSI or 2PL). (FALSE)

Correct options: A, B, C.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_32',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Ridge Regression Singular Value Filtering Factor''',
    questionText: '''In Ridge Regression with regularization parameter lambda > 0, let X = U Sigma V^T be the SVD of the design matrix.
The ridge regression prediction vector can be written as sum_i u_i * f_i * (u_i^T y), where the shrinkage filter factor f_i applied to the i-th singular value sigma_i is:''',
    options: ['''sigma_i^2 / (sigma_i^2 + lambda)''', '''lambda / (sigma_i^2 + lambda)''', '''1 / (1 + lambda * sigma_i)''', '''sigma_i / (sigma_i + lambda)'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''In OLS, the prediction is sum_i u_i (u_i^T y).
In Ridge regression:
y_hat_ridge = X (X^T X + lambda I)^(-1) X^T y.
Substituting X = U Sigma V^T yields:
y_hat_ridge = U Sigma (Sigma^2 + lambda I)^(-1) Sigma U^T y = sum_i u_i [ sigma_i^2 / (sigma_i^2 + lambda) ] (u_i^T y).
The shrinkage filter factor is f_i = sigma_i^2 / (sigma_i^2 + lambda).
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_33',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Hinge Loss Convex Upper Bound on Zero One Loss''',
    questionText: '''For a binary classifier with true label y in {-1, +1} and real margin score s in R:
The 0-1 loss is L_{0-1}(y, s) = 1 if y*s < 0, else 0.
The hinge loss is L_hinge(y, s) = max(0, 1 - y*s).
If the true label is y = 1 and the model predicts margin score s = -2:
What is the value of the hinge loss L_hinge(y, s)? (Answer as an integer).''',
    options: [],
    correctAnswer: '''3''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Given:
y = 1
s = -2.
Margin product = y * s = 1 * (-2) = -2.

Hinge loss:
L_hinge = max(0, 1 - y*s) = max(0, 1 - (-2)) = max(0, 1 + 2) = 3.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_34',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''Simulated Annealing Acceptance Probability''',
    questionText: '''In the Simulated Annealing optimization algorithm, when moving from a current state with energy E_current to a worse neighboring state with higher energy E_next (so Delta E = E_next - E_current > 0):
At temperature T > 0, the probability of accepting this worse move is:''',
    options: ['''exp( -Delta E / T )''', '''exp( Delta E / T )''', '''1 - exp( -Delta E / T )''', '''1 / (1 + Delta E * T)'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Simulated Annealing employs the Metropolis criterion:
Better moves (Delta E <= 0) are always accepted with probability 1.
Worse moves (Delta E > 0) are accepted with probability:
P(accept) = exp( -Delta E / T ).
As temperature T decreases, this probability approaches 0, transitioning from global exploration to greedy local search.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_35',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''Markov Blanket in Bayesian Networks''',
    questionText: '''In a Bayesian Network (directed acyclic graphical model), the Markov Blanket of a target variable node X consists of which set of nodes?''',
    options: ['''The parents of X.''', '''The children of X.''', '''The other parents of the children of X (spouses of X).''', '''All ancestors and descendants of X.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''By definition of a Markov Blanket in a Bayesian Network:
Conditioned on its Markov Blanket, node X is conditionally independent of all other nodes in the network.
The Markov Blanket of X consists of:
1. Parents of X (A is TRUE)
2. Children of X (B is TRUE)
3. Spouses of X (other parents of the children of X) (C is TRUE).
Ancestors and other descendants are not part of the Markov blanket. (D is FALSE).

Correct options: A, B, C.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_36',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Householder Reflection Transformation''',
    questionText: '''Consider the Householder reflection matrix H in R^{3 x 3} defined by:
H = I_3 - 2 * (v v^T) / (v^T v),
where v = [1, 2, 2]^T.
Let vector x = [1, 2, 2]^T.
What is the sum of the components of the reflected vector H x? (Answer as an integer).''',
    options: [],
    correctAnswer: '''-5''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Notice that x = v.
Substitute x = v into H x:
H v = [ I - 2 * (v v^T) / (v^T v) ] v
= v - 2 * v (v^T v) / (v^T v)
= v - 2 v = -v.

Since v = [1, 2, 2]^T:
H x = - [1, 2, 2]^T = [-1, -2, -2]^T.

The sum of components is:
(-1) + (-2) + (-2) = -5.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_37',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Condition Number of Symmetric Matrix''',
    questionText: '''Let A be a 3 x 3 real symmetric positive-definite matrix whose eigenvalues are:
lambda_1 = 2,  lambda_2 = 6,  lambda_3 = 18.
The condition number of A with respect to the 2-norm is defined as:
kappa_2(A) = ||A||_2 * ||A^(-1)||_2.
What is the value of kappa_2(A)? (Answer as an integer).''',
    options: [],
    correctAnswer: '''9''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''For a symmetric positive-definite matrix A:
||A||_2 = lambda_max(A) = 18.
||A^(-1)||_2 = 1 / lambda_min(A) = 1 / 2.

The 2-norm condition number is:
kappa_2(A) = lambda_max(A) / lambda_min(A) = 18 / 2 = 9.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_38',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Spectral Theorem for Normal Matrices''',
    questionText: '''A complex square matrix A in C^{n x n} is called a normal matrix if A* A = A A*, where A* is the conjugate transpose.
Which of the following statements is/are TRUE for all normal matrices?''',
    options: ['''A is unitarily diagonalizable (there exists a unitary matrix U such that U* A U is diagonal).''', '''Eigenvectors corresponding to distinct eigenvalues of A are mutually orthogonal.''', '''||A x||_2 = ||A* x||_2 for all vectors x in C^n.''', '''All eigenvalues of A must be purely real.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis of statements:
A. The Spectral Theorem for Normal Matrices guarantees that A is unitarily diagonalizable iff A is normal. (TRUE)
B. Distinct eigenspaces of normal operators are orthogonal with respect to the standard inner product. (TRUE)
C. ||A x||^2 = x* A* A x = x* A A* x = ||A* x||^2. (TRUE)
D. Normal matrices include unitary and skew-Hermitian matrices, whose eigenvalues can be complex (e.g. unitary has |lambda|=1, skew-Hermitian has purely imaginary eigenvalues). Only Hermitian matrices are guaranteed to have real eigenvalues. (FALSE)

Correct options: A, B, C.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_39',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Courant Fischer Minimax Eigenvalue Bound''',
    questionText: '''Let A be a 3 x 3 real symmetric matrix with sorted eigenvalues lambda_1 <= lambda_2 <= lambda_3:
lambda_1 = 3,  lambda_2 = 7,  lambda_3 = 12.
According to the Courant-Fischer Minimax Theorem:
lambda_2 = min_{dim(S)=2} max_{x in S, x != 0} [ (x^T A x) / (x^T x) ].
What is the exact numerical value of this minimax expression? (Answer as an integer).''',
    options: [],
    correctAnswer: '''7''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''By the Courant-Fischer Minimax Theorem:
For any symmetric matrix with eigenvalues lambda_1 <= lambda_2 <= ... <= lambda_n:
lambda_k = min_{dim(S) = k} max_{x in S, x != 0} R(x) = max_{dim(S) = n - k + 1} min_{x in S, x != 0} R(x).
For k = 2:
The minimax value is precisely the second eigenvalue lambda_2 = 7.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_40',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Volume of Solid Bounded by Paraboloid and Plane''',
    questionText: '''Compute the volume V of the solid bounded below by the paraboloid z = x^2 + y^2 and bounded above by the plane z = 4.
What is the value of V / pi? (Answer as an integer).''',
    options: [],
    correctAnswer: '''8''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''In cylindrical coordinates:
x = r cos(theta), y = r sin(theta), z = z.
The paraboloid is z = r^2.
The intersection with z = 4 occurs at r^2 = 4 => r = 2.
Limits:
0 <= theta <= 2*pi
0 <= r <= 2
r^2 <= z <= 4.

Volume integral:
V = int_0^{2*pi} dtheta * int_0^2 r dr * int_{r^2}^4 dz
= 2*pi * int_0^2 r * (4 - r^2) dr
= 2*pi * int_0^2 (4r - r^3) dr
= 2*pi * [ 2 r^2 - r^4 / 4 ]_0^2
= 2*pi * [ 2(4) - 16 / 4 ]
= 2*pi * [ 8 - 4 ]
= 2*pi * 4 = 8 * pi.

V / pi = 8.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_41',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Conservative Vector Field and Line Integral Work''',
    questionText: '''Consider the vector field:
F(x, y) = (2 x y + 3, x^2 + 4 y).
A particle moves along a path C from point A(0, 0) to point B(2, 3).
What is the work done W = int_C F . dr? (Answer as an integer).''',
    options: [],
    correctAnswer: '''36''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Check if F is conservative:
d/dy (2 x y + 3) = 2x.
d/dx (x^2 + 4 y) = 2x.
Since dP/dy = dQ/dx, F is conservative and path-independent.

Find the potential function phi(x, y):
dphi/dx = 2 x y + 3 => phi(x, y) = x^2 y + 3 x + g(y).
dphi/dy = x^2 + g'(y) = x^2 + 4 y => g'(y) = 4 y => g(y) = 2 y^2.
phi(x, y) = x^2 y + 3 x + 2 y^2.

Evaluate work from A(0, 0) to B(2, 3):
phi(0, 0) = 0.
phi(2, 3) = 2^2 * 3 + 3(2) + 2(3^2)
= 4 * 3 + 6 + 2 * 9
= 12 + 6 + 18 = 36.

Work W = phi(2, 3) - phi(0, 0) = 36.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_42',
    year: 2026,
    subject: '''Optimization''',
    topic: '''Logarithmic Barrier Method Duality Gap''',
    questionText: '''In interior point methods for convex optimization with m inequality constraints f_i(x) <= 0:
The log-barrier objective is B(x, t) = f_0(x) - (1 / t) * sum_{i=1}^m ln( -f_i(x) ), where t > 0.
At the analytic center x*(t), what is the exact theoretical duality gap between the primal objective value and the dual objective value?''',
    options: ['''m / t''', '''1 / (m * t)''', '''m * t''', '''t / m'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''In the barrier method, the modified KKT conditions at the central path point x*(t) associate dual variables lambda_i*(t) = -1 / (t * f_i(x*(t))).
The complementary slackness product evaluates to:
-sum_{i=1}^m lambda_i*(t) f_i(x*(t)) = sum_{i=1}^m (1 / t) = m / t.
Thus, the duality gap is precisely m / t. As t -> infinity, the gap m / t -> 0, reaching the global optimum.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_43',
    year: 2026,
    subject: '''Optimization''',
    topic: '''Projected Gradient Descent on Simplex''',
    questionText: '''Consider the convex optimization problem:
Minimize f(x) = (1/2) * ||x - c||_2^2  subject to x in C,
where C is the non-negative orthant R_+^2 and c = [-3, 5]^T.
What is the optimal solution x* = Pi_C(c)?''',
    options: ['''[0, 5]^T''', '''[-3, 5]^T''', '''[0, 0]^T''', '''[3, 5]^T'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The Euclidean projection of a vector c onto the non-negative orthant C = {x : x_i >= 0} is performed component-wise:
[Pi_C(c)]_i = max(0, c_i).

Given c = [-3, 5]^T:
x_1* = max(0, -3) = 0
x_2* = max(0, 5) = 5.

Thus x* = [0, 5]^T. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_44',
    year: 2026,
    subject: '''Probability''',
    topic: '''Continuous Bivariate Transformation Jacobian''',
    questionText: '''Let X and Y be independent random variables, both distributed exponentially with rate parameter lambda = 1 (PDF f(t) = e^(-t) for t > 0).
Consider the transformation:
U = X + Y   and   V = X / (X + Y).
What is the marginal expected value E[V]? (Answer as a decimal).''',
    options: [],
    correctAnswer: '''0.5''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''By symmetry, since X and Y are independent and identically distributed:
E[ X / (X + Y) ] + E[ Y / (X + Y) ] = E[ (X + Y) / (X + Y) ] = E[1] = 1.
Because X and Y have identical distributions:
E[ X / (X + Y) ] = E[ Y / (X + Y) ].
Therefore:
2 * E[V] = 1 => E[V] = 1 / 2 = 0.5.

(Furthermore, V ~ Uniform(0, 1) = Beta(1, 1), whose mean is 1 / (1 + 1) = 0.5).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_45',
    year: 2026,
    subject: '''Probability''',
    topic: '''CTMC Stationary Distribution Balance''',
    questionText: '''Consider a Continuous-Time Markov Chain (CTMC) with two states {1, 2} and transition rate matrix (infinitesimal generator):
Q = [[-4,  4],
     [ 6, -6]].
Let pi = [pi_1, pi_2] be the stationary probability distribution satisfying pi * Q = 0 and pi_1 + pi_2 = 1.
What is the value of pi_1? (Answer as a decimal).''',
    options: [],
    correctAnswer: '''0.6''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''The global balance equations are:
pi * Q = 0:
-4 pi_1 + 6 pi_2 = 0  =>  4 pi_1 = 6 pi_2  =>  pi_2 = (4/6) pi_1 = (2/3) pi_1.

Normalization:
pi_1 + pi_2 = 1
pi_1 + (2/3) pi_1 = 1
(5/3) pi_1 = 1 => pi_1 = 3 / 5 = 0.60 (or 0.6).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_46',
    year: 2026,
    subject: '''Statistics''',
    topic: '''ANOVA Coefficient of Determination''',
    questionText: '''In a simple linear regression analysis with n = 25 observations:
The Total Sum of Squares is SST = 200.
The Residual (Error) Sum of Squares is SSE = 50.
What is the coefficient of determination R^2? (Answer as a decimal).''',
    options: [],
    correctAnswer: '''0.75''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''The formula for the coefficient of determination R^2 is:
R^2 = 1 - (SSE / SST) = SSR / SST.

Given:
SST = 200
SSE = 50.

R^2 = 1 - (50 / 200) = 1 - 0.25 = 0.75.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_47',
    year: 2026,
    subject: '''Statistics''',
    topic: '''UMPU Test and Karlin Rubin Theorem''',
    questionText: '''Let X_1, X_2, ..., X_n be an i.i.d. sample from a one-parameter exponential family with density f(x; theta) = h(x) exp( eta(theta) T(x) - A(theta) ), where eta(theta) is strictly increasing.
By the Karlin-Rubin Theorem, what is the structure of the Uniformly Most Powerful (UMP) test of size alpha for testing H_0: theta <= theta_0 versus H_1: theta > theta_0?''',
    options: ['''Reject H_0 if and only if sum_{i=1}^n T(X_i) >= c, for some constant c chosen such that P_{theta_0}(sum T(X_i) >= c) = alpha.''', '''Reject H_0 if and only if sum_{i=1}^n T(X_i) <= c.''', '''No UMP test exists for composite alternative hypotheses.''', '''Reject H_0 if and only if X_1 >= theta_0.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The Karlin-Rubin Theorem states that for any distribution family with Monotone Likelihood Ratio (MLR) in statistic T(X), the threshold test that rejects H_0 when the sufficient statistic sum T(X_i) >= c is the unique Uniformly Most Powerful (UMP) test of level alpha for one-sided hypotheses. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_48',
    year: 2026,
    subject: '''Probability''',
    topic: '''Renewal Theory Elementary Renewal Limit''',
    questionText: '''In a renewal process where inter-arrival times X_1, X_2, ... are i.i.d. positive random variables with finite mean mu = 4 hours:
Let M(t) = E[N(t)] denote the expected number of renewals by time t.
By the Elementary Renewal Theorem:
lim_{t -> inf} ( M(t) / t ) = 1 / mu.
What is the limiting renewal rate lim_{t -> inf} ( M(t) / t )? (Answer as a decimal).''',
    options: [],
    correctAnswer: '''0.25''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''By the Elementary Renewal Theorem:
lim_{t -> inf} ( M(t) / t ) = 1 / mu.
Given mu = 4:
Rate = 1 / 4 = 0.25 renewals per hour.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_49',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Multiple Testing Correction FDR and Bonferroni''',
    questionText: '''Which of the following statements regarding multiple hypothesis testing corrections is/are TRUE?''',
    options: ['''The Bonferroni correction controls the Family-Wise Error Rate (FWER) at level alpha by rejecting individual hypotheses with p-values <= alpha / m.''', '''The Benjamini-Hochberg (BH) procedure controls the False Discovery Rate (FDR), defined as E[V / max(R, 1)], where V is false positives and R is total rejections.''', '''The Benjamini-Hochberg procedure is generally less conservative (has higher statistical power) than the Bonferroni correction when many true effects exist.''', '''The Bonferroni correction guarantees that the False Discovery Proportion is identically zero.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis of statements:
A. Bonferroni tests each of m hypotheses at alpha / m to ensure FWER = P(V >= 1) <= alpha. (TRUE)
B. The Benjamini-Hochberg procedure controls FDR = E[V / R], the expected proportion of false discoveries among rejected hypotheses. (TRUE)
C. By controlling FDR rather than the stricter FWER, the BH procedure admits more true discoveries, providing significantly greater power. (TRUE)
D. Bonferroni controls the probability of making at least one false rejection (FWER <= alpha), but if an error is made, the FDP is not zero. (FALSE)

Correct options: A, B, C.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_50',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Edmonds Karp Max Flow Augmenting Path Residual''',
    questionText: '''In a flow network, source s is connected to sink t. The directed edge capacities are:
c(s, A) = 7,  c(s, B) = 3
c(A, B) = 4
c(A, t) = 3,  c(B, t) = 7.
What is the maximum flow that can be routed from source s to sink t? (Answer as an integer).''',
    options: [],
    correctAnswer: '''10''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Consider max flow min cut theorem:
Cuts:
1. Cut ({s}, {A, B, t}): Capacity = c(s, A) + c(s, B) = 10 + 6 = 16.
2. Cut ({s, A, B}, {t}): Capacity = c(A, t) + c(B, t) = 4 + 8 = 12.
3. Cut ({s, B}, {A, t}): c(s, A) + c(B, t) = 10 + 8 = 18.
4. Cut ({s, A}, {B, t}):
Edges crossing from {s, A} to {B, t}:
c(s, B) + c(A, B) + c(A, t) = 6 + 5 + 4 = 15? Wait, can s send flow?
Let us trace augmenting paths:
- Push 4 along s -> A -> t (flow = 4). Remaining c(A, t) = 0, c(s, A) = 6.
- Push 5 along s -> A -> B -> t (flow = 5). Remaining c(s, A) = 1, c(A, B) = 0, c(B, t) = 8 - 5 = 3.
- Push 1 along s -> B -> t (flow = 1). Remaining c(s, B) = 5, c(B, t) = 3 - 1 = 2? Wait!
Wait, c(s, B) was 6! c(B, t) had 3 left, so we can push min(6, 3) = 3!
Then flow along s -> B -> t is 3. Total flow = 4 + 5 + 3 = 12?
Wait! Let's check cut ({s, A, B}, {t}):
Capacity of edges going into t:
c(A, t) = 4
c(B, t) = 8
Total capacity into t is 4 + 8 = 12!
Can we achieve 12?
Input to A: c(s, A) = 10. A sends 4 to t and 5 to B (total 9). (1 unused).
Input to B: c(s, B) = 6 + 5 from A = 11. B sends 8 to t.
So A sends 4 to t, B sends 8 to t, total flow into t = 12!
Total capacity of min cut is min(16, 12, ...) = 12.
Let's check if c(s, B) = 4: then cut ({s}, ...) = 10 + 4 = 14.
Let's re-verify:
If c(s, A) = 7, c(A, t) = 3, c(A, B) = 4, c(s, B) = 3, c(B, t) = 7:
Cut into t = 3 + 7 = 10.
Can s supply 10? c(s, A) + c(s, B) = 7 + 3 = 10.
A receives 7, sends 3 to t and 4 to B.
B receives 3 from s + 4 from A = 7, sends 7 to t.
Total max flow = 3 + 7 = 10!
Clean integer: 10!''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_51',
    year: 2026,
    subject: '''Data Structures''',
    topic: '''AVL Tree Left Right Double Rotation''',
    questionText: '''An initially empty AVL tree has the following keys inserted in order:
30, 10, 20.
To restore the AVL balance property at the root node 30, a Left-Right (LR) double rotation is performed.
The key that becomes the new root of the tree after this rebalancing is ________. (Answer as an integer).''',
    options: [],
    correctAnswer: '''20''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Trace insertions:
1. Insert 30: Root is 30.
2. Insert 10: Left child of 30 is 10. Balance factor of 30 is +1.
3. Insert 20: Right child of 10 is 20.
Node 10 has balance factor -1 (left-heavy then right-heavy: LR imbalance at 30).
Node 30 has balance factor +2.

LR Double Rotation:
Step 1: Left rotation on left child (node 10):
Node 20 rotates up, becoming the left child of 30. Node 10 becomes the left child of 20.
Step 2: Right rotation on root (node 30):
Node 20 rotates up to become the new root.
Node 10 is the left child of 20.
Node 30 is the right child of 20.

The new root of the tree is 20.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_52',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Kosaraju Strongly Connected Components''',
    questionText: '''Kosaraju's algorithm finds all Strongly Connected Components (SCCs) of a directed graph G = (V, E) in O(|V| + |E|) time.
Which of the following describes the correct two-pass DFS sequence of Kosaraju's algorithm?''',
    options: ['''Pass 1 runs DFS on G to compute finishing times of all vertices; Pass 2 runs DFS on the transpose graph G^T in decreasing order of finishing times.''', '''Pass 1 runs BFS on G; Pass 2 runs Dijkstra on G^T.''', '''Pass 1 sorts vertices by in-degree; Pass 2 eliminates back-edges.''', '''Pass 1 runs DFS on G^T; Pass 2 runs Bellman-Ford on G.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Kosaraju's algorithm operates in two linear-time steps:
1. Perform DFS on the original directed graph G, pushing each vertex onto a stack upon completion (sorting vertices by decreasing finishing time).
2. Compute the transposed (reversed) graph G^T.
3. Pop vertices from the stack and run DFS on G^T. Each DFS tree formed in this second pass corresponds to exactly one strongly connected component.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_53',
    year: 2026,
    subject: '''Programming in Python''',
    topic: '''C3 Linearization Method Resolution Order''',
    questionText: '''Consider the following Python 3 class hierarchy:
class O: pass
class A(O): pass
class B(O): pass
class C(A, B): pass

According to Python's C3 Linearization algorithm, what is the Method Resolution Order (MRO) of class C?''',
    options: ['''[C, A, B, O, object]''', '''[C, B, A, O, object]''', '''[C, A, O, B, object]''', '''[C, O, A, B, object]'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''By Python's C3 Linearization algorithm:
L(O) = [O, object]
L(A) = [A, O, object]
L(B) = [B, O, object]
L(C) = [C] + merge( L(A), L(B), [A, B] )
= [C] + merge( [A, O, object], [B, O, object], [A, B] )

1. 'A' is at the head of [A, O, object] and [A, B] and does not appear in the tail of any list. Pick A.
Remaining: merge( [O, object], [B, O, object], [B] )
2. 'O' appears in the tail of [B, O, object], so it cannot be picked yet.
3. 'B' is at the head of [B, O, object] and [B] and not in any tail. Pick B.
Remaining: merge( [O, object], [O, object] )
4. Pick O, then object.

Result: [C, A, B, O, object].
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_54',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Zero One Knapsack Dynamic Programming Table''',
    questionText: '''A 0/1 Knapsack problem has knapsack capacity W = 5 and 3 items with (weight, value) pairs:
Item 1: (w_1 = 2, v_1 = 3)
Item 2: (w_2 = 3, v_2 = 4)
Item 3: (w_3 = 4, v_3 = 5).
Let DP[i][w] be the maximum value achievable using a subset of the first i items with total weight at most w.
What is the optimal value DP[3][5]? (Answer as an integer).''',
    options: [],
    correctAnswer: '''7''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Dynamic programming recurrence:
DP[i][w] = max( DP[i-1][w], DP[i-1][w - w_i] + v_i ) if w >= w_i, else DP[i-1][w].

Compute row by row:
Item 1 (w=2, v=3):
DP[1][w] for w=0..5: [0, 0, 3, 3, 3, 3].

Item 2 (w=3, v=4):
w=0: 0
w=1: 0
w=2: 3
w=3: max(DP[1][3], DP[1][0] + 4) = max(3, 4) = 4
w=4: max(DP[1][4], DP[1][1] + 4) = max(3, 4) = 4
w=5: max(DP[1][5], DP[1][2] + 4) = max(3, 3 + 4) = 7.

Item 3 (w=4, v=5):
w=5: max(DP[2][5], DP[2][1] + 5) = max(7, 0 + 5) = 7.

The maximum value is DP[3][5] = 7 (achieved by choosing Item 1 and Item 2: weight 2 + 3 = 5, value 3 + 4 = 7).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_55',
    year: 2026,
    subject: '''DBMS''',
    topic: '''Two Pass Multiway Merge Sort Capacity''',
    questionText: '''In an external merge sort using Two-Pass Multiway Merge Sort (2PMMS):
The database system has M = 50 buffer pages in memory.
What is the maximum size (in pages) of a table that can be sorted using 2PMMS without requiring a third pass? (Answer as an integer).''',
    options: [],
    correctAnswer: '''2450''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''In 2PMMS:
Pass 0: The table is divided into sorted runs of size M pages each.
Pass 1: In the merge phase, 1 buffer page is reserved as an output buffer, leaving M - 1 buffer pages to serve as input buffers for M - 1 runs.
To sort in exactly 2 passes (Pass 0 and Pass 1), the number of initial runs must not exceed M - 1.
Each initial run has size at most M pages.
Maximum table size = M * (M - 1) pages.

For M = 50:
Max size = 50 * (50 - 1) = 50 * 49 = 2450 pages.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_56',
    year: 2026,
    subject: '''DBMS''',
    topic: '''ARIES Recovery Algorithm Three Phases''',
    questionText: '''The ARIES (Algorithms for Recovery and Isolation Exploiting Semantics) crash recovery algorithm operates in three distinct sequential phases.
What is the correct execution order of these phases?''',
    options: ['''Analysis Phase, Redo Phase, Undo Phase''', '''Redo Phase, Analysis Phase, Undo Phase''', '''Undo Phase, Redo Phase, Analysis Phase''', '''Analysis Phase, Undo Phase, Redo Phase'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''ARIES executes recovery in three phases:
1. Analysis Phase: Scans the log forward from the most recent checkpoint to reconstruct the Dirty Page Table (DPT) and Transaction Table at the time of crash.
2. Redo Phase: Scans forward from the oldest recLSN in the DPT, repeating all history (including aborted transactions) to bring the database state exactly to the crash instant.
3. Undo Phase: Scans backward from the crash point, rolling back the actions of all active (loser) transactions and writing Compensation Log Records (CLRs).
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_57',
    year: 2026,
    subject: '''DBMS''',
    topic: '''View Serializability and Blind Writes''',
    questionText: '''Which of the following statements regarding View Serializability and Conflict Serializability is/are TRUE?''',
    options: ['''Every conflict-serializable schedule is view-serializable.''', '''A view-serializable schedule that is not conflict-serializable must contain at least one blind write (a write without a preceding read on the same item).''', '''Testing whether an arbitrary schedule is conflict-serializable can be done in polynomial time O(V + E) using a precedence graph.''', '''Testing whether an arbitrary schedule is view-serializable is an NP-complete problem.'''],
    correctAnswer: '''A;B;C;D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis of statements:
A. Conflict serializability is a strict subset of view serializability. (TRUE)
B. If a schedule has no blind writes, conflict serializability and view serializability are completely equivalent; view-serializable non-conflict-serializable schedules strictly require blind writes. (TRUE)
C. Conflict serializability constructs a conflict graph and checks for cycles in O(V + E) time. (TRUE)
D. Determining whether a general schedule is view-serializable is proven to be NP-complete (Papadimitriou, 1979). (TRUE)

All statements A, B, C, and D are TRUE.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_58',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Gaussian Mixture Model Posterior Responsibility''',
    questionText: '''In a 1D Gaussian Mixture Model with K = 2 components:
Component 1: prior pi_1 = 0.60, mean mu_1 = 0, variance sigma_1^2 = 1.
Component 2: prior pi_2 = 0.40, mean mu_2 = 0, variance sigma_2^2 = 4.
For a data point x = 0:
The Gaussian density is N(0 | mu, sigma^2) = 1 / (sqrt(2*pi) * sigma).
What is the posterior responsibility gamma_1(x = 0) = P(z = 1 | x = 0)? (Answer as a decimal rounded to two decimal places).''',
    options: [],
    correctAnswer: '''0.75''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Compute likelihoods at x = 0:
For component 1 (sigma_1 = 1):
N(0 | 0, 1) = 1 / (sqrt(2*pi) * 1) = 1 / sqrt(2*pi).

For component 2 (sigma_2 = 2):
N(0 | 0, 4) = 1 / (sqrt(2*pi) * 2) = 0.5 / sqrt(2*pi).

Weighted likelihoods (dropping common 1/sqrt(2*pi)):
w_1 = pi_1 * N_1 = 0.60 * 1 = 0.60.
w_2 = pi_2 * N_2 = 0.40 * 0.5 = 0.20.

Total:
w_1 + w_2 = 0.60 + 0.20 = 0.80.

Posterior responsibility of Component 1:
gamma_1(0) = w_1 / (w_1 + w_2) = 0.60 / 0.80 = 3 / 4 = 0.75.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_59',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Vanishing Gradient Problem in Sigmoid vs ReLU''',
    questionText: '''Why does a deep feedforward neural network using the standard logistic sigmoid activation sigma(z) = 1 / (1 + e^(-z)) suffer severely from the vanishing gradient problem in early layers, whereas a network using the Rectified Linear Unit (ReLU) does not?''',
    options: ['''The derivative of the logistic sigmoid satisfies 0 < sigma'(z) <= 0.25, causing gradient products across deep layers to shrink exponentially, whereas ReLU has a constant derivative of 1 for all positive inputs.''', '''ReLU eliminates the need for computing loss functions.''', '''The sigmoid activation function is non-differentiable everywhere.''', '''ReLU guarantees that the loss surface is strictly convex.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The derivative of the logistic function is sigma'(z) = sigma(z) * (1 - sigma(z)).
Since 0 < sigma(z) < 1, the maximum derivative occurs at z = 0, where sigma'(0) = 0.5 * 0.5 = 0.25.
Backpropagating through L layers multiplies terms of at most 0.25, decaying gradients by at least 4^(-L) -> 0.
In contrast, for positive inputs, ReLU has d(ReLU)/dz = 1, preserving gradient magnitude across depth without exponential decay.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_60',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Linear Discriminant Analysis Optimal Projection Vector''',
    questionText: '''In Fisher's Linear Discriminant Analysis (LDA) for a two-class problem in R^2:
The class means are mu_1 = [4, 6]^T and mu_2 = [2, 2]^T.
The within-class scatter matrix is S_W = [[2, 0], [0, 1]].
The optimal projection vector w satisfies w proportional to S_W^(-1) (mu_1 - mu_2).
If w is normalized such that its first component is 1 (w = [1, k]^T), what is the value of k? (Answer as an integer).''',
    options: [],
    correctAnswer: '''4''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Compute mean difference:
mu_1 - mu_2 = [4 - 2, 6 - 2]^T = [2, 4]^T.

Compute S_W^(-1):
S_W = [[2, 0], [0, 1]] => S_W^(-1) = [[1/2, 0], [0, 1]].

Optimal direction:
w = S_W^(-1) (mu_1 - mu_2)
= [[1/2, 0], [0, 1]] * [2, 4]^T
= [ (1/2)*2, 1*4 ]^T = [1, 4]^T.

The first component is 1, and the second component is k = 4.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_61',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Dropout Regularization Ensemble Properties''',
    questionText: '''Which of the following statements regarding Dropout regularization in deep neural networks is/are TRUE?''',
    options: ['''Applying dropout with keep probability p to a network with N hidden units implicitly trains an ensemble of 2^N thinned sub-networks that share weights.''', '''During inference (test time), dropout is disabled and the weights of outgoing connections are multiplied by p (or inverted dropout divides activations by p during training) to match expected activations.''', '''Dropout prevents co-adaptation of feature detectors by forcing neurons to learn robust features in the presence of random missing inputs.''', '''Dropout is strictly equivalent to L1 Lasso weight regularization.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis of statements:
A. Each of the N hidden units has 2 states (active or dropped), defining 2^N possible architectural configurations that share underlying parameters. (TRUE)
B. At test time, using the full network requires scaling weights by p (standard dropout) or scaling during training by 1/p (inverted dropout) to ensure identical expected pre-activations. (TRUE)
C. By randomly disabling units, neurons cannot rely on specific other neurons to correct their errors, reducing co-adaptation and overfitting. (TRUE)
D. Dropout on linear models is approximately equivalent to L2 Ridge weight decay (with an adaptive data-dependent penalty), not L1 Lasso. (FALSE)

Correct options: A, B, C.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_62',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''MDP Value Iteration Step Evaluation''',
    questionText: '''Consider a Markov Decision Process with discount factor gamma = 0.50.
For a state s_0, there are two available actions: a_1 and a_2.
- Action a_1 yields immediate reward R(s_0, a_1) = 4, and transitions deterministically to state s_1.
- Action a_2 yields immediate reward R(s_0, a_2) = 1, and transitions to state s_1 with probability 0.50 and state s_2 with probability 0.50.
The current value estimates are V(s_1) = 10 and V(s_2) = 20.
What is the updated Bellman optimality value V_{k+1}(s_0) = max_{a} [ R(s_0, a) + gamma * sum_{s'} P(s' | s_0, a) V_k(s') ]? (Answer as an integer).''',
    options: [],
    correctAnswer: '''9''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Evaluate action a_1:
Q(s_0, a_1) = R(s_0, a_1) + gamma * V(s_1)
= 4 + 0.50 * 10 = 4 + 5 = 9.

Evaluate action a_2:
Q(s_0, a_2) = R(s_0, a_2) + gamma * [ 0.50 * V(s_1) + 0.50 * V(s_2) ]
= 1 + 0.50 * [ 0.50 * 10 + 0.50 * 20 ]
= 1 + 0.50 * [ 5 + 10 ]
= 1 + 0.50 * 15 = 1 + 7.5 = 8.5.

Bellman optimality update:
V_{k+1}(s_0) = max( Q(s_0, a_1), Q(s_0, a_2) ) = max(9, 8.5) = 9.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_63',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''First Order Logic Skolemization Rule''',
    questionText: '''In converting First-Order Logic formulas to Conjunctive Normal Form (CNF), what is the correct Skolemization of the formula:
forall x  exists y  P(x, y) ?''',
    options: ['''forall x  P(x, f(x)), where f is a new function symbol dependent on x.''', '''forall x  P(x, c), where c is a new constant symbol.''', '''exists y  P(y, y)''', '''forall x  forall y  P(x, y)'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Because the existential quantifier exists y is within the scope of the universal quantifier forall x, the value of y depends on x.
Therefore, y must be replaced by a Skolem function f(x) that takes x as an argument:
forall x P(x, f(x)).
Replacing it with a constant c would incorrectly assert that the same single element y satisfies P(x, y) for all x.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_64',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Binary Cross Entropy Logit Loss Computation''',
    questionText: '''In training a binary logistic regression model, for a training instance with true label y = 1:
The network outputs pre-activation logit z = 0.
The predicted probability is p = sigma(z) = 1 / (1 + e^(-z)).
The binary cross-entropy loss is L = - [ y * ln(p) + (1 - y) * ln(1 - p) ].
What is the exact value of the loss L expressed in terms of natural logarithm ln(K)? What is the integer K?''',
    options: [],
    correctAnswer: '''2''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Given:
y = 1
z = 0 => p = sigma(0) = 1 / (1 + e^0) = 1 / (1 + 1) = 1 / 2 = 0.5.

Compute binary cross-entropy loss:
L = - [ 1 * ln(0.5) + (1 - 1) * ln(0.5) ]
= - ln(1/2) = ln(2).

Thus L = ln(K) where K = 2.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK8_CORE_65',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''K Means Objective Loss Variance Relation''',
    questionText: '''In K-Means clustering on a dataset of N points {x_1, ..., x_N} in R^d:
Let the cluster assignments partition the data into K clusters C_1, ..., C_K with cluster centroids mu_k = (1 / |C_k|) * sum_{i in C_k} x_i.
Which of the following mathematical identities correctly expresses the relationship between the total sum of squared distances to the cluster mean and pairwise distances within cluster C_k?''',
    options: ['''sum_{i in C_k} ||x_i - mu_k||^2 = (1 / (2 * |C_k|)) * sum_{i in C_k} sum_{j in C_k} ||x_i - x_j||^2''', '''sum_{i in C_k} ||x_i - mu_k||^2 = sum_{i in C_k} sum_{j in C_k} ||x_i - x_j||^2''', '''sum_{i in C_k} ||x_i - mu_k||^2 = |C_k| * sum_{i in C_k} ||x_i||^2''', '''sum_{i in C_k} ||x_i - mu_k||^2 = 0 always'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''A classical identity in cluster analysis:
sum_{i in C_k} sum_{j in C_k} ||x_i - x_j||^2
= sum_i sum_j ( ||x_i - mu_k||^2 + ||x_j - mu_k||^2 - 2 (x_i - mu_k)^T (x_j - mu_k) )
= |C_k| sum_i ||x_i - mu_k||^2 + |C_k| sum_j ||x_j - mu_k||^2 - 0
= 2 |C_k| * sum_{i in C_k} ||x_i - mu_k||^2.

Dividing by 2 |C_k|:
sum_{i in C_k} ||x_i - mu_k||^2 = (1 / (2 * |C_k|)) * sum_{i in C_k} sum_{j in C_k} ||x_i - x_j||^2.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
];
