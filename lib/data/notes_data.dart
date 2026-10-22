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
          'Axioms: P(S) = 1, P(E) ≥ 0, and P(∪ E_i) = ∑ P(E_i) for pairwise disjoint events.',
          'Complement rule: P(A^c) = 1 - P(A); Addition rule: P(A ∪ B) = P(A) + P(B) - P(A ∩ B).',
          'Conditional Probability: P(A|B) = P(A ∩ B) / P(B), provided P(B) > 0.',
          'Independence: Events A and B are independent iff P(A ∩ B) = P(A) * P(B). In this case, P(A|B) = P(A).',
          'Total Probability: If B_1, ..., B_k partition sample space S, then P(A) = ∑_{i=1}^k P(A|B_i) * P(B_i).',
          'Bayes\' Theorem updates prior P(B_j) to posterior P(B_j|A) given new evidence A.',
        ],
        coreFormulas: [
          'P(A ∪ B) = P(A) + P(B) - P(A ∩ B)',
          'P(A|B) = P(A ∩ B) / P(B)',
          'P(B_j|A) = [P(A|B_j) * P(B_j)] / [∑_{i=1}^k P(A|B_i) * P(B_i)]',
          'P(A ∩ B ∩ C) = P(A) * P(B|A) * P(C|A ∩ B)',
        ],
      ),
      NoteSection(
        title: 'Random Variables, Expectations & Variance',
        summary: 'Discrete and continuous random variables, cumulative distribution functions, moments, and covariance.',
        keyPoints: [
          'CDF properties: F(x) = P(X ≤ x). F(x) is non-decreasing, right-continuous, lim_{x→-∞} F(x) = 0, lim_{x→∞} F(x) = 1.',
          'For continuous X, P(X = c) = 0 for any single point c, and f(x) = dF(x)/dx.',
          'Expectation: Linear operator E[aX + bY] = a E[X] + b E[Y], regardless of independence!',
          'Variance: Var(X) = E[X^2] - (E[X])^2; Var(aX + b) = a^2 * Var(X).',
          'Covariance: Cov(X, Y) = E[XY] - E[X]E[Y]. If X and Y are independent, Cov(X, Y) = 0 (converse is NOT true in general).',
          'Correlation coefficient ρ = Cov(X, Y) / (σ_X * σ_Y), with -1 ≤ ρ ≤ 1.',
        ],
        coreFormulas: [
          'E[X] = ∑ x P(X = x)  OR  ∫ x f(x) dx',
          'Var(X) = E[X^2] - (E[X])^2',
          'Var(aX + bY) = a^2 Var(X) + b^2 Var(Y) + 2ab Cov(X, Y)',
          'Cov(X, Y) = E[(X - μ_X)(Y - μ_Y)] = E[XY] - E[X]E[Y]',
          'M_X(t) = E[e^{tX}] ; E[X^n] = M_X^{(n)}(0)',
        ],
      ),
      NoteSection(
        title: 'Standard Discrete & Continuous Probability Distributions',
        summary: 'Formulas, parameters, expectation, and variance of distributions frequently tested in GATE DA.',
        keyPoints: [
          'Bernoulli(p): Mean = p, Variance = p(1-p).',
          'Binomial(n, p): n independent Bernoulli trials. Mean = np, Var = np(1-p). Mode = ⌊(n+1)p⌋.',
          'Poisson(λ): Rare event limit of Binomial as n → ∞, p → 0 with np = λ. Mean = λ, Var = λ (Equal mean and variance!).',
          'Geometric(p): Number of trials until 1st success. Mean = 1/p, Var = (1-p)/p^2. Possesses the Memoryless property.',
          'Uniform(a, b): Continuous flat density f(x) = 1/(b-a). Mean = (a+b)/2, Var = (b-a)^2 / 12.',
          'Exponential(λ): Continuous memoryless distribution. f(x) = λ e^{-λx} for x ≥ 0. Mean = 1/λ, Var = 1/λ^2.',
          'Normal N(μ, σ^2): Bell curve, symmetric about μ. 68-95-99.7 rule. Z = (X - μ)/σ ~ N(0, 1).',
        ],
        coreFormulas: [
          'Binomial: P(X=k) = C(n, k) * p^k * (1-p)^{n-k}',
          'Poisson: P(X=k) = (e^{-λ} * λ^k) / k!',
          'Normal PDF: f(x) = (1 / (σ √(2π))) * exp(-(x - μ)^2 / (2σ^2))',
          'Exponential CDF: P(X ≤ x) = 1 - e^{-λx} ; Memoryless: P(X > s+t | X > s) = P(X > t)',
        ],
      ),
      NoteSection(
        title: 'Sampling, Limit Theorems, MLE & Hypothesis Testing',
        summary: 'CLT, Chebyshev\'s Inequality, point estimation via MLE, p-values, and Type I/II errors.',
        keyPoints: [
          'Markov\'s Inequality: For non-negative X and a > 0, P(X ≥ a) ≤ E[X] / a.',
          'Chebyshev\'s Inequality: P(|X - μ| ≥ kσ) ≤ 1 / k^2.',
          'Central Limit Theorem (CLT): For i.i.d. random variables with finite mean μ and variance σ^2, the sample mean X̄ approaches N(μ, σ^2/n) as n → ∞.',
          'Maximum Likelihood Estimation (MLE): Maximizes log-likelihood ln L(θ). For Normal distribution, MLE of μ is X̄, but MLE of σ^2 is (1/n)∑(X_i - X̄)^2 (biased, divisor n not n-1).',
          'Hypothesis Testing: Null H_0 vs Alternative H_1. Type I error (α) = reject H_0 when H_0 is true (false alarm). Type II error (β) = fail to reject H_0 when H_0 is false. Power of test = 1 - β.',
        ],
        coreFormulas: [
          'Chebyshev: P(|X - μ| ≥ ϵ) ≤ Var(X) / ϵ^2',
          'CLT: Z = (X̄ - μ) / (σ / √n) ~ N(0, 1)',
          'MLE Score Equation: ∂ ln L(θ; x) / ∂θ = 0',
          'Z-Test Statistic: z = (X̄ - μ_0) / (σ / √n)',
        ],
      ),
    ],
    proSections: [
      ProNoteSection(
        title: 'Conditional Independence, Total Variance & Bayes Traps',
        inDepthTheory: '''
In GATE DA, conditional independence P(A ∩ B | C) = P(A|C) * P(B|C) is tested heavily. Independence does NOT imply conditional independence, and conditional independence does NOT imply unconditional independence.
The Law of Total Variance (Eve\'s Law) partitions total variance into explained and unexplained components:
Var(Y) = E[Var(Y|X)] + Var(E[Y|X]).
The first term is the expected conditional variance (unexplained), and the second is the variance of the conditional expectation (explained by X).
In Bayesian updating, rare disease testing traps students: even with 99% test accuracy, if the disease base prevalence is 0.1% (1 in 1000), a positive test result yields a true positive probability of under 10% because false positives outnumber true positives by a massive factor!
''',
        examTraps: [
          'TRAP: Assuming Cov(X, Y) = 0 implies X and Y are independent. Counterexample: Let X ~ U(-1, 1) and Y = X^2. E[XY] = E[X^3] = 0, E[X] = 0, so Cov(X, Y) = 0, yet Y is completely determined by X!',
          'TRAP: Confusing mutually exclusive with independent. For non-zero probability events, mutually exclusive events CANNOT be independent because P(A ∩ B) = 0 ≠ P(A)P(B) > 0.',
          'TRAP: Forgetting that Var(X - Y) = Var(X) + Var(Y) - 2 Cov(X, Y). If X and Y are independent, Var(X - Y) = Var(X) + Var(Y), NOT minus!',
        ],
        solvedExample: '''
[GATE DA Benchmark Numerical]
A medical test for a rare AI data anomaly has 95% sensitivity (true positive rate) and 90% specificity (true negative rate). The anomaly prevalence in the cluster is 2%. If a randomly selected log entry tests positive, what is the probability that it actually has the anomaly?

Solution:
Let A = anomaly present (P(A) = 0.02, P(A^c) = 0.98).
Let T+ = positive test result.
Given: P(T+|A) = 0.95 and P(T+|A^c) = 1 - 0.90 = 0.10.
By Bayes\' Theorem:
P(A|T+) = [P(T+|A) * P(A)] / [P(T+|A) * P(A) + P(T+|A^c) * P(A^c)]
P(A|T+) = [0.95 * 0.02] / [0.95 * 0.02 + 0.10 * 0.98]
P(A|T+) = 0.019 / [0.019 + 0.098] = 0.019 / 0.117 ≈ 0.1624 (16.24%).
Even with 95% test accuracy, only 16.24% of positive detections are true anomalies due to the 2% prior prevalence!
''',
        shortcutTips: [
          'If a Poisson variable has P(X = 1) = P(X = 2), then λ e^{-λ} = (λ^2 e^{-λ})/2 ⇒ λ = 2. Instant 1-mark NAT solver.',
          'For Exponential(λ), the median is (ln 2) / λ ≈ 0.693 / λ, which is strictly less than the mean 1/λ.',
          'Uniform distribution U(a, b): Var(X) = (b-a)^2 / 12. If a = -b, E[X] = 0 and Var(X) = (2b)^2 / 12 = b^2 / 3.',
        ],
      ),
      ProNoteSection(
        title: 'MGF Properties, Sum of Distributions & Order Statistics',
        inDepthTheory: '''
Moment Generating Function M_X(t) uniquely identifies the probability distribution.
Key combination properties:
1. If X_1 ~ Poisson(λ_1) and X_2 ~ Poisson(λ_2) are independent, then X_1 + X_2 ~ Poisson(λ_1 + λ_2).
2. If X_i ~ N(μ_i, σ_i^2) are independent, then ∑ c_i X_i ~ N(∑ c_i μ_i, ∑ c_i^2 σ_i^2).
3. If X_i ~ Exponential(λ) are independent, then ∑_{i=1}^n X_i ~ Gamma(n, λ) (Erlang distribution).
4. Minimum of independent exponentials: If X_1 ~ Exp(λ_1) and X_2 ~ Exp(λ_2), then min(X_1, X_2) ~ Exp(λ_1 + λ_2), and P(X_1 < X_2) = λ_1 / (λ_1 + λ_2).
Order statistics: For n i.i.d. samples from U(0, 1), the k-th order statistic X_{(k)} follows Beta(k, n - k + 1) with E[X_{(k)}] = k / (n + 1).
''',
        examTraps: [
          'TRAP: In CLT questions with sum S_n = ∑ X_i vs mean X̄. Var(S_n) = n σ^2 while Var(X̄) = σ^2 / n. Watch which one the problem asks for!',
          'TRAP: Unbiased estimator of sample variance requires dividing by (n - 1), but the MLE estimator divides by n. If asked for MLE of variance, divide by n!',
        ],
        solvedExample: '''
[GATE DA Benchmark Numerical]
Two autonomous systems process packets with completion times X_1 ~ Exp(λ_1 = 0.4 min^-1) and X_2 ~ Exp(λ_2 = 0.6 min^-1) independently.
Find: (i) The probability that system 1 finishes before system 2, and (ii) Expected time until the first system completes.

Solution:
(i) P(X_1 < X_2) = λ_1 / (λ_1 + λ_2) = 0.4 / (0.4 + 0.6) = 0.40.
(ii) Time until the first completion is T_min = min(X_1, X_2) ~ Exp(λ_1 + λ_2 = 1.0 min^-1).
E[T_min] = 1 / (λ_1 + λ_2) = 1 / 1.0 = 1.0 minute.
''',
        shortcutTips: [
          'For n i.i.d. U(0, 1) variables: E[max(X_1, ..., X_n)] = n / (n + 1), and E[min(X_1, ..., X_n)] = 1 / (n + 1).',
          'Sum of n independent Bernoulli(p) trials is always Binomial(n, p).',
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
          'Trace: tr(A) = ∑ a_{ii} = ∑ λ_i. Cyclic property: tr(ABC) = tr(BCA) = tr(CAB), but tr(ABC) ≠ tr(BAC) in general.',
          'Determinant: Volume distortion factor = ∏ λ_i. det(AB) = det(A) * det(B). For scalar c and n × n A, det(cA) = c^n det(A).',
          'Invertibility: A is invertible iff det(A) ≠ 0 iff rank(A) = n iff nullity(A) = 0 iff 0 is not an eigenvalue.',
          'Inverse formula: A^-1 = adj(A) / det(A), where A * adj(A) = det(A) * I_n.',
          'Orthogonal matrix Q: Q^T Q = Q Q^T = I. det(Q) = ±1. All eigenvalues have |λ| = 1. Preserves lengths and angles: ‖Qx‖_2 = ‖x‖_2.',
        ],
        coreFormulas: [
          'tr(A) = ∑_{i=1}^n λ_i  ;  det(A) = ∏_{i=1}^n λ_i',
          'det(A^T) = det(A)  ;  det(A^-1) = 1 / det(A)',
          'det(cA) = c^n * det(A)  (for n × n matrix)',
          'A * adj(A) = det(A) * I_n',
        ],
      ),
      NoteSection(
        title: 'Rank, Nullity & Linear Systems (Ax = b)',
        summary: 'Vector spaces, span, basis, dimension, Rank-Nullity Theorem, and solvability criteria.',
        keyPoints: [
          'Rank(A): Number of pivot columns in Row Echelon Form = Dimension of column space Col(A) = Dimension of row space Row(A).',
          'Rank-Nullity Theorem: For an m × n matrix A, Rank(A) + Nullity(A) = n (number of columns).',
          'Homogeneous system (Ax = 0): Always consistent (x = 0 trivial solution). Has infinitely many non-trivial solutions iff Rank(A) < n.',
          'Non-homogeneous system (Ax = b) with augmented matrix [A|b]:',
          '  • Consistent iff Rank(A) = Rank([A|b]).',
          '  • Unique solution iff Rank(A) = Rank([A|b]) = n.',
          '  • Infinitely many solutions iff Rank(A) = Rank([A|b]) < n (dimension of solution set is n - rank).',
          '  • Inconsistent (no solution) iff Rank(A) < Rank([A|b]).',
        ],
        coreFormulas: [
          'dim(Col(A)) + dim(Null(A)) = n',
          'Rank(A + B) ≤ Rank(A) + Rank(B)',
          'Rank(AB) ≤ min(Rank(A), Rank(B))',
          'Rank(A^T A) = Rank(A A^T) = Rank(A)',
        ],
      ),
      NoteSection(
        title: 'Eigenvalues, Eigenvectors & Diagonalization',
        summary: 'Characteristic equations, Cayley-Hamilton theorem, algebraic vs geometric multiplicity, and spectral decomposition.',
        keyPoints: [
          'Characteristic equation: det(A - λI) = 0.',
          'If λ is an eigenvalue of A, then: λ^k is of A^k; 1/λ is of A^-1; λ + c is of A + cI; det(A)/λ is of adj(A).',
          'Cayley-Hamilton Theorem: Every square matrix satisfies its own characteristic equation: p(A) = 0. Used to compute A^-1 and high powers A^k.',
          'Algebraic Multiplicity (AM): Root multiplicity of (λ - λ_i) in det(A - λI).',
          'Geometric Multiplicity (GM): Dimension of eigenspace Null(A - λ_i I). Always 1 ≤ GM ≤ AM.',
          'Diagonalizability: A is diagonalizable (A = P D P^-1) iff for all eigenvalues, GM = AM. Real symmetric matrices are always orthogonally diagonalizable.',
        ],
        coreFormulas: [
          'det(A - λI) = 0',
          'A x = λ x  (x ≠ 0)',
          'A = P D P^-1  ⇒  A^k = P D^k P^-1',
          'Spectral Theorem (Symmetric A): A = Q Λ Q^T = ∑_{i=1}^n λ_i q_i q_i^T',
        ],
      ),
      NoteSection(
        title: 'Matrix Calculus, Projections & Singular Value Decomposition',
        summary: 'Derivatives with respect to vectors, orthogonal projection matrices, and compact/truncated SVD.',
        keyPoints: [
          'Matrix Calculus rules: ∇_x (a^T x) = a; ∇_x (x^T A x) = (A + A^T) x. If A is symmetric, ∇_x (x^T A x) = 2 A x.',
          'Orthogonal Projection: Projection of vector b onto column space of A is p = A (A^T A)^-1 A^T b.',
          'Projection matrix P = A (A^T A)^-1 A^T is symmetric (P^T = P) and idempotent (P^2 = P).',
          'SVD: Every m × n matrix A can be factored into A = U Σ V^T, where U is m × m orthogonal, V is n × n orthogonal, and Σ has non-negative singular values σ_1 ≥ σ_2 ≥ ... ≥ σ_r > 0.',
          'Singular values σ_i = √(eigenvalues of A^T A). Rank(A) = number of non-zero singular values.',
          'Moore-Penrose Pseudoinverse: A^+ = V Σ^+ U^T. Gives minimum L_2 norm least-squares solution x̂ = A^+ b.',
        ],
        coreFormulas: [
          '∇_x (x^T A x) = (A + A^T) x',
          'Projection Matrix: P = A (A^T A)^-1 A^T  ;  P^2 = P, P^T = P',
          'SVD: A = U Σ V^T = ∑_{i=1}^r σ_i u_i v_i^T',
          'A^+ = (A^T A)^-1 A^T  (when A has full column rank)',
        ],
      ),
    ],
    proSections: [
      ProNoteSection(
        title: 'Singular Value Decomposition (SVD) & Eckart-Young Theorem',
        inDepthTheory: '''
In GATE DA, SVD is one of the highest-yield subjects because it connects directly to PCA, dimensionality reduction, and pseudoinverses.
For any real m × n matrix A of rank r:
1. Columns of U (left singular vectors) are orthonormal eigenvectors of A A^T (m × m).
2. Columns of V (right singular vectors) are orthonormal eigenvectors of A^T A (n × n).
3. Non-zero singular values σ_i are the positive square roots of non-zero eigenvalues of A^T A (and A A^T).
4. Eckart-Young-Mirsky Theorem: The best rank-k approximation A_k (k < r) in both Frobenius and Spectral norm is obtained by keeping the top-k singular values:
   A_k = ∑_{i=1}^k σ_i u_i v_i^T.
5. Approximation error: ‖A - A_k‖_2 = σ_{k+1}, and ‖A - A_k‖_F^2 = ∑_{j=k+1}^r σ_j^2.
''',
        examTraps: [
          'TRAP: Confusing eigenvalues with singular values. Singular values are ALWAYS non-negative real numbers (σ_i ≥ 0), even if A has negative or complex eigenvalues!',
          'TRAP: Outer product shape. In dyadic expansion A = ∑ σ_i u_i v_i^T, u_i is m × 1 and v_i^T is 1 × n, producing an m × n rank-1 matrix. Do not compute v_i u_i^T!',
          'TRAP: Positive Definite vs Semi-Definite. A is Positive Definite iff all eigenvalues λ_i > 0 iff all leading principal minors are strictly positive (Sylvester\'s Criterion). If all λ_i ≥ 0, it is Positive Semi-Definite.',
        ],
        solvedExample: '''
[GATE DA Benchmark Numerical]
Find the SVD singular values of matrix A = [[3, 0], [0, -4], [0, 0]].
Find: (i) Non-zero singular values σ_1, σ_2, (ii) Frobenius norm ‖A‖_F, (iii) Best rank-1 approximation error in spectral norm.

Solution:
A^T A = [[3, 0, 0], [0, -4, 0]] * [[3, 0], [0, -4], [0, 0]] = [[9, 0], [0, 16]].
Eigenvalues of A^T A are λ_1 = 16, λ_2 = 9.
Singular values are σ_1 = √16 = 4, and σ_2 = √9 = 3.
(i) Singular values: σ_1 = 4, σ_2 = 3.
(ii) Frobenius norm ‖A‖_F = √(σ_1^2 + σ_2^2) = √(16 + 9) = √25 = 5.
(iii) Rank-1 spectral approximation error = σ_2 = 3.
''',
        shortcutTips: [
          'For any rank-1 matrix A = u v^T: Trace = u^T v, Rank = 1, the only non-zero eigenvalue is λ = u^T v, and all other n-1 eigenvalues are 0.',
          'If an n × n matrix has all entries equal to 1, its eigenvalues are n (multiplicity 1) and 0 (multiplicity n-1). Determinant is 0, rank is 1.',
          'det(I + u v^T) = 1 + v^T u (Matrix Determinant Lemma). Allows instant evaluation without expanding n × n matrices.',
        ],
      ),
      ProNoteSection(
        title: 'Quadratic Forms, Definiteness & Least Squares Projections',
        inDepthTheory: '''
A quadratic form Q(x) = x^T A x where A is real symmetric:
- Strictly Positive Definite (SPD): x^T A x > 0 for all x ≠ 0 ⇔ all λ_i > 0 ⇔ all upper-left subdeterminants > 0.
- Positive Semi-Definite (PSD): x^T A x ≥ 0 for all x ⇔ all λ_i ≥ 0.
- Negative Definite: all λ_i < 0.
- Indefinite: A has at least one positive and at least one negative eigenvalue. The origin x = 0 is a saddle point!
In Linear Regression, the cost function J(w) = ‖Xw - y‖_2^2 = (Xw - y)^T (Xw - y).
Expanding: J(w) = w^T X^T X w - 2 y^T X w + y^T y.
Taking vector derivative ∇_w J(w) = 2 X^T X w - 2 X^T y = 0 yields the Normal Equation:
X^T X w = X^T y ⇒ w^* = (X^T X)^-1 X^T y.
Hessian of J(w) is ∇_w^2 J(w) = 2 X^T X, which is always positive semi-definite, guaranteeing convexity and global minimum!
''',
        examTraps: [
          'TRAP: Applying Sylvester\'s criterion to non-symmetric matrices. Sylvester\'s criterion ONLY applies if the matrix is symmetric! Always symmetrize first: A_sym = (A + A^T)/2.',
          'TRAP: Inverse of (A + B). In general, (A + B)^-1 ≠ A^-1 + B^-1! Use Woodbury Matrix Identity if needed.',
        ],
        solvedExample: '''
[GATE DA Benchmark Numerical]
Given the quadratic form Q(x_1, x_2, x_3) = 2 x_1^2 + x_2^2 + 3 x_3^2 - 2 x_1 x_2.
Determine its definiteness and the minimum value of Q(x) subject to ‖x‖_2 = 1.

Solution:
Matrix A representation:
A = [[2, -1, 0], [-1, 1, 0], [0, 0, 3]].
Leading principal minors:
Δ_1 = 2 > 0.
Δ_2 = (2)(1) - (-1)^2 = 2 - 1 = 1 > 0.
Δ_3 = 3 * Δ_2 = 3 * 1 = 3 > 0.
Since all leading principal minors are strictly positive, A is strictly Positive Definite.
By Rayleigh Quotient: min_{‖x‖=1} x^T A x = λ_min(A).
Eigenvalues of 2×2 block [[2, -1], [-1, 1]]:
det(M - λI) = λ^2 - 3λ + 1 = 0 ⇒ λ = (3 ± √5)/2.
Eigenvalues of A are: (3 - √5)/2 ≈ 0.382, (3 + √5)/2 ≈ 2.618, and 3.
Minimum value under ‖x‖=1 is λ_min = (3 - √5)/2 ≈ 0.382.
''',
        shortcutTips: [
          'Rayleigh Quotient Theorem: For symmetric A, λ_min ≤ (x^T A x)/(x^T x) ≤ λ_max. Equality holds at corresponding eigenvectors.',
          'Projection matrix trace: tr(P) = rank(P) = dimension of the subspace projected onto.',
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
          'Continuity: f is continuous at c iff lim_{x→c} f(x) = f(c). Differentiability implies continuity, but continuity does NOT imply differentiability (e.g. |x| at 0).',
          'Rolle\'s Theorem: If f is continuous on [a, b], differentiable on (a, b), and f(a) = f(b), then ∃ c ∈ (a, b) such that f\'(c) = 0.',
          'Lagrange Mean Value Theorem (LMVT): ∃ c ∈ (a, b) such that f\'(c) = [f(b) - f(a)] / (b - a).',
          'Cauchy Mean Value Theorem: [f\'(c) / g\'(c)] = [f(b) - f(a)] / [g(b) - g(a)].',
          'Taylor Series expansion around a: f(x) = ∑_{k=0}^∞ [f^{(k)}(a) / k!] * (x - a)^k.',
          'Maxima/Minima: Stationary point where f\'(c) = 0. If f\'\'(c) > 0 → Local Minimum; if f\'\'(c) < 0 → Local Maximum; if f\'\'(c) = 0 → Inconclusive (test higher derivatives).',
        ],
        coreFormulas: [
          'LMVT: f\'(c) = [f(b) - f(a)] / (b - a)',
          'Taylor: f(x) = f(a) + f\'(a)(x-a) + [f\'\'(a)/2!](x-a)^2 + ...',
          'L\'Hôpital: lim_{x→a} f(x)/g(x) = lim_{x→a} f\'(x)/g\'(x)  (for 0/0 or ∞/∞)',
        ],
      ),
      NoteSection(
        title: 'Multivariable Calculus: Gradients, Jacobians & Hessians',
        summary: 'Partial derivatives, directional derivatives, tangent hyperplanes, and curvature.',
        keyPoints: [
          'Gradient ∇f(x): Vector of partial derivatives [∂f/∂x_1, ..., ∂f/∂x_n]^T. Points in direction of STEEPEST ASCENT. Its magnitude is the maximum rate of increase.',
          'Directional Derivative in unit direction u (‖u‖ = 1): D_u f = ∇f(x) · u = ‖∇f‖ cos θ. Maximum when u is parallel to ∇f.',
          'Jacobian Matrix J: Matrix of all first-order partial derivatives of a vector-valued function f: R^n → R^m. Size is m × n.',
          'Hessian Matrix H: Square n × n matrix of second-order partial derivatives H_{ij} = ∂^2 f / (∂x_i ∂x_j). If continuous, H is symmetric (Clairaut\'s Theorem).',
          'Second Derivative Test in R^n: At critical point ∇f(x^*) = 0:',
          '  • H is Positive Definite (all λ_i > 0) ⇒ Strict Local Minimum.',
          '  • H is Negative Definite (all λ_i < 0) ⇒ Strict Local Maximum.',
          '  • H has both positive and negative eigenvalues ⇒ SADDLE POINT.',
        ],
        coreFormulas: [
          'Directional Derivative: D_u f = ∇f(x)^T u',
          'Gradient Vector: ∇f(x) = [∂f/∂x_1, ..., ∂f/∂x_n]^T',
          'Hessian Matrix: H_{ij} = ∂^2 f / (∂x_i ∂x_j)',
          'Taylor in R^n: f(x + Δx) ≈ f(x) + ∇f(x)^T Δx + (1/2) Δx^T H(x) Δx',
        ],
      ),
      NoteSection(
        title: 'Optimization: Unconstrained, Constrained & Convexity',
        summary: 'Convex sets, convex functions, Lagrange Multipliers, KKT conditions, and Gradient Descent.',
        keyPoints: [
          'Convex Function: f(θ x + (1-θ) y) ≤ θ f(x) + (1-θ) f(y) for all θ ∈ [0, 1]. In a convex function, every local minimum is a GLOBAL minimum!',
          'Hessian criterion for convexity: f is convex on an open convex set iff its Hessian H(x) is Positive Semi-Definite everywhere.',
          'Lagrange Multipliers (Equality constraint g(x) = 0): ∇f(x) + λ ∇g(x) = 0.',
          'Karush-Kuhn-Tucker (KKT) Conditions (Inequality constraint g_i(x) ≤ 0):',
          '  1. Stationarity: ∇f(x^*) + ∑ μ_i ∇g_i(x^*) = 0',
          '  2. Primal Feasibility: g_i(x^*) ≤ 0',
          '  3. Dual Feasibility: μ_i ≥ 0',
          '  4. Complementary Slackness: μ_i * g_i(x^*) = 0',
          'Gradient Descent update: x_{k+1} = x_k - η ∇f(x_k), where η is the learning rate.',
        ],
        coreFormulas: [
          'Gradient Descent: x_{t+1} = x_t - η ∇f(x_t)',
          'Lagrangian: L(x, λ) = f(x) + λ g(x)',
          'KKT Complementary Slackness: μ_i * g_i(x) = 0  (μ_i ≥ 0)',
        ],
      ),
    ],
    proSections: [
      ProNoteSection(
        title: 'KKT Conditions, Duality & Saddle Point Identification',
        inDepthTheory: '''
In GATE DA, optimization questions test KKT conditions rigorously.
Complementary slackness μ_i g_i(x) = 0 has two strict possibilities for each constraint:
Case 1 (Inactive constraint): g_i(x^*) < 0 ⇒ μ_i MUST BE 0. The constraint plays no role in the optimal point.
Case 2 (Active/Binding constraint): g_i(x^*) = 0 ⇒ μ_i ≥ 0. The optimum lies on the boundary.
Strong Duality: For convex problems satisfying Slater\'s condition (strictly feasible point exists), the primal optimal value equals the dual optimal value (zero duality gap).
In multivariable calculus, saddle points frequently trap students: det(H) < 0 does not tell the full story in dimensions n > 2. You MUST inspect the eigenvalues of H. If at least one λ_i > 0 and at least one λ_j < 0, it is guaranteed to be a saddle point.
''',
        examTraps: [
          'TRAP: Forgetting dual feasibility μ_i ≥ 0 for inequality constraints g_i(x) ≤ 0. If your algebra yields μ_i < 0, that constraint is NOT active at the minimum; reject that branch!',
          'TRAP: Confusing directional derivative with partial derivative. The directional derivative requires a UNIT vector. If vector v = (3, 4) is given, divide by ‖v‖ = 5 before dotting with ∇f!',
        ],
        solvedExample: '''
[GATE DA Benchmark Numerical]
Find the point on the plane g(x, y, z) = x + 2y + 2z - 9 = 0 closest to the origin (0, 0, 0) using Lagrange Multipliers.

Solution:
Minimize f(x, y, z) = x^2 + y^2 + z^2 subject to g(x, y, z) = x + 2y + 2z - 9 = 0.
Lagrangian: L(x, y, z, λ) = x^2 + y^2 + z^2 + λ (x + 2y + 2z - 9).
Stationarity conditions:
∂L/∂x = 2x + λ = 0  ⇒  x = -λ / 2
∂L/∂y = 2y + 2λ = 0  ⇒  y = -λ
∂L/∂z = 2z + 2λ = 0  ⇒  z = -λ
Substitute into constraint:
(-λ/2) + 2(-λ) + 2(-λ) - 9 = 0
-λ/2 - 4λ = 9  ⇒  -9λ / 2 = 9  ⇒  λ = -2.
Substitute λ = -2:
x = -(-2)/2 = 1
y = -(-2) = 2
z = -(-2) = 2.
Closest point is (1, 2, 2). Shortest distance = √(1^2 + 2^2 + 2^2) = √9 = 3.
''',
        shortcutTips: [
          'Distance from origin to plane ax + by + cz = d is d / √(a^2 + b^2 + c^2). For x + 2y + 2z = 9: d = 9 / √(1+4+4) = 9/3 = 3!',
          'For a quadratic function f(x) = (1/2) x^T A x - b^T x with SPD A, the exact global minimizer is x^* = A^-1 b.',
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
          'Expected Prediction Error: EPE = Bias^2 + Variance + Irreducible Error (σ^2).',
          'Bias: Error from erroneous model assumptions (underfitting, high bias, low variance, simple models).',
          'Variance: Sensitivity to fluctuations in the training set (overfitting, low bias, high variance, complex models).',
          'Regularization: Penalizes model complexity to reduce variance at the expense of slight bias increase.',
          'Ridge (L_2): J(w) = MSE + λ ‖w‖_2^2. Shrinks weights toward zero; closed-form solution: w^* = (X^T X + λ I)^-1 X^T y. Handles multicollinearity.',
          'Lasso (L_1): J(w) = MSE + λ ‖w‖_1. Shrinks weights and drives non-informative weights to EXACTLY ZERO (automatic feature selection).',
        ],
        coreFormulas: [
          'Bias[f̂(x)] = E[f̂(x)] - f(x)',
          'Var[f̂(x)] = E[(f̂(x) - E[f̂(x)])^2]',
          'Total Error = (Bias)^2 + Variance + σ^2',
          'Ridge: w^* = (X^T X + λ I_n)^-1 X^T y',
          'Lasso Penalty: λ ∑_{j=1}^d |w_j|',
        ],
      ),
      NoteSection(
        title: 'Linear & Logistic Regression, Decision Boundaries',
        summary: 'Normal equations, logistic sigmoid, odds ratio, cross-entropy loss, and multi-class classification.',
        keyPoints: [
          'Linear Regression: Hypothesizes ŷ = w^T x. Solved via OLS Normal Equations w = (X^T X)^-1 X^T y.',
          'R^2 Score (Coefficient of Determination): R^2 = 1 - (SS_res / SS_tot). Proportion of variance explained by the model.',
          'Logistic Regression: Models log-odds ln(p / (1-p)) = w^T x. Output probability p = σ(w^T x) = 1 / (1 + e^{-w^T x}).',
          'Decision boundary: Linear hyperplane where w^T x = 0 (corresponding to p = 0.5).',
          'Binary Cross-Entropy Loss: L(w) = - (1/N) ∑ [y_i ln(p_i) + (1 - y_i) ln(1 - p_i)]. Convex with respect to w.',
          'Softmax for K classes: P(Y=k|x) = e^{w_k^T x} / ∑_{j=1}^K e^{w_j^T x}.',
        ],
        coreFormulas: [
          'Sigmoid: σ(z) = 1 / (1 + e^{-z})  ;  σ\'(z) = σ(z)(1 - σ(z))',
          'Log-Odds (Logit): ln(p / (1 - p)) = w^T x',
          'BCE Loss: L = - [y ln(p) + (1 - y) ln(1 - p)]',
          'R^2 = 1 - [∑(y_i - ŷ_i)^2] / [∑(y_i - ȳ)^2]',
        ],
      ),
      NoteSection(
        title: 'Support Vector Machines (SVM) & Kernel Methods',
        summary: 'Maximum margin hyperplanes, support vectors, slack variables, dual representation, and Mercer kernels.',
        keyPoints: [
          'Margin: Geometric distance between separating hyperplane and closest training points is 2 / ‖w‖_2.',
          'Objective: Minimize (1/2) ‖w‖_2^2 subject to y_i (w^T x_i + b) ≥ 1 (for linearly separable data).',
          'Support Vectors: Only the data points that lie directly on the margin boundaries (or violate the margin) determine w and b. Removing non-support vectors does NOT change the boundary!',
          'Soft-Margin C: Trades off margin width against training errors. High C = strict penalty on errors (narrow margin, high variance, risk of overfitting). Low C = wider margin, permits more errors (high bias).',
          'Kernel Trick: Implicitly maps inputs to high-dimensional space without computing coordinates: K(x_i, x_j) = ⟨ϕ(x_i), ϕ(x_j)⟩.',
          'Common Kernels: Linear K = x_i^T x_j; Polynomial K = (x_i^T x_j + c)^d; RBF/Gaussian K = exp(-γ ‖x_i - x_j‖^2).',
        ],
        coreFormulas: [
          'Margin Width: 2 / ‖w‖_2',
          'Dual Formulation: Maximize ∑ α_i - (1/2) ∑∑ α_i α_j y_i y_j K(x_i, x_j)',
          'KKT condition: α_i [y_i (w^T x_i + b) - 1] = 0',
          'RBF Kernel: K(x, z) = exp(-γ ‖x - z‖^2)',
        ],
      ),
      NoteSection(
        title: 'Decision Trees, Ensembles, Clustering & Evaluation Metrics',
        summary: 'Splitting criteria, Random Forests, AdaBoost, K-Means, PCA, and classification confusion matrices.',
        keyPoints: [
          'Entropy: H(S) = - ∑ p_i log_2(p_i). For binary classification, max entropy is 1.0 (at p = 0.5); min is 0 (pure).',
          'Gini Impurity: Gini(S) = 1 - ∑ p_i^2. For binary classification, max Gini is 0.5 (at p = 0.5); min is 0.',
          'Information Gain: IG(S, A) = H(S) - ∑ (|S_v| / |S|) H(S_v). Always non-negative.',
          'Random Forest: Bagging + random feature subset at each split. Reduces variance without increasing bias.',
          'K-Means: Minimizes Within-Cluster Sum of Squares (WCSS / Inertia). Guaranteed to converge to a local optimum, but sensitive to initialization (mitigated by K-Means++).',
          'PCA: Finds orthogonal directions of maximum variance. Principal components are eigenvectors of covariance matrix X^T X.',
          'Metrics: Precision = TP / (TP + FP); Recall = TP / (TP + FN); F1 = 2 * (Prec * Rec) / (Prec + Rec).',
        ],
        coreFormulas: [
          'Entropy: H(S) = - ∑_{i=1}^c p_i log_2 p_i',
          'Gini Impurity: Gini(S) = 1 - ∑_{i=1}^c p_i^2',
          'F1 Score: 2 * (Precision * Recall) / (Precision + Recall)',
          'Explained Variance Ratio (PCA): λ_k / (∑_{i=1}^d λ_i)',
        ],
      ),
    ],
    proSections: [
      ProNoteSection(
        title: 'SVM Dual Derivation, Slack Variables & AdaBoost Mathematics',
        inDepthTheory: '''
In GATE DA, SVM dual formulation and complementary slackness are prime test topics:
The primal Lagrangian with slack variables ξ_i:
L(w, b, ξ, α, r) = (1/2) ‖w‖^2 + C ∑ ξ_i - ∑ α_i [y_i (w^T x_i + b) - 1 + ξ_i] - ∑ r_i ξ_i.
Stationarity conditions:
1. ∂L/∂w = w - ∑ α_i y_i x_i = 0 ⇒ w = ∑_{i=1}^N α_i y_i x_i (w is a linear combination of support vectors!).
2. ∂L/∂b = ∑ α_i y_i = 0.
3. ∂L/∂ξ_i = C - α_i - r_i = 0 ⇒ α_i ≤ C (Box constraint: 0 ≤ α_i ≤ C).
Complementary slackness:
- α_i = 0: Point is correctly classified and outside the margin.
- 0 < α_i < C: Point is on the margin (ξ_i = 0). Used to calculate intercept b!
- α_i = C: Point violates the margin (ξ_i > 0).

In AdaBoost:
Weight update: w_{t+1, i} = w_{t, i} * exp(-α_t y_i h_t(x_i)) / Z_t.
Classifier weight: α_t = (1/2) ln((1 - ϵ_t) / ϵ_t).
If error ϵ_t = 0.5 (random guess), α_t = 0. If ϵ_t → 0, α_t → ∞.
''',
        examTraps: [
          'TRAP: Support vectors count. Points with α_i > 0 ARE the support vectors. Points with α_i = 0 have zero impact on the boundary.',
          'TRAP: RBF kernel bandwidth γ. High γ = complex boundary, wraps tightly around points (high variance, overfitting). Low γ = smooth boundary, almost linear (high bias, underfitting).',
          'TRAP: K-Means WCSS monotonic decrease. Within each run, WCSS monotonically decreases or stays constant with each iteration. It NEVER increases!',
        ],
        solvedExample: '''
[GATE DA Benchmark Numerical]
A dataset has 14 instances: 9 Positive and 5 Negative. A candidate split feature A divides the dataset into:
- Left Branch: 6 Positive, 2 Negative (8 total)
- Right Branch: 3 Positive, 3 Negative (6 total)
Calculate the Information Gain IG(S, A). (Given: log_2(3) ≈ 1.585, log_2(5) ≈ 2.322, log_2(7) ≈ 2.807, log_2(9) ≈ 3.170, log_2(14) ≈ 3.807).

Solution:
P(S+) = 9/14 ≈ 0.643, P(S-) = 5/14 ≈ 0.357.
H(S) = - [ (9/14) log_2(9/14) + (5/14) log_2(5/14) ]
H(S) = - [ (9/14)(3.170 - 3.807) + (5/14)(2.322 - 3.807) ]
H(S) = - [ 0.643 * (-0.637) + 0.357 * (-1.485) ] = 0.4097 + 0.5302 = 0.940.

Left branch: P(L+) = 6/8 = 0.75, P(L-) = 2/8 = 0.25.
H(S_L) = - [ 0.75 log_2(0.75) + 0.25 log_2(0.25) ] = - [ 0.75 * (-0.415) + 0.25 * (-2.0) ] = 0.311 + 0.50 = 0.811.

Right branch: P(R+) = 3/6 = 0.5, P(R-) = 3/6 = 0.5.
H(S_R) = 1.0 (pure coin toss).

Weighted Child Entropy:
H(S, A) = (8/14) * 0.811 + (6/14) * 1.0 = (0.5714 * 0.811) + (0.4286 * 1.0) = 0.4634 + 0.4286 = 0.892.

Information Gain:
IG(S, A) = H(S) - H(S, A) = 0.940 - 0.892 = 0.048 bits.
''',
        shortcutTips: [
          'If a binary split creates a branch with 50-50 class distribution, its entropy is ALWAYS exactly 1.0. Do not compute logarithms!',
          'If a node is completely pure (all samples belong to one class), its entropy and Gini impurity are both EXACTLY 0.',
          'Gini vs Entropy: Gini is computationally cheaper because it requires no logarithmic calculations, making it standard in CART.',
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
          'Breadth-First Search (BFS): Queue (FIFO). Optimal if all step costs are equal. Time O(b^d), Space O(b^d) (Space is the main bottleneck).',
          'Depth-First Search (DFS): Stack (LIFO). Not optimal, incomplete in infinite spaces. Time O(b^m), Space O(bm) (Highly memory-efficient).',
          'Uniform-Cost Search (UCS): Priority queue ordered by path cost g(n). Equivalent to Dijkstra\'s algorithm. Complete and optimal for positive step costs.',
          'A* Search: Evaluation function f(n) = g(n) + h(n), where g(n) is actual cost from start and h(n) is heuristic estimate to goal.',
          'Admissible Heuristic: Never overestimates the true cost to reach the goal: 0 ≤ h(n) ≤ h^*(n). Guarantees A* tree search optimality!',
          'Consistent (Monotonic) Heuristic: Satisfies triangle inequality: h(n) ≤ c(n, a, n\') + h(n\'). Consistency implies admissibility and guarantees A* graph search optimality without revisiting closed nodes!',
        ],
        coreFormulas: [
          'A* Evaluation: f(n) = g(n) + h(n)',
          'Admissibility: h(n) ≤ h^*(n)  for all n, with h(Goal) = 0',
          'Consistency: h(n) ≤ c(n, a, n\') + h(n\')',
        ],
      ),
      NoteSection(
        title: 'Adversarial Search & First-Order Logic',
        summary: 'Minimax algorithm, alpha-beta pruning cutoff rules, CNF conversion, and resolution.',
        keyPoints: [
          'Minimax: Computes optimal strategy for MAX player against an optimal MIN opponent. Perfect information zero-sum game.',
          'Alpha-Beta Pruning: Prunes subtrees that cannot influence the final decision. Does NOT change the final minimax value at the root!',
          'Alpha (α): Highest value found so far for MAX along the path (initialized to -∞).',
          'Beta (β): Lowest value found so far for MIN along the path (initialized to +∞).',
          'Pruning condition: Prune whenever α ≥ β.',
          'Propositional Logic: Modus Ponens (A, A → B ⊢ B); Resolution rule: (A ∨ B) ∧ (¬B ∨ C) ⊢ (A ∨ C).',
          'Horn Clause: A disjunction of literals with AT MOST ONE positive literal. Solvable in linear time.',
        ],
        coreFormulas: [
          'Alpha-Beta Cutoff: Prune branch if α ≥ β',
          'Modus Ponens: (P ∧ (P → Q)) ⇒ Q',
          'Resolution: (P ∨ Q) ∧ (¬P ∨ R) ⇒ (Q ∨ R)',
        ],
      ),
      NoteSection(
        title: 'Neural Networks, Backpropagation & Activation Functions',
        summary: 'Perceptron, Multi-Layer Perceptron (MLP), activation dynamics, and chain rule gradient propagation.',
        keyPoints: [
          'Perceptron: Single-layer threshold unit can ONLY learn linearly separable functions (fails on XOR!).',
          'Activation Functions:',
          '  • Sigmoid: σ(z) = 1/(1+e^{-z}). Range (0, 1). Vanishing gradient problem as |z| grows because σ\'(z) ≤ 0.25.',
          '  • Tanh: Range (-1, 1). Zero-centered. Maximum derivative is 1.0 (at z=0).',
          '  • ReLU: max(0, z). Solves vanishing gradient for positive activations. Can suffer from "Dying ReLU" if learning rate is too high.',
          '  • Leaky ReLU: max(αz, z) with α ≈ 0.01. Prevents dying units.',
          'Backpropagation: Efficient application of the Chain Rule to compute ∂L/∂W and ∂L/∂b across all layers backward from loss.',
          'Weight initialization: Xavier/Glorot for Sigmoid/Tanh; He/Kaiming for ReLU to prevent exploding/vanishing layer activations.',
        ],
        coreFormulas: [
          'Sigmoid Derivative: σ\'(z) = σ(z)(1 - σ(z)) ≤ 0.25',
          'Tanh Derivative: tanh\'(z) = 1 - tanh^2(z)',
          'He Initialization: Var(W) = 2 / n_{in}',
          'Weight Update: W := W - η (∂L / ∂W)',
        ],
      ),
      NoteSection(
        title: 'CNNs, RNNs, LSTMs & Transformer Self-Attention',
        summary: 'Convolutions, receptive fields, pooling, recurrent gates, and scaled dot-product attention.',
        keyPoints: [
          'Convolution Layer: Output spatial dimension W_{out} = ⌊(W_{in} - K + 2P)/S⌋ + 1, where K is kernel size, P is padding, S is stride.',
          'Number of parameters in Conv layer: (K_w * K_h * C_{in} + 1) * C_{out}, where 1 is the bias term per filter.',
          'Pooling: Downsamples feature maps (Max Pooling, Average Pooling). Has ZERO learnable parameters!',
          'Vanishing Gradient in RNNs: Backpropagation Through Time (BPTT) over long sequences causes gradients to explode or vanish exponentially.',
          'LSTM: Solves vanishing gradients via constant error carousel in Cell State C_t. Controlled by 3 gates: Forget gate f_t, Input gate i_t, Output gate o_t.',
          'Transformer Self-Attention: Replaces recurrence with parallel attention: Attention(Q, K, V) = softmax(Q K^T / √d_k) V.',
        ],
        coreFormulas: [
          'Conv Output Dimension: O = ⌊(W - K + 2P) / S⌋ + 1',
          'Conv Parameters: (K × K × C_{in} + 1) × C_{out}',
          'Attention(Q, K, V) = softmax((Q K^T) / √d_k) V',
          'LSTM Gates: f_t = σ(W_f [h_{t-1}, x_t] + b_f)',
        ],
      ),
    ],
    proSections: [
      ProNoteSection(
        title: 'Alpha-Beta Pruning Cutoffs & CNN Parameter Math',
        inDepthTheory: '''
Alpha-Beta Pruning in minimax trees is a classic GATE examination question.
Remember the two key rules:
1. MAX node updates α: α = max(α, child_val). Prune if child_val ≥ β.
2. MIN node updates β: β = min(β, child_val). Prune if child_val ≤ α.
In ideal move ordering (best moves evaluated first), Alpha-Beta reduces effective branching factor from b to √b, doubling the searchable search depth!
In CNNs, students often mistake the number of connections with the number of learnable parameters. Parameter sharing ensures that the number of weights in a convolutional layer depends ONLY on the filter size and channel counts, completely independent of the input image spatial resolution!
''',
        examTraps: [
          'TRAP: Forgetting bias parameters in CNN calculations. Each output filter has 1 bias scalar. If there are 32 output filters, you MUST add 32 biases to the total parameter count!',
          'TRAP: Pooling layers have NO parameters. Max pooling and average pooling have 0 weights and 0 biases.',
          'TRAP: In A* search, if heuristic is admissible but NOT consistent, graph search using a closed set can fail to find the optimal path unless re-opening of closed nodes is allowed.',
        ],
        solvedExample: '''
[GATE DA Benchmark Numerical]
An input image of shape 32 × 32 with 3 RGB color channels is passed through a convolutional layer with:
- 16 filters of size 5 × 5
- Stride S = 1
- Padding P = 2
Followed by a 2 × 2 Max Pooling layer with Stride S = 2.
Calculate: (i) Output dimension after convolution, (ii) Number of trainable parameters in Conv layer, (iii) Output dimension after pooling.

Solution:
(i) Conv output spatial size:
W_{out} = ⌊(32 - 5 + 2(2)) / 1⌋ + 1 = ⌊(32 - 5 + 4) / 1⌋ + 1 = 31 + 1 = 32.
Output shape after Conv: 32 × 32 × 16.

(ii) Trainable parameters in Conv layer:
Each filter has size: (5 × 5 × 3) weights + 1 bias = 75 + 1 = 76 parameters.
For 16 filters: Total parameters = 16 × 76 = 1,216 parameters.

(iii) Max Pooling output size:
W_{pool} = ⌊(32 - 2) / 2⌋ + 1 = ⌊30 / 2⌋ + 1 = 15 + 1 = 16.
Output shape after Pooling: 16 × 16 × 16.
''',
        shortcutTips: [
          'For "Same" padding in CNN with stride 1: P = (K - 1) / 2. Output spatial dimension matches input spatial dimension exactly.',
          'Softmax scale factor 1/√d_k in Transformer attention prevents dot products from growing excessively large in high dimensions, preventing vanishing softmax gradients.',
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
          'Fundamental operators: Selection (σ), Projection (π), Union (∪), Set Difference (-), Cartesian Product (×), Rename (ρ).',
          'Derived operators: Set Intersection (∩), Natural Join (⋈), Theta Join (⋈_θ), Division (÷). Division is used for "for ALL" queries.',
          'SQL Query Execution Order: FROM → WHERE → GROUP BY → HAVING → SELECT → DISTINCT → ORDER BY → LIMIT.',
          'WHERE vs HAVING: WHERE filters individual row tuples BEFORE grouping; HAVING filters groups AFTER aggregation.',
          'Window Functions (GATE DA Specific): ROW_NUMBER() assigns unique sequential integers; RANK() leaves gaps after ties (e.g. 1, 2, 2, 4); DENSE_RANK() leaves NO gaps after ties (e.g. 1, 2, 2, 3).',
          'NULL logic: 3-valued logic (TRUE, FALSE, UNKNOWN). NULL = NULL evaluates to UNKNOWN! Always use IS NULL or IS NOT NULL.',
        ],
        coreFormulas: [
          'Natural Join: R ⋈ S = π_{attrs}(σ_{R.A=S.A}(R × S))',
          'Division: R(A, B) ÷ S(B) = π_A(R) - π_A((π_A(R) × S) - R)',
          'DENSE_RANK() vs RANK(): DENSE_RANK assigns consecutive ranks without skips',
        ],
      ),
      NoteSection(
        title: 'Functional Dependencies, Key Finding & Normal Forms',
        summary: 'Armstrong\'s axioms, attribute closure, minimal cover, candidate keys, 1NF, 2NF, 3NF, and BCNF.',
        keyPoints: [
          'Attribute Closure X^+: Set of all attributes functionally determined by X under F. If X^+ contains all relation attributes, X is a Superkey.',
          'Candidate Key: Minimal superkey (no proper subset of X is a superkey).',
          '1NF: All attribute values are atomic (no repeating groups or multivalued attributes).',
          '2NF: In 1NF and NO partial dependency (no non-prime attribute depends on a proper subset of any candidate key).',
          '3NF: For every non-trivial FD X → Y, either X is a Superkey OR Y is a Prime attribute (part of SOME candidate key).',
          'BCNF: For every non-trivial FD X → Y, X MUST be a Superkey. Strictly stronger than 3NF.',
          'Decomposition guarantees: Any relation can ALWAYS be decomposed into 3NF with Lossless Join AND Dependency Preservation. However, BCNF decomposition guarantees Lossless Join, but may NOT preserve dependencies!',
        ],
        coreFormulas: [
          'Lossless Join Condition: (R_1 ∩ R_2) → R_1  OR  (R_1 ∩ R_2) → R_2',
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
          'Secondary Index: Unordered data file. Index key can be candidate key or non-key. Must be a DENSE index.',
          'B+ Tree properties with node order p (max block pointers):',
          '  • Internal node: Holds at most p pointers and at most (p - 1) search keys.',
          '  • Internal node minimum: At least ⌈p / 2⌉ pointers and ⌈p / 2⌉ - 1 keys (except root).',
          '  • Leaf node: Holds at most (p_leaf - 1) record pointers/keys and 1 pointer to next leaf node.',
          '  • Leaf node minimum: At least ⌈(p_leaf - 1) / 2⌉ keys.',
          'All leaf nodes are at the exact same depth, providing guaranteed O(log n) search, insert, and delete.',
        ],
        coreFormulas: [
          'Internal Node Size: p * P_{block} + (p - 1) * K ≤ Block_Size',
          'Leaf Node Size: (p_{leaf} - 1) * (K + P_{rec}) + P_{block} ≤ Block_Size',
          'Max records in B+ Tree of height h: N_{max} = (p - 1) * p^{h-1}',
        ],
      ),
      NoteSection(
        title: 'Transactions, Serializability & Data Warehousing (OLAP)',
        summary: 'ACID properties, conflict serializability, strict 2PL, Star/Snowflake schemas, and OLAP cubes.',
        keyPoints: [
          'Conflicting Operations: Two operations conflict iff they belong to different transactions, access the SAME data item, and at least ONE of them is a WRITE.',
          'Conflict Serializability: A schedule is conflict serializable iff its Precedence (Serialization) Graph has NO CYCLES. Topological sort gives serial order.',
          'Strict 2PL: All exclusive (write) locks must be held until the transaction COMMITS or ABORTS. Guarantees conflict serializability AND strict/cascadeless recoverability (avoids cascading rollbacks).',
          'Data Warehousing (GATE DA Syllabus Focus):',
          '  • OLTP vs OLAP: OLTP handles day-to-day transactional updates (normalized, 3NF, row-oriented); OLAP handles historical complex queries (denormalized, multidimensional, column-oriented).',
          '  • Star Schema: Central fact table directly connected to completely denormalized dimension tables. Fast queries, simple joins, higher redundancy.',
          '  • Snowflake Schema: Dimension tables are normalized into multiple related tables. Reduces redundancy, but requires more expensive multi-table joins.',
          '  • Fact Table: Contains numerical additive/semi-additive measures and foreign keys pointing to dimension tables.',
          '  • OLAP Operations: Roll-up (aggregation, climb hierarchy), Drill-down (navigate to finer granularity), Slice (select 1 dimension value), Dice (subcube selection across multiple dimensions), Pivot (rotate axes).',
        ],
        coreFormulas: [
          'Precedence Graph: Edge T_i → T_j if T_i operation precedes conflicting T_j operation',
          'Strict 2PL: Shrinking phase releases write locks ONLY at transaction termination',
        ],
      ),
    ],
    proSections: [
      ProNoteSection(
        title: 'B+ Tree Order Calculations & Star vs Snowflake Traps',
        inDepthTheory: '''
In GATE DA, B+ tree node order calculation questions appear frequently in NAT questions:
Key parameters: Block Size B, Key Size K, Block Pointer P_b, Record Pointer P_r.
1. Order of an internal node p:
   p * P_b + (p - 1) * K ≤ B ⇒ p * (P_b + K) ≤ B + K ⇒ p = ⌊(B + K) / (P_b + K)⌋.
2. Capacity of a leaf node:
   Each leaf holds search key K and record pointer P_r pairs, plus 1 block pointer P_b to the sibling leaf node:
   m * (K + P_r) + P_b ≤ B ⇒ m = ⌊(B - P_b) / (K + P_r)⌋.

In Data Warehousing:
Fact table measures are categorized as:
- Fully Additive: Can be summed across all dimensions (e.g., Sales quantity, Revenue).
- Semi-Additive: Can be summed across SOME dimensions, but not all (e.g., Bank account balance can be summed across accounts or branches, but NOT across time!).
- Non-Additive: Cannot be meaningfully summed across any dimension (e.g., Unit price, Percentage margin, Ratios).
''',
        examTraps: [
          'TRAP: Confusing internal node pointer capacity with leaf node key capacity. Internal nodes point to other disk blocks (P_b), while leaf nodes point to data records (P_r) plus one block pointer to the next leaf!',
          'TRAP: Precedence graph direction. Edge is drawn FROM the earlier transaction TO the later transaction (T_1 → T_2 if T_1 writes and later T_2 reads). Reverse edges will falsely report no cycles or wrong topological sort!',
        ],
        solvedExample: '''
[GATE DA Benchmark Numerical]
A database file block size is 1024 bytes. A B+ tree index is constructed with:
- Search key size K = 12 bytes
- Block pointer size P_b = 6 bytes
- Record pointer size P_r = 8 bytes
Calculate: (i) Maximum order of internal node, (ii) Maximum number of record pointers in a leaf node.

Solution:
(i) Internal Node Order p:
p * P_b + (p - 1) * K ≤ Block_Size
p * 6 + (p - 1) * 12 ≤ 1024
6p + 12p - 12 ≤ 1024
18p ≤ 1036
p ≤ 1036 / 18 ≈ 57.55
Since p must be an integer, max internal node order p = 57.

(ii) Leaf Node Capacity m:
m * (K + P_r) + P_b ≤ Block_Size
m * (12 + 8) + 6 ≤ 1024
20m + 6 ≤ 1024
20m ≤ 1018
m ≤ 1018 / 20 = 50.9
Max record keys per leaf node m = 50.
''',
        shortcutTips: [
          'If a relation has 2 candidate keys of 1 attribute each (e.g. R(A, B, C) where A and B are keys), then EVERY attribute is prime! Thus, the relation is GUARANTEED to be in 3NF.',
          'Snowflake schema normalization reduces disk storage space, but increases query response time due to additional JOIN operations across decomposed dimension tables.',
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
          'Default Arguments Pitfall: `def foo(x=[])` creates the list once at function definition time, NOT per call. Subsequent calls mutate the shared list!',
          'Time complexities in Python: List append O(1), pop() from end O(1), pop(0) O(n), insert(0, v) O(n). Dict get/set/in O(1) average. Set add/in O(1) average.',
          'NumPy Broadcasting rules: Two dimensions are compatible when they are equal OR one of them is 1. Dimensions are matched from right to left!',
          'Slicing in NumPy creates a VIEW (shares underlying memory; modifying the slice modifies the original array!). In contrast, Python standard list slicing creates a shallow COPY.',
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
          'Definitions: f(n) = O(g(n)) means f(n) ≤ c * g(n) (asymptotic upper bound); Ω(g(n)) lower bound; Θ(g(n)) tight bound (both O and Ω).',
          'Master Theorem for T(n) = a T(n/b) + f(n) with a ≥ 1, b > 1:',
          '  • Case 1: If f(n) = O(n^{log_b a - ϵ}) for ϵ > 0, then T(n) = Θ(n^{log_b a}).',
          '  • Case 2: If f(n) = Θ(n^{log_b a} * log^k n) for k ≥ 0, then T(n) = Θ(n^{log_b a} * log^{k+1} n).',
          '  • Case 3: If f(n) = Ω(n^{log_b a + ϵ}) and a f(n/b) ≤ c f(n) for c < 1, then T(n) = Θ(f(n)).',
          'Master Theorem Fails when: a is not constant (e.g. 2^n), b < 1, or f(n) is not polynomially related to n^{log_b a}.',
        ],
        coreFormulas: [
          'Master Theorem Critical Exponent: c_{crit} = log_b(a)',
          'Logarithmic Identities: n^{log_b a} = a^{log_b n}',
          'Sum of Series: ∑_{i=1}^n i = n(n+1)/2 ; ∑_{i=0}^k r^i = (r^{k+1} - 1)/(r - 1)',
        ],
      ),
      NoteSection(
        title: 'Trees, BST, AVL & Binary Heaps',
        summary: 'Tree properties, inorder traversal, AVL rotations, and heap operations.',
        keyPoints: [
          'Binary Tree: Level l has at most 2^l nodes. A tree of height h has at most 2^{h+1} - 1 nodes.',
          'Inorder traversal of a Binary Search Tree (BST) visits nodes in strictly ASCENDING sorted order.',
          'AVL Tree: Self-balancing BST. Balance Factor BF = height(left) - height(right) ∈ {-1, 0, 1}. Fixed via LL, RR (single rotations) or LR, RL (double rotations). Max height h < 1.44 log_2 n.',
          'Binary Heap: Complete binary tree stored in array: for index i (1-based), left child = 2i, right child = 2i+1, parent = ⌊i/2⌋.',
          'Building a heap from an array takes O(n) time (NOT O(n log n)!) using bottom-up heapify.',
          'Extract-Min / Extract-Max takes O(log n) time.',
        ],
        coreFormulas: [
          'Max nodes in binary tree of height h: 2^{h+1} - 1',
          'Build-Heap Time: ∑ (h / 2^h) = O(n)',
          'AVL Balance Factor: BF(v) = height(left) - height(right) ∈ {-1, 0, 1}',
        ],
      ),
      NoteSection(
        title: 'Sorting, Graph Algorithms & Dynamic Programming',
        summary: 'Quicksort, Dijkstra, Kruskal MST, Bellman-Ford, Knapsack, and Longest Common Subsequence.',
        keyPoints: [
          'Comparison Sort Lower Bound: Any comparison-based sorting algorithm requires at least Ω(n log n) comparisons in the worst case.',
          'Quicksort: Average O(n log n), Worst-case O(n^2) (occurs when pivot is already extreme min/max).',
          'Dijkstra\'s Algorithm: Finds Single-Source Shortest Path in non-negative weighted graphs. Time O((V + E) log V) with min-heap. Fails on negative edge weights!',
          'Bellman-Ford: Handles negative weights and detects negative weight cycles in O(V * E) time.',
          'Kruskal\'s MST: Greedy algorithm using Disjoint Set Union (DSU) with union-by-rank and path compression in O(E log E) time.',
          '0/1 Knapsack: DP state DP[i][w] = max(DP[i-1][w], val[i-1] + DP[i-1][w - wt[i-1]]). Time O(n * W) (pseudo-polynomial).',
        ],
        coreFormulas: [
          'Dijkstra with Min-Heap: O((V + E) log V)',
          'Bellman-Ford Time: O(V * E)',
          '0/1 Knapsack Recurrence: DP[i, w] = max(DP[i-1, w], DP[i-1, w-w_i] + v_i)',
          'LCS Recurrence: if x[i]==y[j] ⇒ 1 + LCS[i-1, j-1] else max(LCS[i-1, j], LCS[i, j-1])',
        ],
      ),
    ],
    proSections: [
      ProNoteSection(
        title: 'Master Theorem Traps, Dijkstra Failure & DP Formulations',
        inDepthTheory: '''
In GATE DA, Master Theorem traps are tested frequently:
Trap example: T(n) = 2 T(n/2) + n / log n.
Here, a = 2, b = 2, so n^{log_b a} = n^1.
f(n) = n / log n = n * (log n)^-1.
Students often incorrectly apply Case 2 with k = -1. However, Case 2 ONLY applies for k ≥ 0!
For k = -1, the recurrence solves to T(n) = Θ(n log log n) via recursion tree summation.

Dijkstra\'s Algorithm with Negative Edges:
Dijkstra greedily marks a vertex as "visited" and permanently fixes its distance when extracted from the priority queue. If a subsequent negative edge provides a shorter path to an already visited vertex, Dijkstra will NOT re-evaluate it, producing an incorrect shortest path.

Dynamic Programming Space Optimization:
In 0/1 Knapsack, standard DP table requires O(n * W) space. By iterating capacity w BACKWARD from W down to wt[i], a single 1D array of size W + 1 suffices, cutting space from O(nW) to O(W).
''',
        examTraps: [
          'TRAP: In Quicksort, worst-case time O(n^2) occurs when the input is already sorted (if choosing first or last element as pivot). Using randomized pivot or median-of-three avoids this.',
          'TRAP: Python dict key requirements. Dict keys MUST be hashable (immutable). A tuple containing a list cannot be a dict key!',
          'TRAP: Number of spanning trees in a complete graph K_n is n^{n-2} (Cayley\'s Formula). For K_4, it is 4^2 = 16.',
        ],
        solvedExample: '''
[GATE DA Benchmark Numerical]
Find the length of the Longest Common Subsequence (LCS) between strings:
X = "ABCBDAB" and Y = "BDCAB".

Solution:
DP table computation L[i, j]:
Match when X[i-1] == Y[j-1]: L[i, j] = 1 + L[i-1, j-1].
Mismatch: L[i, j] = max(L[i-1, j], L[i, j-1]).

Tracing:
One optimal common subsequence is: "B" - "C" - "A" - "B" (Length 4).
Another is: "B" - "D" - "A" - "B" (Length 4).
Maximum LCS length = 4.
''',
        shortcutTips: [
          'Sum of degrees in any graph = 2 * |E| (Handshaking Lemma). Number of vertices with odd degree MUST be even.',
          'Building a max-heap of size n: n/2 leaves do 0 swaps, n/4 do 1 swap... exact total swaps ≤ n.',
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
          'Process States: New → Ready ↔ Running → Terminated (and Blocked/Waiting). Context switch overhead is pure system waste.',
          'Scheduling Metrics: Turnaround Time = Completion Time - Arrival Time. Waiting Time = Turnaround Time - Burst Time. Response Time = First CPU Allocation - Arrival Time.',
          'Preemptive vs Non-preemptive: Shortest Remaining Time First (SRTF) is optimal for minimizing average waiting time, but can cause starvation of long jobs.',
          'Round Robin: Time quantum q choice is critical. If q is very large, RR degenerates into FCFS; if q is extremely small, context switch overhead dominates.',
          'User-level vs Kernel-level threads: User threads are fast to create and switch (no kernel trap), but if one thread makes a blocking system call, the entire process blocks.',
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
          'Critical Section 3 Requirements: Mutual Exclusion (mandatory), Progress (mandatory, no outside blocking), Bounded Waiting (prevents starvation).',
          'Peterson\'s Solution: Software 2-process synchronization satisfying all 3 requirements using `flag[2]` and `turn`.',
          'Semaphores: Wait(S) decrements S; Signal(S) increments S. Counting semaphore initialized to k allows k processes into the critical region concurrently.',
          '4 Necessary Conditions for Deadlock: Mutual Exclusion, Hold and Wait, No Preemption, Circular Wait (Coffman conditions).',
          'Banker\'s Algorithm: Avoidance algorithm. Requires: Need = Max - Allocation. If Need ≤ Available, process finishes and releases Allocation.',
        ],
        coreFormulas: [
          'Need Matrix = Max Matrix - Allocation Matrix',
          'Resource Safety: Need_i ≤ Available ⇒ Available := Available + Allocation_i',
          'Counting Semaphore: If value is -k, exactly k processes are waiting in queue',
        ],
      ),
      NoteSection(
        title: 'Memory Management, Paging & Virtual Memory',
        summary: 'Address translation, TLB hit math, page replacement algorithms, Belady\'s anomaly, and thrashing.',
        keyPoints: [
          'Paging: Divides virtual memory into fixed-size Pages, and physical memory into Frames of identical size. Eliminates external fragmentation, but internal fragmentation remains on the last page.',
          'Address Translation: Virtual address = (Page Number p, Page Offset d). Physical address = (Frame Number f, Page Offset d).',
          'Effective Memory Access Time (EMAT): EMAT = h * (t_{TLB} + t_m) + (1 - h) * (t_{TLB} + 2 t_m) for single-level page tables.',
          'Page Replacement Algorithms:',
          '  • FIFO: Can suffer from Belady\'s Anomaly (increasing frame count increases page faults!).',
          '  • Optimal (OPT/MIN): Replaces page that will not be used for the longest time in the future. Serves as benchmark.',
          '  • Least Recently Used (LRU): Replaces page unused for longest time. Stack algorithm; never exhibits Belady\'s anomaly.',
          'Thrashing: High paging activity where CPU spends more time swapping pages than executing instructions. Occurs when ∑ Working Set Sizes > Physical Memory.',
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
        title: 'Multi-Level Paging Math, TLB Latencies & Unix Inodes',
        inDepthTheory: '''
In GATE CS/IT, memory architecture numericals test multi-level page tables and Unix Inodes:
1. Multi-Level Page Table Size:
   If virtual address is 32-bit and page size is 4 KB (2^12 B), page offset is 12 bits, leaving 20 bits for page table index.
   If each entry is 4 bytes, a single-level page table requires 2^20 * 4 B = 4 MB per process.
   In two-level paging with 4 KB page tables, each page table holds 4 KB / 4 B = 1024 = 2^10 entries.
   The 20-bit index is split into p_1 (10 bits) and p_2 (10 bits).

2. Unix Inode Maximum File Size:
   An Inode typically contains:
   - 12 Direct block pointers
   - 1 Singly indirect pointer
   - 1 Doubly indirect pointer
   - 1 Triply indirect pointer
   If block size is B and disk block pointer is P bytes:
   Direct capacity = 12 * B.
   Singly indirect = (B / P) * B.
   Doubly indirect = (B / P)^2 * B.
   Triply indirect = (B / P)^3 * B.
''',
        examTraps: [
          'TRAP: In EMAT calculations, check whether TLB search and main memory access occur in parallel or in series. If parallel: EMAT = h * max(t_tlb, t_m) + (1 - h) * (t_tlb + t_m). If series: add t_tlb to both paths.',
          'TRAP: Banker\'s algorithm safety state is NOT the same as deadlock-free state. Every unsafe state is not currently deadlocked, but may lead to deadlock.',
        ],
        solvedExample: '''
[GATE CS/IT Benchmark Numerical]
A 2-level paging system has 32-bit virtual addresses, 4 KB page size, 4-byte Page Table Entries (PTE), and a TLB with access time 10 ns. Main memory access time is 100 ns.
If the TLB hit ratio is 90%, calculate:
(i) Virtual address bit split (p_1, p_2, offset)
(ii) Effective Memory Access Time (EMAT) assuming serial TLB lookup.

Solution:
(i) Page size = 4 KB = 2^12 bytes ⇒ Offset = 12 bits.
Remaining virtual address bits = 32 - 12 = 20 bits.
Number of entries per 4 KB page table = 4 KB / 4 B = 1024 = 2^10 ⇒ p_2 = 10 bits.
First-level index p_1 = 20 - 10 = 10 bits.
Split: (10, 10, 12).

(ii) EMAT calculation:
TLB Hit: Access TLB (10 ns) + Access Main Memory for data (100 ns) = 110 ns.
TLB Miss: Access TLB (10 ns) + Level 1 Page Table (100 ns) + Level 2 Page Table (100 ns) + Data Frame (100 ns) = 310 ns.
EMAT = (0.90 * 110) + (0.10 * 310) = 99 + 31 = 130 ns.
''',
        shortcutTips: [
          'In Round Robin scheduling, if burst times of all n processes are equal to quantum q, then every process finishes in the very first cycle with 0 waiting time for the first process.',
          'LRU and Optimal page replacement are immune to Belady\'s Anomaly because they belong to the inclusion family of stack algorithms.',
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
          'Delays: Transmission Delay T_t = L / B (Length / Bandwidth). Propagation Delay T_p = d / v (Distance / Velocity).',
          'Propagation parameter: a = T_p / T_t.',
          'Stop-and-Wait Efficiency: η = 1 / (1 + 2a).',
          'Go-Back-N (GBN): Sender window size W_s = 2^k - 1 (for k-bit sequence numbers), Receiver window W_r = 1. Uses cumulative ACKs. If a packet drops, all subsequent sent packets must be retransmitted.',
          'Selective Repeat (SR): W_s = W_r = 2^{k-1}. Independent ACKs; only dropped packets are retransmitted.',
          'CRC Error Detection: If generator polynomial G(x) has degree r, append r zeros to data and divide using modulo-2 arithmetic. The remainder (CRC checksum) replaces the r zeros.',
        ],
        coreFormulas: [
          'T_t = L / B  ;  T_p = Distance / Speed',
          'Stop-and-Wait Efficiency: η = 1 / (1 + 2a)',
          'GBN Window: W_s ≤ 2^k - 1  ;  W_r = 1',
          'SR Window: W_s + W_r ≤ 2^k  ⇒  W_s = W_r = 2^{k-1}',
        ],
      ),
      NoteSection(
        title: 'Network Layer: IPv4 Addressing, Subnetting & Routing',
        summary: 'CIDR, VLSM, fragmentation offsets, Bellman-Ford count-to-infinity, and OSPF.',
        keyPoints: [
          'IPv4 Header: 20 to 60 bytes. Total length (16 bits) gives packet size. TTL decremented at each router; packet dropped if TTL = 0 (generates ICMP Time Exceeded).',
          'Fragmentation: Fragment Offset is measured in 8-byte units! All fragments except the last must have Total Length as a multiple of 8.',
          'CIDR Subnetting: Prefix /n leaves (32 - n) host bits. Total IP addresses = 2^{32-n}; Usable host IPs = 2^{32-n} - 2 (subtract network and broadcast addresses).',
          'Distance Vector Routing: Based on Bellman-Ford. Suffers from Count-to-Infinity problem (mitigated by Split Horizon and Poison Reverse).',
          'Link State Routing: Based on Dijkstra. Every router floods entire topology to all nodes via Link State Advertisements (LSAs).',
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
          'TCP Connection Establishment: 3-way handshake (SYN → SYN-ACK → ACK). Teardown uses 4-way handshake (FIN → ACK, FIN → ACK).',
          'TCP Congestion Control Phases:',
          '  1. Slow Start: Congestion Window (cwnd) starts at 1 MSS and DOUBLES every RTT (exponential growth) until reaching Slow Start Threshold (ssthresh).',
          '  2. Congestion Avoidance: Once cwnd ≥ ssthresh, cwnd increases linearly by 1 MSS per RTT (Additive Increase).',
          '  3. Timeout (Loss Event in Tahoe & Reno): ssthresh = cwnd / 2. cwnd reset to 1 MSS (in Tahoe).',
          '  4. 3 Duplicate ACKs (Fast Retransmit & Recovery in Reno): ssthresh = cwnd / 2, cwnd set to ssthresh (Multiplicative Decrease), resumes linear growth without resetting to 1 MSS!',
        ],
        coreFormulas: [
          'Slow Start: cwnd_{t+1} = 2 * cwnd_t',
          'Congestion Avoidance: cwnd_{t+1} = cwnd_t + 1 MSS per RTT',
          'TCP Throughput ≈ (1.22 * MSS) / (RTT * √p)',
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
          'TRAP: In CSMA/CD, the minimum frame size formula is L_{min} = 2 * T_p * B. Students frequently forget the factor of 2! The factor of 2 is necessary because collision signal must propagate back to the sender before transmission completes.',
          'TRAP: Fragment offset units. The Fragment Offset header field counts in 8-byte blocks. If 800 bytes precede the fragment, offset is 800 / 8 = 100, NOT 800!',
        ],
        solvedExample: '''
[GATE CS/IT Benchmark Numerical]
A 1 Gbps network has distance 2000 km between sender and receiver. Propagation speed is 2 × 10^8 m/s.
Packets are 1000 bytes.
Find the minimum number of sequence number bits required for a Go-Back-N protocol to achieve 100% link utilization.

Solution:
Bandwidth B = 10^9 bps.
Distance d = 2 × 10^6 m, Speed v = 2 × 10^8 m/s.
T_p = (2 × 10^6) / (2 × 10^8) = 10^-2 s = 10 ms.
Packet size L = 1000 bytes = 8000 bits.
T_t = 8000 / 10^9 = 8 × 10^-6 s = 0.008 ms.
Propagation parameter a = T_p / T_t = 10 ms / 0.008 ms = 1250.
For 100% utilization:
W_s ≥ 1 + 2a = 1 + 2(1250) = 2501 packets.
In Go-Back-N: W_s ≤ 2^k - 1
2^k - 1 ≥ 2501 ⇒ 2^k ≥ 2502.
Since 2^11 = 2048 and 2^12 = 4096:
Minimum bits k = 12 bits.
''',
        shortcutTips: [
          'Subnet mask /28 has 4 host bits. 2^4 = 16 total IPs, with 16 - 2 = 14 usable hosts per subnet.',
          'Stop-and-Wait efficiency is always less than 50% whenever propagation delay T_p is greater than transmission delay T_t (i.e. a > 0.5).',
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
          'Deterministic Finite Automata (DFA): 5-tuple (Q, Σ, δ, q_0, F). For every state and input symbol, δ(q, a) has EXACTLY ONE transition.',
          'NFA Equivalence: Every NFA can be converted to an equivalent DFA using subset construction. For an n-state NFA, the equivalent DFA has at most 2^n states.',
          'Arden\'s Theorem: If P and Q are regular expressions over Σ and P does not contain ϵ, the equation R = Q + RP has a UNIQUE solution R = Q P^*.',
          'Pumping Lemma for Regular Languages: If L is regular, any string w ∈ L with |w| ≥ p can be split into w = xyz such that |y| ≥ 1, |xy| ≤ p, and xy^i z ∈ L for all i ≥ 0.',
          'DFA Minimization: Table-filling algorithm partitions states into distinguishable and indistinguishable pairs in O(n^2) time.',
        ],
        coreFormulas: [
          'Subset Construction: Max DFA states = 2^{|Q_{NFA}|}',
          'Arden\'s Theorem: R = Q + RP  ⇒  R = Q P^*',
          'Pumping Lemma: w = xyz, |xy| ≤ p, |y| ≥ 1, xy^i z ∈ L',
        ],
      ),
      NoteSection(
        title: 'Context-Free Grammars, Languages & Pushdown Automata',
        summary: 'CFG derivations, ambiguity, CNF, GNF, DPDA vs NPDA, and inherent ambiguity.',
        keyPoints: [
          'Ambiguity: A grammar is ambiguous if there exists at least one string with two or more distinct leftmost derivations (or distinct parse trees).',
          'Inherently Ambiguous CFL: A CFL for which NO unambiguous CFG exists (e.g. L = {a^i b^j c^k | i = j or j = k}).',
          'Chomsky Normal Form (CNF): All productions are of the form A → BC or A → a. A derivation of a string of length n requires EXACTLY 2n - 1 steps.',
          'Pushdown Automata (PDA): Finite control + single infinite LIFO stack. DPDA recognizes Deterministic Context-Free Languages (DCFL). NPDA recognizes all CFLs.',
          'DCFL is a STRICT SUBSET of CFL (NPDA is strictly more powerful than DPDA, unlike DFA vs NFA!).',
        ],
        coreFormulas: [
          'CNF Derivation Steps for string of length n: 2n - 1 steps',
          'DCFL ⊂ CFL ⊂ CSL ⊂ REC ⊂ RE',
        ],
      ),
      NoteSection(
        title: 'Turing Machines, Chomsky Hierarchy & Decidability',
        summary: 'Chomsky classification, Halting Problem, Rice\'s Theorem, and undecidability matrix.',
        keyPoints: [
          'Chomsky Hierarchy:',
          '  • Type 3: Regular Languages (Finite Automata).',
          '  • Type 2: Context-Free Languages (Pushdown Automata).',
          '  • Type 1: Context-Sensitive Languages (Linear Bounded Automata).',
          '  • Type 0: Recursively Enumerable Languages (Turing Machine).',
          'Decidable Language (Recursive): TM always halts (accepts or rejects).',
          'Turing Recognizable (Recursively Enumerable RE): TM halts and accepts if w ∈ L, but may loop infinitely if w ∉ L.',
          'Halting Problem: Undecidable and not recursive, but Recursively Enumerable.',
          'Rice\'s Theorem: Any non-trivial semantic property of the language recognized by a Turing Machine is UNDECIDABLE.',
        ],
        coreFormulas: [
          'Rice\'s Theorem: If P is non-trivial property of RE languages, L_P is undecidable',
          'Post Correspondence Problem (PCP): Undecidable for alphabet size ≥ 2',
        ],
      ),
    ],
    proSections: [
      ProNoteSection(
        title: 'Language Closure & Decidability Matrix',
        inDepthTheory: '''
In GATE CS/IT, closure and decidability questions appear every single year without exception.
Closure Properties Summary:
- Regular: Closed under Union, Intersection, Complement, Concatenation, Kleene Star, Difference, Reversal, Homomorphism.
- DCFL: Closed under Complement. NOT closed under Union, Intersection, Concatenation, Kleene Star!
- CFL: Closed under Union, Concatenation, Kleene Star, Reversal. NOT closed under Intersection, Complement, Set Difference!
- Recursive: Closed under Union, Intersection, Complement, Concatenation, Kleene Star.
- RE: Closed under Union, Intersection, Concatenation, Kleene Star. NOT closed under Complement!

Decidability Summary:
- Emptiness (Is L = ∅?): Decidable for Regular and CFL. Undecidable for CSL, REC, RE.
- Equality (Is L_1 = L_2?): Decidable for Regular. Undecidable for CFL, CSL, REC, RE.
- Totality (Is L = Σ^*?): Decidable for Regular. Undecidable for CFL, CSL, REC, RE.
- Membership (Is w ∈ L?): Decidable for Regular, CFL, CSL, REC. Undecidable for RE.
''',
        examTraps: [
          'TRAP: CFL is NOT closed under intersection. However, intersection of a CFL with a REGULAR language is ALWAYS Context-Free (CFL ∩ Regular = CFL). This property is frequently used to prove non-context-freeness!',
          'TRAP: Rice\'s Theorem applies ONLY to properties of the LANGUAGE (semantic), NOT properties of the Turing Machine description or syntax (e.g. "Does TM have 5 states?" is decidable).',
        ],
        solvedExample: '''
[GATE CS/IT Benchmark Numerical]
Let L_1 be a regular language and L_2 be a context-free language.
Determine the status of:
(i) L_1 ∩ L_2
(ii) L_2 - L_1

Solution:
(i) By the Regular Intersection Property, intersection of any CFL with a Regular language is a CFL.
Therefore, L_1 ∩ L_2 is Context-Free.
(ii) L_2 - L_1 = L_2 ∩ (L_1)^c.
Since L_1 is regular and regular languages are closed under complement, (L_1)^c is regular.
Then L_2 ∩ (L_1)^c is the intersection of a CFL and a Regular language, which is GUARANTEED to be Context-Free.
''',
        shortcutTips: [
          'If a language requires comparing two INDEPENDENT conditions simultaneously (e.g. {a^n b^n c^n}), it CANNOT be context-free because a single PDA stack can only match one pair at a time.',
          'Complement of an RE language is RE if and only if the language is Recursive (L is recursive ⇔ both L and L^c are RE).',
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
          'Compiler Phases: Lexical Analyzer → Syntax Analyzer → Semantic Analyzer → Intermediate Code Generator → Code Optimizer → Target Code Generator.',
          'Lexical Phase: Reads stream of characters and produces Tokens. Eliminates whitespace and comments. Detects lexical errors (e.g. invalid identifiers).',
          'Token: Abstract category (e.g. `<id, 1>`, `<num, 42>`). Lexeme: Concrete character sequence in source code.',
          'Symbol Table: Data structure maintaining identifier names, types, scopes, and memory offsets across all phases.',
        ],
        coreFormulas: [
          'Lexical: Characters → Tokens',
          'Syntax: Tokens → Parse Tree',
          'Semantic: Parse Tree → Annotated Tree (Type checking)',
        ],
      ),
      NoteSection(
        title: 'Syntax Analysis: LL(1) & Bottom-Up LR Parsers',
        summary: 'FIRST & FOLLOW sets, LL(1) tables, Shift-Reduce conflicts, and LR parser hierarchy.',
        keyPoints: [
          'LL(1) Parser: Left-to-right scan, Leftmost derivation, 1 token lookahead. Top-down parser.',
          'LL(1) Grammar Conditions: A grammar is LL(1) iff for every production A → α | β:',
          '  1. FIRST(α) ∩ FIRST(β) = ∅.',
          '  2. If ϵ ∈ FIRST(α), then FIRST(β) ∩ FOLLOW(A) = ∅.',
          '  3. Grammar must have NO left recursion and NO common prefixes (left-factored).',
          'LR Parsers Power Hierarchy: LR(0) ⊂ SLR(1) ⊂ LALR(1) ⊂ CLR(1).',
          'CLR(1) has the largest number of states. LALR(1) merges states of CLR(1) that have identical LR(0) cores, which can introduce Reduce-Reduce (R-R) conflicts, but NEVER Shift-Reduce (S-R) conflicts!',
        ],
        coreFormulas: [
          'LL(1) Conflict Free: FIRST(α) ∩ FIRST(β) = ∅',
          'State Count: |States_{LR(0)}| = |States_{SLR(1)}| = |States_{LALR(1)}| < |States_{CLR(1)}|',
        ],
      ),
      NoteSection(
        title: 'SDT, Intermediate Code & Basic Blocks',
        summary: 'S-attributed vs L-attributed definitions, three-address code, DAGs, and code optimization.',
        keyPoints: [
          'S-Attributed SDT: Uses ONLY synthesized attributes (evaluated bottom-up from children). Evaluated during LR parsing.',
          'L-Attributed SDT: Uses synthesized attributes AND inherited attributes from parent and LEFT siblings (evaluated depth-first left-to-right).',
          'Every S-attributed SDT is L-attributed, but not vice-versa.',
          'Basic Block: Sequence of consecutive statements where execution enters ONLY at the first statement and leaves ONLY at the last without branching.',
          'DAG (Directed Acyclic Graph): Used for basic block optimization (eliminates local common subexpressions and dead code).',
        ],
        coreFormulas: [
          'Three-Address Code: x = y op z  (at most 3 addresses per instruction)',
          'S-Attributed: Children → Parent (Bottom-Up)',
          'L-Attributed: Parent / Left Siblings → Current Node',
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
2. If A → α B β, then everything in FIRST(β) except ϵ is in FOLLOW(B).
3. If A → α B or A → α B β where FIRST(β) contains ϵ, then everything in FOLLOW(A) is in FOLLOW(B).

LR Conflicts:
- Shift-Reduce (S-R): Item set contains [A → α · a β] and [B → γ ·] where \'a\' is the lookahead.
- Reduce-Reduce (R-R): Item set contains [A → α ·] and [B → β ·] for the same lookahead.
SLR(1) places reduces ONLY in FOLLOW(A), eliminating many LR(0) conflicts.
CLR(1) uses explicit lookaheads [A → α ·, a], eliminating SLR(1) false reduces.
''',
        examTraps: [
          'TRAP: In FOLLOW calculations, FOLLOW of any non-terminal NEVER contains ϵ. If your derivation produces ϵ in a FOLLOW set, it is completely wrong!',
          'TRAP: Left recursion eliminates a grammar from being LL(1). If grammar has A → A α, it is NEVER LL(1).',
        ],
        solvedExample: '''
[GATE CS/IT Benchmark Numerical]
Given grammar:
S → A a | b
A → A c | S d | ϵ
Find: (i) FIRST(S), (ii) FOLLOW(A).

Solution:
Since A can produce ϵ:
S → A a ⇒ S can produce \'a\'. Also S → b.
FIRST(S) = {a, b}.
FIRST(A) = {c, d, ϵ} (since S can produce a, b; S d produces a, b; and A → ϵ).
FIRST(S) = {a, b}.

FOLLOW(A):
1. S → A a ⇒ \'a\' ∈ FOLLOW(A).
2. A → A c ⇒ \'c\' ∈ FOLLOW(A).
3. Since S → b and A → S d: FOLLOW(S) contains \'d\'.
4. S → A a ⇒ FOLLOW(S) is NOT used for A.
Thus, FOLLOW(A) = {a, c, d}.
''',
        shortcutTips: [
          'Number of states in LALR(1) is ALWAYS exactly equal to the number of states in SLR(1) and LR(0). Only the transitions/lookaheads differ.',
          'An ambiguous grammar can NEVER be LL(1), SLR(1), LALR(1), or CLR(1).',
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
          'Universal Gates: NAND and NOR. Any boolean function can be realized using NAND alone or NOR alone.',
          'K-Map Gray Code: Successive adjacent cells differ by exactly 1 bit. Groups of 2^k cells eliminate k variables.',
          'Multiplexer (MUX): 2^n:1 MUX has n select lines. An n-variable boolean function can ALWAYS be realized using a 2^{n-1}:1 MUX with no external gates.',
          'Full Adder: Sum = A ⊕ B ⊕ C_{in}; Carry = AB + BC_{in} + AC_{in}. Requires 2 half adders and 1 OR gate.',
          'Carry Lookahead Adder: Computes carry bits in parallel using Generate G_i = A_i B_i and Propagate P_i = A_i ⊕ B_i, reducing addition delay from O(n) to O(1).',
        ],
        coreFormulas: [
          'De Morgan: (A + B)\' = A\' B\'  ;  (AB)\' = A\' + B\'',
          'Full Adder Sum: A ⊕ B ⊕ C_{in}',
          'Carry Lookahead: C_{i+1} = G_i + P_i C_i',
        ],
      ),
      NoteSection(
        title: 'Sequential Circuits: Flip-Flops & Mod-N Counters',
        summary: 'Latches, JK race-around, T flip-flop, synchronous vs ripple counters, and state transitions.',
        keyPoints: [
          'Race-around Condition in JK Flip-Flop: Occurs when J = 1, K = 1, and clock pulse width t_p > propagation delay t_{ff}. Eliminated by using Master-Slave JK or Edge-Triggering.',
          'Characteristic Equations: JK: Q_{next} = J Q\' + K\' Q; T: Q_{next} = T ⊕ Q; D: Q_{next} = D.',
          'Ripple (Asynchronous) Counter: Flip-flops are connected in cascade where output of one clock triggers the next. Total propagation delay = n * t_{ff}.',
          'Synchronous Counter: All flip-flops share the same clock simultaneously. Faster, delay is independent of n.',
          'Ring Counter: n flip-flops provide n states (Mod-n). Johnson Counter (Twisted ring): n flip-flops provide 2n states (Mod-2n).',
        ],
        coreFormulas: [
          'JK Flip-Flop: Q_{next} = J Q\' + K\' Q',
          'T Flip-Flop: Q_{next} = T ⊕ Q',
          'Johnson Counter Modulus: 2n states with n flip-flops',
        ],
      ),
      NoteSection(
        title: 'IEEE 754 Floating Point & Instruction Pipelining',
        summary: 'Single/double precision standards, pipeline hazards, CPI, speedup, and cache mapping.',
        keyPoints: [
          'IEEE 754 Single Precision (32 bits): 1 sign bit (s), 8 exponent bits (e, bias = 127), 23 fraction/mantissa bits (m). Value = (-1)^s * (1.m) * 2^{e - 127}.',
          'Instruction Pipeline: k-stage pipeline executing n instructions takes (k + n - 1) clock cycles in ideal conditions.',
          'Speedup: S = (n * k) / (k + n - 1) → k as n → ∞.',
          'Pipeline Hazards:',
          '  • Structural: Hardware resource conflict (e.g. unified memory accessed by IF and MEM stages simultaneously).',
          '  • Data (RAW, WAR, WAW): Read-After-Write is true data dependency (resolved via Operand Forwarding or Stalling).',
          '  • Control: Branch instructions (resolved via Branch Prediction or Delayed Branching).',
          'Cache Memory: Average Memory Access Time AMAT = t_{hit} + (Miss Rate) * (Miss Penalty).',
        ],
        coreFormulas: [
          'IEEE 754 Single: (-1)^s × (1.m) × 2^{e - 127}',
          'Pipeline Cycles: Clock Cycles = k + n - 1',
          'Speedup: S = (n × k) / (k + n - 1)',
          'AMAT = t_{cache} + (1 - h) × t_{mem}',
        ],
      ),
    ],
    proSections: [
      ProNoteSection(
        title: 'Cache Address Bit Splitting & Pipeline Stalls Math',
        inDepthTheory: '''
In GATE CS/IT, cache architecture and pipeline hazard math are guaranteed question patterns:
1. Set-Associative Cache Address Format:
   Physical Address is partitioned into: [ Tag | Set Index | Block Offset ]
   - Block Offset bits = log_2(Block Size in bytes).
   - Number of Sets = Total Cache Size / (k * Block Size) for a k-way set-associative cache.
   - Set Index bits = log_2(Number of Sets).
   - Tag bits = Total Physical Address bits - Set Index bits - Block Offset bits.

2. Pipeline Hazard Branch Penalty:
   Average CPI = Ideal CPI + (Stall cycles per instruction).
   If a branch instruction occurs with frequency p_b and penalty b cycles:
   CPI_{avg} = 1 + p_b * b.
''',
        examTraps: [
          'TRAP: In k-way cache, number of sets is Cache_Size / (k * Block_Size), NOT Cache_Size / Block_Size. A common NAT error is dividing only by block size!',
          'TRAP: IEEE 754 implicit leading 1. In normalized IEEE 754, the mantissa has an implicit leading 1 (1.M). Do not write M directly without prepending 1.!',
        ],
        solvedExample: '''
[GATE CS/IT Benchmark Numerical]
A 32-bit CPU has a 64 KB 4-way set-associative cache with 64-byte blocks.
Find the size of the Tag, Set Index, and Block Offset fields in bits.

Solution:
Physical address = 32 bits.
Block Size = 64 bytes = 2^6 bytes ⇒ Block Offset = 6 bits.
Total Cache Size = 64 KB = 2^{16} bytes.
Block Size = 64 bytes = 2^6 bytes.
Number of lines = 2^{16} / 2^6 = 2^{10} lines.
4-way set associative ⇒ Number of sets = 2^{10} / 4 = 2^8 = 256 sets.
Set Index bits = log_2(2^8) = 8 bits.
Tag bits = 32 - (Set Index + Block Offset) = 32 - (8 + 6) = 32 - 14 = 18 bits.
Fields: Tag = 18 bits, Set Index = 8 bits, Block Offset = 6 bits.
''',
        shortcutTips: [
          'Direct Mapped Cache is simply a 1-way set-associative cache. Fully Associative cache has exactly 1 set (0 set index bits).',
          'Operand forwarding resolves RAW hazards without stalls when the result is available at the end of the EX stage.',
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
          'Pointer Arithmetic: If `int *p = 1000` (assuming 4-byte int), `p + 1` evaluates to 1004. `*(a + i)` is identical to `a[i]`.',
          'Array Name as Pointer: Array name decays into a pointer to its first element: `a` decays to `&a[0]`. However, `&a` is a pointer to the ENTIRE array of type `int (*)[n]`.',
          'Recursion Stack: Each recursive invocation pushes an activation record (parameters, local variables, return address) onto the stack.',
          'Static variables: Initialized only ONCE at compile time and retain their values across multiple function calls.',
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
          'Stack Applications: Expression parsing (Infix to Postfix conversion), balanced parentheses, function call stack.',
          'Queue: Circular queue using array of size N avoids wasting space: `rear = (rear + 1) % N`, `front = (front + 1) % N`.',
          'Hashing & Collisions:',
          '  • Chaining: Linked lists at each slot. Worst-case lookup O(n), average O(1 + α) where load factor α = n / m.',
          '  • Open Addressing: Linear Probing (suffers from Primary Clustering), Quadratic Probing (Secondary Clustering), Double Hashing (eliminates clustering, requires h_2(k) coprime to m).',
        ],
        coreFormulas: [
          'Load Factor: α = n / m',
          'Double Hashing probe: h(k, i) = (h_1(k) + i * h_2(k)) % m',
          'Average Search Time in Chaining: 1 + α',
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
[GATE CS/IT Benchmark Numerical]
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

Solution:
Trace calls:
Call 1: f(1): i = 1. n < 5. n = 1 + 1 = 2. i becomes 2. Calls f(2).
Call 2: f(2): i = 2. n < 5. n = 2 + 2 = 4. i becomes 3. Calls f(4).
Call 3: f(4): i = 3. n < 5. n = 4 + 3 = 7. i becomes 4. Calls f(7).
Call 4: f(7): n >= 5 is TRUE. Returns 7.
Returns bubble up: f(1) returns 7.
Output is 7.
''',
        shortcutTips: [
          'In a max-heap with n elements, the smallest element is ALWAYS located in one of the leaf nodes, which occupy indices ⌊n/2⌋ + 1 to n.',
          'Postorder traversal of a BST gives root at the very last element. Preorder gives root at the very first element.',
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
          'Tautology: Formula that evaluates to TRUE under all truth assignments (e.g. P ∨ ¬P).',
          'Contradiction: Formula that evaluates to FALSE under all truth assignments (e.g. P ∧ ¬P).',
          'Conditional Equivalence: P → Q ≡ ¬P ∨ Q. Contrapositive: P → Q ≡ ¬Q → ¬P.',
          'Quantifier Negation: ¬(∀x P(x)) ≡ ∃x ¬P(x); ¬(∃x P(x)) ≡ ∀x ¬P(x).',
          'Quantifier Distribution: ∀x (P(x) ∧ Q(x)) ≡ (∀x P(x)) ∧ (∀x Q(x)). However, ∀x does NOT distribute over ∨!',
        ],
        coreFormulas: [
          'P → Q ≡ ¬P ∨ Q',
          'Contrapositive: P → Q ≡ ¬Q → ¬P',
          '¬(∀x P(x)) ≡ ∃x ¬P(x)',
        ],
      ),
      NoteSection(
        title: 'Relations, Posets, Lattices & Combinatorics',
        summary: 'Equivalence relations, partial orders, Hasse diagrams, Pigeonhole Principle, and Generating Functions.',
        keyPoints: [
          'Equivalence Relation: Reflexive, Symmetric, and Transitive. Partitions a set into disjoint equivalence classes.',
          'Partial Order (Poset): Reflexive, Antisymmetric, and Transitive.',
          'Lattice: Poset in which every pair of elements has a unique Least Upper Bound (LUB / join) and Greatest Lower Bound (GLB / meet).',
          'Pigeonhole Principle: If n items are put into k containers with n > k, at least one container has ⌈n / k⌉ items.',
          'Inclusion-Exclusion Principle: |A ∪ B ∪ C| = |A| + |B| + |C| - |A ∩ B| - |B ∩ C| - |A ∩ C| + |A ∩ B ∩ C|.',
        ],
        coreFormulas: [
          'Pigeonhole: ⌈n / k⌉ items in at least one box',
          'Derangements: D_n = n! ∑_{i=0}^n (-1)^i / i! ≈ n! / e',
          'Generating function for 1/(1-x): ∑_{n=0}^∞ x^n',
        ],
      ),
      NoteSection(
        title: 'Graph Theory: Trees, Eulerian, Hamiltonian & Planarity',
        summary: 'Handshaking lemma, Euler formula, planar graph bounds, chromatic numbers, and bipartite graphs.',
        keyPoints: [
          'Handshaking Lemma: ∑ deg(v) = 2 |E|. The number of vertices of odd degree is ALWAYS EVEN.',
          'Bipartite Graph: Vertices can be partitioned into two independent sets. A graph is bipartite iff it contains NO ODD CYCLES. Chromatic number χ(G) ≤ 2.',
          'Euler Graph: Connected graph has an Eulerian Circuit iff EVERY vertex has an EVEN degree. Has an Eulerian Path iff exactly 0 or 2 vertices have odd degree.',
          'Planar Graphs & Euler\'s Formula: For any connected planar graph, V - E + R = 2 (where R is regions/faces including exterior).',
          'Planar Edge Bounds: For simple planar graphs with V ≥ 3: E ≤ 3V - 6. If triangle-free (no 3-cycles): E ≤ 2V - 4.',
        ],
        coreFormulas: [
          'Euler\'s Formula: V - E + R = 2',
          'Planar Bound: E ≤ 3V - 6  (for simple planar graphs)',
          'Triangle-free Planar: E ≤ 2V - 4',
          'Cayley\'s Tree Formula: n^{n-2} labeled trees on n vertices',
        ],
      ),
    ],
    proSections: [
      ProNoteSection(
        title: 'Planar Graph Proofs & Derangement Mathematics',
        inDepthTheory: '''
In GATE CS/IT, planar graph edge bounds and Euler\'s formula are tested extensively:
Proof of E ≤ 3V - 6:
Every region in a simple planar graph is bounded by at least 3 edges: 2 E ≥ 3 R ⇒ R ≤ 2E / 3.
Substitute into Euler\'s formula V - E + R = 2:
V - E + (2E / 3) ≥ 2 ⇒ V - E/3 ≥ 2 ⇒ E/3 ≤ V - 2 ⇒ E ≤ 3V - 6.
K_5 has V = 5, E = 10. Maximum planar edges = 3(5) - 6 = 9. Since 10 > 9, K_5 is non-planar!
K_{3,3} is bipartite (no odd cycles, each region bounded by ≥ 4 edges):
2E ≥ 4R ⇒ R ≤ E/2.
V - E + E/2 ≥ 2 ⇒ E ≤ 2V - 4.
For K_{3,3}: V = 6, E = 9. Maximum allowed = 2(6) - 4 = 8. Since 9 > 8, K_{3,3} is non-planar!
Kuratowski\'s Theorem: A graph is planar iff it contains no subgraph homeomorphic to K_5 or K_{3,3}.
''',
        examTraps: [
          'TRAP: Euler circuit vs Euler path. Euler circuit visits every edge once and returns to the start vertex (requires ALL even degrees). Euler path starts and ends at different vertices (requires EXACTLY 2 odd degree vertices).',
          'TRAP: Number of reflexive relations on an n-element set is 2^{n^2 - n}. Number of symmetric relations is 2^{n(n+1)/2}.',
        ],
        solvedExample: '''
[GATE CS/IT Benchmark Numerical]
A connected planar graph has 12 vertices, each of degree 3.
Calculate the number of regions (faces) in any planar drawing of this graph.

Solution:
Given: V = 12 vertices, each with degree 3.
By Handshaking Lemma:
2 * E = ∑ deg(v) = 12 * 3 = 36 ⇒ E = 18.
By Euler\'s Planar Formula:
V - E + R = 2
12 - 18 + R = 2
-6 + R = 2  ⇒  R = 8.
The graph has 8 regions.
''',
        shortcutTips: [
          'Chromatic number of a complete graph K_n is n. For an odd cycle C_n (n odd), chromatic number is 3. For an even cycle, it is 2.',
          'Number of non-isomorphic trees with 4 vertices is 2. With 5 vertices, it is 3.',
        ],
      ),
    ],
  ),
];
