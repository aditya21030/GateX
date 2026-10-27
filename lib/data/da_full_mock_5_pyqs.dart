// AUTO-GENERATED MOCK 5 QUESTIONS (LEVEL 5: GRANDMASTER FACULTY DIFFICULTY)
import '../models/models.dart';

final List<PYQ> daFullMock5Questions = [
  PYQ(
    id: 'DA_MOCK5_GA_01',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Verbal Ability''',
    questionText: '''Choose the word that best captures the meaning of the underlined term:
"The lead architect's <u>laconic</u> response to the committee's sixty-page performance review stunned everyone in the boardroom."''',
    options: ['''Voluminous and exhaustive''', '''Concise and using very few words''', '''Deceitful and evasive''', '''Overly verbose and grandiloquent'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''"Laconic" describes a style of speech or writing that uses very few words to express a great deal; concise, terse, and pithy.
Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_GA_02',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Critical Reasoning''',
    questionText: '''An observational healthcare study reported: "Hospital patients who received expensive experimental Drug Alpha had a 20% higher mortality rate than patients who received standard palliative care. Therefore, Drug Alpha is harmful to patients and should be prohibited."
Which of the following identifies the primary methodological flaw in this argument?''',
    options: ['''It assumes that palliative care is completely ineffective.''', '''It ignores confounding by indication (confounding selection bias), where Drug Alpha was disproportionately prescribed to patients who were already in critical, end-stage condition.''', '''It fails to measure the molecular weight of Drug Alpha.''', '''It relies on double-blind randomized clinical trial protocols.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Confounding by indication occurs in non-randomized observational medical studies when doctors prescribe aggressive or experimental therapies specifically to the sickest patients whose baseline mortality risk is already much higher. Comparing crude mortality rates without controlling for disease severity severely confounds the causal inference. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_GA_03',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Combinatorics''',
    questionText: '''What is the number of non-negative integer solutions (x1, x2, x3) satisfying the equation:
x1 + x2 + x3 = 10
subject to the constraint that x1 <= 3?''',
    options: ['''28''', '''38''', '''42''', '''66'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Total non-negative integer solutions without restrictions:
C(10 + 3 - 1, 3 - 1) = C(12, 2) = (12 * 11) / 2 = 66.
Subtract invalid solutions where x1 >= 4:
Substitute x1 = y1 + 4 (y1 >= 0): y1 + x2 + x3 = 6.
Number of invalid solutions = C(6 + 3 - 1, 3 - 1) = C(8, 2) = (8 * 7) / 2 = 28.
Valid solutions satisfying x1 <= 3 = 66 - 28 = 38.
(Alternatively, direct summation: (10+1) + (9+1) + (8+1) + (7+1) = 11 + 10 + 9 + 8 = 38).
Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_GA_04',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude''',
    questionText: '''A fair coin is tossed repeatedly until two consecutive Heads (HH) appear.
What is the expected number of tosses required?''',
    options: ['''4''', '''6''', '''8''', '''10'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Let E be the expected number of tosses to reach HH from start (state 0).
Let E_H be the expected additional tosses given that the last toss was H (state 1).
From start:
- Toss Tails (prob 1/2): back to start, cost 1 + E.
- Toss Heads (prob 1/2): transition to state 1, cost 1 + E_H.
Equation 1: E = 1 + (1/2)*E + (1/2)*E_H  =>  (1/2)*E = 1 + (1/2)*E_H  =>  E = 2 + E_H.

From state 1 (having just rolled H):
- Toss Heads (prob 1/2): success! Process terminates. 1 toss.
- Toss Tails (prob 1/2): back to start, cost 1 + E.
Equation 2: E_H = 1 + (1/2)*(0) + (1/2)*E = 1 + (1/2)*E.

Substitute Equation 2 into Equation 1:
E = 2 + (1 + (1/2)*E) = 3 + (1/2)*E  =>  (1/2)*E = 3  =>  E = 6.
The expected number of tosses is 6. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_GA_05',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Spatial Aptitude''',
    questionText: '''What is the MAXIMUM number of non-overlapping regions into which a flat 2D plane can be divided by n = 5 straight lines?''',
    options: ['''15''', '''16''', '''20''', '''32'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The maximum number of regions R_n formed by n straight lines in general position (no two lines parallel, no three lines concurrent) satisfies the recurrence:
R_n = R_{n-1} + n, with base case R_0 = 1.
Closed-form formula:
R_n = 1 + n*(n + 1) / 2 (Lazy Caterer's Sequence / Central Polygonal Numbers).
For n = 5:
R_5 = 1 + 5*(6) / 2 = 1 + 15 = 16 regions.
Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_GA_06',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude''',
    questionText: '''A motorized riverboat travels 36 km downstream along a river in 3 hours, and returns 36 km upstream to the starting point in 6 hours.
Assuming the speed of the riverboat in still water and the speed of the water current remain constant, what is the speed of the water current?''',
    options: ['''2 km/h''', '''3 km/h''', '''4 km/h''', '''6 km/h'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Let boat speed in still water be v, and stream speed be c.
Downstream speed: v + c = 36 km / 3 h = 12 km/h.
Upstream speed: v - c = 36 km / 6 h = 6 km/h.
Subtracting the upstream equation from the downstream equation:
(v + c) - (v - c) = 12 - 6
2*c = 6  =>  c = 3 km/h.
The speed of the water current is 3 km/h. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_GA_07',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Cryptarithmetic & Logic''',
    questionText: '''In the classic cryptarithmetic addition puzzle where distinct letters represent distinct decimal digits from {0, 1, ..., 9} and leading digits S and M are non-zero:
  S E N D
+ M O R E
---------
M O N E Y
What is the unique digit value assigned to the letter M?''',
    options: ['''1''', '''2''', '''8''', '''9'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''In the sum of two 4-digit numbers yielding a 5-digit number:
SEND + MORE = MONEY.
The maximum possible sum of two 4-digit numbers is 9999 + 9999 = 19998.
The leftmost carry from the thousands column to the ten-thousands column can ONLY be 1.
Since M is the leading digit of MONEY, M must be 1:
M = 1.
(Continuing the derivation: S + 1 + carry >= 10 => S = 8 or 9, leading to the unique solution: 9567 + 1085 = 10652).
Therefore, M = 1. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_GA_08',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Critical Reasoning''',
    questionText: '''Consider the argument:
"If a distributed consensus protocol is Byzantine Fault Tolerant, it requires at least 3f + 1 total nodes to tolerate f arbitrary faulty nodes. Protocol Omega operates with 3f total nodes. Therefore, Protocol Omega is not Byzantine Fault Tolerant."
This argument is:''',
    options: ['''Logically invalid because it commits the fallacy of affirming the consequent.''', '''Logically valid by Modus Tollens.''', '''Logically invalid because it denies the antecedent.''', '''A circular tautology.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Let B = "Protocol is Byzantine Fault Tolerant", and N = "Protocol requires at least 3f + 1 total nodes".
Premise 1: B -> N.
Premise 2: ~N (Protocol Omega uses 3f < 3f + 1 nodes).
Conclusion: ~B (Protocol Omega is not BFT).
By the rule of Modus Tollens (~N -> ~B), the conclusion follows necessarily and validly from the premises.
Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_GA_09',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Data Interpretation & Lorenz Curve''',
    questionText: '''In an economic inequality analysis of an algorithmic platform, the cumulative proportion of wealth held by the bottom fraction p of agents is modeled by the Lorenz curve:
L(p) = p^2, for 0 <= p <= 1
The Gini Coefficient G is defined as the area between the line of perfect equality L_eq(p) = p and the Lorenz curve, normalized:
G = 2 * int_0^1 (p - L(p)) dp
What is the Gini Coefficient G for this economy?''',
    options: ['''1/6''', '''1/4''', '''1/3''', '''1/2'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Evaluate the integral:
G = 2 * int_0^1 (p - p^2) dp
  = 2 * [ p^2 / 2 - p^3 / 3 ]_0^1
  = 2 * [ 1/2 - 1/3 ]
  = 2 * [ 1/6 ] = 2 / 6 = 1 / 3 approx 0.333.
Option C is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_GA_10',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Analytical Geometry''',
    questionText: '''A point P(x, y) moves in the 2D plane such that the sum of its Euclidean distances from the two fixed points F1(-4, 0) and F2(4, 0) is constant and equal to 10.
The locus of point P is an ellipse whose equation in standard form is:''',
    options: ['''x^2 / 25 + y^2 / 9 = 1''', '''x^2 / 16 + y^2 / 9 = 1''', '''x^2 / 25 + y^2 / 16 = 1''', '''x^2 / 100 + y^2 / 64 = 1'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''By the geometric definition of an ellipse:
The sum of distances from any point P on the ellipse to the two foci F1(-c, 0) and F2(c, 0) equals 2a:
2a = 10  =>  a = 5.
Distance between foci: 2c = 8  =>  c = 4.
The semi-minor axis b satisfies:
b^2 = a^2 - c^2 = 5^2 - 4^2 = 25 - 16 = 9  =>  b = 3.
The standard equation of the ellipse is:
x^2 / a^2 + y^2 / b^2 = 1  =>  x^2 / 25 + y^2 / 9 = 1.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_11',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Cyclic Property of Trace''',
    questionText: '''Let A be an m x n real matrix and B be an n x m real matrix, with m != n.
Which of the following statements is ALWAYS TRUE?''',
    options: ['''Trace(A * B) = Trace(B * A), even though A * B is an m x m matrix and B * A is an n x n matrix.''', '''A * B and B * A have the exact same size.''', '''Trace(A * B) = 0 whenever m < n.''', '''det(A * B) = det(B * A) for all rectangular matrices A and B.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The cyclic property of the trace states that for any matrices A in R^{m x n} and B in R^{n x m}:
Trace(A * B) = sum_{i=1}^m (A * B)_{ii} = sum_{i=1}^m sum_{j=1}^n A_{ij} B_{ji}
= sum_{j=1}^n sum_{i=1}^m B_{ji} A_{ij} = sum_{j=1}^n (B * A)_{jj} = Trace(B * A).
This holds universally even though A * B is m x m and B * A is n x n.
(Note: det(A * B) != det(B * A) when m != n; in fact, the larger matrix always has determinant 0 if min(m, n) < max(m, n)).
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_12',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Commuting Matrices and Powers''',
    questionText: '''Let A and B be 2 x 2 diagonal matrices:
A = [[1, 0],
     [0, 2]]
B = [[3, 0],
     [0, 5]]
What is the TRACE of the matrix product A^2 * B? (Answer as an integer).''',
    options: [],
    correctAnswer: '''23''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Compute A^2:
A^2 = [[1^2, 0], [0, 2^2]] = [[1, 0], [0, 4]].
Now compute the product A^2 * B:
A^2 * B = [[1 * 3, 0], [0, 4 * 5]] = [[3, 0], [0, 20]].
The trace of A^2 * B is:
Trace(A^2 * B) = 3 + 20 = 23.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_13',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Schur Complement and Block Definiteness''',
    questionText: '''Let M be a real symmetric block matrix:
M = [[A,   B],
     [B^T, C]]
where A is an n x n symmetric matrix, C is an m x m symmetric matrix, and B is an n x m matrix.
Which of the following conditions is/are NECESSARY AND SUFFICIENT for M to be strictly positive definite (M > 0)? (Select all that apply)''',
    options: ['''A is positive definite (A > 0), and the Schur complement S_A = C - B^T * A^(-1) * B is positive definite (S_A > 0).''', '''C is positive definite (C > 0), and the Schur complement S_C = A - B * C^(-1) * B^T is positive definite (S_C > 0).''', '''Both A > 0 and C > 0 are necessary, but not sufficient on their own without the Schur complement condition.''', '''M is positive definite if and only if B = 0.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A and B are TRUE: By Haynsworth's inertia addition formula and block Gaussian elimination, M > 0 iff (A > 0 and C - B^T A^(-1) B > 0) OR equivalently (C > 0 and A - B C^(-1) B^T > 0).
C is TRUE: Having A > 0 and C > 0 is necessary (principal submatrices of a positive definite matrix must be positive definite), but not sufficient (e.g., if B has large entries, M can be indefinite).
D is FALSE: B does not need to be 0 for M to be positive definite (it only requires the off-diagonal coupling to be bounded by the Schur complement).
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_14',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Clairauts Theorem on Mixed Partials''',
    questionText: '''Under Clairaut's (Schwarz's) Theorem, the equality of mixed second-order partial derivatives d^2f / (dx dy) = d^2f / (dy dx) is GUARANTEED to hold at point (x_0, y_0) if:''',
    options: ['''f is continuous at (x_0, y_0)''', '''Both second-order partial derivatives d^2f / (dx dy) and d^2f / (dy dx) exist and are continuous in an open neighborhood of (x_0, y_0)''', '''f is a polynomial of degree at most 1''', '''The gradient of f is non-zero at (x_0, y_0)'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Clairaut's Theorem explicitly states that if the mixed partial derivatives d^2f/(dx dy) and d^2f/(dy dx) exist and are continuous on an open disc containing (x_0, y_0), then d^2f/(dx dy) = d^2f/(dy dx) at that point. Without continuity, counterexamples exist (such as f(x, y) = xy(x^2 - y^2)/(x^2 + y^2) at (0, 0)). Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_15',
    year: 2026,
    subject: '''Optimization''',
    topic: '''Fenchel Legendre Convex Conjugate''',
    questionText: '''The Fenchel-Legendre convex conjugate of a function f: R -> R is defined as:
f*(y) = sup_{x in R} { y * x - f(x) }.
For the quadratic function f(x) = (1/2) * 4 * x^2 = 2 * x^2:
What is the value of the conjugate function f*(y) evaluated at y = 4? (Answer as an integer).''',
    options: [],
    correctAnswer: '''2''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''To find the supremum of g(x) = y*x - 2*x^2:
Differentiate with respect to x and set to 0:
g'(x) = y - 4*x = 0  =>  x* = y / 4.
Substitute x* back into g(x):
f*(y) = y * (y / 4) - 2 * (y / 4)^2 = y^2 / 4 - 2 * (y^2 / 16) = y^2 / 4 - y^2 / 8 = y^2 / 8.
For y = 4:
f*(4) = 4^2 / 8 = 16 / 8 = 2.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_16',
    year: 2026,
    subject: '''Optimization''',
    topic: '''Subgradient and Subdifferential Properties''',
    questionText: '''Let f: R^n -> R be a convex function that is not necessarily differentiable everywhere (e.g., f(x) = ||x||_1).
Which of the following statements regarding the subdifferential partial f(x) is/are TRUE? (Select all that apply)''',
    options: ['''A vector g in R^n is a subgradient of f at x if and only if f(z) >= f(x) + g^T (z - x) for all z in R^n.''', '''The subdifferential partial f(x) is always a non-empty, closed, and convex set for any point in the relative interior of dom(f).''', '''A point x* is a global minimum of f if and only if the zero vector is in the subdifferential: 0 in partial f(x*) (Fermat's Rule).''', '''If f is differentiable at x, the subdifferential contains infinitely many distinct subgradient vectors.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: Standard definition of a subgradient.
B is TRUE: Convex analysis establishes that the subdifferential set partial f(x) is non-empty, convex, and compact (closed and bounded) on the interior of the domain.
C is TRUE: Fermat's rule for non-smooth convex optimization: 0 in partial f(x*) <=> f(z) >= f(x*) + 0^T(z - x*) = f(x*), which means x* is a global minimizer.
D is FALSE: If f is differentiable at x, the subdifferential is a SINGLETON consisting solely of the gradient vector: partial f(x) = { grad f(x) }.
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_17',
    year: 2026,
    subject: '''Probability''',
    topic: '''Memoryless Characterization''',
    questionText: '''Which continuous probability distribution on [0, infinity) is uniquely characterized by the memoryless property P(X > s + t | X > s) = P(X > t) for all s, t >= 0?''',
    options: ['''Normal distribution''', '''Exponential distribution''', '''Weibull distribution''', '''Log-Normal distribution'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''In probability theory, the Cauchy functional equation for tail probabilities G(s + t) = G(s) * G(t) has a unique continuous solution G(t) = e^(-lambda * t) on [0, inf). Therefore, the Exponential distribution is the ONLY continuous distribution that exhibits the memoryless property. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_18',
    year: 2026,
    subject: '''Probability''',
    topic: '''Poisson Thinning and Splitting''',
    questionText: '''Cosmic ray particles arrive at an orbital sensor following a Poisson process with rate lambda = 10 particles per hour.
Each arriving particle is independently classified as high-energy with probability p = 0.3, or low-energy with probability 1 - p = 0.7.
What is the EXPECTED number of high-energy particles detected during a 2-hour observation window? (Answer as an integer).''',
    options: [],
    correctAnswer: '''6''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''By the Poisson Thinning (Splitting) Theorem:
If events from a Poisson process with rate lambda are independently thinned with probability p, the resulting sub-process is also an independent Poisson process with rate:
lambda_high = lambda * p.
Given lambda = 10 per hour and p = 0.3:
lambda_high = 10 * 0.3 = 3 particles per hour.
Over a time duration t = 2 hours:
Expected number of high-energy particles = lambda_high * t = 3 * 2 = 6.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_19',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Slutskys Theorem and Convergence''',
    questionText: '''Let {X_n} and {Y_n} be sequences of random variables such that X_n converges in distribution to X (X_n ->^d X), and Y_n converges in probability to a constant c (Y_n ->^p c).
Which of the following statements is/are TRUE by Slutsky's Theorem? (Select all that apply)''',
    options: ['''X_n + Y_n converges in distribution to X + c.''', '''X_n * Y_n converges in distribution to c * X.''', '''X_n / Y_n converges in distribution to X / c, provided c != 0.''', '''X_n converges in probability to X.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A, B, and C are TRUE: These are the exact three core components of Slutsky's Theorem.
D is FALSE: Convergence in distribution (X_n ->^d X) does NOT imply convergence in probability (X_n ->^p X) unless the limit X is a degenerate constant.
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_20',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Pareto Distribution MLE''',
    questionText: '''A random sample of size n = 4 is drawn independently from a Pareto distribution with known minimum scale parameter x_m = 1 and unknown shape parameter alpha > 0, having pdf:
f(x; alpha) = alpha / x^(alpha + 1), for x >= 1
If the observed sample values yield sum_{i=1}^4 ln(x_i) = 2.0, what is the Maximum Likelihood Estimate of alpha? (Answer as an integer).''',
    options: [],
    correctAnswer: '''2''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''For a Pareto distribution with pdf f(x) = alpha * x^(-(alpha + 1)):
The likelihood function is:
L(alpha) = prod_{i=1}^n [ alpha * x_i^(-(alpha + 1)) ] = alpha^n * prod_{i=1}^n x_i^(-(alpha + 1)).
Log-likelihood:
ln L(alpha) = n * ln(alpha) - (alpha + 1) * sum_{i=1}^n ln(x_i).
Differentiating with respect to alpha and setting to zero:
d/dalpha ln L(alpha) = n / alpha - sum_{i=1}^n ln(x_i) = 0
alpha_hat_MLE = n / sum_{i=1}^n ln(x_i).
Given n = 4 and sum ln(x_i) = 2.0:
alpha_hat_MLE = 4 / 2.0 = 2.0.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_21',
    year: 2026,
    subject: '''Data Structures & Algorithms''',
    topic: '''Akra Bazzi Divide and Conquer''',
    questionText: '''Which method generalizes the Master Theorem to solve divide-and-conquer recurrences with unequal subproblem sizes, such as T(n) = T(n/3) + T(2n/3) + Theta(n)?''',
    options: ['''Akra-Bazzi Method''', '''Strassen's Algorithm''', '''Floyd-Warshall Method''', '''Eulerian Path Theorem'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The Akra-Bazzi method (1998) generalizes the Master Theorem to recurrences of the form T(x) = sum a_i T(b_i x + h_i(x)) + g(x) where partitioning fractions b_i can be unequal (such as n/3 and 2n/3). Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_22',
    year: 2026,
    subject: '''Data Structures & Algorithms''',
    topic: '''Complete Ternary Tree Leaves''',
    questionText: '''A complete ternary tree is a tree where every internal node has EXACTLY 3 children, and all leaves are at the exact same depth h = 3 (where the root node is at depth 0).
How many LEAF NODES does this tree contain?''',
    options: [],
    correctAnswer: '''27''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''In a complete k-ary tree of height h:
The root is at depth 0 (3^0 = 1 node).
Depth 1 contains 3^1 = 3 nodes.
Depth 2 contains 3^2 = 9 nodes.
Depth 3 contains 3^3 = 27 nodes.
Since all leaves are at depth 3, the number of leaf nodes is 3^3 = 27.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_23',
    year: 2026,
    subject: '''Data Structures & Algorithms''',
    topic: '''DAG Topological Sort Uniqueness''',
    questionText: '''Which of the following statements regarding Directed Acyclic Graphs (DAGs) is/are TRUE? (Select all that apply)''',
    options: ['''A DAG possesses a UNIQUE topological ordering if and only if it contains a directed Hamiltonian path.''', '''Every finite DAG contains at least one vertex with in-degree zero (source) and at least one vertex with out-degree zero (sink).''', '''Single-source shortest paths on a DAG with arbitrary (positive or negative) edge weights can be found in O(V + E) time using topological sorting.''', '''If a directed graph contains a cycle of length 2, it can still admit a topological ordering.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: A unique topological sort requires that for every adjacent pair (u, v) in the order, there is a directed edge (u, v), which forms a Hamiltonian path.
B is TRUE: A finite graph with no cycles must have a source and a sink; otherwise, following incoming/outgoing edges endlessly would form a cycle.
C is TRUE: Relaxing edges in topological order solves shortest paths in linear O(V + E) time regardless of negative edge weights.
D is FALSE: A topological ordering requires that for every directed edge (u, v), u comes before v. A cycle (u -> v -> u) requires u < v and v < u, which is impossible.
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_24',
    year: 2026,
    subject: '''Programming & Python''',
    topic: '''Nonlocal vs Global Scoping''',
    questionText: '''Consider the following Python code snippet:
def outer():
    x = 10
    def inner():
        nonlocal x
        x = 20
    inner()
    return x

What does `outer()` return?''',
    options: ['''10''', '''20''', '''None''', '''Raises UnboundLocalError'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The `nonlocal` keyword binds the identifier `x` to the nearest enclosing scope (excluding global), which is the `x` in `outer`.
Inside `inner()`, modifying `x = 20` directly mutates the `x` in `outer`.
When `inner()` finishes, `outer` returns `x`, which now has the updated value 20. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_25',
    year: 2026,
    subject: '''Database Management Systems''',
    topic: '''Chase Algorithm and Lossless Joins''',
    questionText: '''The Chase Algorithm is an algorithmic tableau method used in relational database theory primarily to test for:''',
    options: ['''Deadlock detection in multi-threaded transaction logs''', '''Lossless-join property of a schema decomposition with respect to a set of functional and join dependencies''', '''Hash index collision rates in B+ trees''', '''Cost estimation of physical disk page buffer allocation'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The Chase Algorithm operates on a tableau representing decomposed relations. By repeatedly applying functional and multivalued dependencies (chasing equal symbols until a row of all unsubscripted symbols appears), it formally proves whether a decomposition satisfies the Lossless-Join property. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_26',
    year: 2026,
    subject: '''Database Management Systems''',
    topic: '''Inclusion Dependencies and Referential Integrity''',
    questionText: '''In relational database theory, a referential integrity constraint asserting that every value appearing in column Foreign_Key of table Child must also appear in column Primary_Key of table Parent is an instance of:''',
    options: ['''Functional Dependency''', '''Inclusion Dependency''', '''Multivalued Dependency''', '''Join Dependency'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''An inclusion dependency takes the form R[X] subseteq S[Y], asserting that the projection of relation R on attributes X is a subset of the projection of relation S on attributes Y. Foreign key referential integrity constraints are the fundamental real-world application of inclusion dependencies. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_27',
    year: 2026,
    subject: '''Database Management Systems''',
    topic: '''B Tree vs B Plus Tree''',
    questionText: '''Which of the following statements comparing B-Trees and B+ Trees is/are TRUE? (Select all that apply)''',
    options: ['''In a B-Tree, search keys and actual data record pointers are stored in both internal nodes and leaf nodes.''', '''In a B+ Tree, internal nodes store only search keys and child block pointers, while all data record pointers are stored strictly in the leaf nodes.''', '''B+ Trees link leaf nodes sequentially via sibling pointers, making range queries (e.g., BETWEEN 10 AND 100) significantly more efficient than in standard B-Trees.''', '''Because internal nodes in a B+ Tree do not store record pointers, their fan-out is higher, resulting in a shallower tree height.'''],
    correctAnswer: '''A;B;C;D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: In standard B-Trees, data pointers can reside at any level, enabling early termination if a key is found near the root.
B is TRUE: B+ Trees segregate indexing from data storage; internal nodes are purely navigational routers.
C is TRUE: Leaf sibling pointers turn the leaf level into a sorted linked list, allowing range scans without traversing back up through ancestor nodes.
D is TRUE: Omitting record pointers in internal nodes saves space, packing more child pointers per block (higher fan-out), producing fewer levels.
All four statements A, B, C, D are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_28',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''VC Dimension of Homogeneous Hyperplanes''',
    questionText: '''The Vapnik-Chervonenkis (VC) dimension of homogeneous linear classifiers (hyperplanes passing strictly through the origin, w^T x = 0 with no bias term b) in R^d is equal to:''',
    options: ['''d - 1''', '''d''', '''d + 1''', '''2^d'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''A general affine hyperplane (w^T x + b = 0) has d + 1 free parameters and VC dimension d + 1.
When the hyperplane is constrained to pass through the origin (b = 0), it loses one degree of freedom. It can shatter at most d linearly independent points in R^d. Thus its VC dimension is exactly d. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_29',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Cosine Similarity Calculation''',
    questionText: '''Two document term vectors are represented in a 2-dimensional vocabulary space as u = [3, 4]^T and v = [4, 3]^T.
The Cosine Similarity between u and v, defined as (u . v) / (||u||_2 * ||v||_2), is ________. (Round off to 2 decimal places).''',
    options: [],
    correctAnswer: '''0.96''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Compute inner product:
u . v = (3 * 4) + (4 * 3) = 12 + 12 = 24.
Compute Euclidean norms:
||u||_2 = sqrt(3^2 + 4^2) = sqrt(25) = 5.
||v||_2 = sqrt(4^2 + 3^2) = sqrt(25) = 5.
Cosine Similarity = (u . v) / (||u||_2 * ||v||_2) = 24 / (5 * 5) = 24 / 25 = 0.96.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_30',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''MAP Estimation and Regularization Priors''',
    questionText: '''Which of the following statements establishing the Bayesian interpretation of regularization in linear/logistic regression is/are TRUE? (Select all that apply)''',
    options: ['''Maximum A Posteriori (MAP) estimation with a zero-mean Gaussian prior p(w) proportional to exp(- (lambda / 2) * ||w||_2^2) is mathematically equivalent to L2 (Ridge) regularization.''', '''Maximum A Posteriori (MAP) estimation with an independent Laplace (double exponential) prior p(w) proportional to exp(- lambda * ||w||_1) is mathematically equivalent to L1 (Lasso) regularization.''', '''Maximum Likelihood Estimation (MLE) corresponds to MAP estimation under a uniform (uninformative flat) prior.''', '''L1 regularization induces sparsity because the Gaussian prior density has infinite variance at the origin.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: -ln p(w | D) = -ln p(D | w) - ln p(w). For Gaussian prior, -ln p(w) = (lambda / 2) ||w||_2^2 + const (L2 penalty).
B is TRUE: For Laplace prior, -ln p(w) = lambda ||w||_1 + const (L1 penalty).
C is TRUE: When p(w) is uniform (constant), -ln p(w) is constant, so argmax_w p(w|D) = argmax_w p(D|w) (standard MLE).
D is FALSE: The Laplace prior (not Gaussian) has a sharp cusp (non-differentiable peak) at zero, which places high prior probability mass along coordinate axes.
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_31',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Random Forest Immunity to Infinite Trees Overfitting''',
    questionText: '''Why does adding an arbitrarily large number of trees (e.g., T -> infinity) to a Random Forest NOT cause it to overfit the training dataset?''',
    options: ['''Because each tree is constrained to depth 1 (decision stump).''', '''Because by the Strong Law of Large Numbers, the average prediction of T randomized trees converges almost surely to the expected prediction E_Theta[h(x; Theta)], placing an upper bound on generalization error.''', '''Because gradient descent shrinks the weights of older trees to zero.''', '''Because the tree leaves are forced to share a single global bias term.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Leo Breiman (2001) proved via the Strong Law of Large Numbers that as the number of trees T -> inf, the ensemble error converges to a finite bound: PE* = P_{X, Y}(P_Theta(h(X, Theta) = Y) - max_{j != Y} P_Theta(h(X, Theta) = j) < 0). Adding more trees reduces variance without increasing generalization error; it cannot cause overfitting. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_32',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''Genetic Algorithm Single Point Crossover''',
    questionText: '''In a genetic algorithm, two 6-bit binary parent chromosomes are:
Parent 1: [1, 1, 0, 0, 1, 1]
Parent 2: [0, 0, 1, 1, 0, 0]
A single-point crossover occurs after bit position 2 (splitting after the first 2 bits).
What is the decimal integer value of Child 1 (formed by taking the first 2 bits of Parent 1 concatenated with the remaining 4 bits of Parent 2), interpreting the bits as an unsigned binary integer with the leftmost bit as the most significant bit?''',
    options: [],
    correctAnswer: '''60''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''First 2 bits of Parent 1: [1, 1].
Remaining 4 bits of Parent 2: [1, 1, 0, 0].
Concatenated Child 1: [1, 1, 1, 1, 0, 0].
Converting binary 111100 to decimal:
(1 * 2^5) + (1 * 2^4) + (1 * 2^3) + (1 * 2^2) + (0 * 2^1) + (0 * 2^0)
= 32 + 16 + 8 + 4 + 0 + 0 = 60.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_33',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''Herbrands Theorem and FOL Resolution''',
    questionText: '''Which of the following statements regarding First-Order Logic theorem proving and Herbrand's Theorem is/are TRUE? (Select all that apply)''',
    options: ['''Herbrand's Theorem states that an unsatisfiable set of first-order clauses has a finite unsatisfiable set of ground instances.''', '''Robinson's Resolution Principle eliminates the need to exhaustively generate ground instances by unifying literals dynamically with the Most General Unifier (MGU).''', '''First-Order Logic is semi-decidable: if a formula is valid (or unsatisfiable in refutation), resolution is guaranteed to terminate in finite steps with a contradiction; but if it is invalid, resolution may run indefinitely.''', '''Monadic first-order logic (predicates with only one argument) is strictly undecidable.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: Herbrand's fundamental theorem links first-order unsatisfiability to propositional unsatisfiability of finite ground instances.
B is TRUE: Robinson (1965) unified terms directly with variables via MGU, avoiding Herbrand ground expansion.
C is TRUE: Church and Turing (1936) proved FOL is semi-decidable (entailment is recursively enumerable, but not decidable).
D is FALSE: Löwenheim (1915) proved that Monadic Predicate Calculus (predicates of arity 1) is DECIDABLE.
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_34',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''Iterative Deepening A Star Memory''',
    questionText: '''What is the primary motivation for using Iterative Deepening A* (IDA*) over standard A* search in large state spaces?''',
    options: ['''IDA* eliminates the need for an admissible heuristic function.''', '''IDA* uses only O(b * d) linear memory (where b is the branching factor and d is the solution depth), avoiding the exponential memory bottleneck of A*'s OPEN list.''', '''IDA* is guaranteed to expand fewer nodes than A* on all graphs.''', '''IDA* operates only on directed acyclic graphs.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Standard A* keeps all generated nodes in memory (in OPEN and CLOSED lists), requiring O(b^d) exponential memory, which quickly exhausts RAM. IDA* uses depth-first search with an f-cost threshold cutoff, requiring memory proportional only to the current search path, which is O(b * d) linear memory. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_35',
    year: 2026,
    subject: '''Probability''',
    topic: '''Coupon Collector Problem Expectation''',
    questionText: '''A cereal manufacturer places one of N = 3 distinct collectible superhero cards uniformly at random in each box of cereal.
What is the EXPECTED number of cereal boxes a collector must purchase to collect all 3 distinct cards? (Round off to 1 decimal place).''',
    options: [],
    correctAnswer: '''5.5''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''By the Coupon Collector's Theorem:
Let T be the number of boxes purchased to collect all N distinct coupons.
Let X_i be the number of boxes bought to collect the i-th new coupon after having collected i - 1 coupons.
The probability of getting a new coupon on each purchase is p_i = (N - (i - 1)) / N.
Since X_i follows a Geometric distribution with parameter p_i:
E[X_i] = 1 / p_i = N / (N - i + 1).
Total expected boxes:
E[T] = sum_{i=1}^N E[X_i] = N * sum_{i=1}^N (1 / i) = N * (1/1 + 1/2 + 1/3 + ... + 1/N).
For N = 3:
E[T] = 3 * (1/1 + 1/2 + 1/3) = 3 * (6/6 + 3/6 + 2/6) = 3 * (11 / 6) = 33 / 6 = 11 / 2 = 5.5 boxes.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_36',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Ill Conditioned Matrix Condition Number''',
    questionText: '''Consider the 2 x 2 matrix:
A = [[1.0, 1.0  ],
     [1.0, 1.001]]
Let ||A||_infinity denote the maximum absolute row sum norm: ||A||_infinity = max_i sum_j |A_{ij}|.
The condition number of matrix A with respect to the infinity norm, kappa_infinity(A) = ||A||_infinity * ||A^(-1)||_infinity, rounded off to the nearest integer, is ________.''',
    options: [],
    correctAnswer: '''4004''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Compute determinant:
det(A) = 1.0 * 1.001 - 1.0 * 1.0 = 0.001 = 10^(-3).
Inverse matrix:
A^(-1) = (1 / 0.001) * [[ 1.001, -1.0  ],
                        [-1.0,    1.0  ]]
       = [[ 1001, -1000],
          [-1000,  1000]].
Row sum norms:
Row 1 of A: 1.0 + 1.0 = 2.0.
Row 2 of A: 1.0 + 1.001 = 2.001.
||A||_infinity = 2.001.

Row 1 of A^(-1): |1001| + |-1000| = 2001.
Row 2 of A^(-1): |-1000| + |1000| = 2000.
||A^(-1)||_infinity = 2001.

Condition number:
kappa_infinity(A) = ||A||_infinity * ||A^(-1)||_infinity
                 = 2.001 * 2001 = 4004.001.
Rounding to the nearest integer gives 4004.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_37',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Polar Decomposition and Square Roots''',
    questionText: '''Let A be an n x n invertible real matrix. The Polar Decomposition theorem asserts that A can be uniquely factored as:
A = U * P
where U is an orthogonal matrix and P is a symmetric positive definite matrix.
Which of the following statements is/are TRUE? (Select all that apply)''',
    options: ['''The symmetric positive definite factor P is uniquely given by the matrix square root P = sqrt(A^T * A).''', '''The orthogonal factor U is given by U = A * P^(-1).''', '''The eigenvalues of P are the singular values of matrix A.''', '''If A is symmetric, then U is always the identity matrix I_n.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: P^2 = (U P)^T (U P) = P^T U^T U P = P I P = P^2 = A^T A, so P is the unique positive definite square root of A^T A.
B is TRUE: Since P is invertible, multiplying A = U P on the right by P^(-1) yields U = A P^(-1).
C is TRUE: Since P = sqrt(A^T A), the eigenvalues of P are sqrt(lambda_i(A^T A)) = sigma_i(A) (the singular values of A).
D is FALSE: If A is symmetric but has negative eigenvalues, U must have diagonal entries of -1 to flip the signs, so U is NOT the identity matrix (e.g., A = -I => P = I and U = -I).
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_38',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Kronecker Product Spectrum''',
    questionText: '''Let A be a 2 x 2 matrix with eigenvalues {2, 3}, and let B be a 2 x 2 matrix with eigenvalues {4, 5}.
What are the eigenvalues of the 4 x 4 Kronecker product matrix A (x) B?''',
    options: ['''{6, 7, 7, 8}''', '''{8, 10, 12, 15}''', '''{2, 3, 4, 5}''', '''{16, 20, 24, 30}'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''By the spectral property of the Kronecker (tensor) product:
If lambda_i are the eigenvalues of A (with eigenvectors u_i) and mu_j are the eigenvalues of B (with eigenvectors v_j), then:
(A (x) B)(u_i (x) v_j) = (A u_i) (x) (B v_j) = (lambda_i u_i) (x) (mu_j v_j) = (lambda_i * mu_j) (u_i (x) v_j).
Therefore, the eigenvalues of A (x) B are the pairwise products lambda_i * mu_j for all i, j:
- 2 * 4 = 8
- 2 * 5 = 10
- 3 * 4 = 12
- 3 * 5 = 15
The eigenvalues are {8, 10, 12, 15}. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_39',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Divergence Theorem Spherical Volume Integral''',
    questionText: '''Let S be the surface of the unit sphere x^2 + y^2 + z^2 = 1 oriented outward, and let F be the vector field:
F(x, y, z) = x^3 i + y^3 j + z^3 k
By the Gauss Divergence Theorem, the outward flux iint_S F . n dS is equal to k * pi.
What is the value of constant k? (Round off to 1 decimal place).''',
    options: [],
    correctAnswer: '''2.4''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''By the Divergence Theorem:
iint_S F . n dS = iiint_V (div F) dV,
where V is the solid unit ball x^2 + y^2 + z^2 <= 1.
Compute divergence:
div F = d/dx(x^3) + d/dy(y^3) + d/dz(z^3) = 3*x^2 + 3*y^2 + 3*z^2 = 3*(x^2 + y^2 + z^2).
Converting to spherical coordinates (where x^2 + y^2 + z^2 = r^2 and dV = r^2 sin(phi) dr dphi dtheta):
iiint_V 3*r^2 dV = 3 * int_0^{2*pi} dtheta * int_0^pi sin(phi) dphi * int_0^1 r^4 dr
= 3 * (2*pi) * [ -cos(phi) ]_0^pi * [ r^5 / 5 ]_0^1
= 3 * (2*pi) * (2) * (1 / 5)
= 12 * pi / 5 = 2.4 * pi.
The constant k is 12 / 5 = 2.4.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_40',
    year: 2026,
    subject: '''Optimization''',
    topic: '''Multidimensional Newton Raphson Step''',
    questionText: '''Consider minimizing f(x1, x2) = 2*x1^2 + x2^2 - x1*x2 using Newton's optimization method:
x_{k+1} = x_k - (nabla^2 f(x_k))^(-1) * nabla f(x_k).
Starting from initial point x_0 = [2.0, 2.0]^T:
What is the value of coordinate x1 at iteration 1 (i.e., (x_1)_1)? (Answer as an integer).''',
    options: [],
    correctAnswer: '''0''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Gradient:
df/dx1 = 4*x1 - x2.
df/dx2 = 2*x2 - x1.
At x_0 = [2, 2]^T:
df/dx1 = 4(2) - 2 = 6.
df/dx2 = 2(2) - 2 = 2.
nabla f(x_0) = [6, 2]^T.

Hessian matrix:
H = [[d^2f/dx1^2, d^2f/dx1dx2], [d^2f/dx2dx1, d^2f/dx2^2]] = [[4, -1], [-1, 2]].
det(H) = 4*2 - (-1)^2 = 8 - 1 = 7.
H^(-1) = (1 / 7) * [[2, 1], [1, 4]].

Newton step:
Delta x = - H^(-1) * nabla f(x_0)
        = - (1 / 7) * [[2, 1], [1, 4]] * [[6], [2]]
        = - (1 / 7) * [[2*6 + 1*2], [1*6 + 4*2]]
        = - (1 / 7) * [[14], [14]]
        = - [[2], [2]].
Next iterate:
x_1 = x_0 + Delta x = [2, 2]^T - [2, 2]^T = [0, 0]^T.
Since f is a strictly convex quadratic, Newton's method reaches the exact global minimum [0, 0]^T in a single step!
Thus (x_1)_1 = 0.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_41',
    year: 2026,
    subject: '''Optimization''',
    topic: '''Barzilai Borwein Two Point Step Size''',
    questionText: '''Which of the following statements regarding the Barzilai-Borwein (BB) gradient descent method is/are TRUE? (Select all that apply)''',
    options: ['''The BB step size is derived by approximating the inverse Hessian through a secant equation s_k approx alpha_k * y_k, where s_k = x_k - x_{k-1} and y_k = grad f(x_k) - grad f(x_{k-1}).''', '''BB gradient descent is a non-monotonic method (the objective function value f(x_k) can temporarily increase at certain iterations).''', '''Despite being non-monotonic, BB gradient descent converges R-linearly on strictly convex quadratic functions.''', '''The BB method requires computing and inverting the full n x n Hessian matrix at every step.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: Barzilai and Borwein (1988) derived two step sizes: alpha_1 = (s^T s)/(s^T y) and alpha_2 = (s^T y)/(y^T y) by least-squares fitting of the quasi-Newton secant equation.
B is TRUE: Unlike exact line search, BB step size often produces non-monotonic oscillations that allow escaping narrow ravines rapidly.
C is TRUE: Raydan (1993) proved global R-linear convergence of BB on positive definite quadratic functions.
D is FALSE: The BB method uses ONLY gradient differences; it never computes or stores any Hessian matrices (it is a first-order method).
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_42',
    year: 2026,
    subject: '''Probability''',
    topic: '''Continuous Time Markov Chain Generator''',
    questionText: '''A continuous-time Markov chain has state space {1, 2} and infinitesimal transition rate matrix (Q-matrix):
Q = [[-2,  2],
     [ 4, -4]]
The stationary probability distribution vector pi = [pi_1, pi_2] satisfies pi * Q = 0 and pi_1 + pi_2 = 1.
What is the stationary probability pi_1? (Round off to 2 decimal places).''',
    options: [],
    correctAnswer: '''0.67''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''The steady-state balance equation is pi * Q = 0:
[pi_1, pi_2] * [[-2, 2], [4, -4]] = [0, 0].
From the first column:
-2 * pi_1 + 4 * pi_2 = 0  =>  2 * pi_1 = 4 * pi_2  =>  pi_1 = 2 * pi_2.
Substitute into normalization equation:
pi_1 + pi_2 = 1
2 * pi_2 + pi_2 = 1  =>  3 * pi_2 = 1  =>  pi_2 = 1 / 3.
pi_1 = 2 * (1 / 3) = 2 / 3 approx 0.6666...
Rounding to 2 decimal places gives 0.67.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_43',
    year: 2026,
    subject: '''Probability''',
    topic: '''Cauchy Distribution CLT Failure''',
    questionText: '''Let X_1, X_2, ..., X_n be independent random variables drawn from a standard Cauchy distribution with characteristic function phi(t) = e^(-|t|).
What is the distribution of the sample mean X_bar_n = (1 / n) * sum_{i=1}^n X_i?''',
    options: ['''Standard Normal distribution N(0, 1) by Central Limit Theorem''', '''Standard Cauchy distribution with the exact same characteristic function phi(t) = e^(-|t|)''', '''Degenerate distribution at 0 by Law of Large Numbers''', '''Student-t distribution with n degrees of freedom'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''By properties of characteristic functions:
phi_{X_bar_n}(t) = E[e^(i * t * (1/n) sum X_j)] = prod_{j=1}^n phi(t / n) = [ e^(-|t / n|) ]^n = e^(- n * (|t| / n)) = e^(-|t|).
The sample mean has the EXACT same characteristic function as a single standard Cauchy variable, meaning X_bar_n has the exact same Cauchy distribution for ANY sample size n!
The Central Limit Theorem fails because the Cauchy distribution has undefined mean and infinite variance. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_44',
    year: 2026,
    subject: '''Probability''',
    topic: '''Bivariate Joint Expectation on Triangular Domain''',
    questionText: '''Let continuous random variables X and Y have joint probability density function:
f_{X,Y}(x, y) = 8*x*y, for 0 <= y <= x <= 1, and 0 otherwise.
What is the expectation E[X * Y]? (Round off to 2 decimal places).''',
    options: [],
    correctAnswer: '''0.44''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''E[X * Y] = iint_D (x * y) * (8 * x * y) dx dy = 8 * iint_D x^2 * y^2 dx dy
where D is defined by 0 <= x <= 1 and 0 <= y <= x.
Evaluate inner integral with respect to y:
int_0^x y^2 dy = [ y^3 / 3 ]_0^x = x^3 / 3.
Now evaluate outer integral with respect to x:
E[X * Y] = 8 * int_0^1 x^2 * (x^3 / 3) dx
         = (8 / 3) * int_0^1 x^5 dx
         = (8 / 3) * [ x^6 / 6 ]_0^1
         = (8 / 3) * (1 / 6) = 8 / 18 = 4 / 9 approx 0.4444...
Rounding to 2 decimal places yields 0.44.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_45',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Wilks Theorem and Deviance''',
    questionText: '''Which of the following statements regarding the Generalized Likelihood Ratio Test and Wilks' Theorem is/are TRUE? (Select all that apply)''',
    options: ['''Under standard regularity conditions, if null model M_0 with p parameters is nested within alternative model M_1 with q parameters (q > p), the test statistic Lambda = - 2 * ln(L_0 / L_1) converges in distribution to a Chi-Square distribution chi^2_r as sample size n -> infinity.''', '''The asymptotic degrees of freedom r of the Chi-Square distribution in Wilks' theorem is r = q - p (the difference in the number of freely estimated parameters).''', '''Wilks' Theorem holds even when the true parameter lies strictly on the boundary of the parameter space.''', '''The Likelihood Ratio statistic Lambda is invariant to smooth, one-to-one reparameterizations of the models.'''],
    correctAnswer: '''A;B;D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: Wilks' Theorem (1938) proves that -2 ln(L_0 / L_1) ->^d chi^2_{q - p}.
B is TRUE: The degrees of freedom is the difference in dimensionality of parameter manifolds: dim(Theta_1) - dim(Theta_0) = q - p.
C is FALSE: Chernoff (1954) demonstrated that when the parameter lies on the boundary of the parameter space, the asymptotic distribution is a mixture of chi-square distributions (chi-bar-squared), violating Wilks' theorem.
D is TRUE: The maximum value of the likelihood is invariant under any invertible change of variables theta <-> psi.
Thus A, B, and D are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_46',
    year: 2026,
    subject: '''Statistics''',
    topic: '''F Test Degrees of Freedom for Variances''',
    questionText: '''To test the null hypothesis H_0: sigma_1^2 = sigma_2^2 against H_1: sigma_1^2 > sigma_2^2 for two independent normal populations, an F-test is conducted using sample sizes n_1 = 11 and n_2 = 16:
F = s_1^2 / s_2^2.
What is the NUMERATOR degrees of freedom for this F-statistic? (Answer as an integer).''',
    options: [],
    correctAnswer: '''10''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''The F-statistic is the ratio of two independent chi-square variables divided by their respective degrees of freedom:
F = ( (n_1 - 1) s_1^2 / sigma_1^2 / (n_1 - 1) ) / ( (n_2 - 1) s_2^2 / sigma_2^2 / (n_2 - 1) ) ~ F(nu_1, nu_2).
Numerator degrees of freedom:
nu_1 = n_1 - 1 = 11 - 1 = 10.
(Denominator degrees of freedom is nu_2 = n_2 - 1 = 16 - 1 = 15).
Numerator degrees of freedom = 10.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_47',
    year: 2026,
    subject: '''Data Structures & Algorithms''',
    topic: '''Johnsons Reweighting All Pairs Shortest Paths''',
    questionText: '''Johnson's algorithm solves the All-Pairs Shortest Path problem on a sparse directed graph with negative edge weights (but no negative-weight cycles) by using edge reweighting.
Given edge weight w(u, v) and potential vertex heights h(u), h(v) computed via Bellman-Ford, what is the reweighted edge weight w_hat(u, v)?''',
    options: ['''w_hat(u, v) = w(u, v) + h(u) - h(v)''', '''w_hat(u, v) = w(u, v) + h(v) - h(u)''', '''w_hat(u, v) = w(u, v) * (h(u) / h(v))''', '''w_hat(u, v) = |w(u, v)| + h(u) + h(v)'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Johnson's algorithm uses the potential function h(v) = delta(s, v) from an added auxiliary source s.
By triangle inequality: delta(s, v) <= delta(s, u) + w(u, v) => h(v) <= h(u) + w(u, v).
Rearranging gives:
w_hat(u, v) = w(u, v) + h(u) - h(v) >= 0.
This guarantees all reweighted edges are non-negative, allowing Dijkstra's algorithm to be safely run from every vertex in O(V^2 log V + V E) time. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_48',
    year: 2026,
    subject: '''Data Structures & Algorithms''',
    topic: '''Bipartite Matching Hopcroft Karp''',
    questionText: '''Consider a bipartite graph G = (L U R, E) where L = {u1, u2, u3} and R = {v1, v2, v3}.
The edges are:
(u1, v1), (u1, v2), (u2, v1), (u2, v2), (u3, v1), (u3, v2).
Notice no edges connect any vertex in L to v3.
What is the MAXIMUM cardinality of a matching in graph G?''',
    options: [],
    correctAnswer: '''2''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''All edges in the graph connect vertices in L = {u1, u2, u3} ONLY to the subset {v1, v2} of R.
By Hall's Marriage Theorem (or simple pigeonhole principle):
Any matching can match each edge to at most one vertex in {v1, v2}.
Since there are only 2 vertices in the neighborhood N(L) = {v1, v2}, at most 2 edges can be chosen without sharing a vertex in R.
For example, M = {(u1, v1), (u2, v2)} is a valid matching of size 2.
No matching of size 3 can exist because vertex v3 has degree 0.
Maximum matching size = 2.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_49',
    year: 2026,
    subject: '''Data Structures & Algorithms''',
    topic: '''Tarjan DSU Inverse Ackermann''',
    questionText: '''Which of the following statements regarding Disjoint Set Union (Union-Find) data structures is/are TRUE? (Select all that apply)''',
    options: ['''Using ONLY Path Compression without Union-by-Rank achieves worst-case time complexity O(m * log n) for m operations on n elements.''', '''Using BOTH Union-by-Rank and Path Compression achieves amortized time complexity O(m * alpha(n)), where alpha is the extremely slow-growing inverse Ackermann function.''', '''For all practical purposes on Earth (n < 10^80), alpha(n) <= 4.''', '''Using ONLY Union-by-Rank without Path Compression yields a tree whose maximum height is strictly bounded by O(log n).'''],
    correctAnswer: '''A;B;C;D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: Tarjan and van Leeuwen (1984) proved path compression alone yields O(m log_{1 + m/n} n).
B is TRUE: Robert Tarjan's landmark 1975 result established the tight Theta(m alpha(n)) bound.
C is TRUE: A(4, 4) is a tower of 2s of height 65536, far exceeding the number of atoms in the observable universe (~10^80), so alpha(n) <= 4 for all practical inputs.
D is TRUE: Union-by-rank doubles tree size at each increase of rank, guaranteeing max depth <= floor(log_2 n).
All four statements A, B, C, D are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_50',
    year: 2026,
    subject: '''Programming & Python''',
    topic: '''LRU Cache and Unhashable Types''',
    questionText: '''Consider the following Python code snippet:
from functools import lru_cache

@lru_cache(maxsize=32)
def process_data(records):
    return sum(records)

print(process_data([1, 2, 3]))

What happens when this code is executed?''',
    options: ['''It prints 6 without error.''', '''It raises TypeError: unhashable type: 'list' because lru_cache uses a dictionary internally requiring all function arguments to be hashable.''', '''It raises AttributeError: 'lru_cache' object has no attribute 'maxsize'.''', '''It prints None.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''`functools.lru_cache` wraps function execution by caching arguments and return values in an internal Python hash dictionary.
Dictionary keys in Python must be hashable (implementing `__hash__`).
Lists in Python are mutable and explicitly unhashable (`list.__hash__ = None`).
Passing a list `[1, 2, 3]` as an argument immediately raises `TypeError: unhashable type: 'list'`.
(To cache such calls, one must pass an immutable tuple `(1, 2, 3)` instead).
Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_51',
    year: 2026,
    subject: '''Database Management Systems''',
    topic: '''Index Scan vs Table Scan Threshold''',
    questionText: '''A table contains N = 100,000 unclustered tuples stored across 2,000 disk blocks (50 tuples/block).
A secondary B+ tree index exists on column Department.
Each tree index lookup takes 3 disk I/Os to find the leaf, and retrieving each matching tuple from the unclustered table takes 1 random disk I/O in the worst case.
A full sequential table scan reads all 2,000 blocks sequentially.
At what fraction f of matching tuples does the full table scan become FASTER than the unclustered index scan?''',
    options: ['''f > 0.02 (2% of tuples)''', '''f > 0.10 (10% of tuples)''', '''f > 0.20 (20% of tuples)''', '''f > 0.50 (50% of tuples)'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Cost of unclustered secondary index scan for k matching tuples:
Cost_index approx 3 (tree traversal) + k * 1 (random block I/O per record) approx k I/Os.
Cost of full sequential table scan:
Cost_scan = 2,000 disk block I/Os.
Full table scan becomes cheaper when:
Cost_index > Cost_scan  =>  k > 2,000 tuples.
As a fraction of total tuples N = 100,000:
f = k / N = 2,000 / 100,000 = 0.02 (2%).
When more than 2% of the records match, the unclustered random I/O overhead exceeds the sequential scan cost. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_52',
    year: 2026,
    subject: '''Database Management Systems''',
    topic: '''Multiple Granularity Locking Compatibility''',
    questionText: '''In Multi-Granularity Locking (MGL) protocols with Intent Shared (IS), Intent Exclusive (IX), Shared (S), Exclusive (X), and Shared Intent Exclusive (SIX) locks:
Which of the following statements is/are TRUE? (Select all that apply)''',
    options: ['''Two concurrent transactions can simultaneously hold Intent Shared (IS) locks on the same database node.''', '''An Intent Exclusive (IX) lock is compatible with another Intent Exclusive (IX) lock on the same node.''', '''An Exclusive (X) lock is compatible with an Intent Shared (IS) lock.''', '''To lock a node in Exclusive (X) mode, a transaction must traverse down from the root, holding Intent Exclusive (IX) locks on all ancestor nodes.'''],
    correctAnswer: '''A;B;D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: IS is compatible with IS (both intend to read children).
B is TRUE: IX is compatible with IX (two transactions can concurrently modify different children beneath the same table/database).
C is FALSE: X mode requires exclusive ownership; it is incompatible with all other lock modes including IS and IX.
D is TRUE: The MGL protocol dictates that before obtaining an S or IS lock on node Q, ancestor nodes must be locked in IS or IX mode; before obtaining an X or IX lock on node Q, ancestors must be locked in IX or SIX mode.
Thus A, B, and D are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_53',
    year: 2026,
    subject: '''Database Management Systems''',
    topic: '''Tuple Relational Calculus Safety''',
    questionText: '''In Tuple Relational Calculus (TRC), the expression { t | not (t in Employee) } is considered UNSAFE because:''',
    options: ['''It contains a non-equijoin condition''', '''It can evaluate to an infinite relation containing all possible tuples in the universe that do not exist in the Employee relation (violating Domain Independence)''', '''It cannot be evaluated in SQL without a GROUP BY clause''', '''It uses universal quantification'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''A TRC query is safe (domain-independent) if all values in the result are drawn from the domain of the query (constants in the formula or appearing in the database relations).
The expression { t | not (t in Employee) } generates infinitely many arbitrary tuples drawn from the universe of all data types, which cannot be computed or stored. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_54',
    year: 2026,
    subject: '''Database Management Systems''',
    topic: '''SQL Recursive Common Table Expression Depth''',
    questionText: '''Consider a hierarchical management table Org(EmpId INT, MgrId INT):
(1, NULL), (2, 1), (3, 1), (4, 2), (5, 4).
A recursive Common Table Expression (CTE) computes employee hierarchy levels starting with level = 0 for top manager (MgrId IS NULL) and level = level + 1 for each direct report.
What is the computed level for EmpId = 5?''',
    options: [],
    correctAnswer: '''3''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Let us trace the management hierarchy from the root:
- Level 0 (Base case): EmpId = 1 (MgrId is NULL).
- Level 1: Direct reports of EmpId 1 -> EmpId = 2, EmpId = 3.
- Level 2: Direct reports of EmpId 2 -> EmpId = 4.
- Level 3: Direct reports of EmpId 4 -> EmpId = 5.
EmpId = 5 is at hierarchy depth level 3.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_55',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Support Vector Regression Epsilon Loss''',
    questionText: '''In Support Vector Regression (SVR), the linear epsilon-insensitive loss function is defined as:
L_eps(y, y_hat) = max( 0, |y - y_hat| - eps ).
For a training sample with true target value y = 10.0, predicted value y_hat = 7.5, and margin threshold eps = 1.0:
What is the value of the epsilon-insensitive loss? (Round off to 1 decimal place).''',
    options: [],
    correctAnswer: '''1.5''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Compute absolute prediction error:
|y - y_hat| = |10.0 - 7.5| = 2.5.
Apply epsilon-insensitive loss with eps = 1.0:
L_eps = max( 0, 2.5 - 1.0 ) = max( 0, 1.5 ) = 1.5.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_56',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Mercer Kernel Closure Properties''',
    questionText: '''Let K_1(x, z) and K_2(x, z) be valid Mercer kernels over X x X with positive semi-definite Gram matrices.
Which of the following functions is/are also VALID Mercer kernels? (Select all that apply)''',
    options: ['''K_3(x, z) = c * K_1(x, z), for any scalar constant c > 0.''', '''K_4(x, z) = K_1(x, z) + K_2(x, z).''', '''K_5(x, z) = K_1(x, z) * K_2(x, z) (Schur product).''', '''K_6(x, z) = exp( K_1(x, z) ).'''],
    correctAnswer: '''A;B;C;D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: Scaling by positive scalar c preserves positive semi-definiteness (c G >= 0).
B is TRUE: Sum of two positive semi-definite matrices is positive semi-definite.
C is TRUE: By the Schur Product Theorem, the elementwise product of two PSD matrices is PSD.
D is TRUE: exp(K(x, z)) = sum_{k=0}^inf (K(x, z))^k / k!. Since powers of kernels (by Schur product) are valid kernels, and positive linear combinations of kernels are kernels, the infinite series converges to a valid Mercer kernel.
All four statements A, B, C, D are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_57',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Kullback Leibler Divergence Between Gaussians''',
    questionText: '''The Kullback-Leibler (KL) divergence between two 1-dimensional Gaussian distributions with common variance sigma^2 = 1.0 and different means mu_1 = 1.0 and mu_2 = 4.0 is:
D_KL( N(mu_1, sigma^2) || N(mu_2, sigma^2) ) = (mu_1 - mu_2)^2 / (2 * sigma^2).
What is the numerical value of this KL divergence? (Round off to 1 decimal place).''',
    options: [],
    correctAnswer: '''4.5''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Substitute the given parameters:
mu_1 = 1.0
mu_2 = 4.0
sigma^2 = 1.0
D_KL = (1.0 - 4.0)^2 / (2 * 1.0)
     = (-3.0)^2 / 2.0
     = 9.0 / 2.0 = 4.5.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_58',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Graph Neural Networks and 1WL Expressive Limit''',
    questionText: '''Morris et al. (2019) and Xu et al. (2019) proved that standard Message-Passing Graph Neural Networks (MPNNs) with sum aggregation have expressive power at most EQUIVALENT to which classical graph isomorphism test?''',
    options: ['''1-dimensional Weisfeiler-Lehman (1-WL) color refinement test''', '''Dijkstra's shortest path test''', '''Hopcroft-Tarjan planarity test''', '''Edmonds-Karp max-flow algorithm'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Standard spatial message-passing GNNs update node representations by aggregating neighbor multiset features. Xu et al. (GIN network) and Morris et al. proved that message passing cannot distinguish non-isomorphic graphs that cannot be distinguished by the 1-dimensional Weisfeiler-Lehman (1-WL) color refinement heuristic (such as strongly regular graphs or circular graphs with differing chord structures). Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_59',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Variational Autoencoder Reparameterization Trick''',
    questionText: '''In Variational Autoencoders (VAEs), why is the Reparameterization Trick z = mu(x) + sigma(x) (*) epsilon (where epsilon ~ N(0, I)) essential for end-to-end backpropagation?''',
    options: ['''Because backpropagation cannot propagate gradients through a stochastic sampling node, and the trick isolates the stochasticity into an external parameter-free random variable epsilon, allowing analytical gradients d/dmu and d/dsigma to flow back into the encoder.''', '''Because it makes the latent space strictly discrete.''', '''Because it guarantees zero reconstruction loss on all training images.''', '''Because it replaces the decoder neural network with an analytical closed-form formula.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Standard sampling z ~ N(mu(x), sigma^2(x)) creates a stochastic bottleneck where the gradient dz/dtheta is undefined. Kingma & Welling (2013) reparameterized z as a deterministic differentiable transformation of encoder outputs mu and sigma perturbed by independent standard Gaussian noise epsilon ~ N(0, I). This allows standard backpropagation via the chain rule. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_60',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''Alpha-Beta Pruning Leaf Evaluations with Transpositions''',
    questionText: '''Consider a game tree of depth 2 where Root is a MAX node with two children, MIN nodes M1 and M2.
Each MIN node has 3 leaf children.
From left to right, the leaf evaluation values are:
- Under M1: [6, 9, 3]
- Under M2: [1, 7, 4]
Under standard Alpha-Beta pruning (traversing left to right), how many leaf nodes are EVALUATED in total?''',
    options: [],
    correctAnswer: '''4''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Root is MAX (alpha = -inf, beta = +inf).
1. Visit first child M1 (MIN node, alpha = -inf, beta = +inf):
   - Leaf 1: value = 6. beta = min(+inf, 6) = 6.
   - Leaf 2: value = 9. beta = min(6, 9) = 6.
   - Leaf 3: value = 3. beta = min(6, 3) = 3.
   M1 returns value = 3.
   Root updates alpha: alpha = max(-inf, 3) = 3.

2. Visit second child M2 (MIN node, alpha = 3, beta = +inf):
   - Leaf 4 (first leaf under M2): value = 1.
     beta = min(+inf, 1) = 1.
     Check cutoff condition:
     alpha (3) >= beta (1).
     Cutoff occurs immediately!
   - Leaves 5 and 6 under M2 (values 7 and 4) are PRUNED.
Total leaves evaluated = 3 (under M1) + 1 (under M2) = 4.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_61',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''Zero Sum Games and Minimax Theorem''',
    questionText: '''Which of the following statements regarding two-player zero-sum games in Game Theory is/are TRUE? (Select all that apply)''',
    options: ['''By von Neumann's Minimax Theorem, in every finite two-player zero-sum game, there exists a unique game value V and a Nash equilibrium in mixed strategies.''', '''At a Nash equilibrium in a zero-sum game, neither player can improve their expected payoff by unilaterally deviating from their strategy.''', '''In the Prisoner's Dilemma game, Mutual Cooperation is the strictly dominant strategy for both players.''', '''A pure strategy Nash equilibrium exists in every zero-sum matrix game.'''],
    correctAnswer: '''A;B''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: John von Neumann's 1928 Minimax Theorem guarantees max_p min_q p^T A q = min_q max_p p^T A q = V in mixed strategies.
B is TRUE: Fundamental definition of a Nash Equilibrium.
C is FALSE: In the Prisoner's Dilemma, Mutual DEFECT is the unique dominant strategy equilibrium (cooperation is Pareto optimal, but not a Nash equilibrium).
D is FALSE: Games like Matching Pennies or Rock-Paper-Scissors have no pure strategy Nash equilibrium (only mixed equilibria).
Thus only A and B are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_62',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''Temporal Difference TD Lambda Eligibility Traces''',
    questionText: '''In Reinforcement Learning, what is the role of Eligibility Traces in the TD(lambda) algorithm?''',
    options: ['''They provide an elegant algorithmic bridge connecting single-step TD(0) updates with Monte Carlo (infinite-step) updates through an exponential decay factor lambda in [0, 1].''', '''They guarantee that the neural network will never suffer from catastrophic forgetting.''', '''They restrict learning updates strictly to the final terminal state of each episode.''', '''They eliminate the need for discount factor gamma.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''TD(lambda) unifies TD(0) (when lambda = 0) and Monte Carlo (when lambda = 1) methods. Eligibility traces track the frequency and recency of state visitations, decaying credit backward exponentially by (gamma * lambda)^t, allowing backward-view TD(lambda) to efficiently approximate the forward-view lambda-return offline or online. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_63',
    year: 2026,
    subject: '''Probability & Statistics''',
    topic: '''Hypergeometric Distribution Mean''',
    questionText: '''A quality assurance engineer inspects a shipment of N = 20 server motherboards, containing K = 8 defective boards.
A random sample of n = 5 boards is drawn without replacement.
Let X be the number of defective boards found in the sample (Hypergeometric distribution).
What is the EXPECTED value E[X]? (Answer as an integer).''',
    options: [],
    correctAnswer: '''2''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''For a Hypergeometric distribution with population size N = 20, defectives K = 8, and sample size n = 5:
The expected value is given by:
E[X] = n * (K / N).
Substitute the parameters:
E[X] = 5 * (8 / 20) = 5 * (2 / 5) = 2.
The expected number of defective motherboards is 2.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_64',
    year: 2026,
    subject: '''Linear Algebra & Machine Learning''',
    topic: '''Nuclear Norm Minimization and Matrix Completion''',
    questionText: '''In compressed sensing and collaborative filtering (low-rank matrix completion):
The problem of finding the lowest-rank matrix X matching observed entries is NP-hard.
Which convex surrogate optimization problem is solved instead (Candès & Recht, 2009)?''',
    options: ['''Minimizing the Nuclear Norm ||X||_* = sum_i sigma_i(X) (the sum of singular values) subject to matching observed entries.''', '''Minimizing the Frobenius norm ||X||_F.''', '''Minimizing the L1 norm of the vectorized matrix sum_{i,j} |X_{ij}|.''', '''Minimizing the determinant det(X).'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Candès and Recht (2009) proved that the nuclear norm ||X||_* (the sum of singular values, which is the L1 norm of the singular value vector) is the tightest convex relaxation of the non-convex matrix rank function rank(X), just as L1 norm is the convex surrogate for L0 vector sparsity. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK5_CORE_65',
    year: 2026,
    subject: '''Optimization & Machine Learning''',
    topic: '''Adam Optimizer First Moment Bias Correction''',
    questionText: '''In the Adam optimization algorithm:
The exponential moving average of gradients is updated as m_t = beta_1 * m_{t-1} + (1 - beta_1) * g_t, initialized with m_0 = 0.
The bias-corrected first moment estimate is:
m_hat_t = m_t / (1 - beta_1^t).
Given beta_1 = 0.9:
If the first gradient observed at step t = 1 is g_1 = 0.90, such that m_1 = (1 - 0.9) * 0.90 = 0.09:
What is the bias-corrected estimate m_hat_1? (Round off to 2 decimal places).''',
    options: [],
    correctAnswer: '''0.90''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''At step t = 1:
m_1 = 0.09.
beta_1 = 0.9.
The denominator correction factor is:
1 - beta_1^1 = 1 - 0.9 = 0.1.
The bias-corrected estimate is:
m_hat_1 = m_1 / (1 - beta_1^1) = 0.09 / 0.1 = 0.90.
(Notice this restores the unbiased expectation E[m_hat_1] = E[g_1] = 0.90, removing the bias towards zero caused by initializing m_0 = 0).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
];
