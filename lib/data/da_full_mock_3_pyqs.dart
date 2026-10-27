// AUTO-GENERATED MOCK 3 QUESTIONS (LEVEL 3: EXTREME FACULTY DIFFICULTY)
import '../models/models.dart';

final List<PYQ> daFullMock3Questions = [
  PYQ(
    id: 'DA_MOCK3_GA_01',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Verbal Ability''',
    questionText: '''Choose the word that is most nearly OPPOSITE in meaning to the underlined word:
"The venture capitalist dismissed the startup founder's claims as mere <u>sophistry</u>."''',
    options: ['''Chicanery''', '''Cogency''', '''Equivocation''', '''Speciousness'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''"Sophistry" means the use of clever but fallacious arguments with the intent to deceive.
Its opposite is valid, persuasive, clear, and sound logical reasoning, which is "Cogency".
"Chicanery", "Equivocation", and "Speciousness" are synonyms or closely related to deception and fallacy. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_GA_02',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Critical Reasoning''',
    questionText: '''Consider the following argument:
"If a neural architecture has fewer than one billion parameters, it cannot exhibit emergent reasoning capabilities. Transformer-Z exhibits emergent reasoning capabilities."
Which of the following MUST be true based on the premises?''',
    options: ['''Transformer-Z has exactly one billion parameters.''', '''Transformer-Z has at least one billion parameters.''', '''Any architecture with at least one billion parameters exhibits emergent reasoning capabilities.''', '''No architecture other than Transformer-Z has emergent reasoning capabilities.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Let P = "parameters < 1 billion" and E = "exhibits emergent reasoning".
Premise 1: P -> ~E.
Premise 2: E (for Transformer-Z).
By Modus Tollens (~(~E) -> ~P), we have ~P.
Since P is "parameters < 1 billion", ~P is "parameters >= 1 billion".
Therefore, Transformer-Z must have at least one billion parameters. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_GA_03',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude''',
    questionText: '''A clock is set correctly at 8:00 AM on Monday. The clock loses 6 minutes every 24 hours. What is the TRUE time when this faulty clock indicates 2:00 PM on the following Friday?''',
    options: ['''2:25 PM''', '''2:30 PM''', '''2:24 PM''', '''2:40 PM'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''From Monday 8:00 AM to Friday 2:00 PM:
Total elapsed days from Mon 8 AM to Fri 8 AM = 4 days = 96 hours.
From Fri 8 AM to Fri 2 PM = 6 hours.
Total indicated time on the faulty clock = 96 + 6 = 102 hours.
Since the clock loses 6 minutes in 24 hours:
In 24 hours of true time, the faulty clock indicates 23 hours 54 minutes = 23 + 54/60 = 23 + 9/10 = 239/10 hours = 1434 minutes.
True time of 24 hours = 1440 minutes.
Ratio of True Time to Indicated Time = 1440 / 1434 = 240 / 239.
Wait, let's express in hours:
True 24 hours = 23.9 faulty hours.
So 1 faulty hour = 24 / 23.9 true hours.
For 102 faulty hours:
True hours = 102 * (24 / 23.9) = 102 * (240 / 239) = 24480 / 239 approx 102.4267 hours.
0.4267 hours = 0.4267 * 60 approx 25.6 minutes approx 2:25 PM.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_GA_04',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Combinatorics''',
    questionText: '''Four distinct data processing tasks T1, T2, T3, and T4 are to be assigned to three distinct compute servers S1, S2, and S3. Each server must be assigned at least one task. In how many distinct ways can this assignment be made?''',
    options: ['''24''', '''36''', '''48''', '''72'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''We are partitioning 4 distinct items into 3 non-empty distinct buckets.
Total assignments without restrictions = 3^4 = 81.
Using Principle of Inclusion-Exclusion:
- Number of assignments where at least 1 server is empty: C(3, 1) * 2^4 = 3 * 16 = 48.
- Number of assignments where at least 2 servers are empty: C(3, 2) * 1^4 = 3 * 1 = 3.
- Number of assignments where all 3 are empty: 0.
Number of surjective assignments = 3^4 - C(3, 1)*2^4 + C(3, 2)*1^4 = 81 - 48 + 3 = 36.
Alternatively, Stirling number of second kind S(4, 3) * 3! = 6 * 6 = 36.
Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_GA_05',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Spatial Aptitude''',
    questionText: '''A regular tetrahedron has four equilateral triangular faces. If each edge of the tetrahedron is painted either Red or Blue, what is the minimum number of edges that must be painted Red so that every triangular face has at least one Red edge?''',
    options: ['''1''', '''2''', '''3''', '''4'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''A regular tetrahedron has 4 vertices, 6 edges, and 4 triangular faces.
Each edge belongs to exactly 2 faces.
If we paint 1 edge Red, it covers only 2 faces, leaving 4 - 2 = 2 faces with zero red edges.
If we paint 2 edges Red:
Can 2 edges cover all 4 faces?
Choose two opposite (skew) edges of the tetrahedron.
For example, let vertices be 1, 2, 3, 4.
The faces are (1,2,3), (1,2,4), (1,3,4), (2,3,4).
Take edge e1 = (1, 2). It belongs to faces (1,2,3) and (1,2,4).
Take edge e2 = (3, 4). It belongs to faces (1,3,4) and (2,3,4).
Notice that e1 and e2 together cover all four faces {(1,2,3), (1,2,4), (1,3,4), (2,3,4)}!
Thus, painting just 2 opposite edges Red guarantees that every face contains at least one Red edge.
Minimum number of edges = 2. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_GA_06',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Permutation and Combination''',
    questionText: '''Five letters are addressed to five distinct recipients, and five corresponding envelopes are prepared with the correct destination addresses. If the letters are inserted into the envelopes completely at random, what is the probability that EXACTLY TWO letters are placed in their correct envelopes?''',
    options: ['''1/12''', '''1/6''', '''1/4''', '''1/8'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Total number of ways to insert 5 letters into 5 envelopes = 5! = 120.
We want exactly 2 letters to be in their correct envelopes, and the remaining 3 letters to be deranged (none in their correct envelope).
Step 1: Choose which 2 letters go into their correct envelopes: C(5, 2) = 10 ways.
Step 2: Derange the remaining 3 letters:
The subfactorial !3 (number of derangements of 3 items) is:
!3 = 3! * (1 - 1/1! + 1/2! - 1/3!) = 6 * (1/2 - 1/6) = 6 * (2/6) = 2.
Total favorable outcomes = C(5, 2) * !3 = 10 * 2 = 20.
Probability = 20 / 120 = 1 / 6. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_GA_07',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude''',
    questionText: '''Two pipes P1 and P2 can fill an industrial cooling reservoir in 10 hours and 15 hours respectively, while a drainage outlet O can empty the fully filled reservoir in 12 hours. All three are opened simultaneously at 6:00 AM. After 6 hours (at 12:00 PM), the drainage outlet O is closed while P1 and P2 continue to run. At what time will the cooling reservoir be completely filled?''',
    options: ['''1:30 PM''', '''2:00 PM''', '''3:00 PM''', '''4:15 PM'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Let the total capacity of the reservoir be LCM(10, 15, 12) = 60 units.
Rate of filling pipe P1 = 60 / 10 = +6 units/hour.
Rate of filling pipe P2 = 60 / 15 = +4 units/hour.
Rate of drainage outlet O = 60 / 12 = -5 units/hour.
Net filling rate from 6:00 AM to 12:00 PM (6 hours):
Net rate = 6 + 4 - 5 = +5 units/hour.
Volume filled in first 6 hours = 6 hours * 5 units/hour = 30 units.
Remaining volume to fill = 60 - 30 = 30 units.
At 12:00 PM, outlet O is closed.
Combined rate of P1 and P2 = 6 + 4 = +10 units/hour.
Time required to fill remaining 30 units = 30 units / 10 units/hour = 3 hours.
Time of completion = 12:00 PM + 3 hours = 3:00 PM. Option C is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_GA_08',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Critical Reasoning''',
    questionText: '''Read the passage carefully:
"Proponents of automated theorem proving argue that because formal verification software has successfully checked the correctness of the Four Color Theorem and Kepler's Conjecture, human mathematicians will soon be unnecessary for producing cutting-edge mathematical breakthroughs."
Which of the following unstated assumptions is REQUIRED for the argument's conclusion to hold?''',
    options: ['''Human mathematicians make frequent errors when peer-reviewing complex combinatorial proofs.''', '''The cognitive capacity required to formulate novel mathematical conjectures and conceptual frameworks is equivalent to the capacity required to verify the formal logical steps of an existing conjecture.''', '''Formal verification software is capable of executing without any underlying hardware or compiler instructions.''', '''All mathematical conjectures of interest have already been stated in first-order logic.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The argument moves from:
Premise: Software can verify/check existing proofs.
Conclusion: Humans are unnecessary for producing cutting-edge breakthroughs (which involves formulating new concepts, hypotheses, intuition, and conjectures).
For the conclusion to follow, the author must assume that verifying proofs (which computers do) encompasses or is equivalent to generating creative conceptual breakthroughs and conjectures. Option B explicitly captures this necessary bridge assumption. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_GA_09',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Probability & Puzzle''',
    questionText: '''In a game show, there are four closed doors (D1, D2, D3, D4). Behind exactly one door is a luxury car; behind the other three are goats. You pick Door D1. The host (who knows where the car is) must open one of the other three doors that contains a goat, and reveals a goat behind Door D4. The host then gives you the choice: stick with Door D1, or switch to either Door D2 or Door D3. If you switch by picking uniformly at random between D2 and D3, what is your probability of winning the luxury car?''',
    options: ['''1/4''', '''1/3''', '''3/8''', '''1/2'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Initial probability that the car is behind D1 = 1/4.
Initial probability that the car is behind the group {D2, D3, D4} = 3/4.
When the host opens D4 to reveal a goat, the entire 3/4 probability of the set {D2, D3, D4} is now concentrated across the remaining unopened doors in that set, namely {D2, D3}.
By symmetry, P(Car at D2) = P(Car at D3) = (3/4) / 2 = 3/8 = 0.375.
If you switch by randomly selecting between D2 and D3, your probability of winning is 3/8.
Option C is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_GA_10',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Analytical & Geometry''',
    questionText: '''A square of side length 2 units is centered at the origin (vertices at (+/-1, +/-1)). A circle is inscribed inside the square, and a second smaller circle is placed in one of the corner regions such that it is tangent to two adjacent sides of the square and externally tangent to the inscribed circle. The radius of this smaller corner circle is:''',
    options: ['''3 - 2*sqrt(2)''', '''sqrt(2) - 1''', '''(sqrt(2) - 1) / 2''', '''2 - sqrt(2)'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The inscribed circle has radius R = 1, centered at origin (0, 0).
The corner vertex of the square is at (1, 1).
The distance from origin (0, 0) to vertex (1, 1) is sqrt(1^2 + 1^2) = sqrt(2).
Let the small corner circle have radius r.
Since it is tangent to the lines x = 1 and y = 1, its center must be at (1 - r, 1 - r).
The distance from the origin (0, 0) to the center of the small circle is:
Distance = sqrt((1 - r)^2 + (1 - r)^2) = (1 - r) * sqrt(2).
Since the small circle is externally tangent to the inscribed circle of radius R = 1 centered at (0, 0):
Distance from origin to small circle center = R + r = 1 + r.
Equating the two expressions:
(1 - r) * sqrt(2) = 1 + r
sqrt(2) - r * sqrt(2) = 1 + r
r * (sqrt(2) + 1) = sqrt(2) - 1
r = (sqrt(2) - 1) / (sqrt(2) + 1).
Rationalizing the denominator by multiplying numerator and denominator by (sqrt(2) - 1):
r = (sqrt(2) - 1)^2 / (2 - 1) = 2 - 2*sqrt(2) + 1 = 3 - 2*sqrt(2).
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_11',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Nilpotent Matrices''',
    questionText: '''Let A be an n x n real matrix such that A^k = 0 for some positive integer k >= 1 (i.e., A is nilpotent). Which of the following statements is ALWAYS TRUE?''',
    options: ['''The only eigenvalue of A is 0, and matrix (I + A) is always invertible.''', '''A must have n distinct linearly independent eigenvectors.''', '''The determinant of A is strictly positive.''', '''The matrix A is always diagonalizable over the complex numbers.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''For any nilpotent matrix A (where A^k = 0):
1. If lambda is an eigenvalue of A with eigenvector v, then A^k v = lambda^k v = 0, so lambda^k = 0 => lambda = 0. Thus, 0 is the unique eigenvalue of A.
2. The eigenvalues of (I + A) are 1 + lambda_i = 1 + 0 = 1. Since none of its eigenvalues are zero, det(I + A) = 1 != 0, so (I + A) is always invertible with explicit Neumann series inverse (I - A + A^2 - ... + (-1)^(k-1) A^(k-1)).
3. Non-zero nilpotent matrices are never diagonalizable because their geometric multiplicity is strictly less than algebraic multiplicity n.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_12',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Rayleigh Quotient''',
    questionText: '''Consider the 2 x 2 symmetric matrix:
A = [[2, 1],
     [1, 2]]
The maximum value of the Rayleigh quotient R(x) = (x^T A x) / (x^T x) over all non-zero vectors x in R^2 is ________. (Answer as an integer).''',
    options: [],
    correctAnswer: '''3''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''By the Rayleigh-Ritz Theorem, for any real symmetric matrix A, the Rayleigh quotient is bounded between the minimum and maximum eigenvalues of A:
lambda_min <= (x^T A x) / (x^T x) <= lambda_max.
Let us find the eigenvalues of A:
det([[2 - lambda, 1], [1, 2 - lambda]]) = (2 - lambda)^2 - 1 = 0
2 - lambda = +/- 1  =>  lambda_1 = 3, lambda_2 = 1.
Therefore, lambda_max = 3.
The maximum value of the Rayleigh quotient is 3 (achieved when x is an eigenvector corresponding to lambda = 3, e.g., x = [1, 1]^T).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_13',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Orthogonal Matrices and Isometries''',
    questionText: '''Let Q be an n x n real orthogonal matrix (Q^T Q = I_n). Which of the following statements is/are TRUE? (Select all that apply)''',
    options: ['''For any vector x in R^n, ||Q x||_2 = ||x||_2 (Q preserves Euclidean vector norms).''', '''For any vectors x, y in R^n, (Q x)^T (Q y) = x^T y (Q preserves inner products and angles).''', '''All eigenvalues of Q (whether real or complex) have absolute value |lambda| = 1.''', '''The determinant of Q is always equal to +1.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: ||Q x||_2^2 = (Q x)^T (Q x) = x^T Q^T Q x = x^T I x = ||x||_2^2.
B is TRUE: (Q x)^T (Q y) = x^T Q^T Q y = x^T y.
C is TRUE: Let Q v = lambda v with v != 0. Then ||Q v||_2 = |lambda| ||v||_2. Since ||Q v||_2 = ||v||_2, we must have |lambda| = 1.
D is FALSE: det(Q^T Q) = det(I) = 1 => (det Q)^2 = 1 => det Q = +1 or -1 (e.g., reflections have determinant -1).
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_14',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Multivariable Limits and Path Dependency''',
    questionText: '''Consider the limit:
L = lim_{(x, y) -> (0, 0)} (x^3 * y) / (x^6 + y^2)
Which of the following statements is correct regarding L?''',
    options: ['''L = 0 along all straight lines passing through the origin, and the multivariable limit exists and equals 0.''', '''The limit does not exist because approaching along the parabolic curve y = m * x^3 yields different values for different values of m.''', '''L = 1/2.''', '''L = 1.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Let us test paths:
1. Along any straight line y = k x:
lim_{x -> 0} (k x^4) / (x^6 + k^2 x^2) = lim_{x -> 0} (k x^2) / (x^4 + k^2) = 0 / k^2 = 0 (for k != 0).
2. Along the cubic path y = m x^3:
Substitute y = m x^3 into the expression:
(x^3 * (m x^3)) / (x^6 + (m x^3)^2) = (m x^6) / (x^6 + m^2 x^6) = m / (1 + m^2).
For m = 1, the value is 1/2.
For m = 2, the value is 2/5.
Since the limit depends on the choice of path (parameter m), the limit does NOT exist. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_15',
    year: 2026,
    subject: '''Optimization''',
    topic: '''Hessian Determinant at Extrema''',
    questionText: '''Consider the multivariable function:
f(x, y) = x^3 - 3*x + y^2
The function has a unique local minimum in R^2. The determinant of the Hessian matrix evaluated at this local minimum is ________. (Answer as an integer).''',
    options: [],
    correctAnswer: '''12''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Step 1: Find critical points where grad f = 0:
df/dx = 3*x^2 - 3 = 0  =>  x^2 = 1  =>  x = 1 or x = -1.
df/dy = 2*y = 0  =>  y = 0.
The critical points are P1(1, 0) and P2(-1, 0).

Step 2: Compute the Hessian matrix:
H(x, y) = [[d^2f/dx^2, d^2f/dxdy], [d^2f/dydx, d^2f/dy^2]] = [[6x, 0], [0, 2]].

Step 3: Classify critical points:
- At P1(1, 0): H(1, 0) = [[6, 0], [0, 2]].
  Eigenvalues are 6 > 0 and 2 > 0 (strictly positive definite).
  Thus, (1, 0) is the unique local minimum.
- At P2(-1, 0): H(-1, 0) = [[-6, 0], [0, 2]] (indefinite, saddle point).

Step 4: Determinant of Hessian at local minimum (1, 0):
det(H(1, 0)) = 6 * 2 - 0 = 12.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_16',
    year: 2026,
    subject: '''Optimization''',
    topic: '''Quasiconvexity and Convex Functions''',
    questionText: '''Which of the following statements regarding convex and quasiconvex functions is/are TRUE? (Select all that apply)''',
    options: ['''A function f: R^n -> R is quasiconvex if and only if its sublevel set S_alpha = {x in R^n : f(x) <= alpha} is convex for every alpha in R.''', '''Every convex function is necessarily quasiconvex.''', '''A strictly quasiconvex function can have multiple distinct local minima with different function values.''', '''The sum of any two quasiconvex functions is always quasiconvex.'''],
    correctAnswer: '''A;B''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: This is the formal definition of quasiconvexity.
B is TRUE: For a convex function, Jensen's inequality f(theta x + (1-theta)y) <= theta f(x) + (1-theta)f(y) <= max(f(x), f(y)), meaning every sublevel set is convex.
C is FALSE: A strictly quasiconvex function has the property that any local minimum is a strict global minimum.
D is FALSE: The sum of two quasiconvex functions is NOT necessarily quasiconvex (e.g., f(x) = -e^(-x^2) and g(x) = -e^(-(x-2)^2) are quasiconvex on certain domains, but their sum is bimodal).
Thus only A and B are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_17',
    year: 2026,
    subject: '''Probability''',
    topic: '''Conditional Poisson Distribution''',
    questionText: '''Let X and Y be independent Poisson random variables with parameters lambda_1 and lambda_2 respectively. The conditional distribution of X given that X + Y = n is:''',
    options: ['''Poisson with parameter (lambda_1 + lambda_2)''', '''Binomial with parameters n and p = lambda_1 / (lambda_1 + lambda_2)''', '''Geometric with parameter p = lambda_1 / lambda_2''', '''Negative Binomial with parameters n and p = lambda_1 / (lambda_1 + lambda_2)'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''By definition:
P(X = k | X + Y = n) = P(X = k, X + Y = n) / P(X + Y = n) = [P(X = k) * P(Y = n - k)] / P(X + Y = n).
Since X ~ Poisson(lambda_1) and Y ~ Poisson(lambda_2), X + Y ~ Poisson(lambda_1 + lambda_2).
= [ (e^(-lambda_1) * lambda_1^k / k!) * (e^(-lambda_2) * lambda_2^(n - k) / (n - k)!) ] / [ e^(-(lambda_1 + lambda_2)) * (lambda_1 + lambda_2)^n / n! ]
= [ n! / (k! * (n - k)!) ] * [ lambda_1^k * lambda_2^(n - k) ] / (lambda_1 + lambda_2)^n
= C(n, k) * (lambda_1 / (lambda_1 + lambda_2))^k * (lambda_2 / (lambda_1 + lambda_2))^(n - k).
This is exactly the Probability Mass Function of a Binomial(n, p) distribution with p = lambda_1 / (lambda_1 + lambda_2).
Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_18',
    year: 2026,
    subject: '''Probability''',
    topic: '''Pearson Correlation Coefficient Invariance''',
    questionText: '''Let X be a non-degenerate continuous random variable with mean mu_X and variance sigma_X^2 > 0. Let Y = 5 - 4*X. The Pearson correlation coefficient rho(X, Y) between X and Y is ________. (Answer as an integer).''',
    options: [],
    correctAnswer: '''-1''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Cov(X, Y) = Cov(X, 5 - 4*X) = Cov(X, 5) - 4 * Cov(X, X) = 0 - 4 * Var(X) = -4 * sigma_X^2.
The standard deviation of Y is:
sigma_Y = sqrt(Var(5 - 4*X)) = sqrt((-4)^2 * Var(X)) = 4 * sigma_X.
The Pearson correlation coefficient is:
rho(X, Y) = Cov(X, Y) / (sigma_X * sigma_Y) = (-4 * sigma_X^2) / (sigma_X * 4 * sigma_X) = -4 / 4 = -1.
The correlation is exactly -1.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_19',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Sufficient Statistics and Neyman-Fisher''',
    questionText: '''Which of the following statements regarding sufficient statistics in estimation theory is/are TRUE? (Select all that apply)''',
    options: ['''By the Neyman-Fisher Factorization Theorem, a statistic T(X) is sufficient for parameter theta if and only if the joint density can be factored as f(x; theta) = g(T(x), theta) * h(x).''', '''If T(X) is a sufficient statistic for theta, then any one-to-one function of T(X) is also a sufficient statistic for theta.''', '''The sample mean X_bar is a sufficient statistic for the parameter lambda of a Poisson distribution.''', '''A sufficient statistic always throws away informative variability to achieve minimum sample size.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: This is the precise statement of the Neyman-Fisher Factorization Theorem.
B is TRUE: A one-to-one transformation preserves all information contained in T(X), maintaining sufficiency.
C is TRUE: For Poisson(lambda), f(x; lambda) = prod (e^(-lambda) lambda^(x_i) / x_i!) = e^(-n*lambda) lambda^(n*X_bar) * prod (1/x_i!). Thus X_bar is a sufficient statistic.
D is FALSE: A sufficient statistic retains ALL information relevant to estimating theta without losing any informative variability.
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_20',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Method of Moments for Exponential Distribution''',
    questionText: '''A sample of 4 service response times is collected: {2.0, 4.0, 6.0, 8.0} seconds. Assuming the data is drawn from an Exponential distribution with rate parameter lambda (pdf f(x) = lambda * e^(-lambda * x), for x >= 0), the Method of Moments estimate for lambda is ________. (Round off to 2 decimal places).''',
    options: [],
    correctAnswer: '''0.20''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''For an Exponential(lambda) distribution:
Population first moment: E[X] = 1 / lambda.
Sample first moment (sample mean):
X_bar = (2.0 + 4.0 + 6.0 + 8.0) / 4 = 20.0 / 4 = 5.0 seconds.
Equating population moment to sample moment:
1 / lambda_hat = X_bar = 5.0
lambda_hat = 1 / 5.0 = 0.20 per second.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_21',
    year: 2026,
    subject: '''Data Structures & Algorithms''',
    topic: '''Amortized Analysis''',
    questionText: '''In a dynamic array implementation that doubles its capacity from N to 2N whenever an insertion exceeds current capacity, starting from an empty array of capacity 1:''',
    options: ['''The worst-case time complexity of an individual insertion is O(1), and the amortized cost per insertion is O(N).''', '''The worst-case time complexity of an individual insertion is O(N), but the amortized cost per insertion is O(1).''', '''Both the worst-case and amortized time complexities per insertion are O(log N).''', '''The amortized cost per insertion is O(N) by the Banker's accounting method.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''When resizing occurs, all N existing elements must be copied to the new block, taking O(N) worst-case time for that single operation.
However, doubling happens only after N insertions. Over a sequence of N insertions, total resizing copy work is 1 + 2 + 4 + ... + N <= 2N = O(N).
Dividing total cost O(N) by N insertions gives an amortized cost of O(1) per insertion. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_22',
    year: 2026,
    subject: '''Data Structures & Algorithms''',
    topic: '''AVL Tree Minimum Nodes''',
    questionText: '''An AVL tree is a self-balancing binary search tree where the balance factor of every node is in {-1, 0, 1}.
Let height h be defined such that a tree with a single node has height h = 0.
What is the MINIMUM number of nodes in an AVL tree of height h = 4?''',
    options: [],
    correctAnswer: '''12''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Let N(h) be the minimum number of nodes in an AVL tree of height h:
Base cases:
h = 0: N(0) = 1 (single node).
h = 1: N(1) = 2 (root with one child).
Recurrence relation for minimum nodes:
N(h) = N(h - 1) + N(h - 2) + 1.
For h = 2: N(2) = N(1) + N(0) + 1 = 2 + 1 + 1 = 4.
For h = 3: N(3) = N(2) + N(1) + 1 = 4 + 2 + 1 = 7.
For h = 4: N(4) = N(3) + N(2) + 1 = 7 + 4 + 1 = 12.
The minimum number of nodes is 12.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_23',
    year: 2026,
    subject: '''Data Structures & Algorithms''',
    topic: '''Strongly Connected Components''',
    questionText: '''Which of the following statements regarding Strongly Connected Components (SCCs) in directed graphs is/are TRUE? (Select all that apply)''',
    options: ['''The component graph (condensation graph) obtained by contracting each SCC into a single super-vertex is always a Directed Acyclic Graph (DAG).''', '''Kosaraju's algorithm computes all SCCs of a directed graph G = (V, E) in O(V + E) time using two Depth-First Search (DFS) traversals.''', '''Tarjan's SCC algorithm requires two separate passes of DFS and an explicit graph transposition G^T.''', '''Adding a single directed edge to a directed graph can never decrease the total number of SCCs.'''],
    correctAnswer: '''A;B''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: If the condensation graph had a cycle, all SCCs on that cycle would mutually reach each other, merging into a single larger SCC.
B is TRUE: Kosaraju's algorithm runs DFS on G to compute finish times, transposes G, and runs DFS on G^T in decreasing order of finish times in O(V + E).
C is FALSE: Tarjan's algorithm finds SCCs in a SINGLE pass of DFS using low-link values and a stack without transposing the graph.
D is FALSE: Adding a single directed edge can connect two or more previously separate SCCs into a cycle, thereby DECREASING the total number of SCCs.
Thus A and B are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_24',
    year: 2026,
    subject: '''Programming & Python''',
    topic: '''Generator Exhaustion''',
    questionText: '''Consider the following Python code snippet:
gen = (x**2 for x in range(3))
list_1 = list(gen)
list_2 = list(gen)
print(len(list_1), len(list_2))

What does the print statement output?''',
    options: ['''3 3''', '''3 0''', '''0 3''', '''0 0'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''In Python, `(x**2 for x in range(3))` creates a generator object.
Generators are single-use iterators. When `list(gen)` is called the first time, it iterates through the generator until exhaustion (`StopIteration`), yielding [0, 1, 4] with length 3.
When `list(gen)` is called the second time, the generator is already exhausted, yielding an empty list `[]` with length 0.
Therefore, `len(list_1)` is 3 and `len(list_2)` is 0. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_25',
    year: 2026,
    subject: '''Database Management Systems''',
    topic: '''Lossless Join Decomposition''',
    questionText: '''Consider relational schema R(A, B, C, D) with functional dependencies:
F = { A -> B, B -> C }
Decomposition D = { R1(A, B), R2(B, C, D) } is:''',
    options: ['''Lossless-join and dependency-preserving''', '''Lossy-join and dependency-preserving''', '''Lossless-join and NOT dependency-preserving''', '''Lossy-join and NOT dependency-preserving'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''To test for lossless join:
R1 ∩ R2 = {B}.
R1 - R2 = {A}.
R2 - R1 = {C, D}.
A decomposition into (R1, R2) is lossless if and only if (R1 ∩ R2) -> (R1 - R2) OR (R1 ∩ R2) -> (R2 - R1).
Here R1 ∩ R2 = {B}.
Closure of B under F: B^+ = {B, C}.
Notice:
B^+ does not contain A (so B -> A is FALSE).
B^+ does not contain D (so B -> {C, D} is FALSE).
Since {B} functionally determines neither (R1 - R2) nor (R2 - R1), the decomposition is LOSSY (not lossless).
Dependencies: A -> B is in R1, B -> C is in R2. All FDs in F are preserved.
Thus, the decomposition is Lossy-join and dependency-preserving. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_26',
    year: 2026,
    subject: '''Database Management Systems''',
    topic: '''Fourth Normal Form and MVD''',
    questionText: '''A relational schema R(Course, Teacher, Textbook) has the constraint that each course can be taught by multiple teachers and uses a fixed set of textbooks independent of the teacher who teaches it.
This implies the non-trivial multivalued dependencies Course ->-> Teacher and Course ->-> Textbook.
If the only candidate key of R is (Course, Teacher, Textbook), what is the highest normal form satisfied by R?''',
    options: ['''First Normal Form (1NF)''', '''Second Normal Form (2NF)''', '''Boyce-Codd Normal Form (BCNF)''', '''Fourth Normal Form (4NF)'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Since the only candidate key is all three attributes (Course, Teacher, Textbook), there are no non-trivial functional dependencies where LHS is not a superkey. Thus R trivially satisfies 1NF, 2NF, 3NF, and BCNF.
However, R contains the non-trivial multivalued dependency Course ->-> Teacher.
For R to be in 4NF, for every non-trivial MVD X ->-> Y, X must be a superkey of R.
Here, Course is NOT a superkey.
Therefore, R violates 4NF.
The highest normal form satisfied by R is BCNF. Option C is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_27',
    year: 2026,
    subject: '''Database Management Systems''',
    topic: '''Timestamp Ordering and Thomas Write Rule''',
    questionText: '''Which of the following statements regarding concurrency control protocols is/are TRUE? (Select all that apply)''',
    options: ['''The Basic Timestamp Ordering protocol generates schedules that are conflict serializable and free from deadlocks.''', '''Thomas' Write Rule relaxes the basic timestamp ordering protocol by ignoring outdated write operations (W_i(Q) where TS(T_i) < W-timestamp(Q)), allowing non-conflict serializable schedules that are nevertheless view serializable.''', '''In Multi-Version Timestamp Ordering (MVTO), a read operation R_i(Q) is never rejected (aborted).''', '''Strict 2PL produces schedules that are view serializable but never conflict serializable.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: In Basic Timestamp Ordering, transactions are ordered strictly by their arrival timestamp. Older transactions take precedence; aborting and restarting violators prevents waiting, ensuring deadlock freedom.
B is TRUE: Thomas' Write Rule detects that a write is obsolete because a newer value has already been written. Silently ignoring this write generates schedules that are view serializable even if not conflict serializable.
C is TRUE: In MVTO, an older version Q_k with W-timestamp <= TS(T_i) always exists, so read operations never abort.
D is FALSE: Strict 2PL is a variant of 2PL, so it strictly guarantees conflict serializability.
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_28',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Evaluation Metrics and Class Imbalance''',
    questionText: '''In a medical diagnostics dataset where positive cases (disease present) account for only 0.1% of all instances:''',
    options: ['''ROC-AUC is more informative than Precision-Recall AUC (PR-AUC) because False Positive Rate reflects class imbalance directly.''', '''PR-AUC is much more informative than ROC-AUC because the False Positive Rate denominator in ROC includes the overwhelming number of true negatives, artificially inflating the ROC-AUC score.''', '''Accuracy is the most reliable metric because a naive baseline achieves 99.9% accuracy.''', '''Precision and Recall are both mathematically invariant to changes in class prevalence.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''FPR = FP / (FP + TN). When TN is massive (99.9% negative), even hundreds of false positives yield a tiny FPR, making the ROC curve look deceptively outstanding.
In contrast, Precision = TP / (TP + FP) depends directly on FP without dilution by TN. PR-AUC reveals the true performance on the rare positive class. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_29',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Shannon Entropy Calculation''',
    questionText: '''A discrete random variable X takes on three values with probability distribution p = [0.5, 0.25, 0.25].
The Shannon Entropy H(X) = - sum_{i} p_i * log_2(p_i) is ________ bits. (Round off to 1 decimal place).''',
    options: [],
    correctAnswer: '''1.5''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''H(X) = - [ p_1 * log_2(p_1) + p_2 * log_2(p_2) + p_3 * log_2(p_3) ]
p_1 = 0.5  =>  log_2(0.5) = -1.
p_2 = 0.25 =>  log_2(0.25) = -2.
p_3 = 0.25 =>  log_2(0.25) = -2.
H(X) = - [ 0.5 * (-1) + 0.25 * (-2) + 0.25 * (-2) ]
     = - [ -0.5 - 0.5 - 0.5 ] = 1.5 bits.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_30',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''AdaBoost Algorithm Mechanics''',
    questionText: '''Which of the following statements regarding the discrete AdaBoost algorithm is/are TRUE? (Select all that apply)''',
    options: ['''At each boosting round t, the weight of base classifier h_t is given by alpha_t = (1/2) * ln((1 - epsilon_t) / epsilon_t), where epsilon_t is the weighted training error.''', '''Data points misclassified by weak learner h_t have their sample weights increased for round t + 1 by a factor of exp(alpha_t).''', '''Data points correctly classified by weak learner h_t have their sample weights decreased for round t + 1 by a factor of exp(-alpha_t).''', '''AdaBoost requires the weak learner to achieve training accuracy strictly greater than 90% at every iteration.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: alpha_t = 0.5 * ln((1 - epsilon_t) / epsilon_t) is the standard AdaBoost estimator weight.
B is TRUE: Weight update rule is w_{t+1, i} = w_{t, i} * exp(-alpha_t * y_i * h_t(x_i)) / Z_t. For misclassified points (y_i != h_t(x_i)), y_i * h_t(x_i) = -1, multiplying by exp(+alpha_t).
C is TRUE: For correctly classified points, y_i * h_t(x_i) = +1, multiplying by exp(-alpha_t).
D is FALSE: AdaBoost only requires the weak learner to perform slightly better than random guessing (epsilon_t < 0.5, i.e., > 50% accuracy).
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_31',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Kernel PCA Centering Matrix''',
    questionText: '''In Kernel Principal Component Analysis (Kernel PCA) on N data points, let K be the N x N uncentered Gram matrix with K_{ij} = k(x_i, x_j). The centered Gram matrix K_c corresponding to feature vectors with zero mean in Hilbert space is given by:''',
    options: ['''K_c = H * K * H, where H = I_N - (1/N) * 1 * 1^T''', '''K_c = K - (1/N) * I_N''', '''K_c = H * K^(-1) * H''', '''K_c = K * (I_N - 1 * 1^T)'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Let phi(x_i) be the mapped feature vectors. Centering in feature space requires replacing phi(x_i) with phi_c(x_i) = phi(x_i) - (1/N) sum_j phi(x_j).
In terms of the Gram matrix K = Phi^T Phi:
K_c = (Phi * H)^T (Phi * H) = H * Phi^T Phi * H = H * K * H,
where H = I_N - (1/N) * 1_N * 1_N^T is the symmetric, idempotent centering matrix. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_32',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''Beam Search State Retention''',
    questionText: '''Beam search is executed on a uniform search tree with branching factor b = 5 and beam width (beam size) k = 3.
At depth d = 4 (where the root is at depth 0), how many candidate search nodes are retained in memory for expansion into depth 5?''',
    options: [],
    correctAnswer: '''3''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Beam search is a heuristic search algorithm that explores a graph by expanding the most promising nodes in a limited set.
Unlike Breadth-First Search (which expands all b^d nodes), Beam search prunes all but the best k nodes at each depth level.
Regardless of the depth d >= 1, Beam search retains exactly k candidate nodes in its beam at each step.
Given beam width k = 3, exactly 3 nodes are retained in memory at depth 4.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_33',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''Horn Clauses and Inference''',
    questionText: '''Which of the following statements regarding Horn clauses and logical inference is/are TRUE? (Select all that apply)''',
    options: ['''A Horn clause is a disjunction of literals containing at most one positive (unnegated) literal.''', '''Forward chaining on a knowledge base of propositional Horn clauses runs in linear time O(n) with respect to the size of the knowledge base.''', '''Forward chaining and backward chaining are both sound and complete for Horn clause knowledge bases.''', '''Every arbitrary propositional logic formula can be represented as an equivalent single Horn clause.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: Definition of a Horn clause: at most one positive literal (~P or ~Q or R, equivalent to (P and Q) -> R).
B is TRUE: Dowling and Gallier (1984) proved that propositional Horn clause satisfiability and forward chaining runs in linear O(n) time.
C is TRUE: For definite Horn clauses, forward and backward chaining are both sound and complete.
D is FALSE: Many formulas cannot be represented as Horn clauses (e.g., P or Q, which has two positive literals).
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_34',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''Arc Consistency Complexity''',
    questionText: '''In Constraint Satisfaction Problems (CSPs), let c be the number of binary constraints and d be the maximum domain size of any variable. The worst-case time complexity of the AC-3 (Arc Consistency Algorithm #3) is:''',
    options: ['''O(c * d^2)''', '''O(c * d^3)''', '''O(c^2 * d)''', '''O(d^c)'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''In AC-3:
There are 2c directed arcs in the initial queue.
Each arc (X_k, X_m) can be inserted into the queue at most d times, because variable X_m has at most d values to remove from its domain.
Checking consistency of an arc takes O(d^2) time (for each value in X_k, scan up to d values in X_m).
Total worst-case time complexity = (2c * d) * O(d^2) = O(c * d^3).
Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_35',
    year: 2026,
    subject: '''Probability & Statistics''',
    topic: '''Bayes False Discovery Rate''',
    questionText: '''In high-throughput genomic testing, 1000 genes are tested for differential expression.
Suppose 100 genes are truly differentially expressed (True Signals), and 900 genes are inactive (Null Noise).
A statistical test has:
- True Positive Rate (Statistical Power) = 0.90
- False Positive Rate (Type I Error alpha) = 0.05
Out of all genes that test positive, what is the False Discovery Rate (FDR), defined as the proportion of false positives among all positive discoveries? (Round off to 3 decimal places).''',
    options: [],
    correctAnswer: '''0.333''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Number of truly active genes = 100.
Expected True Positives (TP) = 100 * 0.90 = 90.
Number of truly inactive genes = 900.
Expected False Positives (FP) = 900 * 0.05 = 45.
Total Positive Discoveries = TP + FP = 90 + 45 = 135.
False Discovery Rate (FDR) = FP / (TP + FP) = 45 / 135 = 1 / 3 approx 0.3333...
Rounding to 3 decimal places gives 0.333.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_36',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Cholesky Factorization''',
    questionText: '''Consider the symmetric positive definite matrix:
A = [[4, 6],
     [6, 25]]
The Cholesky factorization of A is A = L * L^T, where L is a lower-triangular matrix with strictly positive diagonal elements:
L = [[l_11,    0],
     [l_21, l_22]]
The trace of the lower-triangular Cholesky factor matrix L (i.e., l_11 + l_22) is equal to ________. (Answer as an integer).''',
    options: [],
    correctAnswer: '''6''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''By Cholesky factorization A = L * L^T:
[[l_11, 0], [l_21, l_22]] * [[l_11, l_21], [0, l_22]] = [[l_11^2, l_11*l_21], [l_21*l_11, l_21^2 + l_22^2]]
Equating entries with A = [[4, 6], [6, 25]]:
1. l_11^2 = 4  =>  l_11 = 2 (since diagonal entries must be positive).
2. l_11 * l_21 = 6  =>  2 * l_21 = 6  =>  l_21 = 3.
3. l_21^2 + l_22^2 = 25  =>  3^2 + l_22^2 = 25  =>  9 + l_22^2 = 25  =>  l_22^2 = 16  =>  l_22 = 4.
Thus, L = [[2, 0], [3, 4]].
The trace of L is l_11 + l_22 = 2 + 4 = 6.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_37',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Singular Value Decomposition and Condition Number''',
    questionText: '''Let A be an m x n real matrix with rank r = min(m, n), and let sigma_1 >= sigma_2 >= ... >= sigma_r > 0 be its non-zero singular values. Which of the following statements is/are TRUE? (Select all that apply)''',
    options: ['''The 2-norm (spectral norm) of matrix A is ||A||_2 = sigma_1.''', '''The condition number of matrix A with respect to the 2-norm is kappa_2(A) = sigma_1 / sigma_r.''', '''If m < n and A has full row rank m, the minimum Euclidean norm solution to the underdetermined linear system A x = b is given by x* = A^T (A A^T)^(-1) b.''', '''The Frobenius norm of A satisfies ||A||_F = sum_{j=1}^r sigma_j.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: ||A||_2 = max_{x != 0} ||Ax||_2 / ||x||_2 = sigma_max = sigma_1.
B is TRUE: kappa_2(A) = ||A||_2 * ||A^+||_2 = sigma_1 * (1 / sigma_r) = sigma_1 / sigma_r.
C is TRUE: For underdetermined system with full row rank, the Moore-Penrose pseudoinverse is A^+ = A^T (A A^T)^(-1), which uniquely yields the minimum norm solution x* = A^+ b.
D is FALSE: ||A||_F = sqrt(sum_{j=1}^r sigma_j^2), which is the square root of the sum of squared singular values, NOT the simple sum (the simple sum is the nuclear norm ||A||_*).
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_38',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Jordan Canonical Form and Multiplicities''',
    questionText: '''Let A be a 4 x 4 real matrix whose characteristic polynomial is p(lambda) = (lambda - 2)^4 and whose minimal polynomial is m(lambda) = (lambda - 2)^2. If the geometric multiplicity of the eigenvalue lambda = 2 is equal to 2, what are the sizes of the Jordan blocks in the Jordan Canonical Form of A?''',
    options: ['''One block of size 4''', '''Two blocks of sizes 2 and 2''', '''Two blocks of sizes 3 and 1''', '''Four blocks of size 1 each'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Properties of the Jordan Canonical Form:
1. The number of Jordan blocks corresponding to eigenvalue lambda = 2 equals the geometric multiplicity of lambda, which is given as 2. Thus, there are exactly 2 Jordan blocks.
2. The size of the largest Jordan block corresponding to lambda equals the degree of (lambda - 2) in the minimal polynomial m(lambda), which is 2.
3. The sum of the sizes of all Jordan blocks equals the algebraic multiplicity, which is 4.
With 2 blocks, maximum block size 2, and sum of sizes = 4:
The only possible sizes are 2 and 2 (since 3 and 1 would require a block of size 3, violating the minimal polynomial degree of 2).
Therefore, A has two Jordan blocks of size 2 each. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_39',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Volume of Solid of Revolution''',
    questionText: '''The region R in the first quadrant of the xy-plane bounded by the parabola y = x^2 and the line y = 2*x is rotated completely about the y-axis to generate a solid of revolution.
The volume of this solid is V = k * pi. What is the value of k? (Round off to 2 decimal places).''',
    options: [],
    correctAnswer: '''2.67''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Points of intersection:
x^2 = 2x  =>  x(x - 2) = 0  =>  x = 0 and x = 2.
For 0 <= x <= 2, the upper curve is y = 2x and the lower curve is y = x^2.
Using the method of cylindrical shells:
Radius of shell = x.
Height of shell = (2x - x^2).
Volume V = 2 * pi * int_0^2 x * (2x - x^2) dx
         = 2 * pi * int_0^2 (2x^2 - x^3) dx
         = 2 * pi * [ (2/3) x^3 - (1/4) x^4 ]_0^2
         = 2 * pi * [ (2/3)(8) - (1/4)(16) ]
         = 2 * pi * [ 16/3 - 4 ]
         = 2 * pi * [ 4/3 ] = (8/3) * pi approx 2.6666... * pi.
The constant k is 8/3 approx 2.67.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_40',
    year: 2026,
    subject: '''Optimization''',
    topic: '''Linear Programming Strong Duality''',
    questionText: '''Consider the primal Linear Program:
Maximize Z = 3*x1 + 2*x2
subject to:
x1 + x2 <= 4
2*x1 + x2 <= 6
x1 >= 0, x2 >= 0
By the Strong Duality Theorem, what is the optimal objective value of the Dual Linear Program? (Answer as an integer).''',
    options: [],
    correctAnswer: '''10''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''By Strong Duality, if a primal LP has an optimal solution, its dual also has an optimal solution and the optimal values are identical: Z_primal* = W_dual*.
Let us solve the primal LP graphically:
Corner points of feasible region:
1. (0, 0): Z = 0
2. (3, 0) [x-intercept of 2*x1 + x2 = 6]: Z = 3(3) + 2(0) = 9
3. (0, 4) [y-intercept of x1 + x2 = 4]: Z = 3(0) + 2(4) = 8
4. Intersection of x1 + x2 = 4 and 2*x1 + x2 = 6:
   Subtracting equations gives x1 = 2.
   Then x2 = 4 - 2 = 2.
   Z = 3(2) + 2(2) = 6 + 4 = 10.
The maximum primal objective value is 10.
By Strong Duality, the optimal objective value of the dual program is also exactly 10.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_41',
    year: 2026,
    subject: '''Optimization''',
    topic: '''Proximal Gradient and Soft Thresholding''',
    questionText: '''Consider the Lasso objective function f(x) = g(x) + lambda * ||x||_1, where g(x) = (1/2) * ||A x - b||_2^2 is smooth with Lipschitz continuous gradient, and ||x||_1 = sum_i |x_i| is non-smooth.
Which of the following statements regarding Proximal Gradient Descent (Iterative Soft-Thresholding Algorithm, ISTA) is/are TRUE? (Select all that apply)''',
    options: ['''The proximal operator of the L1 norm regularization term is the elementwise Soft-Thresholding operator S_t(v)_i = sign(v_i) * max(|v_i| - t, 0).''', '''Each iteration of ISTA updates x as x_{k+1} = S_{eta*lambda}(x_k - eta * grad g(x_k)), where eta is the step size.''', '''If step size eta <= 1 / L (where L is the Lipschitz constant of grad g), ISTA achieves an O(1/k) convergence rate on the objective function.''', '''Fast Iterative Soft-Thresholding Algorithm (FISTA) employs Nesterov momentum acceleration to improve the convergence rate to O(1/k^2).'''],
    correctAnswer: '''A;B;C;D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: The proximal operator prox_{t ||.||_1}(v) = argmin_x { 0.5 ||x - v||_2^2 + t ||x||_1 } has closed-form solution given by soft-thresholding S_t(v).
B is TRUE: This is the exact proximal gradient update step for Lasso.
C is TRUE: Standard proximal gradient descent on convex composite objectives achieves O(1/k) convergence rate when eta <= 1/L.
D is TRUE: Beck and Teboulle (2009) introduced FISTA using Nesterov momentum, proving an accelerated convergence rate of O(1/k^2).
All four statements A, B, C, D are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_42',
    year: 2026,
    subject: '''Probability''',
    topic: '''Ratio of Independent Exponential Variables''',
    questionText: '''Let X and Y be independent and identically distributed continuous random variables following an Exponential distribution with rate parameter lambda = 1 (pdf f(t) = e^(-t) for t >= 0).
Let Z = X / Y. What is the probability P(Z <= 3)? (Round off to 2 decimal places).''',
    options: [],
    correctAnswer: '''0.75''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''To find the distribution of Z = X / Y:
P(Z <= z) = P(X / Y <= z) = P(X <= z * Y).
Since X and Y are independent with joint density f_{X,Y}(x, y) = e^(-x) * e^(-y) for x, y >= 0:
P(Z <= z) = int_0^inf [ int_0^{z*y} e^(-x) dx ] e^(-y) dy
          = int_0^inf [ 1 - e^(-z*y) ] e^(-y) dy
          = int_0^inf e^(-y) dy - int_0^inf e^(-(1 + z)y) dy
          = 1 - 1 / (1 + z) = z / (1 + z) for z >= 0.
For z = 3:
P(Z <= 3) = 3 / (1 + 3) = 3 / 4 = 0.75.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_43',
    year: 2026,
    subject: '''Probability''',
    topic: '''Stationary Distribution of Markov Chain''',
    questionText: '''Consider a discrete-time Markov chain with 3 states {1, 2, 3} and transition probability matrix:
P = [[0.5,  0.5,    0],
     [0.25, 0.5, 0.25],
     [0,    0.5,  0.5]]
The stationary probability distribution vector pi = [pi_1, pi_2, pi_3] is:''',
    options: ['''[1/3, 1/3, 1/3]''', '''[1/4, 1/2, 1/4]''', '''[1/5, 3/5, 1/5]''', '''[2/5, 1/5, 2/5]'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The stationary distribution satisfies pi * P = pi and pi_1 + pi_2 + pi_3 = 1.
Writing the equations:
1. pi_1 = 0.5 * pi_1 + 0.25 * pi_2  =>  0.5 * pi_1 = 0.25 * pi_2  =>  pi_2 = 2 * pi_1.
2. pi_3 = 0.25 * pi_2 + 0.5 * pi_3  =>  0.5 * pi_3 = 0.25 * pi_2  =>  pi_2 = 2 * pi_3.
From (1) and (2): pi_1 = pi_3.
Substitute into normalization condition:
pi_1 + pi_2 + pi_3 = pi_1 + 2*pi_1 + pi_1 = 4 * pi_1 = 1.
pi_1 = 1/4.
pi_2 = 2 * (1/4) = 1/2.
pi_3 = 1/4.
Therefore, pi = [1/4, 1/2, 1/4]. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_44',
    year: 2026,
    subject: '''Probability''',
    topic: '''Law of Total Variance''',
    questionText: '''Let Y follow a Poisson distribution with parameter lambda = 4.
Given Y = y, the random variable X follows a Binomial distribution with parameters n = y and p = 0.5 (i.e., X | Y ~ Binomial(Y, 0.5)).
The unconditional variance Var(X) is equal to ________. (Answer as an integer).''',
    options: [],
    correctAnswer: '''2''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''By the Law of Total Variance (Eve's Law):
Var(X) = E[Var(X | Y)] + Var(E[X | Y]).
For X | Y ~ Binomial(Y, p) with p = 0.5:
E[X | Y] = p * Y = 0.5 * Y.
Var(X | Y) = Y * p * (1 - p) = Y * 0.5 * 0.5 = 0.25 * Y.
Now compute the outer expectation and variance, given Y ~ Poisson(4) where E[Y] = 4 and Var(Y) = 4:
1. E[Var(X | Y)] = E[0.25 * Y] = 0.25 * E[Y] = 0.25 * 4 = 1.
2. Var(E[X | Y]) = Var(0.5 * Y) = (0.5)^2 * Var(Y) = 0.25 * 4 = 1.
Therefore:
Var(X) = 1 + 1 = 2.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_45',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Fisher Information Matrix and Regularity''',
    questionText: '''Which of the following statements regarding the Fisher Information I(theta) and the Cramer-Rao Lower Bound (CRLB) is/are TRUE? (Select all that apply)''',
    options: ['''Under standard regularity conditions, Fisher Information can be computed as I(theta) = - E[ d^2/dtheta^2 ln f(X; theta) ].''', '''For a sample of n independent and identically distributed observations, the total Fisher Information is additive: I_n(theta) = n * I_1(theta).''', '''An unbiased estimator whose variance achieves the CRLB is termed an efficient estimator.''', '''The CRLB provides a valid lower bound for estimating parameter theta of the Uniform U[0, theta] distribution.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: Under regularity conditions allowing interchange of differentiation and integration, E[(d/dtheta ln f)^2] = -E[d^2/dtheta^2 ln f].
B is TRUE: For i.i.d. samples, log-likelihood is the sum of individual log-likelihoods, so information scales linearly: I_n(theta) = n * I_1(theta).
C is TRUE: An unbiased estimator achieving CRLB has efficiency 1 and is called an efficient estimator.
D is FALSE: For U[0, theta], the support of the distribution [0, theta] depends on theta, violating the fundamental regularity condition that the support must be independent of theta. Hence CRLB does not apply to U[0, theta].
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_46',
    year: 2026,
    subject: '''Statistics''',
    topic: '''Chi-Square Contingency Table Degrees of Freedom''',
    questionText: '''In a survey analyzing student preference across 4 specialization tracks (Data Science, AI, Systems, Theory) and 3 career aspirations (Industry, Academia, Startup), a chi-square test of independence is conducted on the resulting 4 x 3 contingency table.
What are the degrees of freedom (df) associated with this Chi-Square test statistic?''',
    options: [],
    correctAnswer: '''6''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''For an r x c contingency table testing independence between two categorical variables:
Degrees of freedom df = (r - 1) * (c - 1).
Here:
Number of rows r = 4.
Number of columns c = 3.
df = (4 - 1) * (3 - 1) = 3 * 2 = 6.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_47',
    year: 2026,
    subject: '''Data Structures & Algorithms''',
    topic: '''Edit Distance Dynamic Programming''',
    questionText: '''Consider computing the Levenshtein Edit Distance between string S1 = "GATE" and string S2 = "DATA" where the allowed operations are Insertion, Deletion, and Substitution, each with unit cost 1.
What is the MINIMUM edit distance to transform "GATE" into "DATA"?''',
    options: ['''1''', '''2''', '''3''', '''4'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Let us trace the optimal alignment between "GATE" and "DATA":
Position 1: 'G' -> 'D' (Substitute 'G' with 'D', cost = 1). String becomes "DATE".
Position 2: 'A' == 'A' (Match, cost = 0).
Position 3: 'T' == 'T' (Match, cost = 0).
Position 4: 'E' -> 'A' (Substitute 'E' with 'A', cost = 1). String becomes "DATA".
Total cost = 1 + 0 + 0 + 1 = 2 operations.
No sequence of 1 operation can transform "GATE" to "DATA" (they differ in both the 1st and 4th characters).
Minimum edit distance = 2. Option B is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_48',
    year: 2026,
    subject: '''Data Structures & Algorithms''',
    topic: '''Max Flow Min Cut Theorem''',
    questionText: '''In a flow network, Source S and Sink T are separated by a cut (S_cut, T_cut) where S in S_cut and T in T_cut.
The directed edges crossing from S_cut to T_cut have capacities: c(A, D) = 6, c(B, D) = 5, and c(B, E) = 3.
There is also a directed edge crossing backward from T_cut to S_cut with capacity c(D, C) = 4.
What is the capacity of this cut (S_cut, T_cut)?''',
    options: [],
    correctAnswer: '''14''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''By definition, the capacity of a cut (S_cut, T_cut) is the sum of capacities of all directed edges going forward from S_cut to T_cut:
Capacity(S_cut, T_cut) = sum_{u in S_cut, v in T_cut} c(u, v).
Edges crossing forward from S_cut to T_cut:
- c(A, D) = 6
- c(B, D) = 5
- c(B, E) = 3
Edges crossing backward from T_cut to S_cut (such as (D, C)) are NOT included in the cut capacity by definition.
Capacity = 6 + 5 + 3 = 14.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_49',
    year: 2026,
    subject: '''Data Structures & Algorithms''',
    topic: '''Balanced Search Trees Structural Invariants''',
    questionText: '''Which of the following statements comparing AVL Trees and Red-Black Trees is/are TRUE? (Select all that apply)''',
    options: ['''AVL trees are more strictly balanced than Red-Black trees, providing faster lookup times in read-heavy workloads.''', '''Inserting a key into a Red-Black tree requires at most 2 tree rotations in the worst case.''', '''Deleting a node from a Red-Black tree requires at most 3 tree rotations in the worst case.''', '''The maximum possible height of a Red-Black tree with n internal nodes is strictly bounded by 2 * log_2(n + 1).'''],
    correctAnswer: '''A;B;C;D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: AVL balance factor is strictly within {-1, 0, 1}, limiting height to approx 1.44 log_2 n, compared to 2 log_2 n for Red-Black, making search faster.
B is TRUE: A Red-Black tree insertion requires at most 2 rotations to restore properties (though color flips may propagate up).
C is TRUE: Deleting a node from a Red-Black tree requires at most 3 rotations.
D is TRUE: Because every path from root to leaf has the same number of black nodes, and red nodes cannot have red children, height <= 2 * log_2(n + 1).
All four statements A, B, C, D are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_50',
    year: 2026,
    subject: '''Programming & Python''',
    topic: '''Descriptor Protocol Resolution Order''',
    questionText: '''In Python's attribute lookup protocol:
A class attribute is a "data descriptor" if it defines `__set__` or `__delete__`.
It is a "non-data descriptor" if it defines only `__get__`.
When accessing `obj.attr`, what is the precedence order between a data descriptor, an instance dictionary entry `obj.__dict__['attr']`, and a non-data descriptor?''',
    options: ['''Data descriptor > obj.__dict__ > Non-data descriptor''', '''obj.__dict__ > Data descriptor > Non-data descriptor''', '''Non-data descriptor > obj.__dict__ > Data descriptor''', '''obj.__dict__ > Non-data descriptor > Data descriptor'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Python's attribute lookup order for an instance `obj` of class `Cls`:
1. If `attr` is found in `Cls.__mro__` and is a DATA DESCRIPTOR (defines `__set__` or `__delete__`), Python calls `Cls.__dict__['attr'].__get__(obj, Cls)`. It overrides `obj.__dict__`.
2. Otherwise, if `attr` is in `obj.__dict__`, Python returns `obj.__dict__['attr']`.
3. Otherwise, if `attr` is found in `Cls.__mro__` and is a NON-DATA DESCRIPTOR, Python calls its `__get__`.
4. Otherwise, regular class attribute from `Cls.__mro__`.
5. Finally, fallback to `__getattr__`.
Thus: Data descriptor > obj.__dict__ > Non-data descriptor. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_51',
    year: 2026,
    subject: '''Database Management Systems''',
    topic: '''Block Nested Loop Join IO Cost''',
    questionText: '''Consider evaluating the natural join R ⋈ S using the Block Nested-Loop Join algorithm:
- Relation R (outer relation): B(R) = 1,000 disk blocks
- Relation S (inner relation): B(S) = 10,000 disk blocks
- Total memory buffer available for join: M = 52 blocks
  (50 blocks allocated for buffering outer relation R, 1 block for inner relation S, 1 block for output buffer).
Assuming the output buffer writes do not count towards join comparison I/O, what is the TOTAL number of disk block transfers required?''',
    options: [],
    correctAnswer: '''201000''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''In Block Nested-Loop Join with M - 2 = 50 blocks allocated for buffering chunks of outer relation R:
Number of chunks (passes) of relation R = ceil(B(R) / (M - 2)) = ceil(1000 / 50) = 20 chunks.
For each chunk of R:
- The chunk of R is read once: 50 blocks. Over all 20 chunks, total reads of R = 20 * 50 = 1000 blocks (i.e., B(R)).
- For each chunk of R, the entire inner relation S must be scanned: B(S) = 10,000 blocks.
Total disk block transfers:
Total I/O = B(R) + (Number of chunks of R) * B(S)
          = 1000 + 20 * 10,000
          = 1000 + 200,000 = 201,000 blocks.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_52',
    year: 2026,
    subject: '''Database Management Systems''',
    topic: '''Snapshot Isolation and Anomalies''',
    questionText: '''Which of the following statements regarding ANSI SQL Isolation Levels and Snapshot Isolation is/are TRUE? (Select all that apply)''',
    options: ['''Under Snapshot Isolation, each transaction reads from a private snapshot of the database taken at transaction start time, guaranteeing freedom from Dirty Reads, Non-Repeatable Reads, and Phantoms.''', '''Snapshot Isolation is susceptible to the Write Skew anomaly, meaning it is not strictly equivalent to Serializable isolation.''', '''Predicate locking (or Serializable Snapshot Isolation / SSI) can prevent Write Skew and ensure true serializability.''', '''Under Read Committed isolation, repeated executions of the exact same SELECT query within a single transaction are guaranteed to return identical results.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: Snapshot Isolation uses Multi-Version Concurrency Control (MVCC) where reads see consistent committed snapshots, preventing dirty reads, non-repeatable reads, and phantom rows.
B is TRUE: Berenson et al. (1995) showed that Snapshot Isolation permits "Write Skew" (e.g., two on-call doctors simultaneously withdrawing under constraint that at least one remains), which violates serializability.
C is TRUE: SSI tracks read-write dependencies across concurrent transactions and aborts cycles to achieve true conflict serializability.
D is FALSE: Read Committed allows "Non-Repeatable Reads": if T1 reads row X, then T2 updates X and commits, T1 reading X again will see the new value.
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_53',
    year: 2026,
    subject: '''Database Management Systems''',
    topic: '''Relational Algebra Antijoin Equivalence''',
    questionText: '''In Relational Algebra, let R and S be two relations. The Semiminus (Antijoin) operator, denoted R ▷ S, returns tuples in R that do NOT have a match in S under the common join attributes.
Which of the following relational algebra expressions is strictly EQUIVALENT to R ▷ S?''',
    options: ['''R - (R ⋉ S), where ⋉ denotes the natural semijoin''', '''R ∩ S''', '''pi_R(R ⋈ S)''', '''R U (R ⋈ S)'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''The natural semijoin R ⋉ S is defined as pi_R(R ⋈ S), which yields all tuples in R that participate in the join with S (i.e., those that have at least one matching tuple in S).
The antijoin R ▷ S consists of all tuples in R that do NOT join with S.
Therefore, taking the set difference between the full relation R and the semijoin R ⋉ S gives:
R ▷ S = R - (R ⋉ S). Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_54',
    year: 2026,
    subject: '''Database Management Systems''',
    topic: '''SQL Window Functions Dense Rank''',
    questionText: '''Consider a table Employee(DeptId INT, Salary INT) containing the following tuples for DeptId = 1:
(1, 5000), (1, 7000), (1, 7000), (1, 6000), (1, 4000).
A query executes:
SELECT Salary, DENSE_RANK() OVER (ORDER BY Salary DESC) as rnk FROM Employee WHERE DeptId = 1;
What is the value of rnk assigned to the tuple with Salary = 4000?''',
    options: [],
    correctAnswer: '''4''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Let us order the distinct salaries in descending order:
1. Highest salary: 7000. DENSE_RANK = 1. (Occurs twice, both get rnk = 1).
2. Next distinct salary: 6000. DENSE_RANK = 2.
3. Next distinct salary: 5000. DENSE_RANK = 3.
4. Next distinct salary: 4000. DENSE_RANK = 4.
Note the distinction:
- Under standard RANK(): 7000 gets 1, 7000 gets 1, 6000 gets 3, 5000 gets 4, 4000 gets 5.
- Under DENSE_RANK(): ranks do not skip upon ties. Ranks assigned are 1, 1, 2, 3, 4.
Thus, Salary = 4000 receives DENSE_RANK = 4.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_55',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Polynomial Kernel Evaluation''',
    questionText: '''Let x = [1, 2]^T and z = [2, 1]^T be two feature vectors in R^2.
Consider the inhomogeneous polynomial kernel function of degree d = 2:
K(x, z) = (x^T z + 1)^2
The scalar value of the kernel evaluation K(x, z) is equal to ________. (Answer as an integer).''',
    options: [],
    correctAnswer: '''25''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''First compute the inner product of x and z:
x^T z = (1 * 2) + (2 * 1) = 2 + 2 = 4.
Now evaluate the polynomial kernel:
K(x, z) = (x^T z + 1)^2 = (4 + 1)^2 = 5^2 = 25.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_56',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Vapnik Chervonenkis VC Dimension''',
    questionText: '''Which of the following statements regarding the Vapnik-Chervonenkis (VC) Dimension of hypothesis classes is/are TRUE? (Select all that apply)''',
    options: ['''The VC dimension of the hypothesis class of closed intervals [a, b] on the real line R is equal to 2.''', '''The VC dimension of linear halfspaces (hyperplanes) in R^d is equal to d + 1.''', '''The VC dimension of axis-aligned rectangles in R^2 is equal to 4.''', '''A hypothesis class with infinite VC dimension (VCdim = infinity) can never shatter any finite set of points.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: Closed intervals [a, b] can shatter any 2 points (+ -, - +, ++, --). For 3 points in a line, the alternating pattern (+ - +) cannot be captured by a single interval, so VCdim = 2.
B is TRUE: A hyperplane in R^d has d + 1 parameters (including bias) and can shatter at most d + 1 points in general position.
C is TRUE: 4 points forming a cross can be shattered by axis-aligned rectangles. Any set of 5 points has an extreme bounding box where the 5th point is internal, preventing shattering. VCdim = 4.
D is FALSE: If VCdim = infinity, it means for EVERY integer n, there exists a set of n points that CAN be shattered (e.g., f(x) = sign(sin(alpha * x))).
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_57',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Naive Bayes Posterior Probability''',
    questionText: '''A Naive Bayes classifier is trained for binary text classification between classes C1 (Spam) and C2 (Ham):
Prior probabilities: P(C1) = 0.6, P(C2) = 0.4.
A message containing two independent words (w1, w2) is received with likelihoods:
- P(w1 | C1) = 0.4, P(w2 | C1) = 0.2
- P(w1 | C2) = 0.1, P(w2 | C2) = 0.2
Using Bayes' rule, what is the posterior probability P(C1 | w1, w2)? (Round off to 3 decimal places).''',
    options: [],
    correctAnswer: '''0.857''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Under conditional independence assumption of Naive Bayes:
P(w1, w2 | C1) = P(w1 | C1) * P(w2 | C1) = 0.4 * 0.2 = 0.08.
P(w1, w2 | C2) = P(w1 | C2) * P(w2 | C2) = 0.1 * 0.2 = 0.02.

Joint probabilities:
P(C1, w1, w2) = P(w1, w2 | C1) * P(C1) = 0.08 * 0.6 = 0.048.
P(C2, w1, w2) = P(w1, w2 | C2) * P(C2) = 0.02 * 0.4 = 0.008.

Total marginal probability:
P(w1, w2) = 0.048 + 0.008 = 0.056.

Posterior probability:
P(C1 | w1, w2) = 0.048 / 0.056 = 48 / 56 = 6 / 7 approx 0.85714...
Rounding to 3 decimal places yields 0.857.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_58',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''Expectation Maximization Convergence''',
    questionText: '''In the Expectation-Maximization (EM) algorithm for latent variable models with observed data X and hidden variables Z:
Let L(theta) = ln P(X | theta) be the observed data log-likelihood, and let ELBO(q, theta) = E_q[ln P(X, Z | theta)] - E_q[ln q(Z)] be the Evidence Lower Bound.
Which of the following guarantees holds at every iteration of the EM algorithm?''',
    options: ['''L(theta_{t+1}) >= L(theta_t) (The observed log-likelihood is monotonically non-decreasing).''', '''EM is guaranteed to converge to the global maximum of L(theta).''', '''The E-step minimizes the ELBO with respect to q(Z).''', '''The M-step sets q(Z) equal to the prior distribution P(Z).'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''By Jensen's Inequality, L(theta) = ELBO(q, theta) + KL(q(Z) || P(Z | X, theta)) >= ELBO(q, theta).
1. E-step sets q_{t+1}(Z) = P(Z | X, theta_t), which drives the KL divergence to 0, making ELBO(q_{t+1}, theta_t) = L(theta_t).
2. M-step maximizes ELBO with respect to theta: theta_{t+1} = argmax_theta ELBO(q_{t+1}, theta) >= ELBO(q_{t+1}, theta_t) = L(theta_t).
Since L(theta_{t+1}) >= ELBO(q_{t+1}, theta_{t+1}) >= L(theta_t), the log-likelihood is guaranteed to be monotonically non-decreasing at every iteration.
Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_59',
    year: 2026,
    subject: '''Machine Learning''',
    topic: '''CNN Receptive Field and Dilated Convolutions''',
    questionText: '''Which of the following statements regarding Convolutional Neural Network (CNN) architectures is/are TRUE? (Select all that apply)''',
    options: ['''Applying two consecutive 3 x 3 convolutional layers with stride 1 (and no pooling) results in an effective receptive field of 5 x 5.''', '''A 1D dilated convolution with kernel size k = 3 and dilation rate d = 2 has an effective receptive field size of 5.''', '''A 1 x 1 convolution (Network-in-Network) can alter the number of feature channels while preserving spatial height and width.''', '''Depthwise separable convolution reduces computational multiply-accumulate operations compared to standard 2D convolution.'''],
    correctAnswer: '''A;B;C;D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: Layer 1 has RF = 3. Layer 2 adds (3 - 1) * 1 = 2 to RF, giving 3 + 2 = 5 x 5.
B is TRUE: Effective kernel size of dilated convolution is k' = k + (k - 1)*(d - 1) = 3 + 2*(1) = 5.
C is TRUE: 1 x 1 conv acts as a cross-channel linear combination, changing channels from C_in to C_out without changing spatial dimensions.
D is TRUE: Separating into depthwise (per-channel spatial filtering) and pointwise (1x1 cross-channel combination) reduces computation by approx 1/N + 1/k^2 (Howard et al., MobileNets).
All four statements A, B, C, D are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_60',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''Alpha-Beta Pruning Traced Branches''',
    questionText: '''Consider a game tree where Root is MAX at depth 0, children at depth 1 are MIN nodes M1 and M2, and leaves at depth 2 are evaluated from left to right.
- Under M1: 3 leaves with values [5, 8, 3]
- Under M2: 3 leaves with values [2, 10, 7]
Assuming left-to-right Alpha-Beta pruning, how many leaf nodes are PRUNED (skipped without evaluation)?''',
    options: [],
    correctAnswer: '''2''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Root is MAX (alpha = -inf, beta = +inf).
1. Visit first child M1 (MIN node, alpha = -inf, beta = +inf):
   - Leaf 1: value = 5. beta = min(+inf, 5) = 5.
   - Leaf 2: value = 8. beta = min(5, 8) = 5.
   - Leaf 3: value = 3. beta = min(5, 3) = 3.
   M1 returns value = 3.
   Root updates alpha: alpha = max(-inf, 3) = 3.

2. Visit second child M2 (MIN node, alpha = 3, beta = +inf):
   - Leaf 4 (first leaf under M2): value = 2.
     beta = min(+inf, 2) = 2.
     Now test cutoff condition:
     alpha (3) >= beta (2).
     Since alpha >= beta, an ALPHA-CUTOFF occurs immediately!
   - Leaves 5 and 6 under M2 (values 10 and 7) are PRUNED!
Total leaf nodes pruned = 2.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_61',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''POMDP Properties and Belief States''',
    questionText: '''Which of the following statements regarding Partially Observable Markov Decision Processes (POMDPs) is/are TRUE? (Select all that apply)''',
    options: ['''A belief state b in a POMDP is a probability distribution over the physical states S of the environment.''', '''A POMDP can be formally reformulated as a continuous-state fully observable MDP over the continuous belief simplex.''', '''Sondik (1971) proved that the optimal value function V_t(b) for a finite-horizon POMDP is piecewise linear and convex (PWLC) in the belief space.''', '''In a POMDP, optimal policy actions depend only on the most recently received single observation o_t, completely independent of prior history.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: The belief state b(s) = P(S_t = s | history) is a sufficient statistic representing the probability distribution over all states.
B is TRUE: The belief MDP has state space given by the continuous |S|-dimensional probability simplex, making it a continuous-state MDP.
C is TRUE: Sondik's Theorem establishes that finite-horizon value functions in POMDPs are piecewise linear and convex (PWLC), represented as the upper envelope of a set of alpha-vectors.
D is FALSE: Because of partial observability, a single current observation is insufficient (Markov property does not hold on raw observations); optimal policies require the belief state, which summarizes the entire history.
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_62',
    year: 2026,
    subject: '''Artificial Intelligence''',
    topic: '''Genetic Algorithms and Schema Theorem''',
    questionText: '''Holland's Schema Theorem (Fundamental Theorem of Genetic Algorithms) establishes that:''',
    options: ['''Short, low-order schemata with above-average fitness receive exponentially increasing copies in subsequent generations.''', '''Genetic algorithms are guaranteed to reach the global optimum in polynomial time on any non-convex fitness landscape.''', '''Mutation probability should always be set to 1.0 to maximize exploration of the search space.''', '''Crossover alone without selection or mutation is sufficient to preserve genetic diversity indefinitely.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Holland's Schema Theorem states:
E[m(H, t+1)] >= m(H, t) * (f(H) / f_avg) * [1 - p_c * (delta(H) / (L - 1)) - o(H) * p_m].
Schemata H with short defining length delta(H), low order o(H), and above-average fitness f(H) > f_avg experience exponential proliferation over time. Option A is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_63',
    year: 2026,
    subject: '''Probability & Statistics''',
    topic: '''Chi-Square Goodness of Fit Statistic''',
    questionText: '''A fair 4-sided tetrahedral die is tossed 100 times, resulting in the observed outcome frequencies:
Face 1: 25, Face 2: 35, Face 3: 20, Face 4: 20.
Under the null hypothesis that all four faces are equally likely (E_i = 25 for all i), what is the value of the Pearson Chi-Square goodness-of-fit test statistic:
chi^2 = sum_{i=1}^4 (O_i - E_i)^2 / E_i ?
(Answer as an integer).''',
    options: [],
    correctAnswer: '''6''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Expected frequency for each of the 4 faces E_i = 100 / 4 = 25.
Observed frequencies:
O_1 = 25  =>  (O_1 - E_1)^2 / E_1 = (25 - 25)^2 / 25 = 0 / 25 = 0.
O_2 = 35  =>  (O_2 - E_2)^2 / E_2 = (35 - 25)^2 / 25 = 10^2 / 25 = 100 / 25 = 4.
O_3 = 20  =>  (O_3 - E_3)^2 / E_3 = (20 - 25)^2 / 25 = (-5)^2 / 25 = 25 / 25 = 1.
O_4 = 20  =>  (O_4 - E_4)^2 / E_4 = (20 - 25)^2 / 25 = (-5)^2 / 25 = 25 / 25 = 1.
Total test statistic:
chi^2 = 0 + 4 + 1 + 1 = 6.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_64',
    year: 2026,
    subject: '''Linear Algebra & Machine Learning''',
    topic: '''Kernel Ridge Regression Dual''',
    questionText: '''In Kernel Ridge Regression with training inputs X in R^{N x d}, kernel Gram matrix K in R^{N x N}, labels y in R^N, and regularization parameter lambda > 0:
Which of the following statements is/are TRUE? (Select all that apply)''',
    options: ['''The dual coefficients vector alpha in R^N is given by alpha = (K + lambda * I_N)^(-1) * y.''', '''The prediction for a new test input x_* is computed as f(x_*) = sum_{i=1}^N alpha_i * k(x_i, x_*).''', '''Computing the dual solution requires inverting an N x N matrix, which has time complexity O(N^3).''', '''Kernel Ridge Regression produces sparse solutions where most alpha_i are exactly zero.'''],
    correctAnswer: '''A;B;C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis:
A is TRUE: Setting the gradient of the dual regularized objective to zero yields alpha = (K + lambda * I_N)^(-1) y.
B is TRUE: By the Representer Theorem, the prediction is the linear combination of kernel evaluations against training points f(x_*) = k(x_*, X) * alpha.
C is TRUE: Inverting (K + lambda * I_N) requires O(N^3) time and O(N^2) memory.
D is FALSE: Ridge regression uses L2 regularization on RKHS weights, which shrinks coefficients towards zero but does NOT induce sparsity (unlike SVM or Lasso).
Thus A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'DA_MOCK3_CORE_65',
    year: 2026,
    subject: '''Optimization & Machine Learning''',
    topic: '''Classical Momentum Velocity Update''',
    questionText: '''In gradient descent with classical Polyak momentum:
Velocity update: v_{t+1} = beta * v_t + eta * grad f(theta_t)
Parameter update: theta_{t+1} = theta_t - v_{t+1}
Given momentum coefficient beta = 0.9, learning rate eta = 0.1, and initial velocity v_0 = 0:
If the gradient at step 0 is grad f(theta_0) = 10.0, and at step 1 is grad f(theta_1) = 10.0,
what is the velocity v_2 at the end of step 1? (Round off to 1 decimal place).''',
    options: [],
    correctAnswer: '''1.9''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Step 0:
Initial velocity v_0 = 0.
Gradient g_0 = 10.0.
v_1 = beta * v_0 + eta * g_0 = 0.9 * 0 + 0.1 * 10.0 = 1.0.

Step 1:
v_1 = 1.0.
Gradient g_1 = 10.0.
v_2 = beta * v_1 + eta * g_1 = (0.9 * 1.0) + (0.1 * 10.0) = 0.9 + 1.0 = 1.9.
The velocity v_2 is 1.9.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
];
