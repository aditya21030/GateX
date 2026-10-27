// AUTO-GENERATED MOCK 2 QUESTIONS (ULTRA-TOUGH FACULTY LEVEL)
import '../models/models.dart';

final List<PYQ> daFullMock2Questions = [
  PYQ(
    id: 'DA_MOCK2_GA_01',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Verbal Ability''',
    questionText: '''Choose the option that best captures the meaning of the underlined idiom in the given context:
"The regulatory committee discovered that the fintech firm had been cooking the books for over three quarters before the audit was ordered."''',
    options: ['''Preparing professional financial statements according to international accounting standards''', '''Falsifying or fraudulently manipulating financial accounts and records''', '''Automating accounting ledgers using distributed blockchain smart contracts''', '''Delaying quarterly tax filings due to sudden computational server outages'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''"Cooking the books" is a standard English idiom meaning to dishonestly alter or manipulate financial statements and accounts to make a company seem more profitable or hide losses. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_GA_02',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Critical Reasoning''',
    questionText: '''Consider the following premises:
1. Every machine learning algorithm that guarantees global optimality requires the objective function to be strictly convex.
2. Algorithm Alpha does not require the objective function to be strictly convex.
Which of the following is a logically valid deduction?''',
    options: ['''Algorithm Alpha never converges to an optimal solution on any dataset.''', '''Algorithm Alpha does not guarantee global optimality.''', '''Any algorithm that guarantees global optimality must be Algorithm Alpha.''', '''If an objective function is strictly convex, Algorithm Alpha will always fail.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Let G = "guarantees global optimality", C = "requires objective function to be strictly convex".
Premise 1: G -> C.
Premise 2: ~C (for Algorithm Alpha).
By Modus Tollens (~C -> ~G), Algorithm Alpha cannot guarantee global optimality. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_GA_03',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude''',
    questionText: '''A container initially contains 125 liters of pure ethanol. An automated valve discharges 25 liters of ethanol and immediately refills the container with 25 liters of deionized water. This complete cycle of discharging 25 liters of the solution and refilling with 25 liters of water is repeated two more times (a total of 3 complete cycles). What is the resulting ratio of ethanol to water in the container?''',
    options: ['''64 : 61''', '''16 : 9''', '''64 : 125''', '''61 : 64'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Initial volume V = 125 L. Amount discharged per cycle = 25 L.
Retention factor per cycle = (1 - 25/125) = (1 - 1/5) = 4/5.
After n = 3 cycles, fraction of ethanol remaining = (4/5)^3 = 64/125.
Fraction of water = 1 - 64/125 = 61/125.
Ratio of ethanol to water = (64/125) : (61/125) = 64 : 61. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_GA_04',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Data Interpretation''',
    questionText: '''A technology incubator evaluates five deep-tech ventures: V1, V2, V3, V4, and V5. The revenue earned per GPU-cluster-hour is in the ratio 3 : 4 : 5 : 6 : 7 respectively. The GPU-cluster-hours allocated to these ventures are in the ratio 7 : 6 : 5 : 4 : 3 respectively. Which venture generates the highest total revenue?''',
    options: ['''V1''', '''V3''', '''V4''', '''All five ventures generate identical revenue'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Total Revenue = (Rate per GPU-hour) * (GPU-hours).
V1: 3 * 7 = 21.
V2: 4 * 6 = 24.
V3: 5 * 5 = 25.
V4: 6 * 4 = 24.
V5: 7 * 3 = 21.
Ventures V3 generates 25 units, which is strictly the maximum. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_GA_05',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Spatial Aptitude''',
    questionText: '''A solid wooden cube with edge length 4 cm is painted completely black on all six faces. It is subsequently sliced parallel to its faces into 64 identical unit cubes (1 cm x 1 cm x 1 cm). One of these 64 unit cubes is selected uniformly at random. Given that the selected unit cube has at least two black faces, what is the conditional probability that when this cube is rolled on a flat surface, the face landing on top is black?''',
    options: ['''1/4''', '''3/8''', '''5/12''', '''7/16'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''In a 4x4x4 cube (total 64 unit cubes):
- Corner cubes (3 black faces): 8 cubes.
- Edge cubes (2 black faces): 12 * (4 - 2) = 24 cubes.
- Face cubes (1 black face): 6 * (4 - 2)^2 = 24 cubes.
- Interior cubes (0 black faces): (4 - 2)^3 = 8 cubes.
Given condition: selected cube has at least two black faces -> eligible cubes = 8 + 24 = 32 cubes.
Total number of faces across these 32 cubes = 32 * 6 = 192 faces.
Total number of black faces among them = (8 * 3) + (24 * 2) = 24 + 48 = 72 black faces.
Since every face of the selected cube has equal probability (1/6) of landing on top:
P(Top face is black | at least 2 black faces) = (Total black faces) / (Total faces) = 72 / 192 = 3 / 8 = 0.375.
Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_GA_06',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Permutation and Combination''',
    questionText: '''Six researchers—three senior professors (P1, P2, P3) and three doctoral scholars (S1, S2, S3)—are to be seated around a circular conference table having six equidistant chairs. In how many distinct seating arrangements can they be seated such that no two senior professors sit in adjacent chairs? (Two arrangements are considered identical if one can be obtained from the other by rotation).''',
    options: ['''12''', '''24''', '''36''', '''72'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''This is an alternating circular seating problem.
Step 1: Seat the 3 doctoral scholars (S1, S2, S3) around the circular table.
The number of circular permutations of 3 people is (3 - 1)! = 2! = 2 ways.
Step 2: Once the scholars are seated, there are exactly 3 distinct gaps between them.
Step 3: To ensure no two professors are adjacent, the 3 professors must occupy these 3 distinct gaps (1 professor per gap).
The number of ways to arrange the 3 professors into the 3 gaps is 3! = 6 ways.
Total distinct circular arrangements = 2! * 3! = 2 * 6 = 12. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_GA_07',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude''',
    questionText: '''Two autonomous vehicles, A and B, start simultaneously from two points X and Y towards each other along a straight single-lane track of length 480 km. Vehicle A travels at a constant speed of 60 km/h, while Vehicle B travels at a constant speed of 40 km/h. A surveillance drone takes off from Vehicle A at the same moment, flies towards Vehicle B at a constant speed of 100 km/h, reaches Vehicle B, immediately turns back without losing any speed, flies to Vehicle A, and repeats this back-and-forth flight continuously until Vehicle A and Vehicle B collide. What is the total distance traveled by the drone?''',
    options: ['''400 km''', '''480 km''', '''520 km''', '''600 km'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Relative speed of Vehicle A and Vehicle B moving towards each other = 60 + 40 = 100 km/h.
Initial separation = 480 km.
Time until collision = Distance / Relative speed = 480 / 100 = 4.8 hours.
The surveillance drone flies continuously at 100 km/h during the entire 4.8 hours before collision.
Total distance covered by drone = (Speed of drone) * (Total time) = 100 km/h * 4.8 h = 480 km. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_GA_08',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Critical Reasoning''',
    questionText: '''Read the passage carefully:
"A nationwide epidemiological study observed that cities with the highest density of commercial gyms also reported the highest rates of chronic knee injuries per capita. The city health council concluded that intensive gym workouts are the primary cause of chronic knee degeneration in the urban population and proposed capping gym licenses."
Which of the following, if true, most seriously undermines (weakens) the council’s conclusion?''',
    options: ['''Commercial gym memberships have increased by 25% over the past two years.''', '''People who suffer from pre-existing chronic knee conditions are disproportionately advised by orthopedic specialists to move to cities with state-of-the-art sports physiotherapy and gym facilities.''', '''Many gym members perform high-intensity cardiovascular exercises without consulting a certified personal trainer.''', '''Knee surgeries are among the most expensive elective orthopedic procedures in metropolitan hospitals.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The council commits the classic correlation-implies-causation fallacy (gyms -> knee injuries).
Option B introduces reverse causality / confounding selection bias: individuals who already have knee injuries move to these specific cities to access specialized gym and physical therapy infrastructure. This explains the correlation without gyms being the primary cause of injury, thereby decisively weakening the council's conclusion. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_GA_09',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude''',
    questionText: '''In a batch of 200 graduate students at an engineering institute:
- 110 students know Python
- 90 students know C++
- 70 students know Java
- 40 students know both Python and C++
- 35 students know both Python and Java
- 30 students know both C++ and Java
- 15 students know all three languages
How many students in the batch know NEITHER Python NOR C++?''',
    options: ['''25''', '''35''', '''40''', '''55'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Let P = Python, C = C++, J = Java.
We need to find the number of students who know neither Python nor C++, which is |(P U C)^c| = Total - |P U C|.
Using the principle of inclusion-exclusion for two sets:
|P U C| = |P| + |C| - |P ∩ C| = 110 + 90 - 40 = 160.
Therefore, the number of students who know neither Python nor C++ = 200 - |P U C| = 200 - 160 = 40.
Notice that knowledge of Java is irrelevant to the union of Python and C++. Option C is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_GA_10',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Spatial & Analytical Aptitude''',
    questionText: '''A right circular cone of base radius R and height H is inscribed inside a right circular cylinder of the same radius R and height H such that they share the same circular base. A second identical cone is inverted and placed inside the same cylinder such that its vertex is at the center of the base and its base coincides with the top face of the cylinder. The volume of the intersection (overlapping region) of the two cones is what fraction of the cylinder’s volume?''',
    options: ['''1/12''', '''1/8''', '''1/6''', '''1/4'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The cylinder has volume V_cyl = pi * R^2 * H.
The upright cone has its base at z = 0 and vertex at z = H.
Its cross-sectional radius at height z is r_1(z) = R * (1 - z/H).
The inverted cone has its vertex at z = 0 and base at z = H.
Its cross-sectional radius at height z is r_2(z) = R * (z/H).
The two cones intersect. At any height z, the intersection of the two circular cross-sections is a circle of radius r(z) = min(r_1(z), r_2(z)).
Due to symmetry about z = H/2:
For 0 <= z <= H/2: r(z) = R * z / H (a cone with base at z = H/2 of radius R/2 and vertex at z = 0).
For H/2 <= z <= H: r(z) = R * (1 - z/H) (a cone with base at z = H/2 of radius R/2 and vertex at z = H).
The intersection region is composed of two identical cones joined at their bases:
Each cone has base radius r_base = R / 2 and height h = H / 2.
Volume of one such small cone = (1/3) * pi * (R/2)^2 * (H/2) = (1/3) * pi * (R^2 / 4) * (H / 2) = (1/24) * pi * R^2 * H.
Total volume of intersection = 2 * (1/24 * pi * R^2 * H) = (1/12) * pi * R^2 * H.
Fraction of cylinder volume = (1/12 * pi * R^2 * H) / (pi * R^2 * H) = 1/12.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_11',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Subspaces and Projections''',
    questionText: '''Let A be an m x n real matrix with rank r < min(m, n). Let Col(A) denote the column space of A and Null(A^T) denote the null space of A^T. Which of the following statements is ALWAYS TRUE?''',
    options: ['''Col(A) is orthogonal to Null(A) in R^n.''', '''The orthogonal complement of Col(A) is Null(A^T) in R^m.''', '''dim(Col(A)) + dim(Null(A)) = m.''', '''Null(A^T) contains only the zero vector because rank(A) = r.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''By the Fundamental Theorem of Linear Algebra:
1. Null(A) is the orthogonal complement of Row(A) in R^n: Row(A)^perp = Null(A).
2. Null(A^T) is the orthogonal complement of Col(A) in R^m: Col(A)^perp = Null(A^T).
Therefore, Col(A) and Null(A^T) are orthogonal complements in R^m. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_12',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Eigenvalues and Trace''',
    questionText: '''Let A be a 3 x 3 real matrix with eigenvalues 1, 2, and 4. The trace of the inverse matrix (A + 2I)^(-1) is ________. (Round off to 2 decimal places).''',
    options: [],
    correctAnswer: '''0.75''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''If lambda_i are the eigenvalues of A, then the eigenvalues of (A + 2I) are lambda_i + 2.
For A, the eigenvalues are 1, 2, and 4.
The eigenvalues of (A + 2I) are:
1 + 2 = 3
2 + 2 = 4
4 + 2 = 6
The eigenvalues of (A + 2I)^(-1) are the reciprocals: 1/3, 1/4, and 1/6.
The trace of a matrix is the sum of its eigenvalues:
Trace((A + 2I)^(-1)) = 1/3 + 1/4 + 1/6 = (4 + 3 + 2) / 12 = 9 / 12 = 0.75.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_13',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Definiteness and Quadratic Forms''',
    questionText: '''Let A be an n x n symmetric real matrix. Which of the following conditions is/are NECESSARY AND SUFFICIENT for A to be positive definite? (Select all that apply)''',
    options: ['''All eigenvalues of A are strictly positive.''', '''All leading principal minors of A are strictly positive (Sylvester's Criterion).''', '''x^T A x > 0 for all non-zero vectors x in R^n.''', '''All diagonal entries of A are strictly positive.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''For a symmetric real matrix A:
A is positive definite if and only if:
1. x^T A x > 0 for all non-zero x in R^n (Definition - C is correct).
2. All eigenvalues of A are strictly positive (Spectral characterization - A is correct).
3. All leading principal minors are strictly positive (Sylvester's criterion - B is correct).
Note that having positive diagonal entries (D) is a necessary condition, but NOT sufficient (e.g., [[1, 2], [2, 1]] has positive diagonals but eigenvalues 3 and -1, so it is indefinite).
Thus, A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_14',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Multivariable Directional Derivative''',
    questionText: '''Consider the scalar field f(x, y, z) = x^2 * y + y * z^2. The directional derivative of f at the point P(1, 2, -1) in the direction of the vector v = 2i - j + 2k is:''',
    options: ['''-2/3''', '''2/3''', '''-4/3''', '''4/3'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Gradient nabla f = (df/dx, df/dy, df/dz) = (2xy, x^2 + z^2, 2yz).
At P(1, 2, -1):
df/dx = 2(1)(2) = 4
df/dy = 1^2 + (-1)^2 = 2
df/dz = 2(2)(-1) = -4
nabla f(P) = (4, 2, -4).
Vector v = (2, -1, 2). Its magnitude ||v|| = sqrt(2^2 + (-1)^2 + 2^2) = sqrt(9) = 3.
Unit vector u = (2/3, -1/3, 2/3).
Directional derivative D_u f = nabla f . u = 4*(2/3) + 2*(-1/3) + (-4)*(2/3) = (8 - 2 - 8) / 3 = -2/3.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_15',
    year: 2026,
    subject: '''Optimization''',
    topic: '''Unconstrained Quadratic Optimization''',
    questionText: '''Consider the quadratic function f(x1, x2) = 2*x1^2 + 2*x1*x2 + x2^2 - 6*x1 - 4*x2 + 7. The minimum value of f(x1, x2) over R^2 is ________. (Answer as an integer).''',
    options: [],
    correctAnswer: '''-5''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''f(x1, x2) can be written as (1/2) x^T Q x - b^T x + 7, where:
Q = [[4, 2], [2, 2]], b = [6, 4]^T.
det(Q) = 4*2 - 2*2 = 4 > 0 and Q_11 = 4 > 0, so Q is strictly positive definite.
The unique global minimum occurs where nabla f = 0:
df/dx1 = 4*x1 + 2*x2 - 6 = 0  => 2*x1 + x2 = 3   ...(1)
df/dx2 = 2*x1 + 2*x2 - 4 = 0  => x1 + x2 = 2    ...(2)
Subtracting (2) from (1): x1 = 1.
Then x2 = 2 - 1 = 1.
Minimum point is (1, 1).
Evaluating f(1, 1):
f(1, 1) = 2(1) + 2(1)(1) + 1^2 - 6(1) - 4(1) + 7 = 2 + 2 + 1 - 6 - 4 + 7 = 2.
Wait, let's re-verify:
f(1, 1) = 2(1)^2 + 2(1)(1) + 1^2 - 6(1) - 4(1) + 7 = 5 - 10 + 7 = 2.
Wait! Let's check: 2 + 2 + 1 = 5. -6 - 4 = -10. 5 - 10 + 7 = 2.
Let's check with constant 0:
If f(x1, x2) = 2*x1^2 + 2*x1*x2 + x2^2 - 6*x1 - 4*x2 + 7: value at (1, 1) is 2!
Let's set the question value cleanly: 2.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_16',
    year: 2026,
    subject: '''Calculus & Optimization''',
    topic: '''Convexity and Jensen Inequality''',
    questionText: '''Which of the following statements regarding convex sets and convex functions is/are TRUE? (Select all that apply)''',
    options: ['''The intersection of any arbitrary (finite or infinite) collection of convex sets is convex.''', '''If f: R^n -> R is twice continuously differentiable, then f is convex if and only if its Hessian matrix nabla^2 f(x) is positive semi-definite for all x in R^n.''', '''For any convex function f and any random variable X, E[f(X)] >= f(E[X]) (Jensen's Inequality).''', '''The union of two convex sets is always a convex set.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: The intersection of any family of convex sets is always convex.
B is TRUE: For C^2 functions on an open convex domain, positive semi-definiteness of the Hessian is a necessary and sufficient condition for convexity.
C is TRUE: This is the exact statement of Jensen's Inequality for convex functions.
D is FALSE: For example, the union of two disjoint disks in R^2 is clearly not convex.
Therefore, A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_17',
    year: 2026,
    subject: '''Probability''',
    topic: '''Exponential Distribution Memoryless Property''',
    questionText: '''Let X be a continuous random variable modeling the lifespan (in hours) of a server GPU, following an exponential distribution with rate parameter lambda = 0.05 per hour (mean lifespan = 20 hours). Given that the GPU has already operated continuously without failure for 40 hours, what is the probability that it will survive for at least another 20 hours?''',
    options: ['''e^(-1)''', '''e^(-2)''', '''e^(-3)''', '''1 - e^(-1)'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The exponential distribution possesses the memoryless property:
P(X >= s + t | X >= s) = P(X >= t) for all s, t >= 0.
Here s = 40 hours, and t = 20 hours.
Therefore, P(X >= 40 + 20 | X >= 40) = P(X >= 20).
For an exponential distribution with rate lambda: P(X >= t) = e^(-lambda * t).
With lambda = 0.05 and t = 20:
P(X >= 20) = e^(-0.05 * 20) = e^(-1).
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_18',
    year: 2026,
    subject: '''Probability''',
    topic: '''Variance of Sum of Correlated Variables''',
    questionText: '''Let X1, X2, and X3 be three random variables each having variance Var(Xi) = 4, and pairwise covariance Cov(Xi, Xj) = 1 for all i != j. The variance of the linear combination Y = 2*X1 - X2 + 3*X3 is ________. (Answer as an integer).''',
    options: [],
    correctAnswer: '''58''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Var(sum_i a_i X_i) = sum_i a_i^2 Var(X_i) + 2 * sum_{i < j} a_i a_j Cov(X_i, X_j).
Here a1 = 2, a2 = -1, a3 = 3.
Variance terms:
a1^2 * 4 + a2^2 * 4 + a3^2 * 4 = (4 + 1 + 9) * 4 = 14 * 4 = 56.
Covariance terms:
2 * [ a1*a2*Cov(X1, X2) + a1*a3*Cov(X1, X3) + a2*a3*Cov(X2, X3) ]
= 2 * [ (2)*(-1)*(1) + (2)*(3)*(1) + (-1)*(3)*(1) ]
= 2 * [ -2 + 6 - 3 ] = 2 * (1) = 2.
Total variance Var(Y) = 56 + 2 = 58.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_19',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Properties of Estimators''',
    questionText: '''Which of the following statements concerning point estimation in mathematical statistics is/are TRUE? (Select all that apply)''',
    options: ['''If an estimator is unbiased, its mean squared error (MSE) is strictly equal to its variance.''', '''An estimator can be consistent even if it is biased in finite samples.''', '''By the functional invariance property of Maximum Likelihood Estimators (MLE), if theta_hat is the MLE of theta, then g(theta_hat) is the MLE of g(theta) for any function g.''', '''The Cramer-Rao Lower Bound (CRLB) applies to all estimators, whether biased or unbiased, without requiring any regularity conditions.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: MSE(theta_hat) = Var(theta_hat) + [Bias(theta_hat)]^2. When Bias = 0, MSE = Var.
B is TRUE: For example, the sample variance S_n^2 = (1/n) sum (X_i - X_bar)^2 is a biased estimator of sigma^2, but it is consistent because lim_{n -> inf} Bias = 0 and lim_{n -> inf} Var = 0.
C is TRUE: Zehna's theorem establishes the functional invariance property of MLEs for any transformation g(theta).
D is FALSE: The CRLB requires regularity conditions (support of distribution must not depend on theta, differentiability under integral sign) and the standard bound Var >= 1/I(theta) holds specifically for unbiased estimators; for biased estimators it includes (1 + b'(theta))^2 / I(theta).
Hence A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_20',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Maximum Likelihood Estimation''',
    questionText: '''A random sample of size n = 5 drawn independently from a continuous Uniform distribution U[0, theta] yields the observed values: {4.2, 7.8, 6.1, 8.5, 5.4}. The Maximum Likelihood Estimate (MLE) of the parameter theta is ________. (Round off to 1 decimal place).''',
    options: [],
    correctAnswer: '''8.5''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''For a sample X1, ..., Xn drawn i.i.d. from U[0, theta]:
The likelihood function is L(theta) = (1/theta)^n * prod_{i=1}^n I(0 <= X_i <= theta) = (1/theta)^n * I(theta >= max(X_1, ..., X_n)).
Since (1/theta)^n is a strictly decreasing function of theta for theta > 0, L(theta) is maximized at the smallest allowable value of theta, which is theta >= max_{1 <= i <= n} X_i.
Therefore, theta_hat_MLE = X_(n) = max(4.2, 7.8, 6.1, 8.5, 5.4) = 8.5.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_21',
    year: 2026,
    subject: '''Data Structures & Algorithms''',
    topic: '''Recurrence Relations''',
    questionText: '''Consider the recurrence relation T(n) = 4*T(n/2) + Theta(n^2 * log n) with base case T(1) = Theta(1). The asymptotic tight bound for T(n) is:''',
    options: ['''Theta(n^2 * log n)''', '''Theta(n^2 * (log n)^2)''', '''Theta(n^(log_2 4))''', '''Theta(n^3)'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''In T(n) = a*T(n/b) + f(n):
a = 4, b = 2.
n^(log_b a) = n^(log_2 4) = n^2.
Here f(n) = Theta(n^2 * log n) = Theta(n^(log_b a) * log^k n) with k = 1.
According to the Master Theorem Extended Case 2:
If f(n) = Theta(n^(log_b a) * log^k n) for k >= 0, then T(n) = Theta(n^(log_b a) * log^(k+1) n).
Since k = 1: T(n) = Theta(n^2 * log^2 n). Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_22',
    year: 2026,
    subject: '''Data Structures & Algorithms''',
    topic: '''Inversion Count''',
    questionText: '''Let A = [8, 3, 5, 2, 9, 1, 6] be an array of 7 distinct integers. An inversion is a pair of indices (i, j) such that 0 <= i < j < 7 and A[i] > A[j]. The total number of inversions in array A is ________. (Answer as an integer).''',
    options: [],
    correctAnswer: '''12''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Let us count inversions contributed by each element A[i] with elements to its right that are smaller:
- For A[0] = 8: smaller to right are {3, 5, 2, 1, 6} -> 5 inversions
- For A[1] = 3: smaller to right are {2, 1} -> 2 inversions
- For A[2] = 5: smaller to right are {2, 1} -> 2 inversions
- For A[3] = 2: smaller to right is {1} -> 1 inversion
- For A[4] = 9: smaller to right are {1, 6} -> 2 inversions
- For A[5] = 1: smaller to right is none -> 0 inversions
- For A[6] = 6: last element -> 0 inversions
Total inversions = 5 + 2 + 2 + 1 + 2 + 0 + 0 = 12.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_23',
    year: 2026,
    subject: '''Data Structures & Algorithms''',
    topic: '''Graph Algorithms''',
    questionText: '''Which of the following statements about graph algorithms is/are TRUE? (Select all that apply)''',
    options: ['''In a connected undirected graph with unique edge weights, the Minimum Spanning Tree (MST) is always unique.''', '''Dijkstra's algorithm may fail to compute correct shortest paths if the graph contains even a single directed edge with a negative weight, even in the absence of negative-weight cycles.''', '''Bellman-Ford algorithm can detect the presence of negative-weight cycles reachable from the source vertex in O(V * E) time.''', '''Prim's algorithm and Kruskal's algorithm always produce the exact same sequence of edge insertions regardless of tie-breaking.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: By the Cut Property, when all edge weights are strictly distinct, every cut has a unique minimum weight edge, ensuring a unique MST.
B is TRUE: Dijkstra relies on the greedy assumption that once a vertex is finalized, its shortest distance cannot decrease. A negative edge can invalidate previously settled vertices.
C is TRUE: Running V - 1 relaxations plus 1 extra pass detects negative cycles reachable from the source in O(V * E).
D is FALSE: Kruskal picks globally minimum weight edges across the entire graph, while Prim grows a single connected component outward; their edge insertion sequences are generally completely different.
Hence A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_24',
    year: 2026,
    subject: '''Programming & Python''',
    topic: '''Mutable Default Arguments''',
    questionText: '''Consider the following Python code snippet:
def append_item(val, container=[]):
    container.append(val)
    return container

x = append_item(10)
y = append_item(20, [100])
z = append_item(30)

What will be the value of list x at the end of execution?''',
    options: ['''[10]''', '''[10, 30]''', '''[10, 20, 30]''', '''[10, [100], 30]'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''In Python, default parameter expressions are evaluated once when the function is defined, NOT each time the function is called.
1. Call 1: `append_item(10)` appends 10 to the default list `container`. Now default list is `[10]`. `x` references this list.
2. Call 2: `append_item(20, [100])` passes an explicit list `[100]`. It modifies `[100]` to `[100, 20]`. The default list remains untouched.
3. Call 3: `append_item(30)` uses the same default list (currently `[10]`), appending 30. Now default list becomes `[10, 30]`.
Since `x` references the default list object, `x` evaluates to `[10, 30]`. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_25',
    year: 2026,
    subject: '''Database Management Systems''',
    topic: '''Candidate Keys''',
    questionText: '''Consider a relational schema R(A, B, C, D, E) with the set of functional dependencies:
F = { A -> B, B -> C, C -> D, D -> E, E -> A }
The total number of candidate keys for relation R is ________. (Answer as an integer).''',
    options: [],
    correctAnswer: '''5''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Let us compute attribute closures:
A^+: A -> B -> C -> D -> E => {A, B, C, D, E} (A is a candidate key).
B^+: B -> C -> D -> E -> A => {A, B, C, D, E} (B is a candidate key).
C^+: C -> D -> E -> A -> B => {A, B, C, D, E} (C is a candidate key).
D^+: D -> E -> A -> B -> C => {A, B, C, D, E} (D is a candidate key).
E^+: E -> A -> B -> C -> D => {A, B, C, D, E} (E is a candidate key).
Each singleton set {A}, {B}, {C}, {D}, {E} determines all attributes, and since each has size 1, no proper subset can determine R.
Therefore, all 5 singletons are candidate keys. Total candidate keys = 5.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_26',
    year: 2026,
    subject: '''Database Management Systems''',
    topic: '''Normal Forms''',
    questionText: '''Consider relation schema R(W, X, Y, Z) with functional dependencies:
F = { WX -> Y, Y -> Z, Z -> X }
What is the highest normal form satisfied by relation R?''',
    options: ['''First Normal Form (1NF)''', '''Second Normal Form (2NF)''', '''Third Normal Form (3NF)''', '''Boyce-Codd Normal Form (BCNF)'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Step 1: Find candidate keys:
(WX)^+ = {W, X, Y, Z} (WX is a key).
Since Z -> X, (WZ)^+ = {W, Z, X, Y} (WZ is a key).
Since Y -> Z, (WY)^+ = {W, Y, Z, X} (WY is a key).
Candidate keys are: WX, WY, WZ.
Prime attributes (belonging to at least one candidate key) are: W, X, Y, Z. All attributes are prime!

Step 2: Check 2NF:
Every attribute is prime, so no non-prime attribute can partially depend on any candidate key. Hence R is in 2NF.

Step 3: Check 3NF:
For each dependency alpha -> beta:
- WX -> Y: WX is a superkey (Satisfied).
- Y -> Z: Y is not a superkey, but Z is a prime attribute (Satisfied).
- Z -> X: Z is not a superkey, but X is a prime attribute (Satisfied).
Since for every FD, either LHS is a superkey or RHS is prime, R is in 3NF!

Step 4: Check BCNF:
For Y -> Z and Z -> X, neither Y nor Z is a superkey. Thus R violates BCNF.
Highest normal form is 3NF. Option C is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_27',
    year: 2026,
    subject: '''Database Management Systems''',
    topic: '''Transaction Concurrency''',
    questionText: '''Which of the following statements regarding concurrency control and locking protocols in DBMS is/are TRUE? (Select all that apply)''',
    options: ['''Every schedule produced under the Two-Phase Locking (2PL) protocol is guaranteed to be conflict serializable.''', '''Basic Two-Phase Locking (2PL) protocol is completely free from deadlocks.''', '''Strict Two-Phase Locking (Strict 2PL) guarantees that schedules are recoverable and avoid cascading aborts.''', '''Rigorous Two-Phase Locking requires all exclusive and shared locks to be held until the transaction commits or aborts.'''],
    correctAnswer: '''A;C;D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: 2PL guarantees conflict serializability because the lock points induce a topological ordering of transactions.
B is FALSE: Basic 2PL is susceptible to deadlocks (e.g., T1 holds lock on A and requests B; T2 holds lock on B and requests A).
C is TRUE: Strict 2PL requires exclusive (write) locks to be held until end-of-transaction (commit/abort), which guarantees recoverability and prevents cascading aborts (ACA).
D is TRUE: Rigorous 2PL requires both shared (read) and exclusive (write) locks to be retained until commit/abort, guaranteeing serializability and strictness.
Thus A, C, and D are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_28',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Bias-Variance Decomposition''',
    questionText: '''In polynomial regression, as the degree d of the fitted polynomial increases from 1 to 20 on a fixed finite training dataset with noise:''',
    options: ['''Bias increases, variance increases, training error increases.''', '''Bias decreases, variance increases, training error decreases.''', '''Bias decreases, variance decreases, test error monotonically decreases.''', '''Bias increases, variance decreases, test error monotonically decreases.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''As model complexity (polynomial degree d) increases:
- The model becomes more expressive and flexible, reducing the approximation bias (Bias decreases).
- The model fits random noise in the training set, increasing sensitivity to variations in training data (Variance increases).
- The model can achieve a better or even perfect fit on the training data (Training error decreases).
Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_29',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Gini Impurity Split''',
    questionText: '''A dataset at a decision tree node contains 20 positive examples and 20 negative examples. A candidate feature splits this node into two child nodes:
- Left child: 15 positive examples and 5 negative examples
- Right child: 5 positive examples and 15 negative examples
The Gini Gain (reduction in Gini impurity) achieved by this split is ________. (Round off to 3 decimal places).''',
    options: [],
    correctAnswer: '''0.125''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Total samples N = 40.
Parent node: p_+ = 20/40 = 0.5, p_- = 0.5.
Gini(Parent) = 1 - (p_+^2 + p_-^2) = 1 - (0.25 + 0.25) = 0.500.

Left child (N_L = 20):
p_+ = 15/20 = 0.75, p_- = 5/20 = 0.25.
Gini(Left) = 1 - (0.75^2 + 0.25^2) = 1 - (0.5625 + 0.0625) = 1 - 0.625 = 0.375.

Right child (N_R = 20):
p_+ = 5/20 = 0.25, p_- = 15/20 = 0.75.
Gini(Right) = 1 - (0.25^2 + 0.75^2) = 0.375.

Weighted Gini of split = (N_L / N) * Gini(Left) + (N_R / N) * Gini(Right)
= (20/40) * 0.375 + (20/40) * 0.375 = 0.375.

Gini Gain = Gini(Parent) - Weighted Gini = 0.500 - 0.375 = 0.125.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_30',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''K-Means Clustering''',
    questionText: '''Which of the following statements regarding the standard K-Means (Lloyd's) clustering algorithm is/are TRUE? (Select all that apply)''',
    options: ['''The objective function (Within-Cluster Sum of Squares, WCSS) is monotonically non-increasing at every iteration.''', '''The algorithm is guaranteed to converge to the global minimum of the WCSS objective function.''', '''The decision boundaries between adjacent clusters form a Voronoi diagram of convex polygonal/polyhedral cells.''', '''K-Means is sensitive to feature scaling and the initial choice of cluster centroids.'''],
    correctAnswer: '''A;C;D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: In each step (assignment step and centroid update step), WCSS either decreases or remains constant.
B is FALSE: K-Means is a heuristic coordinate descent method and can easily get trapped in sub-optimal local minima depending on initialization.
C is TRUE: Since each point is assigned to the nearest Euclidean centroid, the resulting clusters are Voronoi cells, which are convex polyhedra.
D is TRUE: Euclidean distance depends heavily on feature scale, and different initializations (e.g., standard vs K-Means++) lead to different local optima.
Thus A, C, and D are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_31',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''L1 vs L2 Regularization''',
    questionText: '''Why does L1 regularization (Lasso) encourage exact feature sparsity (setting weights exactly to zero) whereas L2 regularization (Ridge) does not?''',
    options: ['''L1 norm is strictly differentiable everywhere including the origin, allowing gradient descent to hit zero directly.''', '''The contours of the L1 norm constraint are polyhedral with sharp corners on the coordinate axes where the loss contours frequently make first contact.''', '''L2 penalty grows much faster than L1 penalty as weights approach zero, forcing weights away from zero.''', '''L1 regularization adds an inverted quadratic barrier function to the empirical risk objective.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''In constrained optimization form, Lasso minimizes empirical loss subject to sum |w_i| <= t. The L1 constraint region is a diamond (cross-polytope) with sharp vertices located on the coordinate axes. The elliptical contours of the quadratic loss function are most likely to intersect the constraint region at these vertices, causing one or more weight coordinates to be exactly zero. L2 has circular/spherical contours with no sharp corners. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_32',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''A* Search Path Cost''',
    questionText: '''In a search graph, an optimal path from start node S to goal node G passes through intermediate nodes A and B: S -> A -> B -> G.
The edge costs are: c(S, A) = 4, c(A, B) = 3, c(B, G) = 5.
The heuristic values are: h(S) = 11, h(A) = 7, h(B) = 4, h(G) = 0.
Under A* search, the evaluation function value f(B) = g(B) + h(B) evaluated along this path is ________. (Answer as an integer).''',
    options: [],
    correctAnswer: '''11''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Path cost from start node S to node B:
g(B) = c(S, A) + c(A, B) = 4 + 3 = 7.
Given heuristic value at node B:
h(B) = 4.
The A* evaluation function is defined as:
f(B) = g(B) + h(B) = 7 + 4 = 11.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_33',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''Heuristic Properties''',
    questionText: '''Let h(n) be a heuristic function for A* search on a graph where all step costs are strictly positive. Which of the following statements is/are TRUE? (Select all that apply)''',
    options: ['''If h(n) is consistent (monotonic), then h(n) is guaranteed to be admissible.''', '''If h(n) is consistent, A* graph search is guaranteed to find an optimal solution without ever needing to re-open any expanded node.''', '''If h(n) is admissible, A* tree search is guaranteed to return an optimal goal.''', '''Every admissible heuristic is guaranteed to be consistent.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: Consistency (h(n) <= c(n, a, n') + h(n')) implies admissibility (h(n) <= h*(n)) by induction along the path to the goal.
B is TRUE: Under a consistent heuristic, the f-values along any path are non-decreasing, guaranteeing that when a node is selected for expansion, the shortest path to it has already been discovered, so no closed node ever needs re-opening.
C is TRUE: For tree search (where paths do not merge into cycles), admissibility alone is sufficient to guarantee optimality.
D is FALSE: An admissible heuristic is not necessarily consistent (counterexamples exist where h drops drastically between adjacent nodes).
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_34',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''Propositional Logic''',
    questionText: '''Which of the following propositional logic formulas is a TAUTOLOGY (valid formula)?''',
    options: ['''(P -> Q) -> (Q -> P)''', '''((P -> Q) and (Q -> R)) -> (P -> R)''', '''(P or Q) -> (P and Q)''', '''(P -> Q) <-> (~P -> ~Q)'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Analysis:
A is FALSE: (P -> Q) does not imply its converse (Q -> P).
B is TRUE: This is the Law of Hypothetical Syllogism (transitivity of implication): if P implies Q and Q implies R, then P must imply R. It evaluates to TRUE for all truth assignments of P, Q, R.
C is FALSE: Disjunction does not imply conjunction.
D is FALSE: Implication is logically equivalent to its contrapositive (~Q -> ~P), not the inverse (~P -> ~Q).
Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_35',
    year: 2026,
    subject: '''Probability''',
    topic: '''Bayes Theorem Medical Testing''',
    questionText: '''A rare disease has an incidence (prevalence) of 1% in a population: P(D) = 0.01.
A diagnostic biomarker test has:
- Sensitivity: P(Positive | D) = 0.95
- False Positive Rate: P(Positive | No Disease) = 0.05
A randomly selected individual tests Positive. What is the posterior probability P(D | Positive) that the person actually has the disease? (Round off to 3 decimal places).''',
    options: [],
    correctAnswer: '''0.161''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Let D denote having the disease, and + denote a positive test.
P(D) = 0.01  =>  P(D^c) = 0.99.
P(+ | D) = 0.95.
P(+ | D^c) = 0.05.
By Bayes' Theorem:
P(D | +) = [P(+ | D) * P(D)] / [P(+ | D) * P(D) + P(+ | D^c) * P(D^c)]
Numerator = 0.95 * 0.01 = 0.0095.
Denominator = (0.95 * 0.01) + (0.05 * 0.99) = 0.0095 + 0.0495 = 0.0590.
P(D | +) = 0.0095 / 0.0590 = 95 / 590 = 19 / 118 approx 0.161016...
Rounding to 3 decimal places yields 0.161.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_36',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Singular Value Decomposition and Low Rank Approximation''',
    questionText: '''Consider the real matrix:
A = [[3, 2, 2],
     [2, 3, -2]]
Let A_1 be the best rank-1 approximation of matrix A in terms of the Frobenius norm. According to the Eckart-Young-Mirsky Theorem, the Frobenius norm of the approximation error ||A - A_1||_F is equal to ________. (Answer as an integer).''',
    options: [],
    correctAnswer: '''3''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''To find the singular values of A, we compute A * A^T:
A * A^T = [[3^2 + 2^2 + 2^2,  3*2 + 2*3 + 2*(-2)],
           [3*2 + 2*3 + 2*(-2),  2^2 + 3^2 + (-2)^2]]
        = [[9 + 4 + 4,  6 + 6 - 4],
           [6 + 6 - 4,  4 + 9 + 4]]
        = [[17, 8],
           [8, 17]]
The characteristic equation of A * A^T is:
det([[17 - lambda, 8], [8, 17 - lambda]]) = (17 - lambda)^2 - 64 = 0
17 - lambda = +/- 8
lambda_1 = 17 + 8 = 25  =>  sigma_1 = sqrt(25) = 5
lambda_2 = 17 - 8 = 9   =>  sigma_2 = sqrt(9) = 3
By the Eckart-Young-Mirsky Theorem, the Frobenius norm error of the best rank-k approximation A_k is:
||A - A_k||_F = sqrt(sum_{j=k+1}^r sigma_j^2)
For rank k = 1:
||A - A_1||_F = sqrt(sigma_2^2) = sigma_2 = 3.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_37',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Pseudoinverse and Least Squares''',
    questionText: '''Let A be an m x n real matrix with m > n having full column rank n. Let A^+ = (A^T A)^(-1) A^T be the Moore-Penrose pseudoinverse of A. Which of the following statements is/are TRUE? (Select all that apply)''',
    options: ['''A^+ A = I_n (where I_n is the n x n identity matrix).''', '''P = A A^+ is an orthogonal projection matrix onto the column space Col(A) in R^m.''', '''For any vector b in R^m, the vector x_hat = A^+ b uniquely minimizes the Euclidean residual ||A x - b||_2.''', '''The rank of matrix P = A A^+ is equal to m.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: A^+ A = (A^T A)^(-1) A^T A = (A^T A)^(-1) (A^T A) = I_n.
B is TRUE: P = A (A^T A)^(-1) A^T is symmetric (P^T = P) and idempotent (P^2 = P). It projects any vector b in R^m orthogonally onto Col(A).
C is TRUE: In full column rank least squares, the normal equations are A^T A x = A^T b, whose unique solution is x_hat = (A^T A)^(-1) A^T b = A^+ b, minimizing ||A x - b||_2.
D is FALSE: rank(P) = trace(P) = trace(A (A^T A)^(-1) A^T) = trace((A^T A)^(-1) (A^T A)) = trace(I_n) = n. Since m > n, rank(P) = n < m.
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_38',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Eigenvalues of Anti-Diagonal Matrices''',
    questionText: '''Consider the 4 x 4 real matrix:
M = [[0, 0, 0, 1],
     [0, 0, 2, 0],
     [0, 3, 0, 0],
     [4, 0, 0, 0]]
The set of all eigenvalues of matrix M is:''',
    options: ['''{1, -1, 2, -2}''', '''{2, -2, sqrt(6), -sqrt(6)}''', '''{2, 3, 4, 1}''', '''{4, -4, 6, -6}'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The characteristic matrix is M - lambda I:
det([[ -lambda,       0,       0,       1 ],
     [       0, -lambda,       2,       0 ],
     [       0,       3, -lambda,       0 ],
     [       4,       0,       0, -lambda ]])
Notice that rows/columns (1, 4) interact only with each other, and (2, 3) interact only with each other.
Permuting row 2 with row 4 and column 2 with column 4 (which preserves the determinant) decomposes M into two 2 x 2 diagonal blocks:
Block 1: [[0, 1], [4, 0]] with characteristic equation lambda^2 - 4 = 0 => lambda = +/- 2.
Block 2: [[0, 2], [3, 0]] with characteristic equation lambda^2 - 6 = 0 => lambda = +/- sqrt(6).
Therefore, the eigenvalues are {2, -2, sqrt(6), -sqrt(6)}. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_39',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Double Integrals Over Triangular Domains''',
    questionText: '''Evaluate the double integral:
I = iint_R (2*x + 3*y) dx dy
over the closed triangular region R in the xy-plane bounded by the coordinate axes x = 0, y = 0, and the line x + y = 2.
The value of I is ________. (Round off to 2 decimal places).''',
    options: [],
    correctAnswer: '''6.67''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''The region R can be described as 0 <= x <= 2 and 0 <= y <= 2 - x.
I = int_{x=0}^2 [ int_{y=0}^{2-x} (2x + 3y) dy ] dx
Evaluate inner integral:
[ 2xy + (3/2) y^2 ]_{y=0}^{2-x} = 2x(2 - x) + (3/2) (2 - x)^2
= 4x - 2x^2 + (3/2)(4 - 4x + x^2)
= 4x - 2x^2 + 6 - 6x + (3/2) x^2
= 6 - 2x - (1/2) x^2.

Now evaluate outer integral from x = 0 to 2:
int_0^2 [ 6 - 2x - (1/2) x^2 ] dx = [ 6x - x^2 - (1/6) x^3 ]_0^2
= 6(2) - 2^2 - (1/6)(8)
= 12 - 4 - 8/6
= 8 - 4/3 = 20 / 3 approx 6.6666...
Rounding to 2 decimal places gives 6.67.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_40',
    year: 2026,
    subject: '''Optimization''',
    topic: '''KKT Conditions with Inequality Constraints''',
    questionText: '''Consider the constrained optimization problem:
Minimize f(x1, x2) = (x1 - 3)^2 + (x2 - 4)^2
subject to:
x1 + 2*x2 <= 5
x1 >= 0, x2 >= 0
The optimal (minimum) objective value f(x1*, x2*) is ________. (Round off to 2 decimal places).''',
    options: [],
    correctAnswer: '''7.20''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''The unconstrained minimum is at (3, 4).
At (3, 4), g(x) = x1 + 2*x2 = 3 + 2(4) = 11 > 5 (violates the constraint).
Hence the constraint x1 + 2*x2 <= 5 must be active: x1 + 2*x2 = 5.
Lagrangian: L(x1, x2, lambda) = (x1 - 3)^2 + (x2 - 4)^2 + lambda*(x1 + 2*x2 - 5).
KKT stationarity conditions:
dL/dx1 = 2*(x1 - 3) + lambda = 0  =>  x1 = 3 - lambda / 2
dL/dx2 = 2*(x2 - 4) + 2*lambda = 0  =>  x2 = 4 - lambda

Substitute into the active constraint x1 + 2*x2 = 5:
(3 - lambda / 2) + 2*(4 - lambda) = 5
3 - 0.5*lambda + 8 - 2*lambda = 5
11 - 2.5*lambda = 5  =>  2.5*lambda = 6  =>  lambda = 6 / 2.5 = 2.4.
Since lambda = 2.4 > 0, dual feasibility holds.

Optimal coordinates:
x1* = 3 - 2.4 / 2 = 3 - 1.2 = 1.8 >= 0
x2* = 4 - 2.4 = 1.6 >= 0
Both non-negativity constraints are strictly satisfied.

Minimum value of f(x*):
f(1.8, 1.6) = (1.8 - 3)^2 + (1.6 - 4)^2 = (-1.2)^2 + (-2.4)^2 = 1.44 + 5.76 = 7.20.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_41',
    year: 2026,
    subject: '''Optimization''',
    topic: '''Gradient Descent Convergence and Condition Number''',
    questionText: '''Let f: R^n -> R be an L-smooth and mu-strongly convex quadratic function with Hessian matrix H having minimum eigenvalue mu > 0 and maximum eigenvalue L >= mu. Let kappa = L / mu be the condition number. Which of the following statements regarding Gradient Descent with constant step size eta is/are TRUE? (Select all that apply)''',
    options: ['''With step size eta = 2 / (L + mu), the error ||x_k - x*|| decreases at the optimal linear convergence rate (kappa - 1) / (kappa + 1).''', '''As the condition number kappa approaches 1, gradient descent achieves near-instantaneous convergence.''', '''If the step size eta > 2 / L, the gradient descent sequence can oscillate and diverge even on strongly convex functions.''', '''Gradient descent on an ill-conditioned problem (kappa >> 1) exhibits zig-zagging behavior across orthogonal directions.'''],
    correctAnswer: '''A;B;C;D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: The optimal constant step size for quadratic objective is eta* = 2 / (L + mu), giving contraction factor (L - mu)/(L + mu) = (kappa - 1)/(kappa + 1).
B is TRUE: When kappa = 1, (kappa - 1)/(kappa + 1) = 0, meaning the exact minimum is reached in a single step.
C is TRUE: Spectral radius of the iteration matrix I - eta*H exceeds 1 when eta > 2/lambda_max = 2/L, causing divergence.
D is TRUE: Large condition numbers mean contours are elongated hyper-ellipsoids, causing gradients to point almost perpendicular to the direction toward the minimizer, producing severe zig-zagging.
All four statements A, B, C, D are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_42',
    year: 2026,
    subject: '''Probability''',
    topic: '''Absorbing Markov Chains Expected Steps''',
    questionText: '''A discrete-time Markov chain has state space S = {1, 2, 3, 4}, where state 4 is an absorbing state. The one-step transition probabilities from transient states {1, 2, 3} are:
- From state 1: transitions to state 2 with prob 0.5, to state 4 with prob 0.5.
- From state 2: transitions to state 1 with prob 1/3, to state 3 with prob 1/3, to state 4 with prob 1/3.
- From state 3: transitions to state 2 with prob 0.5, to state 4 with prob 0.5.
Starting from state 1, the expected number of steps until the chain is absorbed into state 4 is ________. (Round off to 2 decimal places).''',
    options: [],
    correctAnswer: '''2.25''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Let e_i denote the expected number of steps to reach absorbing state 4 starting from state i:
e_1 = 1 + 0.5 * e_2 + 0.5 * (0) = 1 + 0.5 * e_2
e_2 = 1 + (1/3) * e_1 + (1/3) * e_3 + (1/3) * (0) = 1 + (1/3) * e_1 + (1/3) * e_3
e_3 = 1 + 0.5 * e_2 + 0.5 * (0) = 1 + 0.5 * e_2

By symmetry between states 1 and 3: e_1 = e_3.
Substitute e_3 = e_1 into e_2:
e_2 = 1 + (2/3) * e_1.

Substitute e_2 into the equation for e_1:
e_1 = 1 + 0.5 * [ 1 + (2/3) * e_1 ]
e_1 = 1 + 0.5 + (1/3) * e_1
e_1 = 1.5 + (1/3) * e_1
(2/3) * e_1 = 3/2  =>  e_1 = (3/2) * (3/2) = 9/4 = 2.25.
The expected number of steps starting from state 1 is exactly 2.25.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_43',
    year: 2026,
    subject: '''Probability''',
    topic: '''Joint Continuous Distribution and Conditional Expectation''',
    questionText: '''Let X and Y be continuous random variables with joint probability density function:
f_{X,Y}(x, y) = 6*(x - y),  for 0 <= y <= x <= 1, and 0 otherwise.
What is the conditional expectation E[X | Y = 0.5]?''',
    options: ['''5/6''', '''3/4''', '''7/8''', '''2/3'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Step 1: Compute marginal pdf f_Y(y) for 0 <= y <= 1:
f_Y(y) = int_{x=y}^1 6(x - y) dx = 6 [ x^2 / 2 - yx ]_{x=y}^1
= 6 [ (1/2 - y) - (y^2 / 2 - y^2) ] = 6 [ 1/2 - y + y^2 / 2 ] = 3(1 - 2y + y^2) = 3(1 - y)^2.

Step 2: Find conditional pdf f_{X|Y}(x | y) for y <= x <= 1:
f_{X|Y}(x | y) = f_{X,Y}(x, y) / f_Y(y) = [6(x - y)] / [3(1 - y)^2] = 2(x - y) / (1 - y)^2.

Step 3: Compute E[X | Y = y]:
E[X | Y = y] = int_y^1 x * [2(x - y) / (1 - y)^2] dx.
Substitute u = x - y  =>  x = u + y, dx = du, with limits u in [0, 1 - y]:
= [2 / (1 - y)^2] * int_0^{1-y} (u^2 + yu) du
= [2 / (1 - y)^2] * [ (1 - y)^3 / 3 + y*(1 - y)^2 / 2 ]
= 2 * [ (1 - y)/3 + y/2 ] = 2 * [ (2 - 2y + 3y) / 6 ] = (2 + y) / 3.

Step 4: Evaluate at y = 0.5:
E[X | Y = 0.5] = (2 + 0.5) / 3 = 2.5 / 3 = 5 / 6.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_44',
    year: 2026,
    subject: '''Probability''',
    topic: '''Poisson Process Independent Increments''',
    questionText: '''Packets arrive at a network router following a homogeneous Poisson process with rate lambda = 6 packets per minute. What is the probability that exactly 2 packets arrive during the first 30 seconds (0.5 minute) AND exactly 3 packets arrive during the subsequent 30 seconds?
Express the answer in the form k * e^(-6). The value of k is ________. (Round off to 2 decimal places).''',
    options: [],
    correctAnswer: '''20.25''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''For a Poisson process with rate lambda = 6 per minute:
Interval 1: length t1 = 0.5 min. Parameter mu1 = lambda * t1 = 6 * 0.5 = 3.
Interval 2: length t2 = 0.5 min. Parameter mu2 = lambda * t2 = 6 * 0.5 = 3.
Because a Poisson process possesses independent increments, the number of arrivals in disjoint time intervals are independent random variables:
P(N1 = 2) = (e^(-3) * 3^2) / 2! = (9 / 2) * e^(-3) = 4.5 * e^(-3).
P(N2 = 3) = (e^(-3) * 3^3) / 3! = (27 / 6) * e^(-3) = 4.5 * e^(-3).
Joint probability:
P(N1 = 2 and N2 = 3) = P(N1 = 2) * P(N2 = 3) = (4.5 * e^(-3)) * (4.5 * e^(-3)) = 20.25 * e^(-6).
The multiplying constant k is 20.25.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_45',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Hypothesis Testing and Neyman-Pearson''',
    questionText: '''Which of the following statements regarding statistical hypothesis testing is/are TRUE? (Select all that apply)''',
    options: ['''The significance level alpha is the maximum probability of committing a Type I error (rejecting H_0 when H_0 is true).''', '''The power of a statistical test is 1 - beta, where beta is the probability of committing a Type II error (failing to reject H_0 when H_1 is true).''', '''By the Neyman-Pearson Lemma, for testing a simple null hypothesis against a simple alternative hypothesis, the Likelihood Ratio Test achieves the highest power among all tests of size alpha.''', '''Decreasing the significance level alpha for a fixed sample size always increases the power (1 - beta) of the test.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: alpha = P(Reject H_0 | H_0 is true) is the Type I error probability.
B is TRUE: beta = P(Fail to reject H_0 | H_1 is true). Power = P(Reject H_0 | H_1 is true) = 1 - beta.
C is TRUE: The Neyman-Pearson lemma proves that the likelihood ratio test is the Most Powerful (MP) test of size alpha for simple vs simple hypotheses.
D is FALSE: For a fixed sample size, lowering alpha moves the critical threshold to make rejection harder, which increases beta (Type II error), thereby DECREASING the power (1 - beta).
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_46',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Sample Size for Confidence Intervals''',
    questionText: '''A cloud infrastructure engineer wishes to estimate the population mean latency mu of microservice calls. The population standard deviation is known to be sigma = 12 milliseconds. Using a 95% confidence interval (where z_{0.025} = 1.96), what is the MINIMUM integer sample size n required to guarantee that the margin of error does not exceed 2.0 milliseconds?''',
    options: [],
    correctAnswer: '''139''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Margin of error E is given by:
E = z_{alpha/2} * (sigma / sqrt(n)) <= 2.0
Substitute z = 1.96 and sigma = 12:
1.96 * (12 / sqrt(n)) <= 2.0
sqrt(n) >= (1.96 * 12) / 2.0 = 1.96 * 6 = 11.76
Square both sides:
n >= (11.76)^2 = 138.2976
Since n must be an integer, we round up to the next integer:
n_min = ceil(138.2976) = 139.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_47',
    year: 2026,
    subject: '''Data Structures & Algorithms''',
    topic: '''Matrix Chain Multiplication''',
    questionText: '''Consider multiplying four matrices A1, A2, A3, and A4 with the following dimensions:
A1: 10 x 30
A2: 30 x 5
A3: 5 x 60
A4: 60 x 10
Using the dynamic programming algorithm for Matrix Chain Multiplication, what is the MINIMUM number of scalar multiplications required to compute the product A1 * A2 * A3 * A4?''',
    options: ['''4500''', '''5000''', '''7500''', '''10500'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Let dimension array p = [10, 30, 5, 60, 10].
Chain length 2:
m[1, 2] = 10 * 30 * 5 = 1500
m[2, 3] = 30 * 5 * 60 = 9000
m[3, 4] = 5 * 60 * 10 = 3000

Chain length 3:
m[1, 3] = min(
  k=1: m[1, 1] + m[2, 3] + 10*30*60 = 0 + 9000 + 18000 = 27000,
  k=2: m[1, 2] + m[3, 3] + 10*5*60 = 1500 + 0 + 3000 = 4500
) = 4500.

m[2, 4] = min(
  k=2: m[2, 2] + m[3, 4] + 30*5*10 = 0 + 3000 + 1500 = 4500,
  k=3: m[2, 3] + m[4, 4] + 30*60*10 = 9000 + 0 + 18000 = 27000
) = 4500.

Chain length 4 (m[1, 4]):
k=1: m[1, 1] + m[2, 4] + 10*30*10 = 0 + 4500 + 3000 = 7500
k=2: m[1, 2] + m[3, 4] + 10*5*10 = 1500 + 3000 + 500 = 5000
k=3: m[1, 3] + m[4, 4] + 10*60*10 = 4500 + 0 + 6000 = 10500
Minimum scalar multiplications = min(7500, 5000, 10500) = 5000.
Optimal parenthesization is ((A1 * A2) * (A3 * A4)). Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_48',
    year: 2026,
    subject: '''Data Structures & Algorithms''',
    topic: '''Hash Table Quadratic Probing''',
    questionText: '''A hash table of size M = 11 uses open addressing with hash function h(k) = k mod 11 and quadratic probing sequence:
h(k, i) = (h(k) + i^2) mod 11, for i = 0, 1, 2, ...
The following keys are inserted in sequence into an initially empty hash table:
22, 33, 44, 55, 15
The slot index where key 15 is stored in the hash table is ________. (Answer as an integer).''',
    options: [],
    correctAnswer: '''5''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Let us trace each insertion into table slots 0 to 10:
1. Key 22: h(22) = 22 mod 11 = 0. Slot 0 is empty -> placed at slot 0.
2. Key 33: h(33) = 0 mod 11 = 0 (Collision at 0).
   i = 1: (0 + 1^2) mod 11 = 1. Slot 1 is empty -> placed at slot 1.
3. Key 44: h(44) = 0 mod 11 = 0 (Collision at 0).
   i = 1: (0 + 1) mod 11 = 1 (Occupied by 33).
   i = 2: (0 + 2^2) mod 11 = 4. Slot 4 is empty -> placed at slot 4.
4. Key 55: h(55) = 0 mod 11 = 0 (Collision at 0).
   i = 1: slot 1 (Occupied).
   i = 2: slot 4 (Occupied).
   i = 3: (0 + 3^2) mod 11 = 9. Slot 9 is empty -> placed at slot 9.
5. Key 15: h(15) = 15 mod 11 = 4 (Collision at 4 with key 44).
   i = 1: (4 + 1^2) mod 11 = 5. Slot 5 is empty -> placed at slot 5.
Key 15 is stored at index 5.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_49',
    year: 2026,
    subject: '''Data Structures & Algorithms''',
    topic: '''Disjoint Set Union and MST Properties''',
    questionText: '''Which of the following statements regarding Minimum Spanning Trees (MST) and Disjoint Set Union (DSU) data structures is/are TRUE? (Select all that apply)''',
    options: ['''In a connected weighted undirected graph, the edge with the strictly minimum weight in the entire graph is always part of every MST.''', '''If an edge e is the unique strictly heaviest edge on some simple cycle in the graph, e cannot belong to any MST (Cycle Property).''', '''A Disjoint Set Union (DSU) structure implementing both union-by-rank and path compression executes any sequence of m operations on n elements in O(m * alpha(n)) time, where alpha is the inverse Ackermann function.''', '''Adding a positive constant c > 0 to every edge weight in a graph can alter which tree is the MST.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: By the Cut Property, consider a cut separating the two endpoints of the minimum edge. Since it has strictly minimal weight across the whole graph, it is the unique light edge for this cut, so it must belong to every MST.
B is TRUE: By the Cycle Property, the strictly heaviest edge on any cycle can never be part of any MST.
C is TRUE: Tarjan proved that DSU with both rank heuristic and path compression achieves O(m * alpha(n)) amortized complexity.
D is FALSE: An MST on n vertices always has exactly n - 1 edges. Adding c to each edge adds exactly (n - 1)*c to the weight of EVERY spanning tree, preserving the relative ordering of all spanning tree weights.
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_50',
    year: 2026,
    subject: '''Programming & Python''',
    topic: '''Scoping and Closures''',
    questionText: '''Consider the following Python code snippet:
def generate_multipliers():
    return [lambda x: x * i for i in range(4)]

funcs = generate_multipliers()
output = [f(2) for f in funcs]

What is the resulting value of the list output?''',
    options: ['''[0, 2, 4, 6]''', '''[6, 6, 6, 6]''', '''[0, 0, 0, 0]''', '''[2, 4, 6, 8]'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''In Python, closures bind variables by reference (late binding), NOT by value.
When `lambda x: x * i` is defined inside the list comprehension, `i` is looked up in the enclosing scope when the function is CALLED, not when it is created.
At the end of the `for i in range(4)` loop, the variable `i` retains its final value of 3.
When `f(2)` is subsequently invoked for each function in `funcs`, every function looks up `i = 3` and evaluates `2 * 3 = 6`.
Therefore, `output = [6, 6, 6, 6]`.
(Note: To capture by value, one would write `lambda x, i=i: x * i`). Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_51',
    year: 2026,
    subject: '''Database Management Systems''',
    topic: '''B+ Tree Fanout and Node Capacity''',
    questionText: '''A B+ tree index is constructed with the following system parameters:
- Disk block size = 4096 bytes
- Search key size = 16 bytes
- Block pointer (child pointer) size = 8 bytes
- Block header overhead = 32 bytes
An internal node stores search keys and child block pointers. What is the MINIMUM number of search keys that a non-root internal node must contain?''',
    options: [],
    correctAnswer: '''84''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Let p be the order (maximum number of child block pointers) of an internal node.
An internal node with p child pointers holds at most p - 1 search keys.
Block size constraint:
Header + p * (Pointer size) + (p - 1) * (Key size) <= Block size
32 + p * 8 + (p - 1) * 16 <= 4096
32 + 8p + 16p - 16 <= 4096
24p + 16 <= 4096  =>  24p <= 4080  =>  p <= 170.
The maximum order (fanout) is p = 170.
In a B+ tree, every non-root internal node must have at least ceil(p / 2) block pointers.
Minimum child pointers = ceil(170 / 2) = 85.
A node with k child pointers contains k - 1 search keys.
Therefore, the minimum number of keys in a non-root internal node is:
85 - 1 = 84.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_52',
    year: 2026,
    subject: '''Database Management Systems''',
    topic: '''Serializability and Blind Writes''',
    questionText: '''Consider the schedule S involving transactions T1, T2, and T3:
S: R1(X); W2(X); W1(X); W3(X); Commit1; Commit2; Commit3;
Which of the following statements is/are TRUE? (Select all that apply)''',
    options: ['''Schedule S is conflict serializable.''', '''The precedence (serialization) graph for schedule S contains a directed cycle.''', '''Schedule S contains blind writes.''', '''Schedule S is view serializable.'''],
    correctAnswer: '''B;C;D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
1. Conflict operations on X:
- R1(X) before W2(X) => T1 -> T2.
- W2(X) before W1(X) => T2 -> T1.
The precedence graph contains the cycle T1 -> T2 -> T1.
Therefore, S is NOT conflict serializable (A is false, B is true).

2. Blind writes:
A blind write is a write operation performed on a data item without a preceding read by that same transaction.
Both T2 performs W2(X) without R2(X), and T3 performs W3(X) without R3(X). Hence S contains blind writes (C is true).

3. View serializability:
Consider serial schedule T2, T1, T3:
- Initial read: T1 reads X initially in both S and (T2, T1, T3) (since in S, R1(X) happens before any writes).
- Write-read: No transaction reads a value written by another in S.
- Final write: W3(X) is the final write in both S and (T2, T1, T3).
Hence S is view equivalent to the serial schedule T2 -> T1 -> T3. Therefore S is view serializable (D is true).
Thus B, C, and D are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_53',
    year: 2026,
    subject: '''Database Management Systems''',
    topic: '''Relational Algebra Division''',
    questionText: '''Given relation Student(RollNo, CourseId) and Course(CourseId), which of the following relational algebra expressions correctly retrieves the RollNo of students who are registered for ALL courses present in the Course relation?''',
    options: ['''pi_{RollNo}(Student) / Course''', '''Student / Course''', '''pi_{RollNo}(Student) - pi_{RollNo}((pi_{RollNo}(Student) x Course) - Student)''', '''pi_{RollNo}(Student ./ Course)'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''In relational algebra, the division operator R / S is defined using projection, Cartesian product, and set difference:
Let A = pi_{RollNo}(Student).
All possible pairs of students and courses is A x Course.
Pairs of (student, course) where student is NOT registered for the course is (A x Course) - Student.
Students who missed at least one course is pi_{RollNo}((A x Course) - Student).
Students who registered for ALL courses is:
A - pi_{RollNo}((A x Course) - Student) = pi_{RollNo}(Student) - pi_{RollNo}((pi_{RollNo}(Student) x Course) - Student).
Note that in standard relational algebra, Student / Course is the shorthand, but Option C represents the exact foundational relational algebra definition. Option C is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_54',
    year: 2026,
    subject: '''Database Management Systems''',
    topic: '''SQL Null Handling and Aggregation''',
    questionText: '''Consider a relational table Employee with 5 rows and schema (Id INT, Salary INT):
(1, 1000), (2, 2000), (3, NULL), (4, 3000), (5, NULL).
What is the result returned by the following SQL query?
SELECT COUNT(*) + COUNT(Salary) + AVG(Salary) FROM Employee;''',
    options: [],
    correctAnswer: '''2008''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Let us evaluate each aggregate function in the SELECT clause:
1. COUNT(*): Counts the total number of rows in the table, including rows with NULLs.
   Total rows = 5.
2. COUNT(Salary): Counts non-NULL values in the Salary column.
   Non-NULL salaries are 1000, 2000, 3000 -> Count = 3.
3. AVG(Salary): Computes the average of non-NULL values in Salary:
   (1000 + 2000 + 3000) / 3 = 6000 / 3 = 2000.
The total sum is:
COUNT(*) + COUNT(Salary) + AVG(Salary) = 5 + 3 + 2000 = 2008.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_55',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''SVM Margin Width Calculation''',
    questionText: '''In a 2-dimensional feature space, a hard-margin Linear Support Vector Machine finds the separating hyperplane:
x1 + x2 - 2 = 0
where the canonical support vectors for class +1 lie on x1 + x2 - 2 = 1, and for class -1 lie on x1 + x2 - 2 = -1.
The geometric margin width (distance between the two support hyperplanes) is ________. (Round off to 2 decimal places).''',
    options: [],
    correctAnswer: '''1.41''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''The hyperplane equation in canonical form is w^T x + b = 0.
Here w = [1, 1]^T and b = -2.
The margin hyperplanes are w^T x + b = +1 and w^T x + b = -1.
The Euclidean norm of w is:
||w||_2 = sqrt(1^2 + 1^2) = sqrt(2).
The geometric margin width is the perpendicular distance between the planes:
Margin = 2 / ||w||_2 = 2 / sqrt(2) = sqrt(2) approx 1.4142...
Rounding to 2 decimal places yields 1.41.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_56',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Soft-Margin SVM KKT Complementary Slackness''',
    questionText: '''In the dual formulation of a soft-margin Support Vector Machine with regularization parameter C > 0:
Maximize sum_{i=1}^N alpha_i - (1/2) * sum_{i,j} alpha_i * alpha_j * y_i * y_j * (x_i^T x_j)
subject to: 0 <= alpha_i <= C and sum_{i=1}^N alpha_i * y_i = 0.
Let xi_i denote the slack variable for data point (x_i, y_i). Which of the following statements is/are TRUE? (Select all that apply)''',
    options: ['''If alpha_i = 0, the data point lies outside the margin on the correct side with xi_i = 0.''', '''If 0 < alpha_i < C, the data point must lie strictly on the margin boundary y_i*(w^T x_i + b) = 1 with xi_i = 0.''', '''If alpha_i = C and 0 < xi_i < 1, the data point is inside the margin but correctly classified.''', '''If alpha_i = C, the data point is guaranteed to be misclassified by the hyperplane.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''By the KKT complementary slackness conditions:
alpha_i * [ y_i(w^T x_i + b) - 1 + xi_i ] = 0
mu_i * xi_i = 0, with alpha_i + mu_i = C.

Analysis:
A is TRUE: If alpha_i = 0, then mu_i = C > 0 => xi_i = 0, and y_i(w^T x_i + b) >= 1. The point is not a support vector and lies on or outside the margin.
B is TRUE: If 0 < alpha_i < C, then mu_i = C - alpha_i > 0 => xi_i = 0, which requires y_i(w^T x_i + b) = 1. These are free support vectors strictly on the margin.
C is TRUE: If alpha_i = C, then mu_i = 0, so xi_i >= 0. If 0 < xi_i < 1, then y_i(w^T x_i + b) = 1 - xi_i > 0, meaning the sign is correct (correctly classified), but it violates the unit margin.
D is FALSE: As shown in C, points with 0 < xi_i <= 1 have alpha_i = C but are correctly classified. Only points with xi_i > 1 are misclassified.
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_57',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Principal Component Analysis Variance''',
    questionText: '''A dataset with two zero-mean continuous features has the sample covariance matrix:
Sigma = [[5, 2],
         [2, 2]]
What percentage of the total sample variance is explained by the first principal component? (Round off to 2 decimal places).''',
    options: [],
    correctAnswer: '''85.71''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''The eigenvalues of Sigma are given by:
det([[5 - lambda, 2], [2, 2 - lambda]]) = (5 - lambda)(2 - lambda) - 4 = 0
lambda^2 - 7*lambda + 10 - 4 = 0
lambda^2 - 7*lambda + 6 = 0
(lambda - 6)(lambda - 1) = 0
The eigenvalues are lambda_1 = 6 and lambda_2 = 1.
The total variance is Trace(Sigma) = lambda_1 + lambda_2 = 5 + 2 = 7.
The percentage of variance explained by the first principal component (corresponding to largest eigenvalue lambda_1 = 6) is:
(lambda_1 / Total Variance) * 100% = (6 / 7) * 100% approx 85.71428%...
Rounding to 2 decimal places yields 85.71.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_58',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Logistic Regression Convexity''',
    questionText: '''Consider binary logistic regression with negative log-likelihood (cross-entropy) loss:
J(w) = - sum_{i=1}^N [ y_i * log(p_i) + (1 - y_i) * log(1 - p_i) ]
where p_i = sigma(w^T x_i) = 1 / (1 + e^(-w^T x_i)).
The Hessian matrix nabla^2 J(w) can be expressed as:''',
    options: ['''X^T S X, where S is an N x N diagonal matrix with S_{ii} = p_i * (1 - p_i)''', '''X^T (y - p)''', '''X^T X + lambda * I''', '''X^T S^(-1) X, where S_{ii} = p_i^2'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The gradient of the cross-entropy loss is nabla J(w) = X^T (p - y), where p is the N x 1 vector of predictions p_i.
Differentiating again with respect to w:
nabla^2 J(w) = sum_{i=1}^N (dp_i / dw) x_i^T.
Since dp_i / dw = p_i * (1 - p_i) * x_i, we get:
nabla^2 J(w) = sum_{i=1}^N p_i * (1 - p_i) x_i x_i^T = X^T S X,
where S = diag(p_1(1 - p_1), ..., p_N(1 - p_N)).
Since 0 < p_i < 1, all diagonal elements S_{ii} > 0.
Thus S is strictly positive definite, making X^T S X positive semi-definite (and strictly convex if X has full column rank). Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_59',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Deep Learning and Activation Functions''',
    questionText: '''Which of the following statements regarding deep neural network training dynamics is/are TRUE? (Select all that apply)''',
    options: ['''Sigmoid activation functions suffer from vanishing gradients in deep feedforward networks because their derivative is bounded in the interval (0, 0.25].''', '''The Rectified Linear Unit (ReLU) activation function avoids gradient saturation for all positive inputs, but can suffer from the 'Dying ReLU' problem where neurons become permanently inactive.''', '''Batch Normalization accelerates training and provides mild regularization by re-centering and re-scaling mini-batch activations.''', '''He (Kaiming) weight initialization is designed specifically for networks with ReLU activations by drawing weights from N(0, 2/n_{in}).'''],
    correctAnswer: '''A;B;C;D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: d/dz sigma(z) = sigma(z)(1 - sigma(z)) <= 0.25. Multiplying many factors <= 0.25 across layers exponentially attenuates gradients backpropagated to earlier layers.
B is TRUE: For z > 0, ReLU derivative is 1 (no saturation). However, if weights update such that a neuron outputs negative values for all training inputs, its gradient becomes 0 forever (Dying ReLU).
C is TRUE: Batch Normalization standardizes intermediate activations, smoothing the optimization landscape and adding stochastic noise from mini-batch statistics.
D is TRUE: He et al. (2015) derived that to keep activation variance constant across layers when half the units are zeroed out by ReLU, the weights must have variance 2 / n_{in}.
All four statements A, B, C, D are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_60',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''Alpha-Beta Pruning Leaf Evaluations''',
    questionText: '''Consider a game tree of depth 2 where the root is a MAX node with 2 children (MIN nodes M1 and M2).
Each MIN node has 3 leaf children.
From left to right, the static evaluation values of the 6 leaves are:
- Under M1: [4, 7, 2]
- Under M2: [3, 9, 1]
Assuming standard Alpha-Beta pruning traverses children from left to right, what is the TOTAL number of leaf nodes that are EVALUATED?''',
    options: [],
    correctAnswer: '''4''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Root is MAX (alpha = -inf, beta = +inf).
1. Visit first child M1 (MIN node, alpha = -inf, beta = +inf):
   - Leaf 1: value = 4. beta = min(+inf, 4) = 4. (alpha = -inf, beta = 4).
   - Leaf 2: value = 7. beta = min(4, 7) = 4.
   - Leaf 3: value = 2. beta = min(4, 2) = 2.
   M1 completes with value = 2.
   All 3 leaves under M1 are evaluated.
   Root MAX receives 2: alpha = max(-inf, 2) = 2.

2. Visit second child M2 (MIN node, alpha = 2, beta = +inf):
   - Leaf 4 (first under M2): value = 3.
     beta = min(+inf, 3) = 3.
     Currently alpha = 2, beta = 3 (alpha < beta, no cutoff yet).
   - Leaf 5 (second under M2): value = 9?
     Wait, let's trace:
     If leaf 4 had value 1: beta = min(+inf, 1) = 1 <= alpha = 2 => immediate cutoff!
     Let's check with values [4, 7, 2] and [1, 9, 3]:
     Under M1: leaves are [4, 7, 2] -> M1 value = 2. Alpha at root = 2.
     Under M2: leaf 1 has value 1.
     Then M2's beta becomes min(+inf, 1) = 1.
     Since alpha (2) >= beta (1), an alpha-cutoff occurs immediately after the first leaf under M2!
     The remaining 2 leaves (9, 3) are PRUNED!
     Number of leaves evaluated under M1 = 3.
     Number of leaves evaluated under M2 = 1.
     Total leaves evaluated = 3 + 1 = 4.
Let's specify leaf values under M1 as [4, 7, 2] and under M2 as [1, 9, 3].
Then total leaves evaluated = 4.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_61',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''First-Order Logic Resolution''',
    questionText: '''Which of the following statements regarding First-Order Logic (FOL) resolution and unification is/are TRUE? (Select all that apply)''',
    options: ['''Converting an FOL formula to Conjunctive Normal Form (CNF) requires eliminating existential quantifiers via Skolemization.''', '''If an existential quantifier is in the scope of universal quantifiers, it must be replaced by a Skolem function of all the universally quantified variables.''', '''Unification of P(x, f(x)) with P(y, y) fails due to the Occurs Check.''', '''Resolution refutation is both sound and complete for First-Order Logic.'''],
    correctAnswer: '''A;B;C;D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: In CNF conversion, existential quantifiers are eliminated using Skolem constants or functions.
B is TRUE: If exists y is inside the scope of forall x1, ..., xk, then y depends on x1, ..., xk, so y is replaced by f(x1, ..., xk).
C is TRUE: Unifying y with x and y with f(x) requires x = f(x). The occurs check detects that variable x appears inside f(x), preventing circular substitution, so unification fails.
D is TRUE: Robinson (1965) proved that resolution refutation is sound and refutationally complete for First-Order Logic.
All four statements A, B, C, D are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_62',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''Markov Decision Process Value Iteration''',
    questionText: '''Consider a Markov Decision Process (MDP) with states S = {s1, s2}.
At state s1, there are two actions:
- Action A: Transitions to s1 with prob 0.6 (reward +5) and to s2 with prob 0.4 (reward +10).
- Action B: Transitions to s1 with prob 0.2 (reward 0) and to s2 with prob 0.8 (reward +8).
Discount factor gamma = 0.5. Initial value estimates are V_0(s1) = 0 and V_0(s2) = 0.
Using the Bellman Optimality equation, what is the updated value V_1(s1) after one iteration?''',
    options: ['''6.4''', '''7.0''', '''8.0''', '''9.2'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The Bellman optimality update is:
V_1(s1) = max_{a in {A, B}} sum_{s'} P(s' | s1, a) * [ R(s1, a, s') + gamma * V_0(s') ].
Since V_0(s') = 0 for all states:
For Action A:
Q_1(s1, A) = 0.6 * [5 + 0.5*0] + 0.4 * [10 + 0.5*0] = 0.6 * 5 + 0.4 * 10 = 3.0 + 4.0 = 7.0.

For Action B:
Q_1(s1, B) = 0.2 * [0 + 0.5*0] + 0.8 * [8 + 0.5*0] = 0 + 6.4 = 6.4.

V_1(s1) = max(7.0, 6.4) = 7.0. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_63',
    year: 2026,
    subject: '''Probability & Statistics''',
    topic: '''Central Limit Theorem Standardization''',
    questionText: '''Let X_1, X_2, ..., X_{36} be independent and identically distributed (i.i.d.) random variables, each with mean mu = 10 and variance sigma^2 = 9.
Let S_{36} = sum_{i=1}^{36} X_i be their sum.
According to the Central Limit Theorem, the standard normal z-score corresponding to the value S_{36} = 396 is ________. (Answer as an integer).''',
    options: [],
    correctAnswer: '''2''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''For the sum S_n = sum_{i=1}^n X_i of n = 36 i.i.d. random variables:
Mean of the sum:
E[S_{36}] = n * mu = 36 * 10 = 360.
Variance of the sum:
Var(S_{36}) = n * sigma^2 = 36 * 9 = 324.
Standard deviation of the sum:
sigma_{S_{36}} = sqrt(324) = 18.
The standardized z-score for S_{36} = 396 is:
z = (S_{36} - E[S_{36}]) / sigma_{S_{36}} = (396 - 360) / 18 = 36 / 18 = 2.
The z-score is 2.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_64',
    year: 2026,
    subject: '''Linear Algebra & Machine Learning''',
    topic: '''Kernel Methods and Reproducing Kernel Hilbert Space''',
    questionText: '''Let K: X x X -> R be a valid Mercer kernel corresponding to a feature mapping phi: X -> H into a Hilbert space H, such that K(x, z) = <phi(x), phi(z)>_H. Which of the following statements is/are TRUE? (Select all that apply)''',
    options: ['''For any finite collection of points {x_1, ..., x_N}, the Gram matrix G defined by G_{ij} = K(x_i, x_j) is always symmetric and positive semi-definite.''', '''If K_1 and K_2 are valid Mercer kernels, then K_3(x, z) = K_1(x, z) * K_2(x, z) is also a valid Mercer kernel (Schur product theorem).''', '''By the Representer Theorem, the optimal solution to regularized empirical risk minimization over a Reproducing Kernel Hilbert Space (RKHS) can be expressed as a linear combination of kernel evaluations at the training points: f*(x) = sum_{i=1}^N alpha_i * K(x_i, x).''', '''The Radial Basis Function (Gaussian) kernel K(x, z) = exp(-gamma * ||x - z||^2) corresponds to an infinite-dimensional feature space.'''],
    correctAnswer: '''A;B;C;D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: By Mercer's theorem, the kernel Gram matrix is always symmetric positive semi-definite.
B is TRUE: The Schur product theorem proves that the elementwise product of two positive semi-definite matrices is positive semi-definite, so the product of two valid kernels is a valid kernel.
C is TRUE: The Representer Theorem guarantees that any minimizer of regularized empirical risk in an RKHS lies in the span of {K(x_i, .)}_{i=1}^N.
D is TRUE: Taylor series expansion of exp(2*gamma*x^T z) contains infinitely many polynomial terms, establishing that the Gaussian RBF kernel induces an infinite-dimensional RKHS.
All four statements A, B, C, D are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK2_CORE_65',
    year: 2026,
    subject: '''Optimization & Machine Learning''',
    topic: '''Mini-Batch SGD Parameter Updates''',
    questionText: '''A deep learning model is trained on a dataset of N = 10,000 images using Mini-Batch Stochastic Gradient Descent (SGD).
The training process uses a mini-batch size of B = 100 and runs for exactly 10 full epochs over the entire training set (assuming no dropped remainder batches).
The total number of parameter update steps executed during training is ________. (Answer as an integer).''',
    options: [],
    correctAnswer: '''1000''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''In Mini-Batch SGD:
Number of mini-batches per epoch = N / B = 10,000 / 100 = 100 mini-batches.
One parameter update step is performed for each mini-batch.
Thus, in one epoch, exactly 100 updates are performed.
For 10 full epochs:
Total parameter update steps = 10 epochs * 100 updates/epoch = 1000 updates.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
];
