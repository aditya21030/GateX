import '../models/note_model.dart';

final List<SubjectNote> allSubjectNotes = [
  // 1. LINEAR ALGEBRA & MATRIX CALCULUS (DA & CS/IT)
  const SubjectNote(
    id: 'linear_algebra',
    title: 'Linear Algebra & Matrix Calculus',
    branch: 'BOTH',
    subtitle: 'Matrices, Determinants, Rank, Eigenvalues, SVD & Projections',
    iconKey: 'functions',
    freeSections: [
      NoteSection(
        title: 'Matrices, Determinants & Trace',
        summary: 'Fundamental building blocks for linear transformations and vector spaces in Data Science and Computer Science.',
        keyPoints: [
          'Trace: Sum of diagonal entries = Sum of all eigenvalues (∑ λ_i).',
          'Determinant: Volume scaling factor = Product of all eigenvalues (∏ λ_i).',
          'Det(AB) = Det(A) * Det(B), but Det(A + B) ≠ Det(A) + Det(B) in general.',
          'Det(cA) = c^n * Det(A) for an n × n matrix.',
          'A matrix is invertible (non-singular) if and only if Det(A) ≠ 0.',
          'Inverse formula: A^-1 = adj(A) / Det(A).',
        ],
        coreFormulas: [
          'tr(A) = ∑_{i=1}^n a_{ii} = ∑_{i=1}^n λ_i',
          'det(A) = ∏_{i=1}^n λ_i',
          'det(A^T) = det(A), det(A^-1) = 1 / det(A)',
          'A * adj(A) = det(A) * I_n',
        ],
      ),
      NoteSection(
        title: 'Rank & Systems of Linear Equations',
        summary: 'Characterization of vector dimensions, column space, and solvability of Ax = b.',
        keyPoints: [
          'Rank(A) = Maximum number of linearly independent row/column vectors.',
          'Rank-Nullity Theorem: For an m × n matrix A, Rank(A) + Nullity(A) = n (number of columns).',
          'Homogeneous system (Ax = 0): Always has trivial solution x = 0. Has non-trivial solutions iff Rank(A) < n (or Det(A) = 0 for square A).',
          'Non-homogeneous system (Ax = b):',
          '  • Consistent (has solution) iff Rank(A) = Rank([A|b]).',
          '  • Unique solution iff Rank(A) = Rank([A|b]) = n.',
          '  • Infinitely many solutions iff Rank(A) = Rank([A|b]) < n.',
          '  • Inconsistent (no solution) iff Rank(A) < Rank([A|b]).',
        ],
        coreFormulas: [
          'dim(Col(A)) + dim(Null(A)) = n',
          'Rank(AB) ≤ min(Rank(A), Rank(B))',
          'Rank(A + B) ≤ Rank(A) + Rank(B)',
          'Rank(A^T A) = Rank(A A^T) = Rank(A)',
        ],
      ),
      NoteSection(
        title: 'Eigenvalues & Eigenvectors',
        summary: 'Spectral analysis of linear transformations where vectors change scale but not direction.',
        keyPoints: [
          'Characteristic equation: det(A - λI) = 0.',
          'Eigenvectors corresponding to distinct eigenvalues of any matrix are linearly independent.',
          'If A has eigenvalues λ_1, λ_2, ..., then A^k has eigenvalues λ_1^k, λ_2^k, ...',
          'A^-1 has eigenvalues 1/λ_i (provided all λ_i ≠ 0).',
          'A + cI has eigenvalues λ_i + c.',
          'Symmetric matrix (A = A^T): All eigenvalues are strictly REAL, and eigenvectors for distinct eigenvalues are mutually ORTHOGONAL.',
        ],
        coreFormulas: [
          'A v = λ v  (v ≠ 0)',
          'det(A - λI) = 0',
          'λ^n - tr(A)λ^{n-1} + ... + (-1)^n det(A) = 0',
          'Cayley-Hamilton Theorem: A satisfies its own characteristic equation p(A) = O',
        ],
      ),
    ],
    proSections: [
      ProNoteSection(
        title: 'Singular Value Decomposition (SVD) & Spectral Theorem',
        inDepthTheory: '''
SVD factorizes any m × n real matrix A into:
A = U Σ V^T
Where:
• U (m × m): Orthogonal matrix whose columns are the eigenvectors of A A^T (Left singular vectors).
• Σ (m × n): Diagonal matrix with non-negative real numbers σ_1 ≥ σ_2 ≥ ... ≥ 0 on the diagonal.
• V (n × n): Orthogonal matrix whose columns are the eigenvectors of A^T A (Right singular vectors).
• Singular values: σ_i = √(λ_i(A^T A)) = √(λ_i(A A^T)).
• Number of non-zero singular values equals the exact Rank of matrix A.
• Best Low-Rank Approximation (Eckart-Young-Mirsky Theorem): Truncating SVD to top k singular values gives the optimal rank-k approximation minimizing Frobenius and Spectral norm errors. Used directly in PCA and latent semantic indexing.
''',
        examTraps: [
          'TRAP: Confusing eigenvalues with singular values. Singular values are ALWAYS non-negative real numbers (σ ≥ 0), even if matrix A has negative or complex eigenvalues.',
          'TRAP: Dimensions of U and V. Remember U is m × m (matches rows of A) and V is n × n (matches columns of A).',
          'TRAP: Defective matrices. A matrix is diagonalizable iff it has n linearly independent eigenvectors (Geometric Multiplicity = Algebraic Multiplicity for all λ). However, EVERY matrix has an SVD, even non-square and non-diagonalizable ones!',
        ],
        solvedExample: '''
[GATE Numerical Benchmark]
Question: Find the singular values of the 2 × 1 matrix A = [3, 4]^T.

Solution Step-by-Step:
1. Compute A^T A (size 1 × 1):
   A^T A = [3, 4] * [3; 4] = [3*3 + 4*4] = [25].
2. The eigenvalue of A^T A is λ_1 = 25.
3. The singular value is σ_1 = √(λ_1) = √25 = 5.
4. Since rank(A) = 1, there is only 1 non-zero singular value: σ_1 = 5, σ_2 = 0.
Answer: Singular value = 5.
''',
        shortcutTips: [
          'Shortcut: For any rank-1 matrix A = u v^T, its only non-zero singular value is σ_1 = ||u||_2 * ||v||_2.',
          'Shortcut: Cond(A) = σ_max / σ_min. An orthogonal matrix always has condition number = 1 (perfect numerical stability).',
        ],
      ),
      ProNoteSection(
        title: 'Projections & Matrix Calculus',
        inDepthTheory: '''
Orthogonal Projection onto Subspace Col(A):
• The projection matrix onto the column space of A is P = A (A^T A)^-1 A^T.
• Properties of any orthogonal projection matrix:
  1. Idempotent: P^2 = P (projecting twice gives the same result).
  2. Symmetric: P^T = P.
  3. Eigenvalues of P can ONLY be 0 or 1.
  4. Trace(P) = Rank(P) = Dimension of the subspace.

Matrix Calculus Essentials for ML:
• ∇_x (a^T x) = a
• ∇_x (x^T A x) = (A + A^T) x. If A is symmetric, ∇_x (x^T A x) = 2 A x.
• ∇_x ||A x - b||_2^2 = 2 A^T (A x - b). Setting this to zero yields Normal Equations: A^T A x = A^T b.
''',
        examTraps: [
          'TRAP: Forgetting transpose order when differentiating: ∇_x (x^T A y) = A y, but ∇_y (x^T A y) = A^T x.',
          'TRAP: Assuming (A^T A)^-1 exists. A^T A is invertible IF AND ONLY IF matrix A has full column rank (columns of A are linearly independent).',
        ],
        solvedExample: '''
[GATE Numerical Benchmark]
Question: Let P be an orthogonal projection matrix of size 4 × 4 projecting onto a 3-dimensional subspace of R^4. Find det(P) and trace(P).

Solution:
1. Since P is a projection onto a 3D subspace, rank(P) = 3.
2. Eigenvalues of a projection matrix are only 1 or 0. Since rank is 3, the eigenvalues are {1, 1, 1, 0}.
3. trace(P) = sum of eigenvalues = 1 + 1 + 1 + 0 = 3.
4. det(P) = product of eigenvalues = 1 * 1 * 1 * 0 = 0.
Answer: trace(P) = 3, det(P) = 0.
''',
        shortcutTips: [
          'Shortcut: If P projects onto subspace S, then (I - P) projects onto S^⊥ (orthogonal complement). Trace(I - P) = n - dim(S).',
        ],
      ),
    ],
  ),

  // 2. PROBABILITY & MATHEMATICAL STATISTICS (DA)
  const SubjectNote(
    id: 'probability_stats',
    title: 'Probability & Mathematical Statistics',
    branch: 'DA',
    subtitle: 'Bayes Theorem, Random Variables, Distributions, CLT & Hypothesis Testing',
    iconKey: 'query_stats',
    freeSections: [
      NoteSection(
        title: 'Probability Foundations & Bayes Theorem',
        summary: 'Probability axioms, independence, conditional probability, and posterior updating.',
        keyPoints: [
          'Axioms: P(S) = 1, 0 ≤ P(A) ≤ 1, for disjoint events P(A ∪ B) = P(A) + P(B).',
          'Conditional Probability: P(A | B) = P(A ∩ B) / P(B) where P(B) > 0.',
          'Independence: A and B are independent iff P(A ∩ B) = P(A) * P(B) (or P(A | B) = P(A)).',
          'Law of Total Probability: P(B) = ∑ P(B | A_i) * P(A_i) for a partition {A_1, ..., A_k}.',
          'Bayes Theorem: P(A_i | B) = [P(B | A_i) * P(A_i)] / ∑ [P(B | A_j) * P(A_j)].',
        ],
        coreFormulas: [
          'P(A ∪ B) = P(A) + P(B) - P(A ∩ B)',
          'P(A | B) = P(B | A) P(A) / P(B)',
          'Odds Ratio: P(A|B) / P(A^c|B) = [P(B|A)/P(B|A^c)] * [P(A)/P(A^c)]',
        ],
      ),
      NoteSection(
        title: 'Core Probability Distributions',
        summary: 'Discrete and Continuous distributions frequently tested in GATE DA with expectation and variance.',
        keyPoints: [
          'Bernoulli(p): Mean = p, Var = p(1-p).',
          'Binomial(n, p): Mean = np, Var = np(1-p). Sum of n independent Bernoulli trials.',
          'Poisson(λ): Mean = λ, Var = λ. Rate parameter λ > 0. Sum of independent Poisson is Poisson.',
          'Uniform(a, b): Mean = (a + b) / 2, Var = (b - a)² / 12.',
          'Exponential(λ): PDF f(x) = λ e^(-λx). Mean = 1/λ, Var = 1/λ². Memoryless: P(X > s+t | X > s) = P(X > t).',
          'Normal N(μ, σ²): Standard Normal Z = (X - μ) / σ ~ N(0, 1). 68-95-99.7 rule.',
        ],
        coreFormulas: [
          'E[aX + bY] = a E[X] + b E[Y] (always holds)',
          'Var(aX + bY) = a² Var(X) + b² Var(Y) + 2ab Cov(X, Y)',
          'Cov(X, Y) = E[XY] - E[X]E[Y]',
          'Correlation ρ = Cov(X, Y) / (σ_X * σ_Y), where -1 ≤ ρ ≤ 1',
        ],
      ),
    ],
    proSections: [
      ProNoteSection(
        title: 'Central Limit Theorem, Inequalities & Estimation',
        inDepthTheory: '''
Limit Theorems:
• Weak Law of Large Numbers (WLLN): Sample mean X̄_n converges in probability to true mean μ as n → ∞: lim_{n→∞} P(|X̄_n - μ| ≥ ε) = 0.
• Central Limit Theorem (CLT): Let X_1, X_2, ..., X_n be i.i.d. random variables with mean μ and variance σ² < ∞.
  Then as n → ∞, the normalized sum Z_n = (∑ X_i - nμ) / (σ √n) = (X̄_n - μ) / (σ / √n) converges in distribution to standard normal N(0, 1).

Key Concentration Inequalities:
1. Markov Inequality: For non-negative random variable X ≥ 0 and a > 0:
   P(X ≥ a) ≤ E[X] / a.
2. Chebyshev Inequality: For any random variable with mean μ and variance σ²:
   P(|X - μ| ≥ kσ) ≤ 1 / k².
3. Chernoff Bound: Gives exponentially decaying bounds for sums of independent variables:
   P(X ≥ a) ≤ min_{t > 0} e^(-t a) M_X(t).
''',
        examTraps: [
          'TRAP: Applying Markov inequality to variables that can take negative values. Markov REQUIRES X ≥ 0.',
          'TRAP: Confusing Var(X̄) with Var(X). For n i.i.d. variables: Var(X̄) = σ² / n, but Standard Error = σ / √n.',
          'TRAP: CLT applies even if the underlying distribution is non-normal (e.g. Exponential, Uniform, Poisson), as long as variance is finite!',
        ],
        solvedExample: '''
[GATE Numerical Benchmark]
Question: A coin with P(Heads) = 0.5 is tossed 100 times. Using Chebyshev inequality, find the upper bound on the probability that the number of heads differs from 50 by 10 or more.

Solution:
1. X ~ Binomial(n = 100, p = 0.5).
2. Mean μ = n * p = 100 * 0.5 = 50.
3. Variance σ² = n * p * (1 - p) = 100 * 0.5 * 0.5 = 25 => σ = 5.
4. We want P(|X - 50| ≥ 10). Notice 10 = 2 * σ (so k = 2).
5. By Chebyshev: P(|X - μ| ≥ kσ) ≤ 1 / k² = 1 / (2²) = 1 / 4 = 0.25.
Answer: Upper bound = 0.25 (or 25%).
''',
        shortcutTips: [
          'Shortcut: 68-95-99.7 Rule for Normal distribution: P(μ - σ ≤ X ≤ μ + σ) ≈ 0.6827, P(μ - 2σ ≤ X ≤ μ + 2σ) ≈ 0.9545, P(μ - 3σ ≤ X ≤ μ + 3σ) ≈ 0.9973.',
        ],
      ),
      ProNoteSection(
        title: 'Hypothesis Testing & Maximum Likelihood Estimation (MLE)',
        inDepthTheory: '''
Maximum Likelihood Estimation (MLE):
• Given i.i.d. samples x_1, ..., x_n, the likelihood is L(θ) = ∏ f(x_i; θ).
• Log-Likelihood: ln L(θ) = ∑ ln f(x_i; θ).
• Set d/dθ [ln L(θ)] = 0 and verify second derivative is negative (d²/dθ² < 0) for maximum.
• Normal distribution MLE: μ̂_MLE = (1/n) ∑ x_i (Unbiased), σ̂²_MLE = (1/n) ∑ (x_i - μ̂)² (Biased: E[σ̂²] = (n-1)/n * σ²).

Hypothesis Testing Framework:
• Null Hypothesis (H_0): Default status-quo claim.
• Alternative Hypothesis (H_1): Claim to establish.
• Type I Error (α): Rejecting H_0 when H_0 is TRUE (False Positive / Level of Significance).
• Type II Error (β): Failing to reject H_0 when H_0 is FALSE (False Negative).
• Power of Test = 1 - β = P(Reject H_0 | H_1 is True).
• p-value: Smallest level of significance α at which H_0 would be rejected. If p-value ≤ α, Reject H_0!
''',
        examTraps: [
          'TRAP: Decreasing α (Type I error) will ALWAYS increase β (Type II error) for a fixed sample size. The only way to decrease both simultaneously is to increase the sample size n.',
          'TRAP: Uniform distribution MLE: For X ~ U(0, θ), differentiating log-likelihood does not work because support depends on θ. The MLE is the sample maximum: θ̂_MLE = max(x_1, ..., x_n).',
        ],
        solvedExample: '''
[GATE Numerical Benchmark]
Question: Samples {2, 4, 6} are drawn from an exponential distribution with PDF f(x) = λ e^(-λx) for x ≥ 0. Find the Maximum Likelihood Estimate (MLE) for λ.

Solution:
1. Likelihood L(λ) = λ e^(-2λ) * λ e^(-4λ) * λ e^(-6λ) = λ³ e^(-12λ).
2. Log-likelihood: ln L(λ) = 3 ln(λ) - 12λ.
3. Differentiate w.r.t λ: d/dλ [3 ln(λ) - 12λ] = 3/λ - 12 = 0.
4. 3/λ = 12 => λ̂ = 3/12 = 1/4 = 0.25.
Answer: λ̂_MLE = 0.25.
''',
        shortcutTips: [
          'Shortcut: For Exponential distribution, MLE of rate λ is always 1 / (sample mean X̄). Here X̄ = (2+4+6)/3 = 4, so λ̂ = 1/4 = 0.25!',
        ],
      ),
    ],
  ),

  // 3. MACHINE LEARNING & MODEL EVALUATION (DA)
  const SubjectNote(
    id: 'machine_learning',
    title: 'Machine Learning & Deep Learning',
    branch: 'DA',
    subtitle: 'Linear/Logistic Regression, Trees, SVM, Neural Nets & Optimization',
    iconKey: 'psychology',
    freeSections: [
      NoteSection(
        title: 'Supervised Learning Algorithms',
        summary: 'Core classification and regression algorithms, cost functions, and decision boundaries.',
        keyPoints: [
          'Linear Regression: Closed-form Ordinary Least Squares w = (X^T X)^-1 X^T y.',
          'Ridge (L2): w = (X^T X + λI)^-1 X^T y. Shrinks weights smoothly, guarantees invertibility.',
          'Lasso (L1): Adds λ ∑|w_i|. Induces exact sparsity (automatic feature selection).',
          'Logistic Regression: Models log-odds ln(p / (1-p)) = w^T x. Sigmoid activation σ(z) = 1 / (1 + e^-z). Loss: Binary Cross-Entropy.',
          'Decision Trees: Greedy recursive splitting using Information Gain (Entropy) or Gini Impurity.',
          'Entropy H(S) = -∑ p_i log_2(p_i). Gini = 1 - ∑ p_i².',
          'Support Vector Machines (SVM): Maximizes geometric margin 2 / ||w||. Dual problem depends only on dot products x_i · x_j.',
        ],
        coreFormulas: [
          'BCE Loss: L = -[y ln(ŷ) + (1-y) ln(1-ŷ)]',
          'Sigmoid: σ(z) = 1 / (1 + e^{-z}),  σ\'(z) = σ(z)(1 - σ(z))',
          'Softmax: P(y=k|x) = e^{z_k} / ∑_j e^{z_j}',
          'Information Gain: IG(S, A) = H(S) - ∑ (|S_v| / |S|) H(S_v)',
        ],
      ),
      NoteSection(
        title: 'Evaluation Metrics & Unsupervised Learning',
        summary: 'Confusion matrix, precision-recall tradeoff, clustering, and dimensionality reduction.',
        keyPoints: [
          'Precision = TP / (TP + FP) [Minimizes False Positives, e.g. Spam detection].',
          'Recall = TP / (TP + FN) [Minimizes False Negatives, e.g. Cancer detection].',
          'F1-Score = 2 * (Precision * Recall) / (Precision + Recall) [Harmonic mean].',
          'ROC-AUC: True Positive Rate (Recall) vs False Positive Rate (FP / (FP + TN)). AUC = 1 is perfect, AUC = 0.5 is random.',
          'k-Means: Iterative EM algorithm minimizing Within-Cluster Sum of Squares (Inertia). Sensitive to outliers and initialization (solved by k-Means++).',
          'PCA: Projects data onto directions of maximum variance (eigenvectors of sample covariance matrix X^T X).',
        ],
        coreFormulas: [
          'Accuracy = (TP + TN) / (TP + TN + FP + FN)',
          'F_β = (1 + β²) (Prec * Rec) / (β² Prec + Rec)',
          'Covariance Matrix: C = (1/n) X^T X (assuming zero-centered data)',
        ],
      ),
    ],
    proSections: [
      ProNoteSection(
        title: 'Deep Learning Architectures & Optimization',
        inDepthTheory: '''
Neural Network Foundations:
• Multi-Layer Perceptron (MLP): Forward pass z^[l] = W^[l] a^[l-1] + b^[l], a^[l] = g(z^[l]).
• Universal Approximation Theorem: A feedforward network with a single hidden layer and non-linear activation can approximate any continuous function.
• Backpropagation: Application of chain rule to compute gradients:
  δ^[L] = ∇_{a^[L]} L ⊙ g'(z^[L]).
  ∂L/∂W^[l] = δ^[l] (a^[l-1])^T.
  δ^[l-1] = (W^[l])^T δ^[l] ⊙ g'(z^[l-1]).

Activations & Gradients:
• Sigmoid: Range (0, 1). Maximum derivative = 0.25 (causes vanishing gradient in deep nets).
• Tanh: Range (-1, 1). Maximum derivative = 1.0 (zero-centered, better than sigmoid).
• ReLU: max(0, z). Derivative = 1 for z > 0, 0 for z < 0. No vanishing gradient for positive values; prone to Dying ReLU.
• Leaky ReLU: max(αz, z) with α ≈ 0.01. Avoids dead neurons.

Modern Optimizers:
• Momentum: v_t = β v_{t-1} + (1-β) ∇L_t, w_t = w_{t-1} - η v_t. Accelerates through ravines.
• RMSprop: Maintains exponential moving average of squared gradients to adapt per-parameter learning rate.
• Adam (Adaptive Moment Estimation): Combines Momentum (first moment) and RMSprop (second moment) with bias correction terms.
''',
        examTraps: [
          'TRAP: Initializing all weights to zero in neural networks. Causes symmetry problem where all hidden units learn identical features. Biases can be zero, but weights MUST be broken with random initialization (e.g. He or Xavier initialization).',
          'TRAP: PCA requires feature scaling! If one feature has variance 1000 and another has variance 1, PCA will align almost entirely with the first feature regardless of information content.',
        ],
        solvedExample: '''
[GATE Numerical Benchmark]
Question: In a binary classification problem, a model predicts 80 True Positives, 20 False Positives, 10 False Negatives, and 890 True Negatives. Calculate Precision, Recall, and F1-score.

Solution:
1. Precision = TP / (TP + FP) = 80 / (80 + 20) = 80 / 100 = 0.80.
2. Recall = TP / (TP + FN) = 80 / (80 + 10) = 80 / 90 = 8/9 ≈ 0.8889.
3. F1-score = 2 * (Prec * Rec) / (Prec + Rec)
   = 2 * (0.80 * 0.8889) / (0.80 + 0.8889)
   = 1.4222 / 1.6889 ≈ 0.8421.
Answer: Precision = 0.80, Recall = 0.89, F1-Score = 0.84.
''',
        shortcutTips: [
          'Shortcut: Harmonic mean formula shortcut for F1: F1 = 2 / ((1/Prec) + (1/Rec)).',
        ],
      ),
    ],
  ),

  // 4. DATABASE MANAGEMENT SYSTEMS & SQL (DA & CS/IT)
  const SubjectNote(
    id: 'dbms_sql',
    title: 'Database Management Systems & SQL',
    branch: 'BOTH',
    subtitle: 'Relational Algebra, SQL, Normalization (1NF-BCNF), Indexing & Transactions',
    iconKey: 'storage',
    freeSections: [
      NoteSection(
        title: 'Relational Algebra & SQL Foundations',
        summary: 'Core relational operators and SQL construct execution orders.',
        keyPoints: [
          'Relational Algebra Operators: Selection (σ), Projection (π), Union (∪), Set Difference (-), Cartesian Product (×), Natural Join (⨝).',
          'SQL Query Evaluation Order:',
          '  1. FROM & JOIN',
          '  2. WHERE (Row filter)',
          '  3. GROUP BY (Aggregation grouping)',
          '  4. HAVING (Aggregate filter)',
          '  5. SELECT (Expressions/Projections)',
          '  6. DISTINCT',
          '  7. ORDER BY',
          '  8. LIMIT / OFFSET',
          'Aggregate functions (COUNT, SUM, AVG, MAX, MIN) ignore NULL values, except COUNT(*).',
          'WHERE cannot contain aggregate functions; HAVING is used for aggregates after GROUP BY.',
        ],
        coreFormulas: [
          'R ⨝ S = π_{all} (σ_{R.A = S.A} (R × S))',
          'Max tuples in R ⨝ S = |R| * |S| (when all join keys match)',
          'Min tuples in R ⨝ S = 0 (when no join keys match)',
        ],
      ),
      NoteSection(
        title: 'Functional Dependencies & Normalization',
        summary: 'Systematic schema refinement to eliminate insertion, deletion, and update anomalies.',
        keyPoints: [
          'Candidate Key: Minimal superkey with no redundant attributes (K^+ = All attributes).',
          '1NF: All attribute values must be atomic (no multi-valued or composite attributes).',
          '2NF: In 1NF and NO partial dependency (no proper subset of candidate key determines non-prime attribute).',
          '3NF: In 2NF and NO transitive dependency. For every X → Y: X is a Superkey OR Y is a Prime attribute.',
          'BCNF (Boyce-Codd): For every non-trivial X → Y, X MUST be a Superkey.',
          'Lossless Join Decomposition: R_1 ∩ R_2 must determine R_1 or R_2 (i.e. R_1 ∩ R_2 → R_1 or R_1 ∩ R_2 → R_2). Always achievable in BCNF and 3NF.',
          'Dependency Preservation: Can always be preserved in 3NF, but NOT always in BCNF.',
        ],
        coreFormulas: [
          'Armstrong Axioms: Reflexivity, Augmentation, Transitivity',
          'Decomposition R into R1, R2 is lossless iff (R1 ∩ R2) → R1 or (R1 ∩ R2) → R2',
        ],
      ),
    ],
    proSections: [
      ProNoteSection(
        title: 'Transactions, Serializability & B+ Tree Indexing',
        inDepthTheory: '''
ACID Properties:
• Atomicity: All or nothing (managed by Recovery Manager using Write-Ahead Logging / WAL).
• Consistency: Preserves database integrity constraints.
• Isolation: Concurrency control (managed by Lock / Timestamp / Validation schedulers).
• Durability: Committed updates persist even after system crash (WAL redo logs).

Serializability & Precedence Graph:
• Two operations conflict if: they belong to different transactions, access the same data item, and at least one is a WRITE.
• Conflict Serializability: A schedule S is conflict serializable iff its Precedence (Serialization) Graph has NO CYCLES.
• Precedence Graph: Node per transaction. Directed edge T_i → T_j if T_i performs an operation that conflicts with a later operation of T_j.

B+ Tree Indexing Equations:
• Node structure: P_1, K_1, P_2, K_2, ..., K_{p-1}, P_p (p pointers, p-1 keys).
• Internal node order p: p * (Pointer Size) + (p - 1) * (Key Size) ≤ Block Size (B).
• Leaf node order p_leaf: p_leaf * (Record Pointer + Key Size) + Block Pointer ≤ Block Size (B).
• Minimum keys in internal node: ⌈p / 2⌉ - 1. Root can have minimum 1 key (2 children).
''',
        examTraps: [
          'TRAP: Conflict serializable vs View serializable. Every Conflict serializable schedule is View serializable, but View serializability is NP-complete and allows blind writes.',
          'TRAP: Recoverability vs Cascadelessness: Strict ⊂ Cascadeless ⊂ Recoverable. A schedule is recoverable if every transaction commits only AFTER all transactions it read from have committed.',
        ],
        solvedExample: '''
[GATE Numerical Benchmark]
Question: Consider a disk with block size B = 512 bytes. A B+ tree has search key size = 9 bytes and block pointer size = 7 bytes. Calculate the maximum order p of the internal node.

Solution:
1. For an internal node of order p, there are p block pointers and (p - 1) search keys.
2. Inequality: p * (Block Pointer) + (p - 1) * (Key Size) ≤ B.
3. p * 7 + (p - 1) * 9 ≤ 512.
4. 7p + 9p - 9 ≤ 512 => 16p ≤ 521.
5. p ≤ 521 / 16 = 32.56.
6. Since order must be an integer, maximum p = 32.
Answer: Order p = 32.
''',
        shortcutTips: [
          'Shortcut: 2PL (Two-Phase Locking) guarantees Conflict Serializability, but can suffer from DEADLOCKS. Strict 2PL prevents Cascading Aborts!',
        ],
      ),
    ],
  ),

  // 5. DATA STRUCTURES & ALGORITHMS (BOTH)
  const SubjectNote(
    id: 'dsa_algorithms',
    title: 'Data Structures & Algorithms',
    branch: 'BOTH',
    subtitle: 'Asymptotics, Master Theorem, Trees, Graphs, Greedy & Dynamic Programming',
    iconKey: 'terminal',
    freeSections: [
      NoteSection(
        title: 'Asymptotic Analysis & Master Theorem',
        summary: 'Big-O notation, recurrence relations, and algorithmic complexity classes.',
        keyPoints: [
          'Asymptotic definitions: f(n) = O(g(n)) [Upper bound], Ω(g(n)) [Lower bound], Θ(g(n)) [Tight bound].',
          'Master Theorem for T(n) = a T(n/b) + f(n) where a ≥ 1, b > 1:',
          '  • Case 1: If f(n) = O(n^{log_b(a) - ε}) => T(n) = Θ(n^{log_b(a)}).',
          '  • Case 2: If f(n) = Θ(n^{log_b(a)} * log^k(n)) => T(n) = Θ(n^{log_b(a)} * log^{k+1}(n)).',
          '  • Case 3: If f(n) = Ω(n^{log_b(a) + ε}) and regularity condition holds => T(n) = Θ(f(n)).',
        ],
        coreFormulas: [
          'Binary Search: T(n) = T(n/2) + O(1) => O(log n)',
          'Merge Sort: T(n) = 2T(n/2) + O(n) => O(n log n)',
          'Strassen Matrix Mult: T(n) = 7T(n/2) + O(n²) => O(n^{log_2(7)}) ≈ O(n^{2.81})',
        ],
      ),
      NoteSection(
        title: 'Core Data Structures',
        summary: 'Array, Stack, Queue, Hash Table, Binary Search Tree, and Heap operational complexities.',
        keyPoints: [
          'Stack: LIFO. Applications: Infix to Postfix conversion, Parenthesis matching, Function call stack.',
          'Queue: FIFO. Applications: BFS traversal, CPU process scheduling, Buffering.',
          'Heap (Priority Queue): Complete binary tree. Insert: O(log n), Extract-Min/Max: O(log n), Build-Heap: O(n).',
          'Binary Search Tree (BST): Search/Insert/Delete is O(h). Balanced BST (AVL, Red-Black) guarantees h = O(log n).',
          'Hashing: Average O(1) search/insert. Collision resolution: Chaining vs Open Addressing (Linear, Quadratic, Double Hashing).',
        ],
        coreFormulas: [
          'Height of complete binary tree with n nodes: h = ⌊log_2(n)⌋',
          'Nodes in full binary tree of height h: 2^{h+1} - 1',
          'Number of unlabelled binary trees with n nodes: Catalan number C_n = (2n)! / ((n+1)! * n!)',
        ],
      ),
    ],
    proSections: [
      ProNoteSection(
        title: 'Graph Algorithms & Dynamic Programming',
        inDepthTheory: '''
Graph Traversals:
• BFS: Uses Queue. Finds shortest path in unweighted graphs. Time: O(V + E).
• DFS: Uses Stack / Recursion. Finds connected components, topological sort (DAG), articulation points. Time: O(V + E).

Shortest Path Algorithms:
• Dijkstra: Greedy algorithm for single-source shortest path with NON-NEGATIVE edge weights. Time: O((V + E) log V) with Min-Heap.
• Bellman-Ford: Dynamic programming. Handles negative edge weights and detects negative weight cycles. Time: O(V * E).
• Floyd-Warshall: All-pairs shortest path. Dynamic programming: d_{ij}^{(k)} = min(d_{ij}^{(k-1)}, d_{ik}^{(k-1)} + d_{kj}^{(k-1)}). Time: O(V³).

Minimum Spanning Tree (MST):
• Kruskal: Greedy, sorts edges, uses Disjoint Set Union (Union-Find with path compression). Time: O(E log E).
• Prim: Greedy, grows tree from start vertex using Priority Queue. Time: O((V + E) log V).

Dynamic Programming Paradigm:
• Requires: Optimal Substructure and Overlapping Subproblems.
• 0/1 Knapsack: DP[i, w] = max(DP[i-1, w], DP[i-1, w - w_i] + v_i). Time: O(n * W) (Pseudo-polynomial).
• Longest Common Subsequence (LCS): Time O(m * n).
''',
        examTraps: [
          'TRAP: Dijkstra fails with negative edge weights even if there are no negative cycles! Always use Bellman-Ford for graphs with negative weights.',
          'TRAP: Master Theorem cannot be used when b is not a constant (e.g. T(n) = 2T(√n) + 1). Use substitution / variable change (m = log n) instead.',
        ],
        solvedExample: '''
[GATE Numerical Benchmark]
Question: Solve the recurrence relation T(n) = 2 T(n/2) + n log n using Master Theorem extension.

Solution:
1. In T(n) = a T(n/b) + f(n): a = 2, b = 2, f(n) = n log n.
2. Compute n^{log_b(a)} = n^{log_2(2)} = n^1 = n.
3. Compare f(n) with n^{log_b(a)}:
   f(n) = n log^k(n) where k = 1.
4. By Master Theorem Case 2 Extension:
   If f(n) = Θ(n^{log_b(a)} * log^k(n)), then T(n) = Θ(n^{log_b(a)} * log^{k+1}(n)).
5. Here k = 1 => T(n) = Θ(n * log^{1+1}(n)) = Θ(n log² n).
Answer: T(n) = Θ(n log² n).
''',
        shortcutTips: [
          'Shortcut: Sum of degrees of all vertices in any undirected graph is ALWAYS equal to 2 * |E| (Handshaking Lemma). Number of odd-degree vertices must be EVEN.',
        ],
      ),
    ],
  ),

  // 6. OPERATING SYSTEMS (CS/IT)
  const SubjectNote(
    id: 'operating_systems',
    title: 'Operating Systems',
    branch: 'CSIT',
    subtitle: 'Processes, CPU Scheduling, Synchronization, Deadlocks & Virtual Memory',
    iconKey: 'computer',
    freeSections: [
      NoteSection(
        title: 'Processes, Threads & CPU Scheduling',
        summary: 'Process state lifecycle, PCB, context switching, and scheduling criteria.',
        keyPoints: [
          'Process State Model: New → Ready → Running → Waiting/Blocked → Terminated.',
          'Preemptive Scheduling: CPU can be taken away (SRTF, Round Robin, Priority Preemptive).',
          'Non-preemptive Scheduling: Process holds CPU until voluntary yield (FCFS, SJF Non-preemptive).',
          'Convoy Effect: Shorter processes get delayed behind a long process (common in FCFS).',
          'Turnaround Time (TAT) = Completion Time - Arrival Time.',
          'Waiting Time (WT) = Turnaround Time - Burst Time.',
        ],
        coreFormulas: [
          'TAT = CT - AT',
          'WT = TAT - BT',
          'Throughput = Number of completed processes / Total time',
        ],
      ),
      NoteSection(
        title: 'Synchronization & Deadlocks',
        summary: 'Race conditions, critical sections, semaphores, and Coffman deadlock conditions.',
        keyPoints: [
          'Critical Section 3 Requirements: Mutual Exclusion, Progress, Bounded Waiting.',
          'Semaphores: Integer variable with atomic wait() (P) and signal() (V) operations.',
          'Counting Semaphore: Value can be any integer. If negative, |S| indicates number of blocked processes.',
          '4 Coffman Conditions for Deadlock: Mutual Exclusion, Hold and Wait, No Preemption, Circular Wait.',
          'Deadlock Avoidance: Banker\'s Algorithm (requires advance knowledge of maximum resource demands).',
        ],
        coreFormulas: [
          'Need Matrix = Max Demand - Current Allocation',
          'Banker\'s Safety condition: Need ≤ Available',
        ],
      ),
    ],
    proSections: [
      ProNoteSection(
        title: 'Virtual Memory, Paging & Effective Memory Access Time',
        inDepthTheory: '''
Memory Management & Paging:
• Logical address divided into: Page Number (p) + Offset (d).
• Physical address divided into: Frame Number (f) + Offset (d).
• Translation Lookaside Buffer (TLB): High-speed hardware cache for page table entries.
• Effective Memory Access Time (EMAT):
  With single-level page table:
  EMAT = h * (t_TLB + t_mem) + (1 - h) * (t_TLB + 2 * t_mem).
  With two-level page table:
  EMAT = h * (t_TLB + t_mem) + (1 - h) * (t_TLB + 3 * t_mem).

Page Replacement Algorithms:
• FIFO: Replaces oldest loaded page. Suffers from Belady\'s Anomaly (increasing frames can increase page faults).
• Optimal (OPT): Replaces page that will not be used for longest time in future. Benchmark with minimum faults.
• LRU (Least Recently Used): Replaces page not used for longest time in past. Stack-based algorithm (Belady anomaly immune).
''',
        examTraps: [
          'TRAP: Forgetting page fault penalty in EMAT when page is not in main memory: EMAT = (1-p)*t_mem + p*(Page Fault Service Time).',
          'TRAP: Inverted page table has 1 entry per physical frame, NOT per logical page.',
        ],
        solvedExample: '''
[GATE Numerical Benchmark]
Question: A system has a TLB access time of 20 ns and main memory access time of 100 ns. The TLB hit ratio is 90%. What is the Effective Memory Access Time (EMAT) assuming a single-level page table?

Solution:
1. Hit ratio h = 0.90, Miss ratio = 0.10.
2. If TLB hits: Access TLB (20ns) + Access physical memory (100ns) = 120 ns.
3. If TLB misses: Access TLB (20ns) + Access page table in memory (100ns) + Access physical memory (100ns) = 220 ns.
4. EMAT = h * 120 + (1 - h) * 220
   = 0.90 * 120 + 0.10 * 220
   = 108 + 22 = 130 ns.
Answer: EMAT = 130 ns.
''',
        shortcutTips: [
          'Shortcut: EMAT = t_TLB + t_mem + (1 - h) * t_mem. Here: 20 + 100 + (0.10 * 100) = 130 ns (much faster calculation!).',
        ],
      ),
    ],
  ),

  // 7. COMPUTER NETWORKS (CS/IT)
  const SubjectNote(
    id: 'computer_networks',
    title: 'Computer Networks',
    branch: 'CSIT',
    subtitle: 'OSI/TCP Reference, Flow Control, IP Addressing, Routing & Transport Protocols',
    iconKey: 'hub',
    freeSections: [
      NoteSection(
        title: 'Data Link Layer & Flow Control',
        summary: 'Framing, error detection (CRC), and sliding window protocols.',
        keyPoints: [
          'Propagation Delay: T_p = Distance / Speed. Transmission Delay: T_t = Packet Length (L) / Bandwidth (B).',
          'Stop-and-Wait: Efficiency η = 1 / (1 + 2a) where a = T_p / T_t.',
          'Go-Back-N (GBN): Window size N. Sender window = N, Receiver window = 1. Efficiency η = N / (1 + 2a). Minimum sequence bits = ⌈log_2(N + 1)⌉.',
          'Selective Repeat (SR): Sender window = N, Receiver window = N. Efficiency η = N / (1 + 2a). Minimum sequence bits = ⌈log_2(2N)⌉.',
          'Cyclic Redundancy Check (CRC): Divisor of k bits appends (k - 1) zeros before modulo-2 division.',
        ],
        coreFormulas: [
          'a = T_p / T_t = (Distance / Speed) / (Length / Bandwidth)',
          'Stop & Wait Efficiency: η = 1 / (1 + 2a)',
          'Throughput = Efficiency * Bandwidth',
        ],
      ),
      NoteSection(
        title: 'Network Layer & IP Addressing',
        summary: 'IPv4, CIDR, Subnetting, ARP, and routing algorithms.',
        keyPoints: [
          'IPv4: 32 bits. Subnet mask defines network bits and host bits.',
          'CIDR notation: /n implies n network bits, (32 - n) host bits.',
          'Number of usable hosts per subnet = 2^{32 - n} - 2 (subtracting Network Address and Directed Broadcast Address).',
          'Distance Vector Routing (RIP): Uses Bellman-Ford algorithm. Suffers from Count-to-Infinity problem (solved by Split Horizon & Poison Reverse).',
          'Link State Routing (OSPF): Uses Dijkstra algorithm. Each router floods link states to all nodes.',
        ],
        coreFormulas: [
          'Usable Hosts = 2^{Host Bits} - 2',
          'Subnets created by borrowing k bits = 2^k',
        ],
      ),
    ],
    proSections: [
      ProNoteSection(
        title: 'Transport Layer (TCP/UDP) & Congestion Control',
        inDepthTheory: '''
TCP Connection & Congestion Control:
• 3-Way Handshake: SYN → SYN-ACK → ACK.
• Connection Termination: 4-way FIN exchange. TIME_WAIT state lasts 2 * MSL (Maximum Segment Lifetime).
• Congestion Control Phases:
  1. Slow Start: Congestion Window (cwnd) starts at 1 MSS and DOUBLES every RTT (exponential growth: 1, 2, 4, 8, ...) until it reaches ssthresh (slow start threshold).
  2. Congestion Avoidance: Once cwnd ≥ ssthresh, cwnd increases linearly by 1 MSS every RTT (Additive Increase).
  3. Loss Detection:
     • Time-out: Severe congestion. ssthresh = cwnd / 2, cwnd resets to 1 MSS (in TCP Tahoe).
     • 3 Duplicate ACKs: Mild congestion. In TCP Reno (Fast Recovery): ssthresh = cwnd / 2, cwnd drops to ssthresh (Multiplicative Decrease).
''',
        examTraps: [
          'TRAP: In Go-Back-N, receiver discards any out-of-order packet (receiver window is always 1). In Selective Repeat, out-of-order packets within window are buffered.',
          'TRAP: Calculating total time to send n packets in Stop-and-Wait: Total time = n * (T_t + 2*T_p), assuming acknowledgement transmission time is negligible.',
        ],
        solvedExample: '''
[GATE Numerical Benchmark]
Question: A link has bandwidth B = 100 Mbps and distance = 2000 km. Speed of signal = 2 × 10^8 m/s. Packet size = 1000 bytes. Calculate the parameter 'a' and Stop-and-Wait efficiency.

Solution:
1. T_p = Distance / Speed = (2000 × 10³ m) / (2 × 10^8 m/s) = 10^-2 s = 10 ms.
2. T_t = Length / Bandwidth = (1000 × 8 bits) / (100 × 10^6 bps) = 8000 / 10^8 = 0.08 ms.
3. a = T_p / T_t = 10 ms / 0.08 ms = 125.
4. Stop-and-Wait Efficiency η = 1 / (1 + 2a) = 1 / (1 + 2 * 125) = 1 / 251 ≈ 0.00398 = 0.40%.
Answer: a = 125, Efficiency = 0.40%.
''',
        shortcutTips: [
          'Shortcut: Optimal window size for 100% efficiency in sliding window protocol is N ≥ 1 + 2a.',
        ],
      ),
    ],
  ),
];
