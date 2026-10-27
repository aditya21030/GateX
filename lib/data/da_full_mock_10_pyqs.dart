// AUTO-GENERATED MOCK 10 QUESTIONS (LEVEL 10: THE ULTIMATE ZENITH DIFFICULTY)
import '../models/models.dart';

final List<PYQ> daFullMock10Questions = [
  PYQ(
    id: 'DA_MOCK10_GA_01',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Verbal Ability''',
    questionText: '''Choose the word that best completes the sentence:
"Even when the cloud infrastructure faced an unprecedented cascading outage, the site reliability director responded with remarkable ________, methodically isolating corrupted clusters without showing panic."''',
    options: ['''equanimity''', '''truculence''', '''recalcitrance''', '''petulance'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''"Equanimity" means calmness and composure, especially in a difficult or stressful situation.
The sentence describes responding with composure without showing panic.
Truculence means aggressiveness or hostility; recalcitrance means obstinate defiance; petulance means bad-tempered childishness.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_GA_02',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Critical Reasoning''',
    questionText: '''Given the true statement:
"If a distributed ledger protocol achieves Byzantine fault tolerance under partial synchrony, then strictly fewer than one-third of the participating nodes are adversarial."
Which of the following statements is logically EQUIVALENT (the contrapositive)?''',
    options: ['''If at least one-third of the participating nodes are adversarial, then the distributed ledger protocol does not achieve Byzantine fault tolerance under partial synchrony.''', '''If strictly fewer than one-third of the participating nodes are adversarial, then the distributed ledger protocol must achieve Byzantine fault tolerance under partial synchrony.''', '''If the distributed ledger protocol does not achieve Byzantine fault tolerance, then at least one-third of the nodes must be adversarial.''', '''No distributed ledger protocol can ever achieve Byzantine fault tolerance.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The conditional statement is: P -> Q, where:
P: The protocol achieves Byzantine fault tolerance under partial synchrony.
Q: Strictly fewer than 1/3 of participating nodes are adversarial.
The contrapositive is: not(Q) -> not(P).
not(Q) is: At least 1/3 of participating nodes are adversarial.
not(P) is: The protocol does not achieve Byzantine fault tolerance under partial synchrony.
A conditional statement is logically equivalent to its contrapositive. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_GA_03',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude''',
    questionText: '''At what acute angle (in degrees) do the hour hand and minute hand of a standard 12-hour analog clock intersect at exactly 3:40?''',
    options: ['''130 degrees''', '''120 degrees''', '''140 degrees''', '''125 degrees'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The angle between the hour and minute hands of a clock at H hours and M minutes is:
theta = | 30 * H - (11 / 2) * M |.

For H = 3 and M = 40:
30 * 3 = 90 degrees.
(11 / 2) * 40 = 11 * 20 = 220 degrees.
theta = | 90 - 220 | = | -130 | = 130 degrees.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_GA_04',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Spatial Aptitude''',
    questionText: '''A solid rectangular block of wood has dimensions 4 cm x 5 cm x 6 cm.
The entire outer surface of the block is painted blue.
The block is then sliced into unit cubes of dimensions 1 cm x 1 cm x 1 cm.
How many of these unit cubes have NO blue paint on any face?''',
    options: ['''24''', '''36''', '''16''', '''48'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''In a rectangular solid of dimensions a x b x c painted on the outside:
The unpainted cubes reside in the interior core, having dimensions:
(a - 2) x (b - 2) x (c - 2).

Given a = 4, b = 5, c = 6:
a - 2 = 4 - 2 = 2.
b - 2 = 5 - 2 = 3.
c - 2 = 6 - 2 = 4.

Number of unpainted cubes = 2 * 3 * 4 = 24.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_GA_05',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Analytical Aptitude''',
    questionText: '''In the classic cryptarithmetic addition problem where each distinct letter represents a unique decimal digit from {0, 1, ..., 9} and leading digits cannot be zero:
  S E N D
+ M O R E
---------
M O N E Y
What is the unique digit represented by the letter M?''',
    options: ['''1''', '''2''', '''9''', '''0'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The sum of two 4-digit numbers (SEND + MORE) produces a 5-digit number (MONEY).
The maximum possible sum of two 4-digit numbers is:
9999 + 9999 = 19998.
Therefore, the carry into the ten-thousands column (the leading digit M) can only ever be 1.
Since leading digits cannot be 0, M must strictly equal 1.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_GA_06',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude''',
    questionText: '''In a certain positional number base b > 4, the following arithmetic multiplication is verified to be correct:
(24)_b * (32)_b = (1010)_b.
What is the base b?''',
    options: ['''8''', '''7''', '''9''', '''6'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Convert each term into base-10 algebraic expressions in b:
(24)_b = 2b + 4
(32)_b = 3b + 2
(1010)_b = 1 * b^3 + 0 * b^2 + 1 * b + 0 = b^3 + b.

Set up the equation:
(2b + 4)(3b + 2) = b^3 + b
6b^2 + 16b + 8 = b^3 + b
b^3 - 6b^2 - 15b - 8 = 0.

Factor the polynomial:
(b + 1)^2 (b - 8) = 0.
Since the base must be greater than 4, b = 8.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_GA_07',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude''',
    questionText: '''Three athletes A, B, and C run around a circular track of circumference 400 meters in the same direction, starting at the exact same time from the starting line.
Their constant running speeds are:
A runs at 4 m/s
B runs at 6 m/s
C runs at 8 m/s.
After how many seconds from the start will all three athletes meet together again at the starting line for the first time?''',
    options: ['''200 seconds''', '''400 seconds''', '''100 seconds''', '''300 seconds'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Compute the time each athlete takes to complete one full 400m lap:
Time for A: T_A = 400 / 4 = 100 seconds.
Time for B: T_B = 400 / 6 = 200 / 3 seconds.
Time for C: T_C = 400 / 8 = 50 seconds.

All three athletes will meet together at the starting line at intervals equal to the Least Common Multiple (LCM) of their lap times:
LCM( 100, 200/3, 50 ) = LCM( 100/1, 200/3, 50/1 ).

Formula for LCM of fractions:
LCM(a/b, c/d, e/f) = LCM(a, c, e) / HCF(b, d, f).
LCM(100, 200, 50) = 200.
HCF(1, 3, 1) = 1.

Therefore:
LCM = 200 / 1 = 200 seconds.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_GA_08',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Combinatorics''',
    questionText: '''Let A be a set of 5 elements and B be a set of 3 elements.
How many surjective (onto) functions f: A -> B can be defined?''',
    options: ['''150''', '''243''', '''120''', '''60'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The number of surjective functions from a set of size m to a set of size n is:
n! * S(m, n),
where S(m, n) is the Stirling number of the second kind.

Here m = 5 and n = 3:
S(5, 3) is the number of ways to partition 5 elements into 3 non-empty subsets:
Partitions of 5 into 3 parts can be:
- Type (3, 1, 1): binom(5, 3) * binom(2, 1) * binom(1, 1) / 2! = (10 * 2 * 1) / 2 = 10.
- Type (2, 2, 1): binom(5, 2) * binom(3, 2) * binom(1, 1) / 2! = (10 * 3 * 1) / 2 = 15.
S(5, 3) = 10 + 15 = 25.

Number of onto functions = 3! * S(5, 3) = 6 * 25 = 150.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_GA_09',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Critical Reasoning''',
    questionText: '''A corporate hiring department replaced human interview screening with an automated machine learning model trained on historical hiring data spanning the past ten years.
The leadership claimed: "Because the machine learning algorithm evaluates only standardized resumes and has no human emotional biases, our hiring process is now completely fair and objective."
Which of the following, if true, most seriously undermines the leadership's claim?''',
    options: ['''The historical training data reflects past human hiring practices that systematically favored certain demographic groups, causing the model to learn and reproduce those historical disparities.''', '''The automated screening model evaluates resumes in under 2 seconds.''', '''Human recruiters often take longer than 30 minutes to review a candidate's profile.''', '''The machine learning model uses a gradient boosting algorithm rather than deep neural networks.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The leadership assumes that an algorithmic model trained on historical data is inherently fair because it lacks emotional bias.
However, machine learning models learn statistical patterns present in their training data. If the historical data contains legacy human biases and disparities, the model will codify and perpetuate those biases under the guise of mathematical objectivity.
Option A directly identifies this fundamental flaw.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_GA_10',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Geometry''',
    questionText: '''A circle is inscribed inside a right-angled triangle ABC whose legs (perpendicular sides) have lengths AB = 6 cm and BC = 8 cm.
What is the radius r of the inscribed circle?''',
    options: ['''2 cm''', '''1.5 cm''', '''2.5 cm''', '''3 cm'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''In a right-angled triangle with perpendicular legs a and b and hypotenuse c:
Hypotenuse c = sqrt(a^2 + b^2) = sqrt(6^2 + 8^2) = sqrt(36 + 64) = sqrt(100) = 10 cm.

The inradius r of a right-angled triangle is given by:
r = (a + b - c) / 2.

Substitute a = 6, b = 8, c = 10:
r = (6 + 8 - 10) / 2 = (14 - 10) / 2 = 4 / 2 = 2 cm.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_11',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Stochastic Matrix Spectral Radius''',
    questionText: '''Let P in R^{n x n} be a right stochastic matrix (all entries p_ij >= 0 and each row sums to 1: sum_j p_ij = 1).
What is the spectral radius rho(P) = max_i |lambda_i|?''',
    options: ['''1''', '''0''', '''n''', '''infinity'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''For a right stochastic matrix P:
P * 1 = 1, where 1 = [1, 1, ..., 1]^T is the all-ones vector.
Thus lambda = 1 is always an eigenvalue of P.
Furthermore, by the Gerschgorin Disc Theorem or matrix norm properties (||P||_inf = max_i sum_j |p_ij| = 1):
Every eigenvalue lambda satisfies |lambda| <= ||P||_inf = 1.
Therefore, the spectral radius is exactly rho(P) = 1.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_12',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Scalar Multiple Matrix Determinant''',
    questionText: '''Let A be a 4 x 4 real matrix with determinant det(A) = 2.
What is the determinant of the scaled matrix 3*A, det(3*A)? (Answer as an integer).''',
    options: [],
    correctAnswer: '''162''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''For an n x n matrix A and scalar c:
det(c * A) = c^n * det(A).

Given n = 4, c = 3, and det(A) = 2:
det(3 * A) = 3^4 * det(A) = 81 * 2 = 162.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_13',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Cholesky Factorization Properties''',
    questionText: '''Let A in R^{n x n} be a symmetric positive definite matrix.
Which of the following statements regarding its Cholesky factorization A = L L^T is/are TRUE?''',
    options: ['''L is a lower-triangular matrix with strictly positive real diagonal entries.''', '''The Cholesky factorization is strictly unique.''', '''det(A) = (prod_{i=1}^n l_ii)^2, where l_ii are the diagonal entries of L.''', '''L is an orthogonal matrix.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis of statements:
A. The Cholesky theorem guarantees that any symmetric positive definite matrix has a lower-triangular factor L with strictly positive diagonal entries l_ii > 0. (TRUE)
B. Requiring l_ii > 0 makes the Cholesky factorization strictly unique. (TRUE)
C. det(A) = det(L L^T) = det(L)^2 = (prod l_ii)^2. (TRUE)
D. L is lower-triangular with l_ii > 0; it is not orthogonal in general. (FALSE)

Correct options: A, B, C.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_14',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Trace of Rank One Normal Projector''',
    questionText: '''Let v = [3, -4]^T in R^2 be a non-zero vector.
Let P = (v v^T) / ||v||^2 be the orthogonal projection matrix onto the line spanned by v.
What is the trace tr(P)? (Answer as an integer).''',
    options: [],
    correctAnswer: '''1''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Using the cyclic trace property:
tr(P) = tr( (v v^T) / ||v||^2 ) = (1 / ||v||^2) * tr(v v^T) = (1 / ||v||^2) * tr(v^T v)
= (1 / ||v||^2) * ||v||^2 = 1.
The trace of any projection matrix onto a 1-dimensional subspace is 1.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_15',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Hessian Determinant at Critical Point''',
    questionText: '''Consider the bivariate function:
f(x, y) = x^3 - 3 x + y^2.
The stationary point in the first quadrant is (x_0, y_0) = (1, 0).
What is the determinant of the Hessian matrix of f at (1, 0)? (Answer as an integer).''',
    options: [],
    correctAnswer: '''12''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Compute partial derivatives:
df/dx = 3 x^2 - 3.
df/dy = 2 y.

Second derivatives:
d^2f / dx^2 = 6x.
d^2f / dy^2 = 2.
d^2f / (dx dy) = 0.

Hessian matrix at (1, 0):
H = [[6(1), 0],
     [0,    2]] = [[6, 0], [0, 2]].

Determinant:
det(H) = (6)(2) - (0)(0) = 12.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_16',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Multivariable Mean Value Theorem''',
    questionText: '''Let f: R^n -> R be continuously differentiable on an open set containing the line segment connecting points a and b.
The Multivariable Mean Value Theorem guarantees the existence of a point c on the open line segment between a and b such that:''',
    options: ['''f(b) - f(a) = grad f(c) . (b - a)''', '''f(b) - f(a) = ||grad f(c)||_2''', '''grad f(c) = 0''', '''f(c) = (f(a) + f(b)) / 2'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''By the Mean Value Theorem for scalar-valued multivariable functions:
Define single-variable function g(t) = f(a + t(b - a)) for t in [0, 1].
By standard MVT, there exists t_0 in (0, 1) such that g(1) - g(0) = g'(t_0).
Using chain rule, g'(t_0) = grad f(c) . (b - a) where c = a + t_0(b - a).
Thus: f(b) - f(a) = grad f(c) . (b - a).
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_17',
    year: 2026,
    subject: '''Optimization''',
    topic: '''Soft Thresholding Operator Evaluation''',
    questionText: '''In L1-regularized optimization (Lasso), the soft-thresholding operator is defined as:
S_lambda(x) = sign(x) * max(0, |x| - lambda).
What is the value of S_lambda(x) when x = 5.0 and lambda = 2.0? (Answer as an integer).''',
    options: [],
    correctAnswer: '''3''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Given x = 5.0 > 0 and lambda = 2.0:
sign(5.0) = +1
|x| - lambda = 5.0 - 2.0 = 3.0.
max(0, 3.0) = 3.0.

S_2(5) = (+1) * 3.0 = 3.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_18',
    year: 2026,
    subject: '''Optimization''',
    topic: '''Affine Functions Convexity and Concavity''',
    questionText: '''Let f: R^n -> R be an affine function defined by f(x) = a^T x + b, where a in R^n and b in R.
Which of the following statements is/are TRUE?''',
    options: ['''f is a convex function.''', '''f is a concave function.''', '''The Hessian matrix of f is identically the zero matrix everywhere.''', '''f is strictly convex.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis of statements:
A. For any theta in [0, 1], f(theta x + (1 - theta) y) = theta f(x) + (1 - theta) f(y) <= ... (holds with exact equality), so f is convex. (TRUE)
B. Since equality holds, -f is also convex, meaning f is concave. (TRUE)
C. grad f(x) = a is constant, so Hessian H = 0 everywhere. (TRUE)
D. Strict convexity requires strict inequality f(theta x + (1 - theta) y) < theta f(x) + (1 - theta) f(y) for x != y and theta in (0, 1), which never holds for affine functions. (FALSE)

Correct options: A, B, C.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_19',
    year: 2026,
    subject: '''Probability''',
    topic: '''Independent Random Variables Product Expectation''',
    questionText: '''Let X and Y be independent random variables with E[X] = 4 and E[Y] = 5.
What is the expected value of their product, E[X Y]? (Answer as an integer).''',
    options: [],
    correctAnswer: '''20''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''A fundamental theorem of probability states that if X and Y are independent random variables:
E[X Y] = E[X] * E[Y].

Given E[X] = 4 and E[Y] = 5:
E[X Y] = 4 * 5 = 20.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_20',
    year: 2026,
    subject: '''Probability''',
    topic: '''Strong vs Weak Law of Large Numbers''',
    questionText: '''What is the fundamental theoretical difference between the Weak Law of Large Numbers (WLLN) and the Strong Law of Large Numbers (SLLN)?''',
    options: ['''The WLLN establishes convergence in probability (lim P(|X_bar_n - mu| > epsilon) = 0), whereas the SLLN establishes almost sure convergence (P(lim X_bar_n = mu) = 1).''', '''The WLLN requires infinite variance, while the SLLN requires zero variance.''', '''The WLLN applies only to continuous variables, while the SLLN applies only to discrete variables.''', '''The SLLN guarantees that the sample mean equals mu for all finite n.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The Weak Law of Large Numbers guarantees convergence in probability (X_bar_n -> mu in probability).
The Strong Law of Large Numbers guarantees almost sure convergence (X_bar_n -> mu almost surely), which is a strictly stronger mode of stochastic convergence.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_21',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Standard Error of the Sample Mean''',
    questionText: '''A random sample of size n = 36 is drawn from a population with known standard deviation sigma = 12.
What is the standard error of the sample mean, SE(X_bar) = sigma / sqrt(n)? (Answer as an integer).''',
    options: [],
    correctAnswer: '''2''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''The standard error of the sample mean is:
SE(X_bar) = sigma / sqrt(n).

Given sigma = 12 and n = 36:
sqrt(36) = 6.
SE(X_bar) = 12 / 6 = 2.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_22',
    year: 2026,
    subject: '''Statistics''',
    topic: '''P Value Precise Formal Interpretation''',
    questionText: '''In frequentist hypothesis testing, what is the formal definition of the p-value?''',
    options: ['''The probability of observing a test statistic at least as extreme as the one actually observed, assuming the null hypothesis H_0 is true.''', '''The probability that the null hypothesis is true given the observed data.''', '''The probability that the alternative hypothesis is false.''', '''The probability of committing a Type II error.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The p-value is formally defined as:
p = P( T(X) >= t_obs | H_0 is true ),
which is the probability under the null hypothesis of obtaining a result at least as extreme as the observed test statistic.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_23',
    year: 2026,
    subject: '''Probability''',
    topic: '''Exponential Distribution Median''',
    questionText: '''Let X follow an Exponential distribution with rate parameter lambda = ln(2).
Its cumulative distribution function is F(x) = 1 - e^(-lambda x) for x >= 0.
What is the median m of the distribution (satisfying F(m) = 0.50)? (Answer as an integer).''',
    options: [],
    correctAnswer: '''1''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Set F(m) = 0.50:
1 - e^(-lambda m) = 0.50
e^(-lambda m) = 0.50 = 1 / 2.

Take natural logarithm:
-lambda m = ln(1/2) = -ln(2)
lambda m = ln(2)
m = ln(2) / lambda.

Given lambda = ln(2):
m = ln(2) / ln(2) = 1.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_24',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Sufficient Statistic One to One Transformation''',
    questionText: '''Let T(X) be a sufficient statistic for parameter theta.
If g: R -> R is an invertible (one-to-one) function, which of the following is/are TRUE?''',
    options: ['''U(X) = g(T(X)) is also a sufficient statistic for theta.''', '''The partition of the sample space induced by U(X) is identical to the partition induced by T(X).''', '''T(X) contains all the information about theta that is present in the data sample.''', '''T(X) must be an unbiased estimator of theta.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis of statements:
A. Any one-to-one transformation of a sufficient statistic preserves the factorization g(T(x), theta) = g_1(U(x), theta), so U(X) is sufficient. (TRUE)
B. Invertible transformations induce identical equivalence classes (partitions) of the sample space. (TRUE)
C. By sufficiency, the conditional distribution of the sample given T(X) does not depend on theta, meaning T contains all information regarding theta. (TRUE)
D. A sufficient statistic does not have to be unbiased (e.g. sum X_i is sufficient for Poisson lambda, but E[sum X_i] = n lambda != lambda). (FALSE)

Correct options: A, B, C.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_25',
    year: 2026,
    subject: '''Data Structures''',
    topic: '''Hash Table Average Search Time Under Simple Uniform Hashing''',
    questionText: '''In a hash table using chaining to resolve collisions, suppose n keys are stored across m slots.
Under the assumption of Simple Uniform Hashing, what is the expected time complexity of an unsuccessful search?''',
    options: ['''Theta(1 + alpha), where alpha = n / m is the load factor.''', '''Theta(n)''', '''Theta(log n)''', '''Theta(m)'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Under Simple Uniform Hashing, any key is equally likely to hash to any of the m slots.
The expected length of the chain in any slot is the load factor alpha = n / m.
An unsuccessful search scans the entire chain of the hashed slot to completion, taking Theta(1) time to compute the hash and Theta(alpha) time to traverse the list:
Expected time = Theta(1 + alpha).
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_26',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Max Edges in Acyclic Connected Graph''',
    questionText: '''What is the maximum number of edges in a connected undirected graph with |V| = 6 vertices that contains NO simple cycles? (Answer as an integer).''',
    options: [],
    correctAnswer: '''5''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''A connected graph with no cycles is by definition a tree.
Any tree on |V| vertices has exactly |V| - 1 edges.
Adding even one more edge creates a fundamental cycle.
For |V| = 6:
Edges = 6 - 1 = 5.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_27',
    year: 2026,
    subject: '''Programming in Python''',
    topic: '''Callable Instances via Double Underscore Call''',
    questionText: '''In Python 3, what special method must a class implement to allow its instances to be invoked directly as callable functions (e.g., obj(arg))?''',
    options: ['''__call__''', '''__invoke__''', '''__apply__''', '''__init__'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''In Python, defining the __call__(self, *args, **kwargs) method within a class allows instances of that class to be invoked using function call syntax: instance(args).
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_28',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Kruskal Algorithm Cut Property Correctness''',
    questionText: '''The correctness of Kruskal's greedy algorithm for finding a Minimum Spanning Tree (MST) relies fundamentally on which property of graphs?''',
    options: ['''The Cut Property: For any cut (S, V - S) of a connected graph, the minimum-weight edge crossing the cut belongs to an MST.''', '''The Bellman-Ford optimality condition.''', '''The Maximum Flow Minimum Cut theorem.''', '''The Halting Problem theorem.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Kruskal's algorithm iteratively selects the lightest edge that does not form a cycle.
The correctness of this greedy choice is proven by the Cut Property: whenever an edge e connects two disjoint components, consider the cut separating those components; e is the minimum-weight edge crossing that cut and is guaranteed to belong to some MST.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_29',
    year: 2026,
    subject: '''DBMS''',
    topic: '''Armstrong Axiom of Pseudotransitivity''',
    questionText: '''In relational database theory, which of Armstrong's inference rules is known as the Pseudotransitivity Rule?''',
    options: ['''If X -> Y and W Y -> Z, then W X -> Z.''', '''If X -> Y and Y -> Z, then X -> Z.''', '''If X -> Y and X -> Z, then X -> Y Z.''', '''If Y subset X, then X -> Y.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Armstrong's Axioms:
- Transitivity: X -> Y and Y -> Z implies X -> Z.
- Augmentation: X -> Y implies X Z -> Y Z.
- Pseudotransitivity: If X -> Y and W Y -> Z, then augmenting X -> Y with W gives W X -> W Y, and applying transitivity yields W X -> Z.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_30',
    year: 2026,
    subject: '''DBMS''',
    topic: '''Cyclic FDs Minimal Candidate Key Closure''',
    questionText: '''Consider relation schema R(A, B, C, D) with functional dependencies:
A -> B
B -> C
C -> D
D -> A.
How many distinct candidate keys does relation R have? (Answer as an integer).''',
    options: [],
    correctAnswer: '''4''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Examine the cycle of dependencies:
A -> B -> C -> D -> A.
- A^+ = {A, B, C, D} => A is a candidate key.
- B^+ = {B, C, D, A} => B is a candidate key.
- C^+ = {C, D, A, B} => C is a candidate key.
- D^+ = {D, A, B, C} => D is a candidate key.
Each single attribute determines all attributes in R.
Thus, R has exactly 4 candidate keys: {A}, {B}, {C}, and {D}.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_31',
    year: 2026,
    subject: '''DBMS''',
    topic: '''Phantom Read Anomaly Isolation Level''',
    questionText: '''Under SQL standard transaction isolation levels, what is the MINIMUM isolation level that is strictly guaranteed to prevent the Phantom Read anomaly?''',
    options: ['''Serializable''', '''Repeatable Read''', '''Read Committed''', '''Read Uncommitted'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''According to the ANSI SQL standard isolation level definitions:
- Read Uncommitted: Allows Dirty Reads, Non-repeatable Reads, Phantom Reads.
- Read Committed: Prevents Dirty Reads; allows Non-repeatable Reads, Phantom Reads.
- Repeatable Read: Prevents Dirty Reads and Non-repeatable Reads; allows Phantom Reads (due to range inserts).
- Serializable: Prevents all anomalies including Phantom Reads (using predicate or range locks).
The minimum level that eliminates phantoms is Serializable.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_32',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Inductive Bias in Machine Learning''',
    questionText: '''In machine learning theory, what is "inductive bias"?''',
    options: ['''The set of prior assumptions that a learning algorithm uses to predict outputs for unseen inputs beyond the observed training data.''', '''The numerical error of the model on the training set.''', '''The difference between training accuracy and validation accuracy.''', '''Intentional corruption of training labels.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Without prior assumptions about the hypothesis space or data generation process, no learning algorithm can generalize from finite training data to unseen data (No Free Lunch Theorem).
The explicit or implicit assumptions made by the model (e.g., linear decision boundaries, smoothness, sparsity) constitute its inductive bias.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_33',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''L2 Weight Decay Gradient Contribution''',
    questionText: '''In training a neural network with loss function L(w) augmented with L2 regularization:
J(w) = L(w) + (1/2) * lambda * ||w||_2^2.
If lambda = 0.10 and the current weight vector is w = [2.0, 4.0]^T:
What is the Euclidean norm of the regularization gradient term, ||grad ( (1/2) lambda ||w||_2^2 )||_2? (Round off to two decimal places).''',
    options: [],
    correctAnswer: '''0.45''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Compute gradient of the regularization term:
grad_w [ (1/2) lambda ||w||^2 ] = lambda * w.

Given lambda = 0.10 and w = [2.0, 4.0]^T:
lambda * w = [0.10 * 2.0, 0.10 * 4.0]^T = [0.20, 0.40]^T.

Compute Euclidean norm:
||lambda w||_2 = sqrt(0.20^2 + 0.40^2) = sqrt(0.04 + 0.16) = sqrt(0.20) approx 0.4472.
Rounded to two decimal places: 0.45.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_34',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''Iterative Deepening Search Time and Space''',
    questionText: '''Iterative Deepening Depth-First Search (IDDFS) on a tree with branching factor b > 1 and goal depth d combines the advantages of BFS and DFS by achieving:''',
    options: ['''O(b * d) space complexity and O(b^d) time complexity.''', '''O(b^d) space complexity and O(b * d) time complexity.''', '''O(1) space complexity and O(d!) time complexity.''', '''O(b^2) space complexity and O(b^d) time complexity.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''IDDFS runs DFS to depth limits 0, 1, 2, ..., d.
Because it is DFS, it stores only the current path from root to leaf, requiring O(b * d) memory.
Because the number of nodes at depth d dominates the cumulative sum (sum_{i=0}^d b^i = O(b^d)), the asymptotic time complexity remains O(b^d), matching BFS.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_35',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''Genetic Algorithm Canonical Operators''',
    questionText: '''Which three primary stochastic operators drive the evolutionary search in canonical Genetic Algorithms?''',
    options: ['''Selection, Crossover (Recombination), and Mutation''', '''Backpropagation, Dropout, and Pooling''', '''Minimax, Alpha-Beta, and Heuristic Evaluation''', '''Map, Filter, and Reduce'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Canonical Genetic Algorithms iterate three operators:
1. Selection: Probabilistically chooses higher-fitness individuals to reproduce (e.g. roulette wheel or tournament selection).
2. Crossover (Recombination): Combines genetic material from two parent chromosomes to create offspring.
3. Mutation: Introduces random variations at loci with small probability to maintain genetic diversity.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_36',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Schur Complement Invertibility and Determinant''',
    questionText: '''Consider the 2 x 2 block matrix:
M = [[A, B],
     [B^T, C]],
where A = [[2, 0], [0, 2]] = 2 I_2,  B = [[1, 0], [0, 1]] = I_2,  and C = [[3, 0], [0, 3]] = 3 I_2.
The Schur complement of block A in M is S = C - B^T A^(-1) B.
What is the determinant det(M)? (Answer as an integer).''',
    options: [],
    correctAnswer: '''25''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''By the Schur complement determinant identity:
det(M) = det(A) * det( S ),  where S = C - B^T A^(-1) B.

Given:
A = 2 I_2 => A^(-1) = (1/2) I_2.
det(A) = 2^2 = 4.

Compute S:
B^T A^(-1) B = I_2 * (1/2 I_2) * I_2 = (1/2) I_2.
S = C - (1/2) I_2 = 3 I_2 - 0.5 I_2 = 2.5 I_2.

Compute det(S):
det(S) = (2.5)^2 = 6.25.

Determinant of M:
det(M) = det(A) * det(S) = 4 * 6.25 = 25.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_37',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Frobenius Norm Trace Singular Values Identity''',
    questionText: '''Let A be a 2 x 3 real matrix whose singular values are sigma_1 = 4 and sigma_2 = 3.
The Frobenius norm squared ||A||_F^2 equals tr(A^T A).
What is the value of tr(A^T A)? (Answer as an integer).''',
    options: [],
    correctAnswer: '''25''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''By the spectral properties of the Frobenius norm:
||A||_F^2 = tr(A^T A) = sum_{i=1}^r sigma_i^2.

Given singular values sigma_1 = 4 and sigma_2 = 3:
tr(A^T A) = 4^2 + 3^2 = 16 + 9 = 25.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_38',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Symmetric Matrix Eigenspace Orthogonality''',
    questionText: '''Let A in R^{n x n} be a real symmetric matrix (A^T = A).
Which of the following statements is/are ALWAYS TRUE?''',
    options: ['''All eigenvalues of A are real.''', '''Eigenvectors corresponding to distinct eigenvalues of A are mutually orthogonal.''', '''A is orthogonally diagonalizable (there exists an orthogonal matrix Q such that Q^T A Q is diagonal).''', '''A must be invertible.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis of statements:
A. The Spectral Theorem for real symmetric matrices proves that all eigenvalues are real. (TRUE)
B. If A v_1 = lambda_1 v_1 and A v_2 = lambda_2 v_2 with lambda_1 != lambda_2:
lambda_1 (v_1 . v_2) = (A v_1) . v_2 = v_1 . (A v_2) = lambda_2 (v_1 . v_2) => (lambda_1 - lambda_2) (v_1 . v_2) = 0 => v_1 . v_2 = 0. (TRUE)
C. By the Spectral Theorem, there exists an orthonormal basis of eigenvectors, so Q^T A Q = Lambda. (TRUE)
D. A symmetric matrix can have zero eigenvalues (e.g. the zero matrix), so it is not necessarily invertible. (FALSE)

Correct options: A, B, C.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_39',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Deflated Rayleigh Quotient Minimum''',
    questionText: '''Let A be a 3 x 3 real symmetric matrix with eigenvalues lambda_1 = 2, lambda_2 = 5, lambda_3 = 9.
Let v_1 be the normalized eigenvector corresponding to the smallest eigenvalue lambda_1 = 2.
Consider the Rayleigh quotient R(x) = (x^T A x) / (x^T x) restricted to the subspace orthogonal to v_1:
W = { x in R^3 : x != 0 and x . v_1 = 0 }.
What is the minimum value min_{x in W} R(x)? (Answer as an integer).''',
    options: [],
    correctAnswer: '''5''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''By the Rayleigh-Ritz theorem with spectral deflation:
Any vector x orthogonal to v_1 can be expressed in terms of the remaining eigenvectors v_2 and v_3:
x = c_2 v_2 + c_3 v_3.
The Rayleigh quotient becomes:
R(x) = (c_2^2 lambda_2 + c_3^2 lambda_3) / (c_2^2 + c_3^2).
Since lambda_2 <= lambda_3, this weighted average is minimized when c_3 = 0, yielding:
min_{x in W} R(x) = lambda_2 = 5.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_40',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Surface Area of Cone Segment''',
    questionText: '''Find the surface area A of the cone z = sqrt(x^2 + y^2) lying below the plane z = 3.
What is the value of A / (pi * sqrt(2))? (Answer as an integer).''',
    options: [],
    correctAnswer: '''9''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Surface area formula:
A = iint_D sqrt( 1 + (dz/dx)^2 + (dz/dy)^2 ) dx dy.

For z = sqrt(x^2 + y^2) = r:
dz/dx = x / sqrt(x^2 + y^2)
dz/dy = y / sqrt(x^2 + y^2).
(dz/dx)^2 + (dz/dy)^2 = (x^2 + y^2) / (x^2 + y^2) = 1.

The surface element is:
sqrt(1 + 1) dx dy = sqrt(2) dx dy.

The projection region D on the xy-plane is the circle bounded by z = 3:
sqrt(x^2 + y^2) <= 3  =>  r <= 3.
Area of D = pi * 3^2 = 9 * pi.

Total surface area:
A = sqrt(2) * Area(D) = 9 * pi * sqrt(2).

A / (pi * sqrt(2)) = 9.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_41',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Degenerate Hessian Monkey Saddle Nature''',
    questionText: '''Consider the cubic function:
f(x, y) = x^3 - 3 x y^2.
At the stationary point (0, 0), all second-order partial derivatives vanish, so the Hessian matrix H(0, 0) is identically zero.
What is the true geometric nature of the surface f(x, y) at the origin?''',
    options: ['''It is a monkey saddle point (inflection surface dipping in three directions and rising in three directions).''', '''It is a strict local minimum.''', '''It is a strict local maximum.''', '''The surface is planar everywhere.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Express f(x, y) in polar coordinates x = r cos(theta), y = r sin(theta):
f(r, theta) = r^3 cos^3(theta) - 3 r^3 cos(theta) sin^2(theta)
= r^3 cos(3 theta).
For r > 0, as theta varies:
cos(3 theta) alternates between +1 and -1 three times, producing three valleys and three ridges emanating from the origin.
This is the classical "monkey saddle" (accommodating two legs and a tail).
It is a saddle point. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_42',
    year: 2026,
    subject: '''Optimization''',
    topic: '''Quadratic Program with Equality Constraint KKT Solution''',
    questionText: '''Consider the equality-constrained quadratic optimization problem:
Minimize f(x_1, x_2) = (1/2) * (x_1^2 + x_2^2)
subject to:
x_1 + x_2 = 6.
What is the optimal objective value f(x*)? (Answer as an integer).''',
    options: [],
    correctAnswer: '''9''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Set up Lagrangian:
L(x_1, x_2, nu) = (1/2) (x_1^2 + x_2^2) + nu (x_1 + x_2 - 6).

KKT conditions:
dL/dx_1 = x_1 + nu = 0  => x_1 = -nu.
dL/dx_2 = x_2 + nu = 0  => x_2 = -nu.
Thus x_1 = x_2.

Constraint:
x_1 + x_2 = 6 => 2 x_1 = 6 => x_1* = 3, x_2* = 3.

Optimal objective value:
f(3, 3) = (1/2) * (3^2 + 3^2) = (1/2) * (9 + 9) = (1/2) * 18 = 9.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_43',
    year: 2026,
    subject: '''Optimization''',
    topic: '''Proximal Operator Properties''',
    questionText: '''For a proper closed convex function h: R^n -> R, the proximal operator is defined as:
prox_h(x) = argmin_{z} { h(z) + (1/2) ||z - x||_2^2 }.
Which of the following statements is/are TRUE?''',
    options: ['''The minimizer defining prox_h(x) is unique for every x in R^n.''', '''prox_h is a non-expansive operator: ||prox_h(x) - prox_h(y)||_2 <= ||x - y||_2 for all x, y.''', '''If h is the indicator function of a closed convex set C, then prox_h(x) = Pi_C(x) (the Euclidean projection onto C).''', '''prox_h(x) is always an affine function of x.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis of statements:
A. The objective z -> h(z) + (1/2)||z - x||^2 is strongly convex, guaranteeing existence and uniqueness of the minimizer. (TRUE)
B. The proximal operator is firmly non-expansive, which implies non-expansiveness. (TRUE)
C. If h(z) = I_C(z) (0 if z in C, else inf), then prox_h(x) = argmin_{z in C} (1/2)||z - x||^2 = Pi_C(x). (TRUE)
D. For non-smooth functions like L1 norm, the proximal operator is piece-wise linear (soft thresholding), not affine. (FALSE)

Correct options: A, B, C.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_44',
    year: 2026,
    subject: '''Probability''',
    topic: '''Conditional Distribution of Sum of Poissons''',
    questionText: '''Let X ~ Poisson(lambda_1 = 3) and Y ~ Poisson(lambda_2 = 5) be independent random variables.
Given that their sum is X + Y = 8:
What is the conditional expected value E[X | X + Y = 8]? (Answer as an integer).''',
    options: [],
    correctAnswer: '''3''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''By the classical property of independent Poisson variables:
The conditional distribution of X given X + Y = n is a Binomial distribution:
X | (X + Y = n) ~ Binomial( n, p ),
where p = lambda_1 / (lambda_1 + lambda_2).

Here:
n = 8
lambda_1 = 3, lambda_2 = 5 => p = 3 / (3 + 5) = 3 / 8.

The conditional expectation is:
E[X | X + Y = 8] = n * p = 8 * (3 / 8) = 3.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_45',
    year: 2026,
    subject: '''Probability''',
    topic: '''Bivariate Normal Covariance Determinant''',
    questionText: '''Let (X, Y) have a bivariate normal distribution with variance Var(X) = 9, variance Var(Y) = 16, and correlation coefficient rho = 0.60.
What is the determinant of the covariance matrix Sigma, det(Sigma)? (Answer as a decimal rounded to two decimal places).''',
    options: [],
    correctAnswer: '''92.16''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''The covariance matrix of a bivariate normal distribution is:
Sigma = [[sigma_X^2,       rho * sigma_X * sigma_Y],
         [rho * sigma_X * sigma_Y, sigma_Y^2      ]].

The determinant is:
det(Sigma) = sigma_X^2 * sigma_Y^2 * (1 - rho^2).

Given:
sigma_X^2 = 9
sigma_Y^2 = 16
rho = 0.60 => rho^2 = 0.36 => 1 - rho^2 = 0.64.

det(Sigma) = 9 * 16 * 0.64
= 144 * 0.64 = 92.16.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_46',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Fisher Information Matrix for Gaussian Parameters''',
    questionText: '''Let X_1, ..., X_n be an i.i.d. sample from a Normal distribution N(mu, sigma^2), where both mu and sigma^2 are unknown parameters.
The Fisher Information Matrix I_n(mu, sigma^2) is:
I_n(mu, sigma^2) = [[ n / sigma^2,  0               ],
                    [ 0,            n / (2 * sigma^4)]].
If n = 8 and sigma^2 = 2:
What is the determinant of the Fisher Information Matrix, det(I_n)? (Answer as an integer).''',
    options: [],
    correctAnswer: '''4''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Given:
n = 8
sigma^2 = 2 => sigma^4 = (sigma^2)^2 = 4.

Compute the diagonal entries of the Fisher Information matrix:
I_{1,1} = n / sigma^2 = 8 / 2 = 4.
I_{2,2} = n / (2 * sigma^4) = 8 / (2 * 4) = 8 / 8 = 1.

The determinant is:
det(I_n) = I_{1,1} * I_{2,2} = 4 * 1 = 4.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_47',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Likelihood Ratio Test Asymptotic Null Distribution''',
    questionText: '''In testing a composite null hypothesis H_0: theta in Theta_0 against H_1: theta in Theta \ Theta_0:
Where Theta has dimension p and Theta_0 has dimension q (with q < p).
According to Wilks' Theorem, under standard regularity conditions and when H_0 is true:
As sample size n -> infinity, the likelihood ratio statistic -2 ln(Lambda) converges in distribution to:''',
    options: ['''Chi-squared distribution with p - q degrees of freedom, chi^2(p - q)''', '''Chi-squared distribution with p + q degrees of freedom, chi^2(p + q)''', '''Standard Normal distribution N(0, 1)''', '''F-distribution with (p, q) degrees of freedom'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Wilks' Theorem states that under the null hypothesis, the deviance statistic:
-2 ln(Lambda) = 2 [ max_{Theta} ln L(theta) - max_{Theta_0} ln L(theta) ]
converges asymptotically to a Chi-squared distribution whose degrees of freedom equal the difference in dimensions between the full parameter space and the restricted subspace:
df = dim(Theta) - dim(Theta_0) = p - q.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_48',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Bayes Estimator under Squared Error Loss''',
    questionText: '''In Bayesian parameter estimation, an unknown parameter theta has prior distribution theta ~ N(mu_0 = 10, sigma_0^2 = 4).
A single observation X is obtained from X | theta ~ N(theta, sigma^2 = 4).
If the observed value is X = 14:
Under the squared error loss function L(theta, d) = (theta - d)^2, what is the optimal Bayes estimate d*? (Answer as an integer).''',
    options: [],
    correctAnswer: '''12''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Under squared error loss, the Bayes estimator is the posterior mean:
d* = E[theta | X = x].

For Gaussian conjugate models with equal variances sigma_0^2 = sigma^2 = 4:
The posterior distribution is normal with mean:
mu_post = [ (mu_0 / sigma_0^2) + (x / sigma^2) ] / [ (1 / sigma_0^2) + (1 / sigma^2) ]
= [ (10 / 4) + (14 / 4) ] / [ (1/4) + (1/4) ]
= (24 / 4) / (2 / 4) = 24 / 2 = 12.

The Bayes estimate is 12.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_49',
    year: 2026,
    subject: '''Probability''',
    topic: '''Compound Poisson Process Variance''',
    questionText: '''Let S(t) = sum_{i=1}^{N(t)} Y_i be a Compound Poisson Process, where:
- N(t) is a Poisson process with arrival rate lambda = 3 events per day.
- The jump sizes Y_1, Y_2, ... are i.i.d. random variables, independent of N(t), with E[Y] = 2 and Var(Y) = 5.
What is the variance of the total accumulated sum after t = 2 days, Var(S(2))? (Answer as an integer).''',
    options: [],
    correctAnswer: '''54''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''By the Law of Total Variance (Wald's Identity for variance):
Var(S(t)) = E[N(t)] * Var(Y) + (E[Y])^2 * Var(N(t)).

For a Poisson process N(t) with parameter lambda * t:
E[N(t)] = Var(N(t)) = lambda * t.
Therefore:
Var(S(t)) = lambda * t * [ Var(Y) + (E[Y])^2 ] = lambda * t * E[Y^2].

Given:
lambda = 3, t = 2 => lambda * t = 3 * 2 = 6.
E[Y] = 2, Var(Y) = 5 => E[Y^2] = Var(Y) + (E[Y])^2 = 5 + 2^2 = 5 + 4 = 9.

Var(S(2)) = 6 * 9 = 54.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_50',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Gauss Markov and Generalized Least Squares''',
    questionText: '''Consider the linear regression model Y = X beta + epsilon, where X is full column rank, E[epsilon] = 0, and the error covariance matrix is Var(epsilon) = sigma^2 Sigma, with Sigma being a known positive definite symmetric matrix (not equal to identity).
Which of the following statements is/are TRUE?''',
    options: ['''The Generalized Least Squares (GLS) estimator beta_hat_GLS = (X^T Sigma^(-1) X)^(-1) X^T Sigma^(-1) Y is the Best Linear Unbiased Estimator (BLUE) of beta.''', '''The Ordinary Least Squares (OLS) estimator beta_hat_OLS = (X^T X)^(-1) X^T Y remains unbiased, but is generally less efficient than beta_hat_GLS.''', '''If Sigma = c * I for some scalar c > 0, the GLS estimator is identical to the OLS estimator.''', '''The OLS estimator achieves minimum variance under any arbitrary error covariance matrix Sigma.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis of statements:
A. By the Aitken Theorem (generalized Gauss-Markov theorem), the GLS estimator attains the minimum variance covariance matrix among all linear unbiased estimators when errors are correlated or heteroscedastic. (TRUE)
B. E[beta_hat_OLS] = (X^T X)^(-1) X^T E[Y] = beta, so OLS is unbiased. However, its variance is (X^T X)^(-1) X^T Sigma X (X^T X)^(-1), which is strictly greater than GLS variance in the Loewner order. (TRUE)
C. If Sigma = c I, Sigma^(-1) = (1/c) I, which cancels out in GLS: (X^T (1/c I) X)^(-1) X^T (1/c I) Y = (X^T X)^(-1) X^T Y. (TRUE)
D. OLS is only BLUE when Sigma = I (homoscedastic uncorrelated errors). (FALSE)

Correct options: A, B, C.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_51',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Longest Increasing Subsequence Length''',
    questionText: '''What is the length of the Longest Strictly Increasing Subsequence (LIS) in the following array of integers?
A = [10, 22, 9, 33, 21, 50, 41, 60, 80]
(Answer as an integer).''',
    options: [],
    correctAnswer: '''6''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Trace the strictly increasing subsequences:
Subsequence 1: 10 -> 22 -> 33 -> 50 -> 60 -> 80 (length 6).
Subsequence 2: 9 -> 21 -> 41 -> 60 -> 80 (length 5).
Subsequence 3: 10 -> 22 -> 33 -> 41 -> 60 -> 80 (length 6).

Can we achieve length 7?
Indices of [10, 22, 33, 50, 60, 80] are 0, 1, 3, 5, 7, 8 (total 6 elements).
No strictly increasing subsequence of length 7 exists.
The length of the LIS is 6.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_52',
    year: 2026,
    subject: '''Data Structures''',
    topic: '''B Tree Maximum Keys Capacity by Height''',
    questionText: '''A B-tree of order m = 5 (maximum branching factor 5) has height h = 2 (where a tree consisting solely of the root has height 0).
The maximum number of keys in any node is m - 1 = 4.
What is the MAXIMUM total number of keys that this entire B-tree of height 2 can store? (Answer as an integer).''',
    options: [],
    correctAnswer: '''124''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''In a B-tree of order m and height h:
Level 0 (root): 1 node, holding at most m - 1 keys.
Level 1: at most m nodes, each holding at most m - 1 keys.
Level 2: at most m^2 nodes, each holding at most m - 1 keys.
In general, level k has at most m^k nodes.

Total maximum keys across levels 0 to h:
Max keys = sum_{k=0}^h (m - 1) * m^k = (m - 1) * [ (m^(h+1) - 1) / (m - 1) ] = m^(h+1) - 1.

For order m = 5 and height h = 2:
Max keys = 5^(2 + 1) - 1 = 5^3 - 1 = 125 - 1 = 124.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_53',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Floyd Warshall Negative Cycle Detection''',
    questionText: '''In running the Floyd-Warshall algorithm on a directed graph with vertices {1, 2, ..., n}:
How can the algorithm detect that the graph contains a negative-weight cycle reachable from at least one vertex?''',
    options: ['''At the conclusion of the algorithm, at least one diagonal entry satisfies D[i][i] < 0.''', '''The distance matrix D contains at least one positive infinity entry.''', '''The algorithm runs for more than n passes without terminating.''', '''All off-diagonal entries are negative.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''In the Floyd-Warshall algorithm:
Initially, D[i][i] = 0 for all i (the cost of a path from a vertex to itself with 0 edges is 0).
If there is a negative-weight cycle containing vertex i (or reachable from and returning to i), the shortest path from i to i through the intermediate vertices will become strictly negative:
D[i][i] < 0.
Thus, checking if any D[i][i] < 0 detects negative cycles in O(n) time.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_54',
    year: 2026,
    subject: '''Programming in Python''',
    topic: '''Singleton Pattern via Metaclass Call''',
    questionText: '''Consider the following Python 3 program:
class SingletonMeta(type):
    _instances = {}
    def __call__(cls, *args, **kwargs):
        if cls not in cls._instances:
            cls._instances[cls] = super().__call__(*args, **kwargs)
        return cls._instances[cls]

class DatabaseConnection(metaclass=SingletonMeta):
    def __init__(self, port=5432):
        self.port = port

conn1 = DatabaseConnection(port=5432)
conn2 = DatabaseConnection(port=8000)
conn2.port = 9000
print(conn1.port)

What integer value is printed? (Answer as an integer).''',
    options: [],
    correctAnswer: '''9000''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Trace execution:
1. When conn1 = DatabaseConnection(5432) is called, SingletonMeta.__call__ is invoked.
Since DatabaseConnection is not in _instances, super().__call__ runs, initializing conn1 with port = 5432.
DatabaseConnection is cached in _instances.
2. When conn2 = DatabaseConnection(8000) is called, DatabaseConnection is already in _instances!
SingletonMeta.__call__ returns the cached instance conn1 without calling __init__ again.
Hence, conn1 and conn2 point to the EXACT SAME instance in memory (conn1 is conn2).
3. conn2.port = 9000 mutates the port attribute of the shared instance to 9000.
4. print(conn1.port) prints 9000.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_55',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Activity Selection Greedy Maximum Non Overlapping Interval Count''',
    questionText: '''Consider 6 intervals with (start, finish) times:
A_1: (1, 4)
A_2: (3, 5)
A_3: (0, 6)
A_4: (5, 7)
A_5: (3, 9)
A_6: (7, 9).
What is the MAXIMUM number of mutually compatible (non-overlapping) intervals that can be scheduled? (Answer as an integer).''',
    options: [],
    correctAnswer: '''3''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Apply the greedy Activity Selection algorithm (sorting by earliest finish time):
1. Pick A_1 (1, 4): finish = 4.
2. Next compatible interval with start >= 4 is A_4 (5, 7): finish = 7.
3. Next compatible interval with start >= 7 is A_6 (7, 9): finish = 9.

Total non-overlapping intervals scheduled = 3 (A_1, A_4, A_6).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_56',
    year: 2026,
    subject: '''DBMS''',
    topic: '''Sort Merge Join Disk IO Cost Model''',
    questionText: '''Consider joining two relations R and S on attribute A:
- Relation R has B(R) = 600 pages.
- Relation S has B(S) = 400 pages.
- Neither relation is initially sorted on the join attribute A.
The available buffer pool has M = 30 pages.
A Sort-Merge Join is used.
Sorting relation R requires a 2-pass external sort (cost = 2 * 2 * B(R) = 4 * 600 = 2400 I/Os).
Sorting relation S requires a 2-pass external sort (cost = 2 * 2 * B(S) = 4 * 400 = 1600 I/Os).
The merge phase makes one sequential pass over the sorted relations (cost = B(R) + B(S) = 600 + 400 = 1000 I/Os).
What is the total number of page I/Os required for the complete Sort-Merge Join? (Answer as an integer).''',
    options: [],
    correctAnswer: '''5000''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Cost breakdown for Sort-Merge Join:
1. Sort Phase for R:
Cost = 4 * B(R) = 4 * 600 = 2400 page I/Os.

2. Sort Phase for S:
Cost = 4 * B(S) = 4 * 400 = 1600 page I/Os.

3. Merge Phase:
Cost = B(R) + B(S) = 600 + 400 = 1000 page I/Os.

Total I/O:
Total = 2400 + 1600 + 1000 = 5000 page I/Os.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_57',
    year: 2026,
    subject: '''DBMS''',
    topic: '''Repeatable Read vs Serializable Phantom Anomaly''',
    questionText: '''Why does the SQL Repeatable Read isolation level allow Phantom Reads to occur, whereas it prevents Non-Repeatable Reads?''',
    options: ['''Repeatable Read acquires shared locks only on individual existing tuples that were read (preventing modifications to existing rows), but does not acquire predicate locks over the index range (allowing concurrent transactions to insert new rows that match the query predicate).''', '''Repeatable Read completely disables all lock acquisition.''', '''Repeatable Read only operates on temporary in-memory tables.''', '''Repeatable Read permits dirty reads of uncommitted transactions.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Under Repeatable Read, two-phase row locks are held on all existing records read by the transaction, ensuring that no concurrent transaction can modify or delete them (preventing Non-Repeatable Reads).
However, because no predicate or gap locks are placed on non-existent keys in the range, a concurrent transaction can insert brand-new rows that satisfy the search predicate. When the initial transaction re-executes the range query, these newly inserted records appear as "phantoms".
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_58',
    year: 2026,
    subject: '''DBMS''',
    topic: '''BCNF and Dependency Preservation Verification''',
    questionText: '''Consider relation schema R(A, B, C) with functional dependencies F = { A -> B, B -> C, C -> A }.
Suppose R is decomposed into D = { R_1(A, B), R_2(B, C) }.
Which of the following statements is/are TRUE?''',
    options: ['''The decomposition D is a lossless-join decomposition.''', '''Both R_1 and R_2 are in Boyce-Codd Normal Form (BCNF).''', '''The dependency C -> A is not preserved directly in D without computing a join.''', '''The decomposition D is in 4NF.'''],
    correctAnswer: '''A;B;C;D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis of decomposition:
1. Lossless Join: R_1 cap R_2 = {B}. Since B -> C and C -> A, B is a candidate key for R. Thus R_1 cap R_2 -> R_2, guaranteeing lossless join. (A is TRUE).
2. BCNF: In R_1(A, B), A -> B and B -> A (since B -> C -> A), so both A and B are keys. In R_2(B, C), B -> C and C -> B, so both B and C are keys. All determinants are superkeys. (B is TRUE).
3. Dependency Preservation: Dependencies in R_1 are A <-> B. Dependencies in R_2 are B <-> C. The FD C -> A cannot be enforced locally within R_1 or R_2 alone without joining them. (C is TRUE).
4. Since R_1 and R_2 have only functional dependencies and no non-trivial multi-valued dependencies, being in BCNF implies they are also in 4NF. (D is TRUE).

All statements A, B, C, and D are TRUE.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_59',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Kernel PCA Centering Matrix Property''',
    questionText: '''In Kernel Principal Component Analysis (Kernel PCA) on N data points with N x N Gram matrix K:
The centered kernel matrix is computed as K_tilde = H K H, where H = I_N - (1/N) 1_N 1_N^T is the centering projection matrix.
What is the trace of the centering matrix H, tr(H)?''',
    options: ['''N - 1''', '''N''', '''1''', '''0'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The centering matrix H is an orthogonal projection matrix onto the subspace orthogonal to the all-ones vector 1_N:
tr(H) = tr(I_N) - (1/N) * tr(1_N 1_N^T)
= N - (1/N) * tr(1_N^T 1_N)
= N - (1/N) * N = N - 1.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_60',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''t SNE Heavy Tailed Student t Kernel''',
    questionText: '''In the t-Distributed Stochastic Neighbor Embedding (t-SNE) dimensionality reduction algorithm:
Why is a Student-t distribution with 1 degree of freedom (Cauchy distribution) used to compute pairwise similarities in the low-dimensional embedding space, rather than a Gaussian distribution?''',
    options: ['''Because the heavy tails of the Student-t distribution allow moderately distant points in high dimensions to be placed much farther apart in low dimensions, resolving the "crowding problem".''', '''Because the Student-t distribution eliminates the need to compute gradients.''', '''Because Gaussian distributions cannot be normalized.''', '''To force the low-dimensional embedding to be strictly linear.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''In high dimensions, the volume of a sphere grows exponentially with dimension, so moderate distances accommodate vastly more points than in a 2D or 3D space.
Using a Gaussian kernel in low dimensions forces moderately distant points to crowd on top of each other at the center (the "crowding problem").
The heavy tails of the Cauchy (Student-t with df=1) kernel fall off as 1 / (1 + ||y_i - y_j||^2), allowing moderate distances to map to much larger physical separations in the embedding space without incurring massive repulsive penalties.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_61',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Adam Optimizer Second Moment Bias Correction Factor''',
    questionText: '''In the Adam optimizer with hyperparameter beta_2 = 0.96:
At time step t = 2, the raw exponentially decaying second moment estimate is v_2.
The bias-corrected second moment estimate is:
v_hat_2 = v_2 / (1 - beta_2^2).
What is the value of the denominator divisor, 1 - beta_2^2? (Answer as a decimal rounded to four decimal places).''',
    options: [],
    correctAnswer: '''0.0784''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Given beta_2 = 0.96 and t = 2:
beta_2^2 = (0.96)^2 = 0.9216.

The bias correction denominator is:
1 - beta_2^2 = 1 - 0.9216 = 0.0784.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_62',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Self Supervised Contrastive Learning Principles''',
    questionText: '''Which of the following statements regarding Self-Supervised Contrastive Learning (such as SimCLR and MoCo) is/are TRUE?''',
    options: ['''Positive pairs are constructed by applying different stochastic data augmentations (e.g. random cropping, color jitter) to the same underlying input instance.''', '''Negative pairs are formed using representations of other distinct images within the batch or memory bank.''', '''The InfoNCE loss acts as a lower bound on the mutual information I(X; Y) between the two augmented views.''', '''Contrastive learning requires massive human-annotated class labels for pre-training.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis of statements:
A. The core self-supervised signal comes from semantic invariance: two stochastic augmentations of the same image form a positive pair. (TRUE)
B. Negative pairs are drawn from all other instances in the batch or queue to push apart representations of different images. (TRUE)
C. By the InfoNCE theorem (van den Oord et al., 2018), minimizing InfoNCE loss maximizes a lower bound on the mutual information between the representations. (TRUE)
D. Contrastive learning is completely self-supervised and requires zero ground-truth class labels. (FALSE)

Correct options: A, B, C.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_63',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''Alpha Beta Optimal Move Ordering Leaf Evaluations''',
    questionText: '''Consider a game tree of depth d = 4 where every internal node has a branching factor b = 3.
The total number of leaf nodes in the tree is b^d = 3^4 = 81 leaves.
Under perfect (optimal) move ordering where the best moves are always examined first:
Alpha-beta pruning evaluates exactly 2 * b^(d/2) - 1 leaf nodes.
How many leaf nodes are evaluated under optimal move ordering? (Answer as an integer).''',
    options: [],
    correctAnswer: '''17''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''In a uniform game tree with branching factor b and depth d:
Under optimal move ordering, alpha-beta pruning achieves the theoretical lower bound on leaf evaluations:
Leaves evaluated = b^(ceil(d/2)) + b^(floor(d/2)) - 1 = 2 * b^(d/2) - 1  (when d is even).

Given b = 3 and d = 4:
d / 2 = 2.
b^(d/2) = 3^2 = 9.

Leaves evaluated = 2 * (9) - 1 = 18 - 1 = 17 leaves!
(Out of 81 total leaves, alpha-beta examines only 17, pruning 64 leaves).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_64',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''Refutational Completeness and Factoring''',
    questionText: '''In First-Order Logic theorem proving, why is binary resolution ALONE (without the Factoring inference rule) refutationally incomplete?''',
    options: ['''Because certain unsatisfiable clause sets (such as { P(x) or P(y), ~P(u) or ~P(v) }) will infinitely resolve without ever deriving the empty clause unless literals of the same sign are factored.''', '''Because binary resolution cannot resolve clauses with more than two literals.''', '''Because binary resolution cannot eliminate existential variables.''', '''Because binary resolution is only sound for propositional logic.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Consider the unsatisfiable clause set:
C_1: P(x) or P(y)
C_2: ~P(u) or ~P(v).
Resolving C_1 and C_2 yields P(y) or ~P(v), which resolves back with C_1 and C_2 indefinitely without ever shrinking to a single-literal clause or deriving the empty clause box (contradiction).
The Factoring rule unifies two literals in the same clause (P(x) or P(x) -> P(x) and ~P(u) or ~P(u) -> ~P(u)), which then resolve directly to the empty clause. Factoring is strictly required for refutational completeness of first-order resolution.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK10_CORE_65',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Categorical Cross Entropy Uniform Logits Value''',
    questionText: '''Consider a neural network classifying inputs into K = 8 mutually exclusive classes.
For an input sample whose true class is class 3 (y_3 = 1, and y_j = 0 for all j != 3):
The network produces identical pre-activation logits for all 8 classes: z_1 = z_2 = ... = z_8 = 5.0.
The categorical cross-entropy loss is L = -ln(y_hat_3), where y_hat = softmax(z).
What is the exact value of the loss L expressed in terms of natural logarithm ln(C)? What is the integer C?''',
    options: [],
    correctAnswer: '''8''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''When all K logits are equal (z_i = c for all i):
The softmax probability for every class is:
y_hat_i = exp(c) / sum_{j=1}^K exp(c) = exp(c) / (K * exp(c)) = 1 / K.

For K = 8:
y_hat_3 = 1 / 8.

The categorical cross-entropy loss is:
L = -ln(y_hat_3) = -ln(1 / 8) = ln(8).

Thus L = ln(C) where C = 8.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
];
