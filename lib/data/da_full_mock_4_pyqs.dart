// AUTO-GENERATED MOCK 4 QUESTIONS (LEVEL 4: MASTER OLYMPIAD / FACULTY DIFFICULTY)
import '../models/models.dart';

final List<PYQ> daFullMock4Questions = [
  PYQ(
    id: 'DA_MOCK4_GA_01',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Verbal Ability''',
    questionText: '''Choose the word that best completes the sentence to convey the precise logical meaning:
"The theoretical physicist acknowledged that while the hypothesis was mathematically elegant, it suffered from a fundamental ________: it made no empirical predictions that could ever be falsified."''',
    options: ['''aporia''', '''hyperbole''', '''euphemism''', '''syllogism'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''"Aporia" refers to an irresolvable internal contradiction, impasse, or theoretical puzzle in an argument or theory. In epistemology and philosophy of science, an unfalsifiable hypothesis presents a fundamental aporia (impasse) for scientific verification.
Hyperbole means exaggeration; euphemism means a mild substitute word; syllogism is a deductive argument form. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_GA_02',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Critical Reasoning''',
    questionText: '''A cloud computing data center observed that upgrading server clusters with 50% more CPU cores resulted in an unexpected 30% increase in 99th-percentile transaction latency.
Which of the following, if true, best explains this apparent paradox?''',
    options: ['''The upgraded CPU cores have lower thermal power dissipation than the older processors.''', '''With more concurrent worker threads competing simultaneously for the same global database locks, thread synchronization contention and cache invalidations increased exponentially.''', '''The server operating system was upgraded to the latest security patch.''', '''Customer traffic to the cloud service remained roughly constant over the evaluation period.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The paradox is that adding compute cores worsened tail latency. Option B explains the root cause: Amdahl's Law and lock contention. In multithreaded systems with shared memory locks, increasing the core count leads to severe lock contention and CPU cache-line bouncing (invalidation overhead), which stalls threads and dramatically inflates 99th-percentile tail latency. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_GA_03',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude''',
    questionText: '''What is the smaller angle between the hour hand and the minute hand of an accurate analog clock at 3:24?''',
    options: ['''36 degrees''', '''42 degrees''', '''48 degrees''', '''54 degrees'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Position of the minute hand at 24 minutes:
Each minute corresponds to 360 / 60 = 6 degrees.
At 24 minutes: theta_min = 24 * 6 = 144 degrees from the 12 o'clock mark.

Position of the hour hand at 3:24:
At 3:00, the hour hand is at 3 * 30 = 90 degrees.
In 24 minutes, the hour hand advances by 24 * 0.5 = 12 degrees.
Total hour hand position: theta_hour = 90 + 12 = 102 degrees.

The angle between the two hands is:
|theta_min - theta_hour| = |144 - 102| = 42 degrees.
Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_GA_04',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Probability & Combinatorics''',
    questionText: '''A fair six-sided die is rolled repeatedly until the first 6 appears. What is the probability that the number of rolls required is an ODD number?''',
    options: ['''5/11''', '''6/11''', '''1/2''', '''7/12'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Let p = P(rolling a 6) = 1/6, and q = P(not rolling a 6) = 5/6.
The event that the first 6 occurs on an odd roll means it occurs on roll 1, 3, 5, 7, ...
P(Odd) = p + q^2 * p + q^4 * p + ...
This is an infinite geometric series with first term a = p and common ratio r = q^2:
P(Odd) = p / (1 - q^2) = p / ((1 - q)(1 + q)).
Since 1 - q = p:
P(Odd) = p / (p * (1 + q)) = 1 / (1 + q).
Substitute q = 5/6:
P(Odd) = 1 / (1 + 5/6) = 1 / (11/6) = 6/11.
Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_GA_05',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Spatial Aptitude''',
    questionText: '''A solid cube is cut into 27 identical smaller cubes by two horizontal cuts, two vertical cuts, and two depth cuts. How many of the 27 smaller cubes have strictly FEWER than two painted faces if the original cube was painted on all exterior faces?''',
    options: ['''7''', '''9''', '''13''', '''15'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''For a 3x3x3 cube (27 unit cubes):
- Corner cubes (3 painted faces): 8 cubes.
- Edge cubes (2 painted faces): 12 edges * (3 - 2) = 12 cubes.
- Center-of-face cubes (1 painted face): 6 faces * (3 - 2)^2 = 6 cubes.
- Core internal cube (0 painted faces): (3 - 2)^3 = 1 cube.
We want the number of cubes with strictly fewer than two painted faces:
Number = (Cubes with 0 painted faces) + (Cubes with 1 painted face) = 1 + 6 = 7 cubes.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_GA_06',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude''',
    questionText: '''Three software developers A, B, and C can complete a codebase refactoring project in 12 days, 15 days, and 20 days respectively. All three begin working together. After 2 days, developer A leaves the project. After another 3 days, developer B leaves the project. Developer C continues working alone until the project is finished.
What is the TOTAL number of days taken from start to finish to complete the project?''',
    options: ['''9 days''', '''10 days''', '''11 days''', '''12 days'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Let total work be LCM(12, 15, 20) = 60 units.
Daily work rates:
Rate of A = 60 / 12 = 5 units/day.
Rate of B = 60 / 15 = 4 units/day.
Rate of C = 60 / 20 = 3 units/day.

Phase 1 (Days 1 to 2): A, B, and C work together for 2 days.
Work done = 2 * (5 + 4 + 3) = 2 * 12 = 24 units.
Remaining work = 60 - 24 = 36 units.

Phase 2 (Days 3 to 5): B and C work together for 3 days.
Work done = 3 * (4 + 3) = 3 * 7 = 21 units.
Remaining work = 36 - 21 = 15 units.

Phase 3: C works alone at rate 3 units/day.
Days required for C = 15 / 3 = 5 days.

Total duration from start to finish = 2 + 3 + 5 = 10 days. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_GA_07',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Permutations & Restrictions''',
    questionText: '''Four colleagues (C1, C2, C3, C4) participate in a Secret Santa gift exchange. Each colleague brings one gift, and the four gifts (G1, G2, G3, G4) are redistributed so that nobody receives their own gift (a derangement). In how many of these valid derangements does colleague C1 receive gift G2?''',
    options: ['''2''', '''3''', '''4''', '''6'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Total number of derangements of 4 items is !4 = 4! * (1 - 1 + 1/2 - 1/6 + 1/24) = 24 * (12/24 - 4/24 + 1/24) = 9 derangements.
In any derangement, colleague C1 can receive G2, G3, or G4 (3 possible gifts).
By symmetry, the 9 derangements are partitioned equally among the 3 allowable recipients for C1:
Number of derangements where C1 receives G2 = !4 / 3 = 9 / 3 = 3.
(Explicitly: (G2, G1, G4, G3), (G2, G3, G4, G1), (G2, G4, G1, G3)).
Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_GA_08',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Critical Reasoning''',
    questionText: '''Analyze the following argument:
"Every module in the new microservices architecture has been individually verified to have a processing latency of less than 5 milliseconds. Therefore, the overall end-to-end system latency for user requests will be less than 5 milliseconds."
Which formal logical fallacy does this argument commit?''',
    options: ['''Fallacy of Composition''', '''Fallacy of Division''', '''Post hoc ergo propter hoc''', '''Argumentum ad ignorantiam'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The Fallacy of Composition arises when an attribute of individual parts is erroneously inferred to be an attribute of the whole system.
Here, each individual module is under 5 ms, but user requests pass sequentially through multiple modules and network hops, so the whole system's end-to-end latency is the sum (or pipeline) of these latencies, which easily exceeds 5 ms. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_GA_09',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude''',
    questionText: '''A technology portfolio experiences an investment return of +50% in Year 1, -40% in Year 2, and +20% in Year 3.
The Compounded Annual Growth Rate (CAGR) over the 3-year period is closest to:''',
    options: ['''2.6%''', '''10.0%''', '''7.4%''', '''-3.3%'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Let initial portfolio value be V_0 = 1.0.
End of Year 1: V_1 = 1.0 * (1 + 0.50) = 1.50.
End of Year 2: V_2 = 1.50 * (1 - 0.40) = 0.90.
End of Year 3: V_3 = 0.90 * (1 + 0.20) = 1.08.
Overall multiplier over 3 years = 1.08.
The CAGR r is given by:
(1 + r)^3 = 1.08  =>  1 + r = (1.08)^(1/3).
Using binomial approximation (1 + x)^(1/3) approx 1 + x/3 for small x = 0.08:
1 + r approx 1 + 0.08 / 3 = 1 + 0.0267  =>  r approx 2.6%.
(Notice the arithmetic mean is (50 - 40 + 20)/3 = +10%, but true geometric compounding gives only 2.6%).
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_GA_10',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Geometry & Spatial Mensuration''',
    questionText: '''Two identical solid circular cylinders of radius R = 3 cm intersect at right angles such that their central axes meet orthogonally at the origin.
The volume of the intersection (overlapping region) of the two cylinders is:''',
    options: ['''72 cm^3''', '''144 cm^3''', '''108 cm^3''', '''216 cm^3'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The intersection of two perpendicular cylinders of radius R is the classic Steinmetz solid (bicylinder).
Its volume is given by Archimedes' formula:
V = (16 / 3) * R^3.
Given R = 3 cm:
V = (16 / 3) * (3)^3 = (16 / 3) * 27 = 16 * 9 = 144 cm^3.
Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_11',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Subspaces and Projection Matrices''',
    questionText: '''Let W be a k-dimensional subspace of R^n (with 1 <= k < n), and let P be the n x n standard orthogonal projection matrix onto W (so that P^2 = P = P^T).
Which of the following statements is ALWAYS TRUE?''',
    options: ['''The trace of matrix P is equal to the dimension of subspace W (i.e., Trace(P) = k).''', '''The determinant of matrix P is equal to 1.''', '''P is invertible because P^T = P.''', '''All eigenvalues of P are strictly greater than 1.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''For an orthogonal projection matrix P onto a k-dimensional subspace W:
1. P is idempotent (P^2 = P), so its eigenvalues can only be 0 or 1.
2. The multiplicity of eigenvalue 1 equals dim(W) = k, and the multiplicity of eigenvalue 0 equals dim(W^perp) = n - k.
3. The trace of a matrix is the sum of its eigenvalues: Trace(P) = k * 1 + (n - k) * 0 = k = dim(W).
4. Since k < n, at least one eigenvalue is 0, so det(P) = 0 (P is singular/non-invertible).
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_12',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Eigenvalues and Trace''',
    questionText: '''A 3 x 3 real symmetric matrix A has positive eigenvalues that form a geometric progression: lambda_1 = 1, lambda_2 = r, lambda_3 = r^2 (where r > 1).
If the determinant of matrix A is equal to 64, what is the TRACE of matrix A?''',
    options: [],
    correctAnswer: '''21''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''The determinant of a matrix is the product of its eigenvalues:
det(A) = lambda_1 * lambda_2 * lambda_3 = 1 * r * r^2 = r^3.
We are given det(A) = 64:
r^3 = 64  =>  r = 4.
The three eigenvalues are:
lambda_1 = 1
lambda_2 = 4
lambda_3 = 4^2 = 16.
The trace of a matrix is the sum of its eigenvalues:
Trace(A) = lambda_1 + lambda_2 + lambda_3 = 1 + 4 + 16 = 21.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_13',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Idempotent Matrices''',
    questionText: '''Let P be an n x n real matrix satisfying P^2 = P (i.e., P is idempotent). Which of the following statements is/are TRUE? (Select all that apply)''',
    options: ['''The only possible eigenvalues of P are 0 and 1.''', '''The matrix (I_n - P) is also an idempotent matrix.''', '''The rank of matrix P is strictly equal to the trace of P (i.e., rank(P) = Trace(P)).''', '''P is always diagonalizable over R.'''],
    correctAnswer: '''A;B;C;D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: If P v = lambda v, then P^2 v = lambda^2 v = lambda v => lambda(lambda - 1) = 0 => lambda in {0, 1}.
B is TRUE: (I - P)^2 = I - 2P + P^2 = I - 2P + P = I - P.
C is TRUE: Since P is diagonalizable with eigenvalues in {0, 1}, its trace is the sum of eigenvalues (count of 1s), which equals its rank.
D is TRUE: The minimal polynomial divides x(x - 1), which has distinct linear real factors. Therefore, every idempotent matrix is diagonalizable.
All four statements A, B, C, D are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_14',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Limits and LHospitals Rule Failure''',
    questionText: '''Evaluate the limit:
L = lim_{x -> infinity} (x + sin(x)) / x
Which of the following statements is correct?''',
    options: ['''L does not exist because sin(x) oscillates indefinitely as x -> infinity.''', '''L = 1 by direct algebraic simplification, even though L'Hopital's rule fails to apply because the quotient of derivatives does not converge.''', '''L = 0 by Squeeze Theorem.''', '''L'Hopital's rule proves that L = 2.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Direct evaluation:
(x + sin(x)) / x = 1 + (sin(x) / x).
Since -1 <= sin(x) <= 1, as x -> infinity, -1/x <= sin(x)/x <= 1/x -> 0 by the Squeeze Theorem.
Thus L = 1 + 0 = 1.
Note: Differentiating numerator and denominator yields lim_{x -> inf} (1 + cos(x)) / 1, which oscillates between 0 and 2 and does not exist. This is a classic textbook example showing that L'Hopital's rule failure does not imply the original limit does not exist. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_15',
    year: 2026,
    subject: '''Optimization''',
    topic: '''Unconstrained Convex Quadratic Extrema''',
    questionText: '''Consider the quadratic function:
f(x1, x2) = x1^2 + 4*x2^2 - 4*x1 - 8*x2 + 10
The minimum value of f(x1, x2) over all (x1, x2) in R^2 is ________. (Answer as an integer).''',
    options: [],
    correctAnswer: '''2''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Completing the square:
f(x1, x2) = (x1^2 - 4*x1 + 4) + 4*(x2^2 - 2*x2 + 1) + 10 - 4 - 4
          = (x1 - 2)^2 + 4*(x2 - 1)^2 + 2.
Since squares are non-negative:
(x1 - 2)^2 >= 0 and 4*(x2 - 1)^2 >= 0.
The minimum occurs at x1 = 2, x2 = 1.
The minimum value is f(2, 1) = 0 + 0 + 2 = 2.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_16',
    year: 2026,
    subject: '''Optimization''',
    topic: '''KKT and Slaters Constraint Qualification''',
    questionText: '''Consider a convex optimization problem: Minimize f_0(x) subject to f_i(x) <= 0 (for i = 1, ..., m) and A x = b, where all f_i are convex.
Which of the following statements regarding Duality and KKT conditions is/are TRUE? (Select all that apply)''',
    options: ['''Weak duality (optimal dual value d* <= optimal primal value p*) always holds for any optimization problem, whether convex or non-convex.''', '''If Slater's condition holds (there exists an x in the relative interior such that f_i(x) < 0 for all strictly convex constraints), then strong duality holds (d* = p*).''', '''When strong duality holds, any primal-dual optimal pair (x*, lambda*, nu*) must satisfy the Karush-Kuhn-Tucker (KKT) conditions.''', '''For non-convex problems, satisfying KKT conditions is both necessary and sufficient for global optimality.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: Weak duality holds universally without any convexity assumptions.
B is TRUE: Slater's constraint qualification guarantees strong duality (zero duality gap) for convex optimization problems.
C is TRUE: When strong duality holds and primal and dual optima are attained, KKT conditions are necessary conditions for optimality.
D is FALSE: For non-convex problems, KKT points can be saddle points, local minima, or local maxima, so KKT is neither sufficient nor always necessary (without qualification).
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_17',
    year: 2026,
    subject: '''Probability''',
    topic: '''Sum of Geometric Variables''',
    questionText: '''Let X_1, X_2, ..., X_r be independent and identically distributed random variables, each representing the number of Bernoulli trials (with success probability p) up to and including the first success.
The sum S_r = sum_{i=1}^r X_i follows which distribution?''',
    options: ['''Binomial distribution with parameters r and p''', '''Negative Binomial distribution with parameters r and p''', '''Poisson distribution with parameter r * p''', '''Geometric distribution with parameter r * p'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Each X_i is the number of trials until the i-th success.
The sum S_r is the total number of independent Bernoulli trials required to observe exactly r successes.
By definition, this is the Negative Binomial distribution with parameters r (number of successes) and p (success probability). Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_18',
    year: 2026,
    subject: '''Probability''',
    topic: '''Moment Generating Function and Variance''',
    questionText: '''The Moment Generating Function (MGF) of a continuous random variable X is given by:
M_X(t) = 1 / (1 - 2*t), for t < 1/2
What is the variance Var(X)? (Answer as an integer).''',
    options: [],
    correctAnswer: '''4''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Recall that the MGF of an Exponential distribution with rate lambda is M_X(t) = lambda / (lambda - t) = 1 / (1 - t / lambda).
Comparing 1 / (1 - 2t) with 1 / (1 - t / lambda) gives lambda = 1/2.
For an Exponential distribution with parameter lambda = 1/2:
E[X] = 1 / lambda = 2.
Var(X) = 1 / lambda^2 = 1 / (1/2)^2 = 4.
Alternatively, via derivatives:
M'(t) = 2 * (1 - 2t)^(-2)  =>  E[X] = M'(0) = 2.
M''(t) = 8 * (1 - 2t)^(-3) => E[X^2] = M''(0) = 8.
Var(X) = E[X^2] - (E[X])^2 = 8 - 2^2 = 4.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_19',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Students t Distribution Properties''',
    questionText: '''Which of the following statements regarding Student's t-distribution with nu degrees of freedom is/are TRUE? (Select all that apply)''',
    options: ['''The probability density function is symmetric and bell-shaped around zero.''', '''The t-distribution has heavier (fatter) tails than the standard normal distribution N(0, 1).''', '''As the degrees of freedom nu -> infinity, the t-distribution converges in distribution to the standard normal distribution N(0, 1).''', '''The variance of the t-distribution is defined and finite for all degrees of freedom nu >= 1.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: The t-distribution pdf is strictly symmetric around mean 0.
B is TRUE: It decays polynomially (like t^(-(nu+1))) rather than exponentially, giving heavier tails and greater probability of extreme values.
C is TRUE: By standard asymptotic theory, lim_{nu -> inf} t_nu = N(0, 1).
D is FALSE: The variance of t_nu is nu / (nu - 2), which is defined and finite ONLY for nu > 2. For nu = 1 (Cauchy distribution), the variance (and mean) does not exist; for nu = 2, the variance is infinite.
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_20',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Geometric Distribution MLE''',
    questionText: '''A random sample of 4 independent trials measures the number of attempts needed to establish an API connection: {2, 4, 3, 1}.
Assuming the data follows a Geometric distribution P(X = k) = (1 - p)^(k - 1) * p for k in {1, 2, ...}, what is the Maximum Likelihood Estimate (MLE) of the success probability p? (Round off to 2 decimal places).''',
    options: [],
    correctAnswer: '''0.40''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''For a sample of n independent observations X_1, ..., X_n from Geometric(p):
The likelihood function is:
L(p) = prod_{i=1}^n (1 - p)^(X_i - 1) * p = p^n * (1 - p)^(sum X_i - n).
Log-likelihood:
ln L(p) = n * ln(p) + (sum X_i - n) * ln(1 - p).
Differentiating with respect to p and setting to 0:
d/dp ln L(p) = n / p - (sum X_i - n) / (1 - p) = 0
n(1 - p) = p(sum X_i - n)
n - n*p = p*sum X_i - n*p  =>  p_hat = n / sum_{i=1}^n X_i.
Given n = 4 and sample {2, 4, 3, 1}:
sum X_i = 2 + 4 + 3 + 1 = 10.
p_hat_MLE = 4 / 10 = 0.40.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_21',
    year: 2026,
    subject: '''Data Structures & Algorithms''',
    topic: '''Sorting Lower Bound''',
    questionText: '''The Omega(n * log n) lower bound for comparison-based sorting algorithms is formally proved using:''',
    options: ['''Master Theorem on divide-and-conquer recurrences''', '''Decision Tree Model, where the tree must have at least n! leaves to distinguish all permutations, implying height >= log_2(n!) = Omega(n * log n)''', '''Adversary arguments showing that an adversary can hide the maximum element in O(n) steps''', '''Dynamic programming memoization tables'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''In the decision tree model for comparison sorting:
Every execution path corresponds to a sequence of comparisons leading to a leaf representing a unique permutation of the input elements.
Since there are n! possible permutations, the binary tree must contain at least n! leaf nodes:
Leaves L >= n!
The height h of a binary tree with L leaves satisfies h >= ceil(log_2 L) >= log_2(n!).
Using Stirling's approximation, log_2(n!) = Omega(n * log n). Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_22',
    year: 2026,
    subject: '''Data Structures & Algorithms''',
    topic: '''Strictly Binary Tree Leaves and Internal Nodes''',
    questionText: '''A strictly binary tree (full binary tree) is a tree where every node has either exactly 0 or exactly 2 children.
If a strictly binary tree has exactly 15 leaf nodes, how many INTERNAL (non-leaf) nodes does it contain?''',
    options: [],
    correctAnswer: '''14''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''In any strictly binary tree:
Let I be the number of internal nodes and L be the number of leaf nodes.
Total nodes N = I + L.
Every internal node has 2 children, and the root is not a child of any node.
Total edges E = 2 * I.
In any tree with N nodes, the number of edges is E = N - 1.
Equating:
2 * I = (I + L) - 1
I = L - 1.
Given L = 15 leaves:
I = 15 - 1 = 14 internal nodes.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_23',
    year: 2026,
    subject: '''Data Structures & Algorithms''',
    topic: '''Bipartite Graphs Characterization''',
    questionText: '''Which of the following statements regarding bipartite graphs is/are TRUE? (Select all that apply)''',
    options: ['''A graph is bipartite if and only if it contains no simple cycle of odd length.''', '''A graph is bipartite if and only if its vertices can be partitioned into two sets such that its chromatic number is at most 2.''', '''Every tree is a bipartite graph.''', '''Finding the maximum cardinality matching in a bipartite graph is an NP-complete problem.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: König's characterization theorem: G is bipartite iff G has no odd cycles.
B is TRUE: By definition, bipartite means 2-colorable (chromatic number <= 2).
C is TRUE: Trees have no cycles at all, so they have no odd cycles, making every tree bipartite.
D is FALSE: Maximum bipartite matching can be solved in polynomial time (e.g., Hopcroft-Karp algorithm in O(E * sqrt(V)) time or via Ford-Fulkerson max flow).
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_24',
    year: 2026,
    subject: '''Programming & Python''',
    topic: '''Integer Caching and Identity''',
    questionText: '''In CPython, small integers in the range [-5, 256] are pre-allocated (cached/interned) at startup.
Consider executing the following statements in standard Python:
a = 256
b = 256
print(a is b)

What does the statement print?''',
    options: ['''True''', '''False''', '''None''', '''Raises TypeError'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''CPython caches integer objects in the range [-5, 256]. Any assignment of an integer within this inclusive range references the exact same singleton object in memory.
Since 256 is within the interning range, `a` and `b` reference the identical memory address (`id(a) == id(b)`), so `a is b` evaluates to True. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_25',
    year: 2026,
    subject: '''Database Management Systems''',
    topic: '''Superkeys Counting''',
    questionText: '''Consider a relational schema R(A, B, C, D) with 4 attributes. If relation R has EXACTLY ONE candidate key, namely the composite key {A, B}, what is the total number of SUPERKEYS that relation R possesses? (Answer as an integer).''',
    options: [],
    correctAnswer: '''4''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''A superkey is any superset of a candidate key.
The candidate key is {A, B}.
Any superkey must contain both attributes A and B: {A, B} U X, where X is any subset of the remaining attributes {C, D}.
The remaining set of attributes is {C, D}, which has 2 attributes.
The number of subsets of a 2-element set is 2^2 = 4:
1. {A, B}
2. {A, B, C}
3. {A, B, D}
4. {A, B, C, D}
Total superkeys = 4.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_26',
    year: 2026,
    subject: '''Database Management Systems''',
    topic: '''3NF vs BCNF Guarantees''',
    questionText: '''Which of the following guarantees holds for Third Normal Form (3NF) but DOES NOT always hold for Boyce-Codd Normal Form (BCNF)?''',
    options: ['''Lossless-join decomposition is always achievable.''', '''Dependency preservation is always achievable.''', '''Elimination of all insertion and deletion anomalies.''', '''Every non-prime attribute is fully functionally dependent on every candidate key.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''While every relational schema can be decomposed into 3NF such that the decomposition is simultaneously lossless-join AND dependency-preserving, decomposing into BCNF guarantees lossless-join but CANNOT always preserve functional dependencies (e.g., R(A, B, C) with F = {AB -> C, C -> B}). Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_27',
    year: 2026,
    subject: '''Database Management Systems''',
    topic: '''Write Ahead Logging Rules''',
    questionText: '''Which of the following statements regarding the Write-Ahead Logging (WAL) protocol and database recovery (ARIES) is/are TRUE? (Select all that apply)''',
    options: ['''Before a dirty data page in the buffer pool is written to non-volatile disk storage, all log records pertaining to that page up to its pageLSN must be written to stable storage.''', '''A transaction is not considered committed until its commit log record has been safely flushed to stable storage.''', '''The Analysis pass of ARIES scans the log forward from the most recent checkpoint to reconstruct the Dirty Page Table (DPT) and Transaction Table.''', '''WAL allows uncommitted modifications to be written to disk (Steal policy) only if Undo logging is supported.'''],
    correctAnswer: '''A;B;C;D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: The fundamental WAL rule states: pageLSN <= flushedLSN before writing a page to disk.
B is TRUE: Transaction commit durability requires flushing the commit record to stable log.
C is TRUE: The ARIES recovery procedure begins with the Analysis pass scanning forward from the latest checkpoint to restore state.
D is TRUE: The Steal buffer policy allows flushing dirty pages of active transactions, requiring an Undo mechanism in the log to roll back if the transaction aborts.
All four statements A, B, C, D are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_28',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''F1 Score and Harmonic Mean''',
    questionText: '''The F1-Score of a binary classifier is defined as the Harmonic Mean of Precision and Recall. Why is the Harmonic Mean used instead of the Arithmetic Mean?''',
    options: ['''Because the arithmetic mean penalizes extreme imbalances between Precision and Recall more severely than the harmonic mean.''', '''Because the harmonic mean is dominated by the smaller value, preventing a model with 100% Recall and 1% Precision from achieving an inflated score.''', '''Because the harmonic mean is computationally faster to evaluate on GPUs.''', '''Because the arithmetic mean cannot handle decimal values between 0 and 1.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The arithmetic mean of P = 1.0 and R = 0.02 is (1.0 + 0.02)/2 = 0.51 (deceptively high).
In contrast, the harmonic mean 2PR / (P + R) gives 2(1)(0.02) / (1 + 0.02) = 0.04 / 1.02 approx 0.039.
The harmonic mean is heavily dragged down by whichever metric is poor, ensuring high F1 requires both precision and recall to be robust. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_29',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Ridge Regression Shrinkage Factor''',
    questionText: '''In Ridge Regression with objective (1/2) * ||y - X w||_2^2 + (alpha / 2) * ||w||_2^2, the projection of the weights along an eigenvector of X^T X with eigenvalue lambda = 8 is shrunk relative to the OLS solution by the factor lambda / (lambda + alpha).
If regularization parameter alpha = 2, what is the shrinkage factor? (Round off to 2 decimal places).''',
    options: [],
    correctAnswer: '''0.80''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''The shrinkage factor along the principal axis with eigenvalue lambda is:
Factor = lambda / (lambda + alpha).
Given lambda = 8 and alpha = 2:
Factor = 8 / (8 + 2) = 8 / 10 = 0.80.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_30',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''DBSCAN Clustering Mechanics''',
    questionText: '''Which of the following statements regarding the DBSCAN density-based clustering algorithm is/are TRUE? (Select all that apply)''',
    options: ['''A point p is a Core Point if its epsilon-neighborhood contains at least MinPts points (including p itself).''', '''A Border Point has fewer than MinPts points in its epsilon-neighborhood, but is density-reachable from a core point.''', '''DBSCAN does not require specifying the number of clusters k in advance.''', '''DBSCAN can find clusters of arbitrary non-spherical shapes and is robust to noise.'''],
    correctAnswer: '''A;B;C;D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: Standard DBSCAN definition of a core point: |N_eps(p)| >= MinPts.
B is TRUE: Border points are non-core points that reside within the epsilon-neighborhood of a core point.
C is TRUE: Unlike K-Means, DBSCAN discovers the number of clusters automatically based on density parameters (eps, MinPts).
D is TRUE: Density connectivity allows DBSCAN to discover winding, concentric, and arbitrary non-convex geometric clusters while labeling sparse points as noise (-1).
All four statements A, B, C, D are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_31',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Gradient Boosting vs Random Forest''',
    questionText: '''Which of the following contrasts between Random Forest and Gradient Boosted Decision Trees (GBDT) is correct?''',
    options: ['''Random Forest trains trees sequentially to minimize residual gradients, whereas GBDT trains trees independently in parallel.''', '''Random Forest primarily reduces model variance through bagging and feature subsampling, whereas GBDT primarily reduces model bias through sequential residual optimization.''', '''Random Forest is highly sensitive to outlier labels, whereas GBDT is completely immune to label noise.''', '''Random Forest uses shallow stumps of depth 1, whereas GBDT requires full unpruned trees of depth 20.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Random Forest is an ensemble of deep, low-bias trees built independently in parallel; averaging reduces variance.
GBDT builds shallow trees sequentially, where each new tree fits the pseudo-residuals (negative gradients) of the current ensemble, systematically driving down bias. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_32',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''Inconsistent Heuristic Path Evaluation''',
    questionText: '''In a search graph, start node S connects to node A with step cost c(S, A) = 5.
Node A connects to goal node G with step cost c(A, G) = 3.
The heuristic values are h(S) = 6, h(A) = 7, and h(G) = 0.
Notice h is inconsistent because h(S) > c(S, A) + h(A) (6 <= 5 + 7 holds, but h(A) - h(G) = 7 - 0 = 7 > c(A, G) = 3).
Under A* search, what is the evaluation function value f(A) = g(A) + h(A)? (Answer as an integer).''',
    options: [],
    correctAnswer: '''12''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Cost from start node S to node A:
g(A) = c(S, A) = 5.
Heuristic at node A:
h(A) = 7.
The A* evaluation function is:
f(A) = g(A) + h(A) = 5 + 7 = 12.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_33',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''Minimax and Horizon Effect''',
    questionText: '''Which of the following statements regarding depth-limited Minimax search and evaluation functions is/are TRUE? (Select all that apply)''',
    options: ['''The Horizon Effect occurs when a search algorithm pushes an unavoidable catastrophic loss beyond the search depth limit by executing delaying moves.''', '''Quiescence search mitigates the horizon effect by continuing to search non-quiet (tactical) positions beyond the cutoff depth.''', '''Iterative Deepening Search with Alpha-Beta pruning enables optimal move-ordering based on the previous shallower search iterations.''', '''Alpha-Beta pruning can alter the final minimax value returned at the root if nodes are visited in worst-case order.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: Definition of the Horizon Effect in game playing.
B is TRUE: Quiescence search evaluates positions only when tactical volatility (captures, checks) has settled.
C is TRUE: Results from depth d - 1 inform move ordering at depth d, approaching optimal O(b^(d/2)) pruning efficiency.
D is FALSE: Alpha-Beta pruning is mathematically guaranteed to return the exact same minimax value as full minimax, regardless of move ordering (move ordering affects ONLY the number of branches pruned).
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_34',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''First Order Logic Quantifier Duality''',
    questionText: '''Which of the following First-Order Logic sentences is logically EQUIVALENT to ~ (forall x, P(x) -> Q(x))?''',
    options: ['''exists x (P(x) and ~Q(x))''', '''forall x (~P(x) or Q(x))''', '''exists x (~P(x) and Q(x))''', '''~ (exists x (~P(x) or Q(x)))'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Step 1: Express implication as disjunction:
P(x) -> Q(x) equiv ~P(x) or Q(x).
Step 2: Negate the quantified statement:
~ (forall x, (~P(x) or Q(x))).
Step 3: Move negation inside using quantifier duality (~forall x = exists x ~):
exists x ~ (~P(x) or Q(x)).
Step 4: Apply De Morgan's Law:
exists x (P(x) and ~Q(x)).
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_35',
    year: 2026,
    subject: '''Probability & Statistics''',
    topic: '''Poisson Approximation to Binomial''',
    questionText: '''A semiconductor manufacturing line produces microchips with a defect probability p = 0.004 per chip.
In a random batch of n = 500 chips, what is the parameter lambda of the approximating Poisson distribution? (Answer as an integer).''',
    options: [],
    correctAnswer: '''2''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''By the Poisson Limit Theorem (Law of Rare Events):
When n is large (n = 500) and p is small (p = 0.004), the Binomial(n, p) distribution is accurately approximated by a Poisson(lambda) distribution with parameter:
lambda = n * p.
lambda = 500 * 0.004 = 2.0.
The Poisson parameter is 2.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_36',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Pseudoinverse of Rank-One Outer Product''',
    questionText: '''Let u = [1, 2]^T and v = [2, 1]^T be non-zero column vectors in R^2.
Consider the rank-1 outer product matrix:
A = u * v^T = [[2, 1],
               [4, 2]]
The Moore-Penrose pseudoinverse of A is given by A^+ = (1 / (||u||_2^2 * ||v||_2^2)) * v * u^T.
What is the entry in the first row and first column, (A^+)_{1,1}? (Round off to 2 decimal places).''',
    options: [],
    correctAnswer: '''0.08''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Compute vector norms:
||u||_2^2 = 1^2 + 2^2 = 5.
||v||_2^2 = 2^2 + 1^2 = 5.
Denominator = ||u||_2^2 * ||v||_2^2 = 5 * 5 = 25.
The matrix v * u^T is:
[[2], [1]] * [1, 2] = [[2*1, 2*2], [1*1, 1*2]] = [[2, 4], [1, 2]].
Therefore, the pseudoinverse is:
A^+ = (1 / 25) * [[2, 4], [1, 2]] = [[2/25, 4/25], [1/25, 2/25]].
The entry (A^+)_{1,1} = 2 / 25 = 0.08.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_37',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Spectral Theorem for Real Symmetric Matrices''',
    questionText: '''Let A be an n x n real symmetric matrix with eigenvalues lambda_1 >= lambda_2 >= ... >= lambda_n and corresponding orthonormal eigenvectors u_1, u_2, ..., u_n.
Which of the following statements is/are TRUE? (Select all that apply)''',
    options: ['''A can be factored as A = sum_{i=1}^n lambda_i * u_i * u_i^T (Spectral Decomposition).''', '''The rank of matrix A is strictly equal to the number of non-zero eigenvalues.''', '''If all eigenvalues lambda_i != 0, the inverse matrix is A^(-1) = sum_{i=1}^n (1 / lambda_i) * u_i * u_i^T.''', '''Every real symmetric matrix is similar to an upper triangular matrix with non-zero sub-diagonal entries.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: By the Spectral Theorem, any real symmetric matrix has an orthonormal basis of eigenvectors and can be expanded as sum lambda_i u_i u_i^T.
B is TRUE: For diagonalizable matrices, rank equals the number of non-zero eigenvalues.
C is TRUE: A^(-1) = U Lambda^(-1) U^T = sum (1/lambda_i) u_i u_i^T.
D is FALSE: A real symmetric matrix is orthogonally diagonalizable (similar to a DIAGONAL matrix, meaning all off-diagonal entries are strictly zero, not non-zero).
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_38',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Matrix Exponential and Rotation Groups''',
    questionText: '''Consider the 2 x 2 skew-symmetric matrix:
A = [[ 0, 1],
     [-1, 0]]
The matrix exponential e^(A * t) = sum_{k=0}^infinity (A * t)^k / k! is equal to:''',
    options: ['''[[ cos(t), sin(t)], [-sin(t), cos(t)]]''', '''[[ cosh(t), sinh(t)], [sinh(t), cosh(t)]]''', '''[[ e^t, 0], [0, e^(-t)]]''', '''[[ 1, t], [-t, 1]]'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Notice the powers of A:
A = [[0, 1], [-1, 0]]
A^2 = [[-1, 0], [0, -1]] = -I
A^3 = -A
A^4 = I
Using Taylor series:
e^(At) = I + A t + (A^2 t^2)/2! + (A^3 t^3)/3! + ...
= I * (1 - t^2/2! + t^4/4! - ...) + A * (t - t^3/3! + t^5/5! - ...)
= I * cos(t) + A * sin(t)
= [[cos(t), 0], [0, cos(t)]] + [[0, sin(t)], [-sin(t), 0]]
= [[cos(t), sin(t)], [-sin(t), cos(t)]].
This generates the SO(2) rotation matrix. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_39',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Greens Theorem Line Integrals''',
    questionText: '''Let C be the circular boundary of the disk x^2 + y^2 <= 4 oriented counter-clockwise.
Evaluate the line integral around C:
I = oint_C (3*y dx + 5*x dy)
The value of the line integral is I = k * pi. What is the value of the constant k? (Answer as an integer).''',
    options: [],
    correctAnswer: '''8''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''By Green's Theorem:
oint_C (P dx + Q dy) = iint_D (dQ/dx - dP/dy) dA,
where D is the disk x^2 + y^2 <= 4 of radius R = 2.
Here P = 3y and Q = 5x:
dQ/dx = 5.
dP/dy = 3.
dQ/dx - dP/dy = 5 - 3 = 2.
The line integral becomes:
I = iint_D 2 dA = 2 * Area(D) = 2 * (pi * R^2) = 2 * (pi * 2^2) = 2 * 4 * pi = 8 * pi.
The constant k is 8.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_40',
    year: 2026,
    subject: '''Optimization''',
    topic: '''Conjugate Gradient Distinct Eigenvalues Convergence''',
    questionText: '''Consider solving a linear system A x = b where A is a 10 x 10 symmetric positive definite real matrix using the Conjugate Gradient (CG) algorithm with exact arithmetic.
If matrix A has EXACTLY THREE distinct eigenvalues: {2.0, 5.0, 8.0}, what is the MAXIMUM number of iterations required for CG to find the exact solution x*?''',
    options: [],
    correctAnswer: '''3''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''A fundamental theoretical property of the Conjugate Gradient method is that the error at iteration k is bounded by:
||e_k||_A <= 2 * min_{p_k in P_k, p_k(0)=1} max_{lambda in sigma(A)} |p_k(lambda)| * ||e_0||_A.
If matrix A has only m distinct eigenvalues, we can construct an m-degree polynomial p_m(x) = prod_{j=1}^m (1 - x / lambda_j) which satisfies p_m(0) = 1 and evaluates to zero at all eigenvalues of A.
Therefore, CG converges to the EXACT solution in at most m iterations.
Given m = 3 distinct eigenvalues, CG requires at most 3 iterations.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_41',
    year: 2026,
    subject: '''Optimization''',
    topic: '''Frank Wolfe vs Projected Gradient Descent''',
    questionText: '''Which of the following statements comparing the Frank-Wolfe (Conditional Gradient) algorithm and Projected Gradient Descent (PGD) over a compact convex set C is/are TRUE? (Select all that apply)''',
    options: ['''At each step, Frank-Wolfe minimizes a linear approximation of the objective over C, solving a linear programming subproblem rather than a quadratic projection.''', '''Unlike PGD, Frank-Wolfe is projection-free, making it computationally advantageous when linear optimization over C is substantially cheaper than Euclidean projection onto C (e.g., over nuclear norm ball).''', '''Frank-Wolfe iterates are always convex combinations of extreme points (atoms) of C, producing inherently sparse representations.''', '''Frank-Wolfe achieves a linear convergence rate O(1/2^k) on all smooth convex functions over any compact polytope without modifications.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: Frank-Wolfe solves s_t = argmin_{s in C} <grad f(x_t), s>, which is a linear program over C.
B is TRUE: Projection onto complex sets (e.g., nuclear norm ball requires full SVD) is expensive, whereas linear optimization requires only the leading singular vector (via Lanczos), making FW projection-free.
C is TRUE: Updates are x_{t+1} = (1 - gamma_t) x_t + gamma_t s_t, maintaining x_t as a sparse convex combination of atoms.
D is FALSE: Standard Frank-Wolfe exhibits zig-zagging near boundaries of polytopes, yielding only a sublinear O(1/k) rate. (Modifications like Away-step FW are required for linear convergence).
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_42',
    year: 2026,
    subject: '''Probability''',
    topic: '''Bivariate Normal Conditional Expectation''',
    questionText: '''Let (X, Y) follow a Bivariate Normal distribution with parameters:
mu_X = 0, mu_Y = 0, sigma_X^2 = 4, sigma_Y^2 = 9, and correlation coefficient rho = 0.6.
What is the conditional expectation E[Y | X = 2]? (Round off to 1 decimal place).''',
    options: [],
    correctAnswer: '''1.8''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''For a Bivariate Normal distribution, the conditional distribution of Y given X = x is normal:
Y | (X = x) ~ N( mu_Y + rho * (sigma_Y / sigma_X) * (x - mu_X),  sigma_Y^2 * (1 - rho^2) ).
Given parameters:
mu_X = 0, mu_Y = 0.
sigma_X = sqrt(4) = 2.
sigma_Y = sqrt(9) = 3.
rho = 0.6.
Given x = 2:
E[Y | X = 2] = 0 + 0.6 * (3 / 2) * (2 - 0) = 0.6 * 3 = 1.8.
The conditional expectation is 1.8.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_43',
    year: 2026,
    subject: '''Probability''',
    topic: '''MM1 Queue Steady State''',
    questionText: '''In an M/M/1 queuing system, jobs arrive according to a Poisson process with arrival rate lambda = 3 jobs per minute, and the single server has exponentially distributed service times with service rate mu = 5 jobs per minute.
In steady state, what is the expected number of jobs in the system L?''',
    options: ['''0.6''', '''1.0''', '''1.5''', '''2.5'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Utilization factor rho = lambda / mu = 3 / 5 = 0.6.
For an M/M/1 queue in steady state (rho < 1):
The average number of jobs in the system L (in queue + in service) is given by:
L = rho / (1 - rho) = 0.6 / (1 - 0.6) = 0.6 / 0.4 = 6 / 4 = 1.5.
Option C is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_44',
    year: 2026,
    subject: '''Probability''',
    topic: '''Order Statistics Expectation''',
    questionText: '''Let X_1, X_2, X_3 be a random sample of size n = 3 drawn independently from a continuous Uniform distribution U[0, 1].
Let X_(3) = max(X_1, X_2, X_3) be the maximum order statistic.
What is the expected value E[X_(3)]? (Round off to 2 decimal places).''',
    options: [],
    correctAnswer: '''0.75''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''For an independent sample of size n drawn from U[0, 1]:
The cumulative distribution function of the k-th order statistic X_(k) is Beta(k, n - k + 1).
Specifically, for the maximum X_(n):
P(X_(n) <= x) = [P(X <= x)]^n = x^n for 0 <= x <= 1.
The probability density function is:
f_{X_(n)}(x) = d/dx [x^n] = n * x^(n - 1).
The expected value is:
E[X_(n)] = int_0^1 x * n * x^(n - 1) dx = n * int_0^1 x^n dx = n / (n + 1).
For n = 3:
E[X_(3)] = 3 / (3 + 1) = 3 / 4 = 0.75.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_45',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Karlin Rubin and Monotone Likelihood Ratio''',
    questionText: '''Which of the following statements regarding the Karlin-Rubin Theorem and Uniformly Most Powerful (UMP) tests is/are TRUE? (Select all that apply)''',
    options: ['''If a family of distributions has a Monotone Likelihood Ratio (MLR) in statistic T(X), then the threshold test that rejects H_0 for large values of T(X) is UMP for testing H_0: theta <= theta_0 versus H_1: theta > theta_0.''', '''The one-parameter Exponential family f(x; theta) = h(x) * exp(eta(theta) * T(x) - A(theta)) with strictly increasing eta(theta) possesses the MLR property in T(X).''', '''A UMP test always exists for two-sided alternative hypotheses (H_0: theta = theta_0 versus H_1: theta != theta_0) in all one-parameter families.''', '''The p-value of a statistical test under a true null hypothesis follows a continuous Uniform U[0, 1] distribution.'''],
    correctAnswer: '''A;B;D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: This is the exact statement of the Karlin-Rubin Theorem.
B is TRUE: The likelihood ratio f(x; theta_2)/f(x; theta_1) = exp((eta(theta_2) - eta(theta_1)) T(x)) * const, which is strictly increasing in T(x) since eta is increasing.
C is FALSE: For two-sided alternatives (theta != theta_0), the optimal critical region for theta > theta_0 places rejection in the right tail, while for theta < theta_0 it places rejection in the left tail. No single test is uniformly most powerful across both directions simultaneously (UMP Unbiased / UMPU tests must be used instead).
D is TRUE: For any continuous test statistic, P(p-value <= u | H_0) = u, so the p-value is uniformly distributed on [0, 1] under H_0.
Thus A, B, and D are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_46',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Two Sample Pooled Variance''',
    questionText: '''Two independent samples are drawn from two normal populations with equal variances:
- Sample 1: size n_1 = 10, sample variance s_1^2 = 16.0
- Sample 2: size n_2 = 10, sample variance s_2^2 = 20.0
What is the pooled sample variance s_p^2? (Answer as an integer).''',
    options: [],
    correctAnswer: '''18''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''The pooled sample variance s_p^2 is defined as:
s_p^2 = [ (n_1 - 1) * s_1^2 + (n_2 - 1) * s_2^2 ] / (n_1 + n_2 - 2).
Given n_1 = 10, n_2 = 10, s_1^2 = 16, s_2^2 = 20:
Degrees of freedom df_1 = 10 - 1 = 9.
Degrees of freedom df_2 = 10 - 1 = 9.
Total df = 9 + 9 = 18.
s_p^2 = [ 9 * 16.0 + 9 * 20.0 ] / 18 = 9 * (16.0 + 20.0) / 18 = (16.0 + 20.0) / 2 = 36.0 / 2 = 18.0.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_47',
    year: 2026,
    subject: '''Data Structures & Algorithms''',
    topic: '''Floyd Warshall Recurrence Relation''',
    questionText: '''In the Floyd-Warshall algorithm for All-Pairs Shortest Paths on a directed graph with vertices {1, 2, ..., n}:
Let d^(k)[i][j] denote the shortest path distance from vertex i to vertex j using only intermediate vertices from the subset {1, 2, ..., k}.
The correct dynamic programming state transition equation is:''',
    options: ['''d^(k)[i][j] = min( d^(k-1)[i][j], d^(k-1)[i][k] + d^(k-1)[k][j] )''', '''d^(k)[i][j] = min( d^(k)[i][j], d^(k)[i][k] * d^(k)[k][j] )''', '''d^(k)[i][j] = d^(k-1)[i][j] + min_{m} d^(k-1)[m][j]''', '''d^(k)[i][j] = min_{k} ( d[i][k] + d[k][j] )'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The Floyd-Warshall recurrence considers whether vertex k is included in the shortest path from i to j:
Case 1: Intermediate vertex k is NOT used -> distance remains d^(k-1)[i][j].
Case 2: Intermediate vertex k IS used -> path splits into path from i to k and path from k to j, each using intermediate vertices from {1, ..., k-1}: d^(k-1)[i][k] + d^(k-1)[k][j].
Taking the minimum yields:
d^(k)[i][j] = min( d^(k-1)[i][j], d^(k-1)[i][k] + d^(k-1)[k][j] ). Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_48',
    year: 2026,
    subject: '''Data Structures & Algorithms''',
    topic: '''Huffman Coding Weighted Path Length''',
    questionText: '''A text corpus contains 5 distinct characters with the following message frequencies:
A: 40, B: 25, C: 20, D: 10, E: 5
Using Huffman's greedy algorithm to construct the optimal prefix-free binary tree, what is the TOTAL number of bits required to encode the entire corpus (the weighted path length)?''',
    options: [],
    correctAnswer: '''210''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Step 1: Build Huffman tree by merging lowest frequency nodes:
- Priority queue: E(5), D(10), C(20), B(25), A(40).
- Merge E(5) and D(10) -> node ED(15).
- Priority queue: ED(15), C(20), B(25), A(40).
- Merge ED(15) and C(20) -> node EDC(35).
- Priority queue: B(25), EDC(35), A(40).
- Merge B(25) and EDC(35) -> node BEDC(60).
- Priority queue: A(40), BEDC(60).
- Merge A(40) and BEDC(60) -> Root(100).

Step 2: Determine codeword lengths (depth in tree):
- A: depth 1 -> length = 1 bit.
- B: depth 2 -> length = 2 bits.
- C: depth 3 -> length = 3 bits.
- D: depth 4 -> length = 4 bits.
- E: depth 4 -> length = 4 bits.

Step 3: Compute total weighted path length:
Total bits = (40 * 1) + (25 * 2) + (20 * 3) + (10 * 4) + (5 * 4)
           = 40 + 50 + 60 + 40 + 20 = 210 bits.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_49',
    year: 2026,
    subject: '''Data Structures & Algorithms''',
    topic: '''Vertex Cover and Independent Set Complementarity''',
    questionText: '''Let G = (V, E) be an undirected graph with n vertices. Which of the following statements is/are TRUE? (Select all that apply)''',
    options: ['''A subset S subseteq V is a Vertex Cover of G if and only if its complement V \ S is an Independent Set of G.''', '''If alpha(G) is the size of the maximum independent set and beta(G) is the size of the minimum vertex cover, then alpha(G) + beta(G) = |V| (Gallai's Theorem).''', '''On bipartite graphs, the size of the minimum vertex cover equals the size of the maximum matching (König's Theorem).''', '''Finding the minimum vertex cover can be solved in O(|V| + |E|) time on general non-bipartite graphs.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: If S covers every edge, no edge can have both endpoints in V \ S, so V \ S is an independent set.
B is TRUE: Complementarity implies maximizing |V \ S| is equivalent to minimizing |S|, so alpha(G) + beta(G) = |V|.
C is TRUE: König's theorem proves min vertex cover = max matching in bipartite graphs.
D is FALSE: Minimum Vertex Cover is one of Karp's 21 NP-complete problems on general graphs; no linear-time algorithm exists unless P = NP.
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_50',
    year: 2026,
    subject: '''Programming & Python''',
    topic: '''C3 Linearization and MRO''',
    questionText: '''Consider the following Python multiple inheritance hierarchy:
class A: pass
class B(A): pass
class C(A): pass
class D(B, C): pass

Using Python's C3 Linearization algorithm, what is the Method Resolution Order (MRO) of class D?''',
    options: ['''[D, B, C, A, object]''', '''[D, B, A, C, object]''', '''[D, C, B, A, object]''', '''[D, A, B, C, object]'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Using C3 Linearization:
L(A) = [A, object]
L(B) = [B] + merge(L(A), [A]) = [B, A, object]
L(C) = [C] + merge(L(A), [A]) = [C, A, object]
L(D) = [D] + merge(L(B), L(C), [B, C])
     = [D] + merge([B, A, object], [C, A, object], [B, C])
1. Head B is not in the tail of any other list -> Select B:
   [D, B] + merge([A, object], [C, A, object], [C])
2. Head A is in the tail of [C, A, object] -> Cannot select A.
   Head C is not in the tail of any other list -> Select C:
   [D, B, C] + merge([A, object], [A, object])
3. Select A, then object.
Result: [D, B, C, A, object]. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_51',
    year: 2026,
    subject: '''Database Management Systems''',
    topic: '''B+ Tree Node Splits''',
    questionText: '''A B+ tree index has leaf nodes that can hold at most 3 search keys (i.e., a leaf node splits into two nodes of sizes 2 and 2 when a 4th key is inserted).
Starting from an initially empty B+ tree, the following 7 distinct keys are inserted in strictly ascending order:
10, 20, 30, 40, 50, 60, 70
How many LEAF NODES are present in the B+ tree after all 7 keys have been inserted?''',
    options: [],
    correctAnswer: '''3''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Let us trace leaf insertions with capacity 3 (overflow at 4 keys):
1. Insert 10, 20, 30: Leaf 1 contains [10, 20, 30] (Full, 3 keys).
2. Insert 40: Leaf 1 overflows with [10, 20, 30, 40].
   Splits into:
   - Left leaf: [10, 20]
   - Right leaf: [30, 40]
   (Total leaf nodes = 2).
3. Insert 50: Added to right leaf -> Right leaf becomes [30, 40, 50] (Full).
4. Insert 60: Right leaf overflows with [30, 40, 50, 60].
   Splits into:
   - Leaf 2: [30, 40]
   - Leaf 3: [50, 60]
   (Total leaf nodes = 3).
5. Insert 70: Added to Leaf 3 -> Leaf 3 becomes [50, 60, 70] (Full, 3 keys).
Total leaf nodes = 3.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_52',
    year: 2026,
    subject: '''Database Management Systems''',
    topic: '''Precedence Graph Conflict Serializability''',
    questionText: '''Consider the concurrent schedule S involving transactions T1, T2, T3:
S: R1(A); R2(B); W1(A); R3(B); W2(A); W3(B); Commit1; Commit2; Commit3;
Which of the following statements is/are TRUE? (Select all that apply)''',
    options: ['''The precedence graph for schedule S contains a directed edge from T1 to T2 due to conflict on item A.''', '''The precedence graph for schedule S contains a directed edge from T2 to T1.''', '''Schedule S is conflict serializable.''', '''The topological sorting of the precedence graph yields an equivalent serial schedule T1 -> T2 -> T3.'''],
    correctAnswer: '''A;C;D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis of conflicting operations (same item, different transactions, at least one write):
1. On item A:
- R1(A) before W2(A) => edge T1 -> T2.
- W1(A) before W2(A) => edge T1 -> T2.
(No operation of T2 on A precedes an operation of T1 on A, so no edge T2 -> T1 exists).
2. On item B:
- R2(B) before W3(B) => edge T2 -> T3.
- R3(B) before W2? No, T2 has only R2(B).
- W3(B) is the final operation on B.
Precedence graph edges: T1 -> T2 and T2 -> T3.
Cycles: There are NO cycles in the graph (T1 -> T2 -> T3 is a DAG).
Therefore:
A is TRUE (edge T1 -> T2 exists).
B is FALSE (no edge T2 -> T1 exists).
C is TRUE (it is acyclic, hence conflict serializable).
D is TRUE (unique topological sort is T1 -> T2 -> T3).
Thus A, C, and D are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_53',
    year: 2026,
    subject: '''Database Management Systems''',
    topic: '''SQL IN vs EXISTS with NULLs''',
    questionText: '''Consider table T1(id INT) with values {1, 2} and table T2(id INT) with values {2, NULL}.
What are the results of the following two SQL queries?
Query 1: SELECT * FROM T1 WHERE id NOT IN (SELECT id FROM T2);
Query 2: SELECT * FROM T1 WHERE NOT EXISTS (SELECT 1 FROM T2 WHERE T2.id = T1.id);''',
    options: ['''Query 1 returns empty set; Query 2 returns id = 1.''', '''Query 1 returns id = 1; Query 2 returns id = 1.''', '''Both queries return empty set.''', '''Both queries return id = 1 and id = 2.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''In Query 1:
`id NOT IN (2, NULL)` expands to `id != 2 AND id != NULL`.
In Three-Valued Logic (3VL), `id != NULL` evaluates to UNKNOWN.
For id = 1: `(1 != 2) AND (1 != NULL)` evaluates to `TRUE AND UNKNOWN = UNKNOWN`.
Since the WHERE clause requires TRUE to output a row, Query 1 returns ZERO rows (empty set).

In Query 2:
For id = 1: The subquery checks `WHERE T2.id = 1`.
For T2 row with id=2: 2=1 is FALSE.
For T2 row with NULL: NULL=1 is UNKNOWN.
The subquery returns no rows.
Therefore `NOT EXISTS` evaluates to TRUE for id = 1.
Query 2 returns id = 1.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_54',
    year: 2026,
    subject: '''Database Management Systems''',
    topic: '''SQL Group By Having Count''',
    questionText: '''Consider a relational table Enrollments(StudentId INT, CourseId VARCHAR(10)) with the following 6 rows:
(101, 'CS101'), (101, 'CS102'), (102, 'CS101'), (103, 'CS101'), (103, 'CS102'), (103, 'CS103').
How many rows are returned by the following SQL query?
SELECT StudentId FROM Enrollments GROUP BY StudentId HAVING COUNT(CourseId) >= 2;''',
    options: [],
    correctAnswer: '''2''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Let us count courses enrolled per StudentId:
- Student 101: enrolled in 'CS101', 'CS102' -> COUNT = 2.
- Student 102: enrolled in 'CS101' -> COUNT = 1.
- Student 103: enrolled in 'CS101', 'CS102', 'CS103' -> COUNT = 3.
The HAVING clause filters for groups where COUNT(CourseId) >= 2:
- Student 101 satisfies condition (2 >= 2).
- Student 102 fails condition (1 < 2).
- Student 103 satisfies condition (3 >= 2).
Exactly 2 students (101 and 103) satisfy the condition. Total rows returned = 2.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_55',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Linear Discriminant Analysis Decision Boundary''',
    questionText: '''In a 1-dimensional binary classification problem, class C1 is distributed as N(mu_1 = 2, sigma^2 = 1) and class C2 is distributed as N(mu_2 = 6, sigma^2 = 1).
Assuming equal prior probabilities P(C1) = P(C2) = 0.5 and equal class variances, what is the optimal Bayes decision boundary threshold x*? (Answer as an integer).''',
    options: [],
    correctAnswer: '''4''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''For Gaussian distributions with common variance sigma^2:
The log-odds ratio is:
ln [ P(C1 | x) / P(C2 | x) ] = ln [ f(x | C1) / f(x | C2) ] + ln [ P(C1) / P(C2) ].
Since priors are equal: ln [ P(C1) / P(C2) ] = ln(1) = 0.
The log-likelihood ratio is:
- (x - mu_1)^2 / (2*sigma^2) + (x - mu_2)^2 / (2*sigma^2) = 0
(x - mu_2)^2 - (x - mu_1)^2 = 0
(x - mu_2 - x + mu_1)(x - mu_2 + x - mu_1) = 0
(mu_1 - mu_2)(2x - (mu_1 + mu_2)) = 0.
Since mu_1 != mu_2:
2x* - (mu_1 + mu_2) = 0  =>  x* = (mu_1 + mu_2) / 2.
Given mu_1 = 2 and mu_2 = 6:
x* = (2 + 6) / 2 = 8 / 2 = 4.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_56',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Random Forest Out of Bag Estimation''',
    questionText: '''Which of the following statements regarding Random Forest and Out-of-Bag (OOB) error estimation is/are TRUE? (Select all that apply)''',
    options: ['''In bootstrap sampling of size N drawn with replacement from a dataset of size N, the probability that a specific observation is omitted from a bootstrap sample approaches 1/e approx 36.8% as N -> infinity.''', '''The Out-of-Bag (OOB) error provides an unbiased estimate of the test generalization error without requiring a separate held-out validation set.''', '''Random Forest uses random feature subset selection of size m approx sqrt(p) at each split to decorrelate individual trees, reducing ensemble variance.''', '''Increasing the number of decision trees in a Random Forest beyond 500 causes the ensemble to severely overfit the training data.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: P(omitted in N draws) = (1 - 1/N)^N -> e^(-1) approx 0.368.
B is TRUE: Breiman (2001) demonstrated that predicting each sample using only trees that did not contain it in their bootstrap sample gives an unbiased out-of-sample error estimate.
C is TRUE: Feature subsampling prevents dominant features from making all trees look identical, lowering pairwise tree correlation rho and reducing overall ensemble variance rho * sigma^2 + (1 - rho)/B * sigma^2.
D is FALSE: By the Strong Law of Large Numbers, adding more trees causes the generalization error to converge to a limiting bound; Random Forests do NOT overfit as the number of trees grows.
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_57',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Neural Network Backpropagation Derivative''',
    questionText: '''A single artificial neuron computes output y = sigma(w * x + b), where sigma(z) = 1 / (1 + e^(-z)) is the logistic sigmoid activation function.
Given input x = 2.0, weight w = 1.0, and bias b = -1.0:
The linear combination is z = 1.0 * 2.0 - 1.0 = 1.0.
Given that sigma(1.0) = 0.731:
The partial derivative of the neuron output with respect to weight w, dy/dw = sigma'(z) * x, is ________. (Round off to 2 decimal places).''',
    options: [],
    correctAnswer: '''0.39''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''The derivative of the sigmoid function is:
sigma'(z) = sigma(z) * (1 - sigma(z)).
For z = 1.0 with sigma(1.0) = 0.731:
sigma'(1.0) = 0.731 * (1 - 0.731) = 0.731 * 0.269 = 0.196639.
By the chain rule:
dy/dw = (dy/dz) * (dz/dw) = sigma'(z) * x.
Given x = 2.0:
dy/dw = 0.196639 * 2.0 = 0.393278.
Rounding to 2 decimal places yields 0.39.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_58',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''tSNE Crowding Problem and Student-t''',
    questionText: '''In t-Distributed Stochastic Neighbor Embedding (t-SNE), why is a Student-t distribution with 1 degree of freedom (Cauchy distribution) used to model pairwise similarities in the low-dimensional embedding space, instead of a Gaussian distribution?''',
    options: ['''To speed up gradient computation from O(N^2) to O(N).''', '''To alleviate the "crowding problem" by utilizing the heavy tails of the Student-t distribution, which maps moderately distant points in high dimension to larger distances in low dimension.''', '''Because the high-dimensional data must follow a t-distribution.''', '''To enforce strict convexity of the Kullback-Leibler divergence objective.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''In high dimensions, the volume of a sphere grows exponentially with dimension (curse of dimensionality), meaning many points are at moderate distances from each other. In 2D, there is insufficient area to place all these points without crowding them together near the center (the "crowding problem").
van der Maaten and Hinton (2008) introduced the heavy-tailed Cauchy (t-distribution with 1 df) q_{ij} proportional to (1 + ||y_i - y_j||^2)^(-1), allowing moderate high-dimensional distances to map to much larger physical distances in 2D, effectively eliminating crowding. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_59',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Transformer Self Attention Mechanics''',
    questionText: '''Which of the following statements regarding the Scaled Dot-Product Attention mechanism in Transformer models is/are TRUE? (Select all that apply)''',
    options: ['''Attention(Q, K, V) = softmax((Q * K^T) / sqrt(d_k)) * V, where d_k is the key dimension.''', '''The scaling factor 1 / sqrt(d_k) prevents the dot products from growing excessively large for large d_k, which would push the softmax into regions with vanishingly small gradients.''', '''For an input sequence of length N, standard full self-attention has time and memory complexity of O(N^2) with respect to sequence length.''', '''Multi-Head Attention projects Queries, Keys, and Values h times with independent linear projections, allowing the model to jointly attend to information from different representation subspaces.'''],
    correctAnswer: '''A;B;C;D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: Vaswani et al. (2017) defined Scaled Dot-Product Attention as softmax(Q K^T / sqrt(d_k)) V.
B is TRUE: Large dot products produce large softmax inputs, saturating softmax outputs near 0 and 1, resulting in vanishing gradients; scaling by 1/sqrt(d_k) preserves unit variance.
C is TRUE: Computing the N x N attention matrix Q K^T requires O(N^2) time and memory.
D is TRUE: Multi-head attention runs h attention functions in parallel, concatenates them, and projects with W^O.
All four statements A, B, C, D are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_60',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''Alpha-Beta Pruning Leaf Evaluations''',
    questionText: '''Consider a depth-2 game tree where the Root is a MAX node with two children, MIN nodes M1 and M2.
Each MIN node has 3 leaf children.
From left to right, the leaf static evaluations are:
- Under M1: [7, 4, 9]
- Under M2: [2, 8, 5]
Under standard Alpha-Beta pruning (traversing left to right), what is the TOTAL number of leaf nodes that are EVALUATED?''',
    options: [],
    correctAnswer: '''4''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Root is MAX (alpha = -inf, beta = +inf).
1. Visit first child M1 (MIN node, alpha = -inf, beta = +inf):
   - Leaf 1: value = 7. beta = min(+inf, 7) = 7.
   - Leaf 2: value = 4. beta = min(7, 4) = 4.
   - Leaf 3: value = 9. beta = min(4, 9) = 4.
   M1 completes with value = 4.
   All 3 leaves under M1 are evaluated.
   Root updates alpha: alpha = max(-inf, 4) = 4.

2. Visit second child M2 (MIN node, alpha = 4, beta = +inf):
   - Leaf 4 (first leaf under M2): value = 2.
     beta = min(+inf, 2) = 2.
     Check cutoff condition:
     alpha (4) >= beta (2).
     Cutoff occurs immediately!
   - Leaves 5 and 6 under M2 (values 8 and 5) are PRUNED!
Total leaf nodes evaluated = 3 (under M1) + 1 (under M2) = 4.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_61',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''MDP Contraction Mapping and Policy Iteration''',
    questionText: '''Which of the following statements regarding Markov Decision Processes (MDPs) is/are TRUE? (Select all that apply)''',
    options: ['''The Bellman Optimality operator T* is a gamma-contraction mapping under the infinity norm (max-norm), guaranteeing a unique optimal value function V* by the Banach Fixed-Point Theorem.''', '''Value Iteration converges to the exact optimal value function V* in a finite number of iterations for any continuous state space.''', '''Policy Iteration alternates between Policy Evaluation (solving linear equations) and Policy Improvement (greedy action selection).''', '''In a finite MDP, Policy Iteration terminates in a finite number of iterations with the strictly optimal policy.'''],
    correctAnswer: '''A;C;D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: ||T* U - T* V||_inf <= gamma ||U - V||_inf. By Banach Fixed Point Theorem, repeated application converges to unique fixed point V*.
B is FALSE: Value iteration approaches V* asymptotically (as t -> infinity); it does not guarantee exact convergence in finite steps on continuous spaces.
C is TRUE: Standard definition of Policy Iteration.
D is TRUE: Since there are only |A|^|S| finite deterministic policies, and each policy improvement step strictly increases expected reward (Policy Improvement Theorem), policy iteration cannot cycle and must terminate in finite steps at an optimal policy.
Thus A, C, and D are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_62',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''QLearning vs SARSA Exploration Policy''',
    questionText: '''What is the fundamental architectural distinction between Q-Learning and SARSA in reinforcement learning?''',
    options: ['''Q-Learning is an On-Policy TD control algorithm, whereas SARSA is an Off-Policy TD control algorithm.''', '''Q-Learning is an Off-Policy TD control algorithm (it updates Q using the greedy action max_{a'} Q(s', a')), whereas SARSA is an On-Policy TD control algorithm (it updates Q using the actual action a' chosen by the current epsilon-greedy policy).''', '''Q-Learning requires an environment transition model P(s' | s, a), whereas SARSA is entirely model-free.''', '''SARSA uses deep neural networks while Q-learning is restricted to tabular lookups.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Q-Learning update: Q(s, a) <- Q(s, a) + alpha * [ r + gamma * max_{a'} Q(s', a') - Q(s, a) ], which evaluates the optimal policy independent of the exploratory policy (Off-Policy).
SARSA update: Q(s, a) <- Q(s, a) + alpha * [ r + gamma * Q(s', a') - Q(s, a) ], which uses the actual next action a' sampled from the behavioral policy (On-Policy). Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_63',
    year: 2026,
    subject: '''Probability & Statistics''',
    topic: '''MLE of Normal Distribution Variance''',
    questionText: '''A random sample of size n = 3 is drawn from a Normal distribution N(mu, sigma^2) with unknown parameters: {4, 8, 12}.
The sample mean is X_bar = (4 + 8 + 12) / 3 = 8.
What is the Maximum Likelihood Estimate (MLE) of the variance parameter sigma^2? (Round off to 2 decimal places).''',
    options: [],
    correctAnswer: '''10.67''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''The Maximum Likelihood Estimator for variance sigma^2 of a normal distribution divides by n (NOT n - 1):
sigma_hat_MLE^2 = (1 / n) * sum_{i=1}^n (X_i - X_bar)^2.
Given n = 3 and X_bar = 8:
(4 - 8)^2 = (-4)^2 = 16.
(8 - 8)^2 = 0^2 = 0.
(12 - 8)^2 = 4^2 = 16.
Sum of squared deviations = 16 + 0 + 16 = 32.
sigma_hat_MLE^2 = 32 / 3 approx 10.6666...
Rounding to 2 decimal places gives 10.67.
(Note: The unbiased sample variance s^2 divides by n - 1 = 2, yielding 16.0, but MLE strictly divides by n = 3).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_64',
    year: 2026,
    subject: '''Linear Algebra & Machine Learning''',
    topic: '''SVD vs Eigendecomposition''',
    questionText: '''Which of the following statements comparing Singular Value Decomposition (SVD) and Eigendecomposition is/are TRUE? (Select all that apply)''',
    options: ['''Eigendecomposition exists only for square matrices, whereas SVD exists for any arbitrary m x n real or complex matrix.''', '''The singular values of matrix A are always non-negative real numbers, whereas the eigenvalues of a real matrix can be complex or negative.''', '''For a real symmetric positive semi-definite matrix, its singular values are identical to its eigenvalues.''', '''Left and right singular vectors of matrix A are orthonormal bases for R^m and R^n respectively.'''],
    correctAnswer: '''A;B;C;D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: Eigendecomposition requires an n x n square matrix (and full set of eigenvectors), while SVD A = U Sigma V^T exists unconditionally for any m x n matrix.
B is TRUE: Singular values are square roots of eigenvalues of A^T A, which are always real and non-negative. Real square matrices can have negative or complex conjugate eigenvalues.
C is TRUE: For symmetric PSD matrices, A = U Lambda U^T with lambda_i >= 0, matching the SVD form.
D is TRUE: U in R^{m x m} and V in R^{n x n} are orthogonal matrices, forming orthonormal bases for R^m and R^n.
All four statements A, B, C, D are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK4_CORE_65',
    year: 2026,
    subject: '''Optimization & Machine Learning''',
    topic: '''Exponential Learning Rate Decay''',
    questionText: '''A deep neural network optimizer uses an exponential learning rate schedule:
eta_t = eta_0 * (gamma)^t
where initial learning rate eta_0 = 0.1, decay factor gamma = 0.5, and t is the training epoch.
What is the learning rate eta_3 at epoch t = 3? (Round off to 4 decimal places).''',
    options: [],
    correctAnswer: '''0.0125''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''At epoch t = 3:
eta_3 = eta_0 * (gamma)^3
      = 0.1 * (0.5)^3
      = 0.1 * 0.125
      = 0.0125.
The learning rate at epoch 3 is 0.0125.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
];
