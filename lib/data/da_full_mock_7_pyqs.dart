// AUTO-GENERATED MOCK 7 QUESTIONS (LEVEL 7: GRANDMASTER RESEARCH DIFFICULTY)
import '../models/models.dart';

final List<PYQ> daFullMock7Questions = [
  PYQ(
    id: 'DA_MOCK7_GA_01',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Verbal Ability''',
    questionText: '''Choose the word that best completes the sentence:
"The CFO emphasized that the sudden quarterly revenue surge was merely an ________ phenomenon caused by delayed invoice clearances, rather than indicative of sustained structural growth."''',
    options: ['''ephemeral''', '''endemic''', '''ubiquitous''', '''immutable'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''"Ephemeral" means lasting for a very short time; transitory or fleeting.
The sentence explains that the revenue surge was temporary and caused by a one-off operational delay, rather than permanent structural growth.
Endemic means native or confined to a region; ubiquitous means present everywhere; immutable means unchanging. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_GA_02',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Critical Reasoning''',
    questionText: '''Consider the following three statements:
1. All neural network researchers understand gradient descent.
2. Some researchers who understand gradient descent do not publish in computer vision.
3. No one who does not publish in computer vision attended the workshop on synthetic image generation.
Which of the following conclusions is logically guaranteed to be true?''',
    options: ['''All neural network researchers attended the workshop on synthetic image generation.''', '''Some researchers who understand gradient descent did not attend the workshop on synthetic image generation.''', '''Everyone who attended the workshop on synthetic image generation is a neural network researcher.''', '''No neural network researcher attended the workshop on synthetic image generation.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''From Statement 2: There exists a non-empty set of researchers S who understand gradient descent and do not publish in computer vision.
From Statement 3: Anyone who does not publish in computer vision did not attend the workshop.
Combining these two: The researchers in set S understand gradient descent and did not attend the workshop.
Thus: "Some researchers who understand gradient descent did not attend the workshop on synthetic image generation" is logically certain. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_GA_03',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude''',
    questionText: '''An autonomous delivery drone flies from station A to station B with a tailwind at an average ground speed of 120 km/h, and immediately returns from B to A against the same wind at an average ground speed of 80 km/h along the exact same path.
What is the average ground speed of the drone for the entire round trip?''',
    options: ['''96 km/h''', '''100 km/h''', '''98 km/h''', '''92 km/h'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''For equal distances traveled at speeds v_1 and v_2, the average speed is given by the harmonic mean:
v_avg = (2 * v_1 * v_2) / (v_1 + v_2).

Here v_1 = 120 km/h and v_2 = 80 km/h:
v_avg = (2 * 120 * 80) / (120 + 80) = 19200 / 200 = 96 km/h.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_GA_04',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Spatial Aptitude''',
    questionText: '''A solid wooden cube of side length 6 cm is completely painted red on all six faces.
The cube is then cut into smaller unit cubes, each having side length 1 cm.
How many of these smaller unit cubes have EXACTLY two red faces?''',
    options: ['''48''', '''64''', '''36''', '''72'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''In an n x n x n painted cube cut into unit cubes:
The cubes with exactly two painted faces lie along the 12 edges, excluding the 2 corner cubes on each edge:
Number of cubes = 12 * (n - 2).

Here n = 6:
Number = 12 * (6 - 2) = 12 * 4 = 48.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_GA_05',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Analytical Aptitude''',
    questionText: '''Find the next number in the following sequence:
3, 7, 17, 39, 85, ?''',
    options: ['''179''', '''181''', '''177''', '''187'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Analyze the recurrence relation:
3 * 2 + 1 = 7
7 * 2 + 3 = 17
17 * 2 + 5 = 39
39 * 2 + 7 = 85.
At each step, the previous term is multiplied by 2 and the next odd integer is added (+1, +3, +5, +7, +9).
Next term = 85 * 2 + 9 = 170 + 9 = 179.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_GA_06',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude''',
    questionText: '''What is the remainder when 3^2026 is divided by 100?''',
    options: ['''29''', '''89''', '''49''', '''09'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''We need 3^2026 mod 100.
By Euler's totient theorem, phi(100) = 100 * (1 - 1/2) * (1 - 1/5) = 40.
Furthermore, Carmichael function lambda(100) = lcm(phi(4), phi(25)) = lcm(2, 20) = 20.
Since gcd(3, 100) = 1:
3^20 = 1 (mod 100).

Reduce the exponent modulo 20:
2026 = 20 * 101 + 6 = 6 (mod 20).

Therefore:
3^2026 = 3^6 (mod 100).
Compute 3^6:
3^2 = 9
3^4 = 81
3^6 = 81 * 9 = 729 = 29 (mod 100).
The remainder is 29. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_GA_07',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Data Interpretation and Sets''',
    questionText: '''In a cohort of 200 machine learning engineers:
- 110 are proficient in PyTorch
- 95 are proficient in TensorFlow
- 85 are proficient in JAX
- 45 are proficient in both PyTorch and TensorFlow
- 40 are proficient in both PyTorch and JAX
- 35 are proficient in both TensorFlow and JAX
- 15 are proficient in all three frameworks.
How many engineers in the cohort are proficient in NONE of these three frameworks?''',
    options: ['''15''', '''20''', '''25''', '''10'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''By the Principle of Inclusion-Exclusion:
|P union T union J| = |P| + |T| + |J| - (|P cap T| + |P cap J| + |T cap J|) + |P cap T cap J|
= 110 + 95 + 85 - (45 + 40 + 35) + 15
= 290 - 120 + 15 = 185.

Engineers with none of the three frameworks:
Total - |P union T union J| = 200 - 185 = 15.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_GA_08',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Combinatorics''',
    questionText: '''In how many distinct ways can 5 software architects and 5 data scientists be seated around a circular conference table such that no two data scientists sit next to each other?''',
    options: ['''2880''', '''1440''', '''14400''', '''28800'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Step 1: Seat the 5 software architects around the circular table.
The number of circular permutations of 5 distinct items is:
(5 - 1)! = 4! = 24 ways.

Step 2: This creates 5 distinct spaces between adjacent architects.
The 5 data scientists must be seated in these 5 distinct positions.
Since the table is now oriented relative to the seated architects, the positions are linear:
5! = 120 ways.

Total number of arrangements:
24 * 120 = 2880 ways.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_GA_09',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Work and Rates''',
    questionText: '''A datacenter cooling system has three pumps: P1, P2, and P3.
- P1 and P2 running together can fill the coolant reserve tank in 12 hours.
- P2 and P3 running together can fill it in 15 hours.
- P1 and P3 running together can fill it in 20 hours.
If all three pumps run simultaneously, how many hours will it take to fill the coolant reserve tank?''',
    options: ['''10 hours''', '''9 hours''', '''8 hours''', '''12 hours'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Let r_1, r_2, r_3 be the hourly rates of the three pumps:
r_1 + r_2 = 1/12
r_2 + r_3 = 1/15
r_1 + r_3 = 1/20.

Summing all three equations:
2(r_1 + r_2 + r_3) = 1/12 + 1/15 + 1/20
LCM(12, 15, 20) = 60.
2(r_1 + r_2 + r_3) = (5 + 4 + 3) / 60 = 12 / 60 = 1/5.

Therefore:
r_1 + r_2 + r_3 = (1/5) / 2 = 1/10.

Together, all three pumps fill 1/10th of the tank per hour.
Time taken = 10 hours.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_GA_10',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Geometry''',
    questionText: '''A sphere of radius R = 6 cm is completely inscribed inside a right circular cylinder such that the sphere touches the top, bottom, and lateral surfaces of the cylinder.
What is the ratio of the volume of the sphere to the volume of the cylinder?''',
    options: ['''2/3''', '''3/4''', '''1/2''', '''4/5'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''For the sphere to touch all surfaces:
Radius of cylinder r = R.
Height of cylinder h = 2R.

Volume of sphere:
V_sphere = (4/3) * pi * R^3.

Volume of cylinder:
V_cylinder = pi * r^2 * h = pi * R^2 * (2R) = 2 * pi * R^3.

Ratio:
V_sphere / V_cylinder = ((4/3) * pi * R^3) / (2 * pi * R^3) = (4/3) / 2 = 2/3.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_11',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Spectral Radius of Triangular Matrix''',
    questionText: '''Consider the upper-triangular matrix:
A = [[-3,  4,  7],
     [ 0,  2, -5],
     [ 0,  0, -4]].
What is the spectral radius rho(A) of matrix A?''',
    options: ['''4''', '''-4''', '''3''', '''2'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The eigenvalues of any triangular matrix are simply its diagonal entries:
lambda_1 = -3,  lambda_2 = 2,  lambda_3 = -4.

The spectral radius rho(A) is defined as the maximum absolute value of its eigenvalues:
rho(A) = max(|lambda_i|) = max(|-3|, |2|, |-4|) = max(3, 2, 4) = 4.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_12',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Trace of Kronecker Product''',
    questionText: '''Let A be a 2 x 2 matrix with tr(A) = 5, and let B be a 3 x 3 matrix with tr(B) = -4.
What is the trace of the Kronecker product tr(A (x) B)? (Answer as an integer).''',
    options: [],
    correctAnswer: '''-20''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''A fundamental property of the Kronecker product is that the trace of the product equals the product of the traces:
tr(A (x) B) = tr(A) * tr(B).

Given tr(A) = 5 and tr(B) = -4:
tr(A (x) B) = 5 * (-4) = -20.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_13',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Orthogonal Matrix Invariants''',
    questionText: '''Let Q in R^{n x n} be a real orthogonal matrix (satisfying Q^T Q = I_n).
Which of the following statements is/are ALWAYS TRUE?''',
    options: ['''||Q x||_2 = ||x||_2 for all vectors x in R^n.''', '''det(Q) in {-1, +1}.''', '''Every eigenvalue lambda of Q (real or complex) satisfies |lambda| = 1.''', '''Q is a symmetric matrix.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis of statements:
A. ||Q x||_2^2 = (Q x)^T (Q x) = x^T Q^T Q x = x^T I x = ||x||_2^2. Orthogonal matrices preserve Euclidean norm (isometry). (TRUE)
B. det(Q^T Q) = det(Q)^2 = det(I) = 1 => det(Q) = +-1. (TRUE)
C. If Q v = lambda v with ||v|| = 1, ||Q v|| = |lambda| ||v|| = |lambda|. Since ||Q v|| = ||v|| = 1, |lambda| = 1. (TRUE)
D. Q does not have to be symmetric; e.g., a 2D rotation matrix by 90 degrees [[0, -1], [1, 0]] is orthogonal and skew-symmetric, not symmetric. (FALSE)

Correct options: A, B, C.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_14',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Idempotent Projector Trace and Rank''',
    questionText: '''Let P in R^{n x n} be an orthogonal projection matrix satisfying P^2 = P and P^T = P.
Which of the following mathematical relations between tr(P) and rank(P) is always true?''',
    options: ['''tr(P) = rank(P)''', '''tr(P) = n - rank(P)''', '''tr(P) = (rank(P))^2''', '''tr(P) = 0'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''For an idempotent matrix P^2 = P:
Every eigenvalue lambda satisfies lambda^2 = lambda, meaning lambda in {0, 1}.
Since P is symmetric, it is diagonalizable. The number of non-zero eigenvalues (which are all 1) equals rank(P).
The trace is the sum of eigenvalues:
tr(P) = sum(lambda_i) = rank(P) * 1 + (n - rank(P)) * 0 = rank(P).
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_15',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Directional Derivative along Unit Vector''',
    questionText: '''Let f(x, y) = x^2 y + 3 x y^2.
What is the directional derivative of f at the point (1, 2) in the direction of the unit vector u = (3/5, 4/5)? (Answer as an integer).''',
    options: [],
    correctAnswer: '''20''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Compute the gradient of f:
df/dx = 2 x y + 3 y^2.
At (1, 2): df/dx = 2(1)(2) + 3(4) = 4 + 12 = 16.

df/dy = x^2 + 6 x y.
At (1, 2): df/dy = 1^2 + 6(1)(2) = 1 + 12 = 13.

grad f(1, 2) = (16, 13).

The directional derivative along unit vector u = (3/5, 4/5) is:
D_u f(1, 2) = grad f(1, 2) . u = 16 * (3/5) + 13 * (4/5)
= (48 + 52) / 5 = 100 / 5 = 20.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_16',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Second Derivative Test Saddle Point''',
    questionText: '''Let f(x, y) be a twice continuously differentiable function. At a stationary point (x_0, y_0) where grad f(x_0, y_0) = (0, 0), the Hessian matrix H satisfies det(H) < 0.
What is the classification of the stationary point (x_0, y_0)?''',
    options: ['''Saddle point''', '''Strict local minimum''', '''Strict local maximum''', '''Inconclusive test'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''By the Second Partial Derivative Test for functions of two variables:
det(H) = f_xx * f_yy - (f_xy)^2.
When det(H) < 0, the Hessian has one strictly positive eigenvalue and one strictly negative eigenvalue.
This means the surface curves upward in one direction and downward in another direction, which defines a saddle point.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_17',
    year: 2026,
    subject: '''Optimization''',
    topic: '''Subdifferential of Absolute Value''',
    questionText: '''Let g(w) = |w| for w in R.
The subdifferential of g at the origin w = 0 is a closed interval [a, b].
What is the length of this interval, b - a? (Answer as an integer).''',
    options: [],
    correctAnswer: '''2''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''By definition of the subgradient of a convex function:
s in partial g(0) iff g(w) >= g(0) + s * (w - 0) for all w in R.
|w| >= s * w for all w in R.
For w > 0: s <= |w| / w = 1.
For w < 0: s >= |w| / w = -1.

Thus partial g(0) = [-1, 1].
Here a = -1 and b = 1.
Interval length = b - a = 1 - (-1) = 2.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_18',
    year: 2026,
    subject: '''Optimization''',
    topic: '''Weak Duality Theorem''',
    questionText: '''In mathematical optimization, let p* denote the optimal primal objective value and d* denote the optimal dual objective value for a primal minimization problem.
Which of the following statements is guaranteed by the Weak Duality Theorem?''',
    options: ['''d* <= p* holds universally for all optimization problems, whether convex or non-convex.''', '''d* = p* holds for all non-convex optimization problems.''', '''d* > p* whenever Slater constraint qualification is violated.''', '''The dual objective function is always non-concave.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The Weak Duality Theorem states that the dual problem always provides a lower bound on the primal minimization problem:
d* <= p*.
This holds universally for ANY optimization problem, regardless of convexity, linearity, or constraint qualifications.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_19',
    year: 2026,
    subject: '''Probability''',
    topic: '''Poisson Consecutive PMF Ratio''',
    questionText: '''Let X be a Poisson random variable with parameter lambda = 6.
What is the ratio P(X = 3) / P(X = 2)? (Answer as an integer).''',
    options: [],
    correctAnswer: '''2''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''For a Poisson(lambda) random variable:
P(X = k) = (e^(-lambda) * lambda^k) / k!.

The ratio of consecutive terms is:
P(X = k) / P(X = k - 1) = [ (e^(-lambda) * lambda^k) / k! ] / [ (e^(-lambda) * lambda^(k-1)) / (k - 1)! ]
= lambda / k.

For k = 3 and lambda = 6:
P(X = 3) / P(X = 2) = 6 / 3 = 2.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_20',
    year: 2026,
    subject: '''Probability''',
    topic: '''Memoryless Continuous Distribution''',
    questionText: '''Which of the following continuous probability distributions satisfies the memoryless property:
P(X > s + t | X > s) = P(X > t)  for all s, t >= 0?''',
    options: ['''Exponential distribution''', '''Weibull distribution with shape parameter k = 2''', '''Normal distribution''', '''Log-normal distribution'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The Exponential distribution is the ONLY continuous probability distribution that possesses the memoryless property.
P(X > s + t | X > s) = P(X > s + t) / P(X > s) = e^(-lambda(s + t)) / e^(-lambda s) = e^(-lambda t) = P(X > t).
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_21',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Fisher Information for Normal Variance''',
    questionText: '''Let X ~ N(0, theta), where the variance theta > 0 is unknown.
The Fisher Information for a single observation is given by I(theta) = 1 / (2 * theta^2).
What is the value of I(theta) when theta = 0.5? (Answer as an integer).''',
    options: [],
    correctAnswer: '''2''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Given I(theta) = 1 / (2 * theta^2).
For theta = 0.5 = 1/2:
theta^2 = (1/2)^2 = 1/4 = 0.25.
I(0.5) = 1 / (2 * 0.25) = 1 / 0.5 = 2.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_22',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Weak Consistency Sufficient Conditions''',
    questionText: '''Let theta_hat_n be an estimator of parameter theta based on a sample of size n.
Which of the following conditions is/are sufficient to guarantee that theta_hat_n is a weakly consistent estimator of theta (i.e., theta_hat_n -> theta in probability)?''',
    options: ['''lim_{n -> inf} E[theta_hat_n] = theta  and  lim_{n -> inf} Var(theta_hat_n) = 0.''', '''theta_hat_n is unbiased for all n, and lim_{n -> inf} Var(theta_hat_n) = 0.''', '''theta_hat_n is the sample mean of an i.i.d. sample from a population with finite mean mu = theta.''', '''theta_hat_n = X_1 (the first observation in the sample).'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis of statements:
A. Mean Squared Error MSE(theta_hat_n) = Var(theta_hat_n) + (Bias(theta_hat_n))^2.
If both variance and bias vanish as n -> inf, MSE -> 0. By Chebyshev's inequality, MSE -> 0 implies convergence in probability. (TRUE)
B. Unbiased means Bias = 0. If Var -> 0, MSE -> 0, so it is consistent. (TRUE)
C. By Khinchin's Weak Law of Large Numbers (WLLN), the sample mean of i.i.d. observations with finite mean converges in probability to the population mean. (TRUE)
D. theta_hat_n = X_1 has variance Var(X_1) > 0 for all n, which does not vanish. It is not consistent. (FALSE)

Correct options: A, B, C.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_23',
    year: 2026,
    subject: '''Probability''',
    topic: '''Markov Inequality Upper Bound''',
    questionText: '''Let Y be a non-negative continuous random variable with expected value E[Y] = 15.
According to Markov's inequality, what is the tightest upper bound on the probability P(Y >= 60)? (Answer as a decimal).''',
    options: [],
    correctAnswer: '''0.25''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Markov's Inequality states that for any non-negative random variable Y and constant a > 0:
P(Y >= a) <= E[Y] / a.

Given E[Y] = 15 and a = 60:
P(Y >= 60) <= 15 / 60 = 1 / 4 = 0.25.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_24',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Statistical Power Definition''',
    questionText: '''In statistical hypothesis testing, the power of a test against a specific alternative hypothesis is formally defined as:''',
    options: ['''1 - beta, where beta is the probability of committing a Type II error.''', '''1 - alpha, where alpha is the probability of committing a Type I error.''', '''alpha + beta''', '''alpha / beta'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The power of a statistical hypothesis test is the probability of correctly rejecting the null hypothesis when the alternative hypothesis is true:
Power = P(Reject H_0 | H_1 is true) = 1 - P(Fail to reject H_0 | H_1 is true) = 1 - beta.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_25',
    year: 2026,
    subject: '''Data Structures''',
    topic: '''Fibonacci Heap Decrease Key Complexity''',
    questionText: '''What is the amortized time complexity of the Decrease-Key operation in a Fibonacci Heap?''',
    options: ['''O(1)''', '''O(log n)''', '''O(n)''', '''O(n log n)'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''A key theoretical advantage of Fibonacci heaps over binary heaps is that the Decrease-Key operation takes O(1) amortized time (using cascading cuts), whereas in a standard binary heap it takes O(log n).
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_26',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Floyd Warshall Intermediate Step''',
    questionText: '''In the Floyd-Warshall algorithm for all-pairs shortest paths on a directed graph with vertices {1, 2, 3}, the distance matrix D^(0) containing direct edge weights is:
D^(0) = [[0, 5, inf],
         [inf, 0, 3],
         [2, inf, 0]].
After completing step k = 1 (considering vertex 1 as an intermediate node), what is the value of D^(1)[3][2]? (Answer as an integer).''',
    options: [],
    correctAnswer: '''7''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''The recurrence relation for Floyd-Warshall at step k = 1 is:
D^(1)[i][j] = min( D^(0)[i][j], D^(0)[i][1] + D^(0)[1][j] ).

For i = 3 and j = 2:
D^(0)[3][2] = inf
D^(0)[3][1] = 2
D^(0)[1][2] = 5

D^(1)[3][2] = min( inf, 2 + 5 ) = min( inf, 7 ) = 7.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_27',
    year: 2026,
    subject: '''Programming in Python''',
    topic: '''Subclass Customization Hook''',
    questionText: '''In Python 3.6+, what is the primary role of the __init_subclass__ class method?''',
    options: ['''It is invoked automatically on a parent class whenever a new subclass of it is created, providing a clean mechanism to configure and validate subclasses without full metaclasses.''', '''It handles dynamic garbage collection of abandoned child instances.''', '''It converts all child classes into thread-safe singletons.''', '''It compiles Python byte-code directly into C extensions.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''PEP 487 introduced __init_subclass__ to simplify class customization. Whenever a class inherits from a base class that defines __init_subclass__, the base class hook is called with the newly created subclass, eliminating the boilerplate of defining custom metaclasses. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_28',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Polynomial Time Reduction Properties''',
    questionText: '''Let A and B be two decision problems. Suppose problem A is polynomial-time reducible to problem B, denoted by A <=_p B.
Which of the following statements is/are TRUE?''',
    options: ['''If B in P, then A in P.''', '''If A is NP-hard, then B is NP-hard.''', '''If A is NP-complete and B in NP, then B is NP-complete.''', '''If B is NP-hard, then A must be NP-hard.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis of statements:
A. If B can be solved in polynomial time, any instance of A can be reduced to B in polynomial time and solved in polynomial time, so A in P. (TRUE)
B. If A is NP-hard, every problem in NP reduces to A. Since A reduces to B, every problem in NP reduces to B, making B NP-hard. (TRUE)
C. If A is NP-complete, A is NP-hard. Since A <=_p B, B is NP-hard. Since B in NP, B is NP-complete. (TRUE)
D. If B is NP-hard, A could be a trivial problem (e.g. 2+2=4 in P), so A is not necessarily NP-hard. (FALSE)

Correct options: A, B, C.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_29',
    year: 2026,
    subject: '''DBMS''',
    topic: '''Fourth Normal Form 4NF Condition''',
    questionText: '''A relation schema R is in Fourth Normal Form (4NF) with respect to a set of functional and multi-valued dependencies if and only if:''',
    options: ['''For every non-trivial multi-valued dependency X ->> Y holding on R, X is a superkey of R.''', '''Every non-prime attribute is fully functionally dependent on each candidate key.''', '''All domain values are strictly atomic.''', '''There are no transitive functional dependencies between non-prime attributes.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''A relation schema R is in 4NF if it is in BCNF and for every non-trivial multi-valued dependency X ->> Y holding on R, X is a superkey of R.
Option A is the formal textbook definition. Option B describes 2NF, Option C describes 1NF, and Option D describes 3NF.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_30',
    year: 2026,
    subject: '''DBMS''',
    topic: '''B-Plus Tree Leaf Node Capacity''',
    questionText: '''In a B+ tree index, disk blocks have size 4096 bytes.
Each record pointer requires 8 bytes, and each search key requires 24 bytes.
Each leaf node also stores an 8-byte pointer to the next leaf node block.
What is the maximum number of record pointers (data entries) that can fit inside a single leaf node block? (Answer as an integer).''',
    options: [],
    correctAnswer: '''127''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''In a B+ tree leaf node:
Each entry contains one search key (24 bytes) and one record pointer (8 bytes):
Entry size = 24 + 8 = 32 bytes.
There is also one next-leaf block pointer of 8 bytes.

Condition:
N * 32 + 8 <= 4096
N * 32 <= 4088
N <= 4088 / 32 = 127.75.

Since N must be an integer, the maximum capacity is floor(127.75) = 127 entries.
Check: 127 * 32 + 8 = 4064 + 8 = 4072 <= 4096.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_31',
    year: 2026,
    subject: '''DBMS''',
    topic: '''Snapshot Isolation and Concurrency Invariants''',
    questionText: '''Which of the following statements regarding Snapshot Isolation (SI) in modern transactional database systems is/are TRUE?''',
    options: ['''Under Snapshot Isolation, read operations never block write operations, and write operations never block read operations.''', '''Snapshot Isolation eliminates Dirty Reads, Non-Repeatable Reads, and Phantom Reads.''', '''Snapshot Isolation completely eliminates the Write-Skew anomaly.''', '''Two concurrent transactions reading overlapping data items but writing to disjoint data items can commit under Snapshot Isolation while violating serializability.'''],
    correctAnswer: '''A;B;D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis of statements:
A. Snapshot isolation uses multi-version concurrency control (MVCC); readers read an immutable snapshot without acquiring read locks, so readers never block writers and writers never block readers. (TRUE)
B. Because a transaction reads a consistent snapshot taken at start time, it cannot observe uncommitted data (no dirty reads), cannot see changed data upon re-reading (no non-repeatable reads), and cannot see newly inserted tuples (no phantoms). (TRUE)
C. Snapshot isolation does NOT prevent write skew. (FALSE)
D. The canonical write-skew anomaly occurs when two transactions read overlapping data (e.g. checking total balance) and modify disjoint items (e.g., account A vs account B), leading to non-serializable schedules. (TRUE)

Correct options: A, B, D.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_32',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''PAC Learning Sample Complexity Bound''',
    questionText: '''In the Probably Approximately Correct (PAC) learning model for a finite hypothesis class H, what is the theoretical upper bound on the sample complexity m required to guarantee that with probability at least 1 - delta, any consistent hypothesis has generalization error at most epsilon?''',
    options: ['''m >= (1 / epsilon) * ( ln |H| + ln(1 / delta) )''', '''m >= (1 / epsilon^2) * ( |H| / delta )''', '''m >= epsilon * ln |H|''', '''m <= delta * ln(1 / epsilon)'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''By PAC learning theory for finite consistent hypothesis spaces:
P(exists h in H : error(h) > epsilon and h is consistent with sample S) <= |H| * (1 - epsilon)^m <= |H| * e^(-m * epsilon).
Setting |H| * e^(-m * epsilon) <= delta:
-m * epsilon <= ln(delta / |H|)
m * epsilon >= ln(|H| / delta) = ln |H| + ln(1 / delta)
m >= (1 / epsilon) * ( ln |H| + ln(1 / delta) ).
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_33',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''RBF Kernel Gram Matrix Diagonal Entry''',
    questionText: '''The Radial Basis Function (RBF) Gaussian kernel is defined as:
K(x, z) = exp( -gamma * ||x - z||^2 ).
What is the exact numerical value of the diagonal entry K(x_i, x_i) for any vector x_i? (Answer as an integer).''',
    options: [],
    correctAnswer: '''1''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''For any vector x_i:
||x_i - x_i||^2 = ||0||^2 = 0.
Substituting into the kernel function:
K(x_i, x_i) = exp( -gamma * 0 ) = exp(0) = 1.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_34',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''Bellman Operator Contraction Factor''',
    questionText: '''The Bellman optimality operator T* in an infinite-horizon Markov Decision Process with discount factor gamma in (0, 1) is a contraction mapping under the supremum (infinity) norm with contraction factor:''',
    options: ['''gamma''', '''1 / gamma''', '''gamma^2''', '''1 - gamma'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''By the Banach Fixed Point Theorem and Bellman's Contraction Mapping Theorem:
||T* V_1 - T* V_2||_inf <= gamma * ||V_1 - V_2||_inf  for all V_1, V_2 in R^{|S|}.
The contraction factor is precisely the discount factor gamma. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_35',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''Consistent Heuristic Properties in A Star''',
    questionText: '''Let h(n) be a heuristic function for A* graph search on a state space graph with non-negative edge costs c(n, a, n').
If h is consistent (monotone), which of the following statements is/are TRUE?''',
    options: ['''h(n) is admissible (i.e., h(n) <= h*(n) for all nodes n).''', '''The f-values f(n) = g(n) + h(n) along any path generated by A* are monotonically non-decreasing.''', '''When A* selects a node n for expansion, the shortest path to n is guaranteed to have been found, so closed nodes never need to be re-opened.''', '''A consistent heuristic can strictly overestimate the true cost to the goal for some states.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis of statements:
A. Consistency (triangle inequality h(n) <= c(n, n') + h(n')) implies admissibility by induction. (TRUE)
B. f(n') = g(n') + h(n') = g(n) + c(n, n') + h(n') >= g(n) + h(n) = f(n), proving f-values are non-decreasing along paths. (TRUE)
C. By the Graph Search Theorem, A* with a consistent heuristic finds the optimal path to every expanded node on its first expansion, eliminating the need to re-open nodes in the closed list. (TRUE)
D. Admissibility guarantees h(n) <= h*(n); it can never overestimate the true remaining cost. (FALSE)

Correct options: A, B, C.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_36',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Sherman Morrison Rank One Update Determinant''',
    questionText: '''Let A be the 2 x 2 diagonal matrix A = [[2, 0], [0, 2]].
Let u = [2, 2]^T and v = [1, 1]^T.
By the Matrix Determinant Lemma:
det(A + u v^T) = (1 + v^T A^(-1) u) * det(A).
Find the determinant det(A + u v^T). (Answer as an integer).''',
    options: [],
    correctAnswer: '''12''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Given A = 2 * I_2:
A^(-1) = (1/2) * I_2.
det(A) = 2 * 2 = 4.

Compute v^T A^(-1) u:
A^(-1) u = (1/2) * [2, 2]^T = [1, 1]^T.
v^T (A^(-1) u) = [1, 1] . [1, 1] = 1*1 + 1*1 = 2.

Apply the Matrix Determinant Lemma:
det(A + u v^T) = (1 + v^T A^(-1) u) * det(A)
= (1 + 2) * 4 = 3 * 4 = 12.

Direct verification:
u v^T = [[2], [2]] * [[1, 1]] = [[2, 2], [2, 2]].
A + u v^T = [[2, 0], [0, 2]] + [[2, 2], [2, 2]] = [[4, 2], [2, 4]].
det(A + u v^T) = (4)(4) - (2)(2) = 16 - 4 = 12.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_37',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Moore Penrose Pseudoinverse Projectors''',
    questionText: '''Let A in R^{m x n} be a matrix with Moore-Penrose pseudoinverse A^+.
Which of the following statements regarding the projection matrices formed by A and A^+ is TRUE?''',
    options: ['''All of the listed statements are true.''', '''A A^+ is the orthogonal projector onto the column space col(A).''', '''A^+ A is the orthogonal projector onto the row space row(A).''', '''I_m - A A^+ is the orthogonal projector onto the left null space null(A^T).'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''By the fundamental properties of the Moore-Penrose pseudoinverse:
1. P_col(A) = A A^+ is symmetric, idempotent, and projects onto col(A).
2. P_row(A) = A^+ A is symmetric, idempotent, and projects onto row(A).
3. The orthogonal complement of col(A) is null(A^T), so the orthogonal projector onto null(A^T) is I_m - A A^+.
Since all statements are mathematically correct, Option A ("All of the listed statements are true") is the correct answer.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_38',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Gerschgorin Disc Theorem Eigenvalue Bound''',
    questionText: '''Consider the 3 x 3 matrix:
M = [[10,  1,  2],
     [ 2, 20,  3],
     [ 1,  2, 30]].
According to the Gerschgorin Disc Theorem, every eigenvalue lambda of M lies in the union of discs D_i = {z in C : |z - a_ii| <= R_i}, where R_i = sum_{j != i} |a_ij|.
What is the maximum possible real value that any eigenvalue of M can achieve based on these discs? (Answer as an integer).''',
    options: [],
    correctAnswer: '''33''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Compute the Gerschgorin discs for each row:
Row 1: center a_11 = 10, radius R_1 = |1| + |2| = 3.
Disc 1 interval on real line: [10 - 3, 10 + 3] = [7, 13].

Row 2: center a_22 = 20, radius R_2 = |2| + |3| = 5.
Disc 2 interval on real line: [20 - 5, 20 + 5] = [15, 25].

Row 3: center a_33 = 30, radius R_3 = |1| + |2| = 3.
Disc 3 interval on real line: [30 - 3, 30 + 3] = [27, 33].

The maximum real upper bound across all three discs is 30 + 3 = 33.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_39',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Trace of Matrix Power from Characteristic Roots''',
    questionText: '''Let A be a 3 x 3 real matrix whose characteristic polynomial is:
p(lambda) = lambda^3 - 6 lambda^2 + 11 lambda - 6.
What is the trace of A^2, tr(A^2)? (Answer as an integer).''',
    options: [],
    correctAnswer: '''14''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Factor the characteristic polynomial:
p(lambda) = (lambda - 1)(lambda - 2)(lambda - 3) = 0.
The eigenvalues of A are lambda_1 = 1, lambda_2 = 2, and lambda_3 = 3.

The eigenvalues of A^2 are:
lambda_1^2 = 1^2 = 1
lambda_2^2 = 2^2 = 4
lambda_3^2 = 3^2 = 9.

The trace of A^2 is the sum of its eigenvalues:
tr(A^2) = 1 + 4 + 9 = 14.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_40',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Divergence Theorem Flux Across Cylinder''',
    questionText: '''Evaluate the outward surface flux:
iint_S F . dS
where F(x, y, z) = (x^3, y^3, z^3) and S is the closed bounding surface of the cylinder defined by x^2 + y^2 <= 4 and 0 <= z <= 3.
What is the value of the flux divided by pi, (iint_S F . dS) / pi? (Answer as an integer).''',
    options: [],
    correctAnswer: '''180''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''By the Gauss Divergence Theorem:
iint_S F . dS = iiint_V (div F) dV.

Compute divergence:
div F = d/dx(x^3) + d/dy(y^3) + d/dz(z^3) = 3 x^2 + 3 y^2 + 3 z^2 = 3(x^2 + y^2 + z^2).

Convert to cylindrical coordinates:
x = r cos(theta), y = r sin(theta), z = z.
x^2 + y^2 = r^2.
Volume element dV = r dr dtheta dz.
Limits: 0 <= r <= 2, 0 <= theta <= 2*pi, 0 <= z <= 3.

Integral:
3 * int_0^{2*pi} dtheta * [ int_0^3 dz int_0^2 r^3 dr + int_0^3 z^2 dz int_0^2 r dr ]
int_0^{2*pi} dtheta = 2*pi.
int_0^2 r^3 dr = [r^4 / 4]_0^2 = 16 / 4 = 4.
int_0^3 dz = 3.
First term = 3 * 4 = 12.

int_0^3 z^2 dz = [z^3 / 3]_0^3 = 27 / 3 = 9.
int_0^2 r dr = [r^2 / 2]_0^2 = 4 / 2 = 2.
Second term = 9 * 2 = 18.

Sum inside brackets = 12 + 18 = 30.
Flux = 3 * (2*pi) * 30 = 180 * pi.
Flux / pi = 180.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_41',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Bivariate Taylor Expansion Mixed Coefficient''',
    questionText: '''Let f(x, y) = exp(2x + 3y).
What is the coefficient of the mixed term x * y in the second-order Taylor polynomial expansion of f(x, y) about the origin (0, 0)? (Answer as an integer).''',
    options: [],
    correctAnswer: '''6''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Recall the Taylor series for exp(u) = 1 + u + u^2 / 2! + ...
Let u = 2x + 3y:
exp(2x + 3y) = 1 + (2x + 3y) + (2x + 3y)^2 / 2 + ...

Expand the second-order term:
(2x + 3y)^2 / 2 = (4 x^2 + 12 x y + 9 y^2) / 2
= 2 x^2 + 6 x y + 4.5 y^2.

The coefficient of the term x * y is 6.
(Equivalently: d^2f / (dx dy) = 6 * exp(2x + 3y). At (0, 0), d^2f / (dx dy) = 6).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_42',
    year: 2026,
    subject: '''Optimization''',
    topic: '''Dual of Linear Program Form''',
    questionText: '''Consider the primal linear programming problem:
Maximize  3 x_1 + 5 x_2
subject to:
x_1 + 2 x_2 <= 8
3 x_1 + 2 x_2 <= 12
x_1 >= 0,  x_2 >= 0.
What is the dual linear programming problem?''',
    options: ['''Minimize 8 y_1 + 12 y_2  subject to:  y_1 + 3 y_2 >= 3,  2 y_1 + 2 y_2 >= 5,  y_1, y_2 >= 0.''', '''Maximize 8 y_1 + 12 y_2  subject to:  y_1 + 3 y_2 <= 3,  2 y_1 + 2 y_2 <= 5,  y_1, y_2 >= 0.''', '''Minimize 12 y_1 + 8 y_2  subject to:  3 y_1 + y_2 >= 3,  2 y_1 + 2 y_2 >= 5,  y_1, y_2 >= 0.''', '''Minimize 3 y_1 + 5 y_2  subject to:  y_1 + 2 y_2 >= 8,  3 y_1 + 2 y_2 >= 12,  y_1, y_2 >= 0.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''For a primal problem:
Maximize c^T x  subject to  A x <= b,  x >= 0.
The dual problem is:
Minimize b^T y  subject to  A^T y >= c,  y >= 0.

Here:
c = [3, 5]^T,  b = [8, 12]^T.
A = [[1, 2], [3, 2]] => A^T = [[1, 3], [2, 2]].

Dual objective: Minimize 8 y_1 + 12 y_2.
Dual constraints:
1 y_1 + 3 y_2 >= 3
2 y_1 + 2 y_2 >= 5
y_1, y_2 >= 0.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_43',
    year: 2026,
    subject: '''Optimization''',
    topic: '''Constrained Minimization Cauchy Schwarz''',
    questionText: '''Find the minimum value of f(x, y, z) = x^2 + y^2 + z^2 subject to the linear equality constraint:
2 x + 3 y + 6 z = 14.
(Answer as an integer).''',
    options: [],
    correctAnswer: '''4''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''By the Cauchy-Schwarz inequality for vectors u = [2, 3, 6]^T and v = [x, y, z]^T:
(u . v)^2 <= ||u||^2 * ||v||^2.

Compute norms:
(u . v)^2 = (2x + 3y + 6z)^2 = 14^2 = 196.
||u||^2 = 2^2 + 3^2 + 6^2 = 4 + 9 + 36 = 49.
||v||^2 = x^2 + y^2 + z^2.

Therefore:
196 <= 49 * (x^2 + y^2 + z^2)
x^2 + y^2 + z^2 >= 196 / 49 = 4.

Equality holds when v is proportional to u: [x, y, z] = k [2, 3, 6].
2(2k) + 3(3k) + 6(6k) = 49k = 14 => k = 14 / 49 = 2 / 7.
Then ||v||^2 = (2/7)^2 * 49 = 4.
The minimum value is 4.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_44',
    year: 2026,
    subject: '''Probability''',
    topic: '''Continuous Bivariate Expectation''',
    questionText: '''Let X and Y be continuous random variables with joint probability density function:
f_{X,Y}(x, y) = 8 x y,  for 0 <= y <= x <= 1,
and 0 otherwise.
What is the value of 9 * E[X Y]? (Answer as an integer).''',
    options: [],
    correctAnswer: '''4''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Compute E[X Y]:
E[X Y] = int_0^1 int_0^x (x y) * (8 x y) dy dx
= 8 * int_0^1 x^2 [ int_0^x y^2 dy ] dx.

Inner integral:
int_0^x y^2 dy = [y^3 / 3]_0^x = x^3 / 3.

Outer integral:
E[X Y] = 8 * int_0^1 x^2 * (x^3 / 3) dx
= (8 / 3) * int_0^1 x^5 dx
= (8 / 3) * [x^6 / 6]_0^1 = (8 / 3) * (1 / 6) = 8 / 18 = 4 / 9.

Then:
9 * E[X Y] = 9 * (4 / 9) = 4.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_45',
    year: 2026,
    subject: '''Probability''',
    topic: '''Variance of Linear Combination of Independent Normals''',
    questionText: '''Let X ~ N(0, 9) and Y ~ N(0, 16) be independent normal random variables.
Let Z = 4X - 3Y.
What is the variance Var(Z)? (Answer as an integer).''',
    options: [],
    correctAnswer: '''288''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''For independent random variables X and Y:
Var(a X + b Y) = a^2 Var(X) + b^2 Var(Y).

Given:
a = 4, Var(X) = 9
b = -3, Var(Y) = 16.

Var(Z) = 4^2 * 9 + (-3)^2 * 16
= 16 * 9 + 9 * 16
= 144 + 144 = 288.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_46',
    year: 2026,
    subject: '''Probability''',
    topic: '''Poisson Process Thinning Variance''',
    questionText: '''Queries arrive at a database server according to a Poisson process with rate lambda = 120 queries per minute.
Each incoming query is independently classified as a "Write" query with probability p = 0.25, and a "Read" query with probability 1 - p = 0.75.
What is the variance of the number of Write queries arriving in a 20-second interval? (Answer as an integer).''',
    options: [],
    correctAnswer: '''10''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''By the Splitting (Thinning) Theorem of Poisson processes, the Write queries form an independent Poisson process with arrival rate:
lambda_W = lambda * p = 120 * 0.25 = 30 queries per minute.

The interval duration is t = 20 seconds = 20 / 60 = 1/3 minute.
The number of Write queries N_W in this interval follows a Poisson distribution with parameter:
mu = lambda_W * t = 30 * (1/3) = 10.

For a Poisson distribution, the variance equals the mean:
Var(N_W) = mu = 10.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_47',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Cramer Rao Lower Bound Scaled Parameter''',
    questionText: '''Let X_1, X_2, ..., X_20 be an i.i.d. sample of size n = 20 from a normal distribution N(mu, sigma^2 = 5), where mu is unknown.
What is the Cramer-Rao Lower Bound (CRLB) for the variance of any unbiased estimator of 3*mu? (Answer as a decimal rounded to two decimal places).''',
    options: [],
    correctAnswer: '''2.25''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''For a sample of size n from N(mu, sigma^2), the Fisher Information for mu is:
I_n(mu) = n / sigma^2.

Let g(mu) = 3*mu. The derivative is g'(mu) = 3.
By the Cramer-Rao inequality, the lower bound on the variance of any unbiased estimator of g(mu) is:
CRLB = [g'(mu)]^2 / I_n(mu) = 3^2 / (n / sigma^2) = (9 * sigma^2) / n.

Substitute n = 20 and sigma^2 = 5:
CRLB = (9 * 5) / 20 = 45 / 20 = 2.25.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_48',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Rao Blackwell Conditioning on Sufficient Statistic''',
    questionText: '''Let X_1, X_2, ..., X_n be an i.i.d. Bernoulli(p) sample.
Consider the crude unbiased estimator T = X_1 for p.
Let S = sum_{i=1}^n X_i be the complete sufficient statistic.
What is the Rao-Blackwell improved estimator T* = E[T | S]?''',
    options: ['''X_bar = (1/n) * sum_{i=1}^n X_i''', '''(S + 1) / (n + 2)''', '''X_1''', '''(S / n)^2'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''By the Rao-Blackwell Theorem, conditioning any unbiased estimator on a sufficient statistic produces an estimator with variance no greater than the original.
Compute T* = E[X_1 | S = s]:
E[X_1 | S = s] = P(X_1 = 1 | sum_{i=1}^n X_i = s)
= [ P(X_1 = 1 and sum_{i=2}^n X_i = s - 1) ] / P(sum_{i=1}^n X_i = s)
= [ p * binom(n-1, s-1) p^(s-1) (1-p)^(n-s) ] / [ binom(n, s) p^s (1-p)^(n-s) ]
= binom(n-1, s-1) / binom(n, s) = s / n = X_bar.

Thus T* = X_bar. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_49',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Pooled Sample Variance Calculation''',
    questionText: '''Two independent random samples drawn from two normal populations with equal variances sigma_1^2 = sigma_2^2 yield the following sample statistics:
Sample 1: n_1 = 9,  s_1^2 = 20
Sample 2: n_2 = 13, s_2^2 = 10
What is the pooled sample variance s_p^2? (Answer as an integer).''',
    options: [],
    correctAnswer: '''14''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''The formula for the pooled sample variance s_p^2 is:
s_p^2 = [ (n_1 - 1) * s_1^2 + (n_2 - 1) * s_2^2 ] / (n_1 + n_2 - 2).

Given:
n_1 = 9 => n_1 - 1 = 8.
s_1^2 = 20 => (n_1 - 1) * s_1^2 = 8 * 20 = 160.

n_2 = 13 => n_2 - 1 = 12.
s_2^2 = 10 => (n_2 - 1) * s_2^2 = 12 * 10 = 120.

Degrees of freedom denominator:
n_1 + n_2 - 2 = 9 + 13 - 2 = 20.

Pooled variance:
s_p^2 = (160 + 120) / 20 = 280 / 20 = 14.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_50',
    year: 2026,
    subject: '''Probability''',
    topic: '''Absorbing Markov Chain Fundamental Matrix''',
    questionText: '''Consider an absorbing Markov chain with transient states {1, 2} and absorbing state 3.
The transition probability submatrix between transient states is:
Q = [[0.2, 0.4],
     [0.0, 0.5]].
The fundamental matrix is N = (I - Q)^(-1).
What is the value of entry N_{2,2} (the expected number of visits to state 2 starting from state 2)? (Answer as an integer).''',
    options: [],
    correctAnswer: '''2''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Compute I - Q:
I - Q = [[1 - 0.2, -0.4],
         [0,       1 - 0.5]]
= [[0.8, -0.4],
   [0.0,  0.5]].

Invert I - Q:
det(I - Q) = (0.8)(0.5) - (0)(-0.4) = 0.40.

The inverse matrix is:
N = (1 / 0.40) * [[0.5, 0.4],
                  [0.0, 0.8]]
= [[1.25, 1.0],
   [0.0,  2.0]].

The entry N_{2,2} is 2.0 (or 2).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_51',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Classical Large Sample Hypothesis Tests''',
    questionText: '''Which of the following statements regarding the three classical asymptotic hypothesis tests (Wald Test, Score/Lagrange Multiplier Test, and Likelihood Ratio Test) is/are TRUE?''',
    options: ['''The Wald test requires fitting only the unrestricted model under the alternative hypothesis.''', '''The Rao Score test requires fitting only the restricted model under the null hypothesis.''', '''The Likelihood Ratio test requires fitting both the restricted model and the unrestricted model.''', '''Under the null hypothesis H_0, all three test statistics are asymptotically equivalent and share the same limiting Chi-squared distribution.'''],
    correctAnswer: '''A;B;C;D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis of statements:
A. The Wald test assesses distance between the unrestricted MLE theta_hat and theta_0 using the curvature at theta_hat, requiring fitting only the unrestricted model. (TRUE)
B. The Score test evaluates the score (gradient) of the log-likelihood at the null parameter theta_0, requiring fitting only the restricted model. (TRUE)
C. The Likelihood Ratio test computes 2 * (ln L(theta_hat) - ln L(theta_0)), requiring maximizing the likelihood under both unrestricted and restricted specifications. (TRUE)
D. By the classical Trinity of Tests theorem, under H_0 and standard regularity conditions, the Wald, Score, and LR statistics have the same asymptotic Chi-squared distribution chi^2(r), where r is the number of constraints. (TRUE)

All statements A, B, C, and D are TRUE.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_52',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Bridge Finding in Graphs''',
    questionText: '''Consider an undirected graph G with vertices {1, 2, 3, 4, 5, 6} and edges:
(1, 2), (2, 3), (3, 1), (3, 4), (4, 5), (5, 6), (6, 4).
How many bridges (cut-edges) does this graph contain? (Answer as an integer).''',
    options: [],
    correctAnswer: '''1''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''A bridge is an edge whose removal strictly increases the number of connected components.
The graph consists of:
1. Cycle C_1 on vertices {1, 2, 3}: Removing any edge within { (1,2), (2,3), (3,1) } preserves connectivity via the other two edges of the cycle.
2. Cycle C_2 on vertices {4, 5, 6}: Removing any edge within { (4,5), (5,6), (6,4) } preserves connectivity via the other two edges of the cycle.
3. Edge (3, 4): It is the unique edge connecting the two cycles. Removing (3, 4) partitions the graph into two disjoint connected components {1, 2, 3} and {4, 5, 6}.
Thus, edge (3, 4) is the only bridge.
Number of bridges = 1.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_53',
    year: 2026,
    subject: '''Data Structures''',
    topic: '''Red Black Tree Maximum Height''',
    questionText: '''In a Red-Black Tree containing n internal keys, what is the theoretical upper bound on the maximum height h of the tree?''',
    options: ['''h <= 2 * log_2(n + 1)''', '''h <= log_2(n + 1)''', '''h >= 2^n''', '''h <= 0.5 * log_2(n)'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''By the fundamental structural lemma of Red-Black Trees:
Any node x contains at least 2^(bh(x)) - 1 internal keys.
Because no red node can have a red child, at least half of the nodes on any simple path from root to leaf must be black, meaning bh(root) >= h / 2.
Therefore:
n >= 2^(h / 2) - 1 => n + 1 >= 2^(h / 2)
h / 2 <= log_2(n + 1) => h <= 2 * log_2(n + 1).
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_54',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Rabin Karp Rolling Hash Calculation''',
    questionText: '''In the Rabin-Karp string matching algorithm, let the base be d = 10 and prime modulus be q = 13.
The hash value of a 3-character numeric substring c_1 c_2 c_3 is defined as:
H(c_1 c_2 c_3) = (c_1 * 10^2 + c_2 * 10^1 + c_3 * 10^0) mod 13.
What is the hash value H("825")? (Answer as an integer).''',
    options: [],
    correctAnswer: '''6''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Compute value of "825":
8 * 100 + 2 * 10 + 5 = 800 + 20 + 5 = 825.

Compute 825 mod 13:
13 * 60 = 780.
825 - 780 = 45.
13 * 3 = 39.
45 - 39 = 6.

Therefore:
825 = 13 * 63 + 6.
H("825") = 6.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_55',
    year: 2026,
    subject: '''Programming in Python''',
    topic: '''Metaclass Class Namespace Modification''',
    questionText: '''Consider the following Python 3 program:
class Meta(type):
    def __new__(mcs, name, bases, namespace):
        namespace['code'] = 42
        return super().__new__(mcs, name, bases, namespace)

class Base(metaclass=Meta):
    code = 10

class Derived(Base):
    pass

print(Derived.code)

What is the output of this code?''',
    options: ['''42''', '''10''', '''AttributeError''', '''None'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''In Python, a class inherits the metaclass of its parent class.
When Derived is defined (class Derived(Base): pass), Python uses Base's metaclass (Meta) to create Derived.
During the creation of Derived, Meta.__new__ is called with Derived's namespace.
Meta.__new__ injects namespace['code'] = 42 into Derived's class dictionary.
Therefore, Derived.code evaluates to 42. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_56',
    year: 2026,
    subject: '''DBMS''',
    topic: '''Clustered Index Page Access IO''',
    questionText: '''A database relation R stores 100,000 records across 5,000 disk pages (exactly 20 records per page).
A range query selects records with 20 <= age <= 29, matching exactly 10% of all records (10,000 records).
A clustered B+ tree index exists on the attribute age, meaning the physical data pages are sorted and stored sequentially on disk according to age.
How many data page I/Os are required to retrieve all 10,000 matching records? (Do not count index block traversal). (Answer as an integer).''',
    options: [],
    correctAnswer: '''500''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''In a clustered index, the data records reside in sequential physical order matching the index search key.
Since each data page holds 20 records, and the 10,000 matching records are stored contiguously:
Number of data pages required = 10,000 / 20 = 500 pages.
Therefore, exactly 500 page I/Os are needed to scan the matching range.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_57',
    year: 2026,
    subject: '''DBMS''',
    topic: '''Fagins Theorem 4NF Lossless Decomposition''',
    questionText: '''Let R(Instructor, Course, Hobby) be a relation schema where the following multi-valued dependencies hold:
Instructor ->> Course
Instructor ->> Hobby
(with Course and Hobby being independent of each other given Instructor).
By Fagin's Theorem, which of the following decompositions of R is a lossless-join decomposition into Fourth Normal Form (4NF)?''',
    options: ['''R_1(Instructor, Course)  and  R_2(Instructor, Hobby)''', '''R_1(Course, Hobby)  and  R_2(Instructor)''', '''R cannot be decomposed into 4NF without loss of information.''', '''R_1(Instructor, Course)  and  R_2(Course, Hobby)'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Fagin's Theorem states that a relation schema R(A, B, C) can be non-loss decomposed into R_1(A, B) and R_2(A, C) if and only if the multi-valued dependency A ->> B | C holds on R.
Here A = Instructor, B = Course, and C = Hobby.
Decomposing into R_1(Instructor, Course) and R_2(Instructor, Hobby) eliminates the multi-valued dependency redundancies and achieves 4NF losslessly. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_58',
    year: 2026,
    subject: '''DBMS''',
    topic: '''Deadlock Cycle Breaking in WaitFor Graph''',
    questionText: '''In a relational DBMS, four transactions T_1, T_2, T_3, and T_4 have the following wait-for dependencies:
T_1 waits for T_2
T_2 waits for T_3
T_3 waits for T_4
T_4 waits for T_2.
What is the minimum number of transactions that must be aborted to eliminate all deadlocks in the system? (Answer as an integer).''',
    options: [],
    correctAnswer: '''1''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''A deadlock occurs if and only if the wait-for graph contains a directed cycle.
Examine the dependencies:
- Cycle: T_2 -> T_3 -> T_4 -> T_2 (a single simple directed cycle of length 3).
- T_1 -> T_2 is an incoming edge to the cycle, but T_1 is not part of any cycle.
Aborting any one transaction involved in the cycle (for example, aborting T_2, T_3, or T_4) removes that vertex and its associated edges, completely breaking the cycle.
The minimum number of transactions to abort is 1.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_59',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Polynomial Kernel Evaluation''',
    questionText: '''Consider two feature vectors x = [1, 2]^T and z = [3, 1]^T in R^2.
The polynomial kernel function is defined as:
K(u, v) = (u^T v + 2)^2.
What is the value of K(x, z)? (Answer as an integer).''',
    options: [],
    correctAnswer: '''49''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Compute the inner product:
x^T z = (1)(3) + (2)(1) = 3 + 2 = 5.

Apply the kernel function:
K(x, z) = (x^T z + 2)^2 = (5 + 2)^2 = 7^2 = 49.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_60',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''EM Algorithm ELBO Tightness Gap''',
    questionText: '''In the Expectation-Maximization (EM) algorithm for latent variable models, the evidence lower bound (ELBO) satisfies:
ln p(x; theta) = ELBO(q, theta) + Gap.
What is the exact mathematical expression for this Gap?''',
    options: ['''D_KL( q(z) || p(z | x; theta) )''', '''D_KL( p(z | x; theta) || q(z) )''', '''Mutual Information I(X; Z)''', '''Zero for any arbitrary distribution q(z)'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The fundamental decomposition of marginal log-likelihood in variational inference is:
ln p(x; theta) = sum_z q(z) ln [ p(x, z; theta) / q(z) ] + sum_z q(z) ln [ q(z) / p(z | x; theta) ]
= ELBO(q, theta) + D_KL( q(z) || p(z | x; theta) ).
Because the Kullback-Leibler divergence D_KL(q || p) >= 0, the ELBO is a strict lower bound, and the gap is precisely D_KL(q(z) || p(z | x; theta)).
At the E-step, setting q(z) = p(z | x; theta) sets this KL divergence to zero.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_61',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Soft Margin SVM Support Vector Properties''',
    questionText: '''In soft-margin Support Vector Machines with box constraints 0 <= alpha_i <= C and slack variables xi_i >= 0, which of the following statements is/are TRUE?''',
    options: ['''Data points with alpha_i = 0 lie strictly outside the margin on the correct side of the decision boundary and have slack xi_i = 0.''', '''Data points with 0 < alpha_i < C are free support vectors that lie exactly on the margin boundary y_i(w^T x_i + b) = 1 with slack xi_i = 0.''', '''Data points with alpha_i = C are bounded support vectors that have slack xi_i >= 0 (lying between the margin and the hyperplane, on the hyperplane, or misclassified).''', '''As the regularization parameter C -> infinity, the soft-margin SVM formulation approaches the hard-margin SVM.'''],
    correctAnswer: '''A;B;C;D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis of KKT complementarity conditions for soft-margin SVM:
1. alpha_i [ y_i(w^T x_i + b) - 1 + xi_i ] = 0
2. (C - alpha_i) xi_i = 0.
- If alpha_i = 0: (C - 0) xi_i = 0 => xi_i = 0. Point is non-support vector beyond the margin. (A is TRUE).
- If 0 < alpha_i < C: C - alpha_i > 0 => xi_i = 0, and y_i(w^T x_i + b) = 1. Free support vector on the margin. (B is TRUE).
- If alpha_i = C: xi_i >= 0. Bounded support vector. (C is TRUE).
- When C -> inf, penalty for non-zero slack becomes infinite, enforcing xi_i = 0 for all points, which recovers hard-margin SVM. (D is TRUE).

All statements A, B, C, and D are TRUE.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_62',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Rotary Position Embedding Angle''',
    questionText: '''In modern Transformer models utilizing Rotary Position Embeddings (RoPE), the 2D query/key subvector at token sequence position m is rotated by an angle theta_m = m * theta_0.
If theta_0 = 0.05 radians and the token position is m = 40, what is the rotation angle theta_m in radians? (Answer as an integer).''',
    options: [],
    correctAnswer: '''2''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Given:
theta_0 = 0.05 radians
m = 40.

The rotation angle is:
theta_m = m * theta_0 = 40 * 0.05 = 2.0 radians.
Answer is 2.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_63',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''Arc Consistency AC3 Domain Pruning''',
    questionText: '''Consider a Constraint Satisfaction Problem with two variables X and Y.
The initial domains are:
D(X) = {1, 2, 3, 4, 5}
D(Y) = {2, 3}
The binary constraint between them is: X + Y = 6.
After enforcing arc-consistency on the directed arc (X, Y) using the AC-3 algorithm, how many values remain in the domain D(X)? (Answer as an integer).''',
    options: [],
    correctAnswer: '''2''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Enforcing arc-consistency on (X, Y) requires that for every x in D(X), there must exist some y in D(Y) satisfying X + Y = 6 (i.e., y = 6 - x).
Check each candidate x in D(X):
- x = 1: Requires y = 6 - 1 = 5. Since 5 not in D(Y), prune x = 1.
- x = 2: Requires y = 6 - 2 = 4. Since 4 not in D(Y), prune x = 2.
- x = 3: Requires y = 6 - 3 = 3. Since 3 in D(Y), keep x = 3.
- x = 4: Requires y = 6 - 4 = 2. Since 2 in D(Y), keep x = 4.
- x = 5: Requires y = 6 - 5 = 1. Since 1 not in D(Y), prune x = 5.

The remaining domain is D(X) = {3, 4}.
Number of values = 2.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_64',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''POMDP Belief State Update''',
    questionText: '''In a Partially Observable Markov Decision Process (POMDP) with two states S = {s_1, s_2}, the current prior belief is b(s_1) = 0.60 and b(s_2) = 0.40.
Under the selected action, state transitions are static: P(s_1 | s_1) = 1 and P(s_2 | s_2) = 1.
An observation o is received with observation probabilities:
P(o | s_1) = 0.80  and  P(o | s_2) = 0.30.
Using Bayes' rule, what is the updated posterior belief b'(s_1) = P(s_1 | o)? (Answer as a decimal).''',
    options: [],
    correctAnswer: '''0.8''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Compute total probability of observation o:
P(o) = P(o | s_1) * b(s_1) + P(o | s_2) * b(s_2)
= 0.80 * 0.60 + 0.30 * 0.40
= 0.48 + 0.12 = 0.60.

Compute posterior belief for state s_1:
b'(s_1) = P(s_1 | o) = [ P(o | s_1) * b(s_1) ] / P(o)
= 0.48 / 0.60 = 0.80 (or 0.8).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK7_CORE_65',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Cross Entropy Softmax Logit Gradient''',
    questionText: '''Consider a multi-class classification neural network with 3 classes.
For a given training instance, the true one-hot target vector is y = [0, 1, 0]^T (class 2).
The softmax output probability vector produced by the network is:
y_hat = [0.20, 0.50, 0.30]^T.
The categorical cross-entropy loss is L = -sum_{k=1}^3 y_k ln(y_hat_k).
What is the partial derivative of the loss with respect to the pre-activation logit of class 2, dL / dz_2? (Answer as a decimal).''',
    options: [],
    correctAnswer: '''-0.5''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''For the combination of softmax activation and categorical cross-entropy loss:
y_hat_i = exp(z_i) / sum_j exp(z_j)
L = -sum_k y_k ln(y_hat_k).

The analytical gradient with respect to logit z_i is:
dL / dz_i = y_hat_i - y_i.

For class 2:
y_hat_2 = 0.50
y_2 = 1.

dL / dz_2 = 0.50 - 1 = -0.50 (or -0.5).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
];
