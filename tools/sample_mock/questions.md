---
id: DA_MOCK_SAMPLE_01
subject: Linear Algebra
topic: Eigenvalues and Eigenvectors
type: MCQ
difficulty: Medium
correct: B
---
Let $A \in \mathbb{R}^{3 \times 3}$ be a real symmetric matrix with eigenvalues $\lambda_1 = 1$, $\lambda_2 = -2$, and $\lambda_3 = 4$.
What is the determinant of the matrix $B = A^2 + 2I$, where $I$ is the $3 \times 3$ identity matrix?

- (A) 54
- (B) 108
- (C) 216
- (D) 0

> Explanation:
> If $\lambda$ is an eigenvalue of $A$, then $\lambda^2 + 2$ is an eigenvalue of $A^2 + 2I$.
> For $\lambda_1 = 1$: $\mu_1 = 1^2 + 2 = 3$.
> For $\lambda_2 = -2$: $\mu_2 = (-2)^2 + 2 = 6$.
> For $\lambda_3 = 4$: $\mu_3 = 4^2 + 2 = 18$.
> The determinant is the product of eigenvalues:
> $\det(B) = \mu_1 \times \mu_2 \times \mu_3 = 3 \times 6 \times 18 = 108$.
> Hence, option (B) is correct.

---
id: DA_MOCK_SAMPLE_02
subject: Discrete Mathematics
topic: Graph Theory
type: MCQ
difficulty: Hard
correct: C
image: dag_sample.png
---
Consider the Directed Acyclic Graph (DAG) shown in the diagram with 6 vertices $V = \{1, 2, 3, 4, 5, 6\}$.
How many distinct topological sort orderings exist for this graph?

- (A) 2
- (B) 4
- (C) 6
- (D) 8

> Explanation:
> Using Kahn's algorithm or in-degree reduction:
> Vertex 1 has in-degree 0 and must be placed first.
> Following the parallel branch reductions between vertices 2 and 3, there are 6 distinct topological sequences.

---
id: DA_MOCK_SAMPLE_03
subject: Calculus and Optimization
topic: Extrema and KKT
type: NAT
difficulty: Medium
correct: 5
---
Minimize the function $f(x, y) = x^2 + y^2$ subject to the linear inequality constraint $x + 2y \ge 5$.
What is the minimum value of $f(x, y)$? (Answer in integer).

> Explanation:
> By Cauchy-Schwarz inequality or Karush-Kuhn-Tucker (KKT) conditions:
> The minimum distance from the origin $(0, 0)$ to the hyperplane $x + 2y = 5$ is given by:
> $d = \frac{|0 + 2(0) - 5|}{\sqrt{1^2 + 2^2}} = \frac{5}{\sqrt{5}} = \sqrt{5}$.
> The objective function is $f(x, y) = x^2 + y^2 = d^2 = (\sqrt{5})^2 = 5$.
