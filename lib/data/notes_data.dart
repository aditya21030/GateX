import '../models/note_model.dart';

final List<SubjectNote> allSubjectNotes = [
  // =========================================================================
  // ======================== GATE DA (DATA SCIENCE & AI) ====================
  // =========================================================================

  // 1. PROBABILITY & MATHEMATICAL STATISTICS (GATE DA)
  const SubjectNote(
    id: 'da_probability',
    title: 'Probability & Mathematical Statistics',
    branch: 'DA',
    subtitle: 'Axioms, Random Variables, Distributions, MGF, Limit Theorems & Hypothesis Testing',
    iconKey: 'query_stats',
    freeSections: [
      NoteSection(
        title: 'Axiomatic & Conditional Probability, Bayes\' Theorem',
        summary: 'Probability measures, sample spaces, mutually exclusive vs independent events, and conditional inference.',
        keyPoints: [
          'Axioms: P(S) = 1, P(E) >= 0, and P(UNION E_i) = sum P(E_i) for pairwise disjoint events.',
          'Complement rule: P(A^c) = 1 - P(A); Addition rule: P(A U B) = P(A) + P(B) - P(A INTERSECT B).',
          'Conditional Probability: P(A|B) = P(A INTERSECT B) / P(B), provided P(B) > 0.',
          'Independence: Events A and B are independent iff P(A INTERSECT B) = P(A) * P(B). In this case, P(A|B) = P(A).',
          'Total Probability: If B_1, ..., B_k partition sample space S, then P(A) = sum_{i=1}^k P(A|B_i) * P(B_i).',
          'Bayes\' Theorem updates prior P(B_j) to posterior P(B_j|A) given new evidence A.',
        ],
        coreFormulas: [
          'P(A U B) = P(A) + P(B) - P(A INTERSECT B)',
          'P(A|B) = P(A INTERSECT B) / P(B)',
          'P(B_j|A) = [P(A|B_j) * P(B_j)] / [sum_{i=1}^k P(A|B_i) * P(B_i)]',
          'P(A INTERSECT B INTERSECT C) = P(A) * P(B|A) * P(C|A INTERSECT B)',
        ],
      ),
      NoteSection(
        title: 'Random Variables, Expectations & Variance',
        summary: 'Discrete and continuous random variables, cumulative distribution functions, moments, and covariance.',
        keyPoints: [
          'CDF properties: F(x) = P(X <= x). F(x) is non-decreasing, right-continuous, lim_{x->-inf} F(x) = 0, lim_{x->inf} F(x) = 1.',
          'For continuous X, P(X = c) = 0 for any single point c, and f(x) = dF(x)/dx.',
          'Expectation: Linear operator E[aX + bY] = a E[X] + b E[Y], regardless of independence!',
          'Variance: Var(X) = E[X^2] - (E[X])^2; Var(aX + b) = a^2 * Var(X).',
          'Covariance: Cov(X, Y) = E[XY] - E[X]E[Y]. If X and Y are independent, Cov(X, Y) = 0 (converse is NOT true in general).',
          'Correlation coefficient rho = Cov(X, Y) / (sigma_X * sigma_Y), with -1 <= rho <= 1.',
        ],
        coreFormulas: [
          'E[X] = sum x P(X = x)  OR  integral x f(x) dx',
          'Var(X) = E[X^2] - (E[X])^2',
          'Var(aX + bY) = a^2 Var(X) + b^2 Var(Y) + 2ab Cov(X, Y)',
          'Cov(X, Y) = E[(X - mu_X)(Y - mu_Y)] = E[XY] - E[X]E[Y]',
          'M_X(t) = E[e^{tX}] ; E[X^n] = M_X^{(n)}(0)',
        ],
      ),
      NoteSection(
        title: 'Standard Discrete & Continuous Probability Distributions',
        summary: 'Formulas, parameters, expectation, and variance of distributions frequently tested in GATE DA.',
        keyPoints: [
          'Bernoulli(p): Mean = p, Variance = p(1-p).',
          'Binomial(n, p): n independent Bernoulli trials. Mean = np, Var = np(1-p). Mode = floor((n+1)p).',
          'Poisson(lambda): Rare event limit of Binomial as n -> inf, p -> 0 with np = lambda. Mean = lambda, Var = lambda (Equal mean and variance!).',
          'Geometric(p): Number of trials until 1st success. Mean = 1/p, Var = (1-p)/p^2. Possesses the Memoryless property.',
          'Uniform(a, b): Continuous flat density f(x) = 1/(b-a). Mean = (a+b)/2, Var = (b-a)^2 / 12.',
          'Exponential(lambda): Continuous memoryless distribution. f(x) = lambda e^{-lambda x} for x >= 0. Mean = 1/lambda, Var = 1/lambda^2.',
          'Normal N(mu, sigma^2): Bell curve, symmetric about mu. 68-95-99.7 rule. Z = (X - mu)/sigma ~ N(0, 1).',
        ],
        coreFormulas: [
          'Binomial: P(X=k) = C(n, k) * p^k * (1-p)^{n-k}',
          'Poisson: P(X=k) = (e^{-lambda} * lambda^k) / k!',
          'Normal PDF: f(x) = (1 / (sigma sqrt(2 pi))) * exp(-(x - mu)^2 / (2 sigma^2))',
          'Exponential CDF: P(X <= x) = 1 - e^{-lambda x} ; Memoryless: P(X > s+t | X > s) = P(X > t)',
        ],
      ),
      NoteSection(
        title: 'Sampling, Limit Theorems, MLE & Hypothesis Testing',
        summary: 'CLT, Chebyshev\'s Inequality, point estimation via MLE, p-values, and Type I/II errors.',
        keyPoints: [
          'Markov\'s Inequality: For non-negative X and a > 0, P(X >= a) <= E[X] / a.',
          'Chebyshev\'s Inequality: P(|X - mu| >= k sigma) <= 1 / k^2.',
          'Central Limit Theorem (CLT): For i.i.d. random variables with finite mean mu and variance sigma^2, the sample mean X_bar approaches N(mu, sigma^2/n) as n -> inf.',
          'Maximum Likelihood Estimation (MLE): Maximizes log-likelihood ln L(theta). For Normal distribution, MLE of mu is X_bar, but MLE of sigma^2 is (1/n) sum (X_i - X_bar)^2 (biased, divisor n not n-1).',
          'Hypothesis Testing: Null H_0 vs Alternative H_1. Type I error (alpha) = reject H_0 when H_0 is true (false alarm). Type II error (beta) = fail to reject H_0 when H_0 is false. Power of test = 1 - beta.',
        ],
        coreFormulas: [
          'Chebyshev: P(|X - mu| >= epsilon) <= Var(X) / epsilon^2',
          'CLT: Z = (X_bar - mu) / (sigma / sqrt(n)) ~ N(0, 1)',
          'MLE Score Equation: d ln L(theta; x) / d theta = 0',
          'Z-Test Statistic: z = (X_bar - mu_0) / (sigma / sqrt(n))',
        ],
      ),
    ],
    proSections: [
      ProNoteSection(
        title: 'Conditional Independence, Total Variance & Bayes Traps',
        inDepthTheory: '''
In GATE DA, conditional independence P(A and B | C) = P(A|C) * P(B|C) is tested heavily.
Crucial distinction:
1. Independence does NOT imply conditional independence. Example: Two independent coin tosses A and B; given C = {both coins showed the same face}, A and B are strictly dependent.
2. Conditional independence does NOT imply unconditional independence.
The Law of Total Variance (Eve's Law) partitions total variance into explained and unexplained components:
Var(Y) = E[Var(Y|X)] + Var(E[Y|X]).
The first term is the expected conditional variance (unexplained by X), and the second is the variance of the conditional expectation (explained by X).
In Bayesian updating, rare disease testing traps students: even with 99% test accuracy, if the disease base prevalence is 0.1% (1 in 1000), a positive test result yields a true positive probability of under 10% because false positives outnumber true positives by a massive factor!
''',
        examTraps: [
          'TRAP: Assuming Cov(X, Y) = 0 implies X and Y are independent. Counterexample: Let X ~ U(-1, 1) and Y = X^2. E[XY] = E[X^3] = 0, E[X] = 0, so Cov(X, Y) = 0, yet Y is completely determined by X!',
          'TRAP: Confusing mutually exclusive with independent. For non-zero probability events, mutually exclusive events CANNOT be independent because P(A and B) = 0 != P(A)P(B) > 0.',
          'TRAP: Forgetting that Var(X - Y) = Var(X) + Var(Y) - 2 Cov(X, Y). If X and Y are independent, Var(X - Y) = Var(X) + Var(Y), NOT minus!',
        ],
        solvedExample: '''
[Problem]
A medical test for a rare AI data anomaly has 95% sensitivity (true positive rate) and 90% specificity (true negative rate). The anomaly prevalence in the cluster is 2%. If a randomly selected log entry tests positive, what is the probability that it actually has the anomaly?

[Step-by-Step Solution]
1. Let A = anomaly present: P(A) = 0.02, P(A^c) = 0.98.
2. Let T+ = positive test result.
   Sensitivity P(T+|A) = 0.95
   False Positive Rate P(T+|A^c) = 1 - 0.90 = 0.10.
3. Apply Bayes' Theorem:
   P(A|T+) = [P(T+|A) * P(A)] / [P(T+|A) * P(A) + P(T+|A^c) * P(A^c)]
   P(A|T+) = [0.95 * 0.02] / [0.95 * 0.02 + 0.10 * 0.98]
   P(A|T+) = 0.019 / [0.019 + 0.098]
   P(A|T+) = 0.019 / 0.117 = 0.1624 (16.24%).

[Final Answer]
Probability is 16.24% (0.1624).
''',
        shortcutTips: [
          'If a Poisson variable has P(X = 1) = P(X = 2), then lambda e^{-lambda} = (lambda^2 e^{-lambda})/2 => lambda = 2. Instant 1-mark NAT solver.',
          'For Exponential(lambda), the median is (ln 2) / lambda ~= 0.693 / lambda, which is strictly less than the mean 1/lambda.',
          'Uniform distribution U(a, b): Var(X) = (b-a)^2 / 12. If a = -b, E[X] = 0 and Var(X) = (2b)^2 / 12 = b^2 / 3.',
        ],
      ),
      ProNoteSection(
        title: 'MGF Properties, Sum of Distributions & Order Statistics',
        inDepthTheory: '''
Moment Generating Function M_X(t) uniquely identifies the probability distribution.
Key combination properties:
1. If X_1 ~ Poisson(lambda_1) and X_2 ~ Poisson(lambda_2) are independent, then X_1 + X_2 ~ Poisson(lambda_1 + lambda_2).
2. If X_i ~ N(mu_i, sigma_i^2) are independent, then sum c_i X_i ~ N(sum c_i mu_i, sum c_i^2 sigma_i^2).
3. If X_i ~ Exponential(lambda) are independent, then sum_{i=1}^n X_i ~ Gamma(n, lambda) (Erlang distribution).
4. Minimum of independent exponentials: If X_1 ~ Exp(lambda_1) and X_2 ~ Exp(lambda_2), then min(X_1, X_2) ~ Exp(lambda_1 + lambda_2), and P(X_1 < X_2) = lambda_1 / (lambda_1 + lambda_2).
Order statistics: For n i.i.d. samples from U(0, 1), the k-th order statistic X_{(k)} follows Beta(k, n - k + 1) with E[X_{(k)}] = k / (n + 1).
''',
        examTraps: [
          'TRAP: In CLT questions with sum S_n = sum X_i vs mean X_bar. Var(S_n) = n sigma^2 while Var(X_bar) = sigma^2 / n. Watch which one the problem asks for!',
          'TRAP: Unbiased estimator of sample variance requires dividing by (n - 1), but the MLE estimator divides by n. If asked for MLE of variance, divide by n!',
        ],
        solvedExample: '''
[Problem]
Two autonomous systems process packets with completion times X_1 ~ Exp(lambda_1 = 0.4 min^-1) and X_2 ~ Exp(lambda_2 = 0.6 min^-1) independently.
Find: (i) The probability that system 1 finishes before system 2, and (ii) Expected time until the first system completes.

[Step-by-Step Solution]
1. Probability system 1 finishes first:
   P(X_1 < X_2) = lambda_1 / (lambda_1 + lambda_2)
   P(X_1 < X_2) = 0.4 / (0.4 + 0.6) = 0.40 (40%).
2. Time until the first completion:
   T_min = min(X_1, X_2) ~ Exp(lambda_1 + lambda_2)
   T_min ~ Exp(0.4 + 0.6 = 1.0 min^-1).
   E[T_min] = 1 / (lambda_1 + lambda_2) = 1 / 1.0 = 1.0 minute.

[Final Answer]
(i) P = 0.40; (ii) Expected time = 1.0 minute.
''',
        shortcutTips: [
          'For n i.i.d. U(0, 1) variables: E[max(X_1, ..., X_n)] = n / (n + 1), and E[min(X_1, ..., X_n)] = 1 / (n + 1).',
          'Sum of n independent Bernoulli(p) trials is always Binomial(n, p).',
        ],
      ),
      ProNoteSection(
        title: 'Maximum Likelihood Estimation (MLE) & Hypothesis Testing Traps',
        inDepthTheory: '''
Maximum Likelihood Estimation seeks parameters that maximize the joint probability of observed data:
L(theta) = prod_{i=1}^n f(x_i; theta)  =>  ln L(theta) = sum_{i=1}^n ln f(x_i; theta).
Score function S(theta) = d ln L / d theta = 0.
Fisher Information: I(theta) = - E[ d^2 ln f(X; theta) / d theta^2 ].
Cramer-Rao Lower Bound (CRLB): Any unbiased estimator T satisfies Var(T) >= 1 / (n * I(theta)).
An estimator that achieves the CRLB is termed Efficient.

Hypothesis Testing Core Logic:
- Type I Error (alpha) = P(Reject H_0 | H_0 is True) = Significance Level.
- Type II Error (beta) = P(Fail to reject H_0 | H_0 is False).
- Power = 1 - beta = P(Reject H_0 | H_0 is False).
- p-value: The probability of observing a test statistic at least as extreme as the observed value, assuming H_0 is TRUE.
  Rule: If p-value <= alpha, REJECT H_0. If p-value > alpha, FAIL TO REJECT H_0.
''',
        examTraps: [
          'TRAP: Confusing p-value with P(H_0 is true). The p-value is NOT the probability that the null hypothesis is true! It is P(Data as extreme | H_0 is true).',
          'TRAP: Uniform Distribution MLE. For X_1, ..., X_n ~ U(0, theta), the derivative d ln L / d theta = -n / theta < 0, which has NO zero root! The MLE is the boundary value: theta_hat = max(X_1, ..., X_n).',
        ],
        solvedExample: '''
[Problem]
A sample of size n = 25 is drawn from a Normal distribution with known variance sigma^2 = 16.
The observed sample mean is X_bar = 52.
Test H_0: mu = 50 against H_1: mu > 50 at significance level alpha = 0.05.
(Given: z_{0.05} = 1.645, z_{0.025} = 1.96).

[Step-by-Step Solution]
1. Null and Alternative hypotheses:
   H_0: mu = 50, H_1: mu > 50 (Right-tailed test).
2. Standard error of mean:
   SE = sigma / sqrt(n) = sqrt(16) / sqrt(25) = 4 / 5 = 0.8.
3. Test statistic:
   z = (X_bar - mu_0) / SE = (52 - 50) / 0.8 = 2 / 0.8 = 2.50.
4. Critical value for right-tailed test at alpha = 0.05 is z_crit = 1.645.
5. Decision:
   Since z_calc = 2.50 > 1.645, we REJECT H_0.

[Final Answer]
Reject H_0 at alpha = 0.05. The mean is significantly greater than 50.
''',
        shortcutTips: [
          'For any right-tailed z-test, if calculated z > 2.0, p-value is always < 0.025, which guarantees rejection at both alpha = 0.05 and alpha = 0.025.',
          'MLE of rate parameter lambda for Exponential(lambda) is 1 / X_bar. Always the reciprocal of the sample mean.',
        ],
      ),
    ],
  ),

  // 2. LINEAR ALGEBRA & MATRIX CALCULUS (GATE DA)
  const SubjectNote(
    id: 'da_linear_algebra',
    title: 'Linear Algebra & Matrix Calculus',
    branch: 'DA',
    subtitle: 'Matrices, Rank, Nullity, Eigenvalues, SVD, Projections & Matrix Derivatives',
    iconKey: 'functions',
    freeSections: [
      NoteSection(
        title: 'Matrices, Determinants, Trace & Inverse',
        summary: 'Properties of matrix operations, trace, determinants, and non-singular matrices.',
        keyPoints: [
          'Trace: tr(A) = sum a_{ii} = sum lambda_i. Cyclic property: tr(ABC) = tr(BCA) = tr(CAB).',
          'Determinant: Volume distortion factor = prod lambda_i. det(AB) = det(A) * det(B). For scalar c and n x n A, det(cA) = c^n det(A).',
          'Invertibility: A is invertible iff det(A) != 0 iff rank(A) = n iff nullity(A) = 0 iff 0 is not an eigenvalue.',
          'Inverse formula: A^-1 = adj(A) / det(A), where A * adj(A) = det(A) * I_n.',
          'Orthogonal matrix Q: Q^T Q = Q Q^T = I. det(Q) = +/- 1. All eigenvalues have |lambda| = 1. Preserves lengths: ||Qx||_2 = ||x||_2.',
        ],
        coreFormulas: [
          'tr(A) = sum_{i=1}^n lambda_i  ;  det(A) = prod_{i=1}^n lambda_i',
          'det(A^T) = det(A)  ;  det(A^-1) = 1 / det(A)',
          'det(cA) = c^n * det(A)  (for n x n matrix)',
          'A * adj(A) = det(A) * I_n',
        ],
      ),
      NoteSection(
        title: 'Rank, Nullity & Linear Systems (Ax = b)',
        summary: 'Vector spaces, span, basis, dimension, Rank-Nullity Theorem, and solvability criteria.',
        keyPoints: [
          'Rank(A): Number of pivot columns in Row Echelon Form = Dim(Col(A)) = Dim(Row(A)).',
          'Rank-Nullity Theorem: For an m x n matrix A, Rank(A) + Nullity(A) = n (number of columns).',
          'Homogeneous system (Ax = 0): Always consistent. Non-trivial solutions exist iff Rank(A) < n.',
          'Non-homogeneous system (Ax = b) with augmented matrix [A|b]:',
          '  * Consistent iff Rank(A) = Rank([A|b]).',
          '  * Unique solution iff Rank(A) = Rank([A|b]) = n.',
          '  * Infinitely many solutions iff Rank(A) = Rank([A|b]) < n.',
          '  * Inconsistent (no solution) iff Rank(A) < Rank([A|b]).',
        ],
        coreFormulas: [
          'dim(Col(A)) + dim(Null(A)) = n',
          'Rank(A + B) <= Rank(A) + Rank(B)',
          'Rank(AB) <= min(Rank(A), Rank(B))',
          'Rank(A^T A) = Rank(A A^T) = Rank(A)',
        ],
      ),
      NoteSection(
        title: 'Eigenvalues, Eigenvectors & Diagonalization',
        summary: 'Characteristic equations, Cayley-Hamilton theorem, algebraic vs geometric multiplicity, and spectral decomposition.',
        keyPoints: [
          'Characteristic equation: det(A - lambda I) = 0.',
          'If lambda is eigenvalue of A, then: lambda^k of A^k; 1/lambda of A^-1; lambda + c of A + cI; det(A)/lambda of adj(A).',
          'Cayley-Hamilton Theorem: Every square matrix satisfies its own characteristic equation: p(A) = 0.',
          'Algebraic Multiplicity (AM): Root multiplicity of (lambda - lambda_i) in det(A - lambda I).',
          'Geometric Multiplicity (GM): Dimension of eigenspace Null(A - lambda_i I). Always 1 <= GM <= AM.',
          'Diagonalizability: A is diagonalizable (A = P D P^-1) iff for all eigenvalues, GM = AM. Real symmetric matrices are always orthogonally diagonalizable.',
        ],
        coreFormulas: [
          'det(A - lambda I) = 0',
          'A x = lambda x  (x != 0)',
          'A = P D P^-1  =>  A^k = P D^k P^-1',
          'Spectral Theorem (Symmetric A): A = Q Lambda Q^T',
        ],
      ),
      NoteSection(
        title: 'Matrix Calculus, Projections & Singular Value Decomposition',
        summary: 'Derivatives with respect to vectors, orthogonal projection matrices, and compact/truncated SVD.',
        keyPoints: [
          'Matrix Calculus rules: grad_x (a^T x) = a; grad_x (x^T A x) = (A + A^T) x. If A is symmetric, grad_x (x^T A x) = 2 A x.',
          'Orthogonal Projection: Projection of vector b onto column space of A is p = A (A^T A)^-1 A^T b.',
          'Projection matrix P = A (A^T A)^-1 A^T is symmetric (P^T = P) and idempotent (P^2 = P).',
          'SVD: Every m x n matrix A can be factored into A = U Sigma V^T, where U is m x m orthogonal, V is n x n orthogonal, and Sigma has singular values sigma_1 >= sigma_2 >= ... >= sigma_r > 0.',
          'Singular values sigma_i = sqrt(eigenvalues of A^T A). Rank(A) = number of non-zero singular values.',
          'Moore-Penrose Pseudoinverse: A^+ = V Sigma^+ U^T. Gives minimum L_2 norm least-squares solution x_hat = A^+ b.',
        ],
        coreFormulas: [
          'grad_x (x^T A x) = (A + A^T) x',
          'Projection Matrix: P = A (A^T A)^-1 A^T  ;  P^2 = P, P^T = P',
          'SVD: A = U Sigma V^T = sum_{i=1}^r sigma_i u_i v_i^T',
          'A^+ = (A^T A)^-1 A^T  (when A has full column rank)',
        ],
      ),
    ],
    proSections: [
      ProNoteSection(
        title: 'Singular Value Decomposition (SVD) & Eckart-Young Theorem',
        inDepthTheory: '''
In GATE DA, SVD is tested heavily because it connects directly to PCA, dimensionality reduction, and pseudoinverses.
For any real m x n matrix A of rank r:
1. Columns of U (left singular vectors) are orthonormal eigenvectors of A A^T (m x m).
2. Columns of V (right singular vectors) are orthonormal eigenvectors of A^T A (n x n).
3. Non-zero singular values sigma_i are the positive square roots of non-zero eigenvalues of A^T A.
4. Eckart-Young-Mirsky Theorem: The best rank-k approximation A_k (k < r) in both Frobenius and Spectral norm is obtained by keeping the top-k singular values:
   A_k = sum_{i=1}^k sigma_i u_i v_i^T.
5. Approximation error: ||A - A_k||_2 = sigma_{k+1}, and ||A - A_k||_F^2 = sum_{j=k+1}^r sigma_j^2.
''',
        examTraps: [
          'TRAP: Confusing eigenvalues with singular values. Singular values are ALWAYS non-negative real numbers (sigma_i >= 0), even if A has negative or complex eigenvalues!',
          'TRAP: Outer product shape. In dyadic expansion A = sum sigma_i u_i v_i^T, u_i is m x 1 and v_i^T is 1 x n, producing an m x n rank-1 matrix. Do not compute v_i u_i^T!',
        ],
        solvedExample: '''
[Problem]
Find the SVD singular values of matrix A = [[3, 0], [0, -4], [0, 0]].
Find: (i) Non-zero singular values sigma_1, sigma_2, (ii) Frobenius norm ||A||_F, (iii) Best rank-1 approximation error in spectral norm.

[Step-by-Step Solution]
1. Compute A^T A:
   A^T A = [[3, 0, 0], [0, -4, 0]] * [[3, 0], [0, -4], [0, 0]] = [[9, 0], [0, 16]].
2. Eigenvalues of A^T A:
   lambda_1 = 16, lambda_2 = 9.
3. Singular values:
   sigma_1 = sqrt(16) = 4, and sigma_2 = sqrt(9) = 3.
4. Frobenius norm:
   ||A||_F = sqrt(sigma_1^2 + sigma_2^2) = sqrt(16 + 9) = sqrt(25) = 5.
5. Best rank-1 spectral approximation error:
   ||A - A_1||_2 = sigma_2 = 3.

[Final Answer]
(i) sigma = {4, 3}; (ii) ||A||_F = 5; (iii) Error = 3.
''',
        shortcutTips: [
          'For any rank-1 matrix A = u v^T: Trace = u^T v, Rank = 1, the only non-zero eigenvalue is lambda = u^T v, and all other n-1 eigenvalues are 0.',
          'det(I + u v^T) = 1 + v^T u (Matrix Determinant Lemma). Allows instant evaluation without expanding n x n matrices.',
        ],
      ),
      ProNoteSection(
        title: 'Quadratic Forms, Definiteness & Least Squares Projections',
        inDepthTheory: '''
A quadratic form Q(x) = x^T A x where A is real symmetric:
- Strictly Positive Definite (SPD): x^T A x > 0 for all x != 0 <=> all lambda_i > 0 <=> all leading principal minors > 0 (Sylvester's Criterion).
- Positive Semi-Definite (PSD): x^T A x >= 0 for all x <=> all lambda_i >= 0.
- Negative Definite: all lambda_i < 0.
- Indefinite: A has at least one positive and at least one negative eigenvalue. The origin x = 0 is a saddle point!
In Linear Regression, the cost function J(w) = ||Xw - y||_2^2 = (Xw - y)^T (Xw - y).
Expanding: J(w) = w^T X^T X w - 2 y^T X w + y^T y.
Taking vector derivative grad_w J(w) = 2 X^T X w - 2 X^T y = 0 yields the Normal Equation:
X^T X w = X^T y => w^* = (X^T X)^-1 X^T y.
Hessian of J(w) is grad_w^2 J(w) = 2 X^T X, which is always positive semi-definite, guaranteeing convexity and global minimum!
''',
        examTraps: [
          'TRAP: Applying Sylvester\'s criterion to non-symmetric matrices. Sylvester\'s criterion ONLY applies if the matrix is symmetric! Always symmetrize first: A_sym = (A + A^T)/2.',
          'TRAP: Inverse of (A + B). In general, (A + B)^-1 != A^-1 + B^-1!',
        ],
        solvedExample: '''
[Problem]
Given the quadratic form Q(x_1, x_2, x_3) = 2 x_1^2 + x_2^2 + 3 x_3^2 - 2 x_1 x_2.
Determine its definiteness and the minimum value of Q(x) subject to ||x||_2 = 1.

[Step-by-Step Solution]
1. Matrix representation A:
   A = [[2, -1, 0], [-1, 1, 0], [0, 0, 3]].
2. Check leading principal minors:
   Delta_1 = 2 > 0.
   Delta_2 = (2)(1) - (-1)^2 = 2 - 1 = 1 > 0.
   Delta_3 = 3 * Delta_2 = 3 * 1 = 3 > 0.
   All Delta_i > 0 => Matrix A is strictly Positive Definite.
3. By Rayleigh Quotient: min_{||x||=1} x^T A x = lambda_min(A).
4. Eigenvalues of 2x2 submatrix [[2, -1], [-1, 1]]:
   det = lambda^2 - 3 lambda + 1 = 0 => lambda = (3 - sqrt(5))/2 ~= 0.382.
   The third eigenvalue is 3.
   Minimum eigenvalue lambda_min = (3 - sqrt(5))/2 ~= 0.382.

[Final Answer]
Positive Definite; Minimum value on unit sphere is ~= 0.382.
''',
        shortcutTips: [
          'Rayleigh Quotient Theorem: For symmetric A, lambda_min <= (x^T A x)/(x^T x) <= lambda_max. Equality holds at corresponding eigenvectors.',
          'Projection matrix trace: tr(P) = rank(P) = dimension of the subspace projected onto.',
        ],
      ),
      ProNoteSection(
        title: 'Matrix Calculus, Jacobians & Backpropagation Gradients',
        inDepthTheory: '''
Matrix Calculus provides the mathematical engine for Deep Learning and Optimization:
Key Identities (for column vectors x, y and matrix A):
1. grad_x (a^T x) = a
2. grad_x (x^T a) = a
3. grad_x (x^T x) = 2x
4. grad_x (x^T A x) = (A + A^T) x  (reduces to 2 A x when A is symmetric)
5. grad_x (u(x)^T v(x)) = (J_u)^T v(x) + (J_v)^T u(x)  (Product Rule)

In Neural Networks, let z = W x + b and loss L.
By Chain Rule:
- dL / dx = W^T (dL / dz)
- dL / dW = (dL / dz) x^T  (Outer product: (m x 1) * (1 x n) = m x n matrix of gradients!)
- dL / db = dL / dz
This exact outer product form enables vectorized mini-batch backpropagation.
''',
        examTraps: [
          'TRAP: Dimension mismatch in matrix gradients. If W has shape (m, n), dL/dW MUST also have shape (m, n). Computing (dL/dz)^T x produces a scalar, not the weight gradient matrix!',
          'TRAP: Forgetting transpose when differentiating through linear transformations. d/dx (A x) = A^T in denominator layout, or A in numerator layout. Always verify dimension alignment!',
        ],
        solvedExample: '''
[Problem]
Let f(x) = (1/2) x^T A x - b^T x, where A = [[4, 2], [2, 6]] and b = [8, 14]^T.
Find: (i) Gradient vector grad f(x), (ii) The optimal vector x^* that minimizes f(x).

[Step-by-Step Solution]
1. Since A is symmetric (A = A^T):
   grad f(x) = (1/2)(2 A x) - b = A x - b.
2. Set grad f(x) = 0 for stationary point:
   A x^* = b
   [[4, 2], [2, 6]] [x_1, x_2]^T = [8, 14]^T.
3. Solve system of equations:
   Equation (1): 4 x_1 + 2 x_2 = 8  =>  2 x_1 + x_2 = 4  =>  x_2 = 4 - 2 x_1.
   Equation (2): 2 x_1 + 6 x_2 = 14 =>  x_1 + 3 x_2 = 7.
   Substitute: x_1 + 3(4 - 2 x_1) = 7 => x_1 + 12 - 6 x_1 = 7 => -5 x_1 = -5 => x_1 = 1.
   Then x_2 = 4 - 2(1) = 2.
4. Verify minimum: Hessian H = A = [[4, 2], [2, 6]].
   Delta_1 = 4 > 0, Delta_2 = 24 - 4 = 20 > 0 => Positive Definite, strictly global minimum!

[Final Answer]
Optimal minimizer is x^* = [1, 2]^T.
''',
        shortcutTips: [
          'For any quadratic loss (1/2) x^T A x - b^T x with SPD A, the exact minimizer is always x = A^-1 b in one step.',
          'Hessian of any linear function c^T x is identically 0 everywhere.',
        ],
      ),
    ],
  ),

  // 3. CALCULUS & OPTIMIZATION (GATE DA)
  const SubjectNote(
    id: 'da_calculus_optimization',
    title: 'Calculus & Optimization',
    branch: 'DA',
    subtitle: 'Limits, Taylor Series, Gradient, Hessian, KKT Conditions & Gradient Descent',
    iconKey: 'calculate',
    freeSections: [
      NoteSection(
        title: 'Single-Variable Calculus & Mean Value Theorems',
        summary: 'Limits, continuity, differentiability, L\'Hôpital\'s rule, and foundational theorems.',
        keyPoints: [
          'Continuity: f is continuous at c iff lim_{x->c} f(x) = f(c). Differentiability implies continuity, but continuity does NOT imply differentiability.',
          'Rolle\'s Theorem: If f continuous on [a, b], differentiable on (a, b), and f(a) = f(b), then exists c in (a, b) such that f\'(c) = 0.',
          'Lagrange Mean Value Theorem (LMVT): exists c in (a, b) such that f\'(c) = [f(b) - f(a)] / (b - a).',
          'Cauchy Mean Value Theorem: [f\'(c) / g\'(c)] = [f(b) - f(a)] / [g(b) - g(a)].',
          'Taylor Series expansion around a: f(x) = sum_{k=0}^inf [f^{(k)}(a) / k!] * (x - a)^k.',
          'Stationary point where f\'(c) = 0. If f\'\'(c) > 0 -> Local Min; if f\'\'(c) < 0 -> Local Max.',
        ],
        coreFormulas: [
          'LMVT: f\'(c) = [f(b) - f(a)] / (b - a)',
          'Taylor: f(x) = f(a) + f\'(a)(x-a) + [f\'\'(a)/2!](x-a)^2 + ...',
          'L\'Hopital: lim f(x)/g(x) = lim f\'(x)/g\'(x)  (for 0/0 or inf/inf)',
        ],
      ),
      NoteSection(
        title: 'Multivariable Calculus: Gradients, Jacobians & Hessians',
        summary: 'Partial derivatives, directional derivatives, tangent hyperplanes, and curvature.',
        keyPoints: [
          'Gradient grad f(x): Vector of partial derivatives. Points in direction of STEEPEST ASCENT. Its magnitude is the maximum rate of increase.',
          'Directional Derivative in unit direction u (||u|| = 1): D_u f = grad f(x) . u = ||grad f|| cos theta.',
          'Jacobian Matrix J: Matrix of all first-order partial derivatives of a vector-valued function.',
          'Hessian Matrix H: Square n x n matrix of second-order partial derivatives. If continuous, H is symmetric (Clairaut\'s Theorem).',
          'Second Derivative Test in R^n: At critical point grad f(x^*) = 0:',
          '  * H is Positive Definite (all lambda_i > 0) => Strict Local Minimum.',
          '  * H is Negative Definite (all lambda_i < 0) => Strict Local Maximum.',
          '  * H has both positive and negative eigenvalues => SADDLE POINT.',
        ],
        coreFormulas: [
          'Directional Derivative: D_u f = grad f(x)^T u',
          'Hessian Matrix: H_{ij} = d^2 f / (d x_i d x_j)',
          'Taylor in R^n: f(x + Delta x) ~= f(x) + grad f(x)^T Delta x + (1/2) Delta x^T H(x) Delta x',
        ],
      ),
      NoteSection(
        title: 'Optimization: Unconstrained, Constrained & Convexity',
        summary: 'Convex sets, convex functions, Lagrange Multipliers, KKT conditions, and Gradient Descent.',
        keyPoints: [
          'Convex Function: f(theta x + (1-theta) y) <= theta f(x) + (1-theta) f(y). Every local minimum is a GLOBAL minimum!',
          'Hessian criterion for convexity: f is convex on an open convex set iff its Hessian H(x) is Positive Semi-Definite everywhere.',
          'Lagrange Multipliers (Equality constraint g(x) = 0): grad f(x) + lambda grad g(x) = 0.',
          'Karush-Kuhn-Tucker (KKT) Conditions (Inequality constraint g_i(x) <= 0):',
          '  1. Stationarity: grad f(x^*) + sum mu_i grad g_i(x^*) = 0',
          '  2. Primal Feasibility: g_i(x^*) <= 0',
          '  3. Dual Feasibility: mu_i >= 0',
          '  4. Complementary Slackness: mu_i * g_i(x^*) = 0',
          'Gradient Descent update: x_{k+1} = x_k - eta grad f(x_k).',
        ],
        coreFormulas: [
          'Gradient Descent: x_{t+1} = x_t - eta grad f(x_t)',
          'Lagrangian: L(x, lambda) = f(x) + lambda g(x)',
          'KKT Complementary Slackness: mu_i * g_i(x) = 0  (mu_i >= 0)',
        ],
      ),
    ],
    proSections: [
      ProNoteSection(
        title: 'KKT Conditions, Duality & Active Constraints',
        inDepthTheory: '''
In GATE DA, optimization questions test KKT conditions rigorously.
Complementary slackness mu_i g_i(x) = 0 has two strict possibilities for each constraint:
Case 1 (Inactive constraint): g_i(x^*) < 0 => mu_i MUST BE 0. The constraint plays no role in the optimal point.
Case 2 (Active/Binding constraint): g_i(x^*) = 0 => mu_i >= 0. The optimum lies on the boundary.
Strong Duality: For convex problems satisfying Slater's condition (strictly feasible point exists), the primal optimal value equals the dual optimal value (zero duality gap).
''',
        examTraps: [
          'TRAP: Forgetting dual feasibility mu_i >= 0 for inequality constraints g_i(x) <= 0. If your algebra yields mu_i < 0, that constraint is NOT active at the minimum; reject that branch!',
          'TRAP: Confusing directional derivative with partial derivative. The directional derivative requires a UNIT vector. If vector v = (3, 4) is given, divide by ||v|| = 5 before dotting with grad f!',
        ],
        solvedExample: '''
[Problem]
Find the point on the plane g(x, y, z) = x + 2y + 2z - 9 = 0 closest to the origin (0, 0, 0) using Lagrange Multipliers.

[Step-by-Step Solution]
1. Minimize f(x, y, z) = x^2 + y^2 + z^2 subject to g(x, y, z) = x + 2y + 2z - 9 = 0.
2. Lagrangian: L(x, y, z, lambda) = x^2 + y^2 + z^2 + lambda (x + 2y + 2z - 9).
3. Stationarity conditions:
   dL/dx = 2x + lambda = 0  =>  x = -lambda / 2
   dL/dy = 2y + 2lambda = 0  =>  y = -lambda
   dL/dz = 2z + 2lambda = 0  =>  z = -lambda
4. Substitute into constraint:
   (-lambda/2) + 2(-lambda) + 2(-lambda) - 9 = 0
   -9lambda / 2 = 9  =>  lambda = -2.
5. Substitute lambda = -2:
   x = 1, y = 2, z = 2.
   Shortest distance = sqrt(1^2 + 2^2 + 2^2) = sqrt(9) = 3.

[Final Answer]
Closest point is (1, 2, 2); Distance = 3.
''',
        shortcutTips: [
          'Distance from origin to plane ax + by + cz = d is d / sqrt(a^2 + b^2 + c^2). For x + 2y + 2z = 9: d = 9 / sqrt(1+4+4) = 9/3 = 3!',
          'For a quadratic function f(x) = (1/2) x^T A x - b^T x with SPD A, the exact global minimizer is x^* = A^-1 b.',
        ],
      ),
      ProNoteSection(
        title: 'Hessian Eigenvalues, Saddle Points & Multivariable Extrema',
        inDepthTheory: '''
Second Derivative Test in multivariable calculus:
At a critical point (x_0, y_0) where grad f = (0, 0):
Compute the Hessian determinant D = f_{xx} f_{yy} - (f_{xy})^2.
1. If D > 0 and f_{xx} > 0: Strict Local Minimum (both eigenvalues lambda_1, lambda_2 > 0).
2. If D > 0 and f_{xx} < 0: Strict Local Maximum (both eigenvalues lambda_1, lambda_2 < 0).
3. If D < 0: SADDLE POINT (eigenvalues have opposite signs).
4. If D = 0: Test is inconclusive; higher-order terms must be examined.
In R^n, the determinant alone is insufficient. You MUST inspect all n eigenvalues of H. If all lambda_i > 0 => Local Min; if all lambda_i < 0 => Local Max; if mixed signs => Saddle Point.
''',
        examTraps: [
          'TRAP: Concluding local minimum from f_{xx} > 0 alone without checking D. If D < 0, it is a saddle point even if f_{xx} > 0!',
          'TRAP: In multivariable functions, checking directional derivatives along all lines is NOT sufficient to prove continuity or a limit! Must check parabolic paths like y = k x^2.',
        ],
        solvedExample: '''
[Problem]
Classify all critical points of the function f(x, y) = x^3 + y^3 - 3 x y.

[Step-by-Step Solution]
1. First-order partial derivatives:
   f_x = 3 x^2 - 3 y = 0  =>  y = x^2
   f_y = 3 y^2 - 3 x = 0  =>  x = y^2
2. Substitute y = x^2 into second equation:
   x = (x^2)^2 = x^4  =>  x^4 - x = 0  =>  x (x^3 - 1) = 0.
   Real roots: x = 0 or x = 1.
   If x = 0 => y = 0: Point P_1 = (0, 0).
   If x = 1 => y = 1: Point P_2 = (1, 1).
3. Second-order partial derivatives:
   f_{xx} = 6x, f_{yy} = 6y, f_{xy} = -3.
   Hessian matrix H(x, y) = [[6x, -3], [-3, 6y]].
   D(x, y) = (6x)(6y) - (-3)^2 = 36 x y - 9.
4. Evaluate at P_1(0, 0):
   D(0, 0) = -9 < 0 => (0, 0) is a SADDLE POINT.
5. Evaluate at P_2(1, 1):
   D(1, 1) = 36(1) - 9 = 27 > 0.
   f_{xx}(1, 1) = 6 > 0 => (1, 1) is a LOCAL MINIMUM.
   Value at minimum: f(1, 1) = 1 + 1 - 3 = -1.

[Final Answer]
(0, 0) is a Saddle Point; (1, 1) is a Local Minimum with value -1.
''',
        shortcutTips: [
          'For symmetric functions f(x, y) = g(x) + g(y) - c xy, critical points on the line y = x frequently yield the global extremum.',
          'Hessian determinant D = det(H) = lambda_1 * lambda_2. If det(H) < 0, one eigenvalue is positive and one is negative, immediately proving a saddle point.',
        ],
      ),
      ProNoteSection(
        title: 'Gradient Descent Convergence Rates & Learning Rate Bounds',
        inDepthTheory: '''
Convergence of Gradient Descent x_{k+1} = x_k - eta grad f(x_k):
For an L-Lipschitz smooth and mu-strongly convex function:
- Step size (Learning Rate) constraint for guaranteed convergence:
  0 < eta < 2 / L.
- Optimal step size: eta^* = 2 / (L + mu).
- Convergence rate:
  ||x_k - x^*|| <= ( (L - mu) / (L + mu) )^k ||x_0 - x^*||.
Condition Number kappa = L / mu = lambda_max(H) / lambda_min(H).
If kappa >> 1 (ill-conditioned problem), standard Gradient Descent exhibits severe oscillations (zig-zagging across narrow valleys).
Polyak Momentum accelerates convergence by adding a velocity vector:
v_{t+1} = beta v_t + eta grad f(x_t); x_{t+1} = x_t - v_{t+1}.
Momentum reduces the effective condition number from kappa to sqrt(kappa), achieving quadratic speedup!
''',
        examTraps: [
          'TRAP: Choosing eta > 2/L causes Gradient Descent to diverge exponentially, overshooting the minimum.',
          'TRAP: In stochastic gradient descent (SGD), the learning rate MUST decrease over time (e.g. eta_t = eta_0 / sqrt(t)) to guarantee convergence due to gradient variance.',
        ],
        solvedExample: '''
[Problem]
Consider the objective function f(x_1, x_2) = 5 x_1^2 + x_2^2.
Find: (i) Lipschitz constant L and strong convexity parameter mu, (ii) Maximum learning rate eta_max for stable gradient descent, (iii) Condition number kappa.

[Step-by-Step Solution]
1. Hessian matrix:
   H = [[d^2f/dx_1^2, 0], [0, d^2f/dx_2^2]] = [[10, 0], [0, 2]].
2. Eigenvalues of Hessian:
   lambda_max = 10, lambda_min = 2.
3. Parameters:
   Lipschitz constant L = lambda_max = 10.
   Strong convexity mu = lambda_min = 2.
4. Stability threshold:
   eta_max = 2 / L = 2 / 10 = 0.20.
5. Condition number:
   kappa = L / mu = 10 / 2 = 5.

[Final Answer]
(i) L = 10, mu = 2; (ii) eta_max = 0.20; (iii) kappa = 5.
''',
        shortcutTips: [
          'Condition number of a quadratic function (1/2) x^T A x is simply lambda_max(A) / lambda_min(A).',
          'If condition number kappa = 1, Gradient Descent with optimal step size eta = 1/L converges in EXACTLY ONE STEP!',
        ],
      ),
    ],
  ),

  // 4. MACHINE LEARNING (GATE DA)
  const SubjectNote(
    id: 'da_machine_learning',
    title: 'Machine Learning',
    branch: 'DA',
    subtitle: 'Regression, Classification, SVM, Trees, Boosting, PCA, Clustering & Metrics',
    iconKey: 'psychology',
    freeSections: [
      NoteSection(
        title: 'Supervised Learning Foundations & Bias-Variance Tradeoff',
        summary: 'Loss functions, empirical risk minimization, overfitting, underfitting, and regularization.',
        keyPoints: [
          'Expected Prediction Error: EPE = Bias^2 + Variance + Irreducible Error (sigma^2).',
          'Bias: Error from erroneous model assumptions (underfitting, simple models).',
          'Variance: Sensitivity to fluctuations in the training set (overfitting, complex models).',
          'Regularization: Penalizes model complexity to reduce variance at the expense of slight bias increase.',
          'Ridge (L_2): J(w) = MSE + lambda ||w||_2^2. Shrinks weights toward zero; closed-form solution: w^* = (X^T X + lambda I)^-1 X^T y.',
          'Lasso (L_1): J(w) = MSE + lambda ||w||_1. Drives non-informative weights to EXACTLY ZERO (automatic feature selection).',
        ],
        coreFormulas: [
          'Bias[f_hat(x)] = E[f_hat(x)] - f(x)',
          'Var[f_hat(x)] = E[(f_hat(x) - E[f_hat(x)])^2]',
          'Total Error = (Bias)^2 + Variance + sigma^2',
          'Ridge: w^* = (X^T X + lambda I_n)^-1 X^T y',
          'Lasso Penalty: lambda sum_{j=1}^d |w_j|',
        ],
      ),
      NoteSection(
        title: 'Linear & Logistic Regression, Decision Boundaries',
        summary: 'Normal equations, logistic sigmoid, odds ratio, cross-entropy loss, and multi-class classification.',
        keyPoints: [
          'Linear Regression: Hypothesizes y_hat = w^T x. Solved via OLS Normal Equations w = (X^T X)^-1 X^T y.',
          'R^2 Score: R^2 = 1 - (SS_res / SS_tot). Proportion of variance explained by the model.',
          'Logistic Regression: Models log-odds ln(p / (1-p)) = w^T x. Output probability p = sigma(w^T x) = 1 / (1 + e^{-w^T x}).',
          'Decision boundary: Linear hyperplane where w^T x = 0 (corresponding to p = 0.5).',
          'Binary Cross-Entropy Loss: L(w) = - (1/N) sum [y_i ln(p_i) + (1 - y_i) ln(1 - p_i)]. Convex with respect to w.',
          'Softmax for K classes: P(Y=k|x) = e^{w_k^T x} / sum_{j=1}^K e^{w_j^T x}.',
        ],
        coreFormulas: [
          'Sigmoid: sigma(z) = 1 / (1 + e^{-z})  ;  sigma\'(z) = sigma(z)(1 - sigma(z))',
          'Log-Odds (Logit): ln(p / (1 - p)) = w^T x',
          'BCE Loss: L = - [y ln(p) + (1 - y) ln(1 - p)]',
          'R^2 = 1 - [sum(y_i - y_hat_i)^2] / [sum(y_i - y_bar)^2]',
        ],
      ),
      NoteSection(
        title: 'Support Vector Machines (SVM) & Kernel Methods',
        summary: 'Maximum margin hyperplanes, support vectors, slack variables, dual representation, and Mercer kernels.',
        keyPoints: [
          'Margin: Geometric distance between separating hyperplane and closest training points is 2 / ||w||_2.',
          'Objective: Minimize (1/2) ||w||_2^2 subject to y_i (w^T x_i + b) >= 1 (for linearly separable data).',
          'Support Vectors: Only the data points that lie directly on the margin boundaries determine w and b.',
          'Soft-Margin C: Trades off margin width against training errors. High C = narrow margin, low bias, high variance. Low C = wider margin, high bias.',
          'Kernel Trick: Implicitly maps inputs to high-dimensional space: K(x_i, x_j) = <phi(x_i), phi(x_j)>.',
          'Common Kernels: Linear K = x_i^T x_j; Polynomial K = (x_i^T x_j + c)^d; RBF K = exp(-gamma ||x_i - x_j||^2).',
        ],
        coreFormulas: [
          'Margin Width: 2 / ||w||_2',
          'Dual Formulation: Maximize sum alpha_i - (1/2) sum sum alpha_i alpha_j y_i y_j K(x_i, x_j)',
          'KKT condition: alpha_i [y_i (w^T x_i + b) - 1] = 0',
          'RBF Kernel: K(x, z) = exp(-gamma ||x - z||^2)',
        ],
      ),
      NoteSection(
        title: 'Decision Trees, Ensembles, Clustering & Evaluation Metrics',
        summary: 'Splitting criteria, Random Forests, AdaBoost, K-Means, PCA, and classification confusion matrices.',
        keyPoints: [
          'Entropy: H(S) = - sum p_i log_2(p_i). For binary classification, max entropy is 1.0 (at p = 0.5); min is 0 (pure).',
          'Gini Impurity: Gini(S) = 1 - sum p_i^2. For binary classification, max Gini is 0.5 (at p = 0.5); min is 0.',
          'Information Gain: IG(S, A) = H(S) - sum (|S_v| / |S|) H(S_v). Always non-negative.',
          'Random Forest: Bagging + random feature subset at each split. Reduces variance without increasing bias.',
          'K-Means: Minimizes Within-Cluster Sum of Squares (WCSS / Inertia). Monotonically converges to a local optimum.',
          'PCA: Finds orthogonal directions of maximum variance. Principal components are eigenvectors of covariance matrix.',
          'Metrics: Precision = TP / (TP + FP); Recall = TP / (TP + FN); F1 = 2 * (Prec * Rec) / (Prec + Rec).',
        ],
        coreFormulas: [
          'Entropy: H(S) = - sum_{i=1}^c p_i log_2 p_i',
          'Gini Impurity: Gini(S) = 1 - sum_{i=1}^c p_i^2',
          'F1 Score: 2 * (Precision * Recall) / (Precision + Recall)',
          'Explained Variance Ratio (PCA): lambda_k / (sum_{i=1}^d lambda_i)',
        ],
      ),
    ],
    proSections: [
      ProNoteSection(
        title: 'SVM Dual Derivation, Slack Variables & AdaBoost Mathematics',
        inDepthTheory: '''
In GATE DA, SVM dual formulation and complementary slackness are prime test topics:
The primal Lagrangian with slack variables xi_i:
L(w, b, xi, alpha, r) = (1/2) ||w||^2 + C sum xi_i - sum alpha_i [y_i (w^T x_i + b) - 1 + xi_i] - sum r_i xi_i.
Stationarity conditions:
1. dL/dw = w - sum alpha_i y_i x_i = 0 => w = sum_{i=1}^N alpha_i y_i x_i.
2. dL/db = sum alpha_i y_i = 0.
3. dL/d xi_i = C - alpha_i - r_i = 0 => alpha_i <= C (Box constraint: 0 <= alpha_i <= C).
Complementary slackness:
- alpha_i = 0: Point is correctly classified and outside the margin.
- 0 < alpha_i < C: Point is on the margin (xi_i = 0). Used to calculate intercept b!
- alpha_i = C: Point violates the margin (xi_i > 0).

In AdaBoost:
Weight update: w_{t+1, i} = w_{t, i} * exp(-alpha_t y_i h_t(x_i)) / Z_t.
Classifier weight: alpha_t = (1/2) ln((1 - epsilon_t) / epsilon_t).
''',
        examTraps: [
          'TRAP: Support vectors count. Points with alpha_i > 0 ARE the support vectors. Points with alpha_i = 0 have zero impact on the boundary.',
          'TRAP: RBF kernel bandwidth gamma. High gamma = complex boundary, wraps tightly around points (high variance, overfitting). Low gamma = smooth boundary (high bias, underfitting).',
        ],
        solvedExample: '''
[Problem]
A dataset has 14 instances: 9 Positive and 5 Negative. A candidate split feature A divides the dataset into:
- Left Branch: 6 Positive, 2 Negative (8 total)
- Right Branch: 3 Positive, 3 Negative (6 total)
Calculate the Information Gain IG(S, A). (Given: H(S) = 0.940, H(Left) = 0.811, H(Right) = 1.0).

[Step-by-Step Solution]
1. Total entropy H(S) = 0.940 bits.
2. Left branch entropy H(S_L) = 0.811 bits; Weight = 8/14 = 0.5714.
3. Right branch entropy H(S_R) = 1.0 bits (equal 3 and 3); Weight = 6/14 = 0.4286.
4. Weighted Child Entropy:
   H(S, A) = (8/14) * 0.811 + (6/14) * 1.0
   H(S, A) = 0.4634 + 0.4286 = 0.892 bits.
5. Information Gain:
   IG(S, A) = H(S) - H(S, A) = 0.940 - 0.892 = 0.048 bits.

[Final Answer]
Information Gain is 0.048 bits.
''',
        shortcutTips: [
          'If a binary split creates a branch with 50-50 class distribution, its entropy is ALWAYS exactly 1.0. Do not compute logarithms!',
          'If a node is completely pure (all samples belong to one class), its entropy and Gini impurity are both EXACTLY 0.',
        ],
      ),
      ProNoteSection(
        title: 'Ridge vs Lasso Sparsity Geometry & Principal Component Analysis',
        inDepthTheory: '''
Why Lasso (L1) yields sparse solutions while Ridge (L2) does not:
In constrained optimization form:
- Ridge: Minimize RSS subject to ||w||_2^2 <= t (Spherical constraint region).
- Lasso: Minimize RSS subject to ||w||_1 <= t (Diamond / Polyhedral constraint region with sharp corners aligned with coordinate axes).
The contours of the quadratic RSS loss function first touch the constraint boundary at a corner of the L1 diamond with high probability, setting that parameter exactly to 0. For the L2 sphere, tangency occurs at smooth points where both coordinates are non-zero!

PCA Mathematical Foundation:
Given centered data matrix X (N x d):
Sample covariance matrix Sigma = (1/N) X^T X.
First principal component direction u_1 maximizes variance u_1^T Sigma u_1 subject to ||u_1||_2 = 1.
Lagrangian: L(u_1, lambda) = u_1^T Sigma u_1 - lambda (u_1^T u_1 - 1).
dL/du_1 = 2 Sigma u_1 - 2 lambda u_1 = 0 => Sigma u_1 = lambda u_1.
Thus, principal directions ARE the eigenvectors of the covariance matrix, and the variance explained by the k-th component is its corresponding eigenvalue lambda_k!
''',
        examTraps: [
          'TRAP: PCA requires centering data first (subtracting mean). If data is not zero-centered, the first principal component points toward the mean of the data rather than the direction of maximum variance!',
          'TRAP: Ridge regression closed form: (X^T X + lambda I)^-1 always exists because adding lambda I (lambda > 0) makes the matrix strictly positive definite and invertible even if X^T X is singular!',
        ],
        solvedExample: '''
[Problem]
A 2D dataset has covariance matrix Sigma = [[5, 2], [2, 2]].
Find: (i) Eigenvalues of Sigma, (ii) The percentage of total variance captured by the first principal component.

[Step-by-Step Solution]
1. Characteristic equation:
   det(Sigma - lambda I) = (5 - lambda)(2 - lambda) - (2)(2) = 0
   lambda^2 - 7 lambda + 10 - 4 = 0 => lambda^2 - 7 lambda + 6 = 0.
   (lambda - 6)(lambda - 1) = 0 => lambda_1 = 6, lambda_2 = 1.
2. Total variance:
   Trace(Sigma) = lambda_1 + lambda_2 = 6 + 1 = 7.
3. Variance explained by first component:
   Ratio = lambda_1 / (lambda_1 + lambda_2) = 6 / 7 = 0.8571 (85.71%).

[Final Answer]
(i) lambda = {6, 1}; (ii) 85.71% of total variance.
''',
        shortcutTips: [
          'Total variance of all principal components is ALWAYS equal to the sum of the variances of original features: sum lambda_i = Trace(Sigma).',
          'In K-Means clustering, the objective function WCSS is strictly non-increasing at every single iteration.',
        ],
      ),
    ],
  ),

  // 5. ARTIFICIAL INTELLIGENCE & DEEP LEARNING (GATE DA)
  const SubjectNote(
    id: 'da_ai_deep_learning',
    title: 'Artificial Intelligence & Deep Learning',
    branch: 'DA',
    subtitle: 'Search Algorithms, A*, Alpha-Beta Pruning, Backprop, CNNs, LSTMs & Transformers',
    iconKey: 'memory',
    freeSections: [
      NoteSection(
        title: 'Search Strategies: BFS, DFS, UCS & A* Heuristics',
        summary: 'State-space graphs, uninformed search, heuristic functions, admissibility, and consistency.',
        keyPoints: [
          'Breadth-First Search (BFS): Queue (FIFO). Optimal if step costs equal. Time O(b^d), Space O(b^d).',
          'Depth-First Search (DFS): Stack (LIFO). Space O(bm) (Highly memory-efficient).',
          'Uniform-Cost Search (UCS): Priority queue ordered by path cost g(n). Equivalent to Dijkstra.',
          'A* Search: Evaluation function f(n) = g(n) + h(n), where g(n) is cost from start, h(n) is heuristic estimate.',
          'Admissible Heuristic: Never overestimates the true cost: 0 <= h(n) <= h^*(n). Guarantees A* tree search optimality.',
          'Consistent Heuristic: Satisfies triangle inequality: h(n) <= c(n, a, n\') + h(n\'). Guarantees graph search optimality without revisiting closed nodes.',
        ],
        coreFormulas: [
          'A* Evaluation: f(n) = g(n) + h(n)',
          'Admissibility: h(n) <= h^*(n)  for all n, with h(Goal) = 0',
          'Consistency: h(n) <= c(n, a, n\') + h(n\')',
        ],
      ),
      NoteSection(
        title: 'Adversarial Search & First-Order Logic',
        summary: 'Minimax algorithm, alpha-beta pruning cutoff rules, CNF conversion, and resolution.',
        keyPoints: [
          'Minimax: Computes optimal strategy for MAX player against optimal MIN opponent in zero-sum game.',
          'Alpha-Beta Pruning: Prunes branches that cannot influence the final minimax decision. Does NOT change the root minimax value!',
          'Alpha (alpha): Highest value found so far for MAX (initialized to -inf).',
          'Beta (beta): Lowest value found so far for MIN (initialized to +inf).',
          'Pruning condition: Prune whenever alpha >= beta.',
          'Propositional Logic: Modus Ponens (A, A -> B |- B); Resolution: (A OR B) AND (NOT B OR C) |- (A OR C).',
          'Horn Clause: At most ONE positive literal. Solvable in linear time.',
        ],
        coreFormulas: [
          'Alpha-Beta Cutoff: Prune branch if alpha >= beta',
          'Modus Ponens: (P AND (P -> Q)) => Q',
          'Resolution: (P OR Q) AND (NOT P OR R) => (Q OR R)',
        ],
      ),
      NoteSection(
        title: 'Neural Networks, Backpropagation & Activation Functions',
        summary: 'Perceptron, Multi-Layer Perceptron (MLP), activation dynamics, and chain rule gradient propagation.',
        keyPoints: [
          'Perceptron: Single-layer threshold unit can ONLY learn linearly separable functions (fails on XOR!).',
          'Activation Functions:',
          '  * Sigmoid: sigma(z) = 1/(1+e^{-z}). Range (0, 1). Vanishing gradient as |z| grows because sigma\'(z) <= 0.25.',
          '  * Tanh: Range (-1, 1). Zero-centered. Max derivative is 1.0 (at z=0).',
          '  * ReLU: max(0, z). Solves vanishing gradient for positive activations. Can suffer from "Dying ReLU".',
          '  * Leaky ReLU: max(alpha z, z) with alpha ~= 0.01.',
          'Backpropagation: Chain Rule application to compute dL/dW and dL/db across all layers backward from loss.',
          'Weight initialization: Xavier/Glorot for Sigmoid/Tanh; He/Kaiming for ReLU.',
        ],
        coreFormulas: [
          'Sigmoid Derivative: sigma\'(z) = sigma(z)(1 - sigma(z)) <= 0.25',
          'Tanh Derivative: tanh\'(z) = 1 - tanh^2(z)',
          'He Initialization: Var(W) = 2 / n_{in}',
          'Weight Update: W := W - eta (dL / dW)',
        ],
      ),
      NoteSection(
        title: 'CNNs, RNNs, LSTMs & Transformer Self-Attention',
        summary: 'Convolutions, receptive fields, pooling, recurrent gates, and scaled dot-product attention.',
        keyPoints: [
          'Convolution Layer: Output spatial dimension W_{out} = floor((W_{in} - K + 2P)/S) + 1.',
          'Number of parameters in Conv layer: (K_w * K_h * C_{in} + 1) * C_{out}.',
          'Pooling: Downsamples feature maps (Max Pooling, Average Pooling). Has ZERO learnable parameters!',
          'Vanishing Gradient in RNNs: BPTT over long sequences causes gradients to explode or vanish exponentially.',
          'LSTM: Solves vanishing gradients via Cell State C_t controlled by 3 gates: Forget f_t, Input i_t, Output o_t.',
          'Transformer Self-Attention: Attention(Q, K, V) = softmax(Q K^T / sqrt(d_k)) V.',
        ],
        coreFormulas: [
          'Conv Output Dimension: O = floor((W - K + 2P) / S) + 1',
          'Conv Parameters: (K x K x C_{in} + 1) x C_{out}',
          'Attention(Q, K, V) = softmax((Q K^T) / sqrt(d_k)) V',
          'LSTM Gates: f_t = sigma(W_f [h_{t-1}, x_t] + b_f)',
        ],
      ),
    ],
    proSections: [
      ProNoteSection(
        title: 'Alpha-Beta Pruning Cutoffs & Minimax Proofs',
        inDepthTheory: '''
Alpha-Beta Pruning in minimax trees is a classic GATE examination question.
Remember the two key rules:
1. MAX node updates alpha: alpha = max(alpha, child_val). Prune if child_val >= beta.
2. MIN node updates beta: beta = min(beta, child_val). Prune if child_val <= alpha.
In ideal move ordering (best moves evaluated first), Alpha-Beta reduces effective branching factor from b to sqrt(b), doubling the searchable search depth!
In worst-case move ordering (worst moves evaluated first), no pruning occurs and all b^d leaves are evaluated.
''',
        examTraps: [
          'TRAP: In minimax trees, children of MAX are MIN nodes, and children of MIN are MAX nodes. Do not mix up which player is evaluating the level!',
          'TRAP: In A* search, if heuristic is admissible but NOT consistent, graph search using a closed set can fail to find the optimal path unless re-opening of closed nodes is allowed.',
        ],
        solvedExample: '''
[Problem]
A Minimax game tree has root MAX at depth 0.
Depth 1 MIN node Left has children with terminal leaf values: 4, 7.
Depth 1 MIN node Right has first child with terminal value 2.
Will alpha-beta pruning prune the second child of Right?

[Step-by-Step Solution]
1. Left MIN node evaluates first child 4: beta_Left = min(inf, 4) = 4.
2. Left MIN node evaluates second child 7: beta_Left = min(4, 7) = 4.
3. Left MIN returns 4 to root MAX.
   Root MAX updates: alpha_Root = max(-inf, 4) = 4, beta_Root = inf.
4. Search proceeds to Right MIN node with inherited [alpha = 4, beta = inf].
5. Right MIN evaluates first child: value = 2.
   Right MIN updates: beta_Right = min(inf, 2) = 2.
6. Check cutoff condition:
   Is alpha >= beta?
   alpha = 4 >= beta = 2 is TRUE!
   Therefore, PRUNING OCCURS! The second child of Right is pruned.

[Final Answer]
Yes, the second child of Right is pruned because alpha (4) >= beta (2).
''',
        shortcutTips: [
          'Whenever a MIN node encounters a child value <= parent MAX\'s alpha, prune all remaining siblings immediately.',
          'Alpha values NEVER decrease; Beta values NEVER increase.',
        ],
      ),
      ProNoteSection(
        title: 'CNN Architecture Parameter Mathematics & Receptive Fields',
        inDepthTheory: '''
Understanding CNN layers mathematically:
1. Spatial Output Formula:
   W_{out} = floor( (W_{in} - K + 2P) / S ) + 1.
2. Learnable Parameters:
   Conv layer with C_{in} input channels, C_{out} output filters of size K x K:
   Weights = K * K * C_{in} * C_{out}.
   Biases = C_{out} (1 bias scalar per filter).
   Total = C_{out} * (K^2 * C_{in} + 1).
3. Receptive Field (RF):
   For layer l with stride s_l and kernel k_l:
   RF_l = RF_{l-1} + (k_l - 1) * prod_{i=1}^{l-1} s_i.
Two cascaded 3x3 convolutions with stride 1 have an effective receptive field of 3 + (3-1)*1 = 5x5, but require 2*(3^2) = 18 weights compared to 25 for a single 5x5 filter!
''',
        examTraps: [
          'TRAP: Forgetting bias parameters in CNN calculations. Each output filter has 1 bias scalar. If there are 32 output filters, you MUST add 32 biases to the total parameter count!',
          'TRAP: Pooling layers have NO parameters. Max pooling and average pooling have 0 weights and 0 biases.',
        ],
        solvedExample: '''
[Problem]
An input image of shape 32 x 32 with 3 RGB color channels is passed through a convolutional layer with:
- 16 filters of size 5 x 5
- Stride S = 1
- Padding P = 2
Followed by a 2 x 2 Max Pooling layer with Stride S = 2.
Calculate: (i) Output dimension after convolution, (ii) Number of trainable parameters in Conv layer, (iii) Output dimension after pooling.

[Step-by-Step Solution]
1. Conv output spatial size:
   W_{out} = floor((32 - 5 + 2(2)) / 1) + 1 = floor(31 / 1) + 1 = 32.
   Output shape after Conv: 32 x 32 x 16.
2. Trainable parameters in Conv layer:
   Each filter: (5 * 5 * 3) weights + 1 bias = 75 + 1 = 76 parameters.
   For 16 filters: Total = 16 * 76 = 1,216 parameters.
3. Max Pooling output size:
   W_{pool} = floor((32 - 2) / 2) + 1 = 15 + 1 = 16.
   Output shape after Pooling: 16 x 16 x 16.

[Final Answer]
(i) 32x32x16; (ii) 1,216 parameters; (iii) 16x16x16.
''',
        shortcutTips: [
          'For "Same" padding in CNN with stride 1: P = (K - 1) / 2. Output spatial dimension matches input spatial dimension exactly.',
          'Softmax scale factor 1/sqrt(d_k) in Transformer attention prevents dot products from growing excessively large, avoiding vanishing gradients.',
        ],
      ),
    ],
  ),

  // 6. DATABASE MANAGEMENT & DATA WAREHOUSING (GATE DA)
  const SubjectNote(
    id: 'da_dbms_warehousing',
    title: 'Database Management & Data Warehousing',
    branch: 'DA',
    subtitle: 'Relational Algebra, SQL, Normalization, B+ Trees, Transactions, Star/Snowflake Schema & OLAP',
    iconKey: 'storage',
    freeSections: [
      NoteSection(
        title: 'Relational Algebra & Advanced SQL Operations',
        summary: 'Selection, projection, Cartesian product, joins, division, aggregations, and window functions.',
        keyPoints: [
          'Fundamental operators: Selection (sigma), Projection (pi), Union (U), Set Difference (-), Cartesian Product (x), Rename (rho).',
          'Derived operators: Set Intersection, Natural Join, Theta Join, Division. Division is used for "for ALL" queries.',
          'SQL Query Execution Order: FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> DISTINCT -> ORDER BY -> LIMIT.',
          'WHERE vs HAVING: WHERE filters individual row tuples BEFORE grouping; HAVING filters groups AFTER aggregation.',
          'Window Functions: ROW_NUMBER() assigns unique sequential integers; RANK() leaves gaps after ties; DENSE_RANK() leaves NO gaps after ties.',
          'NULL logic: 3-valued logic (TRUE, FALSE, UNKNOWN). NULL = NULL evaluates to UNKNOWN! Always use IS NULL.',
        ],
        coreFormulas: [
          'Natural Join: R JOIN S = pi_{attrs}(sigma_{R.A=S.A}(R x S))',
          'Division: R(A, B) / S(B) = pi_A(R) - pi_A((pi_A(R) x S) - R)',
          'DENSE_RANK() vs RANK(): DENSE_RANK assigns consecutive ranks without skips',
        ],
      ),
      NoteSection(
        title: 'Functional Dependencies, Key Finding & Normal Forms',
        summary: 'Armstrong\'s axioms, attribute closure, minimal cover, candidate keys, 1NF, 2NF, 3NF, and BCNF.',
        keyPoints: [
          'Attribute Closure X^+: Set of all attributes functionally determined by X under F. If X^+ contains all relation attributes, X is a Superkey.',
          'Candidate Key: Minimal superkey (no proper subset is a superkey).',
          '1NF: All attribute values are atomic.',
          '2NF: In 1NF and NO partial dependency (no non-prime attribute depends on proper subset of candidate key).',
          '3NF: For every non-trivial FD X -> Y, either X is Superkey OR Y is Prime attribute.',
          'BCNF: For every non-trivial FD X -> Y, X MUST be a Superkey.',
          'Decomposition guarantees: Any relation can ALWAYS be decomposed into 3NF with Lossless Join AND Dependency Preservation. BCNF may not preserve all dependencies!',
        ],
        coreFormulas: [
          'Lossless Join Condition: (R_1 INTERSECT R_2) -> R_1  OR  (R_1 INTERSECT R_2) -> R_2',
          '3NF condition: X is superkey  OR  Y is prime attribute',
          'BCNF condition: X MUST be superkey',
        ],
      ),
      NoteSection(
        title: 'File Structures, Indexing & B/B+ Trees',
        summary: 'Primary, clustering, secondary indexing, dense vs sparse, and B+ Tree node order mathematics.',
        keyPoints: [
          'Primary Index: Ordered data file on primary key. Sparse index.',
          'Clustering Index: Ordered data file on non-key ordering attribute. Sparse index.',
          'Secondary Index: Unordered data file. Dense index.',
          'B+ Tree properties with node order p (max block pointers):',
          '  * Internal node: Holds at most p pointers and at most (p - 1) search keys.',
          '  * Internal node minimum: At least ceil(p / 2) pointers and ceil(p / 2) - 1 keys (except root).',
          '  * Leaf node: Holds at most (p_leaf - 1) record pointers/keys and 1 pointer to next leaf.',
          'All leaf nodes are at the exact same depth, providing guaranteed O(log n) search, insert, delete.',
        ],
        coreFormulas: [
          'Internal Node Size: p * P_{block} + (p - 1) * K <= Block_Size',
          'Leaf Node Size: (p_{leaf} - 1) * (K + P_{rec}) + P_{block} <= Block_Size',
          'Max records in B+ Tree of height h: N_{max} = (p - 1) * p^{h-1}',
        ],
      ),
      NoteSection(
        title: 'Transactions, Serializability & Data Warehousing (OLAP)',
        summary: 'ACID properties, conflict serializability, strict 2PL, Star/Snowflake schemas, and OLAP cubes.',
        keyPoints: [
          'Conflicting Operations: Belong to different transactions, access the SAME data item, and at least ONE is a WRITE.',
          'Conflict Serializability: A schedule is conflict serializable iff its Precedence Graph has NO CYCLES.',
          'Strict 2PL: All write locks must be held until the transaction COMMITS or ABORTS. Prevents cascading aborts.',
          'Data Warehousing (GATE DA Syllabus Focus):',
          '  * OLTP vs OLAP: OLTP handles day-to-day normalized updates; OLAP handles complex queries across historical dimensional data.',
          '  * Star Schema: Fact table surrounded by completely denormalized dimension tables.',
          '  * Snowflake Schema: Dimension tables are normalized into multiple related tables.',
          '  * OLAP Operations: Roll-up (climb hierarchy), Drill-down (finer detail), Slice (1 dimension value), Dice (subcube across multiple dimensions), Pivot (rotate view).',
        ],
        coreFormulas: [
          'Precedence Graph: Edge T_i -> T_j if T_i operation precedes conflicting T_j operation',
          'Strict 2PL: Shrinking phase releases write locks ONLY at transaction termination',
        ],
      ),
    ],
    proSections: [
      ProNoteSection(
        title: 'B+ Tree Order Calculations & Disk I/O Minimization',
        inDepthTheory: '''
In GATE DA, B+ tree node order calculation questions appear frequently in NAT questions:
Key parameters: Block Size B, Key Size K, Block Pointer P_b, Record Pointer P_r.
1. Order of an internal node p:
   p * P_b + (p - 1) * K <= B => p * (P_b + K) <= B + K => p = floor((B + K) / (P_b + K)).
2. Capacity of a leaf node m:
   m * (K + P_r) + P_b <= B => m = floor((B - P_b) / (K + P_r)).

Fanout and Depth:
If average fanout is f = p / 2, the depth of the tree for N records is:
h ~= ceil( log_f (N / m) ) + 1.
To search for a record, the number of block accesses is at most h (fetching index nodes) + 1 (fetching data record block).
''',
        examTraps: [
          'TRAP: Confusing internal node pointer capacity with leaf node key capacity. Internal nodes point to other disk blocks (P_b), while leaf nodes point to data records (P_r) plus one block pointer to the next leaf!',
          'TRAP: Precedence graph direction. Edge is drawn FROM the earlier transaction TO the later transaction (T_1 -> T_2 if T_1 writes and later T_2 reads).',
        ],
        solvedExample: '''
[Problem]
A database file block size is 1024 bytes. A B+ tree index is constructed with:
- Search key size K = 12 bytes
- Block pointer size P_b = 6 bytes
- Record pointer size P_r = 8 bytes
Calculate: (i) Maximum order of internal node, (ii) Maximum number of record pointers in a leaf node.

[Step-by-Step Solution]
1. Internal Node Order p:
   p * P_b + (p - 1) * K <= Block_Size
   p * 6 + (p - 1) * 12 <= 1024
   18p - 12 <= 1024  =>  18p <= 1036  =>  p <= 57.55.
   Max internal order p = 57.
2. Leaf Node Capacity m:
   m * (K + P_r) + P_b <= Block_Size
   m * (12 + 8) + 6 <= 1024
   20m + 6 <= 1024  =>  20m <= 1018  =>  m <= 50.9.
   Max leaf keys m = 50.

[Final Answer]
(i) Internal order = 57; (ii) Leaf record keys = 50.
''',
        shortcutTips: [
          'If a relation has 2 candidate keys of 1 attribute each (e.g. R(A, B, C) where A and B are keys), then EVERY attribute is prime! Thus, the relation is GUARANTEED to be in 3NF.',
          'Snowflake schema normalization reduces disk storage space, but increases query response time due to additional JOIN operations across decomposed dimension tables.',
        ],
      ),
      ProNoteSection(
        title: 'Star vs Snowflake Schema & Fact Table Measures',
        inDepthTheory: '''
In Data Warehousing for GATE DA:
Fact table measures are categorized as:
1. Fully Additive Measures:
   Can be summed across ALL dimensions (e.g. Sales Revenue, Units Sold).
2. Semi-Additive Measures:
   Can be summed across SOME dimensions, but NOT all.
   Classic Example: Current Bank Balance can be summed across Customer or Branch dimensions, but NOT across the Time dimension (summing balances across 12 months is meaningless!).
3. Non-Additive Measures:
   Cannot be meaningfully summed across any dimension (e.g. Percentages, Unit Ratios, Margins).

Slowly Changing Dimensions (SCD):
- Type 1: Overwrite old value (no historical tracking).
- Type 2: Add a new row with valid date range / flag (complete history preserved).
- Type 3: Add a "Previous" column in the same row (limited history of 1 change).
''',
        examTraps: [
          'TRAP: Summing semi-additive measures across the time dimension. For time-series analysis of balances, use Average or End-of-Period snapshots, never Sum!',
          'TRAP: Assuming Snowflake schema is always better than Star schema. Star schema queries are much faster because they eliminate expensive foreign-key joins between dimension tables.',
        ],
        solvedExample: '''
[Problem]
A retail Data Warehouse fact table contains:
- `sales_amount` (₹)
- `account_balance` (₹)
- `profit_margin_pct` (%)
Classify each measure into Additive, Semi-Additive, or Non-Additive.

[Step-by-Step Solution]
1. `sales_amount`: Can be summed across store, customer, product, and time => Fully Additive.
2. `account_balance`: Can be summed across customers and branches, but NOT across time => Semi-Additive.
3. `profit_margin_pct`: A percentage ratio; summing percentages yields mathematically invalid numbers => Non-Additive.

[Final Answer]
sales_amount: Additive; account_balance: Semi-Additive; profit_margin_pct: Non-Additive.
''',
        shortcutTips: [
          'Roll-Up decreases granularity (e.g. Day -> Month -> Year). Drill-Down increases granularity (Year -> Month -> Day).',
          'Slice fixes 1 dimension to a single value. Dice creates a subcube by selecting ranges across multiple dimensions.',
        ],
      ),
    ],
  ),

  // 7. PYTHON PROGRAMMING, DATA STRUCTURES & ALGORITHMS (GATE DA)
  const SubjectNote(
    id: 'da_python_dsa',
    title: 'Python, Data Structures & Algorithms',
    branch: 'DA',
    subtitle: 'Python Memory Model, NumPy, Big-O, Trees, Heaps, Graph Search & Dynamic Programming',
    iconKey: 'terminal',
    freeSections: [
      NoteSection(
        title: 'Python Core Essentials, Mutability & NumPy Mechanics',
        summary: 'Mutable vs immutable objects, list comprehensions, slicing, broadcasting, and asymptotic lookups.',
        keyPoints: [
          'Mutability: Integers, floats, strings, tuples, and frozensets are IMMUTABLE. Lists, dictionaries, and sets are MUTABLE.',
          'Default Arguments Pitfall: `def foo(x=[])` creates the list once at function definition time, NOT per call.',
          'Time complexities in Python: List append O(1), pop() O(1), pop(0) O(n). Dict get/set O(1) average. Set add/in O(1) average.',
          'NumPy Broadcasting rules: Two dimensions are compatible when they are equal OR one of them is 1. Dimensions matched from right to left!',
          'Slicing in NumPy creates a VIEW (shares underlying memory). In Python standard lists, slicing creates a shallow COPY.',
        ],
        coreFormulas: [
          'NumPy Broadcasting: Shapes (m, 1) and (1, n) broadcast to (m, n)',
          'List Comp: [f(x) for x in iterable if condition]',
          'Generator: (f(x) for x in iterable) - Memory O(1), lazy evaluation',
        ],
      ),
      NoteSection(
        title: 'Asymptotic Analysis & Recurrence Relations',
        summary: 'Big-O, Big-Omega, Big-Theta, Master Theorem, and recursion trees.',
        keyPoints: [
          'Definitions: f(n) = O(g(n)) upper bound; Omega(g(n)) lower bound; Theta(g(n)) tight bound.',
          'Master Theorem for T(n) = a T(n/b) + f(n) with a >= 1, b > 1:',
          '  * Case 1: If f(n) = O(n^{log_b a - epsilon}), then T(n) = Theta(n^{log_b a}).',
          '  * Case 2: If f(n) = Theta(n^{log_b a} * log^k n), then T(n) = Theta(n^{log_b a} * log^{k+1} n).',
          '  * Case 3: If f(n) = Omega(n^{log_b a + epsilon}), then T(n) = Theta(f(n)).',
          'Master Theorem Fails when: a not constant, b < 1, or f(n) not polynomially related.',
        ],
        coreFormulas: [
          'Master Theorem Critical Exponent: c_{crit} = log_b(a)',
          'Logarithmic Identities: n^{log_b a} = a^{log_b n}',
          'Sum of Series: sum_{i=1}^n i = n(n+1)/2',
        ],
      ),
      NoteSection(
        title: 'Trees, BST, AVL & Binary Heaps',
        summary: 'Tree properties, inorder traversal, AVL rotations, and heap operations.',
        keyPoints: [
          'Binary Tree: Level l has at most 2^l nodes. Height h has at most 2^{h+1} - 1 nodes.',
          'Inorder traversal of a BST visits nodes in strictly ASCENDING sorted order.',
          'AVL Tree: Self-balancing BST. Balance Factor BF = height(left) - height(right) in {-1, 0, 1}. Fixed via LL, RR, LR, RL rotations.',
          'Binary Heap: Complete binary tree in array: left child = 2i, right child = 2i+1, parent = floor(i/2).',
          'Building a heap from an array takes O(n) time using bottom-up heapify.',
          'Extract-Min / Extract-Max takes O(log n) time.',
        ],
        coreFormulas: [
          'Max nodes in binary tree of height h: 2^{h+1} - 1',
          'Build-Heap Time: O(n)',
          'AVL Balance Factor: BF(v) = height(left) - height(right) in {-1, 0, 1}',
        ],
      ),
      NoteSection(
        title: 'Sorting, Graph Algorithms & Dynamic Programming',
        summary: 'Quicksort, Dijkstra, Kruskal MST, Bellman-Ford, Knapsack, and Longest Common Subsequence.',
        keyPoints: [
          'Comparison Sort Lower Bound: At least Omega(n log n) comparisons in worst case.',
          'Quicksort: Average O(n log n), Worst-case O(n^2) (occurs when pivot is already extreme min/max).',
          'Dijkstra\'s Algorithm: Single-Source Shortest Path in non-negative weighted graphs in O((V + E) log V) time. Fails on negative edges!',
          'Bellman-Ford: Handles negative weights and detects negative weight cycles in O(V * E) time.',
          'Kruskal\'s MST: Greedy with Disjoint Set Union (DSU) in O(E log E) time.',
          '0/1 Knapsack: DP state DP[i][w] = max(DP[i-1][w], val[i-1] + DP[i-1][w - wt[i-1]]).',
        ],
        coreFormulas: [
          'Dijkstra with Min-Heap: O((V + E) log V)',
          'Bellman-Ford Time: O(V * E)',
          '0/1 Knapsack: DP[i, w] = max(DP[i-1, w], DP[i-1, w-w_i] + v_i)',
        ],
      ),
    ],
    proSections: [
      ProNoteSection(
        title: 'Master Theorem Traps & Dijkstra Failure Mechanics',
        inDepthTheory: '''
In GATE DA, Master Theorem traps are tested frequently:
Trap example: T(n) = 2 T(n/2) + n / log n.
Here, a = 2, b = 2, so n^{log_b a} = n^1.
f(n) = n / log n = n * (log n)^-1.
Students often incorrectly apply Case 2 with k = -1. However, Case 2 ONLY applies for k >= 0!
For k = -1, the recurrence solves to T(n) = Theta(n log log n) via recursion tree summation.

Dijkstra's Algorithm with Negative Edges:
Dijkstra greedily marks a vertex as "visited" and permanently fixes its distance when extracted from the priority queue. If a subsequent negative edge provides a shorter path to an already visited vertex, Dijkstra will NOT re-evaluate it, producing an incorrect shortest path.
''',
        examTraps: [
          'TRAP: In Quicksort, worst-case time O(n^2) occurs when the input is already sorted (if choosing first or last element as pivot). Using randomized pivot avoids this.',
          'TRAP: Python dict keys MUST be immutable (hashable). A tuple containing a mutable list cannot be a dict key!',
        ],
        solvedExample: '''
[Problem]
Find the length of the Longest Common Subsequence (LCS) between strings:
X = "ABCBDAB" and Y = "BDCAB".

[Step-by-Step Solution]
1. DP recurrence:
   If X[i-1] == Y[j-1]: L[i, j] = 1 + L[i-1, j-1]
   Else: L[i, j] = max(L[i-1, j], L[i, j-1]).
2. Trace optimal matches:
   Subsequence "B" - "C" - "A" - "B" (Length 4).
   Subsequence "B" - "D" - "A" - "B" (Length 4).
3. Maximum LCS length = 4.

[Final Answer]
Length of LCS is 4.
''',
        shortcutTips: [
          'Sum of degrees in any graph = 2 * |E| (Handshaking Lemma). Number of vertices with odd degree MUST be even.',
          'Building a max-heap of size n: total swaps <= n.',
        ],
      ),
      ProNoteSection(
        title: 'Dynamic Programming Space Optimization & Graph MSTs',
        inDepthTheory: '''
Space optimization in Dynamic Programming:
1. 0/1 Knapsack: Standard table is (N+1) x (W+1). Since DP[i][w] only depends on row i-1, we can reduce space from O(N * W) to O(W) by maintaining a single 1D array of size W+1 and iterating capacity w backwards from W down to wt[i].
2. Fibonacci / Climbing Stairs: DP[i] = DP[i-1] + DP[i-2] requires only two variables (O(1) space).

Minimum Spanning Tree (MST) Cut Property:
For any cut (S, V - S) of a connected graph G, the minimum weight edge crossing the cut is ALWAYS part of some MST.
If all edge weights in a graph are distinct, the graph has a UNIQUE MST.
''',
        examTraps: [
          'TRAP: Prim\'s algorithm vs Kruskal\'s algorithm: Prim maintains a single growing connected tree at every step, whereas Kruskal maintains a forest of disconnected components that merge.',
          'TRAP: Shortest path vs MST: The shortest path tree is NOT necessarily a minimum spanning tree, and an MST does not guarantee shortest paths between pairs of vertices.',
        ],
        solvedExample: '''
[Problem]
A knapsack has capacity W = 5. Items available:
Item 1: wt = 2, val = 3
Item 2: wt = 3, val = 4
Item 3: wt = 4, val = 5
Find the maximum achievable value using 0/1 Knapsack.

[Step-by-Step Solution]
1. Initialize DP array of size 6: [0, 0, 0, 0, 0, 0].
2. Process Item 1 (wt=2, val=3):
   w from 5 down to 2:
   DP[5] = max(0, 3 + DP[3]) = 3
   DP[4] = max(0, 3 + DP[2]) = 3
   DP[3] = max(0, 3 + DP[1]) = 3
   DP[2] = max(0, 3 + DP[0]) = 3
   Array: [0, 0, 3, 3, 3, 3].
3. Process Item 2 (wt=3, val=4):
   w from 5 down to 3:
   DP[5] = max(3, 4 + DP[2]) = max(3, 4 + 3) = 7
   DP[4] = max(3, 4 + DP[1]) = max(3, 4 + 0) = 4
   DP[3] = max(3, 4 + DP[0]) = max(3, 4 + 0) = 4
   Array: [0, 0, 3, 4, 4, 7].
4. Process Item 3 (wt=4, val=5):
   w from 5 down to 4:
   DP[5] = max(7, 5 + DP[1]) = max(7, 5 + 0) = 7
   DP[4] = max(4, 5 + DP[0]) = max(4, 5 + 0) = 5
   Array: [0, 0, 3, 4, 5, 7].

[Final Answer]
Maximum value is 7 (achieved by choosing Item 1 and Item 2).
''',
        shortcutTips: [
          'Number of spanning trees in a complete graph K_n is n^{n-2} (Cayley\'s Formula). For K_4, it is 4^2 = 16.',
          'Binary search on answer pattern applies whenever feasibility function is monotonic (e.g. FFFFTTTT).',
        ],
      ),
    ],
  ),

  // =========================================================================
  // ==================== GATE CS/IT (COMPUTER SCIENCE & IT) ==================
  // =========================================================================

  // 8. OPERATING SYSTEMS (GATE CS/IT)
  const SubjectNote(
    id: 'cs_operating_systems',
    title: 'Operating Systems',
    branch: 'CSIT',
    subtitle: 'Process Scheduling, Synchronization, Semaphores, Deadlocks, Paging, Virtual Memory & Inodes',
    iconKey: 'computer',
    freeSections: [
      NoteSection(
        title: 'Process Management, CPU Scheduling & Threads',
        summary: 'States, PCB, context switching, FCFS, SJF, SRTF, Round Robin, and scheduling metrics.',
        keyPoints: [
          'Process States: New -> Ready <-> Running -> Terminated (and Blocked/Waiting).',
          'Metrics: Turnaround Time = Completion - Arrival. Waiting Time = Turnaround - Burst.',
          'Preemptive vs Non-preemptive: Shortest Remaining Time First (SRTF) is optimal for minimizing average waiting time.',
          'Round Robin: Time quantum q choice is critical. Large q degenerates into FCFS; small q causes high context switch overhead.',
          'User vs Kernel threads: User threads are fast to create, but one blocking system call blocks the entire process.',
        ],
        coreFormulas: [
          'TAT = Completion Time - Arrival Time',
          'Waiting Time = Turnaround Time - Burst Time',
          'SJF/SRTF gives minimum average waiting time',
        ],
      ),
      NoteSection(
        title: 'Process Synchronization, Semaphores & Deadlocks',
        summary: 'Critical section requirements, Peterson\'s algorithm, semaphores, Banker\'s algorithm, and safety checks.',
        keyPoints: [
          'Critical Section 3 Requirements: Mutual Exclusion (mandatory), Progress (mandatory), Bounded Waiting.',
          'Peterson\'s Solution: Software 2-process synchronization using `flag[2]` and `turn`.',
          'Semaphores: Wait(S) decrements S; Signal(S) increments S. Counting semaphore initialized to k allows k processes into critical region concurrently.',
          '4 Necessary Conditions for Deadlock: Mutual Exclusion, Hold and Wait, No Preemption, Circular Wait.',
          'Banker\'s Algorithm: Avoidance algorithm. Need = Max - Allocation. If Need <= Available, process finishes.',
        ],
        coreFormulas: [
          'Need Matrix = Max Matrix - Allocation Matrix',
          'Resource Safety: Need_i <= Available => Available := Available + Allocation_i',
          'Counting Semaphore: If value is -k, exactly k processes are waiting in queue',
        ],
      ),
      NoteSection(
        title: 'Memory Management, Paging & Virtual Memory',
        summary: 'Address translation, TLB hit math, page replacement algorithms, Belady\'s anomaly, and thrashing.',
        keyPoints: [
          'Paging: Virtual Pages to Physical Frames. Eliminates external fragmentation, internal fragmentation remains on last page.',
          'Address Translation: Virtual address = (Page Number p, Page Offset d). Physical = (Frame Number f, Page Offset d).',
          'Effective Memory Access Time (EMAT): EMAT = h * (t_{TLB} + t_m) + (1 - h) * (t_{TLB} + 2 t_m) for single-level page tables.',
          'Page Replacement Algorithms: FIFO (can suffer from Belady\'s Anomaly); Optimal (benchmark); LRU (stack algorithm, immune to Belady).',
          'Thrashing: CPU spends more time swapping pages than executing instructions.',
        ],
        coreFormulas: [
          'EMAT = h(t_{tlb} + t_m) + (1-h)(t_{tlb} + (k+1)t_m)  (for k-level paging)',
          'Page Offset bits = log_2(Page_Size)',
          'Page Table Entries = 2^{Virtual_Bits} / Page_Size',
        ],
      ),
    ],
    proSections: [
      ProNoteSection(
        title: 'Multi-Level Paging Math & Effective Memory Access Time',
        inDepthTheory: '''
In GATE CS/IT, memory architecture numericals test multi-level page tables and TLBs:
1. Address Partitioning:
   Offset bits = log_2(Page_Size).
   Entries per page table = Page_Size / PTE_Size.
   Bits per level index = log_2(Entries per page table).
2. Effective Memory Access Time (EMAT):
   For k-level paging with TLB hit ratio h:
   - If TLB Hit: t_{tlb} + t_m (1 access to main memory for the actual data).
   - If TLB Miss: t_{tlb} + k * t_m (page table lookups) + t_m (actual data) = t_{tlb} + (k + 1) t_m.
   EMAT = h * (t_{tlb} + t_m) + (1 - h) * [t_{tlb} + (k + 1) t_m].
''',
        examTraps: [
          'TRAP: In EMAT calculations, check whether TLB search and main memory access occur in parallel or in series. If parallel: EMAT = h * max(t_tlb, t_m) + (1 - h) * (t_tlb + t_m). If series: add t_tlb to both paths.',
          'TRAP: Banker\'s algorithm safety state is NOT the same as deadlock-free state. Every unsafe state is not currently deadlocked, but may lead to deadlock.',
        ],
        solvedExample: '''
[Problem]
A 2-level paging system has 32-bit virtual addresses, 4 KB page size, 4-byte Page Table Entries (PTE), and a TLB with access time 10 ns. Main memory access time is 100 ns.
If the TLB hit ratio is 90%, calculate EMAT assuming serial TLB lookup.

[Step-by-Step Solution]
1. Offset bits = log_2(4 KB) = 12 bits.
2. Virtual address bits for page table indexing = 32 - 12 = 20 bits.
3. Level 1 and Level 2 lookups take 2 memory accesses.
4. EMAT formula for 2-level paging:
   TLB Hit: 10 + 100 = 110 ns.
   TLB Miss: 10 + 2(100) + 100 = 310 ns.
5. EMAT = 0.90 * 110 + 0.10 * 310 = 99 + 31 = 130 ns.

[Final Answer]
EMAT = 130 ns.
''',
        shortcutTips: [
          'In Round Robin scheduling, if burst times of all n processes are equal to quantum q, then every process finishes in the very first cycle with 0 waiting time for the first process.',
          'LRU and Optimal page replacement are immune to Belady\'s Anomaly because they belong to the inclusion family of stack algorithms.',
        ],
      ),
      ProNoteSection(
        title: 'Unix Inode File Capacity & Disk Scheduling Math',
        inDepthTheory: '''
Unix Inode Maximum File Size:
An Inode structure consists of:
- 12 Direct block pointers
- 1 Singly indirect block pointer
- 1 Doubly indirect block pointer
- 1 Triply indirect block pointer
Let block size be B bytes and disk block pointer be P bytes:
- Direct capacity: 12 * B.
- Singly indirect: (B / P) * B.
- Doubly indirect: (B / P)^2 * B.
- Triply indirect: (B / P)^3 * B.
Total maximum file size is the sum of all 4 tiers!

Disk Scheduling Algorithms:
- FCFS: Serves requests in arrival order (no reordering).
- SSTF: Shortest Seek Time First (closest cylinder first; can cause starvation).
- SCAN (Elevator): Moves in one direction servicing requests until the end, then reverses.
- C-SCAN: Moves in one direction servicing requests to the end, then returns directly to start without servicing requests.
''',
        examTraps: [
          'TRAP: In SCAN vs LOOK: SCAN goes all the way to the end disk cylinder (e.g. 0 or 199), whereas LOOK only goes to the last requested cylinder in that direction.',
          'TRAP: Inode pointer division: Ensure you compute B / P (number of pointers per block) accurately before raising to powers.',
        ],
        solvedExample: '''
[Problem]
An Inode has 12 direct pointers, 1 singly indirect, and 1 doubly indirect pointer.
Disk block size is 4 KB and disk block pointer size is 4 bytes.
Calculate the maximum file size supported by this Inode.

[Step-by-Step Solution]
1. Number of pointers per indirect block:
   Pointers per block = 4 KB / 4 B = 4096 / 4 = 1024 = 2^10 pointers.
2. Direct pointers capacity:
   12 * 4 KB = 48 KB.
3. Singly indirect capacity:
   1024 * 4 KB = 4096 KB = 4 MB.
4. Doubly indirect capacity:
   1024 * 1024 * 4 KB = 1024 * 4 MB = 4096 MB = 4 GB.
5. Total capacity = 48 KB + 4 MB + 4 GB ~= 4.004 GB.

[Final Answer]
Maximum file size is approximately 4.004 GB.
''',
        shortcutTips: [
          'C-SCAN provides more uniform waiting time than SCAN because it does not reverse direction immediately.',
          'Counting semaphore value = S_0 + Signal_calls - Wait_calls.',
        ],
      ),
    ],
  ),

  // 9. COMPUTER NETWORKS (GATE CS/IT)
  const SubjectNote(
    id: 'cs_computer_networks',
    title: 'Computer Networks',
    branch: 'CSIT',
    subtitle: 'OSI Model, Sliding Window, CSMA/CD, IPv4 Subnetting, Routing & TCP Congestion Control',
    iconKey: 'hub',
    freeSections: [
      NoteSection(
        title: 'Data Link Layer: Framing, Flow Control & CRC',
        summary: 'Transmission vs propagation delays, Stop-and-Wait, Go-Back-N, Selective Repeat, and CRC polynomials.',
        keyPoints: [
          'Delays: Transmission Delay T_t = L / B. Propagation Delay T_p = d / v.',
          'Propagation parameter: a = T_p / T_t.',
          'Stop-and-Wait Efficiency: eta = 1 / (1 + 2a).',
          'Go-Back-N (GBN): Sender window size W_s = 2^k - 1, Receiver window W_r = 1. Uses cumulative ACKs.',
          'Selective Repeat (SR): W_s = W_r = 2^{k-1}. Independent ACKs; only dropped packets are retransmitted.',
          'CRC: If generator polynomial G(x) has degree r, append r zeros to data and divide modulo-2.',
        ],
        coreFormulas: [
          'T_t = L / B  ;  T_p = Distance / Speed',
          'Stop-and-Wait Efficiency: eta = 1 / (1 + 2a)',
          'GBN Window: W_s <= 2^k - 1  ;  W_r = 1',
          'SR Window: W_s + W_r <= 2^k  =>  W_s = W_r = 2^{k-1}',
        ],
      ),
      NoteSection(
        title: 'Network Layer: IPv4 Addressing, Subnetting & Routing',
        summary: 'CIDR, VLSM, fragmentation offsets, Bellman-Ford count-to-infinity, and OSPF.',
        keyPoints: [
          'IPv4 Header: 20 to 60 bytes. Total length (16 bits). TTL decremented at each router.',
          'Fragmentation: Fragment Offset is measured in 8-byte units! All fragments except the last must have Total Length as a multiple of 8.',
          'CIDR Subnetting: Prefix /n leaves (32 - n) host bits. Usable host IPs = 2^{32-n} - 2.',
          'Distance Vector Routing: Based on Bellman-Ford. Count-to-Infinity problem mitigated by Split Horizon and Poison Reverse.',
          'Link State Routing: Based on Dijkstra. Every router floods entire topology via LSAs.',
        ],
        coreFormulas: [
          'Usable Hosts = 2^{32 - n} - 2',
          'Fragment Offset = (Bytes preceding fragment) / 8',
          'Minimum CSMA/CD Frame Size: L_{min} = 2 * T_p * B',
        ],
      ),
      NoteSection(
        title: 'Transport Layer: TCP Congestion Control & 3-Way Handshake',
        summary: 'TCP header, sliding window, Slow Start, Congestion Avoidance, Fast Retransmit, and Fast Recovery.',
        keyPoints: [
          'TCP Connection Establishment: 3-way handshake (SYN -> SYN-ACK -> ACK). Teardown uses 4-way handshake.',
          'TCP Congestion Control Phases:',
          '  1. Slow Start: Congestion Window (cwnd) starts at 1 MSS and DOUBLES every RTT until ssthresh.',
          '  2. Congestion Avoidance: Once cwnd >= ssthresh, cwnd increases linearly by 1 MSS per RTT.',
          '  3. Timeout: ssthresh = cwnd / 2. cwnd reset to 1 MSS (in Tahoe).',
          '  4. 3 Duplicate ACKs (Reno): ssthresh = cwnd / 2, cwnd set to ssthresh, resumes linear growth.',
        ],
        coreFormulas: [
          'Slow Start: cwnd_{t+1} = 2 * cwnd_t',
          'Congestion Avoidance: cwnd_{t+1} = cwnd_t + 1 MSS per RTT',
          'TCP Throughput ~= (1.22 * MSS) / (RTT * sqrt(p))',
        ],
      ),
    ],
    proSections: [
      ProNoteSection(
        title: 'TCP Congestion Window Progression & Sliding Window Math',
        inDepthTheory: '''
In GATE CS/IT, TCP congestion window trace questions appear frequently:
Suppose ssthresh is initially 16 MSS, and cwnd starts at 1 MSS:
- RTT 1: cwnd = 1 (Slow Start)
- RTT 2: cwnd = 2
- RTT 3: cwnd = 4
- RTT 4: cwnd = 8
- RTT 5: cwnd = 16 (Reaches ssthresh, switches to Congestion Avoidance)
- RTT 6: cwnd = 17 (Additive Increase)
- RTT 7: cwnd = 18 ...
If a TIMEOUT occurs at cwnd = 24:
New ssthresh = 24 / 2 = 12 MSS.
TCP Tahoe resets cwnd to 1 MSS.
TCP Reno with 3 Duplicate ACKs sets cwnd = ssthresh = 12 MSS and continues linear additive increase.
''',
        examTraps: [
          'TRAP: In CSMA/CD, the minimum frame size formula is L_{min} = 2 * T_p * B. Students frequently forget the factor of 2!',
          'TRAP: Fragment offset units. The Fragment Offset header field counts in 8-byte blocks. If 800 bytes precede the fragment, offset is 800 / 8 = 100, NOT 800!',
        ],
        solvedExample: '''
[Problem]
A 1 Gbps network has distance 2000 km between sender and receiver. Propagation speed is 2 x 10^8 m/s.
Packets are 1000 bytes.
Find the minimum number of sequence number bits required for a Go-Back-N protocol to achieve 100% link utilization.

[Step-by-Step Solution]
1. T_p = (2 x 10^6 m) / (2 x 10^8 m/s) = 10 ms.
2. T_t = (1000 * 8 bits) / 10^9 bps = 8 x 10^-6 s = 0.008 ms.
3. a = T_p / T_t = 10 ms / 0.008 ms = 1250.
4. For 100% utilization: W_s >= 1 + 2a = 1 + 2(1250) = 2501.
5. In Go-Back-N: W_s <= 2^k - 1 => 2^k - 1 >= 2501 => 2^k >= 2502.
   2^11 = 2048, 2^12 = 4096 => k = 12 bits.

[Final Answer]
Minimum bits required k = 12 bits.
''',
        shortcutTips: [
          'Subnet mask /28 has 4 host bits. 2^4 = 16 total IPs, with 16 - 2 = 14 usable hosts per subnet.',
          'Stop-and-Wait efficiency is always less than 50% whenever propagation delay T_p > transmission delay T_t (i.e. a > 0.5).',
        ],
      ),
      ProNoteSection(
        title: 'IPv4 CIDR Subnetting & Address Allocation Mastery',
        inDepthTheory: '''
CIDR (Classless Inter-Domain Routing):
IP address block: A.B.C.D / n.
- Network ID: Keep first n bits, set remaining (32 - n) bits to 0.
- Directed Broadcast Address (DBA): Keep first n bits, set remaining (32 - n) bits to 1.
- Number of assignable IP addresses = 2^{32 - n} - 2.
- Subnet Mask: First n bits are 1s, remaining bits are 0s.
VLSM (Variable Length Subnet Masking) allows allocating custom subnet sizes to departments according to their exact host counts, eliminating address waste.
''',
        examTraps: [
          'TRAP: Forgetting to subtract 2 for network and broadcast addresses when asked for USABLE host IPs.',
          'TRAP: Supernetting / Route Aggregation condition: To aggregate contiguous /24 networks into a /22 supernet, the third octet of the base network MUST be a multiple of 4 (e.g. 192.168.0.0, 192.168.4.0)!',
        ],
        solvedExample: '''
[Problem]
An organization is granted the block 200.10.20.0/24. The administrator needs to create 4 subnets of equal size.
Find: (i) The new subnet mask, (ii) Number of usable hosts per subnet, (iii) Range of the first subnet.

[Step-by-Step Solution]
1. Number of subnets required = 4 = 2^2 => Borrow 2 bits from host portion.
2. New prefix length = 24 + 2 = /26.
   Subnet mask = 255.255.255.192.
3. Host bits remaining = 32 - 26 = 6 bits.
   Usable hosts per subnet = 2^6 - 2 = 64 - 2 = 62 hosts.
4. First subnet range:
   Network ID: 200.10.20.0
   Usable host range: 200.10.20.1 to 200.10.20.62
   Broadcast address: 200.10.20.63.

[Final Answer]
(i) /26 (255.255.255.192); (ii) 62 hosts; (iii) 200.10.20.1 - 200.10.20.62.
''',
        shortcutTips: [
          '/30 subnet leaves 2 host bits: exactly 2 usable hosts. Perfect for point-to-point router links.',
          'In distance vector routing, split horizon prevents loops by not advertising a route back on the interface from which it was learned.',
        ],
      ),
    ],
  ),

  // 10. THEORY OF COMPUTATION & AUTOMATA (GATE CS/IT)
  const SubjectNote(
    id: 'cs_theory_of_computation',
    title: 'Theory of Computation & Automata',
    branch: 'CSIT',
    subtitle: 'DFA, NFA, Minimization, Regular Languages, CFG, Pushdown Automata & Turing Decidability',
    iconKey: 'code',
    freeSections: [
      NoteSection(
        title: 'Finite Automata & Regular Expressions',
        summary: 'DFA construction, NFA equivalence, Myhill-Nerode minimization, and Arden\'s Theorem.',
        keyPoints: [
          'Deterministic Finite Automata (DFA): 5-tuple (Q, Sigma, delta, q_0, F). Exactly ONE transition per symbol.',
          'NFA Equivalence: Every NFA can be converted to an equivalent DFA using subset construction (at most 2^n states).',
          'Arden\'s Theorem: If P and Q are regular expressions and P does not contain epsilon, R = Q + RP has a UNIQUE solution R = Q P^*.',
          'Pumping Lemma for Regular Languages: String w with |w| >= p split into w = xyz with |y| >= 1, |xy| <= p, and xy^i z in L for all i >= 0.',
          'DFA Minimization: Table-filling algorithm partitions states in O(n^2) time.',
        ],
        coreFormulas: [
          'Subset Construction: Max DFA states = 2^{|Q_{NFA}|}',
          'Arden\'s Theorem: R = Q + RP  =>  R = Q P^*',
          'Pumping Lemma: w = xyz, |xy| <= p, |y| >= 1, xy^i z in L',
        ],
      ),
      NoteSection(
        title: 'Context-Free Grammars, Languages & Pushdown Automata',
        summary: 'CFG derivations, ambiguity, CNF, GNF, DPDA vs NPDA, and inherent ambiguity.',
        keyPoints: [
          'Ambiguity: A grammar is ambiguous if exists string with >= 2 distinct leftmost derivations.',
          'Chomsky Normal Form (CNF): A -> BC or A -> a. Derivation of string of length n requires EXACTLY 2n - 1 steps.',
          'Pushdown Automata (PDA): Finite control + single infinite LIFO stack.',
          'DCFL is a STRICT SUBSET of CFL (NPDA is strictly more powerful than DPDA, unlike DFA vs NFA!).',
        ],
        coreFormulas: [
          'CNF Derivation Steps for string of length n: 2n - 1 steps',
          'DCFL subset of CFL subset of CSL subset of REC subset of RE',
        ],
      ),
      NoteSection(
        title: 'Turing Machines, Chomsky Hierarchy & Decidability',
        summary: 'Chomsky classification, Halting Problem, Rice\'s Theorem, and undecidability matrix.',
        keyPoints: [
          'Chomsky Hierarchy: Regular (Type 3) < CFL (Type 2) < CSL (Type 1) < RE (Type 0).',
          'Decidable (Recursive): TM always halts (accepts or rejects).',
          'Turing Recognizable (RE): TM halts and accepts if w in L, but may loop infinitely if w not in L.',
          'Halting Problem: Undecidable and not recursive, but Recursively Enumerable.',
          'Rice\'s Theorem: Any non-trivial semantic property of RE languages is UNDECIDABLE.',
        ],
        coreFormulas: [
          'Rice\'s Theorem: Non-trivial language property of RE is undecidable',
          'Post Correspondence Problem (PCP): Undecidable for alphabet size >= 2',
        ],
      ),
    ],
    proSections: [
      ProNoteSection(
        title: 'Language Closure & Decidability Master Matrix',
        inDepthTheory: '''
In GATE CS/IT, closure and decidability questions appear every single year:
Closure Properties Summary:
- Regular: Closed under Union, Intersection, Complement, Concatenation, Kleene Star, Difference, Reversal.
- DCFL: Closed under Complement. NOT closed under Union, Intersection, Concatenation, Kleene Star!
- CFL: Closed under Union, Concatenation, Kleene Star, Reversal. NOT closed under Intersection, Complement, Difference!
- Recursive: Closed under Union, Intersection, Complement, Concatenation, Kleene Star.
- RE: Closed under Union, Intersection, Concatenation, Kleene Star. NOT closed under Complement!

Decidability Summary:
- Emptiness (Is L = empty?): Decidable for Regular and CFL. Undecidable for CSL, REC, RE.
- Equality (Is L_1 = L_2?): Decidable for Regular. Undecidable for CFL, CSL, REC, RE.
- Totality (Is L = Sigma^*?): Decidable for Regular. Undecidable for CFL, CSL, REC, RE.
- Membership (Is w in L?): Decidable for Regular, CFL, CSL, REC. Undecidable for RE.
''',
        examTraps: [
          'TRAP: CFL is NOT closed under intersection. However, intersection of a CFL with a REGULAR language is ALWAYS Context-Free (CFL INTERSECT Regular = CFL).',
          'TRAP: Rice\'s Theorem applies ONLY to properties of the LANGUAGE (semantic), NOT properties of the Turing Machine description or syntax.',
        ],
        solvedExample: '''
[Problem]
Let L_1 be regular and L_2 be context-free.
Determine whether L_2 - L_1 is guaranteed to be context-free.

[Step-by-Step Solution]
1. Set difference formula: L_2 - L_1 = L_2 INTERSECT (L_1)^c.
2. Since L_1 is regular and regular languages are closed under complementation, (L_1)^c is regular.
3. By the Regular Intersection Property of CFLs:
   The intersection of ANY Context-Free Language with a Regular Language is always Context-Free.
4. Therefore, L_2 INTERSECT (L_1)^c is GUARANTEED to be Context-Free.

[Final Answer]
Yes, L_2 - L_1 is always Context-Free.
''',
        shortcutTips: [
          'If a language requires comparing two INDEPENDENT conditions simultaneously (e.g. {a^n b^n c^n}), it CANNOT be context-free.',
          'Complement of an RE language is RE if and only if the language is Recursive.',
        ],
      ),
      ProNoteSection(
        title: 'DFA State Minimization & Myhill-Nerode Distinguishability',
        inDepthTheory: '''
Myhill-Nerode Theorem states that a language L is regular if and only if the set of equivalence classes of the relation R_L is finite.
The number of states in the minimal DFA is EXACTLY equal to the number of equivalence classes of R_L.
Table-Filling Algorithm for DFA Minimization:
1. Mark all pairs (p, q) where p in F and q not in F (final and non-final states are trivially distinguishable by epsilon).
2. For each unmarked pair (p, q) and each symbol a in Sigma:
   If (delta(p, a), delta(q, a)) is already marked, then mark (p, q).
3. Repeat step 2 until no new pairs can be marked.
4. Merge all unmarked pairs into single composite states.
''',
        examTraps: [
          'TRAP: Dead states MUST be included when running DFA minimization! Omitting the dead/trap state will produce an incorrect state count.',
          'TRAP: Minimizing an NFA directly using the table-filling algorithm is INVALID. You MUST convert NFA to DFA first, then minimize the DFA!',
        ],
        solvedExample: '''
[Problem]
Find the minimum number of states in a DFA accepting all binary strings over {0, 1} that end in '01'.

[Step-by-Step Solution]
1. Equivalence classes under Myhill-Nerode:
   Class 1: Strings not ending in 0 or 1 (Start state / strings ending in 11, etc.).
   Class 2: Strings ending in '0'.
   Class 3: Strings ending in '01' (Accepting state).
2. Transitions:
   State 1 on '0' -> State 2; on '1' -> State 1.
   State 2 on '0' -> State 2; on '1' -> State 3.
   State 3 on '0' -> State 2; on '1' -> State 1.
3. All 3 states are pairwise distinguishable.

[Final Answer]
Minimum DFA requires exactly 3 states.
''',
        shortcutTips: [
          'For strings ending in a specific pattern of length k over Sigma: minimum DFA requires exactly (k + 1) states.',
          'For binary numbers divisible by N: minimum DFA requires exactly N states (states correspond to remainders 0, 1, ..., N-1).',
        ],
      ),
    ],
  ),

  // 11. COMPILER DESIGN (GATE CS/IT)
  const SubjectNote(
    id: 'cs_compiler_design',
    title: 'Compiler Design',
    branch: 'CSIT',
    subtitle: 'Lexical Analysis, LL(1) Parsers, LR(0), SLR(1), LALR(1), CLR(1), SDT & Optimization',
    iconKey: 'terminal',
    freeSections: [
      NoteSection(
        title: 'Phases of Compiler & Lexical Analysis',
        summary: 'Compilation pipeline, tokens, lexemes, regular expressions, and DFA token recognizers.',
        keyPoints: [
          'Compiler Phases: Lexical -> Syntax -> Semantic -> Intermediate Code -> Optimizer -> Target Code.',
          'Lexical Phase: Reads characters, produces Tokens. Eliminates whitespace and comments.',
          'Token: Category (e.g. `<id, 1>`). Lexeme: Concrete character sequence in source code.',
          'Symbol Table: Maintains identifier names, types, scopes, and memory offsets across all phases.',
        ],
        coreFormulas: [
          'Lexical: Characters -> Tokens',
          'Syntax: Tokens -> Parse Tree',
          'Semantic: Parse Tree -> Annotated Tree',
        ],
      ),
      NoteSection(
        title: 'Syntax Analysis: LL(1) & Bottom-Up LR Parsers',
        summary: 'FIRST & FOLLOW sets, LL(1) tables, Shift-Reduce conflicts, and LR parser hierarchy.',
        keyPoints: [
          'LL(1) Parser: Left-to-right scan, Leftmost derivation, 1 lookahead. Top-down parser.',
          'LL(1) Grammar Conditions: FIRST(alpha) INTERSECT FIRST(beta) = empty. If epsilon in FIRST(alpha), FIRST(beta) INTERSECT FOLLOW(A) = empty.',
          'LR Parsers Hierarchy: LR(0) subset of SLR(1) subset of LALR(1) subset of CLR(1).',
          'LALR(1) merges states of CLR(1) that have identical LR(0) cores. Can introduce Reduce-Reduce conflicts, but NEVER Shift-Reduce conflicts!',
        ],
        coreFormulas: [
          'LL(1) Conflict Free: FIRST(alpha) INTERSECT FIRST(beta) = empty',
          'State Count: |States_{LR(0)}| = |States_{SLR(1)}| = |States_{LALR(1)}| < |States_{CLR(1)}|',
        ],
      ),
      NoteSection(
        title: 'SDT, Intermediate Code & Basic Blocks',
        summary: 'S-attributed vs L-attributed definitions, three-address code, DAGs, and code optimization.',
        keyPoints: [
          'S-Attributed SDT: Uses ONLY synthesized attributes (evaluated bottom-up from children).',
          'L-Attributed SDT: Uses synthesized attributes AND inherited attributes from parent and LEFT siblings.',
          'Every S-attributed SDT is L-attributed, but not vice-versa.',
          'Basic Block: Sequence of statements where execution enters ONLY at the first statement and leaves ONLY at the last.',
          'DAG: Used for basic block optimization (eliminates local common subexpressions).',
        ],
        coreFormulas: [
          'Three-Address Code: x = y op z',
          'S-Attributed: Bottom-Up evaluation',
          'L-Attributed: Depth-first left-to-right evaluation',
        ],
      ),
    ],
    proSections: [
      ProNoteSection(
        title: 'LL(1) Parser Construction & LR Conflict Resolution',
        inDepthTheory: '''
In GATE CS/IT, FIRST and FOLLOW calculations are common:
Rules for FOLLOW:
1. Put \$ in FOLLOW(S) where S is start symbol.
2. If A -> alpha B beta, then everything in FIRST(beta) except epsilon is in FOLLOW(B).
3. If A -> alpha B or A -> alpha B beta where FIRST(beta) contains epsilon, then everything in FOLLOW(A) is in FOLLOW(B).

LR Conflicts:
- Shift-Reduce (S-R): Item set contains [A -> alpha . a beta] and [B -> gamma .] where 'a' is the lookahead.
- Reduce-Reduce (R-R): Item set contains [A -> alpha .] and [B -> beta .] for the same lookahead.
SLR(1) places reduces ONLY in FOLLOW(A), eliminating many LR(0) conflicts.
CLR(1) uses explicit lookaheads [A -> alpha ., a], eliminating SLR(1) false reduces.
''',
        examTraps: [
          'TRAP: In FOLLOW calculations, FOLLOW of any non-terminal NEVER contains epsilon.',
          'TRAP: Left recursion eliminates a grammar from being LL(1). If grammar has A -> A alpha, it is NEVER LL(1).',
        ],
        solvedExample: '''
[Problem]
Given grammar:
S -> A a | b
A -> A c | S d | epsilon
Find: (i) FIRST(S), (ii) FOLLOW(A).

[Step-by-Step Solution]
1. FIRST(S) = {a, b} (since A -> epsilon implies S -> a).
2. FIRST(A) = {c, d, epsilon}.
3. FOLLOW(A):
   - From S -> A a: 'a' in FOLLOW(A).
   - From A -> A c: 'c' in FOLLOW(A).
   - From A -> S d: S is followed by 'd', so 'd' in FOLLOW(S), which flows back to FOLLOW(A).
4. FOLLOW(A) = {a, c, d}.

[Final Answer]
FIRST(S) = {a, b}; FOLLOW(A) = {a, c, d}.
''',
        shortcutTips: [
          'Number of states in LALR(1) is ALWAYS exactly equal to the number of states in SLR(1) and LR(0). Only the lookaheads differ.',
          'An ambiguous grammar can NEVER be LL(1), SLR(1), LALR(1), or CLR(1).',
        ],
      ),
      ProNoteSection(
        title: 'Basic Blocks Partitioning & DAG Representation',
        inDepthTheory: '''
Identifying Leaders for Basic Blocks:
1. First statement is a Leader.
2. Any statement that is the TARGET of a conditional or unconditional goto/jump is a Leader.
3. Any statement that IMMEDIATELY FOLLOWS a conditional or unconditional goto/jump is a Leader.
A basic block starts at a leader and includes all statements up to, but not including, the next leader or the end of the program.

DAG (Directed Acyclic Graph) for Basic Block:
- Leaves represent initial values of variables or constants.
- Interior nodes represent operations labeled by operators.
- Multiple labels on a node indicate common subexpressions that produce the exact same value.
Evaluating expressions via DAG automatically eliminates redundant computations and dead code!
''',
        examTraps: [
          'TRAP: Forgetting statement immediately following a jump as a leader. Rule 3 is often missed, resulting in undercounting basic blocks!',
          'TRAP: In DAG construction, reassignment to an identifier (e.g. `x = x + 1`) creates a new node or updates variable pointer; it does NOT mutate existing DAG nodes!',
        ],
        solvedExample: '''
[Problem]
Count the number of basic blocks in the following three-address code:
(1) i = 1
(2) j = 1
(3) t1 = 10 * i
(4) t2 = t1 + j
(5) if t2 < 100 goto (3)
(6) i = i + 1
(7) if i < 10 goto (2)

[Step-by-Step Solution]
1. Apply Leader identification rules:
   - Statement (1): First statement => LEADER 1.
   - Statement (2): Target of jump in (7) => LEADER 2.
   - Statement (3): Target of jump in (5) => LEADER 3.
   - Statement (6): Statement following conditional jump in (5) => LEADER 4.
2. Block boundaries:
   - Block 1: Statements (1)
   - Block 2: Statements (2)
   - Block 3: Statements (3), (4), (5)
   - Block 4: Statements (6), (7)
3. Total number of basic blocks = 4.

[Final Answer]
There are 4 basic blocks.
''',
        shortcutTips: [
          'Number of basic blocks equals the number of leaders identified.',
          'In L-Attributed SDT, semantic actions can be placed anywhere in the right-hand side, whereas in S-Attributed SDT, actions are placed ONLY at the extreme end.',
        ],
      ),
    ],
  ),

  // 12. DIGITAL LOGIC & COMPUTER ORGANIZATION (GATE CS/IT)
  const SubjectNote(
    id: 'cs_digital_logic_co',
    title: 'Digital Logic & Computer Organization',
    branch: 'CSIT',
    subtitle: 'K-Maps, Flip-Flops, Counters, IEEE 754, Pipelining, Cache Mapping & Memory Hierarchy',
    iconKey: 'memory',
    freeSections: [
      NoteSection(
        title: 'Boolean Minimization, K-Maps & Combinational Circuits',
        summary: 'Boolean laws, SOP/POS, K-maps, multiplexers, decoders, and full adders.',
        keyPoints: [
          'Universal Gates: NAND and NOR.',
          'K-Map Gray Code: Adjacent cells differ by exactly 1 bit. Groups of 2^k cells eliminate k variables.',
          'Multiplexer (MUX): 2^n:1 MUX has n select lines. Realizes any n-variable function using 2^{n-1}:1 MUX.',
          'Full Adder: Sum = A XOR B XOR C_{in}; Carry = AB + BC_{in} + AC_{in}.',
          'Carry Lookahead Adder: Generate G_i = A_i B_i, Propagate P_i = A_i XOR B_i. Reduces addition delay to O(1).',
        ],
        coreFormulas: [
          'De Morgan: (A + B)\' = A\' B\'  ;  (AB)\' = A\' + B\'',
          'Full Adder Sum: A XOR B XOR C_{in}',
          'Carry Lookahead: C_{i+1} = G_i + P_i C_i',
        ],
      ),
      NoteSection(
        title: 'Sequential Circuits: Flip-Flops & Mod-N Counters',
        summary: 'Latches, JK race-around, T flip-flop, synchronous vs ripple counters, and state transitions.',
        keyPoints: [
          'Race-around in JK: Occurs when J = 1, K = 1, clock pulse width > flip-flop propagation delay. Eliminated by Master-Slave JK.',
          'Characteristic Equations: JK: Q_{next} = J Q\' + K\' Q; T: Q_{next} = T XOR Q; D: Q_{next} = D.',
          'Ripple Counter: Flip-flops in cascade. Delay = n * t_{ff}.',
          'Synchronous Counter: All flip-flops share same clock. Faster.',
          'Ring Counter: Mod-n with n flip-flops. Johnson Counter: Mod-2n with n flip-flops.',
        ],
        coreFormulas: [
          'JK Flip-Flop: Q_{next} = J Q\' + K\' Q',
          'T Flip-Flop: Q_{next} = T XOR Q',
          'Johnson Counter Modulus: 2n states with n flip-flops',
        ],
      ),
      NoteSection(
        title: 'IEEE 754 Floating Point & Instruction Pipelining',
        summary: 'Single/double precision standards, pipeline hazards, CPI, speedup, and cache mapping.',
        keyPoints: [
          'IEEE 754 Single (32 bits): 1 sign bit, 8 exponent (bias = 127), 23 mantissa. Value = (-1)^s * (1.m) * 2^{e - 127}.',
          'Instruction Pipeline: k-stage pipeline executing n instructions takes (k + n - 1) cycles.',
          'Speedup: S = (n * k) / (k + n - 1) -> k as n -> inf.',
          'Hazards: Structural (resource clash), Data (RAW true dependency), Control (branch).',
          'Cache Memory: Average Memory Access Time AMAT = t_{hit} + (Miss Rate) * (Miss Penalty).',
        ],
        coreFormulas: [
          'IEEE 754 Single: (-1)^s x (1.m) x 2^{e - 127}',
          'Pipeline Cycles: Clock Cycles = k + n - 1',
          'Speedup: S = (n x k) / (k + n - 1)',
          'AMAT = t_{cache} + (1 - h) x t_{mem}',
        ],
      ),
    ],
    proSections: [
      ProNoteSection(
        title: 'Cache Address Bit Splitting & Memory Hierarchy Math',
        inDepthTheory: '''
In GATE CS/IT, cache architecture and pipeline hazard math are guaranteed question patterns:
1. Set-Associative Cache Address Format:
   Physical Address is partitioned into: [ Tag | Set Index | Block Offset ]
   - Block Offset bits = log_2(Block Size in bytes).
   - Number of Sets = Total Cache Size / (k * Block Size) for a k-way set-associative cache.
   - Set Index bits = log_2(Number of Sets).
   - Tag bits = Total Physical Address bits - Set Index bits - Block Offset bits.

2. Write Policies:
   - Write-Through: Write to both cache and main memory simultaneously (simple, safe, slower).
   - Write-Back: Write only to cache; update main memory only when dirty block is evicted (faster, uses dirty bit).
''',
        examTraps: [
          'TRAP: In k-way cache, number of sets is Cache_Size / (k * Block_Size), NOT Cache_Size / Block_Size. A common NAT error is dividing only by block size!',
          'TRAP: IEEE 754 implicit leading 1. In normalized IEEE 754, the mantissa has an implicit leading 1 (1.M). Do not write M directly without prepending 1.!',
        ],
        solvedExample: '''
[Problem]
A 32-bit CPU has a 64 KB 4-way set-associative cache with 64-byte blocks.
Find the size of the Tag, Set Index, and Block Offset fields in bits.

[Step-by-Step Solution]
1. Block Offset:
   Block Size = 64 bytes = 2^6 bytes => Block Offset = 6 bits.
2. Number of Sets:
   Total Cache Size = 64 KB = 2^16 bytes.
   Total lines = 2^16 / 2^6 = 2^10 lines.
   4-way set associative => Number of sets = 2^10 / 4 = 2^8 = 256 sets.
   Set Index bits = log_2(2^8) = 8 bits.
3. Tag bits:
   Tag = 32 - (Set Index + Block Offset) = 32 - (8 + 6) = 32 - 14 = 18 bits.

[Final Answer]
Tag = 18 bits, Set Index = 8 bits, Block Offset = 6 bits.
''',
        shortcutTips: [
          'Direct Mapped Cache is a 1-way set-associative cache. Fully Associative cache has exactly 1 set (0 set index bits).',
          'Operand forwarding resolves RAW hazards without stalls when the result is available at the end of the EX stage.',
        ],
      ),
      ProNoteSection(
        title: 'Instruction Pipelining Hazards, Branch Penalties & CPI',
        inDepthTheory: '''
Instruction Pipeline Execution Mechanics:
In an ideal pipeline, Clock Cycles Per Instruction (CPI) = 1.
Real-world hazards introduce stall cycles:
Average CPI = 1 + Stalls_{Data} + Stalls_{Control} + Stalls_{Structural}.
Data Hazards:
- RAW (Read After Write / True Dependency): Instruction j needs result computed by instruction i before i writes to register. Resolved by Operand Forwarding or Stalling.
- WAR (Write After Read / Anti-Dependency): Resolved by register renaming.
- WAW (Write After Write / Output Dependency): Resolved by in-order commit.
Branch Hazard Penalty:
If branch instructions occur with frequency p_b, take b stall cycles, and are taken with probability p_t:
CPI_{avg} = 1 + (p_b * p_t * b).
''',
        examTraps: [
          'TRAP: Without operand forwarding, a RAW dependency where instruction j immediately follows instruction i typically costs 2 stall cycles. With forwarding from EX stage, stall cycles are reduced to 0 for ALU instructions!',
          'TRAP: Load-Use Hazard: Even WITH operand forwarding, a Load instruction followed immediately by an ALU instruction that uses the loaded data REQUIRES 1 stall cycle because memory load finishes at the MEM stage, not EX!',
        ],
        solvedExample: '''
[Problem]
A 5-stage pipeline has stages [IF, ID, EX, MEM, WB] with cycle time 2 ns.
20% of instructions are branch instructions that incur a 2-cycle penalty when taken.
Branches are taken 60% of the time.
Calculate: (i) Average CPI, (ii) Average instruction execution time.

[Step-by-Step Solution]
1. Branch penalty stalls per instruction:
   Stall = Frequency * Probability * Penalty
   Stall = 0.20 * 0.60 * 2 = 0.24 cycles.
2. Average CPI:
   CPI_{avg} = Ideal CPI + Stall = 1 + 0.24 = 1.24.
3. Average instruction execution time:
   Time = CPI_{avg} * Cycle_Time = 1.24 * 2 ns = 2.48 ns.

[Final Answer]
(i) Average CPI = 1.24; (ii) Execution time = 2.48 ns.
''',
        shortcutTips: [
          'Speedup with stalls: S = k / CPI_{avg}. For k=5 stages and CPI=1.25, S = 5 / 1.25 = 4.0x.',
          'Delayed branching fills the branch delay slot with a useful independent instruction that executes regardless of branch outcome.',
        ],
      ),
    ],
  ),

  // 13. PROGRAMMING & DATA STRUCTURES (GATE CS/IT)
  const SubjectNote(
    id: 'cs_data_structures_algo',
    title: 'Programming & Data Structures',
    branch: 'CSIT',
    subtitle: 'C Pointers, Recursion, Trees, Hashing, Sorting, Heaps & Graph Traversals',
    iconKey: 'terminal',
    freeSections: [
      NoteSection(
        title: 'C Programming: Pointers, Recursion & Storage Classes',
        summary: 'Pointer arithmetic, arrays of pointers, recursion stacks, static variables, and parameter passing.',
        keyPoints: [
          'Pointer Arithmetic: If `int *p = 1000` (4-byte int), `p + 1` evaluates to 1004. `*(a + i)` is identical to `a[i]`.',
          'Array Name as Pointer: `a` decays to `&a[0]`. However, `&a` is a pointer to the ENTIRE array of type `int (*)[n]`.',
          'Recursion Stack: Pushes activation records (parameters, local variables, return address) onto stack.',
          'Static variables: Initialized ONCE at compile time and retain values across multiple function calls.',
        ],
        coreFormulas: [
          '*(a + i) == a[i]',
          '*(*(a + i) + j) == a[i][j]',
          'sizeof(a) vs sizeof(&a[0]): Array size vs pointer size',
        ],
      ),
      NoteSection(
        title: 'Stacks, Queues, Linked Lists & Hashing',
        summary: 'Postfix evaluation, circular queues, collision resolution, and open addressing.',
        keyPoints: [
          'Stack Applications: Expression parsing (Infix to Postfix), balanced parentheses, function call stack.',
          'Queue: Circular queue uses `(rear + 1) % N` and `(front + 1) % N`.',
          'Hashing: Chaining has average search time O(1 + alpha) where alpha = n / m.',
          'Open Addressing: Linear Probing (Primary Clustering), Quadratic Probing (Secondary Clustering), Double Hashing.',
        ],
        coreFormulas: [
          'Load Factor: alpha = n / m',
          'Double Hashing probe: h(k, i) = (h_1(k) + i * h_2(k)) % m',
          'Average Search Time in Chaining: 1 + alpha',
        ],
      ),
    ],
    proSections: [
      ProNoteSection(
        title: 'Pointer Precedence Traps & Infix-Postfix Stack Traces',
        inDepthTheory: '''
In GATE CS/IT, C pointer arithmetic questions frequently test operator precedence:
Precedence hierarchy: `()` and `[]` > `*` (dereference) and `++` (postfix) > prefix `++`.
Example: `*p++` dereferences current p, then increments pointer p.
`(*p)++` increments the value pointed to by p.
`*++p` increments pointer p first, then dereferences the new location.
In Infix to Postfix conversion:
Operands are output immediately.
Operators are pushed to the stack based on precedence and associativity (left-associative operators pop equal or higher precedence operators from the stack).
''',
        examTraps: [
          'TRAP: Recursion with static variable. Static variable does NOT get re-initialized on recursive calls. Its state is shared across all activation frames!',
          'TRAP: Double hashing requires h_2(k) to be non-zero and relatively prime to table size m, otherwise it will not probe all table slots.',
        ],
        solvedExample: '''
[Problem]
Predict the output of the following C code snippet:
```c
int f(int n) {
    static int i = 1;
    if (n >= 5) return n;
    n = n + i;
    i++;
    return f(n);
}
int main() {
    printf("%d", f(1));
}
```

[Step-by-Step Solution]
1. Call 1: f(1): i=1. n < 5 => n = 1 + 1 = 2. i becomes 2. Calls f(2).
2. Call 2: f(2): i=2. n < 5 => n = 2 + 2 = 4. i becomes 3. Calls f(4).
3. Call 3: f(4): i=3. n < 5 => n = 4 + 3 = 7. i becomes 4. Calls f(7).
4. Call 4: f(7): n >= 5 is TRUE. Returns 7.
5. Returns bubble up: f(1) returns 7. Output is 7.

[Final Answer]
Output is 7.
''',
        shortcutTips: [
          'In a max-heap with n elements, the smallest element is ALWAYS located in one of the leaf nodes, which occupy indices floor(n/2) + 1 to n.',
          'Postorder traversal of a BST gives root at the very last element. Preorder gives root at the very first element.',
        ],
      ),
      ProNoteSection(
        title: 'Binary Tree Traversals & BST Construction Limits',
        inDepthTheory: '''
Reconstructing Binary Trees from Traversals:
1. Inorder + Preorder: Uniquely constructs ANY binary tree (Preorder gives root, Inorder partitions left and right subtrees).
2. Inorder + Postorder: Uniquely constructs ANY binary tree (Postorder gives root at end, Inorder partitions left and right).
3. Preorder + Postorder: Can ONLY uniquely construct a binary tree if every internal node has EXACTLY 2 children (Strictly Full Binary Tree). In general, it is NOT unique!
4. For Binary Search Trees (BST): Preorder alone OR Postorder alone is SUFFICIENT to reconstruct the tree uniquely, because Inorder is known to be the sorted sequence of the elements!
''',
        examTraps: [
          'TRAP: Assuming Preorder + Postorder can uniquely construct any binary tree. Without Inorder, left vs right child ambiguity remains for nodes with single child.',
          'TRAP: Number of structurally unique binary trees with n unlabeled nodes is given by Catalan Number C_n = (2n)! / ((n+1)! * n!). For n=3: C_3 = 6! / (4! * 3!) = 720 / (24 * 6) = 5 trees.',
        ],
        solvedExample: '''
[Problem]
A Binary Search Tree is constructed by inserting keys in the order:
[30, 20, 10, 25, 40, 35, 50].
Find: (i) Height of the BST (counting edges), (ii) Number of leaf nodes.

[Step-by-Step Solution]
1. Insert 30: Root.
2. Insert 20: Left child of 30.
3. Insert 10: Left child of 20.
4. Insert 25: Right child of 20.
5. Insert 40: Right child of 30.
6. Insert 35: Left child of 40.
7. Insert 50: Right child of 40.
Tree structure:
- Root 30 at level 0.
- Nodes 20, 40 at level 1.
- Nodes 10, 25, 35, 50 at level 2.
Height (edges from root to deepest leaf) = 2.
Leaf nodes: 10, 25, 35, 50 (Total 4 leaf nodes).

[Final Answer]
(i) Height = 2 edges; (ii) 4 leaf nodes.
''',
        shortcutTips: [
          'Number of distinct BSTs that can be formed with n distinct keys is the n-th Catalan number C_n.',
          'Inorder successor of a node with right child is the leftmost node in its right subtree.',
        ],
      ),
    ],
  ),

  // 14. DISCRETE MATHEMATICS & GRAPH THEORY (GATE CS/IT)
  const SubjectNote(
    id: 'cs_discrete_math',
    title: 'Discrete Mathematics & Graph Theory',
    branch: 'CSIT',
    subtitle: 'Propositional Logic, Combinatorics, Recurrences, Relations, Planarity & Graph Coloring',
    iconKey: 'functions',
    freeSections: [
      NoteSection(
        title: 'Propositional & First-Order Predicate Logic',
        summary: 'Tautologies, implications, quantifiers, and equivalence laws.',
        keyPoints: [
          'Tautology: Always TRUE (P OR NOT P). Contradiction: Always FALSE (P AND NOT P).',
          'Conditional Equivalence: P -> Q == NOT P OR Q. Contrapositive: P -> Q == NOT Q -> NOT P.',
          'Quantifier Negation: NOT(for all x P(x)) == exists x NOT P(x); NOT(exists x P(x)) == for all x NOT P(x).',
          'Quantifier Distribution: for all x (P(x) AND Q(x)) == (for all x P(x)) AND (for all x Q(x)). Does NOT distribute over OR!',
        ],
        coreFormulas: [
          'P -> Q == NOT P OR Q',
          'Contrapositive: P -> Q == NOT Q -> NOT P',
          'NOT(for all x P(x)) == exists x NOT P(x)',
        ],
      ),
      NoteSection(
        title: 'Relations, Posets, Lattices & Combinatorics',
        summary: 'Equivalence relations, partial orders, Hasse diagrams, Pigeonhole Principle, and Generating Functions.',
        keyPoints: [
          'Equivalence: Reflexive, Symmetric, Transitive.',
          'Partial Order (Poset): Reflexive, Antisymmetric, Transitive.',
          'Lattice: Poset where every pair has unique LUB and GLB.',
          'Pigeonhole Principle: If n items in k boxes (n > k), at least one box has ceil(n / k) items.',
          'Inclusion-Exclusion: |A U B U C| = |A| + |B| + |C| - sum |A INTERSECT B| + |A INTERSECT B INTERSECT C|.',
        ],
        coreFormulas: [
          'Pigeonhole: ceil(n / k) items in at least one box',
          'Derangements: D_n = n! sum_{i=0}^n (-1)^i / i! ~= n! / e',
          'Generating function for 1/(1-x): sum_{n=0}^inf x^n',
        ],
      ),
      NoteSection(
        title: 'Graph Theory: Trees, Eulerian, Hamiltonian & Planarity',
        summary: 'Handshaking lemma, Euler formula, planar graph bounds, chromatic numbers, and bipartite graphs.',
        keyPoints: [
          'Handshaking Lemma: sum deg(v) = 2 |E|. Vertices of odd degree are ALWAYS EVEN in number.',
          'Bipartite Graph: No odd cycles. Chromatic number chi(G) <= 2.',
          'Euler Graph: Connected graph has Eulerian Circuit iff EVERY vertex has EVEN degree.',
          'Planar Graphs: V - E + R = 2 (Euler\'s Formula).',
          'Planar Edge Bounds: E <= 3V - 6 (simple planar). If triangle-free: E <= 2V - 4.',
        ],
        coreFormulas: [
          'Euler\'s Formula: V - E + R = 2',
          'Planar Bound: E <= 3V - 6  (for simple planar graphs)',
          'Triangle-free Planar: E <= 2V - 4',
          'Cayley\'s Tree Formula: n^{n-2} labeled trees on n vertices',
        ],
      ),
    ],
    proSections: [
      ProNoteSection(
        title: 'Planar Graph Proofs & Derangement Mathematics',
        inDepthTheory: '''
In GATE CS/IT, planar graph edge bounds and Euler's formula are tested extensively:
Proof of E <= 3V - 6:
Every region in a simple planar graph is bounded by at least 3 edges: 2 E >= 3 R => R <= 2E / 3.
Substitute into Euler's formula V - E + R = 2:
V - E + (2E / 3) >= 2 => V - E/3 >= 2 => E/3 <= V - 2 => E <= 3V - 6.
K_5 has V = 5, E = 10. Max planar edges = 3(5) - 6 = 9. Since 10 > 9, K_5 is non-planar!
K_{3,3} is bipartite (no odd cycles, each region bounded by >= 4 edges):
2E >= 4R => R <= E/2.
V - E + E/2 >= 2 => E <= 2V - 4.
For K_{3,3}: V = 6, E = 9. Max allowed = 2(6) - 4 = 8. Since 9 > 8, K_{3,3} is non-planar!
''',
        examTraps: [
          'TRAP: Euler circuit vs Euler path. Euler circuit visits every edge once and returns to the start vertex (requires ALL even degrees). Euler path starts and ends at different vertices (requires EXACTLY 2 odd degree vertices).',
          'TRAP: Number of reflexive relations on an n-element set is 2^{n^2 - n}. Number of symmetric relations is 2^{n(n+1)/2}.',
        ],
        solvedExample: '''
[Problem]
A connected planar graph has 12 vertices, each of degree 3.
Calculate the number of regions (faces) in any planar drawing of this graph.

[Step-by-Step Solution]
1. Handshaking Lemma:
   2 * E = sum deg(v) = 12 * 3 = 36 => E = 18.
2. Euler's Planar Formula:
   V - E + R = 2
   12 - 18 + R = 2  =>  -6 + R = 2  =>  R = 8.

[Final Answer]
The graph has 8 regions.
''',
        shortcutTips: [
          'Chromatic number of complete graph K_n is n. For odd cycle C_n, chromatic number is 3. For even cycle, it is 2.',
          'Derangements: D_1 = 0, D_2 = 1, D_3 = 2, D_4 = 9, D_5 = 44. Memorize this sequence for instant 1-mark numericals.',
        ],
      ),
      ProNoteSection(
        title: 'Relations, Posets, Hasse Diagrams & Lattices',
        inDepthTheory: '''
Properties of Binary Relations on set A with |A| = n:
- Total relations: 2^{n^2}.
- Reflexive: (a, a) in R for all a. Total = 2^{n(n-1)}.
- Symmetric: (a, b) in R => (b, a) in R. Total = 2^{n(n+1)/2}.
- Antisymmetric: (a, b) in R and (b, a) in R => a = b. Total = 2^n * 3^{n(n-1)/2}.
- Equivalence: Reflexive, Symmetric, Transitive. Number of equivalence relations equals Bell Number B_n.

Hasse Diagram & Lattices:
In a Hasse diagram, transitive and reflexive edges are omitted.
A poset (P, <=) is a Lattice iff for every pair of elements a, b in P:
- a OR b (Least Upper Bound / Join) exists and is unique.
- a AND b (Greatest Lower Bound / Meet) exists and is unique.
A lattice is Distributive iff a AND (b OR c) = (a AND b) OR (a AND c).
A lattice is distributive iff it does NOT contain the diamond lattice M_5 or the pentagon lattice N_5 as a sublattice!
''',
        examTraps: [
          'TRAP: Confusing asymmetric with antisymmetric. Asymmetric means if (a, b) in R then (b, a) NOT in R (never contains diagonal elements). Antisymmetric permits (a, a) on the diagonal!',
          'TRAP: In a lattice, a pair of elements can have multiple upper bounds, but it MUST have a UNIQUE LEAST upper bound.',
        ],
        solvedExample: '''
[Problem]
Let S = {1, 2, 3, 4, 6, 12} ordered by divisibility relation (a | b).
Determine whether (S, |) is a lattice, and find the LUB and GLB of {4, 6}.

[Step-by-Step Solution]
1. In divisibility poset:
   - GLB(a, b) = Greatest Common Divisor gcd(a, b).
   - LUB(a, b) = Least Common Multiple lcm(a, b).
2. For elements 4 and 6:
   gcd(4, 6) = 2, which is in S.
   lcm(4, 6) = 12, which is in S.
3. Every pair of elements has a unique gcd and lcm in S.
   Therefore, (S, |) is a valid Lattice.

[Final Answer]
(S, |) is a Lattice; GLB(4, 6) = 2, LUB(4, 6) = 12.
''',
        shortcutTips: [
          'Divisibility poset of factors of n is a Boolean Algebra if and only if n is square-free (no repeated prime factors, e.g. n = 30 = 2*3*5).',
          'Every finite lattice has a unique universal lower bound 0 (bottom) and universal upper bound 1 (top).',
        ],
      ),
    ],
  ),
];
