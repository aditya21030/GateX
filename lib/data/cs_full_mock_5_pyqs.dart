// AUTO-GENERATED GATE CS MOCK 5 QUESTIONS (ULTRA-TOUGH FACULTY LEVEL)
import '../models/models.dart';

final List<PYQ> csFullMock5Questions = [
  PYQ(
    id: 'CS_MOCK5_Q01',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Verbal Ability''',
    questionText: '''Choose the grammatically correct and most appropriate sentence that adheres to formal English subjunctive mood usage:''',
    options: ['''If the system architect was to reconsider the partition scheme, overall latency would be drastically reduced.''', '''If the system architect were to reconsider the partition scheme, overall latency would be drastically reduced.''', '''If the system architect is to reconsider the partition scheme, overall latency will have been drastically reduced.''', '''If the system architect had reconsidered the partition scheme, overall latency would be drastically reduced.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Grammatical Analysis of the Subjunctive Mood:
1. In formal standard English, hypothetical, counterfactual, or conditional situations involving "if" clauses require the subjunctive form "were" rather than "was", regardless of whether the subject is singular or plural.
2. The subject "the system architect" is third-person singular, but in a hypothetical conditional ("were to reconsider"), "were" is mandatory in formal writing.
3. In option (A), "was" is informal and grammatically incorrect in the hypothetical subjunctive.
4. Option (C) incorrectly mixes tense forms ("is to reconsider" with "will have been drastically reduced").
5. Option (D) incorrectly pairs past perfect ("had reconsidered") with conditional present ("would be") instead of conditional perfect ("would have been").
6. Therefore, option (B) is the strictly correct grammatical construction.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q02',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Critical Reasoning''',
    questionText: '''Consider the following policy argument:

"To eliminate database performance bottlenecks during flash-sale events, the engineering team has decided to migrate all transactional data to in-memory key-value stores. Because in-memory data lookups exhibit sub-millisecond retrieval latency, the flash-sale event will proceed without any performance degradation."

Which of the following is an unstated assumption required for the argument's conclusion to hold logically?''',
    options: ['''In-memory key-value stores are cheaper to deploy than traditional relational database clusters.''', '''Sub-millisecond retrieval latency is the only factor determining the absence of performance degradation during flash sales.''', '''Relational database indexes cannot be cached in memory.''', '''All database queries executed during the flash sale are complex relational join operations.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Critical Reasoning - Assumption Analysis:
1. The premise states: In-memory lookups have sub-millisecond retrieval latency.
2. The conclusion asserts: The event will proceed without any performance degradation.
3. For the premise to guarantee the conclusion, retrieval latency must be the sole bottleneck. If other bottlenecks exist (such as write serialization, network I/O saturation, connection pooling limits, or memory eviction stalls), performance degradation could still occur despite fast lookups.
4. Therefore, the argument fundamentally assumes that sub-millisecond retrieval latency alone guarantees the absence of performance degradation.
5. Option (B) captures this necessary assumption.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q03',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude''',
    questionText: '''What is the sum of all integers between 100 and 500 (inclusive) that are divisible by 7 but NOT divisible by 3?''',
    options: ['''11571''', '''12103''', '''13923''', '''17157'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Number Theory & Arithmetic Progression Calculation:
1. Integers between 100 and 500 divisible by 7:
   - First integer \$\\ge 100\$ divisible by 7: \$\\lceil 100/7 \\rceil = 15 \\implies 15 \\times 7 = 105\$.
   - Last integer \$\\le 500\$ divisible by 7: \$\\lfloor 500/7 \\rfloor = 71 \\implies 71 \\times 7 = 497\$.
   - Number of terms \$n_1 = 71 - 15 + 1 = 57\$.
   - Sum \$S_1 = \\frac{n_1}{2} (a + l) = \\frac{57}{2} (105 + 497) = \\frac{57}{2} \\times 602 = 57 \\times 301 = 17157\$.

2. Integers between 100 and 500 divisible by both 7 and 3 (i.e., divisible by \$\\text{lcm}(7, 3) = 21\$):
   - First integer \$\\ge 100\$ divisible by 21: \$\\lceil 100/21 \\rceil = 5 \\implies 5 \\times 21 = 105\$.
   - Last integer \$\\le 500\$ divisible by 21: \$\\lfloor 500/21 \\rfloor = 23 \\implies 23 \\times 21 = 483\$.
   - Number of terms \$n_2 = 23 - 5 + 1 = 19\$.
   - Sum \$S_2 = \\frac{n_2}{2} (a + l) = \\frac{19}{2} (105 + 483) = \\frac{19}{2} \\times 588 = 19 \\times 294 = 5586\$.

3. Required sum (divisible by 7 but not by 3):
   \$\$S = S_1 - S_2 = 17157 - 5586 = 11571\$\$
4. Hence, option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q04',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Spatial Aptitude''',
    questionText: '''A point \$P\$ in a Cartesian 2D plane with coordinates \$(3, -4)\$ is first reflected across the line \$y = x\$, and then the resulting point is rotated \$90^\\circ\$ clockwise about the origin. What are the coordinates of the final point?''',
    options: ['''\$(3, 4)\$''', '''\$(4, -3)\$''', '''\$(-3, -4)\$''', '''\$(-4, -3)\$'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Geometric Transformation Trace:
1. Initial coordinates: \$P = (3, -4)\$.
2. Reflection across the line \$y = x\$:
   \$\$(x, y) \\mapsto (y, x) \\implies P' = (-4, 3)\$\$
3. Clockwise rotation by \$90^\\circ\$ about the origin:
   - In 2D plane, a \$90^\\circ\$ clockwise rotation maps \$(x', y') \\mapsto (y', -x')\$.
   - With \$x' = -4\$ and \$y' = 3\$:
     \$\$x'' = y' = 3, \\quad y'' = -(-4) = 4\$\$
   - Resulting point is \$(3, 4)\$.
4. Hence, option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q05',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude''',
    questionText: '''Two containers \$A\$ and \$B\$ contain mixtures of acid and water. In container \$A\$, the ratio of acid to water is \$4 : 1\$, while in container \$B\$, the ratio of acid to water is \$2 : 3\$. In what ratio by volume should liquids from containers \$A\$ and \$B\$ be combined to obtain a mixture containing acid and water in the ratio \$1 : 1\$?''',
    options: ['''1 : 3''', '''3 : 5''', '''2 : 3''', '''1 : 2'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Alligation & Ratio Method:
1. Express the concentration of acid as a fraction of the total volume:
   - In container \$A\$: Acid fraction \$c_A = \\frac{4}{4 + 1} = \\frac{4}{5} = 0.80\$.
   - In container \$B\$: Acid fraction \$c_B = \\frac{2}{2 + 3} = \\frac{2}{5} = 0.40\$.
   - Desired mixture: Acid to water ratio \$1 : 1 \\implies\$ Acid fraction \$c_M = \\frac{1}{1 + 1} = \\frac{1}{2} = 0.50\$.
2. Applying the rule of alligation:
   \$\$\\frac{V_A}{V_B} = \\frac{c_M - c_B}{c_A - c_M} = \\frac{0.50 - 0.40}{0.80 - 0.50} = \\frac{0.10}{0.30} = \\frac{1}{3}\$\$
3. Thus, liquids from containers \$A\$ and \$B\$ must be mixed in the ratio \$1 : 3\$.
4. Option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q06',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude''',
    questionText: '''Working alone, machine \$A\$ can complete a data-processing job in 12 hours, while machine \$B\$ can complete the same job in 18 hours. Machine \$C\$ is a purge mechanism that, working alone, can delete an entire processed job in 36 hours. If machines \$A\$ and \$B\$ are turned on together to process the job while machine \$C\$ is accidentally left running continuously, how many hours will it take to finish the job completely?''',
    options: ['''6.0 hours''', '''7.2 hours''', '''9.0 hours''', '''10.5 hours'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Work and Rates Calculation:
1. Work done per hour by each machine:
   - Rate of \$A\$: \$R_A = +\\frac{1}{12}\\text{ job/hr}\$.
   - Rate of \$B\$: \$R_B = +\\frac{1}{18}\\text{ job/hr}\$.
   - Rate of \$C\$: \$R_C = -\\frac{1}{36}\\text{ job/hr}\$ (negative rate since it purges).
2. Combined net rate:
   \$\$R_{\\text{net}} = R_A + R_B - R_C = \\frac{1}{12} + \\frac{1}{18} - \\frac{1}{36}\$\$
   Find common denominator of 12, 18, 36, which is 36:
   \$\$R_{\\text{net}} = \\frac{3}{36} + \\frac{2}{36} - \\frac{1}{36} = \\frac{3 + 2 - 1}{36} = \\frac{4}{36} = \\frac{1}{9}\\text{ job/hr}\$\$
3. Total time to complete the job:
   \$\$T = \\frac{1}{R_{\\text{net}}} = 9\\text{ hours}\$\$
4. Hence, option (C) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q07',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Data Interpretation''',
    questionText: '''In a cohort of 200 software developers, competencies in three programming languages—Rust, Go, and Python—were surveyed:
- 110 developers know Python
- 80 developers know Go
- 70 developers know Rust
- 40 know both Python and Go
- 35 know both Python and Rust
- 30 know both Go and Rust
- 15 know all three languages

How many developers know EXACTLY ONE of these three languages?''',
    options: ['''85''', '''95''', '''105''', '''115'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Venn Diagram and Principle of Inclusion-Exclusion:
1. Given:
   - \$|P| = 110, \\, |G| = 80, \\, |R| = 70\$
   - \$|P \\cap G| = 40, \\, |P \\cap R| = 35, \\, |G \\cap R| = 30\$
   - \$|P \\cap G \\cap R| = 15\$

2. Calculate numbers knowing exactly two languages:
   - Only Python and Go: \$|P \\cap G| - |P \\cap G \\cap R| = 40 - 15 = 25\$
   - Only Python and Rust: \$|P \\cap R| - |P \\cap G \\cap R| = 35 - 15 = 20\$
   - Only Go and Rust: \$|G \\cap R| - |P \\cap G \\cap R| = 30 - 15 = 15\$

3. Calculate numbers knowing exactly one language:
   - Only Python:
     \$\$110 - (25 + 20 + 15) = 110 - 60 = 50\$\$
   - Only Go:
     \$\$80 - (25 + 15 + 15) = 80 - 55 = 25\$\$
   - Only Rust:
     \$\$70 - (20 + 15 + 15) = 70 - 50 = 30\$\$

4. Total developers knowing exactly one language:
   \$\$\\text{Total} = 50 + 25 + 30 = 105\$\$
5. Hence, option (C) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q08',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Logical Reasoning''',
    questionText: '''Six microservices—Auth (\$A\$), Billing (\$B\$), Cart (\$C\$), Delivery (\$D\$), Email (\$E\$), and Feed (\$F\$)—are deployed linearly on servers numbered 1 through 6 from left to right. The deployment constraints are:
1. \$B\$ is deployed on a higher-numbered server than \$A\$ (to the right of \$A\$).
2. \$C\$ and \$D\$ must be on adjacent servers.
3. \$E\$ must be on server 1.
4. \$F\$ cannot be on server 6.
5. Exactly two servers separate \$A\$ and \$B\$.

Which server must host the Feed service (\$F\$)?''',
    options: ['''Server 2''', '''Server 3''', '''Server 4''', '''Server 5'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Step-by-Step Constraint Satisfaction:
1. Server 1 is occupied by \$E\$:
   \$\$\\text{Layout: } [E, \\, \\_, \\, \\_, \\, \\_, \\, \\_, \\, \\_]\$\$
   Available positions for \$\\{A, B, C, D, F\\}\$ are servers 2, 3, 4, 5, 6.

2. Constraint: Exactly two servers separate \$A\$ and \$B\$, with \$B\$ to the right of \$A\$:
   - This means if \$A\$ is at index \$i\$, \$B\$ is at index \$i + 3\$.
   - Possible pairs \$(A, B)\$ in positions \$2..6\$:
     - Case 1: \$A = 2, B = 5\$
     - Case 2: \$A = 3, B = 6\$

3. Testing Case 2 (\$A = 3, B = 6\$):
   - Layout: \$[E, \\, \\_, \\, A, \\, \\_, \\, \\_, \\, B]\$
   - Remaining servers: 2, 4, 5.
   - Constraint: \$C\$ and \$D\$ must be adjacent. In \$\\{2, 4, 5\\}\$, the only adjacent pair is \$\\{4, 5\\}\$.
   - Thus \$\\{C, D\\}\$ occupy servers 4 and 5.
   - Then server 2 MUST be occupied by \$F\$.
   - Check condition 4: \$F\$ cannot be on server 6. Here \$F = 2\$, which satisfies condition 4.
   - This case is valid and yields \$F = 2\$.

4. Testing Case 1 (\$A = 2, B = 5\$):
   - Layout: \$[E, \\, A, \\, \\_, \\, \\_, \\, B, \\, \\_]\$
   - Remaining servers: 3, 4, 6.
   - \$C\$ and \$D\$ must be adjacent \$\\implies \\{C, D\\}\$ must occupy servers 3 and 4.
   - Then server 6 must host \$F\$.
   - BUT Condition 4 explicitly mandates: "\$F\$ cannot be on server 6"!
   - Hence, Case 1 is INVALID!

5. Therefore, Case 2 is the unique valid configuration:
   - Server 1: \$E\$
   - Server 2: \$F\$
   - Server 3: \$A\$
   - Server 4: \$C\$ (or \$D\$)
   - Server 5: \$D\$ (or \$C\$)
   - Server 6: \$B\$
   \$F\$ must be deployed on Server 2. Option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q09',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Geometry & Mensuration''',
    questionText: '''In a triangle \$\\triangle ABC\$, the side lengths are \$AB = 10\\text{ cm}\$, \$AC = 14\\text{ cm}\$, and \$BC = 12\\text{ cm}\$. The interior angle bisector of \$\\angle A\$ intersects side \$BC\$ at point \$D\$. What is the length of segment \$BD\$?''',
    options: ['''4.0 cm''', '''5.0 cm''', '''6.0 cm''', '''7.0 cm'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Angle Bisector Theorem Application:
1. By the Angle Bisector Theorem:
   \$\$\\frac{BD}{DC} = \\frac{AB}{AC}\$\$
2. Substitute the given side lengths:
   \$\$\\frac{BD}{DC} = \\frac{10}{14} = \\frac{5}{7}\$\$
3. Since \$D\$ lies on segment \$BC\$ of length 12 cm:
   \$\$BD + DC = 12\\text{ cm}\$\$
4. Express \$BD\$ as a fraction of \$BC\$:
   \$\$BD = \\frac{5}{5 + 7} \\times BC = \\frac{5}{12} \\times 12 = 5.0\\text{ cm}\$\$
5. Hence, \$BD = 5.0\\text{ cm}\$. Option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q10',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Verbal Reasoning''',
    questionText: '''Read the passage below:

"Formal verification techniques guarantee that a system satisfies mathematical invariants, but their practical scope is constrained by state-space explosion. Consequently, industrial certification frequently combines bounded model checking with rigorous empirical stress-testing. Rather than viewing empirical testing as an inferior substitute for formal proof, pragmatic engineering recognizes that proof verifies the model, while testing validates that the physical implementation faithfully corresponds to the abstract model."

Which of the following is the central thesis articulated by the author?''',
    options: ['''State-space explosion renders formal verification wholly impractical in modern industrial systems.''', '''Empirical testing and formal verification serve complementary roles in ensuring software reliability.''', '''Mathematical proofs of correctness are intrinsically superior to empirical stress-testing.''', '''Bounded model checking will soon supersede physical implementation testing entirely.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Central Thesis Analysis:
1. The passage directly contrasts proof and testing, concluding that "pragmatic engineering recognizes that proof verifies the model, while testing validates that the physical implementation faithfully corresponds to the abstract model."
2. This establishes that the two methods are complementary, addressing different aspects of system reliability (verification of model vs validation of physical reality).
3. Option (A) is exaggerated ("wholly impractical").
4. Option (C) contradicts the passage, which explicitly rejects viewing testing as an "inferior substitute".
5. Option (D) is unsupported speculation.
6. Therefore, option (B) accurately captures the author's thesis.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q11',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Propositional Logic''',
    questionText: '''Which of the following propositional logic formulas is a TAUTOLOGY (valid formula)?''',
    options: ['''\$((p \\to q) \\wedge \\neg q) \\to \\neg p\$''', '''\$(p \\to q) \\to (q \\to p)\$''', '''\$((p \\lor q) \\wedge \\neg p) \\to q\$''', '''Both A and C'''],
    correctAnswer: '''D''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Tautology Verification via Classical Rules of Inference:
1. Formula in (A): \$((p \\to q) \\wedge \\neg q) \\to \\neg p\$
   - This is Modus Tollens.
   - Proof: \$(p \\to q) \\wedge \\neg q \\equiv (\\neg p \\lor q) \\wedge \\neg q \\equiv (\\neg p \\wedge \\neg q) \\lor (q \\wedge \\neg q) \\equiv \\neg p \\wedge \\neg q\$.
   - Then \$(\\neg p \\wedge \\neg q) \\to \\neg p \\equiv \\neg(\\neg p \\wedge \\neg q) \\lor \\neg p \\equiv (p \\lor q) \\lor \\neg p \\equiv (p \\lor \\neg p) \\lor q \\equiv \\text{True} \\lor q \\equiv \\text{True}\$.
   - Thus, (A) is a tautology.

2. Formula in (B): \$(p \\to q) \\to (q \\to p)\$
   - Fallacy of affirming the consequent; false when \$p = \\text{False}, q = \\text{True}\$.

3. Formula in (C): \$((p \\lor q) \\wedge \\neg p) \\to q\$
   - This is Disjunctive Syllogism.
   - Proof: \$((p \\lor q) \\wedge \\neg p) \\equiv (p \\wedge \\neg p) \\lor (q \\wedge \\neg p) \\equiv \\text{False} \\lor (q \\wedge \\neg p) \\equiv q \\wedge \\neg p\$.
   - Then \$(q \\wedge \\neg p) \\to q \\equiv \\neg(q \\wedge \\neg p) \\lor q \\equiv (\\neg q \\lor p) \\lor q \\equiv (\\neg q \\lor q) \\lor p \\equiv \\text{True}\$.
   - Thus, (C) is also a tautology.

4. Since both (A) and (C) are tautologies, option (D) is the correct choice.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q12',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Group Theory''',
    questionText: '''Consider the multiplicative group of units \$\\mathbb{Z}_{14}^* = \\{x \\in \\mathbb{Z}_{14} \\mid \\gcd(x, 14) = 1\\}\$ under multiplication modulo 14. What is the order of the subgroup generated by the element 3?''',
    options: ['''2''', '''3''', '''6''', '''12'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Subgroup Order Calculation:
1. The group is \$\\mathbb{Z}_{14}^*\$.
   - Its elements are integers coprime to 14: \$\\{1, 3, 5, 9, 11, 13\\}\$.
   - Order of the group \$|\\mathbb{Z}_{14}^*| = \\phi(14) = 14 \\times (1 - 1/2)(1 - 1/7) = 14 \\times \\frac{1}{2} \\times \\frac{6}{7} = 6\$.
2. Compute successive powers of the element 3 modulo 14:
   - \$3^1 \\equiv 3 \\pmod{14}\$
   - \$3^2 = 9 \\equiv 9 \\pmod{14}\$
   - \$3^3 = 27 \\equiv 13 \\pmod{14}\$
   - \$3^4 = 39 \\equiv 11 \\pmod{14}\$
   - \$3^5 = 33 \\equiv 5 \\pmod{14}\$
   - \$3^6 = 15 \\equiv 1 \\pmod{14}\$
3. The smallest positive integer \$k\$ such that \$3^k \\equiv 1 \\pmod{14}\$ is \$k = 6\$.
4. Therefore, 3 is a generator of \$\\mathbb{Z}_{14}^*\$, and the order of the subgroup generated by 3 is 6.
5. Hence, option (C) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q13',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Rank-Nullity Theorem''',
    questionText: '''Let \$A\$ be a \$5 \\times 7\$ real matrix with rank 4. What is the dimension of the null space (nullity) of the matrix \$A\$?''',
    options: ['''1''', '''2''', '''3''', '''4'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Rank-Nullity Theorem:
1. For any \$m \\times n\$ matrix \$A\$, the Rank-Nullity Theorem states:
   \$\$\\text{rank}(A) + \\text{nullity}(A) = n\$\$
   where \$n\$ is the number of columns of \$A\$.
2. Here \$A\$ is \$5 \\times 7\$, so \$n = 7\$.
3. Given \$\\text{rank}(A) = 4\$:
   \$\$4 + \\text{nullity}(A) = 7 \\implies \\text{nullity}(A) = 7 - 4 = 3\$\$
4. Thus, the dimension of the null space is 3. Option (C) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q14',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Differentiability''',
    questionText: '''Consider the real-valued function \$f(x)\$ defined as:
\$\$f(x) = \\begin{cases} x^2 \\sin(1/x), & x \\ne 0 \\\\ 0, & x = 0 \\end{cases}\$\$
Which of the following statements regarding \$f(x)\$ at \$x = 0\$ is TRUE?''',
    options: ['''\$f(x)\$ is continuous at \$x = 0\$, but not differentiable at \$x = 0\$.''', '''\$f(x)\$ is differentiable at \$x = 0\$ with \$f'(0) = 0\$, and \$f'(x)\$ is continuous at \$x = 0\$.''', '''\$f(x)\$ is differentiable at \$x = 0\$ with \$f'(0) = 0\$, but \$f'(x)\$ is discontinuous at \$x = 0\$.''', '''\$f(x)\$ is not continuous at \$x = 0\$.'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Detailed Calculus Derivation:
1. Differentiability at \$x = 0\$:
   \$\$f'(0) = \\lim_{h \\to 0} \\frac{f(h) - f(0)}{h} = \\lim_{h \\to 0} \\frac{h^2 \\sin(1/h) - 0}{h} = \\lim_{h \\to 0} h \\sin(1/h)\$\$
   Since \$|\\sin(1/h)| \\le 1\$ for all \$h \\ne 0\$, by the Squeeze Theorem:
   \$\$-|h| \\le h \\sin(1/h) \\le |h| \\implies \\lim_{h \\to 0} h \\sin(1/h) = 0\$\$
   Thus, \$f(x)\$ is differentiable at \$x = 0\$, and \$f'(0) = 0\$.

2. Behavior of derivative \$f'(x)\$ for \$x \\ne 0\$:
   \$\$f'(x) = \\frac{d}{dx}[x^2 \\sin(1/x)] = 2x \\sin(1/x) + x^2 \\left(\\cos(1/x) \\cdot \\left(-\\frac{1}{x^2}\\right)\\right) = 2x \\sin(1/x) - \\cos(1/x)\$\$

3. Continuity of \$f'(x)\$ at \$x = 0\$:
   \$\$\\lim_{x \\to 0} f'(x) = \\lim_{x \\to 0} [2x \\sin(1/x) - \\cos(1/x)]\$\$
   As \$x \\to 0\$, \$2x \\sin(1/x) \\to 0\$, but \$\\cos(1/x)\$ oscillates between \$-1\$ and \$+1\$ indefinitely without converging to any limit.
   Therefore, \$\\lim_{x \\to 0} f'(x)\$ does not exist.
   Hence, \$f'(x)\$ is discontinuous at \$x = 0\$.

4. Conclusion: \$f(x)\$ is differentiable at \$x = 0\$ with \$f'(0) = 0\$, but \$f'(x)\$ is discontinuous at \$x = 0\$.
5. Option (C) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q15',
    year: 2026,
    subject: '''Probability & Statistics''',
    topic: '''Poisson Distribution''',
    questionText: '''Errors in a distributed ledger occur according to a Poisson process at an average rate of 2 errors per hour. What is the probability that AT LEAST ONE error occurs during a given 30-minute time window?''',
    options: ['''\$1 - e^{-1}\$''', '''\$1 - e^{-2}\$''', '''\$e^{-1}\$''', '''\$e^{-2}\$'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Poisson Process Computation:
1. Rate parameter: \$\\lambda = 2\\text{ errors/hour}\$.
2. Time interval \$t = 30\\text{ minutes} = 0.5\\text{ hour}\$.
3. Mean number of events in 30 minutes:
   \$\$\\mu = \\lambda t = 2 \\times 0.5 = 1\$\$
4. Number of errors \$X \\sim \\text{Poisson}(\\mu = 1)\$.
   \$\$P(X = k) = \\frac{e^{-\\mu} \\mu^k}{k!}\$\$
5. Probability of at least one error:
   \$\$P(X \\ge 1) = 1 - P(X = 0) = 1 - \\frac{e^{-1} \\cdot 1^0}{0!} = 1 - e^{-1}\$\$
6. Hence, option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q16',
    year: 2026,
    subject: '''Digital Logic''',
    topic: '''Boolean Algebra''',
    questionText: '''How many distinct self-dual Boolean functions of \$n\$ variables can be formed?''',
    options: ['''\$2^n\$''', '''\$2^{2^n}\$''', '''\$2^{2^{n-1}}\$''', '''\$2^{n-1}\$'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Self-Dual Boolean Functions Derivation:
1. A Boolean function \$f(x_1, x_2, \\dots, x_n)\$ is self-dual if:
   \$\$f(x_1, x_2, \\dots, x_n) = \\overline{f(\\overline{x_1}, \\overline{x_2}, \\dots, \\overline{x_n})}\$\$
2. For \$n\$ variables, there are \$2^n\$ possible input combinations in the truth table.
3. These \$2^n\$ combinations can be paired into \$2^{n-1}\$ mutually complementary pairs \$(v, \\overline{v})\$:
   - For each pair \$(v, \\overline{v})\$, setting \$f(v) = 0\$ forces \$f(\\overline{v}) = 1\$, and setting \$f(v) = 1\$ forces \$f(\\overline{v}) = 0\$.
   - Thus, there are exactly 2 independent choices for each of the \$2^{n-1}\$ pairs.
4. Total number of self-dual functions:
   \$\$N = 2^{2^{n-1}}\$\$
5. Hence, option (C) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q17',
    year: 2026,
    subject: '''Digital Logic''',
    topic: '''2's Complement Arithmetic Overflow''',
    questionText: '''In an \$n\$-bit 2's complement binary adder/subtractor, let \$C_{n-1}\$ be the carry into the sign bit position (most significant bit) and \$C_n\$ be the carry out of the sign bit position. Arithmetic overflow occurs if and only if which of the following conditions is satisfied?''',
    options: ['''\$C_n = 1\$''', '''\$C_{n-1} = 1\$''', '''\$C_n \\oplus C_{n-1} = 1\$''', '''\$C_n \\cdot C_{n-1} = 1\$'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Overflow Detection in 2's Complement Systems:
1. In signed 2's complement arithmetic, an overflow occurs when adding two numbers of the same sign produces a result of the opposite sign (e.g., positive + positive yields negative, or negative + negative yields positive).
2. Let \$C_{n-1}\$ be the carry entering the MSB (sign bit) and \$C_n\$ be the carry leaving the MSB:
   - If two positive numbers (\$A_{n-1} = 0, B_{n-1} = 0\$) produce a sum with sign bit 1, then \$C_{n-1} = 1\$ and \$C_n = 0 \\implies C_n \\oplus C_{n-1} = 1\$.
   - If two negative numbers (\$A_{n-1} = 1, B_{n-1} = 1\$) produce a sum with sign bit 0, then \$C_{n-1} = 0\$ and \$C_n = 1 \\implies C_n \\oplus C_{n-1} = 1\$.
   - In all non-overflow cases, either both carries are 0 or both carries are 1, giving \$C_n \\oplus C_{n-1} = 0\$.
3. Thus, overflow condition \$V = C_n \\oplus C_{n-1}\$.
4. Hence, option (C) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q18',
    year: 2026,
    subject: '''Computer Organization and Architecture''',
    topic: '''Addressing Modes''',
    questionText: '''Which of the following addressing modes is most naturally and directly suited for implementing position-independent code (PIC) and relocatable branch targets?''',
    options: ['''Direct (Absolute) Addressing''', '''Program Counter (PC) Relative Addressing''', '''Base-Register Addressing''', '''Register Indirect Addressing'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Addressing Modes for Code Relocation:
1. Position-Independent Code (PIC) requires instructions whose execution does not depend on the absolute physical or virtual base memory address where the code segment is loaded.
2. In Program Counter (PC) Relative Addressing, the effective target address is computed as:
   \$\$\\text{Effective Address} = \\text{PC} + \\text{Offset}\$\$
3. Because the offset between the current instruction and the branch target remains invariant regardless of where the binary is loaded in memory, branch targets do not require link-time or load-time address fixups.
4. Hence, PC-Relative Addressing is the primary mechanism for position-independent branching. Option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q19',
    year: 2026,
    subject: '''Computer Organization and Architecture''',
    topic: '''Control Unit Design''',
    questionText: '''Compared to a hardwired control unit, a microprogrammed control unit inherently exhibits which of the following characteristics?''',
    options: ['''Higher execution speed and greater hardware rigidity''', '''Slower instruction decoding speed, higher design flexibility, and easier modification of the instruction set''', '''Smaller silicon footprint and completely combinational logic implementation''', '''Zero control store memory overhead'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Hardwired vs Microprogrammed Control Units:
1. Hardwired Control Unit:
   - Implemented via combinational logic circuits and finite state machine registers.
   - Faster execution speed because control signals are generated directly by logic gates.
   - Extremely difficult to modify (requires redesigning physical silicon).
2. Microprogrammed Control Unit:
   - Control signals are generated by reading microinstructions from a Control Store (ROM/RAM).
   - Reading from control store introduces memory access overhead, making it slower than hardwired logic.
   - Highly flexible: new instructions or microcode bug fixes can be added simply by reprogramming the control store.
3. Therefore, microprogrammed units exhibit slower decoding speed, higher flexibility, and easier instruction set updates.
4. Option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q20',
    year: 2026,
    subject: '''Programming in C''',
    topic: '''Storage Classes & Scope''',
    questionText: '''In the C programming language, what is the effect of declaring a global variable with the `static` specifier at file scope (outside all functions)?''',
    options: ['''It allocates the variable on the runtime call stack.''', '''It restricts the linkage and visibility of the variable strictly to the translation unit (source file) in which it is defined.''', '''It prevents the variable's value from ever being modified after initialization.''', '''It automatically places the variable inside a CPU general-purpose register.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Static Global Variables in C:
1. When a variable is declared outside of all functions, its default linkage is external (it can be accessed from other translation units using `extern`).
2. Prefixing the file-scope declaration with the `static` keyword gives the variable internal linkage.
3. This restricts the identifier's visibility solely to the current source file (translation unit), preventing name collisions and hiding the variable from other compilation units.
4. It does not alter its lifetime (which remains static, throughout program execution in the BSS/Data segment), nor does it make it constant (`const` is needed for that).
5. Hence, option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q21',
    year: 2026,
    subject: '''Data Structures''',
    topic: '''Queues & Stacks''',
    questionText: '''A FIFO queue is implemented using two LIFO stacks, \$S_1\$ and \$S_2\$. An `enqueue` operation simply pushes the element onto \$S_1\$. A `dequeue` operation checks if \$S_2\$ is empty; if \$S_2\$ is empty, all elements are popped from \$S_1\$ and pushed onto \$S_2\$, after which the top element of \$S_2\$ is popped. What are the worst-case and amortized time complexities of a single `dequeue` operation in a sequence of \$n\$ queue operations?''',
    options: ['''Worst-case \$O(n)\$, Amortized \$O(1)\$''', '''Worst-case \$O(1)\$, Amortized \$O(1)\$''', '''Worst-case \$O(n)\$, Amortized \$O(n)\$''', '''Worst-case \$O(\\log n)\$, Amortized \$O(1)\$'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Amortized Analysis of Two-Stack Queue:
1. Worst-case scenario:
   - When \$S_2\$ is empty and \$S_1\$ contains \$k\$ elements, `dequeue` must pop all \$k\$ elements from \$S_1\$ and push them onto \$S_2\$.
   - This transfer takes \$2k\$ operations. In the worst case where \$k = O(n)\$, the worst-case time is \$O(n)\$.
2. Amortized scenario (Accounting / Potential method):
   - Each element is pushed onto \$S_1\$ once (\$O(1)\$).
   - Each element is popped from \$S_1\$ and pushed onto \$S_2\$ at most once throughout its lifetime (\$O(1)\$).
   - Finally, each element is popped from \$S_2\$ to complete the `dequeue` exactly once (\$O(1)\$).
   - Thus, across any sequence of \$n\$ operations, the total cost spent on all elements is at most \$c \\cdot n\$.
   - The amortized cost per `dequeue` operation is \$O(1)\$.
3. Hence, Worst-case is \$O(n)\$ and Amortized is \$O(1)\$. Option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q22',
    year: 2026,
    subject: '''Data Structures''',
    topic: '''Heaps''',
    questionText: '''An array \$A[1..7]\$ represents a complete binary tree stored in level-order. Which of the following array contents satisfies the binary MIN-HEAP property (where for every node \$i\$, \$A[i] \\le A[2i]\$ and \$A[i] \\le A[2i+1]\$ whenever the children exist)?''',
    options: ['''[5, 12, 8, 15, 14, 10, 7]''', '''[4, 9, 7, 14, 18, 11, 15]''', '''[6, 8, 5, 10, 12, 7, 9]''', '''[3, 11, 6, 8, 15, 5, 14]'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Min-Heap Invariant Verification:
1. In a 1-indexed complete binary tree array:
   - Root is at index 1.
   - Left child of node \$i\$ is at \$2i\$; Right child is at \$2i + 1\$.
   - For a min-heap, every parent must be \$\\le\$ both its children.

2. Checking each option:
   - Option (A): `[5, 12, 8, 15, 14, 10, 7]`
     - Node at index 3 is 8. Its right child at index \$2(3)+1 = 7\$ is 7.
     - Here \$8 > 7\$, which violates min-heap property. (Invalid)
   - Option (B): `[4, 9, 7, 14, 18, 11, 15]`
     - Index 1 (4): children are index 2 (9) and index 3 (7). \$4 \\le 9\$ and \$4 \\le 7\$. (Valid)
     - Index 2 (9): children are index 4 (14) and index 5 (18). \$9 \\le 14\$ and \$9 \\le 18\$. (Valid)
     - Index 3 (7): children are index 6 (11) and index 7 (15). \$7 \\le 11\$ and \$7 \\le 15\$. (Valid)
     - All heap conditions are fully satisfied! (Valid)
   - Option (C): `[6, 8, 5, 10, 12, 7, 9]`
     - Index 1 is 6, but its right child at index 3 is 5 (\$6 > 5\$). (Invalid)
   - Option (D): `[3, 11, 6, 8, 15, 5, 14]`
     - Index 3 is 6, but its left child at index 6 is 5 (\$6 > 5\$). (Invalid)

3. Hence, option (B) is the only valid min-heap.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q23',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Graph Traversal (BFS)''',
    questionText: '''Breadth-First Search (BFS) is initiated from a source vertex \$s\$ on an undirected, unweighted graph \$G = (V, E)\$. Which of the following statements is ALWAYS TRUE?''',
    options: ['''BFS can be used to determine whether \$G\$ is a bipartite graph in \$O(V + E)\$ time by 2-coloring vertices layer by layer.''', '''BFS correctly computes single-source shortest path distances in graphs with arbitrary negative edge weights.''', '''Every non-tree cross edge in an undirected BFS forest connects two vertices whose distances from \$s\$ differ by at least 2.''', '''The frontier set of vertices during BFS traversal must be managed using a LIFO stack.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''BFS Properties Analysis:
1. Option (A): A graph is bipartite if and only if it contains no odd-length cycles. During BFS, alternating colors (e.g., Red and Blue) are assigned to vertices at successive distance layers \$d = 0, 1, 2, \\dots\$. If any cross edge connects two vertices in the same layer (same color), an odd cycle is detected and the graph is not bipartite. If the traversal finishes without conflict, the graph is bipartite. This takes \$O(V + E)\$ time. (A is TRUE).
2. Option (B): BFS computes shortest paths in unweighted graphs (or graphs with equal positive edge weights), not arbitrary weighted graphs. (B is FALSE).
3. Option (C): In an undirected BFS tree, any cross edge \$(u, v)\$ can only connect vertices in the same layer or adjacent layers (\$|d(s, u) - d(s, v)| \\le 1\$). (C is FALSE).
4. Option (D): BFS fundamentally uses a FIFO queue, not a LIFO stack. (D is FALSE).
5. Hence, option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q24',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Huffman Coding''',
    questionText: '''An alphabet of five symbols \$\\{A, B, C, D, E\\}\$ has occurrence probabilities:
\$\$P(A) = 0.40, \\quad P(B) = 0.25, \\quad P(C) = 0.20, \\quad P(D) = 0.10, \\quad P(E) = 0.05\$\$
What is the expected (average) codeword length (in bits per symbol) when an optimal prefix code is generated using Huffman's algorithm?''',
    options: ['''1.95 bits''', '''2.10 bits''', '''2.25 bits''', '''2.40 bits'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Huffman Tree Construction & Expected Length:
1. Iteration 1:
   - Combine lowest two probabilities: \$E (0.05)\$ and \$D (0.10) \\implies (DE)\$ with probability \$0.15\$.
   - Remaining set: \$\\{(DE): 0.15, \\, C: 0.20, \\, B: 0.25, \\, A: 0.40\\}\$.
2. Iteration 2:
   - Combine lowest two: \$(DE) (0.15)\$ and \$C (0.20) \\implies (CDE)\$ with probability \$0.35\$.
   - Remaining set: \$\\{B: 0.25, \\, (CDE): 0.35, \\, A: 0.40\\}\$.
3. Iteration 3:
   - Combine lowest two: \$B (0.25)\$ and \$(CDE) (0.35) \\implies (BCDE)\$ with probability \$0.60\$.
   - Remaining set: \$\\{A: 0.40, \\, (BCDE): 0.60\\}\$.
4. Iteration 4:
   - Combine \$A (0.40)\$ and \$(BCDE) (0.60) \\implies \\text{Root}\$ with probability \$1.00\$.

5. Codeword bit lengths:
   - Symbol \$A\$: 1 bit (depth 1)
   - Symbol \$B\$: 2 bits (depth 2)
   - Symbol \$C\$: 3 bits (depth 3)
   - Symbol \$D\$: 4 bits (depth 4)
   - Symbol \$E\$: 4 bits (depth 4)

6. Expected codeword length \$L\$:
   \$\$L = \\sum P(x) \\cdot l(x)\$\$
   \$\$L = (0.40 \\times 1) + (0.25 \\times 2) + (0.20 \\times 3) + (0.10 \\times 4) + (0.05 \\times 4)\$\$
   \$\$L = 0.40 + 0.50 + 0.60 + 0.40 + 0.20 = 2.10\\text{ bits/symbol}\$\$

7. Hence, option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q25',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''Regular Expressions''',
    questionText: '''Which of the following pairs of regular expressions over alphabet \$\\Sigma = \\{a, b\\}\$ denote IDENTICAL formal languages?
- Pair 1: \$(a + b)^*\$ and \$(a^* b^*)^*\$
- Pair 2: \$a(ba)^*\$ and \$(ab)^*a\$''',
    options: ['''Only Pair 1''', '''Only Pair 2''', '''Neither Pair 1 nor Pair 2''', '''Both Pair 1 and Pair 2'''],
    correctAnswer: '''D''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Equivalence of Regular Expressions:
1. Analysis of Pair 1:
   - The expression \$(a^* b^*)\$ generates any string containing any number of \$a\$'s followed by any number of \$b\$'s (including \$\\epsilon, a, b, ab\$, etc.).
   - The Kleene closure \$(a^* b^*)^*\$ generates any finite sequence of such substrings. Since \$a \\in L(a^* b^*)\$ and \$b \\in L(a^* b^*)\$, \$(a^* b^*)^*\$ can generate any arbitrary sequence of \$a\$'s and \$b\$'s.
   - Therefore, \$L((a^* b^*)^*) = \\{a, b\\}^* = L((a + b)^*)\$.
   - Pair 1 denotes identical languages.

2. Analysis of Pair 2:
   - \$a(ba)^*\$: Generates strings starting with \$a\$, followed by zero or more repetitions of \$ba\$. Examples: \$a, aba, ababa, \\dots\$.
   - \$(ab)^*a\$: Generates zero or more repetitions of \$ab\$, followed by \$a\$. Examples: \$a, aba, ababa, \\dots\$.
   - By Arden's algebraic identity for regular expressions: \$P(QP)^* = (PQ)^*P\$.
   - Setting \$P = a\$ and \$Q = b\$ directly gives \$a(ba)^* = (ab)^*a\$.
   - Pair 2 denotes identical languages.

3. Thus, both pairs are equivalent. Option (D) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q26',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''Pushdown Automata (DPDA vs NPDA)''',
    questionText: '''Which of the following statements accurately characterizes the difference in expressive language recognition power between Deterministic Pushdown Automata (DPDA) and Non-deterministic Pushdown Automata (NPDA)?''',
    options: ['''DPDAs and NPDAs accept identical classes of languages.''', '''Languages accepted by DPDAs (DCFLs) form a strict proper subset of Context-Free Languages (CFLs) accepted by NPDAs.''', '''DPDAs are strictly more powerful than NPDAs because determinism eliminates ambiguous epsilon-transitions.''', '''NPDAs accept context-sensitive languages that cannot be parsed by any Turing machine.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''DPDA vs NPDA Expressiveness:
1. Unlike Finite Automata (where DFA \$\\equiv\$ NFA), non-determinism strictly increases the computational power of pushdown automata.
2. NPDAs accept the entire class of Context-Free Languages (CFLs).
3. DPDAs accept only Deterministic Context-Free Languages (DCFLs).
4. The language of even-length palindromes \$L = \\{w w^R \\mid w \\in \\{a, b\\}^*\\}\$ is context-free and can be accepted by an NPDA (by non-deterministically guessing the midpoint), but CANNOT be accepted by any DPDA.
5. Therefore, \$\\text{DCFL} \\subsetneq \\text{CFL}\$. Option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q27',
    year: 2026,
    subject: '''Compiler Design''',
    topic: '''Lexical Analysis Disambiguation''',
    questionText: '''In a scanner generated by a lexical analyzer generator (such as Lex or Flex), how are ambiguities resolved when an input prefix matches more than one regular expression rule?''',
    options: ['''The Longest Match (Maximal Munch) rule is applied first; ties in length are broken by choosing the rule listed earliest in the specification file.''', '''The Shortest Match rule is applied first; ties in length are broken alphabetically by token name.''', '''A non-deterministic choice is made, and the parser backtracks if an error occurs.''', '''The rule with the fewest states in its DFA is prioritized.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Lexical Analyzer Disambiguation Rules:
1. Lex/Flex tools use two fundamental deterministic disambiguation rules:
   - Rule 1 (Longest Match / Maximal Munch): Always match the longest possible prefix of the input string that forms a valid token (e.g., `identifier` matches `variable_name` rather than just `variable`).
   - Rule 2 (Rule Priority / First Match): If the longest matching prefix can be generated by two or more distinct rules of equal length, the rule appearing first in the specification file takes precedence (e.g., keyword `if` is listed before `identifier`, so `if` is lexed as a keyword rather than a variable name).
2. Hence, option (A) is the correct standard compiler principle.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q28',
    year: 2026,
    subject: '''Compiler Design''',
    topic: '''Syntax-Directed Translation''',
    questionText: '''Which of the following statements is a DEFINING characteristic of an S-attributed Syntax-Directed Definition (SDD)?''',
    options: ['''It contains both synthesized and inherited attributes that depend solely on left siblings.''', '''Every attribute associated with grammar symbols is synthesized, enabling evaluation during bottom-up LR parsing.''', '''It cannot be evaluated using an LR parser and requires top-down recursive descent.''', '''It requires multiple traversal passes over the parse tree to compute attribute values.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''S-Attributed Definitions:
1. An SDD is called S-attributed if every attribute is a synthesized attribute.
2. A synthesized attribute of a non-terminal \$A\$ in a production \$A \\to X_1 X_2 \\dots X_k\$ is computed strictly from the attribute values of the children symbols \$X_1, \\dots, X_k\$ and the alternative production constants.
3. Because all values flow bottom-up from children to parents, an S-attributed grammar can be naturally and seamlessly evaluated during bottom-up LR parsing without building an explicit parse tree (attributes are stored directly on the parser value stack alongside state symbols).
4. Option (B) is the exact definition.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q29',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''Inter-Process Communication''',
    questionText: '''Which Inter-Process Communication (IPC) mechanism provides the highest data transfer bandwidth between two cooperating processes on the same physical host by completely eliminating kernel-space data copying?''',
    options: ['''Shared Memory''', '''UNIX Domain Sockets''', '''Anonymous Pipes''', '''POSIX Message Queues'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''IPC Performance Comparison:
1. Pipes, UNIX sockets, and message queues require the sending process to copy data from user space into kernel buffers via system calls (`write`/`send`), and then copy it from kernel space to the receiving process's user space (`read`/`recv`). This double-copy overhead limits maximum bandwidth.
2. Shared Memory maps the identical physical RAM frames into the virtual address spaces of both processes.
3. Once the shared memory segment is mapped, processes communicate by reading and writing directly to memory addresses at hardware RAM bus speed with ZERO kernel interventions or data copies.
4. Hence, Shared Memory provides the highest bandwidth. Option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q30',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''File Systems & Inodes''',
    questionText: '''In a UNIX-like file system, an inode incorporates 12 direct block pointers, 1 single indirect pointer, 1 double indirect pointer, and 1 triple indirect pointer. If the disk block size is 2 KB (\$2^{11}\$ bytes) and each disk block address pointer occupies 4 bytes (\$2^2\$ bytes), how many disk block pointers can be stored within a single indirect block?''',
    options: ['''256''', '''512''', '''1024''', '''2048'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Indirect Block Pointer Capacity:
1. Block size \$= 2\\text{ KB} = 2048\\text{ bytes}\$.
2. Block pointer size \$= 4\\text{ bytes}\$.
3. Number of pointers stored in a single indirect block:
   \$\$N = \\frac{\\text{Block Size}}{\\text{Pointer Size}} = \\frac{2048\\text{ bytes}}{4\\text{ bytes}} = 512 = 2^9\$\$
4. Therefore, exactly 512 block pointers can be stored in a single indirect block.
5. Option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q31',
    year: 2026,
    subject: '''Databases''',
    topic: '''SQL Query Processing Order''',
    questionText: '''In the logical processing pipeline of an SQL query, which of the following represents the correct order of evaluation for SQL clauses?''',
    options: ['''FROM \$\\to\$ WHERE \$\\to\$ GROUP BY \$\\to\$ HAVING \$\\to\$ SELECT \$\\to\$ ORDER BY''', '''SELECT \$\\to\$ FROM \$\\to\$ WHERE \$\\to\$ GROUP BY \$\\to\$ HAVING \$\\to\$ ORDER BY''', '''FROM \$\\to\$ GROUP BY \$\\to\$ WHERE \$\\to\$ HAVING \$\\to\$ SELECT \$\\to\$ ORDER BY''', '''FROM \$\\to\$ WHERE \$\\to\$ SELECT \$\\to\$ GROUP BY \$\\to\$ HAVING \$\\to\$ ORDER BY'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''SQL Logical Query Processing Sequence:
1. `FROM`: Identify and join the source tables.
2. `WHERE`: Filter individual rows before aggregation.
3. `GROUP BY`: Partition the filtered rows into groups based on key columns.
4. `HAVING`: Filter aggregated groups based on group aggregate conditions.
5. `SELECT`: Evaluate projections, column aliases, and window functions.
6. `ORDER BY`: Sort the resulting output rows.
7. Thus, the order is: `FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY`.
8. Option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q32',
    year: 2026,
    subject: '''Databases''',
    topic: '''Lossless Join Decomposition''',
    questionText: '''A relation \$R(A, B, C)\$ is decomposed into two sub-relations \$R_1(A, B)\$ and \$R_2(B, C)\$. Under what condition on the functional dependency closure \$F^+\$ is this decomposition GUARANTEED to be a lossless-join decomposition?''',
    options: ['''Either \$B \\to A \\in F^+\$ or \$B \\to C \\in F^+\$''', '''Both \$A \\to B \\in F^+\$ and \$C \\to B \\in F^+\$''', '''Only \$A \\to C \\in F^+\$''', '''\$B\$ must be a foreign key referencing an external table'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Lossless Join Decomposition Theorem:
1. A binary decomposition of relation \$R\$ into \$R_1\$ and \$R_2\$ is lossless with respect to a functional dependency set \$F\$ if and only if the common attribute set \$(R_1 \\cap R_2)\$ forms a superkey of at least one of the decomposed relations:
   \$\$(R_1 \\cap R_2) \\to R_1 \\in F^+ \\quad \\text{OR} \\quad (R_1 \\cap R_2) \\to R_2 \\in F^+\$\$
2. In our schema:
   - \$R_1 \\cap R_2 = \\{B\\}\$
   - \$R_1 = \\{A, B\\} \\implies B \\to A\$
   - \$R_2 = \\{B, C\\} \\implies B \\to C\$
3. Therefore, the decomposition is lossless if and only if \$B \\to A \\in F^+\$ or \$B \\to C \\in F^+\$.
4. Option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q33',
    year: 2026,
    subject: '''Computer Networks''',
    topic: '''Transport Layer Headers''',
    questionText: '''Which of the following header fields is present in the standard TCP header but completely ABSENT in the standard UDP header?''',
    options: ['''Source Port Number''', '''Destination Port Number''', '''Sequence Number''', '''Checksum'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''TCP vs UDP Header Comparison:
1. UDP header is lightweight (8 bytes total) and contains only 4 fields:
   - Source Port (16 bits)
   - Destination Port (16 bits)
   - Length (16 bits)
   - Checksum (16 bits)
2. TCP header (minimum 20 bytes) contains:
   - Source Port and Destination Port
   - Sequence Number (32 bits) - ABSENT in UDP!
   - Acknowledgment Number (32 bits) - ABSENT in UDP!
   - Data Offset, Control Flags, Window Size, Checksum, Urgent Pointer.
3. Therefore, Sequence Number is present in TCP but absent in UDP.
4. Option (C) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q34',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Graph Theory (Bridges & Cut Vertices)''',
    questionText: '''Let \$G = (V, E)\$ be a connected, simple, undirected graph with \$|V| \\ge 3\$. Which of the following statements regarding bridges and articulation points (cut vertices) are ALWAYS TRUE?''',
    options: ['''In a DFS tree of \$G\$, the root vertex is an articulation point if and only if it has at least two children in the DFS tree.''', '''In a DFS tree of \$G\$, a non-root vertex \$u\$ is an articulation point if and only if \$u\$ has a child \$v\$ such that no vertex in the subtree rooted at \$v\$ has a back-edge to a proper ancestor of \$u\$.''', '''An edge \$e \\in E\$ is a bridge if and only if \$e\$ does not belong to any simple cycle in \$G\$.''', '''If \$G\$ possesses an articulation point, it must also contain at least one bridge.'''],
    correctAnswer: '''A, B, C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Graph Articulation Point & Bridge Theorems:
1. Statement (A): In a DFS tree, the root vertex has no ancestors. If it has two or more children, removing the root leaves the subtrees disconnected (because in an undirected graph, DFS produces only tree edges and back-edges, never cross edges between subtrees). Thus root is an articulation point iff it has \$\\ge 2\$ children. (A is TRUE).
2. Statement (B): This is Tarjan's articulation point theorem: a non-root \$u\$ is a cut vertex iff there is a child \$v\$ whose descendants cannot bypass \$u\$ via a back-edge to an ancestor of \$u\$. (B is TRUE).
3. Statement (C): An edge \$e\$ is a bridge iff its removal increases connected components. If \$e\$ lies on a cycle, alternate paths remain, so it is not a bridge. If \$e\$ is not on any cycle, it is the unique path between its endpoints, so it is a bridge. (C is TRUE).
4. Statement (D): Counterexample: Two triangles sharing a single common vertex (bow-tie graph). The common vertex is an articulation point, but all edges lie on cycles, so there are ZERO bridges! Thus, articulation points do not imply the existence of bridges. (D is FALSE).
5. Hence, options A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q35',
    year: 2026,
    subject: '''Digital Logic''',
    topic: '''Boolean Function Minterms''',
    questionText: '''A Boolean function of four variables \$A, B, C, D\$ is defined as:
\$\$F(A, B, C, D) = (A + \\overline{B})(C + \\overline{D}) + \\overline{A} B C\$\$
Determine the total number of minterms (out of the 16 possible input combinations) for which \$F(A, B, C, D) = 1\$.''',
    options: [],
    correctAnswer: '''11''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Boolean Algebraic Simplification and Minterm Count:
1. Expand the expression:
   \$\$F = (A + \\overline{B})(C + \\overline{D}) + \\overline{A} B C\$\$
   \$\$F = AC + A\\overline{D} + \\overline{B}C + \\overline{B}\\overline{D} + \\overline{A}BC\$\$

2. Combine terms involving \$C\$:
   \$\$\\overline{B}C + \\overline{A}BC = C(\\overline{B} + \\overline{A}B) = C(\\overline{B} + \\overline{A}) = \\overline{B}C + \\overline{A}C\$\$
   Then:
   \$\$AC + \\overline{A}C = (A + \\overline{A})C = C\$\$
   Therefore:
   \$\$F = C + A\\overline{D} + \\overline{B}\\overline{D} = C + (A + \\overline{B})\\overline{D}\$\$

3. Counting combinations where \$F = 1\$:
   - Case 1: When \$C = 1\$:
     \$F = 1\$ regardless of the values of \$A, B, D\$.
     Since \$A, B, D\$ can each take 2 values, there are \$2^3 = 8\$ minterms where \$C = 1\$.

   - Case 2: When \$C = 0\$:
     \$\$F = (A + \\overline{B})\\overline{D}\$\$
     For \$F = 1\$, we must have \$\\overline{D} = 1 \\implies D = 0\$.
     And \$(A + \\overline{B}) = 1\$.
     The term \$(A + \\overline{B})\$ evaluates to 1 for 3 of the 4 combinations of \$(A, B)\$:
     - \$(A=0, B=0) \\implies 0 + 1 = 1\$
     - \$(A=1, B=0) \\implies 1 + 1 = 1\$
     - \$(A=1, B=1) \\implies 1 + 0 = 1\$
     (Only \$(A=0, B=1)\$ gives 0).
     Thus, there are \$3 \\times 1 = 3\$ minterms where \$C = 0\$.

4. Total minterms in the on-set:
   \$\$\\text{Total} = 8 + 3 = 11\$\$

5. The answer is exactly 11.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q36',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Pigeonhole Principle''',
    questionText: '''Let \$S\$ be a subset of the set of integers \$\\{1, 2, 3, \\dots, 100\\}\$. What is the MINIMUM cardinality of \$S\$ that mathematically guarantees that \$S\$ contains at least two distinct integers whose sum is exactly 101?''',
    options: ['''50''', '''51''', '''52''', '''75'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Pigeonhole Principle Partitioning:
1. We partition the set \$\\{1, 2, \\dots, 100\\}\$ into disjoint pairs of elements that sum to 101:
   \$\$\\{1, 100\\}, \\, \\{2, 99\\}, \\, \\{3, 98\\}, \\, \\dots, \\, \\{50, 51\\}\$\$
2. There are exactly \$100 / 2 = 50\$ such mutually exclusive pairs (pigeonholes).
3. If we select at most 50 integers by choosing exactly one integer from each pair (for instance, the set \$\\{1, 2, 3, \\dots, 50\\}\$), no two chosen integers will sum to 101.
4. By the Pigeonhole Principle, if we choose \$50 + 1 = 51\$ integers, at least two of the selected integers must originate from the very same pair.
5. These two integers will sum to exactly 101.
6. Thus, the minimum size is 51. Option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q37',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Diagonalizability & Multiplicity''',
    questionText: '''Consider the real \$3 \\times 3\$ matrix:
\$\$A = \\begin{pmatrix} 2 & 1 & 0 \\\\ 0 & 2 & 0 \\\\ 0 & 0 & 3 \\end{pmatrix}\$\$
Which of the following statements regarding the diagonalizability of matrix \$A\$ is TRUE?''',
    options: ['''\$A\$ is diagonalizable because its determinant is non-zero (\$\\det(A) = 12\$).''', '''\$A\$ is NOT diagonalizable because the geometric multiplicity of eigenvalue \$\\lambda = 2\$ is strictly less than its algebraic multiplicity.''', '''\$A\$ is diagonalizable because it has three distinct eigenvalues.''', '''\$A\$ is orthogonally diagonalizable because it is an upper triangular matrix.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Diagonalizability Criteria Analysis:
1. Matrix \$A\$ is upper triangular. Its eigenvalues are the diagonal entries:
   \$\$\\lambda_1 = 2, \\quad \\lambda_2 = 2, \\quad \\lambda_3 = 3\$\$
2. For eigenvalue \$\\lambda = 2\$:
   - Algebraic multiplicity \$AM(2) = 2\$.
3. Compute the Geometric Multiplicity \$GM(2)\$, which is the nullity of \$(A - 2I)\$:
   \$\$A - 2I = \\begin{pmatrix} 0 & 1 & 0 \\\\ 0 & 0 & 0 \\\\ 0 & 0 & 1 \\end{pmatrix}\$\$
   - The rank of \$(A - 2I)\$ is 2 (rows 1 and 3 are linearly independent).
   - By the Rank-Nullity Theorem:
     \$\$GM(2) = \\text{nullity}(A - 2I) = 3 - \\text{rank}(A - 2I) = 3 - 2 = 1\$\$
4. A matrix is diagonalizable if and only if for every eigenvalue, its geometric multiplicity equals its algebraic multiplicity.
5. Here, \$GM(2) = 1 < AM(2) = 2\$.
6. Therefore, \$A\$ is NOT diagonalizable. Option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q38',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Multivariable Optimization''',
    questionText: '''Find and classify the critical points of the function \$f(x, y) = x^3 + y^3 - 3xy\$:''',
    options: ['''\$(0, 0)\$ is a local minimum, and \$(1, 1)\$ is a local maximum''', '''\$(0, 0)\$ is a saddle point, and \$(1, 1)\$ is a local minimum''', '''Both \$(0, 0)\$ and \$(1, 1)\$ are saddle points''', '''\$(0, 0)\$ is a local maximum, and \$(1, 1)\$ is a saddle point'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Hessian Discriminant Optimization:
1. First partial derivatives:
   \$\$f_x = 3x^2 - 3y = 0 \\implies y = x^2\$\$
   \$\$f_y = 3y^2 - 3x = 0 \\implies x = y^2\$\$
2. Substitute \$y = x^2\$ into \$x = y^2\$:
   \$\$x = (x^2)^2 = x^4 \\implies x(x^3 - 1) = 0\$\$
   Real roots: \$x = 0 \\implies y = 0\$; and \$x = 1 \\implies y = 1\$.
   Critical points: \$(0, 0)\$ and \$(1, 1)\$.

3. Second partial derivatives:
   \$\$f_{xx} = 6x, \\quad f_{yy} = 6y, \\quad f_{xy} = -3\$\$
   Hessian determinant:
   \$\$D(x, y) = f_{xx} f_{yy} - (f_{xy})^2 = (6x)(6y) - (-3)^2 = 36xy - 9\$\$

4. Evaluation at critical points:
   - At \$(0, 0)\$:
     \$\$D(0, 0) = 0 - 9 = -9 < 0\$\$
     Since \$D < 0\$, \$(0, 0)\$ is a SADDLE POINT.
   - At \$(1, 1)\$:
     \$\$D(1, 1) = 36(1)(1) - 9 = 27 > 0\$\$
     Since \$D > 0\$ and \$f_{xx}(1, 1) = 6 > 0\$, \$(1, 1)\$ is a LOCAL MINIMUM.

5. Hence, option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q39',
    year: 2026,
    subject: '''Probability & Statistics''',
    topic: '''Joint Continuous Distributions''',
    questionText: '''Let \$(X, Y)\$ have joint probability density function:
\$\$f(x, y) = \\begin{cases} 8xy, & 0 < y < x < 1 \\\\ 0, & \\text{otherwise} \\end{cases}\$\$
What is the marginal density \$f_Y(y)\$ for \$0 < y < 1\$, and what is the conditional expectation \$E[X \\mid Y = y]\$?''',
    options: ['''\$f_Y(y) = 4y(1 - y^2) \\quad \\text{and} \\quad E[X \\mid Y = y] = \\frac{2(1 + y + y^2)}{3(1 + y)}\$''', '''\$f_Y(y) = 2y(1 - y^2) \\quad \\text{and} \\quad E[X \\mid Y = y] = \\frac{1 + y}{2}\$''', '''\$f_Y(y) = 4y^2 \\quad \\text{and} \\quad E[X \\mid Y = y] = \\frac{2y}{3}\$''', '''\$f_Y(y) = 8y(1 - y) \\quad \\text{and} \\quad E[X \\mid Y = y] = \\frac{3(1 + y)}{4}\$'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Joint Density Integration:
1. Marginal density \$f_Y(y)\$:
   \$\$f_Y(y) = \\int_{y}^{1} 8xy \\, dx = 8y \\left[ \\frac{x^2}{2} \\right]_{y}^{1} = 4y(1 - y^2) \\quad \\text{for } 0 < y < 1\$\$

2. Conditional probability density \$f_{X|Y}(x \\mid y)\$:
   \$\$f_{X|Y}(x \\mid y) = \\frac{f(x, y)}{f_Y(y)} = \\frac{8xy}{4y(1 - y^2)} = \\frac{2x}{1 - y^2} \\quad \\text{for } y < x < 1\$\$

3. Conditional expectation \$E[X \\mid Y = y]\$:
   \$\$E[X \\mid Y = y] = \\int_{y}^{1} x \\cdot f_{X|Y}(x \\mid y) \\, dx = \\int_{y}^{1} \\frac{2x^2}{1 - y^2} \\, dx\$\$
   \$\$= \\frac{2}{1 - y^2} \\left[ \\frac{x^3}{3} \\right]_{y}^{1} = \\frac{2(1 - y^3)}{3(1 - y^2)}\$\$
   Factorizing difference of cubes and difference of squares:
   \$\$= \\frac{2(1 - y)(1 + y + y^2)}{3(1 - y)(1 + y)} = \\frac{2(1 + y + y^2)}{3(1 + y)}\$\$

4. Hence, option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q40',
    year: 2026,
    subject: '''Digital Logic''',
    topic: '''FSM Sequence Detectors''',
    questionText: '''A sequential circuit is designed to detect the overlapping bit sequence `1011` in a stream of serial input bits. What are the MINIMUM numbers of states required to construct this detector as a Mealy machine and as a Moore machine, respectively?''',
    options: ['''4 and 4''', '''4 and 5''', '''5 and 5''', '''3 and 4'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''State Count in Sequence Detectors:
1. In a sequence detector for a pattern of length \$m\$ (here \$m = 4\$ for `1011`):
2. Mealy Machine:
   - Output depends on both current state and current input.
   - The final bit of the pattern can produce output '1' along the transition from the state representing prefix `101` back into prefix state `1` on input 1.
   - Number of states required corresponds to the prefixes: \$\\epsilon, 1, 10, 101\$.
   - Minimum states for Mealy \$= m = 4\$ states.
3. Moore Machine:
   - Output depends strictly on the current state.
   - An output of '1' can only be asserted by entering a distinct accepting state representing the complete sequence `1011`.
   - Prefix states: \$\\epsilon, 1, 10, 101\$, plus the accepting state `1011`.
   - Minimum states for Moore \$= m + 1 = 5\$ states.
4. Thus, 4 states for Mealy and 5 states for Moore. Option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q41',
    year: 2026,
    subject: '''Computer Organization and Architecture''',
    topic: '''Tomasulo's Algorithm & Register Renaming''',
    questionText: '''In high-performance out-of-order execution processors utilizing Tomasulo's dynamic scheduling algorithm with Reservation Stations and Register Renaming, which class of pipeline data hazards is completely eliminated by register renaming?''',
    options: ['''RAW (Read-After-Write) true data dependencies''', '''Both WAR (Write-After-Read) and WAW (Write-After-Write) name dependencies''', '''Structural execution unit hazards''', '''Control branch misprediction hazards'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Register Renaming and False Hazard Elimination:
1. RAW (Read-After-Write) is a fundamental true data dependency: an instruction must wait for its producer to compute the result. It cannot be eliminated by renaming.
2. WAR (anti-dependency) and WAW (output dependency) are false (name) dependencies arising purely from the limited number of architectural register names.
3. Tomasulo's algorithm maps architectural registers to temporary storage tags (Reservation Station tags or Reorder Buffer entries).
4. When a subsequent instruction writes to a register, it receives a new tag; previous instructions reading the old register value refer to the older tag.
5. Consequently, WAR and WAW hazards are completely eliminated.
6. Option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q42',
    year: 2026,
    subject: '''Programming in C''',
    topic: '''Structure Alignment & Padding''',
    questionText: '''Consider the following C `struct` definition compiled on a 64-bit architecture where `char` is 1 byte, `short` is 2 bytes, `int` is 4 bytes, and pointer `char*` is 8 bytes, with natural memory alignment:

```c
struct Node {
    char a;
    int b;
    short c;
    char *d;
};
```
What is the value of `sizeof(struct Node)` in bytes?''',
    options: ['''15 bytes''', '''16 bytes''', '''20 bytes''', '''24 bytes'''],
    correctAnswer: '''D''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Memory Layout and Alignment Computation:
1. Member layout:
   - `char a` (1 byte): placed at byte offset 0.
   - Next member is `int b` (4 bytes), which requires an offset divisible by 4.
     - Bytes 1, 2, 3 are padding bytes.
     - `int b` occupies bytes 4, 5, 6, 7.
   - Next member is `short c` (2 bytes), which requires an offset divisible by 2.
     - Byte offset 8 is divisible by 2.
     - `short c` occupies bytes 8, 9.
   - Next member is `char *d` (8 bytes), which requires an offset divisible by 8.
     - Offset 10 is not divisible by 8; the next multiple of 8 is 16.
     - Bytes 10, 11, 12, 13, 14, 15 are padding bytes (6 bytes padding).
     - `char *d` occupies bytes 16 through 23 (8 bytes).

2. Total struct size before tail padding \$= 24\\text{ bytes}\$.
3. Struct alignment requirement:
   - The overall struct size must be a multiple of the largest member's alignment (which is 8 bytes for `char*`).
   - Since 24 is already divisible by 8 (\$24 = 3 \\times 8\$), no trailing padding is added.
4. Therefore, `sizeof(struct Node)` is 24 bytes.
5. Option (D) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q43',
    year: 2026,
    subject: '''Data Structures''',
    topic: '''Disjoint Set Union (DSU)''',
    questionText: '''A Disjoint Set Union (DSU) data structure maintains \$n\$ elements. If both the **Union by Rank** and **Path Compression** heuristics are employed, what is the asymptotic worst-case running time of executing an intermixed sequence of \$m\$ operations (\$m \\ge n\$) consisting of `Find` and `Union`?''',
    options: ['''\$O(m \\log n)\$''', '''\$O(m \\cdot \\alpha(n))\$, where \$\\alpha\$ is the inverse Ackermann function''', '''\$O(n \\log m)\$''', '''\$O(m \\log^* n)\$'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Tarjan's Bound for DSU:
1. Union by Rank alone guarantees tree height \$O(\\log n)\$, giving \$O(m \\log n)\$ for \$m\$ operations.
2. Path Compression alone flattens trees during `Find`, but can incur \$O(m \\log_{1+m/n} n)\$ worst-case time.
3. When both Union by Rank and Path Compression are combined, Robert Tarjan (1975) proved that any sequence of \$m\$ operations on \$n\$ elements executes in:
   \$\$O(m \\cdot \\alpha(n))\$\$
   where \$\\alpha(n)\$ is the extremely slow-growing inverse Ackermann function (for all practical values of \$n \\le 10^{80}\$, \$\\alpha(n) \\le 4\$).
4. Hence, option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q44',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''0/1 vs Fractional Knapsack''',
    questionText: '''Consider the 0/1 Knapsack problem and the Fractional Knapsack problem for \$n\$ items with capacity \$W\$. Which of the following statements is FALSE?''',
    options: ['''The 0/1 Knapsack problem can be solved in \$O(nW)\$ time using dynamic programming, which is a pseudo-polynomial time algorithm.''', '''If item weights and knapsack capacity \$W\$ are encoded in binary, the dynamic programming running time \$O(nW)\$ is exponential in the input length.''', '''Greedily selecting items in non-increasing order of value-to-weight ratio always yields an optimal solution for the 0/1 Knapsack problem.''', '''The Fractional Knapsack problem possesses the greedy-choice property and can be solved in \$O(n \\log n)\$ time.'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Analysis of Knapsack Algorithms:
1. Option (A) is true: The standard DP table has size \$(n+1) \\times (W+1)\$, taking \$O(nW)\$ time. Since \$W\$ is a numeric value rather than input length, it is pseudo-polynomial.
2. Option (B) is true: The input length of \$W\$ encoded in binary is \$k = \\lceil \\log_2 W \\rceil\$ bits. Thus \$W = 2^k\$, making \$O(nW) = O(n \\cdot 2^k)\$, which is exponential in the number of bits.
3. Option (C) is FALSE: Greedy choice fails for 0/1 Knapsack because an item with high density might consume space that prevents packing a combination of items with higher aggregate value. (Counterexample: \$W = 50\$, Item 1: wt 10, val 60 (ratio 6); Item 2: wt 20, val 100 (ratio 5); Item 3: wt 30, val 120 (ratio 4). Greedy takes Item 1 and Item 2 \$\\implies\$ total val 160. But Items 2 and 3 fit together \$\\implies\$ total val 220!).
4. Option (D) is true: Fractional Knapsack allows taking fractions of items, so greedy ratio sorting works optimally in \$O(n \\log n)\$.
5. Hence, option (C) is the false statement.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q45',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Network Flow & Edmonds-Karp''',
    questionText: '''Let \$G = (V, E)\$ be a directed flow network with source \$s\$, sink \$t\$, and integer edge capacities \$c(u, v)\$. Which of the following assertions is ALWAYS TRUE?''',
    options: ['''The capacity of a minimum \$(s, t)\$-cut is strictly greater than the maximum flow value.''', '''The Edmonds-Karp algorithm finds an optimal maximum flow in \$O(V E^2)\$ time by augmenting along the shortest paths in terms of number of edges.''', '''Increasing the capacity of any arbitrary edge in \$G\$ is guaranteed to strictly increase the maximum flow from \$s\$ to \$t\$.''', '''Residual networks never contain back-edges with non-zero residual capacity.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Max-Flow Min-Cut and Edmonds-Karp Properties:
1. Max-Flow Min-Cut Theorem (Ford-Fulkerson): In any network, the maximum flow value from \$s\$ to \$t\$ is strictly equal to the capacity of the minimum \$(s, t)\$-cut. (A is FALSE).
2. The Edmonds-Karp algorithm is a specific implementation of the Ford-Fulkerson method that uses Breadth-First Search (BFS) to find augmenting paths with the minimum number of edges. It terminates in at most \$O(V E)\$ augmentations, each taking \$O(E)\$ time, achieving an overall worst-case time complexity of \$O(V E^2)\$. (B is TRUE).
3. Increasing the capacity of an edge that is not saturated or does not lie on a bottleneck cut has zero effect on the maximum flow value. (C is FALSE).
4. Residual networks inherently create back-edges with capacity equal to the forward flow \$f(u, v)\$ to permit "undoing" flow. (D is FALSE).
5. Hence, option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q46',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''Decidability of Context-Free Languages''',
    questionText: '''Which of the following decision problems concerning Context-Free Grammars (CFGs) is mathematically DECIDABLE?''',
    options: ['''Determining whether a given CFG \$G\$ is ambiguous.''', '''Determining whether \$L(G_1) \\cap L(G_2) = \\emptyset\$ for two arbitrary CFGs \$G_1\$ and \$G_2\$.''', '''Determining whether \$L(G) = \\Sigma^*\$ for a given CFG \$G\$.''', '''Determining whether \$L(G) = \\emptyset\$ (emptiness problem) for a given CFG \$G\$.'''],
    correctAnswer: '''D''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Decidability of Formal Language Problems:
1. Emptiness of a CFG (\$L(G) = \\emptyset\$):
   - A CFG is empty if and only if the start symbol \$S\$ cannot generate any terminal string.
   - This can be decided in polynomial time using a simple marking algorithm: iteratively mark non-terminals that produce strings of terminals, and check if \$S\$ gets marked.
   - Thus, the emptiness problem for CFGs is DECIDABLE. (Option D is TRUE).
2. Ambiguity of a CFG: Undecidable by reduction from the Post Correspondence Problem (PCP).
3. Intersection emptiness (\$L(G_1) \\cap L(G_2) = \\emptyset\$): Undecidable by reduction from PCP.
4. Universality (\$L(G) = \\Sigma^*\$): Undecidable for CFGs (unlike regular languages, testing whether a CFG generates all strings is undecidable).
5. Hence, option (D) is the only decidable problem.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q47',
    year: 2026,
    subject: '''Compiler Design''',
    topic: '''Canonical LR(1) vs LALR(1)''',
    questionText: '''When constructing an LALR(1) parsing table by merging states of a Canonical LR(1) parser that share identical cores of LR(0) items, which of the following parsing conflicts can potentially be introduced that was NOT present in the original LR(1) automaton?''',
    options: ['''Shift-Reduce conflicts only''', '''Reduce-Reduce conflicts only''', '''Both Shift-Reduce and Reduce-Reduce conflicts''', '''Neither Shift-Reduce nor Reduce-Reduce conflicts can ever be introduced'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''LALR(1) State Merging Properties:
1. Two LR(1) states are merged into a single LALR(1) state if and only if they possess identical cores (the same set of LR(0) items, differing only in lookahead sets).
2. Why Shift-Reduce conflicts CANNOT be introduced:
   - Suppose a merged state has a shift on terminal \$a\$ and a reduce by \$A \\to \\alpha\$.
   - A shift on \$a\$ requires an item with core \$B \\to \\beta \\cdot a \\gamma\$. Because the cores were identical in the original states, both original states had this shift item.
   - If the reduce item \$A \\to \\alpha \\cdot, [a]\$ exists in the merged state, it must have been present in at least one of the original states.
   - But if it were present with lookahead \$a\$ alongside the shift item in that original state, that original LR(1) state would already have had a Shift-Reduce conflict!
   - Thus, state merging cannot create new Shift-Reduce conflicts.
3. Why Reduce-Reduce conflicts CAN be introduced:
   - Consider two distinct reduction items \$A \\to \\alpha \\cdot, [a]\$ and \$B \\to \\beta \\cdot, [b]\$ in state \$I_1\$, and \$A \\to \\alpha \\cdot, [c]\$ and \$B \\to \\beta \\cdot, [a]\$ in state \$I_2\$.
   - Neither original state had a conflict on \$a\$.
   - But in the merged state, both \$A \\to \\alpha\$ and \$B \\to \\beta\$ have lookahead \$a\$, producing a brand new Reduce-Reduce conflict!
4. Hence, merging states can introduce Reduce-Reduce conflicts, but never Shift-Reduce conflicts. Option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q48',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''Virtual Memory & Thrashing''',
    questionText: '''In a virtual memory system with demand paging, system thrashing occurs when which of the following conditions is satisfied?''',
    options: ['''The sum of the working-set sizes of all active processes exceeds the total available physical memory frames.''', '''The CPU utilization reaches 100% due to an abundance of compute-bound user processes.''', '''The Translation Lookaside Buffer (TLB) hit ratio approaches 100%.''', '''The disk arm scheduling policy transitions from SSTF to FCFS.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Working-Set Model and Thrashing:
1. Denning's Working-Set Model defines \$WSS_i\$ as the number of unique pages referenced by process \$P_i\$ during the most recent window \$\\Delta\$.
2. The total demand for frames across all active processes is \$D = \\sum WSS_i\$.
3. Let \$M\$ be the total number of physical memory frames available in the system:
   - If \$D > M\$, physical memory is insufficient to allocate even the minimum working set to each process.
   - Processes immediately suffer high page fault rates, as each page brought in evicts another page currently needed.
   - Processes spend virtually all their time waiting in the device queue for page swap I/O.
   - CPU utilization collapses to near zero.
   - The OS scheduler misinterprets low CPU utilization as a sign that the system is underloaded, and admits even more processes, precipitating complete system thrashing.
4. Hence, thrashing occurs when the aggregate working-set size exceeds available physical memory frames.
5. Option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q49',
    year: 2026,
    subject: '''Databases''',
    topic: '''Concurrency Control (Thomas' Write Rule)''',
    questionText: '''Under the Thomas' Write Rule for concurrency control in timestamp-based database systems, what action is taken when a transaction \$T_i\$ attempts to execute `write(X)` such that \$TS(T_i) < W\\text{-timestamp}(X)\$?''',
    options: ['''Transaction \$T_i\$ is immediately aborted and rolled back with a new timestamp.''', '''The `write(X)` operation is simply discarded (ignored), and transaction \$T_i\$ continues its execution uninterrupted.''', '''Transaction \$T_i\$ is blocked until the transaction that wrote \$X\$ commits.''', '''An exclusive two-phase lock is acquired on data item \$X\$.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Thomas' Write Rule Semantics:
1. In standard Timestamp Ordering:
   - If \$TS(T_i) < W\\text{-timestamp}(X)\$, it means that a newer transaction with a larger timestamp has already overwritten \$X\$.
   - Standard timestamp ordering aborts and rolls back \$T_i\$.
2. Thomas' Write Rule optimization:
   - Since a newer transaction has already written the latest value to \$X\$, the value that \$T_i\$ is trying to write has already been superseded (it is obsolete).
   - Any transaction with timestamp greater than the latest writer will read the newer value anyway.
   - Therefore, \$T_i\$'s obsolete write can be safely ignored (discarded) without executing it or rolling back \$T_i\$.
3. This allows some view-serializable schedules that are not conflict-serializable to proceed safely.
4. Hence, option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q50',
    year: 2026,
    subject: '''Computer Networks''',
    topic: '''Traffic Shaping (Token Bucket)''',
    questionText: '''A Token Bucket traffic shaper has a capacity of \$C = 20\\text{ MB}\$ and receives tokens at a constant rate of \$R = 10\\text{ MB/s}\$. The maximum possible transmission speed of the network interface card during a burst is \$M = 50\\text{ MB/s}\$. Assuming the token bucket is initially completely full, what is the maximum duration \$T\$ (in seconds) for which the host can transmit continuously at its maximum rate \$M\$?''',
    options: ['''0.25 seconds''', '''0.40 seconds''', '''0.50 seconds''', '''2.00 seconds'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Token Bucket Burst Duration Derivation:
1. Let \$T\$ be the maximum duration of the burst at peak transmission rate \$M\$.
2. During time \$T\$:
   - The total amount of data transmitted is \$M \\times T\$.
   - The total number of tokens available to authorize this transmission equals the initial bucket capacity \$C\$ plus the newly generated tokens arriving during the interval \$T\$, which is \$R \\times T\$.
3. At the limit of the burst:
   \$\$M \\times T = C + R \\times T\$\$
   \$\$T(M - R) = C\$\$
   \$\$T = \\frac{C}{M - R}\$\$
4. Substitute the given parameters:
   - \$C = 20\\text{ MB}\$
   - \$M = 50\\text{ MB/s}\$
   - \$R = 10\\text{ MB/s}\$
   \$\$T = \\frac{20}{50 - 10} = \\frac{20}{40} = 0.50\\text{ seconds}\$\$
5. Hence, option (C) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q51',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''Virtual Memory & Architecture''',
    questionText: '''Which of the following statements regarding virtual memory and paging implementations are TRUE?''',
    options: ['''When the `fork()` system call is executed in modern operating systems, physical page duplication is deferred using Copy-On-Write (COW).''', '''A context switch between two distinct user processes requires invalidating non-global TLB entries unless the processor supports Address Space Identifiers (ASIDs).''', '''Inverted page tables have size directly proportional to the total virtual address space of all active processes.''', '''Internal fragmentation in paging systems occurs because the last allocated page frame of a process is rarely filled to capacity.'''],
    correctAnswer: '''A, B, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis of Virtual Memory Implementations:
1. Statement (A): Copy-On-Write (COW) marks parent pages as read-only on `fork()`. A child process shares these pages with the parent until either process attempts a write, at which point an access violation traps to the OS kernel to duplicate only the written page. (A is TRUE).
2. Statement (B): If TLB entries lack process tags (ASIDs), a virtual address from Process 1 could erroneously match a cached TLB entry from Process 2. Thus, the TLB must be flushed during a context switch unless ASIDs are used. (B is TRUE).
3. Statement (C): An inverted page table has exactly one entry per *physical frame* of main memory, regardless of the number of processes or the size of their virtual address spaces. Thus, its size is proportional to physical memory, not virtual address space. (C is FALSE).
4. Statement (D): Memory in paging is allocated strictly in multiples of the page frame size. If a process requires memory that is not an exact multiple of the page size, the leftover space in the final frame is wasted as internal fragmentation. (D is TRUE).
5. Hence, options A, B, and D are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q52',
    year: 2026,
    subject: '''Computer Networks''',
    topic: '''Application Layer Protocols''',
    questionText: '''Which of the following assertions concerning Application Layer network protocols are TRUE?''',
    options: ['''In HTTP/1.1 with pipelining, application-level Head-of-Line (HoL) blocking occurs because responses must be returned in the exact sequential order that the requests were issued.''', '''HTTP/2 mitigates application-level Head-of-Line blocking by interleaving binary frames from multiple concurrent bidirectional streams over a single shared TCP connection.''', '''The Domain Name System (DNS) protocol can execute over both UDP and TCP transport protocols on well-known port 53.''', '''Simple Mail Transfer Protocol (SMTP) is a pull protocol used by client software to retrieve incoming emails from a remote mailbox.'''],
    correctAnswer: '''A, B, C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis of Application Protocols:
1. Statement (A): In HTTP/1.1 pipelining, clients can send multiple requests without waiting for each response, but the server is mandated to send responses in the exact FIFO order of receipt. If an earlier response requires lengthy server computation, all subsequent completed responses are stalled behind it (application-level HoL blocking). (A is TRUE).
2. Statement (B): HTTP/2 breaks HTTP messages into independent binary frames tagged with a stream ID. Frames from different requests/responses are freely multiplexed over a single TCP connection, eliminating application-level HoL blocking. (B is TRUE).
3. Statement (C): DNS predominantly uses UDP port 53 for fast query/response messages under 512 bytes, but switches to TCP port 53 for zone transfers (AXFR) and responses that exceed 512 bytes. (C is TRUE).
4. Statement (D): SMTP is a push protocol used to send/forward emails from client to server and between mail servers. POP3 and IMAP are pull protocols used to retrieve emails from a mailbox. (D is FALSE).
5. Hence, options A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q53',
    year: 2026,
    subject: '''Databases''',
    topic: '''B-Trees vs B+ Trees''',
    questionText: '''Which of the following statements regarding B-trees and B+ trees of order \$p\$ are TRUE?''',
    options: ['''In a B+ tree, data records (or record pointers) are stored exclusively in the leaf nodes, whereas in a standard B-tree, record pointers can reside in both internal and leaf nodes.''', '''The leaf nodes of a B+ tree are linked sequentially via pointers, enabling efficient range searches without traversing the tree from the root for every key.''', '''For identical disk block sizes and key sizes, an internal node of a B+ tree can accommodate a larger fan-out (order \$p\$) than an internal node of a B-tree.''', '''Searching for any key present in a standard B-tree always requires traversing down to a leaf node.'''],
    correctAnswer: '''A, B, C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Comparison of B-Trees and B+ Trees:
1. Statement (A): In a B+ tree, internal nodes store only search keys and child block pointers to direct searches; all actual data records or record pointers reside in leaf nodes. In a B-tree, every key at any level is paired with a record pointer. (A is TRUE).
2. Statement (B): Leaves of a B+ tree form a linked list. Once the leaf node corresponding to the lower bound of a range query is located, remaining records are scanned horizontally through the leaf chain in \$O(k)\$ time without re-traversing the root. (B is TRUE).
3. Statement (C): Because B+ tree internal nodes do not store record pointers, each entry takes less space: \$p \\times \\text{ptr} + (p-1) \\times \\text{key} \\le B\$. In a B-tree, entries include record pointers: \$p \\times \\text{ptr} + (p-1) \\times (\\text{key} + \\text{rec\\_ptr}) \\le B\$. Thus, \$p\$ is strictly larger for B+ trees, giving higher fan-out and shallower tree height. (C is TRUE).
4. Statement (D): In a B-tree, if the target key matches a key in an internal node or the root, the search terminates immediately at that level; it does NOT need to descend to a leaf. (D is FALSE).
5. Hence, options A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q54',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Minimum Spanning Trees''',
    questionText: '''Let \$G = (V, E)\$ be a connected, undirected graph with real edge weights that are NOT necessarily distinct. Which of the following statements are ALWAYS TRUE?''',
    options: ['''If the edge weights are not distinct, \$G\$ may possess multiple distinct Minimum Spanning Trees.''', '''If an edge \$e\$ is the strictly unique minimum-weight edge in the entire graph \$G\$, then \$e\$ must belong to EVERY Minimum Spanning Tree of \$G\$.''', '''If all edge weights in \$G\$ are identical, then EVERY spanning tree of \$G\$ is a Minimum Spanning Tree.''', '''Prim's algorithm and Kruskal's algorithm may construct different spanning trees on \$G\$, but both are guaranteed to yield an identical minimum total weight.'''],
    correctAnswer: '''A, B, C, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Minimum Spanning Tree Theoretical Invariants:
1. Statement (A): When edge weights have ties, multiple distinct subsets of \$V - 1\$ edges can yield the identical minimum weight sum, producing distinct MSTs. (A is TRUE).
2. Statement (B): Let \$e = (u, v)\$ have weight strictly less than all other edges in \$G\$. Consider the cut \$(S, V \\setminus S)\$ with \$S = \\{u\\}\$. Edge \$e\$ crosses this cut, and every other crossing edge has weight strictly greater than \$w(e)\$. By the Cut Property of MSTs, \$e\$ must belong to every MST. (B is TRUE).
3. Statement (C): If every edge has weight \$w\$, then any spanning tree of \$V\$ vertices contains exactly \$V - 1\$ edges, and its total weight is \$(V - 1)w\$. Since all spanning trees have identical weight, every spanning tree is an MST. (C is TRUE).
4. Statement (D): Both algorithms are provably optimal greedy algorithms that find an MST. When ties in edge weight occur, differing tie-breaking choices between Prim's and Kruskal's can produce structurally different trees, but both trees will have the exact same total minimum weight. (D is TRUE).
5. Hence, all four options (A, B, C, D) are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q55',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''Computational Complexity (P vs NP)''',
    questionText: '''Which of the following statements regarding the complexity classes P, NP, and NP-Complete are TRUE?''',
    options: ['''If a decision problem \$A\$ is NP-Complete, and \$A \\le_p B\$ (polynomial-time reducible to \$B\$) where \$B \\in \\text{NP}\$, then \$B\$ is also NP-Complete.''', '''If any single NP-Complete problem is proven to be solvable in deterministic polynomial time, then \$\\text{P} = \\text{NP}\$.''', '''The complexity class P is closed under complementation (\$	ext{P} = \\text{co-P}\$).''', '''Every NP-Hard decision problem must belong to the complexity class NP.'''],
    correctAnswer: '''A, B, C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Complexity Class Theorems:
1. Statement (A): To show \$B\$ is NP-Complete, one must prove: (1) \$B \\in \\text{NP}\$, and (2) every problem in NP reduces to \$B\$. Since \$A\$ is NP-Complete, every problem in NP reduces to \$A\$. Since reduction is transitive, every problem in NP reduces to \$B\$ via \$A\$. Thus \$B\$ is NP-Complete. (A is TRUE).
2. Statement (B): By definition of NP-Completeness, every problem in NP reduces to an NP-Complete problem in polynomial time. If an NP-Complete problem is in P, then composing the reduction with the poly-time algorithm yields a poly-time solution for every problem in NP, implying \$\\text{P} = \\text{NP}\$. (B is TRUE).
3. Statement (C): If \$L \\in \\text{P}\$, there is a deterministic Turing machine that halts in polynomial time with YES or NO. Inverting the accept/reject states produces a deterministic polynomial-time Turing machine for \$\\overline{L}\$. Thus \$\\text{P} = \\text{co-P}\$. (C is TRUE).
4. Statement (D): An NP-Hard problem is at least as hard as any problem in NP, but need not be in NP. For instance, the Halting Problem is NP-Hard (SAT reduces to it), but it is undecidable, so it does NOT belong to NP. (D is FALSE).
5. Hence, options A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q56',
    year: 2026,
    subject: '''Compiler Design''',
    topic: '''Loop Optimization Techniques''',
    questionText: '''Which of the following compiler transformations are classified as loop optimizations?''',
    options: ['''Loop-Invariant Code Motion (hoisting computations whose operands remain constant across all iterations into the loop preheader)''', '''Strength Reduction (replacing high-cost operations such as multiplication by an induction variable with low-cost addition operations)''', '''Loop Unrolling (replicating the loop body to diminish branch testing overhead and expose instruction-level parallelism)''', '''Global Register Allocation via Graph Coloring across arbitrary functions'''],
    correctAnswer: '''A, B, C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Loop Optimization Categories:
1. Statement (A): Loop-Invariant Code Motion detects expressions inside a loop whose operands are never modified during loop execution, and hoists them out to the loop preheader so they are evaluated only once. (A is a loop optimization).
2. Statement (B): Strength Reduction identifies basic induction variables (e.g., \$i\$) and derived induction variables (e.g., \$t = i \\times 4\$), replacing the multiplication in each iteration with \$t = t + 4\$. (B is a loop optimization).
3. Statement (C): Loop Unrolling increases the loop step by duplicating loop body statements, reducing loop condition check overhead and expanding scheduling windows. (C is a loop optimization).
4. Statement (D): Register allocation via graph coloring (Chaitin-Briggs) is a backend code generation phase for mapping infinite virtual registers to a finite set of physical registers, not a loop optimization. (D is FALSE).
5. Hence, options A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q57',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Chromatic Polynomials''',
    questionText: '''Let \$C_4\$ denote the cycle graph with 4 vertices and 4 edges. The chromatic polynomial \$P(C_4, k)\$ defines the number of distinct proper vertex colorings of \$C_4\$ using \$k\$ available colors. Calculate the exact number of proper vertex colorings of \$C_4\$ when \$k = 3\$ colors are available.''',
    options: [],
    correctAnswer: '''18''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Chromatic Polynomial Evaluation of Cycle Graph \$C_4\$:
1. General formula for the chromatic polynomial of a cycle graph \$C_n\$:
   \$\$P(C_n, k) = (k - 1)^n + (-1)^n (k - 1)\$\$
2. For \$C_4\$ (\$n = 4\$):
   \$\$P(C_4, k) = (k - 1)^4 + (-1)^4 (k - 1) = (k - 1)^4 + (k - 1)\$\$
3. Setting \$k = 3\$:
   \$\$k - 1 = 3 - 1 = 2\$\$
   \$\$P(C_4, 3) = 2^4 + 2 = 16 + 2 = 18\$\$
4. Verification via Case Analysis:
   - Case 1: Non-adjacent opposite vertices \$v_1\$ and \$v_3\$ receive the same color:
     - 3 choices for the color of \$\\{v_1, v_3\\}\$.
     - Then \$v_2\$ can be any of the other 2 colors (2 choices).
     - \$v_4\$ can independently be any of the other 2 colors (2 choices).
     - Subtotal \$= 3 \\times 2 \\times 2 = 12\$ colorings.
   - Case 2: \$v_1\$ and \$v_3\$ receive different colors:
     - \$3 \\times 2 = 6\$ choices for the colors of \$v_1\$ and \$v_3\$.
     - Then \$v_2\$ must be different from both \$v_1\$ and \$v_3\$ (1 choice).
     - \$v_4\$ must also be different from both \$v_1\$ and \$v_3\$ (1 choice).
     - Subtotal \$= 6 \\times 1 \\times 1 = 6\$ colorings.
   - Total proper colorings \$= 12 + 6 = 18\$.
5. The answer is exactly 18.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q58',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Longest Common Subsequence''',
    questionText: '''Consider the two strings \$X = \\text{"ALGORITHM"}\$ and \$Y = \\text{"LOGARITHMIC"}\$. Determine the length of the Longest Common Subsequence (LCS) between strings \$X\$ and \$Y\$.''',
    options: [],
    correctAnswer: '''7''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''LCS Dynamic Programming Derivation:
1. Strings:
   - \$X = \\text{A L G O R I T H M}\$ (length 9)
   - \$Y = \\text{L O G A R I T H M I C}\$ (length 11)

2. Identifying matching subsequences:
   - In \$X\$, the characters appear in order:
     `A, L, G, O, R, I, T, H, M`
   - In \$Y\$, the characters appear in order:
     `L, O, G, A, R, I, T, H, M, I, C`

3. Candidate subsequences:
   - Notice the sequence `L, G, R, I, T, H, M`:
     - In \$X\$: positions 2 (L), 3 (G), 5 (R), 6 (I), 7 (T), 8 (H), 9 (M). Length = 7.
     - In \$Y\$: positions 1 (L), 3 (G), 5 (R), 6 (I), 7 (T), 8 (H), 9 (M). Length = 7.
   - Another common subsequence of length 7 is `L, O, R, I, T, H, M`:
     - In \$X\$: positions 2 (L), 4 (O), 5 (R), 6 (I), 7 (T), 8 (H), 9 (M).
     - In \$Y\$: positions 1 (L), 2 (O), 5 (R), 6 (I), 7 (T), 8 (H), 9 (M).

4. Can length 8 be attained?
   - In \$X\$, G precedes O (`G O`), whereas in \$Y\$, O precedes G (`O G`).
   - Thus, any common subsequence can contain at most one of G or O if L is matched before them.
   - Furthermore, matching A at the beginning of \$X\$ would discard L, O, and G from \$Y\$ (since A is at index 4 in \$Y\$), leaving at most `A, R, I, T, H, M` (length 6).
   - Hence, the maximum possible length is 7.

5. The length of the LCS is exactly 7.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q59',
    year: 2026,
    subject: '''Digital Logic''',
    topic: '''Asynchronous Counter Modulo''',
    questionText: '''A 4-bit asynchronous ripple counter is constructed by cascading four negative-edge triggered T flip-flops with inputs tied high (\$T = 1\$) to count upwards (\$Q_3 Q_2 Q_1 Q_0\$). An asynchronous active-LOW clear line is connected to the output of a 2-input NAND gate whose inputs are driven by \$Q_3\$ and \$Q_1\$. Determine the modulo (the number of distinct stable states) of this counter.''',
    options: [],
    correctAnswer: '''10''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Modulo of Counter with Asynchronous Clear:
1. Normal counting sequence starts at \$0000_2\$ (decimal 0) and increments by 1 on each clock pulse.
2. The clear condition is triggered when the NAND gate output goes LOW:
   \$\$\\text{Clear} = 0 \\iff Q_3 = 1 \\text{ and } Q_1 = 1\$\$
3. The smallest state where both \$Q_3 = 1\$ and \$Q_1 = 1\$ is:
   \$\$Q_3 Q_2 Q_1 Q_0 = 1010_2 = 10_{10}\$\$
4. Because the clear input is asynchronous, as soon as the counter transitions from \$9\$ (\$1001_2\$) to \$10\$ (\$1010_2\$), the propagation delay of the NAND gate instantly resets all flip-flops back to \$0000_2\$.
5. State 10 is a transient glitch state that does not persist for a clock cycle.
6. The stable states visited in the counting cycle are:
   \$\$0, 1, 2, 3, 4, 5, 6, 7, 8, 9\$\$
7. This represents exactly 10 distinct stable states (a Modulo-10 or BCD decade counter).
8. The modulo of the counter is 10.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q60',
    year: 2026,
    subject: '''Computer Organization and Architecture''',
    topic: '''Pipeline Execution Cycles''',
    questionText: '''A 5-stage instruction pipeline (IF, ID, EX, MEM, WB) executes a program of 1000 instructions. In the absence of hazards, each stage takes 1 clock cycle. Program execution encounters the following conditions:
- 20% of the instructions are conditional branches. 60% of these branch instructions are taken, each incurring 2 stall cycles.
- 30% of the instructions are memory operations (load/store). 10% of these memory operations suffer a data cache miss, incurring 3 stall cycles each.
- All other instructions execute with 0 stalls.

Calculate the TOTAL number of clock cycles required to execute this program.''',
    options: [],
    correctAnswer: '''1334''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Pipeline Cycle Calculation:
1. Total instructions \$N = 1000\$.
2. In an ideal 5-stage pipeline (\$k = 5\$), the number of cycles to execute \$N\$ instructions without any stalls is:
   \$\$\\text{Base Cycles} = k + (N - 1) = 5 + (1000 - 1) = 1004\\text{ cycles}\$\$

3. Branch stall cycles:
   - Total branch instructions \$= 1000 \\times 0.20 = 200\$.
   - Branches taken \$= 200 \\times 0.60 = 120\$.
   - Each taken branch causes 2 stall cycles.
   \$\$\\text{Branch Stalls} = 120 \\times 2 = 240\\text{ cycles}\$\$

4. Memory stall cycles:
   - Total memory instructions \$= 1000 \\times 0.30 = 300\$.
   - Instructions suffering cache miss \$= 300 \\times 0.10 = 30\$.
   - Each cache miss causes 3 stall cycles.
   \$\$\\text{Memory Stalls} = 30 \\times 3 = 90\\text{ cycles}\$\$

5. Total execution clock cycles:
   \$\$\\text{Total Cycles} = \\text{Base Cycles} + \\text{Branch Stalls} + \\text{Memory Stalls}\$\$
   \$\$\\text{Total Cycles} = 1004 + 240 + 90 = 1334\\text{ cycles}\$\$

6. The answer is exactly 1334.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q61',
    year: 2026,
    subject: '''Programming in C''',
    topic: '''Function Pointers & Arrays''',
    questionText: '''Consider the following C program:

```c
#include <stdio.h>
int add(int a, int b) { return a + b; }
int mul(int a, int b) { return a * b; }
int sub(int a, int b) { return a - b; }

int main() {
    int (*ops[])(int, int) = {add, mul, sub, add};
    int res = 5;
    for (int i = 0; i < 4; i++) {
        res = ops[i](res, i + 2);
    }
    printf("%d", res);
    return 0;
}
```
What is the integer output printed by the program upon execution?''',
    options: [],
    correctAnswer: '''22''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Execution Trace of Function Pointer Array:
1. Initial value: `res = 5`.
2. Array of function pointers:
   - `ops[0] = add`
   - `ops[1] = mul`
   - `ops[2] = sub`
   - `ops[3] = add`

3. Loop Iterations:
   - Iteration \$i = 0\$:
     Second argument \$= i + 2 = 0 + 2 = 2\$.
     Function called: `ops[0](5, 2) = add(5, 2) = 5 + 2 = 7`.
     Updated `res = 7`.

   - Iteration \$i = 1\$:
     Second argument \$= i + 2 = 1 + 2 = 3\$.
     Function called: `ops[1](7, 3) = mul(7, 3) = 7 * 3 = 21`.
     Updated `res = 21`.

   - Iteration \$i = 2\$:
     Second argument \$= i + 2 = 2 + 2 = 4\$.
     Function called: `ops[2](21, 4) = sub(21, 4) = 21 - 4 = 17`.
     Updated `res = 17`.

   - Iteration \$i = 3\$:
     Second argument \$= i + 2 = 3 + 2 = 5\$.
     Function called: `ops[3](17, 5) = add(17, 5) = 17 + 5 = 22`.
     Updated `res = 22`.

4. The printed output is 22.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q62',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''Banker's Algorithm''',
    questionText: '''A system consists of five processes \$\\{P_0, P_1, P_2, P_3, P_4\\}\$ and three resource types \$\\{A, B, C\\}\$ with total instances \$A = 10, B = 5, C = 7\$. The current Allocation and Max demand matrices are:
- Allocation: \$P_0(0,1,0), P_1(2,0,0), P_2(3,0,2), P_3(2,1,1), P_4(0,0,2)\$
- Max: \$P_0(7,5,3), P_1(3,2,2), P_2(9,0,2), P_3(2,2,2), P_4(4,3,3)\$

In the safe execution sequence determined by the Banker's safety algorithm, how many instances of resource \$A\$ are available immediately after the first two processes in the sequence finish and release their allocated resources?''',
    options: [],
    correctAnswer: '''7''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Banker's Safety Algorithm Trace:
1. Total allocated resources:
   - \$A: 0 + 2 + 3 + 2 + 0 = 7\$
   - \$B: 1 + 0 + 0 + 1 + 0 = 2\$
   - \$C: 0 + 0 + 2 + 1 + 2 = 5\$
2. Initial Available vector:
   \$\$\\text{Available} = \\text{Total} - \\text{Allocated} = (10 - 7, 5 - 2, 7 - 5) = (3, 3, 2)\$\$

3. Need Matrix (\$\\text{Max} - \\text{Allocation}\$):
   - \$P_0: (7-0, 5-1, 3-0) = (7, 4, 3)\$
   - \$P_1: (3-2, 2-0, 2-0) = (1, 2, 2)\$
   - \$P_2: (9-3, 0-0, 2-2) = (6, 0, 0)\$
   - \$P_3: (2-2, 2-1, 2-1) = (0, 1, 1)\$
   - \$P_4: (4-0, 3-0, 3-2) = (4, 3, 1)\$

4. Safety sequence execution:
   - Step 1: Check \$P_1\$: \$\\text{Need}(P_1) = (1, 2, 2) \\le \\text{Available} (3, 3, 2)\$.
     \$P_1\$ executes and terminates, releasing its allocation \$(2, 0, 0)\$.
     \$\$\\text{Available} = (3+2, 3+0, 2+0) = (5, 3, 2)\$\$
   - Step 2: Check \$P_3\$: \$\\text{Need}(P_3) = (0, 1, 1) \\le \\text{Available} (5, 3, 2)\$.
     \$P_3\$ executes and terminates, releasing its allocation \$(2, 1, 1)\$.
     \$\$\\text{Available} = (5+2, 3+1, 2+1) = (7, 4, 3)\$\$

5. The available instances of resource \$A\$ after the first two processes (\$P_1\$ and \$P_3\$) complete is exactly 7.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q63',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''UNIX Inode File Sizing''',
    questionText: '''A UNIX-style file system uses a disk block size of 4 KB (\$2^{12}\$ bytes) and disk block address pointers of 4 bytes (\$2^2\$ bytes). Each file inode contains 10 direct block pointers, 1 single indirect pointer, 1 double indirect pointer, and 0 triple indirect pointers. What is the total number of disk blocks that can be addressed by this inode?''',
    options: [],
    correctAnswer: '''1049610''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Inode Disk Block Capacity:
1. Pointers per indirect block:
   \$\$N = \\frac{\\text{Block Size}}{\\text{Pointer Size}} = \\frac{4096}{4} = 1024 = 2^{10}\$\$

2. Direct block addressing:
   - 10 direct pointers address \$10\$ disk blocks.

3. Single indirect addressing:
   - 1 single indirect pointer addresses \$1\$ block containing \$1024\$ disk block pointers.
   - Number of data blocks addressed \$= 1024\$.

4. Double indirect addressing:
   - 1 double indirect pointer addresses \$1\$ block containing \$1024\$ pointers to single indirect blocks.
   - Each of those \$1024\$ blocks contains \$1024\$ pointers to data blocks.
   - Number of data blocks addressed \$= 1024 \\times 1024 = 1,048,576\$.

5. Total disk blocks addressed by this inode:
   \$\$\\text{Total Blocks} = 10 + 1024 + 1,048,576 = 1,049,610\$\$

6. The total number of disk blocks is 1049610.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q64',
    year: 2026,
    subject: '''Computer Networks''',
    topic: '''CSMA/CD Minimum Frame Size''',
    questionText: '''In a CSMA/CD local area network operating at a data transmission rate of 1 Gbps (\$10^9\$ bps), the maximum physical cable length between any two communicating stations is 1 km (\$1000\$ m). Signals propagate through the transmission medium at a velocity of \$2 \\times 10^8\\text{ m/s}\$. To guarantee reliable collision detection, what is the MINIMUM frame size in bytes?''',
    options: [],
    correctAnswer: '''1250''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''CSMA/CD Minimum Frame Size Formula:
1. In CSMA/CD, the frame transmission time \$T_t\$ must be at least twice the one-way propagation delay \$T_p\$ to ensure a sender detects collisions before it finishes transmitting the frame:
   \$\$T_t \\ge 2 \\times T_p\$\$

2. Calculate propagation delay \$T_p\$:
   \$\$T_p = \\frac{\\text{Distance}}{v} = \\frac{1000\\text{ m}}{2 \\times 10^8\\text{ m/s}} = 5 \\times 10^{-6}\\text{ s} = 5\\ \\mu\\text{s}\$\$
   \$\$2 \\times T_p = 10 \\times 10^{-6}\\text{ s} = 10\\ \\mu\\text{s}\$\$

3. Minimum frame size in bits:
   \$\$L_{\\min} = 2 \\times T_p \\times \\text{Bandwidth}\$\$
   \$\$L_{\\min} = 10 \\times 10^{-6}\\text{ s} \\times 10^9\\text{ bps} = 10,000\\text{ bits}\$\$

4. Convert to bytes:
   \$\$\\text{Bytes} = \\frac{10,000}{8} = 1250\\text{ bytes}\$\$

5. The minimum frame size is exactly 1250 bytes.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK5_Q65',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''DFA State Transitions & Combinatorics''',
    questionText: '''A Deterministic Finite Automaton (DFA) with alphabet \$\\Sigma = \\{0, 1\\}\$ has state set \$\\{A, B\\}\$, start state \$A\$, and sole accepting state \$B\$. The transition function \$\\delta\$ is defined as:
\$\$\\delta(A, 0) = B, \\quad \\delta(A, 1) = A\$\$
\$\$\\delta(B, 0) = A, \\quad \\delta(B, 1) = B\$\$
How many binary strings of length 5 are accepted by this DFA?''',
    options: [],
    correctAnswer: '''16''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''DFA Language Invariant and String Count:
1. Analysis of DFA transitions:
   - Input symbol '1' produces a self-loop on both states: \$\\delta(A, 1) = A\$ and \$\\delta(B, 1) = B\$. Thus, '1' never changes the state.
   - Input symbol '0' alternates between state \$A\$ and state \$B\$: \$\\delta(A, 0) = B\$ and \$\\delta(B, 0) = A\$.
2. Because start state is \$A\$ and accepting state is \$B\$, the DFA ends in state \$B\$ if and only if the total number of transitions between \$A\$ and \$B\$ is odd.
3. Therefore, the DFA accepts a binary string if and only if the string contains an ODD NUMBER OF ZEROS.
4. Counting binary strings of length 5 with an odd number of zeros:
   - Possible counts of '0' are 1, 3, or 5.
   - Strings with 1 zero: \$\\binom{5}{1} = 5\$
   - Strings with 3 zeros: \$\\binom{5}{3} = 10\$
   - Strings with 5 zeros: \$\\binom{5}{5} = 1\$
5. Total accepted strings:
   \$\$\\text{Total} = 5 + 10 + 1 = 16\$\$
   (Notice that exactly half of all \$2^5 = 32\$ binary strings of length 5 have an odd number of zeros, \$32 / 2 = 16\$).
6. The answer is exactly 16.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
];
