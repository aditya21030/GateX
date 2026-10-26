// AUTO-GENERATED MOCK 6 QUESTIONS (LEVEL 6: ELITE FACULTY DIFFICULTY)
import '../models/models.dart';

final List<PYQ> daFullMock6Questions = [
  PYQ(
    id: 'DA_MOCK6_GA_01',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Verbal Ability''',
    questionText: '''Choose the word that best completes the sentence:
"The security architect warned that adding biometric scanners was not a ________ for all cybersecurity vulnerabilities, as social engineering attacks could still compromise access."''',
    options: ['''hegemony''', '''panacea''', '''dichotomy''', '''hyperbole'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''A "panacea" is a remedy for all ills or difficulties; a universal cure-all.
The sentence states that biometric scanners cannot solve every single security vulnerability.
Hegemony means leadership/dominance; dichotomy means division into two opposed parts; hyperbole means exaggeration. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_GA_02',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Critical Reasoning''',
    questionText: '''Consider the statements:
1. Most software engineers in the department are proficient in Python.
2. Everyone proficient in Python understands dynamic typing.
Which of the following is a logically necessary conclusion?''',
    options: ['''All software engineers in the department understand dynamic typing.''', '''At least some software engineers in the department understand dynamic typing.''', '''Nobody who understands dynamic typing fails to be a software engineer.''', '''Dynamic typing cannot be understood without learning Python.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''From Premise 1, "Most software engineers" implies that there exists at least one (in fact, more than half) software engineer proficient in Python.
From Premise 2, everyone proficient in Python understands dynamic typing.
Therefore, those software engineers who are proficient in Python must necessarily understand dynamic typing.
Hence, "At least some software engineers in the department understand dynamic typing" is a valid and necessary conclusion. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_GA_03',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Calendar & Number Logic''',
    questionText: '''According to the Gregorian calendar rules: A century year is a leap year IF AND ONLY IF it is divisible by 400.
How many leap years are there in the 400-year cycle spanning from the year 2001 to 2400 (inclusive)?''',
    options: ['''96''', '''97''', '''100''', '''104'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''In a 400-year cycle:
1. Ordinary leap years occur every 4 years: 400 / 4 = 100 candidate leap years.
2. Century years in this span are 2100, 2200, 2300, and 2400 (4 century years).
3. Under the Gregorian rule, a century year is a leap year only if divisible by 400.
Among {2100, 2200, 2300, 2400}, only 2400 is divisible by 400.
The 3 century years 2100, 2200, and 2300 are NOT leap years.
Total leap years = 100 - 3 = 97.
Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_GA_04',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude''',
    questionText: '''A delivery drone travels three equal consecutive distances of 60 km each at constant speeds of 20 km/h, 30 km/h, and 60 km/h respectively.
What is the AVERAGE speed of the drone over the entire 180 km journey?''',
    options: ['''30 km/h''', '''36.7 km/h''', '''40 km/h''', '''45 km/h'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Average speed = (Total distance) / (Total time).
Total distance = 60 + 60 + 60 = 180 km.
Time for Segment 1: t1 = 60 / 20 = 3 hours.
Time for Segment 2: t2 = 60 / 30 = 2 hours.
Time for Segment 3: t3 = 60 / 60 = 1 hour.
Total time = 3 + 2 + 1 = 6 hours.
Average speed = 180 km / 6 h = 30 km/h.
(This is the Harmonic Mean of 20, 30, and 60: 3 / (1/20 + 1/30 + 1/60) = 3 / (6/60) = 30 km/h).
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_GA_05',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Spatial Aptitude''',
    questionText: '''A solid rectangular block of dimensions 3 cm x 4 cm x 5 cm has all six of its outer faces painted blue. It is then sliced parallel to its faces into 60 identical unit cubes (1 cm x 1 cm x 1 cm).
How many of these unit cubes have EXACTLY TWO painted faces?''',
    options: ['''16''', '''20''', '''24''', '''28'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Unit cubes with exactly two painted faces originate from the interior of the 12 edges of the block.
A rectangular block with dimensions a x b x c has 4 edges of length a, 4 edges of length b, and 4 edges of length c.
The number of edge unit cubes with 2 painted faces is:
4 * (a - 2) + 4 * (b - 2) + 4 * (c - 2).
Given a = 3, b = 4, c = 5:
- 4 * (3 - 2) = 4 * 1 = 4.
- 4 * (4 - 2) = 4 * 2 = 8.
- 4 * (5 - 2) = 4 * 3 = 12.
Total cubes with exactly 2 painted faces = 4 + 8 + 12 = 24.
Option C is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_GA_06',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude''',
    questionText: '''A tank has an inlet pipe P and a drainage leak L at the bottom. Pipe P alone can fill the empty tank in 8 hours. With the leak L active, it takes 12 hours to fill the tank.
If the tank is completely full and pipe P is closed, how many hours will the leak L alone take to empty the entire tank?''',
    options: ['''18 hours''', '''20 hours''', '''24 hours''', '''30 hours'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Let the capacity of the tank be LCM(8, 12) = 24 units.
Filling rate of pipe P = 24 / 8 = +3 units/hour.
Net filling rate of P with leak L = 24 / 12 = +2 units/hour.
Let emptying rate of leak L be r_L.
Net rate = Rate(P) - r_L
2 = 3 - r_L  =>  r_L = 3 - 2 = 1 unit/hour.
Time for leak L alone to empty 24 units = 24 units / 1 unit/hour = 24 hours.
Option C is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_GA_07',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Permutation and Combination''',
    questionText: '''In how many distinct ways can 5 distinct keys be arranged on a circular keyring if arrangements that can be obtained by flipping the keyring over (reflection) are considered identical?''',
    options: ['''12''', '''24''', '''48''', '''120'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''For circular arrangements where clockwise and counter-clockwise orders are distinguishable (e.g., people around a table), the number of circular permutations of n items is (n - 1)!.
When the arrangement can be viewed from both sides (flipped over, such as keys on a ring or beads on a necklace), clockwise and counter-clockwise arrangements become identical.
The number of distinct arrangements is:
(n - 1)! / 2.
For n = 5 keys:
(5 - 1)! / 2 = 4! / 2 = 24 / 2 = 12 ways.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_GA_08',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Critical Reasoning''',
    questionText: '''Read the excerpt from an algorithmic fairness report:
"An automated hiring model trained on historical promotion records scored female software developers lower on executive leadership traits. The audit committee concluded that the algorithm reflects an uncorrected historical societal bias rather than an intrinsic deficiency in female candidates."
Which of the following, if true, most strongly SUPPORTS the audit committeeâ€™s conclusion?''',
    options: ['''The company recently introduced an optional remote-work policy for engineering staff.''', '''Historically, promotion evaluation rubrics rewarded long, unscheduled late-night hours at the office, a metric that disproportionately disadvantaged employees with domestic caregiving responsibilities.''', '''Female software developers scored higher on automated unit testing benchmarks than their male counterparts.''', '''The machine learning model was an ensemble of 500 gradient-boosted decision trees.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Option B demonstrates that the historical data used to train the model was generated by a structurally skewed and biased evaluation rubric (penalizing caregivers rather than measuring actual leadership competence). This directly supports the committee's conclusion that the model learned historical bias rather than true candidate ability. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_GA_09',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Probability & Random Walk''',
    questionText: '''A robotic rover performs a 1D random walk on the integer line starting at position x = 2.
At each step, it moves to x + 1 with probability 1/2, or to x - 1 with probability 1/2.
The random walk terminates if the rover hits x = 0 (quarry) or x = 5 (recharging station).
What is the probability that the rover reaches the recharging station at x = 5 before hitting the quarry at x = 0?''',
    options: ['''2/5''', '''3/5''', '''1/2''', '''4/5'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''This is the classic Gambler's Ruin problem for an unbiased 1D random walk:
Let P(x) be the probability of reaching absorbing boundary N = 5 starting from state x, with absorbing boundary 0.
For a fair coin (p = q = 1/2), the probability satisfies the linear relation:
P(x) = x / N.
Here starting position x = 2 and target N = 5:
P(2) = 2 / 5 = 0.40.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_GA_10',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Geometry & Mensuration''',
    questionText: '''A right circular cone of base radius R = 6 cm and height H = 12 cm is sliced by a horizontal plane parallel to its base at height h = 6 cm above the base, forming a frustum.
What is the volume of the resulting lower frustum?''',
    options: ['''84 * pi cm^3''', '''108 * pi cm^3''', '''126 * pi cm^3''', '''144 * pi cm^3'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Total volume of original cone:
V_total = (1/3) * pi * R^2 * H = (1/3) * pi * 6^2 * 12 = 144 * pi cm^3.
The horizontal cut is made at height 6 cm above the base.
The top smaller cone that is removed has height H_top = 12 - 6 = 6 cm.
By similar triangles, its base radius is r = R * (H_top / H) = 6 * (6 / 12) = 3 cm.
Volume of top smaller cone:
V_top = (1/3) * pi * r^2 * H_top = (1/3) * pi * 3^2 * 6 = 18 * pi cm^3.
Volume of the frustum:
V_frustum = V_total - V_top = 144 * pi - 18 * pi = 126 * pi cm^3.
Option C is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_11',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Determinant of Block Upper Triangular Matrix''',
    questionText: '''Let M be a block upper triangular matrix:
M = [[A, B],
     [0, D]]
where A is an n x n square matrix, D is an m x m square matrix, B is an n x m matrix, and 0 is the m x n zero matrix.
The determinant of M is given by:''',
    options: ['''det(M) = det(A) * det(D)''', '''det(M) = det(A) * det(D) - det(B)''', '''det(M) = det(A) + det(D)''', '''det(M) = det(A * D - B)'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''For any block upper (or lower) triangular matrix where diagonal blocks A and D are square matrices:
By Laplace expansion or block LDU decomposition:
det([[A, B], [0, D]]) = det([[A, 0], [0, I]]) * det([[I, A^(-1)B], [0, D]]) = det(A) * det(D).
The off-diagonal block B has no effect on the determinant. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_12',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Frobenius Norm of Outer Product''',
    questionText: '''Let x = [2, 1, 2]^T in R^3 and y = [3, 4]^T in R^2.
Consider the 3 x 2 rank-1 outer product matrix A = x * y^T.
What is the Frobenius norm ||A||_F of matrix A? (Answer as an integer).''',
    options: [],
    correctAnswer: '''15''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''For any rank-1 outer product matrix A = x * y^T:
The Frobenius norm satisfies:
||x * y^T||_F = ||x||_2 * ||y||_2.
Compute Euclidean norms:
||x||_2 = sqrt(2^2 + 1^2 + 2^2) = sqrt(4 + 1 + 4) = sqrt(9) = 3.
||y||_2 = sqrt(3^2 + 4^2) = sqrt(9 + 16) = sqrt(25) = 5.
||A||_F = ||x||_2 * ||y||_2 = 3 * 5 = 15.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_13',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Normal Matrices and Spectral Theorem''',
    questionText: '''Let A be an n x n real matrix satisfying A * A^T = A^T * A (i.e., A is a normal matrix).
Which of the following statements is/are TRUE? (Select all that apply)''',
    options: ['''Every real symmetric matrix is a normal matrix.''', '''Every orthogonal matrix is a normal matrix.''', '''Every skew-symmetric matrix (A^T = -A) is a normal matrix.''', '''A normal matrix can never have complex eigenvalues.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: false,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: If A^T = A, then A A^T = A^2 = A^T A.
B is TRUE: If A^T A = I, then A A^T = I = A^T A.
C is TRUE: If A^T = -A, then A A^T = A(-A) = -A^2 = (-A)A = A^T A.
D is FALSE: Skew-symmetric matrices and orthogonal rotation matrices are normal, yet their eigenvalues are purely imaginary or complex conjugates on the unit circle (e.g., [[0, 1], [-1, 0]] has eigenvalues +/- i).
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_14',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Multivariable Mean Value Theorem''',
    questionText: '''Let f: R^n -> R be continuously differentiable on a convex open set U.
For any two points x, y in U, the Mean Value Theorem asserts that there exists a point z on the line segment connecting x and y (z = (1 - t)x + t y, for some t in (0, 1)) such that:''',
    options: ['''f(y) - f(x) = (nabla f(z))^T * (y - x)''', '''f(y) - f(x) = (nabla f(x))^T * (y - z)''', '''f(y) + f(x) = 2 * f(z)''', '''nabla f(z) = 0'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''By the Multivariable Mean Value Theorem (obtained by applying single-variable MVT to the scalar function g(t) = f(x + t(y - x)) on t in [0, 1]):
f(y) - f(x) = g(1) - g(0) = g'(t*) = (nabla f(z))^T (y - x), where z = x + t*(y - x) with t* in (0, 1).
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_15',
    year: 2026,
    subject: '''Optimization''',
    topic: '''Wolfe Conditions Curvature Parameter''',
    questionText: '''In numerical optimization with line search, the strong Wolfe conditions consist of the Armijo sufficient decrease condition and the curvature condition:
| (nabla f(x_k + alpha_k * p_k))^T * p_k | <= c_2 * | (nabla f(x_k))^T * p_k |.
To ensure that search steps satisfy sufficient progress, the parameter c_2 must satisfy which constraint with respect to the Armijo parameter c_1 in (0, 1)?''',
    options: ['''0 < c_1 < c_2 < 1''', '''0 < c_2 < c_1 < 1''', '''c_1 + c_2 = 1''', '''c_2 > 1'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''In optimization theory (Nocedal & Wright), the Wolfe conditions require 0 < c_1 < c_2 < 1. Typically, c_1 is chosen to be very small (e.g., 10^(-4)) for sufficient decrease, while c_2 is chosen larger (e.g., 0.9 for quasi-Newton, 0.1 for non-linear conjugate gradient) to ensure the step size is not unacceptably short. If c_2 <= c_1, the line search intervals can collapse. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_16',
    year: 2026,
    subject: '''Optimization''',
    topic: '''Strict Convexity and Uniqueness of Minima''',
    questionText: '''Which of the following statements regarding strictly convex functions is/are TRUE? (Select all that apply)''',
    options: ['''If a strictly convex function f: R^n -> R has a global minimum, that global minimum is UNIQUE.''', '''Every strictly convex function is convex, but not every convex function is strictly convex.''', '''If a twice-differentiable function has a strictly positive definite Hessian (nabla^2 f(x) > 0) for all x in R^n, then f is strictly convex.''', '''A strictly convex function can have a local minimum that is distinct from its global minimum.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: false,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: If x1* != x2* were two distinct minimizers with f(x1*) = f(x2*) = f*, then strict convexity requires f(0.5 x1* + 0.5 x2*) < 0.5 f* + 0.5 f* = f*, contradicting that f* is the minimum.
B is TRUE: Affine function f(x) = c^T x is convex, but not strictly convex.
C is TRUE: Strict positive definiteness of Hessian implies strict convexity everywhere.
D is FALSE: Any local minimum of a convex (and strictly convex) function is necessarily the global minimum.
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_17',
    year: 2026,
    subject: '''Probability''',
    topic: '''Beta Binomial Conjugate Family''',
    questionText: '''In Bayesian statistics, when modeling the parameter theta (success probability) of a Binomial likelihood, what is the conjugate prior distribution family for theta?''',
    options: ['''Normal distribution''', '''Beta distribution''', '''Poisson distribution''', '''Gamma distribution'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Likelihood: P(x | theta) proportional to theta^x (1 - theta)^(n - x).
Prior: p(theta) proportional to theta^(alpha - 1) (1 - theta)^(beta - 1) (Beta distribution).
Posterior: p(theta | x) proportional to theta^(alpha + x - 1) (1 - theta)^(beta + n - x - 1), which is Beta(alpha + x, beta + n - x).
Thus, Beta is the conjugate prior to the Binomial likelihood. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_18',
    year: 2026,
    subject: '''Probability''',
    topic: '''Gamma Distribution Expected Value''',
    questionText: '''A continuous random variable X follows a Gamma distribution with shape parameter alpha = 3 and rate parameter beta = 2, having probability density function:
f(x) = (beta^alpha / Gamma(alpha)) * x^(alpha - 1) * e^(-beta * x), for x > 0.
What is the EXPECTED value E[X]? (Round off to 1 decimal place).''',
    options: [],
    correctAnswer: '''1.5''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''For a Gamma distribution parameterized by shape alpha and rate beta:
E[X] = alpha / beta.
Given alpha = 3 and beta = 2:
E[X] = 3 / 2 = 1.5.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_19',
    year: 2026,
    subject: '''Statistics''',
    topic: '''ROC Curve Properties''',
    questionText: '''Which of the following statements regarding the Receiver Operating Characteristic (ROC) curve is/are TRUE? (Select all that apply)''',
    options: ['''The ROC curve plots the True Positive Rate (Sensitivity) on the y-axis against the False Positive Rate (1 - Specificity) on the x-axis across all decision thresholds.''', '''The Area Under the ROC Curve (ROC-AUC) equals the probability that the classifier will rank a randomly chosen positive instance higher than a randomly chosen negative instance.''', '''A completely random guessing classifier corresponds to the diagonal line connecting (0, 0) and (1, 1), with ROC-AUC = 0.5.''', '''The ROC curve shifts dramatically whenever the prior class prevalence in the test set changes.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: false,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: Standard definition of ROC curve axes: TPR vs FPR.
B is TRUE: Mann-Whitney U statistic equivalence proves that ROC-AUC = P(Score(Positive) > Score(Negative)).
C is TRUE: Random guessing has TPR = FPR at every threshold, tracing the diagonal with AUC = 0.5.
D is FALSE: Both TPR (TP / (TP + FN)) and FPR (FP / (FP + TN)) are evaluated within their respective true classes; they are mathematically invariant to changes in class prevalence.
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_20',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Sample Median Asymptotic Efficiency''',
    questionText: '''For an independent random sample of size n from a normal population N(mu, sigma^2):
The sample mean X_bar has variance sigma^2 / n.
The sample median M has asymptotic variance (pi / 2) * (sigma^2 / n).
The asymptotic relative efficiency of the sample median with respect to the sample mean, defined as Var(X_bar) / AsymptoticVar(M) = 2 / pi, is ________. (Round off to 2 decimal places).''',
    options: [],
    correctAnswer: '''0.64''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Asymptotic Relative Efficiency (ARE) is:
ARE = (sigma^2 / n) / ( (pi / 2) * (sigma^2 / n) ) = 1 / (pi / 2) = 2 / pi.
Since pi approx 3.14159:
2 / pi = 2 / 3.14159 approx 0.636619...
Rounding to 2 decimal places gives 0.64.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_21',
    year: 2026,
    subject: '''Data Structures & Algorithms''',
    topic: '''Simultaneous Min and Max Comparisons''',
    questionText: '''What is the MINIMUM number of comparisons required to find BOTH the minimum and the maximum elements in an unsorted array of n = 100 distinct numbers using the optimal tournament pairwise comparison strategy?''',
    options: ['''99''', '''148''', '''150''', '''198'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''By comparing elements in pairs:
Initialize min and max with the first pair (1 comparison).
For the remaining (n - 2) / 2 pairs:
Compare the two elements with each other (1 comparison), compare the smaller to current min (1 comparison), and compare the larger to current max (1 comparison) -> 3 comparisons per pair.
Total comparisons = 1 + 3 * ((100 - 2) / 2) = 1 + 3 * 49 = 1 + 147 = 148 comparisons.
(Formula: 3n/2 - 2 for even n; 3*100/2 - 2 = 148).
Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_22',
    year: 2026,
    subject: '''Data Structures & Algorithms''',
    topic: '''Complete Binary Tree Height''',
    questionText: '''A complete binary tree has n = 1000 nodes.
Let the height of a binary tree be defined such that a single-node tree has height 0.
What is the height of this complete binary tree? (Answer as an integer).''',
    options: [],
    correctAnswer: '''9''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''In a complete binary tree with n nodes:
The height h (with root at height 0) is given by:
h = floor(log_2(n)).
For n = 1000:
2^9 = 512 <= 1000 < 1024 = 2^10.
Therefore:
h = floor(log_2(1000)) = 9.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_23',
    year: 2026,
    subject: '''Data Structures & Algorithms''',
    topic: '''Trie Data Structure Properties''',
    questionText: '''Which of the following statements regarding the Trie (Prefix Tree) data structure is/are TRUE? (Select all that apply)''',
    options: ['''Searching for a key of length L in a Trie takes O(L) time, completely independent of the total number of keys stored in the Trie.''', '''All descendants of a node in a Trie share a common string prefix associated with that node.''', '''A Compressed Trie (Radix Tree or Patricia Trie) compresses chains of nodes with single children into a single edge, reducing node overhead.''', '''A Trie can only store binary strings and cannot support the English alphabet.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: false,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: Lookup requires following L character edges, taking O(L) time regardless of total keys N.
B is TRUE: Fundamental structural property of Tries (prefix trees).
C is TRUE: Radix trees merge non-branching paths into single multi-character edges.
D is FALSE: Tries can support any alphabet Sigma (e.g., lowercase English with branching factor 26, ASCII with 128/256, Unicode).
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_24',
    year: 2026,
    subject: '''Programming & Python''',
    topic: '''Recursion Limit and Stack Overflow''',
    questionText: '''In standard CPython, what exception is raised when a recursive function exceeds the maximum recursion depth limit set by `sys.getrecursionlimit()`?''',
    options: ['''MemoryError''', '''RecursionError''', '''StackOverflowException''', '''SystemError'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''In Python 3.5+, exceeding the recursion limit raises `RecursionError` (which inherits from `RecursionError -> RuntimeError`). Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_25',
    year: 2026,
    subject: '''Database Management Systems''',
    topic: '''WAL Redo and Undo Operations''',
    questionText: '''During crash recovery in a DBMS using Write-Ahead Logging (WAL) with Deferred Update:
If transaction T1 committed before the crash, and transaction T2 was still active (uncommitted) at the time of the crash:''',
    options: ['''T1 must be REDONE, and T2 must be UNDONE''', '''T1 must be UNDONE, and T2 must be REDONE''', '''Both T1 and T2 must be REDONE''', '''Both T1 and T2 must be UNDONE'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''In standard database recovery:
Transactions that committed (having a commit log record on disk, such as T1) must have their changes REDONE to guarantee Atomicity and Durability (some dirty pages may not have been written to disk).
Transactions that were active/uncommitted at the time of crash (such as T2) must have their partial modifications UNDONE to preserve Atomicity. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_26',
    year: 2026,
    subject: '''Database Management Systems''',
    topic: '''Dense vs Sparse Indexing''',
    questionText: '''In file organization and indexing, what is the prerequisite requirement for building a SPARSE index on a data file?''',
    options: ['''The search key must be a foreign key.''', '''The records in the data file must be physically sorted (ordered) by the search key on disk.''', '''The data file must contain fewer than 1000 records.''', '''All attributes must be in Boyce-Codd Normal Form.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''A sparse index contains an index entry only for some records (typically one entry per data block).
To find a record, the search locates the largest index key <= target key, and then sequentially scans that data block.
This sequential scan is valid ONLY IF the underlying records on disk are physically sorted by that search key. (If unclustered/unsorted, a DENSE index with an entry for every single record is required). Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_27',
    year: 2026,
    subject: '''Database Management Systems''',
    topic: '''Recoverable and ACA Schedules''',
    questionText: '''Which of the following statements regarding transactional schedules is/are TRUE? (Select all that apply)''',
    options: ['''A schedule is Recoverable if whenever transaction T_j reads a value written by T_i, T_i commits before T_j commits.''', '''A schedule Avoids Cascading Aborts (ACA) if transactions are permitted to read only values written by already committed transactions.''', '''Every schedule that Avoids Cascading Aborts (ACA) is strictly a Recoverable schedule.''', '''Every Recoverable schedule is guaranteed to Avoid Cascading Aborts.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: false,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: Definition of a Recoverable schedule.
B is TRUE: Definition of ACA (CasCadeless) schedule.
C is TRUE: Since reading only committed data implies the writing transaction has already committed, T_i has committed long before T_j commits, ensuring recoverability. (Hierarchy: Strict subseteq ACA subseteq Recoverable).
D is FALSE: A schedule can be recoverable while still suffering from cascading aborts (e.g., T2 reads uncommitted data from T1, but waits to commit until after T1 commits; if T1 aborts, T2 must cascade abort).
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_28',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Early Stopping as Implicit Regularization''',
    questionText: '''In gradient descent training of neural networks, Early Stopping acts as implicit regularization. Why?''',
    options: ['''Stopping early restricts the distance the weight vector w can travel from its initialization w_0, creating an effective constraint ||w - w_0|| <= R that is mathematically equivalent to L2 weight decay.''', '''Stopping early eliminates all activation functions.''', '''Stopping early converts non-convex loss into a linear program.''', '''Stopping early prevents the learning rate from decaying.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''SjÃ¶berg and Ljung (1995) and Bishop (1995) proved that on quadratic loss surfaces, running gradient descent with learning rate eta for t iterations is mathematically equivalent to L2 regularization with penalty parameter lambda proportional to 1 / (eta * t). Early stopping limits the norm of the weights, preventing the model from fitting high-frequency noise. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_29',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Softmax Temperature Scaling''',
    questionText: '''Consider a binary classification problem with logits z = [1.0, 3.0].
Using temperature-scaled softmax p_i = exp(z_i / T) / sum_j exp(z_j / T) with temperature T = 2.0:
Scaled logits become z / T = [0.5, 1.5].
What is the predicted probability p_2 for the second class? (Round off to 2 decimal places).''',
    options: [],
    correctAnswer: '''0.73''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Scaled logits:
z_1 / T = 1.0 / 2.0 = 0.5.
z_2 / T = 3.0 / 2.0 = 1.5.
Compute exponentials:
e^(0.5) approx 1.6487.
e^(1.5) approx 4.4817.
Sum = 1.6487 + 4.4817 = 6.1304.
Probability p_2 = e^(1.5) / Sum = 4.4817 / 6.1304 approx 0.73106...
Rounding to 2 decimal places gives 0.73.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_30',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Support Vector Machine Support Vectors''',
    questionText: '''Which of the following statements regarding Support Vector Machines (SVMs) is/are TRUE? (Select all that apply)''',
    options: ['''In a hard-margin SVM, removing any training data point that is NOT a support vector leaves the optimal separating hyperplane completely unchanged.''', '''The decision boundary depends only on the inner products between support vectors and the input vector.''', '''The Radial Basis Function (RBF) kernel K(x, z) = exp(- gamma * ||x - z||^2) maps inputs into an infinite-dimensional feature space.''', '''Increasing the RBF kernel parameter gamma causes the SVM decision boundary to become smoother and linear.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: false,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: Points with dual multipliers alpha_i = 0 do not enter the Karush-Kuhn-Tucker expansion w = sum alpha_i y_i x_i; removing them changes nothing.
B is TRUE: Prediction is sign(sum alpha_i y_i K(x_i, x) + b), depending only on support vectors.
C is TRUE: The Taylor series expansion of the Gaussian exponential contains infinitely many polynomial terms, corresponding to an infinite-dimensional RKHS.
D is FALSE: Increasing gamma makes the Gaussian bells narrower (sigma smaller), causing the decision boundary to wiggle and wrap tightly around individual points, leading to SEVERE OVERFITTING (not smoother).
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_31',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''K Fold vs Leave One Out Variance''',
    questionText: '''Why does Leave-One-Out Cross-Validation (LOOCV) often exhibit HIGHER variance in its performance estimate than 10-Fold Cross-Validation?''',
    options: ['''Because LOOCV averages across models trained on nearly identical, highly correlated training sets of size N - 1, and the variance of the mean of positively correlated variables is higher than for less correlated variables.''', '''Because LOOCV uses smaller training sets than 10-fold CV.''', '''Because LOOCV is computationally faster than 10-fold CV.''', '''Because LOOCV assumes the data follows a Poisson distribution.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''In LOOCV, each training fold contains N - 1 samples. The N trained models are almost identical because their training sets overlap by (N - 2)/(N - 1) approx 99.9%. Since the error estimates from each fold are strongly positively correlated, the variance of their average Var((1/N) sum e_i) = (1/N) Var(e_i) + ((N - 1)/N) Cov(e_i, e_j) is dominated by the large positive covariance term. 10-Fold CV uses less correlated training subsets, resulting in lower variance. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_32',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''Heuristic Dominance''',
    questionText: '''Let h_1(n) and h_2(n) be two admissible heuristic functions for an A* search problem.
Heuristic h_2 dominates h_1 if:
h_2(n) >= h_1(n) for all non-goal nodes n.
Which of the following guarantees holds?''',
    options: ['''A* using h_2 will never expand more nodes than A* using h_1 (up to tie-breaking).''', '''A* using h_1 is guaranteed to find a lower-cost path than A* using h_2.''', '''h_2 requires exponential time to evaluate compared to h_1.''', '''h_2 cannot be an admissible heuristic.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''By the Heuristic Dominance Theorem for A* search:
A more informed (higher) admissible heuristic h_2(n) >= h_1(n) pushes f(n) closer to the true optimal cost h*(n), pruning more search branches. Consequently, A* with h_2 expands a subset of the nodes expanded by A* with h_1 (barring tie-breaking). Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_33',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''Factoring in Resolution Refutation''',
    questionText: '''In First-Order Logic resolution theorem proving, why is the "Factoring" rule necessary in addition to binary resolution?''',
    options: ['''Because binary resolution alone is refutationally incomplete for clauses containing two or more literals that can be unified with each other.''', '''Because binary resolution cannot handle clauses with negative literals.''', '''To eliminate existential quantifiers.''', '''To speed up arithmetic division.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Consider the unsatisfiable clause set { P(x) or P(y), ~P(u) or ~P(v) }.
Resolving them directly produces P(y) or ~P(v), which can resolve forever without ever deriving the empty clause.
Factoring unifies two literals of the same sign within a single clause: P(x) or P(x) -> P(x).
Resolving factored clauses P(x) and ~P(u) immediately derives the empty clause (contradiction). Factoring is mathematically essential for refutational completeness. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_34',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''Policy Iteration Linear System Complexity''',
    questionText: '''In an MDP with |S| states and |A| actions, the Policy Evaluation step of Policy Iteration evaluates the value function V^pi by solving a system of linear equations.
What is the dimension of this linear system of equations?''',
    options: ['''|S| equations in |S| variables''', '''|S| * |A| equations in |A| variables''', '''|A| equations in |S| variables''', '''2^|S| equations'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''For a fixed policy pi, the Bellman expectation equation is:
V^pi(s) = R(s, pi(s)) + gamma * sum_{s'} P(s' | s, pi(s)) * V^pi(s').
This is a system of linear equations with exactly one linear equation for each state s in S, giving |S| equations in |S| unknown variables V^pi(s). Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_35',
    year: 2026,
    subject: '''Probability''',
    topic: '''Binomial Variance Calculation''',
    questionText: '''A random variable X follows a Binomial distribution with n = 100 trials and success probability p = 0.20.
What is the variance Var(X)? (Answer as an integer).''',
    options: [],
    correctAnswer: '''16''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''For a Binomial(n, p) distribution:
Var(X) = n * p * (1 - p).
Given n = 100 and p = 0.20:
1 - p = 0.80.
Var(X) = 100 * 0.20 * 0.80 = 20 * 0.80 = 16.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_36',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Generalized Rayleigh Quotient''',
    questionText: '''Let A and B be 2 x 2 symmetric positive-definite matrices:
A = [[8, 2], [2, 3]],  B = [[2, 0], [0, 1]].
Find the maximum value of the generalized Rayleigh quotient:
R(x) = (x^T A x) / (x^T B x)
over all non-zero vectors x in R^2. (Answer as an integer).''',
    options: [],
    correctAnswer: '''5''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''The maximum of the generalized Rayleigh quotient R(x) = (x^T A x) / (x^T B x) for positive-definite matrices is the largest generalized eigenvalue lambda satisfying:
det(A - lambda B) = 0.

Substitute A and B:
A - lambda B = [[8 - 2*lambda, 2], [2, 3 - lambda]].

Determinant equation:
(8 - 2*lambda)(3 - lambda) - (2)(2) = 0
24 - 8*lambda - 6*lambda + 2*lambda^2 - 4 = 0
2*lambda^2 - 14*lambda + 20 = 0
Dividing by 2:
lambda^2 - 7*lambda + 10 = 0
(lambda - 2)(lambda - 5) = 0.

The generalized eigenvalues are lambda_1 = 2 and lambda_2 = 5.
The maximum value of the Rayleigh quotient is max(lambda) = 5.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_37',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''SVD Nuclear Norm''',
    questionText: '''Consider the matrix:
M = [[3, 2, 2],
     [2, 3, -2]].
Find the nuclear norm (trace norm) ||M||_* = sum(sigma_i), which is the sum of the singular values of M. (Answer as an integer).''',
    options: [],
    correctAnswer: '''8''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''The singular values sigma_i of M are the square roots of the non-zero eigenvalues of M M^T.
Compute M M^T:
Row 1 dot Row 1: 3^2 + 2^2 + 2^2 = 9 + 4 + 4 = 17.
Row 1 dot Row 2: (3)(2) + (2)(3) + (2)(-2) = 6 + 6 - 4 = 8.
Row 2 dot Row 2: 2^2 + 3^2 + (-2)^2 = 4 + 9 + 4 = 17.

So M M^T = [[17, 8], [8, 17]].
Characteristic equation of M M^T:
(17 - lambda)^2 - 8^2 = 0
(17 - lambda)^2 = 64
17 - lambda = +- 8
lambda_1 = 17 + 8 = 25
lambda_2 = 17 - 8 = 9.

The singular values of M are:
sigma_1 = sqrt(25) = 5
sigma_2 = sqrt(9) = 3.

The nuclear norm is the sum of singular values:
||M||_* = sigma_1 + sigma_2 = 5 + 3 = 8.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_38',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Orthogonal Projection and Distance to Subspace''',
    questionText: '''Let W be the subspace of R^4 spanned by the orthogonal vectors:
v_1 = [1, 1, 1, 1]^T  and  v_2 = [1, -1, 1, -1]^T.
Let vector x = [2, 4, 6, 8]^T.
Find the squared Euclidean distance ||x - P_W x||^2 from x to its orthogonal projection P_W x onto W. (Answer as an integer).''',
    options: [],
    correctAnswer: '''16''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Because v_1 and v_2 are orthogonal (v_1 . v_2 = 1 - 1 + 1 - 1 = 0), the orthogonal projection of x onto W is:
P_W x = ((x . v_1) / ||v_1||^2) * v_1 + ((x . v_2) / ||v_2||^2) * v_2.

Compute norms and dot products:
||v_1||^2 = 1 + 1 + 1 + 1 = 4.
||v_2||^2 = 1 + 1 + 1 + 1 = 4.
x . v_1 = 2 + 4 + 6 + 8 = 20.
x . v_2 = 2 - 4 + 6 - 8 = -4.

P_W x = (20 / 4) * v_1 + (-4 / 4) * v_2 = 5 v_1 - v_2
P_W x = 5 [1, 1, 1, 1]^T - [1, -1, 1, -1]^T = [4, 6, 4, 6]^T.

The error vector is:
e = x - P_W x = [2, 4, 6, 8]^T - [4, 6, 4, 6]^T = [-2, -2, 2, 2]^T.

The squared Euclidean distance is:
||e||^2 = (-2)^2 + (-2)^2 + 2^2 + 2^2 = 4 + 4 + 4 + 4 = 16.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_39',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Matrix Exponential of Strictly Upper Triangular Matrix''',
    questionText: '''Let N be the 3 x 3 nilpotent matrix:
N = [[0, 3, 5],
     [0, 0, 4],
     [0, 0, 0]].
What is the entry in row 1, column 3 of the matrix exponential exp(2N)?
(Note: exp(M) = I + M + M^2/2! + M^3/3! + ...)''',
    options: ['''34''', '''10''', '''24''', '''48'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Compute powers of N:
N^2 = [[0, 3, 5], [0, 0, 4], [0, 0, 0]] * [[0, 3, 5], [0, 0, 4], [0, 0, 0]] = [[0, 0, 12], [0, 0, 0], [0, 0, 0]].
N^3 = 0 (all higher powers vanish).

For M = 2N:
exp(2N) = I + 2N + (2N)^2 / 2! + 0
exp(2N) = I + 2N + 2 N^2.

Let us find entry (1, 3):
Entry (1, 3) of I is 0.
Entry (1, 3) of 2N is 2 * 5 = 10.
Entry (1, 3) of 2 N^2 is 2 * 12 = 24.

Total entry (1, 3) = 0 + 10 + 24 = 34.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_40',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Minimal Polynomial and Jordan Form''',
    questionText: '''Let A be a 4 x 4 real matrix whose characteristic polynomial is p(lambda) = (lambda - 2)^3 (lambda - 5) and whose minimal polynomial is m(lambda) = (lambda - 2)^2 (lambda - 5).
Which of the following statements is/are TRUE?''',
    options: ['''A is diagonalizable over R.''', '''The geometric multiplicity of eigenvalue lambda = 2 is 2.''', '''rank(A - 2I) = 2.''', '''det(A) = 40.'''],
    correctAnswer: '''B;C;D''',
    isMCQ: false,
    type: 'MSQ',
    explanation: '''Analysis of statements:
1. Diagonalizability: A matrix is diagonalizable iff its minimal polynomial splits into distinct linear factors. Here m(lambda) has a repeated factor (lambda - 2)^2, so A is not diagonalizable. (A is FALSE).
2. Geometric multiplicity: The exponent of (lambda - 2) in m(lambda) gives the size of the largest Jordan block for lambda = 2, which is 2. The algebraic multiplicity is 3. The only partition of 3 with largest part 2 is 2 + 1. Thus there are 2 Jordan blocks for lambda = 2, meaning nullity(A - 2I) = geometric multiplicity = 2. (B is TRUE).
3. rank(A - 2I): By Rank-Nullity theorem on R^4, rank(A - 2I) = 4 - nullity(A - 2I) = 4 - 2 = 2. (C is TRUE).
4. Determinant: The determinant is the product of eigenvalues: 2^3 * 5 = 8 * 5 = 40. (D is TRUE).

Correct options: B, C, D.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_41',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Stokes Theorem Line Integral''',
    questionText: '''Evaluate the line integral:
oint_C F . dr
where F(x, y, z) = (y^2, z^2, x^2) and C is the triangular boundary of the plane x + y + z = 2 in the first octant with vertices (2, 0, 0), (0, 2, 0), and (0, 0, 2), oriented counter-clockwise when viewed from above. (Answer as an integer).''',
    options: [],
    correctAnswer: '''-8''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''By Stokes' Theorem:
oint_C F . dr = iint_S (curl F) . dS.

Compute curl F:
curl F = det |  i      j      k   |
             | d/dx  d/dy   d/dz  |
             | y^2    z^2    x^2  |
= i (0 - 2z) - j (2x - 0) + k (0 - 2y) = (-2z, -2x, -2y).

Surface S is the plane z = 2 - x - y over the projection triangle D on the xy-plane with vertices (0,0), (2,0), (0,2).
The upward normal vector is N = (1, 1, 1) dx dy.

(curl F) . N dx dy = (-2z - 2x - 2y) dx dy = -2(x + y + z) dx dy.
On the surface S, x + y + z = 2.
So (curl F) . N = -2(2) = -4.

The integral becomes:
iint_D -4 dx dy = -4 * Area(D).
Area of triangle D with legs 2 and 2 is (1/2) * 2 * 2 = 2.
Integral = -4 * 2 = -8.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_42',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Double Integral Transformation and Jacobian''',
    questionText: '''Evaluate the double integral:
iint_R (x + y)^3 (x - y) dx dy
over the parallelogram region R bounded by the lines:
x + y = 1,  x + y = 3,  x - y = 0,  x - y = 2.
(Answer as an integer).''',
    options: [],
    correctAnswer: '''20''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Use the change of variables:
u = x + y,  v = x - y.
The region R transforms into:
1 <= u <= 3,  0 <= v <= 2.

Compute the Jacobian:
d(u, v)/d(x, y) = det [[1, 1], [1, -1]] = -1 - 1 = -2.
The absolute value of the Jacobian is |J| = |d(x, y)/d(u, v)| = 1 / |-2| = 1/2.

The integral becomes:
int_{u=1}^3 int_{v=0}^2 u^3 * v * (1/2) dv du
= (1/2) * [int_{u=1}^3 u^3 du] * [int_{v=0}^2 v dv]
= (1/2) * [u^4 / 4]_{1}^{3} * [v^2 / 2]_{0}^{2}
= (1/2) * [(81 - 1) / 4] * [(4 - 0) / 2]
= (1/2) * [80 / 4] * [2]
= (1/2) * 20 * 2 = 20.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_43',
    year: 2026,
    subject: '''Optimization''',
    topic: '''KKT Multiplier Calculation''',
    questionText: '''Consider the optimization problem:
Minimize f(x, y) = (x - 4)^2 + (y - 4)^2
subject to:
x + y <= 4,
x >= 0,
y >= 0.
Let (x*, y*) be the global optimal solution. What is the value of the Lagrange multiplier mu_1 corresponding to the constraint x + y <= 4?''',
    options: ['''4''', '''2''', '''8''', '''0'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The objective represents the squared distance from (x, y) to (4, 4).
The constraint region is the triangle bounded by x=0, y=0, and x + y <= 4.
The closest point on x + y <= 4 to (4, 4) is (2, 2).
At (2, 2), x* > 0 and y* > 0, so the non-negativity constraints are inactive (mu_2 = mu_3 = 0).

The Lagrangian is:
L(x, y, mu_1) = (x - 4)^2 + (y - 4)^2 + mu_1 (x + y - 4).

Setting gradients to zero:
dL/dx = 2(x - 4) + mu_1 = 0 => mu_1 = -2(x - 4).
dL/dy = 2(y - 4) + mu_1 = 0 => mu_1 = -2(y - 4).

At (x*, y*) = (2, 2):
mu_1 = -2(2 - 4) = -2(-2) = 4.
Since mu_1 = 4 >= 0 and g_1(2, 2) = 0, the KKT conditions are fully satisfied.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_44',
    year: 2026,
    subject: '''Optimization''',
    topic: '''Multidimensional Newton Raphson Step''',
    questionText: '''Let f(x, y) = 2 x^2 + 3 y^2 - 2 x y - 6 x - 10 y + 15.
Starting from the initial point (x_0, y_0) = (0, 0), one step of the multivariate Newton-Raphson method is performed:
[x_1, y_1]^T = [x_0, y_0]^T - H^(-1) grad f(x_0, y_0),
where H is the Hessian matrix of f.
What is the sum x_1 + y_1? (Round off to one decimal place).''',
    options: [],
    correctAnswer: '''5.4''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Compute gradient:
df/dx = 4x - 2y - 6
df/dy = 6y - 2x - 10.
At (0, 0): grad f(0, 0) = [-6, -10]^T.

Compute Hessian H:
H = [[d^2f/dx^2, d^2f/dxdy], [d^2f/dydx, d^2f/dy^2]] = [[4, -2], [-2, 6]].
det(H) = (4)(6) - (-2)^2 = 24 - 4 = 20.

Invert Hessian:
H^(-1) = (1/20) [[6, 2], [2, 4]].

Compute Newton step H^(-1) grad f(0, 0):
H^(-1) [-6, -10]^T = (1/20) [[6(-6) + 2(-10)], [2(-6) + 4(-10)]]
= (1/20) [[-36 - 20], [-12 - 40]]
= (1/20) [-56, -52]^T = [-2.8, -2.6]^T.

Update:
[x_1, y_1]^T = [0, 0]^T - [-2.8, -2.6]^T = [2.8, 2.6]^T.

Sum:
x_1 + y_1 = 2.8 + 2.6 = 5.4.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_45',
    year: 2026,
    subject: '''Probability''',
    topic: '''Bivariate Normal Conditional Expectation''',
    questionText: '''Let (X, Y) have a Bivariate Normal distribution with parameters:
mu_X = 10,  mu_Y = 20,  sigma_X^2 = 16,  sigma_Y^2 = 25,  rho = 0.60.
Find the conditional expectation E[Y | X = 14]. (Answer as an integer).''',
    options: [],
    correctAnswer: '''23''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''For a bivariate normal distribution, the conditional distribution of Y given X = x is normal with mean:
E[Y | X = x] = mu_Y + rho * (sigma_Y / sigma_X) * (x - mu_X).

Given:
mu_X = 10, mu_Y = 20
sigma_X = sqrt(16) = 4
sigma_Y = sqrt(25) = 5
rho = 0.60
x = 14.

Substitute values:
E[Y | X = 14] = 20 + 0.60 * (5 / 4) * (14 - 10)
= 20 + 0.60 * 1.25 * 4
= 20 + 0.60 * 5 = 20 + 3 = 23.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_46',
    year: 2026,
    subject: '''Probability''',
    topic: '''Markov Chain Expected Return Time''',
    questionText: '''Consider a discrete-time Markov chain with state space {1, 2, 3} and transition probability matrix:
P = [[0.50, 0.50, 0.00],
     [0.25, 0.50, 0.25],
     [0.00, 0.50, 0.50]].
Find the expected return time to state 2, defined as mu_22 = 1 / pi_2, where pi is the stationary distribution. (Answer as an integer).''',
    options: [],
    correctAnswer: '''2''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''The stationary distribution satisfies pi * P = pi and sum(pi_i) = 1.
pi_1 = 0.5 pi_1 + 0.25 pi_2 => 0.5 pi_1 = 0.25 pi_2 => pi_1 = 0.5 pi_2.
pi_3 = 0.25 pi_2 + 0.5 pi_3 => 0.5 pi_3 = 0.25 pi_2 => pi_3 = 0.5 pi_2.

Normalization:
pi_1 + pi_2 + pi_3 = 1
0.5 pi_2 + pi_2 + 0.5 pi_2 = 1
2 pi_2 = 1 => pi_2 = 0.50.

The expected return time to state 2 is:
mu_22 = 1 / pi_2 = 1 / 0.50 = 2.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_47',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Lehmann-Scheffe Theorem and UMVUE''',
    questionText: '''Let X_1, X_2, ..., X_n be an i.i.d. sample from a continuous Uniform distribution U(0, theta), where theta > 0 is unknown.
Let T = X_(n) = max(X_1, ..., X_n) be the sample maximum.
What is the Uniformly Minimum Variance Unbiased Estimator (UMVUE) of theta^2?''',
    options: ['''((n + 2) / n) * (X_(n))^2''', '''((n + 1) / n)^2 * (X_(n))^2''', '''((n + 1) / n) * (X_(n))^2''', '''4 * (X_bar)^2'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The statistic T = X_(n) is complete and sufficient for theta.
By the Lehmann-Scheffe theorem, any unbiased estimator that is a function of a complete sufficient statistic is the unique UMVUE.

The PDF of T = X_(n) is:
f_T(t) = n * t^(n-1) / theta^n, for 0 <= t <= theta.

Compute the expectation of T^2:
E[T^2] = int_0^theta t^2 * (n * t^(n-1) / theta^n) dt
= (n / theta^n) * int_0^theta t^(n+1) dt
= (n / theta^n) * (theta^(n+2) / (n + 2))
= (n / (n + 2)) * theta^2.

Therefore:
E[((n + 2) / n) * T^2] = ((n + 2) / n) * (n / (n + 2)) * theta^2 = theta^2.

Thus, ((n + 2) / n) * (X_(n))^2 is unbiased for theta^2 and a function of the complete sufficient statistic, making it the unique UMVUE. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_48',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Likelihood Ratio Test Degrees of Freedom''',
    questionText: '''In a multinomial goodness-of-fit test with k = 6 mutually exclusive categories, we test the null hypothesis:
H_0: p_1 = p_2 = ... = p_6 = 1/6
against H_1: at least one p_i != 1/6.
By Wilks' theorem, as the sample size n -> infinity, the deviance test statistic -2 ln(Lambda) converges in distribution to a Chi-squared distribution chi^2(d).
What is the degrees of freedom d? (Answer as an integer).''',
    options: [],
    correctAnswer: '''5''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Under Wilks' theorem, the asymptotic distribution of -2 ln(Lambda) is chi^2(d), where:
d = dim(Theta) - dim(Theta_0).

Under H_1 (unrestricted multinomial model):
sum_{i=1}^k p_i = 1, so there are k - 1 free parameters.
For k = 6, dim(Theta) = 6 - 1 = 5.

Under H_0:
All probabilities are completely specified (p_i = 1/6), so dim(Theta_0) = 0 free parameters.

Degrees of freedom:
d = 5 - 0 = 5.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_49',
    year: 2026,
    subject: '''Probability''',
    topic: '''Order Statistics Expectation''',
    questionText: '''Let X_1, X_2, X_3, X_4 be 4 independent and identically distributed random variables uniformly distributed on the interval [0, 10].
Let X_(2) denote the second smallest order statistic (i.e., X_(1) <= X_(2) <= X_(3) <= X_(4)).
What is the expected value E[X_(2)]? (Answer as an integer).''',
    options: [],
    correctAnswer: '''4''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''For n i.i.d. Uniform(0, L) random variables, the k-th order statistic X_(k) follows a scaled Beta distribution:
X_(k) / L ~ Beta(k, n - k + 1).

The expectation is:
E[X_(k)] = (k / (n + 1)) * L.

Here:
n = 4, k = 2, and L = 10.
E[X_(2)] = (2 / (4 + 1)) * 10 = (2 / 5) * 10 = 4.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_50',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Sum of Exponentials and Chi-Squared Distribution''',
    questionText: '''Let X_1, X_2, ..., X_n be independent and identically distributed Exponential random variables with parameter lambda > 0 (PDF f(x) = lambda e^(-lambda x), x > 0).
The pivotal quantity:
Q = 2 lambda * sum_{i=1}^n X_i
follows which exact probability distribution?''',
    options: ['''Chi-squared distribution with 2n degrees of freedom, chi^2(2n)''', '''Chi-squared distribution with n degrees of freedom, chi^2(n)''', '''Standard Normal distribution N(0, 1)''', '''Student t-distribution with n - 1 degrees of freedom'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''For each Exponential(lambda) variable X_i:
2 lambda X_i follows an Exponential distribution with rate 1/2, which is identical to a Chi-squared distribution with 2 degrees of freedom (Gamma(shape=1, scale=2) = chi^2(2)).

Because the sum of independent chi^2 random variables is also chi^2 with degrees of freedom equal to the sum of degrees of freedom:
Q = sum_{i=1}^n (2 lambda X_i) ~ chi^2(2 * n) = chi^2(2n).

This exact pivotal quantity is used to construct exact confidence intervals and hypothesis tests for the exponential scale/rate parameter. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_51',
    year: 2026,
    subject: '''Probability''',
    topic: '''Bayesian Inference with Beta Prior and Laplace Succession''',
    questionText: '''A coin has an unknown probability of landing Heads, denoted by p. A Bayesian learner assigns a uniform prior p ~ Uniform(0, 1) = Beta(1, 1).
The coin is flipped 2 times and lands Heads both times (H, H).
What is the posterior predictive probability that the 3rd flip will also land Heads? (Answer as a decimal rounded to two decimal places).''',
    options: [],
    correctAnswer: '''0.75''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Prior: p ~ Beta(alpha_0, beta_0) = Beta(1, 1).
Data: 2 heads, 0 tails in n = 2 flips.

Posterior:
p | data ~ Beta(alpha_0 + k, beta_0 + (n - k)) = Beta(1 + 2, 1 + 0) = Beta(3, 1).

The predictive probability that the next toss is Heads is the posterior mean:
P(X_3 = H | data) = E[p | data] = alpha / (alpha + beta)
= 3 / (3 + 1) = 3 / 4 = 0.75.
(This is also known as Laplace's Rule of Succession: (k + 1) / (n + 2) = (2 + 1) / (2 + 2) = 3/4 = 0.75).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_52',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Gauss-Markov Theorem and OLS Properties''',
    questionText: '''Consider the linear regression model Y = X beta + epsilon, where X is an n x p matrix of full column rank p, E[epsilon] = 0, and Var(epsilon) = sigma^2 I_n.
Let beta_hat = (X^T X)^(-1) X^T Y and e = Y - X beta_hat.
Which of the following statements is/are TRUE?''',
    options: ['''beta_hat is the Best Linear Unbiased Estimator (BLUE) of beta.''', '''The residual vector e is orthogonal to the column space of X, i.e., X^T e = 0.''', '''s^2 = (e^T e) / (n - p) is an unbiased estimator of sigma^2.''', '''If the error covariance is heteroscedastic (Var(epsilon) = sigma^2 Sigma, Sigma != I), beta_hat remains unbiased, but is generally no longer BLUE.'''],
    correctAnswer: '''A;B;C;D''',
    isMCQ: false,
    type: 'MSQ',
    explanation: '''Analysis of statements:
A. By the Gauss-Markov Theorem, under homoscedasticity and zero-mean uncorrelated errors, the OLS estimator beta_hat has minimum variance among all linear unbiased estimators (BLUE). (TRUE)
B. The normal equations are X^T (Y - X beta_hat) = 0 => X^T e = 0, proving residuals are orthogonal to every regressor column. (TRUE)
C. E[e^T e] = sigma^2 (n - p), so s^2 = (e^T e) / (n - p) is an unbiased estimator of sigma^2. (TRUE)
D. Unbiasedness of OLS depends only on E[epsilon] = 0 (E[beta_hat] = beta regardless of error variance structure). However, under heteroscedasticity, the Generalized Least Squares (GLS) estimator has strictly smaller variance, so OLS is no longer BLUE. (TRUE)

All statements A, B, C, and D are TRUE.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_53',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Johnsons Algorithm Edge Reweighting''',
    questionText: '''Johnson's algorithm for all-pairs shortest paths reweights each directed edge (u, v) with original weight w(u, v) using vertex potentials h(u) and h(v) derived from Bellman-Ford as:
w_hat(u, v) = w(u, v) + h(u) - h(v).
Suppose an edge (u, v) has original weight w(u, v) = -7, and the computed shortest path potentials from the source are h(u) = -3 and h(v) = -10.
What is the reweighted edge weight w_hat(u, v)? (Answer as an integer).''',
    options: [],
    correctAnswer: '''0''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''The formula for the reweighted edge weight in Johnson's algorithm is:
w_hat(u, v) = w(u, v) + h(u) - h(v).

Substitute the given values:
w(u, v) = -7
h(u) = -3
h(v) = -10

w_hat(u, v) = -7 + (-3) - (-10)
= -7 - 3 + 10 = -10 + 10 = 0.

Notice that by the triangle inequality of shortest paths, h(v) <= h(u) + w(u, v), so w_hat(u, v) is always non-negative, enabling Dijkstra's algorithm.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_54',
    year: 2026,
    subject: '''Data Structures''',
    topic: '''B-Tree Minimum Keys in Internal Nodes''',
    questionText: '''Consider a B-tree of order m = 5 (where m denotes the maximum number of children an internal node can have).
What is the minimum number of keys that any non-root internal node must contain?''',
    options: ['''2''', '''3''', '''1''', '''4'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''In a B-tree of order m:
- The maximum number of children is m.
- The maximum number of keys is m - 1 = 5 - 1 = 4.
- Any non-root internal node must have at least ceil(m / 2) children.
For m = 5, ceil(5 / 2) = 3 children.
- A node with k children contains exactly k - 1 keys.
Therefore, the minimum number of keys in any non-root internal node is:
ceil(m / 2) - 1 = 3 - 1 = 2 keys.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_55',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Longest Common Subsequence Length''',
    questionText: '''Find the length of the Longest Common Subsequence (LCS) between the following two strings:
String X: "ALGORITHM"
String Y: "LOGARITHMIC"
(Answer as an integer).''',
    options: [],
    correctAnswer: '''7''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Let us trace the characters:
X: A, L, G, O, R, I, T, H, M (length 9)
Y: L, O, G, A, R, I, T, H, M, I, C (length 11)

Notice the suffix "R, I, T, H, M" of length 5 is identical and ordered in both X and Y.
Before R:
In X, the prefix is "A, L, G, O".
In Y, the prefix is "L, O, G, A".

In X, L is followed by G then O.
In Y, L is followed by O then G.
We can pick L (1 char), plus either O or G (1 char), giving at most 2 characters: "L, G" or "L, O".
Can we pick "A"? If we pick "A" from Y (at index 3), we cannot pick L, O, or G from Y. So prefix yields at most 1 character "A".
Hence the maximum common prefix subsequence has length 2 (e.g., "L, G" or "L, O").

Combining with suffix "R, I, T, H, M" (length 5):
Common subsequence: "L, G, R, I, T, H, M" (length 7) or "L, O, R, I, T, H, M" (length 7).
No common subsequence of length 8 exists.
The length of the LCS is 7.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_56',
    year: 2026,
    subject: '''Programming in Python''',
    topic: '''Descriptor Protocol Priority''',
    questionText: '''Consider the following Python 3 program:
class Metric:
    def __init__(self):
        self._val = 10
    def __get__(self, obj, objtype=None):
        return self._val * 2
    def __set__(self, obj, value):
        self._val = value + 5

class Model:
    metric = Metric()
    def __init__(self):
        self.metric = 20

m1 = Model()
m2 = Model()
m1.metric = 30
print(m2.metric)

What is the output of this code?''',
    options: ['''70''', '''60''', '''50''', '''40'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''In Python, an object defining both __get__ and __set__ is a data descriptor.
Data descriptors defined on the class take precedence over instance __dict__ attributes.

1. When m1 = Model() is executed, Model.__init__ calls self.metric = 20.
This invokes Metric.__set__(m1.metric, m1, 20), which sets Metric._val = 20 + 5 = 25.
2. When m2 = Model() is executed, it runs self.metric = 20 again, setting Metric._val = 25.
3. Next, m1.metric = 30 executes Metric.__set__(m1.metric, m1, 30), which updates Metric._val = 30 + 5 = 35.
Notice both m1 and m2 share the SAME class-level Metric instance.
4. Finally, print(m2.metric) invokes Metric.__get__(m2.metric, m2, Model), which returns:
self._val * 2 = 35 * 2 = 70.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_57',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Amortized Cost of Dynamic Array Table Doubling''',
    questionText: '''A dynamic table starts empty with capacity 1.
When an element is inserted:
- If the current table has space, insertion costs 1 basic unit of work.
- If the table of capacity N is full, inserting costs N + 1 basic units (allocating a new table of capacity 2N, copying N existing elements, and inserting the new element).
Using the accounting method, each insertion is charged an amortized cost of \$c.
What is the minimum integer dollar charge c that guarantees the credit bank never drops below zero?''',
    options: [],
    correctAnswer: '''3''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Consider table doubling from size N to 2N:
Right after doubling, the table contains N elements and has room for N more insertions without any copying.
Over the next N insertions:
Each inserted item must:
1. Pay \$1 for its own immediate insertion.
2. Deposit \$1 in credit to pay for its own future relocation when table expands from 2N to 4N.
3. Deposit \$1 in credit to pay for one of the older N elements that was copied previously and has zero credit.
Total charge per insertion:
c = 1 + 1 + 1 = \$3.
With c = 3, after N insertions, \$2N credit is accumulated, exactly paying for copying all 2N elements when table doubles again.
The minimum integer amortized cost is 3.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_58',
    year: 2026,
    subject: '''DBMS''',
    topic: '''Grace Hash Join IO Cost''',
    questionText: '''Two relations R and S have sizes B(R) = 400 pages and B(S) = 1200 pages.
The database system has M = 21 buffer pages available in memory.
A Grace Hash Join is performed on R and S.
Assume that during the partitioning phase, R and S are partitioned into k = 20 partitions such that each partition of R fits into memory (i.e., size <= M - 1 = 20 pages), requiring no recursive partitioning.
What is the total number of page I/Os (reads + writes) performed by the Grace Hash Join?
(Do not count writing the final output relation to disk). (Answer as an integer).''',
    options: [],
    correctAnswer: '''4800''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Cost model for Grace Hash Join:
1. Partitioning Phase:
- Read relation R: B(R) = 400 I/Os.
- Write partitioned hash buckets of R to disk: B(R) = 400 I/Os.
- Read relation S: B(S) = 1200 I/Os.
- Write partitioned hash buckets of S to disk: B(S) = 1200 I/Os.
Total Partitioning I/O = 2 * (B(R) + B(S)) = 2 * (400 + 1200) = 3200 I/Os.

2. Probing (Matching) Phase:
- Read each partition of R into memory to build hash table: B(R) = 400 I/Os.
- Read each corresponding partition of S to probe: B(S) = 1200 I/Os.
Total Probing I/O = B(R) + B(S) = 400 + 1200 = 1600 I/Os.

Total I/O = 3 * (B(R) + B(S)) = 3 * (400 + 1200) = 3 * 1600 = 4800 page I/Os.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_59',
    year: 2026,
    subject: '''DBMS''',
    topic: '''Relational Division and DRC Equivalence''',
    questionText: '''Let R(A, B) and S(B) be two relation schemas. The relational division operator is defined as R / S.
Which of the following Domain Relational Calculus (DRC) expressions correctly represents R / S?''',
    options: ['''{ <a> | forall b ( <b> in S => <a, b> in R ) }''', '''{ <a> | exists b ( <b> in S and <a, b> in R ) }''', '''{ <a> | forall b ( <a, b> in R => <b> in S ) }''', '''{ <a, b> | <b> in S or <a, b> in R }'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Relational division R / S produces all values 'a' such that for EVERY value 'b' present in S, the tuple (a, b) appears in R.
In formal logic, this is:
forall b ( b in S implies (a, b) in R ).
Option A is the exact Domain Relational Calculus formulation.
Option B is the projection of the natural join (semi-join).
Option C is a different restriction. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_60',
    year: 2026,
    subject: '''DBMS''',
    topic: '''Conflict Serializability and Strict 2PL''',
    questionText: '''Consider the following concurrent schedule S involving three transactions T_1, T_2, and T_3:
S: r_1(A); w_1(A); r_2(A); r_3(B); w_2(B); c_2; c_1; c_3;
Where r_i(X), w_i(X), and c_i denote read, write, and commit operations on item X by transaction T_i.
Which of the following statements is/are TRUE?''',
    options: ['''Schedule S is conflict serializable.''', '''Schedule S is recoverable.''', '''Schedule S avoids cascading aborts.''', '''Schedule S cannot be produced under the Strict Two-Phase Locking (Strict 2PL) protocol.'''],
    correctAnswer: '''A;D''',
    isMCQ: false,
    type: 'MSQ',
    explanation: '''Analysis of properties:
1. Conflict Serializability:
Conflicts in S:
- w_1(A) before r_2(A) => directed edge T_1 -> T_2.
- r_3(B) before w_2(B) => directed edge T_3 -> T_2.
The serialization graph has edges {T_1 -> T_2, T_3 -> T_2} with no cycles. Topological sort exists (e.g., T_1, T_3, T_2). Thus S is conflict serializable. (Statement A is TRUE).

2. Recoverability:
T_2 reads item A written by T_1 (dirty read). T_2 commits (c_2) BEFORE T_1 commits (c_1). If T_1 aborts, T_2 cannot be rolled back because it already committed. Thus S is NOT recoverable. (Statement B is FALSE).

3. Cascading Aborts:
Since T_2 reads uncommitted data from T_1, S allows dirty reads, so it does not avoid cascading aborts. (Statement C is FALSE).

4. Strict 2PL:
Strict 2PL requires that any transaction holding an exclusive lock on an item retains it until the transaction commits. T_1 writes A, so it must hold an exclusive lock on A until c_1. Therefore, T_2 cannot acquire a shared/read lock on A to execute r_2(A) before c_1. Thus S cannot be generated by Strict 2PL. (Statement D is TRUE).

Correct options: A, D.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_61',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''VAE Reparameterization Trick''',
    questionText: '''In Variational Autoencoders (VAEs), what is the fundamental mathematical reason for using the reparameterization trick:
z = mu_phi(x) + sigma_phi(x) odot epsilon,  where epsilon ~ N(0, I),
instead of sampling directly from z ~ q_phi(z | x) = N(mu_phi(x), diag(sigma_phi^2(x)))?''',
    options: ['''To allow backpropagation of gradients with respect to the encoder parameters phi by making the stochastic node parameter-free.''', '''To ensure the decoder network avoids posterior collapse when training with a Gaussian likelihood.''', '''To force the latent distribution to be strictly bounded within [-1, 1].''', '''To eliminate the need for computing the Kullback-Leibler (KL) divergence term analytically.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Direct sampling from a distribution parametrized by phi creates a non-differentiable stochastic sampling node, preventing backpropagation of the loss gradient dL/dphi through the network.
The reparameterization trick expresses z as a deterministic, differentiable function of phi and an auxiliary noise variable epsilon ~ N(0, I).
Because epsilon has no dependence on phi, the chain rule can be directly applied to propagate gradients through mu_phi and sigma_phi:
d/dphi E_{q_phi}[f(z)] = E_epsilon [ (df/dz) * (dz/dphi) ].
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_62',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''InfoNCE Contrastive Loss Upper Bound''',
    questionText: '''In self-supervised contrastive learning, the InfoNCE loss for an anchor sample with one positive pair and K negative pairs is:
L_InfoNCE = -ln [ exp(s^+ / tau) / ( exp(s^+ / tau) + sum_{j=1}^K exp(s_j^- / tau) ) ].
Suppose representation collapse occurs such that the model outputs identical normalized representations for all instances, causing all similarity scores to be equal (i.e., s^+ = s_1^- = ... = s_K^-).
If K = 99, what is the value of the collapsed loss L_InfoNCE expressed as ln(C)? What is the integer C?''',
    options: [],
    correctAnswer: '''100''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Let the common score be s.
Then exp(s^+ / tau) = exp(s / tau).
Each negative term is exp(s_j^- / tau) = exp(s / tau).

The sum in the denominator has 1 positive term and K negative terms, giving:
exp(s / tau) + K * exp(s / tau) = (1 + K) * exp(s / tau).

The fraction inside the logarithm becomes:
exp(s / tau) / [ (1 + K) * exp(s / tau) ] = 1 / (1 + K).

Therefore, the loss is:
L_InfoNCE = -ln(1 / (1 + K)) = ln(1 + K).

For K = 99 negative pairs:
1 + K = 1 + 99 = 100.
L_InfoNCE = ln(100).
Thus, C = 100.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_63',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Attention Logits Matrix Computation Operations''',
    questionText: '''In a Transformer self-attention block, let the sequence length be n = 50 and the embedding dimension per head be d = 40.
The query and key matrices are Q in R^{n x d} and K in R^{n x d}.
How many total scalar multiplications are required to compute the unscaled attention score matrix S = Q K^T? (Answer as an integer).''',
    options: [],
    correctAnswer: '''100000''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''The matrix multiplication is S = Q * K^T.
- Q has dimensions n x d (50 x 40).
- K^T has dimensions d x n (40 x 50).
- S has dimensions n x n (50 x 50 = 2500 entries).

Each entry S_{i,j} is the dot product of row i of Q and column j of K^T (which is row j of K), requiring exactly d scalar multiplications.
Total scalar multiplications:
n * n * d = 50 * 50 * 40 = 2500 * 40 = 100,000.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_64',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''Alpha-Beta Pruning Leaf Evaluations''',
    questionText: '''Consider a game tree of depth 2 evaluated with the minimax algorithm and alpha-beta pruning.
The root is a MAX node with 3 children (MIN nodes: M_1, M_2, M_3).
Each MIN node has 3 leaf children.
Leaves are examined from left to right.
The leaf values from left to right are:
Children of M_1: 3, 5, 2
Children of M_2: 1, 8, 4
Children of M_3: 7, 6, 9
How many leaf nodes are evaluated (visited) during alpha-beta pruning? (Answer as an integer).''',
    options: [],
    correctAnswer: '''7''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Trace of alpha-beta pruning from left to right:
Root is MAX: initial alpha = -inf, beta = +inf.

1. Subtree M_1 (MIN node): inherits alpha = -inf, beta = +inf.
- Leaf 1 (value 3): beta = min(+inf, 3) = 3.
- Leaf 2 (value 5): beta = min(3, 5) = 3.
- Leaf 3 (value 2): beta = min(3, 2) = 2.
M_1 returns min(3, 5, 2) = 2.
(All 3 leaves evaluated).
Root updates: alpha = max(-inf, 2) = 2.

2. Subtree M_2 (MIN node): inherits alpha = 2, beta = +inf.
- Leaf 4 (value 1): beta = min(+inf, 1) = 1.
Pruning condition check: alpha >= beta => 2 >= 1 (TRUE).
Alpha-beta cutoff occurs immediately! Leaves 5 (value 8) and 6 (value 4) are PRUNED!
(Only 1 leaf evaluated).

3. Subtree M_3 (MIN node): inherits alpha = 2, beta = +inf.
- Leaf 7 (value 7): beta = min(+inf, 7) = 7. (alpha=2 < beta=7, no cutoff).
- Leaf 8 (value 6): beta = min(7, 6) = 6. (alpha=2 < beta=6, no cutoff).
- Leaf 9 (value 9): beta = min(6, 9) = 6.
(All 3 leaves evaluated). M_3 returns 6.

Root selects max(2, 6) = 6.
Total evaluated leaves = 3 (from M_1) + 1 (from M_2) + 3 (from M_3) = 7 leaves.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK6_CORE_65',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Adam Optimizer Parameter Update Magnitude''',
    questionText: '''In training a machine learning model using the Adam optimizer, the hyperparameters are:
beta_1 = 0.90,  beta_2 = 0.99,  epsilon = 10^(-8),  and learning rate eta = 0.10.
At the first time step t = 1, the gradient is g_1 = 4.0. Initial moment estimates are m_0 = 0 and v_0 = 0.
The parameter update is delta theta_1 = -eta * (m_hat_1 / (sqrt(v_hat_1) + epsilon)).
What is the absolute magnitude |delta theta_1| of the parameter update at t = 1? (Round off to two decimal places).''',
    options: [],
    correctAnswer: '''0.1''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Adam update formulas at step t = 1:
1. First moment estimate:
m_1 = beta_1 * m_0 + (1 - beta_1) * g_1
= 0.90 * 0 + 0.10 * 4.0 = 0.40.

2. Second raw moment estimate:
v_1 = beta_2 * v_0 + (1 - beta_2) * (g_1)^2
= 0.99 * 0 + 0.01 * (4.0)^2 = 0.01 * 16.0 = 0.16.

3. Bias-corrected estimates (since t = 1):
m_hat_1 = m_1 / (1 - beta_1^1) = 0.40 / (1 - 0.90) = 0.40 / 0.10 = 4.0.
v_hat_1 = v_1 / (1 - beta_2^1) = 0.16 / (1 - 0.99) = 0.16 / 0.01 = 16.0.

4. Effective step:
sqrt(v_hat_1) = sqrt(16.0) = 4.0.
ratio = m_hat_1 / (sqrt(v_hat_1) + epsilon) = 4.0 / 4.0 = 1.0.

5. Update magnitude:
|delta theta_1| = eta * ratio = 0.10 * 1.0 = 0.10. (or 0.1).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
];
