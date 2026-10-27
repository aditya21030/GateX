// AUTO-GENERATED GATE CS MOCK 4 QUESTIONS (ULTRA-TOUGH FACULTY LEVEL)
import '../models/models.dart';

final List<PYQ> csFullMock4Questions = [
  PYQ(
    id: 'CS_MOCK4_Q01',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Verbal Ability''',
    questionText: '''Select the word that best fills the blank to make the sentence logically coherent and grammatically sound:

"The committee found the researcher's methodology to be thoroughly _______; rather than presenting a systematic and empirical investigation, it offered only disjointed anecdotes and superficial impressions."''',
    options: ['''desultory''', '''fastidious''', '''perspicacious''', '''trenchant'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Detailed Explanation:
1. Context analysis: The second clause ("rather than presenting a systematic and empirical investigation, it offered only disjointed anecdotes and superficial impressions") specifies that the methodology lacked plan, coherence, or rigor.
2. Word definitions:
   - "desultory" means lacking a plan, purpose, or enthusiasm; occurring in an erratic, haphazard, or disconnected manner. This exactly matches "disjointed anecdotes and superficial impressions".
   - "fastidious" means very attentive to and concerned about accuracy and detail (opposite of what is described).
   - "perspicacious" means having a ready insight into and understanding of things; perceptive.
   - "trenchant" means vigorous or incisive in expression or style.
3. Therefore, option (A) is the correct choice.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q02',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Critical Reasoning''',
    questionText: '''Consider the following argument:

"All efficient algorithms either conserve memory or minimize latency. No brute-force approach conserves memory. Some recursive procedures are brute-force approaches. Therefore, some recursive procedures minimize latency."

Which one of the following identifies the fundamental logical flaw in the deduction above?''',
    options: ['''It assumes that any algorithm that does not conserve memory must minimize latency, failing to recognize that an inefficient algorithm can fail both criteria.''', '''It illicitly distributes the predicate term across a negative premise.''', '''It derives a particular conclusion from two universal affirmative premises.''', '''It treats a sufficient condition for algorithmic efficiency as a necessary condition for recursion.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Detailed Logical Analysis:
1. Premise 1: Efficient \$\\implies\$ (Conserves Memory \$\\lor\$ Minimizes Latency).
   Note that this only applies to *efficient* algorithms. If an algorithm is NOT efficient, it may neither conserve memory NOR minimize latency.
2. Premise 2: Brute-Force \$\\implies\$ NOT (Conserves Memory).
3. Premise 3: \$\\exists x\$ such that \$x\$ is Recursive and \$x\$ is Brute-Force.
4. Flawed Conclusion: Some recursive procedures minimize latency.
5. Why it fails: The argument implicitly assumes that the recursive brute-force procedures in Premise 3 are *efficient*, or that failing to conserve memory automatically forces an algorithm to minimize latency. However, a brute-force approach might be entirely inefficient and fail BOTH criteria (wasting memory and suffering high latency).
6. Thus, option (A) correctly identifies the logical fallacy.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q03',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude''',
    questionText: '''What is the remainder when \$3^{2026} + 7^{2026}\$ is divided by 10?''',
    options: ['''2''', '''4''', '''6''', '''8'''],
    correctAnswer: '''D''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Step-by-Step Derivation:
1. We evaluate \$(3^{2026} + 7^{2026}) \\pmod{10}\$.
2. Powers of 3 modulo 10:
   - \$3^1 \\equiv 3\$
   - \$3^2 \\equiv 9 \\equiv -1\$
   - \$3^3 \\equiv 7\$
   - \$3^4 \\equiv 1\$
   The cycle length is 4.
   \$2026 = 4 \\times 506 + 2\$.
   Therefore, \$3^{2026} \\equiv 3^2 \\equiv 9 \\pmod{10}\$.

3. Powers of 7 modulo 10:
   - \$7^1 \\equiv 7\$
   - \$7^2 \\equiv 49 \\equiv 9 \\equiv -1\$
   - \$7^3 \\equiv 3\$
   - \$7^4 \\equiv 1\$
   The cycle length is 4.
   \$2026 = 4 \\times 506 + 2\$.
   Therefore, \$7^{2026} \\equiv 7^2 \\equiv 9 \\pmod{10}\$.

4. Sum:
   \$3^{2026} + 7^{2026} \\equiv 9 + 9 = 18 \\equiv 8 \\pmod{10}\$.
5. Hence, the remainder is 8, corresponding to option (D).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q04',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Spatial Aptitude''',
    questionText: '''A standard six-sided die has numbers 1 to 6 on its faces such that the sum of numbers on any two opposite faces is always 7 (i.e., 1 opposite 6, 2 opposite 5, 3 opposite 4). In a planar T-shaped unfolding (net) of the die, the central vertical column contains four squares labeled from top to bottom as: Face 1, Face 2, Face 6, Face 5. A left wing is attached to Face 2. To form a valid standard die, which number MUST be printed on this left wing?''',
    options: ['''3 or 4''', '''Only 3''', '''Only 4''', '''5'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Spatial Analysis of Die Net:
1. The central vertical strip contains:
   - Row 1: 1
   - Row 2: 2
   - Row 3: 6
   - Row 4: 5
2. In this vertical strip:
   - Row 1 (1) and Row 3 (6) are separated by one square \$\\implies\$ they fold to opposite faces (\$1 + 6 = 7\$). Valid!
   - Row 2 (2) and Row 4 (5) are separated by one square \$\\implies\$ they fold to opposite faces (\$2 + 5 = 7\$). Valid!
3. The remaining two faces that must be on the left and right wings are 3 and 4 (since \$3 + 4 = 7\$).
4. Either 3 can be on the left wing (with 4 on a right wing) or 4 can be on the left wing (with 3 on a right wing), both forming valid standard dice (one being a chiral reflection / orientation of the other, both meeting the standard die property of opposite face sum 7).
5. Hence, the left wing can be either 3 or 4. Option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q05',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude''',
    questionText: '''A commuter walks down a downward-moving escalator and counts 50 steps to reach the bottom. If the commuter walks down the same moving escalator at twice the initial walking speed, 75 steps are counted. How many steps would be visible if the escalator were stationary?''',
    options: ['''100''', '''120''', '''150''', '''175'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Mathematical Derivation:
1. Let \$L\$ be the total number of visible steps when the escalator is stationary.
2. Let \$v_m\$ be the initial walking speed of the commuter (in steps/sec) and \$v_e\$ be the downward speed of the escalator (in steps/sec).
3. In the first scenario:
   - The commuter takes 50 steps at speed \$v_m\$, so the time taken is \$t_1 = \\frac{50}{v_m}\$.
   - During this time \$t_1\$, the escalator moves \$v_e t_1 = 50 \\frac{v_e}{v_m}\$ steps.
   - Total length \$L = 50 + 50 \\frac{v_e}{v_m} = 50\\left(1 + \\frac{v_e}{v_m}\\right)\$.
4. In the second scenario:
   - Walking speed is \$2 v_m\$.
   - The commuter takes 75 steps, so the time taken is \$t_2 = \\frac{75}{2 v_m}\$.
   - During this time \$t_2\$, the escalator moves \$v_e t_2 = \\frac{75}{2} \\frac{v_e}{v_m}\$ steps.
   - Total length \$L = 75 + 37.5 \\frac{v_e}{v_m} = 75\\left(1 + \\frac{v_e}{2 v_m}\\right)\$.
5. Equating the two expressions for \$L\$:
   \$\$50 + 50\\left(\\frac{v_e}{v_m}\\right) = 75 + 37.5\\left(\\frac{v_e}{v_m}\\right)\$\$
   \$\$12.5\\left(\\frac{v_e}{v_m}\\right) = 25 \\implies \\frac{v_e}{v_m} = 2\$\$
6. Substitute \$\\frac{v_e}{v_m} = 2\$ back into \$L\$:
   \$\$L = 50(1 + 2) = 150 \\text{ steps}\$\$
7. Thus, the escalator has 150 steps when stationary. Option (C) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q06',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Permutations & Combinatorics''',
    questionText: '''Eight colleagues consisting of 5 software engineers and 3 project managers are to be seated around a circular conference table with 8 symmetrically arranged chairs. In how many distinct ways can they be seated such that no two project managers sit in adjacent seats?''',
    options: ['''720''', '''1440''', '''2880''', '''5040'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Step-by-Step Combinatorial Derivation:
1. Circular seating of 5 software engineers:
   - Seating 5 distinct persons around a circular table can be done in:
     \$\$(5 - 1)! = 4! = 24 \\text{ ways}\$\$
2. Spaces created for project managers:
   - The 5 seated engineers create exactly 5 distinct non-adjacent spaces between them around the circular perimeter.
3. Placing 3 project managers into these 5 spaces:
   - Choose 3 of the 5 spaces:
     \$\$\\binom{5}{3} = \\frac{5 \\times 4}{2 \\times 1} = 10 \\text{ ways}\$\$
   - Arrange the 3 distinct project managers among these 3 chosen positions:
     \$\$3! = 6 \\text{ ways}\$\$
4. Total distinct seating arrangements:
   \$\$\\text{Total} = 24 \\times 10 \\times 6 = 1440 \\text{ ways}\$\$
5. Therefore, option (B) is the correct answer.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q07',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Data Interpretation''',
    questionText: '''A software enterprise generates revenue from three divisions: Cloud, Security, and AI.
- In Year 1, revenues were ₹120 Lakhs, ₹180 Lakhs, and ₹200 Lakhs with net profit margins of 25%, 15%, and 20%, respectively.
- In Year 2, Cloud revenue increased by 20% while its margin declined to 20%; Security revenue grew by 10% with its margin rising to 20%; AI revenue fell by 10% while its margin expanded to 25%.

What is the percentage change in the total net profit of the enterprise from Year 1 to Year 2?''',
    options: ['''+12.45%''', '''+14.80%''', '''+16.91%''', '''+18.25%'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Detailed Numerical Computation:
1. Year 1 Profits:
   - Cloud Profit: \$120 \\times 0.25 = ₹30.0\\text{ Lakhs}\$
   - Security Profit: \$180 \\times 0.15 = ₹27.0\\text{ Lakhs}\$
   - AI Profit: \$200 \\times 0.20 = ₹40.0\\text{ Lakhs}\$
   - Total Profit in Year 1: \$P_1 = 30.0 + 27.0 + 40.0 = ₹97.0\\text{ Lakhs}\$.

2. Year 2 Revenues and Profits:
   - Cloud:
     Revenue \$= 120 \\times 1.20 = ₹144.0\\text{ Lakhs}\$
     Profit \$= 144.0 \\times 0.20 = ₹28.8\\text{ Lakhs}\$
   - Security:
     Revenue \$= 180 \\times 1.10 = ₹198.0\\text{ Lakhs}\$
     Profit \$= 198.0 \\times 0.20 = ₹39.6\\text{ Lakhs}\$
   - AI:
     Revenue \$= 200 \\times 0.90 = ₹180.0\\text{ Lakhs}\$
     Profit \$= 180.0 \\times 0.25 = ₹45.0\\text{ Lakhs}\$
   - Total Profit in Year 2: \$P_2 = 28.8 + 39.6 + 45.0 = ₹113.4\\text{ Lakhs}\$.

3. Percentage change in total net profit:
   \$\$\\Delta P\\% = \\frac{113.4 - 97.0}{97.0} \\times 100\\% = \\frac{16.4}{97.0} \\times 100\\% \\approx +16.907\\% \\approx +16.91\\%\$\$

4. Hence, option (C) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q08',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Logical Reasoning''',
    questionText: '''Three inhabitants P, Q, and R live on an island where Knights always speak the truth and Knaves always lie. They make the following statements:
- P says: "Exactly two of us are Knights."
- Q says: "P is a Knave."
- R says: "Q and I are of different types (one is a Knight and the other is a Knave)."

Which of the following correctly identifies the types of P, Q, and R?''',
    options: ['''P is a Knight, Q is a Knave, R is a Knight''', '''P is a Knight, Q is a Knight, R is a Knave''', '''P is a Knave, Q is a Knave, R is a Knight''', '''P is a Knave, Q is a Knight, R is a Knave'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Logical Consistency Analysis:
1. Hypothesis 1: Suppose Q is a Knight.
   - Then Q's statement "P is a Knave" is TRUE \$\\implies\$ P is a Knave.
   - Now consider R:
     - If R is a Knight: The Knights are {Q, R}, meaning there are exactly two Knights. Then P's statement "Exactly two of us are Knights" is TRUE. But P is a Knave, which contradicts P speaking truth!
     - If R is a Knave: R says "Q and I are of different types". Since Q is Knight and R is Knave, they ARE different types \$\\implies\$ R's statement is true. But R is a Knave and cannot speak truth! Contradiction.
   - Therefore, Hypothesis 1 is impossible. Q CANNOT be a Knight.

2. Q MUST be a Knave.
   - Since Q is a Knave, Q's statement "P is a Knave" is FALSE \$\\implies\$ P is a Knight!
   - Since P is a Knight, P's statement is TRUE \$\\implies\$ "Exactly two of us are Knights."
   - We already know P is a Knight and Q is a Knave. For there to be exactly two Knights, R MUST be a Knight!

3. Verify R's statement:
   - R is a Knight, so R's statement must be true.
   - R says: "Q and I are of different types."
   - Since Q is a Knave and R is a Knight, they are indeed of different types! True!
   - Everything is perfectly consistent.

4. Conclusion: P is a Knight, Q is a Knave, R is a Knight. Option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q09',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Geometry & Mensuration''',
    questionText: '''Two parallel chords \$AB\$ and \$CD\$ of lengths 12 cm and 16 cm, respectively, are drawn inside a circle of radius 10 cm on the SAME side of the center. What is the perpendicular distance between these two chords?''',
    options: ['''1 cm''', '''2 cm''', '''4 cm''', '''6 cm'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Geometric Calculation:
1. Let \$O\$ be the center of the circle with radius \$R = 10\\text{ cm}\$.
2. The perpendicular from \$O\$ to any chord bisects the chord.
3. For chord \$AB\$ (length 12 cm):
   - Half-length \$= 12 / 2 = 6\\text{ cm}\$.
   - Perpendicular distance from \$O\$ to \$AB\$:
     \$\$d_1 = \\sqrt{R^2 - 6^2} = \\sqrt{10^2 - 6^2} = \\sqrt{100 - 36} = \\sqrt{64} = 8\\text{ cm}\$\$
4. For chord \$CD\$ (length 16 cm):
   - Half-length \$= 16 / 2 = 8\\text{ cm}\$.
   - Perpendicular distance from \$O\$ to \$CD\$:
     \$\$d_2 = \\sqrt{R^2 - 8^2} = \\sqrt{10^2 - 8^2} = \\sqrt{100 - 64} = \\sqrt{36} = 6\\text{ cm}\$\$
5. Since both chords lie on the SAME side of the center, the distance between them is:
   \$\$\\Delta d = |d_1 - d_2| = |8 - 6| = 2\\text{ cm}\$\$
6. Hence, option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q10',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Verbal Reasoning''',
    questionText: '''Read the passage below and answer the question:

"The widespread adoption of autonomous compilation and synthesis engines has shifted software engineering from manual syntax construction to declarative specification. However, this abstraction layer comes with an epistemic hazard: when engineers no longer interact with the lower-level representations, their mental models degrade, rendering them incapable of diagnosing anomalous behavior arising from edge-case synthesis failures."

Which of the following assertions is most strongly supported by the passage?''',
    options: ['''Declarative specifications inevitably introduce more edge-case compiler defects than imperative programming.''', '''Manual syntax construction is the only reliable methodology for preventing anomalous software behaviors.''', '''Higher abstraction layers can obscure underlying system mechanics, weakening practitioners' troubleshooting efficacy.''', '''Autonomous compilation tools must be dismantled in mission-critical environments to restore developer mental models.'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Critical Reading Analysis:
1. Option (A) is an overreach; the text does not state declarative specifications introduce *more* compiler defects.
2. Option (B) is an extreme claim ("only reliable methodology") that contradicts the balanced tone of the passage.
3. Option (C) captures the exact essence: the passage states "when engineers no longer interact with the lower-level representations, their mental models degrade, rendering them incapable of diagnosing anomalous behavior". That is directly equivalent to higher abstractions obscuring lower mechanics and weakening troubleshooting efficacy.
4. Option (D) suggests extreme policy ("must be dismantled") which is never proposed by the author.
5. Therefore, option (C) is the only fully supported conclusion.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q11',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Graph Theory''',
    questionText: '''Let \$G = (V, E)\$ be a connected simple planar graph with \$V \\ge 4\$ vertices and \$E\$ edges. If the length of the shortest cycle (girth) in \$G\$ is at least 4, which of the following upper bounds on the number of edges \$E\$ ALWAYS holds?''',
    options: ['''\$E \\le 3V - 6\$''', '''\$E \\le 2V - 4\$''', '''\$E \\le \\frac{3}{2}V - 3\$''', '''\$E \\le V - 1\$'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Derivation of Planar Graph Edge Bound with Girth \$\\ge 4\$:
1. Let \$F\$ be the number of faces (regions) in a planar embedding of \$G\$.
2. Since the girth is at least 4, every face must be bounded by at least 4 edges.
3. Summing edge incidences across all faces:
   \$\$\\sum_{i=1}^F \\text{deg}(f_i) = 2E\$\$
   Since \$\\text{deg}(f_i) \\ge 4\$ for every face:
   \$\$2E \\ge 4F \\implies F \\le \\frac{E}{2}\$\$
4. From Euler's formula for connected planar graphs:
   \$\$V - E + F = 2\$\$
   Substitute \$F \\le \\frac{E}{2}\$:
   \$\$2 = V - E + F \\le V - E + \\frac{E}{2} = V - \\frac{E}{2}\$\$
   \$\$2 \\le V - \\frac{E}{2} \\implies \\frac{E}{2} \\le V - 2 \\implies E \\le 2V - 4\$\$
5. Thus, \$E \\le 2V - 4\$ is the tight upper bound. Option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q12',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Recurrence Relations''',
    questionText: '''Consider the second-order linear homogeneous recurrence relation:
\$\$a_n - 5a_{n-1} + 6a_{n-2} = 0 \\quad \\text{for } n \\ge 2\$\$
with boundary conditions \$a_0 = 1\$ and \$a_1 = 4\$. What is the closed-form expression for \$a_n\$?''',
    options: ['''\$a_n = 3 \\cdot 2^n - 2 \\cdot 3^n\$''', '''\$a_n = 2 \\cdot 3^n - 2^n\$''', '''\$a_n = 3^n + 2^n\$''', '''\$a_n = 4 \\cdot 3^{n-1} - 2^n\$'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Step-by-Step Solution:
1. Characteristic equation:
   \$\$r^2 - 5r + 6 = 0 \\implies (r - 2)(r - 3) = 0\$\$
   Roots are \$r_1 = 2\$ and \$r_2 = 3\$.
2. General solution:
   \$\$a_n = c_1 \\cdot 2^n + c_2 \\cdot 3^n\$\$
3. Apply initial conditions:
   - For \$n = 0\$: \$a_0 = c_1 + c_2 = 1 \\implies c_1 = 1 - c_2\$.
   - For \$n = 1\$: \$a_1 = 2c_1 + 3c_2 = 4\$.
   \$\$2(1 - c_2) + 3c_2 = 4 \\implies 2 - 2c_2 + 3c_2 = 4 \\implies c_2 = 2\$\$
   \$\$c_1 = 1 - 2 = -1\$\$
4. Closed form:
   \$\$a_n = (-1) \\cdot 2^n + 2 \\cdot 3^n = 2 \\cdot 3^n - 2^n\$\$
5. Verification:
   - \$a_0 = 2(1) - 1 = 1\$ (matches)
   - \$a_1 = 2(3) - 2 = 4\$ (matches)
   - \$a_2 = 2(9) - 4 = 14\$; check recurrence: \$5(4) - 6(1) = 14\$ (matches).
6. Hence, option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q13',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Cayley-Hamilton Theorem''',
    questionText: '''Let \$A = \\begin{pmatrix} 1 & 2 \\\\ 0 & 3 \\end{pmatrix}\$. Using the Cayley-Hamilton Theorem, express \$A^3\$ as a linear combination of \$A\$ and the identity matrix \$I\$.''',
    options: ['''\$12A - 13I\$''', '''\$13A - 12I\$''', '''\$15A - 14I\$''', '''\$9A - 8I\$'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Application of Cayley-Hamilton Theorem:
1. The characteristic polynomial of \$A\$:
   \$\$p(\\lambda) = \\det(A - \\lambda I) = (1 - \\lambda)(3 - \\lambda) - 0 = \\lambda^2 - 4\\lambda + 3\$\$
2. By the Cayley-Hamilton Theorem, every square matrix satisfies its own characteristic equation:
   \$\$A^2 - 4A + 3I = 0 \\implies A^2 = 4A - 3I\$\$
3. Multiply both sides by \$A\$:
   \$\$A^3 = 4A^2 - 3A\$\$
4. Substitute \$A^2 = 4A - 3I\$:
   \$\$A^3 = 4(4A - 3I) - 3A = 16A - 12I - 3A = 13A - 12I\$\$
5. Therefore, \$A^3 = 13A - 12I\$. Option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q14',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Limits & Taylor Series''',
    questionText: '''Evaluate the following limit:
\$\$\\lim_{x \\to 0} \\frac{\\cos x - 1 + \\frac{x^2}{2}}{x^4}\$\$''',
    options: ['''\$0\$''', '''\$\\frac{1}{12}\$''', '''\$\\frac{1}{24}\$''', '''\$\\frac{1}{48}\$'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Taylor Series Expansion Method:
1. The Maclaurin series expansion of \$\\cos x\$:
   \$\$\\cos x = 1 - \\frac{x^2}{2!} + \\frac{x^4}{4!} - \\frac{x^6}{6!} + \\dots = 1 - \\frac{x^2}{2} + \\frac{x^4}{24} - \\frac{x^6}{720} + \\dots\$\$
2. Substitute into the numerator:
   \$\$\\cos x - 1 + \\frac{x^2}{2} = \\left(1 - \\frac{x^2}{2} + \\frac{x^4}{24} - \\dots\\right) - 1 + \\frac{x^2}{2} = \\frac{x^4}{24} - O(x^6)\$\$
3. Divide by \$x^4\$:
   \$\$\\lim_{x \\to 0} \\frac{\\frac{x^4}{24} - O(x^6)}{x^4} = \\lim_{x \\to 0} \\left(\\frac{1}{24} - O(x^2)\\right) = \\frac{1}{24}\$\$
4. Hence, option (C) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q15',
    year: 2026,
    subject: '''Probability & Statistics''',
    topic: '''Bayes' Theorem''',
    questionText: '''In a large software codebase, 1% of functions contain a critical vulnerability (\$P(V) = 0.01\$). A static security analyzer flags vulnerable functions with a sensitivity of 95% (\$P(+|V) = 0.95\$) and has a false positive rate of 5% (\$P(+|V^c) = 0.05\$). If a randomly selected function is flagged as vulnerable by the analyzer, what is the exact probability that it genuinely contains the vulnerability?''',
    options: ['''\$\\frac{19}{118}\$''', '''\$\\frac{19}{20}\$''', '''\$\\frac{1}{2}\$''', '''\$\\frac{5}{99}\$'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Bayes' Theorem Calculation:
1. Given parameters:
   - \$P(V) = 0.01 \\implies P(V^c) = 0.99\$
   - \$P(+|V) = 0.95\$
   - \$P(+|V^c) = 0.05\$
2. Total probability of flagging positive \$P(+)\$:
   \$\$P(+) = P(+|V)P(V) + P(+|V^c)P(V^c)\$\$
   \$\$P(+) = (0.95)(0.01) + (0.05)(0.99) = 0.0095 + 0.0495 = 0.0590\$\$
3. By Bayes' Theorem:
   \$\$P(V|+) = \\frac{P(+|V)P(V)}{P(+)} = \\frac{0.0095}{0.0590} = \\frac{95}{590} = \\frac{19}{118}\$\$
   \$\$\\frac{19}{118} \\approx 0.1610 \\quad (16.10\\%)\$\$
4. Hence, option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q16',
    year: 2026,
    subject: '''Digital Logic''',
    topic: '''Multiplexers''',
    questionText: '''What is the minimum number of 2-to-1 multiplexers required to implement a 2-input XOR gate (\$Y = A \\oplus B\$), assuming that only uncomplemented variables \$A, B\$ and constant logic levels '0' and '1' are available as inputs?''',
    options: ['''1''', '''2''', '''3''', '''4'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Multiplexer Realization Analysis:
1. A standard 2-to-1 MUX produces the output:
   \$\$Y = \\overline{S} \\cdot I_0 + S \\cdot I_1\$\$
2. For an XOR gate:
   \$\$Y = A \\oplus B = \\overline{A} B + A \\overline{B}\$\$
3. If we select \$S = A\$:
   \$\$Y = \\overline{A} I_0 + A I_1\$\$
   Comparing with \$A \\oplus B\$, we require \$I_0 = B\$ and \$I_1 = \\overline{B}\$.
4. Since complemented variables are not directly available, \$\\overline{B}\$ must be generated using another 2-to-1 MUX:
   - For an inverter MUX: set select \$S = B\$, data input \$I_0 = 1\$, and \$I_1 = 0\$.
   - Output: \$\\overline{B} \\cdot 1 + B \\cdot 0 = \\overline{B}\$.
5. Therefore, exactly 2 MUXes are required:
   - MUX 1 generates \$\\overline{B}\$.
   - MUX 2 selects between \$B\$ and \$\\overline{B}\$ using \$A\$.
6. Thus, minimum number of 2-to-1 MUXes is 2. Option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q17',
    year: 2026,
    subject: '''Digital Logic''',
    topic: '''Flip-Flops''',
    questionText: '''To construct a toggle (T) flip-flop using an existing JK flip-flop, how should the inputs \$J\$ and \$K\$ be driven with respect to the input \$T\$?''',
    options: ['''\$J = T, \\, K = \\overline{T}\$''', '''\$J = \\overline{T}, \\, K = T\$''', '''\$J = K = T\$''', '''\$J = K = \\overline{T}\$'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Flip-Flop Conversion:
1. Characteristic equation of a JK flip-flop:
   \$\$Q_{next} = J \\overline{Q} + \\overline{K} Q\$\$
2. Characteristic equation of a T flip-flop:
   \$\$Q_{next} = T \\oplus Q = T \\overline{Q} + \\overline{T} Q\$\$
3. Equating corresponding terms:
   - Coefficient of \$\\overline{Q}\$: \$J = T\$
   - Coefficient of \$Q\$: \$\\overline{K} = \\overline{T} \\implies K = T\$
4. Thus, tying both \$J\$ and \$K\$ together to the input \$T\$ (\$J = K = T\$) implements the T flip-flop behavior:
   - When \$T = 0\$, \$J = K = 0 \\implies Q_{next} = Q\$ (no change).
   - When \$T = 1\$, \$J = K = 1 \\implies Q_{next} = \\overline{Q}\$ (toggle).
5. Hence, option (C) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q18',
    year: 2026,
    subject: '''Computer Organization and Architecture''',
    topic: '''Pipelining Hazards''',
    questionText: '''Consider a standard 5-stage instruction pipeline consisting of IF, ID, EX, MEM, and WB stages. Operand forwarding is NOT supported. Register file writes take place during the first half of the clock cycle, and register file reads take place during the second half. If instruction \$I_1\$ writes to register \$R_1\$ in the WB stage and instruction \$I_2\$ immediately reads \$R_1\$ in its ID stage, how many pipeline stall cycles must be introduced?''',
    options: ['''1 stall cycle''', '''2 stall cycles''', '''3 stall cycles''', '''4 stall cycles'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Pipeline Cycle Timeline:
1. Instruction \$I_1\$ progression:
   - Cycle 1: IF
   - Cycle 2: ID
   - Cycle 3: EX
   - Cycle 4: MEM
   - Cycle 5: WB (writes to register \$R_1\$ in the first half of Cycle 5).
2. Instruction \$I_2\$ dependency:
   - \$I_2\$ needs the updated value of \$R_1\$ in its ID stage.
   - Because the register file is split-phase (write in first half, read in second half), \$I_2\$ can execute its ID stage in Cycle 5 and read the updated \$R_1\$.
3. When should \$I_2\$ enter the pipeline?
   - If \$I_2\$'s ID stage is in Cycle 5, then \$I_2\$'s IF stage must finish in Cycle 4 (or be delayed).
   - Normal progression without hazards:
     - Cycle 1: \$I_1\$ IF
     - Cycle 2: \$I_1\$ ID, \$I_2\$ IF
     - Cycle 3: \$I_1\$ EX, \$I_2\$ ID (hazard! \$R_1\$ not ready).
   - Therefore, \$I_2\$'s ID stage is stalled during Cycle 3 and Cycle 4.
   - Total stall cycles inserted = 2 cycles.
   - In Cycle 5, \$I_2\$ executes ID and reads \$R_1\$ validly.
4. Hence, 2 stall cycles are required. Option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q19',
    year: 2026,
    subject: '''Computer Organization and Architecture''',
    topic: '''Memory Hierarchy''',
    questionText: '''A computer system incorporates a two-level cache hierarchy (L1 and L2) connected to main memory. The system parameters are:
- L1 Cache: Hit latency = 2 ns, Hit rate = 90%
- L2 Cache: Hit latency = 10 ns, Local hit rate = 80%
- Main Memory: Access latency = 100 ns

What is the Effective Memory Access Time (EMAT) of this system?''',
    options: ['''4.2 ns''', '''5.0 ns''', '''6.4 ns''', '''8.0 ns'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''EMAT Formula with Hierarchical Cache:
1. Formula:
   \$\$\\text{EMAT} = T_{L1} + (1 - H_{L1}) \\times [T_{L2} + (1 - H_{L2}) \\times T_{MM}]\$\$
2. Given values:
   - \$T_{L1} = 2\\text{ ns}\$, \$H_{L1} = 0.90 \\implies (1 - H_{L1}) = 0.10\$
   - \$T_{L2} = 10\\text{ ns}\$, \$H_{L2} = 0.80 \\implies (1 - H_{L2}) = 0.20\$
   - \$T_{MM} = 100\\text{ ns}\$
3. Penalty for missing L1:
   \$\$\\text{L1 Miss Penalty} = T_{L2} + (1 - H_{L2}) \\times T_{MM} = 10 + (0.20 \\times 100) = 10 + 20 = 30\\text{ ns}\$\$
4. Overall EMAT:
   \$\$\\text{EMAT} = 2 + 0.10 \\times 30 = 2 + 3 = 5.0\\text{ ns}\$\$
5. Hence, option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q20',
    year: 2026,
    subject: '''Programming in C''',
    topic: '''Pointers & Operator Precedence''',
    questionText: '''Consider the following C program:

```c
#include <stdio.h>
int main() {
    int arr[] = {10, 20, 30, 40, 50};
    int *ptr = arr;
    int x = *ptr++;
    int y = *++ptr;
    int z = ++*ptr;
    printf("%d %d %d", x, y, z);
    return 0;
}
```
What is the printed output of the program?''',
    options: ['''10 20 21''', '''10 30 31''', '''20 30 31''', '''10 30 30'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Step-by-Step Pointer Execution Trace:
1. `int arr[] = {10, 20, 30, 40, 50};`
   - `arr[0]=10, arr[1]=20, arr[2]=30, arr[3]=40, arr[4]=50`.
   - `ptr` initially points to `arr[0]`.

2. `int x = *ptr++;`
   - Postfix `++` has higher precedence than `*`.
   - The expression `ptr++` increments `ptr` to point to `arr[1]`, but evaluates to the original pointer (pointing to `arr[0]`).
   - Dereferencing yields `*arr[0] = 10`.
   - Thus, `x = 10`.
   - After this line, `ptr` points to `arr[1]`.

3. `int y = *++ptr;`
   - Prefix `++` increments `ptr` first: `ptr` now points to `arr[2]`.
   - Dereferencing yields `*arr[2] = 30`.
   - Thus, `y = 30`.
   - After this line, `ptr` points to `arr[2]`.

4. `int z = ++*ptr;`
   - Both `++` (prefix) and `*` are right-to-left unary operators.
   - `*ptr` is evaluated first, which is `arr[2]` (value 30).
   - Then prefix `++` increments the value stored in `arr[2]` from 30 to 31.
   - Thus, `arr[2]` becomes 31, and `z = 31`.

5. Print statement:
   `printf("%d %d %d", x, y, z);` prints `10 30 31`.
6. Therefore, option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q21',
    year: 2026,
    subject: '''Data Structures''',
    topic: '''Binary Search Trees''',
    questionText: '''The preorder traversal sequence of a Binary Search Tree (BST) is:
\$\$40, \\, 20, \\, 10, \\, 30, \\, 25, \\, 35, \\, 60, \\, 50, \\, 70\$\$
What is the postorder traversal sequence of this tree?''',
    options: ['''10, 25, 30, 35, 20, 50, 70, 60, 40''', '''10, 25, 35, 30, 20, 50, 70, 60, 40''', '''10, 20, 25, 35, 30, 50, 60, 70, 40''', '''25, 35, 30, 10, 20, 50, 70, 60, 40'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''BST Reconstruction and Traversal Trace:
1. In a BST, all elements in the left subtree are smaller than the root, and all elements in the right subtree are larger than the root.
2. Given Preorder: \$40, 20, 10, 30, 25, 35, 60, 50, 70\$.
   - Root is 40.
   - Left subtree keys (\$< 40\$): \$20, 10, 30, 25, 35\$.
   - Right subtree keys (\$> 40\$): \$60, 50, 70\$.

3. Reconstructing Left Subtree (Preorder: \$20, 10, 30, 25, 35\$):
   - Root is 20.
   - Left child (\$< 20\$): 10.
   - Right subtree (\$> 20\$): \$30, 25, 35\$.
     - Root is 30. Left child (\$< 30\$): 25. Right child (\$> 30\$): 35.

4. Reconstructing Right Subtree (Preorder: \$60, 50, 70\$):
   - Root is 60.
   - Left child (\$< 60\$): 50.
   - Right child (\$> 60\$): 70.

5. Postorder Traversal (Left, Right, Root):
   - Left subtree of 30: 25. Right subtree: 35. Root: 30 \$\\implies 25, 35, 30\$.
   - Left subtree of 20: 10. Right subtree: \$25, 35, 30\$. Root: 20 \$\\implies 10, 25, 35, 30, 20\$.
   - Subtree 60: Left 50, Right 70, Root 60 \$\\implies 50, 70, 60\$.
   - Overall Tree: Left subtree, Right subtree, Root:
     \$\$10, 25, 35, 30, 20, 50, 70, 60, 40\$\$

6. Hence, option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q22',
    year: 2026,
    subject: '''Data Structures''',
    topic: '''AVL Trees''',
    questionText: '''The following keys are inserted into an initially empty AVL tree in the given order:
\$\$15, \\, 20, \\, 24, \\, 10, \\, 13, \\, 7, \\, 30, \\, 36, \\, 25\$\$
Assuming standard AVL balancing rules where balance factor is defined as \$\\text{height}(\\text{left}) - \\text{height}(\\text{right})\$, what is the balance factor of the root node of the resulting AVL tree?''',
    options: ['''-1''', '''0''', '''+1''', '''+2'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Step-by-Step AVL Insertion Trace:
1. Insert 15: root is 15.
2. Insert 20: 15 has right child 20.
3. Insert 24: 15 -> 20 -> 24 (RR violation at 15).
   - Left rotation at 15 \$\\implies\$ 20 becomes root, left child 15, right child 24.
4. Insert 10: 20 -> left 15 -> left 10.
5. Insert 13: 20 -> left 15 -> left 10 -> right 13 (LR violation at 15).
   - Left-Right double rotation at 15: 13 becomes left child of 20, with left 10 and right 15.
   - Tree: Root 20; Left child 13 (left 10, right 15); Right child 24.
6. Insert 7: 20 -> left 13 -> left 10 -> left 7 (LL violation at root 20: left height 3, right height 1).
   - Right rotation at root 20: 13 becomes new root!
   - Left child of 13 is 10 (with left child 7).
   - Right child of 13 is 20 (with left 15, right 24).
7. Insert 30: 20 -> right 24 -> right 30.
8. Insert 36: 24 -> right 30 -> right 36 (RR violation at 24).
   - Left rotation at 24: 30 becomes right child of 20, with left 24 and right 36.
9. Insert 25: 30 -> left 24 -> right 25 (RL violation at 20: right child 30 is left-heavy).
   - Right-Left double rotation at 20: 24 moves up to replace 20 as right child of 13, having left 20 (left 15, right nil) and right 30 (left 25, right 36).
10. Final Tree Analysis:
    - Root is 13.
    - Left subtree of 13 has root 10 and left child 7 \$\\implies \\text{height} = 2\$.
    - Right subtree of 13 has root 24, which has height 3 (via \$24 \\to 30 \\to 25\$).
    - Balance factor of root \$= \\text{height}(\\text{left}) - \\text{height}(\\text{right}) = 2 - 3 = -1\$.
11. Hence, option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q23',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Asymptotic Analysis''',
    questionText: '''Consider the recurrence relation:
\$\$T(n) = 2 T(\\sqrt{n}) + \\log n \\quad \\text{for } n > 2\$\$
with base case \$T(2) = 1\$. What is the asymptotic time complexity of \$T(n)\$?''',
    options: ['''\$\\Theta(\\log n)\$''', '''\$\\Theta(\\log n \\log \\log n)\$''', '''\$\\Theta((\\log n)^2)\$''', '''\$\\Theta(\\sqrt{n})\$'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Domain Transformation Method:
1. Let \$n = 2^m\$, so that \$m = \\log_2 n\$.
2. Then \$\\sqrt{n} = (2^m)^{1/2} = 2^{m/2}\$.
3. Rewrite the recurrence in terms of \$m\$:
   \$\$T(2^m) = 2 T(2^{m/2}) + m\$\$
4. Define a new function \$S(m) = T(2^m)\$:
   \$\$S(m) = 2 S(m/2) + m\$\$
5. Apply the Master Theorem to \$S(m)\$:
   - Here \$a = 2, b = 2, f(m) = m\$.
   - \$m^{\\log_b a} = m^{\\log_2 2} = m^1 = m\$.
   - Since \$f(m) = \\Theta(m^{\\log_b a})\$, this corresponds to Case 2 of the Master Theorem.
   - Therefore:
     \$\$S(m) = \\Theta(m \\log_2 m)\$\$
6. Substitute back \$m = \\log_2 n\$:
   \$\$T(n) = S(\\log_2 n) = \\Theta(\\log n \\log \\log n)\$\$
7. Thus, option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q24',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Minimum Spanning Trees''',
    questionText: '''Let \$G = (V, E)\$ be a connected, undirected graph where all edge weights are distinct and strictly positive. Which of the following statements is ALWAYS TRUE?''',
    options: ['''If \$e\$ is the unique heaviest edge on any simple cycle \$C\$ in \$G\$, then \$e\$ cannot belong to any Minimum Spanning Tree of \$G\$.''', '''If \$e\$ is the unique lightest edge crossing a cut \$(S, V \\setminus S)\$, then \$e\$ must belong to every cycle in \$G\$.''', '''The shortest path between any pair of vertices in \$G\$ consists solely of edges that belong to the Minimum Spanning Tree of \$G\$.''', '''If a positive constant \$c > 0\$ is added to every edge weight in \$G\$, the shortest path between any two vertices remains identical.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Analysis of Graph Properties:
1. Option (A) is the fundamental Cycle Property of Minimum Spanning Trees: In any cycle \$C\$, if an edge \$e\$ has weight strictly greater than all other edges in \$C\$, removing \$e\$ from any spanning tree containing it and replacing it with another edge from \$C\$ yields a spanning tree of strictly smaller weight. Thus, \$e\$ cannot belong to any MST. Since edge weights are distinct, the MST is unique, and \$e\$ is definitely excluded. (A is TRUE).
2. Option (B) is false: An edge crossing a cut need not belong to any cycle at all (it could be a bridge).
3. Option (C) is false: The shortest path between two vertices often utilizes non-tree edges with low weights rather than routing through the MST.
4. Option (D) is false: Adding a positive constant penalizes paths with a larger number of edges more heavily, potentially altering the shortest path.
5. Hence, option (A) is the correct answer.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q25',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''Myhill-Nerode Theorem''',
    questionText: '''Let \$L \\subseteq \\{0, 1\\}^*\$ be the regular language consisting of all binary strings that represent a non-negative integer divisible by 5 (with the empty string \$\\epsilon\$ representing 0). How many distinct equivalence classes does the Myhill-Nerode equivalence relation \$R_L\$ have?''',
    options: ['''3''', '''4''', '''5''', '''6'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Myhill-Nerode Theorem Application:
1. By the Myhill-Nerode theorem, the number of equivalence classes of \$R_L\$ is equal to the number of states in the unique minimal Deterministic Finite Automaton (DFA) accepting \$L\$.
2. For binary strings interpreted as numbers:
   - When a new bit \$b \\in \\{0, 1\\}\$ is appended to a binary string evaluating to \$v\$, the new value is \$2v + b\$.
   - Modulo 5, the state transitions are:
     \$\$q_{next} = (2q + b) \\pmod 5\$\$
   - The possible remainders modulo 5 are \$\\{0, 1, 2, 3, 4\\}\$.
3. All 5 remainder states are reachable from the start state (0) and are pairwise distinguishable:
   - For example, for any two states \$r_1 \\ne r_2\$, one can append an appropriate sequence of bits such that one reaches remainder 0 (accepted) while the other does not.
4. Therefore, the minimal DFA has exactly 5 states, which means there are exactly 5 equivalence classes.
5. Hence, option (C) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q26',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''Chomsky Hierarchy & Closure Properties''',
    questionText: '''Which of the following statements regarding the closure properties of formal language classes is TRUE?''',
    options: ['''Deterministic Context-Free Languages (DCFLs) are closed under complementation, but NOT closed under union.''', '''Context-Free Languages (CFLs) are closed under intersection.''', '''Context-Sensitive Languages (CSLs) are NOT closed under complementation.''', '''Recursively Enumerable (RE) languages are closed under complementation.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Closure Property Verification:
1. Option (A): DCFLs are accepted by Deterministic Pushdown Automata (DPDAs). Since a DPDA can be made to halt on all inputs, complementation can be performed by interchanging final and non-final states (with appropriate handling of \$\\epsilon\$-loops). Thus DCFLs ARE closed under complementation. However, they are NOT closed under union (since closure under union and complementation would imply closure under intersection, but \$L_1 = \\{a^n b^n c^m\\}\$ and \$L_2 = \\{a^m b^n c^n\\}\$ are DCFLs whose intersection is not even CFL). Thus (A) is TRUE.
2. Option (B): CFLs are NOT closed under intersection (e.g., \$\\{a^n b^n c^m\\} \\cap \\{a^m b^n c^n\\} = \\{a^n b^n c^n\\}\$).
3. Option (C): CSLs ARE closed under complementation by the celebrated Immerman–Szelepcsényi theorem (NSPACE(\$n\$) is closed under complement).
4. Option (D): RE languages are NOT closed under complementation (complement of the Halting Problem is not RE).
5. Hence, option (A) is the correct answer.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q27',
    year: 2026,
    subject: '''Compiler Design''',
    topic: '''FIRST and FOLLOW Sets''',
    questionText: '''Consider the context-free grammar with start symbol \$S\$:
\$\$S \\to A B\$\$
\$\$A \\to a A \\mid \\epsilon\$\$
\$\$B \\to b \\mid c\$\$
What is the set \$\\text{FOLLOW}(A)\$?''',
    options: ['''\\{b, c\\}''', '''\\{b, c, \\\$\\}''', '''\\{a, b, c\\}''', '''\\{\\\$\\}'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Computation of FIRST and FOLLOW:
1. FIRST sets:
   - \$\\text{FIRST}(B) = \\{b, c\\}\$
   - \$\\text{FIRST}(A) = \\{a, \\epsilon\\}\$
2. FOLLOW sets:
   - For \$S\$: \$\\text{FOLLOW}(S) = \\{\\\$\\}\$.
   - In production \$S \\to A B\$:
     \$\$\\text{FOLLOW}(A) \\supseteq \\text{FIRST}(B)\$\$
     Since \$\\text{FIRST}(B) = \\{b, c\\}\$ does NOT contain \$\\epsilon\$, nothing else is added from \$\\text{FOLLOW}(S)\$.
   - In production \$A \\to a A\$:
     \$\\text{FOLLOW}(A) \\supseteq \\text{FOLLOW}(A)\$ (adds nothing new).
3. Therefore:
   \$\$\\text{FOLLOW}(A) = \\{b, c\\}\$\$
4. Hence, option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q28',
    year: 2026,
    subject: '''Compiler Design''',
    topic: '''DAG Representation of Basic Blocks''',
    questionText: '''In the intermediate code generation and local optimization phase of a compiler, constructing a Directed Acyclic Graph (DAG) for a basic block directly facilitates which of the following optimizations?''',
    options: ['''Detection and elimination of local common subexpressions and dead code within the block''', '''Loop unrolling and software pipelining across basic blocks''', '''Inter-procedural register allocation across call boundaries''', '''Global code hoisting out of nested loops'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''DAG Optimization Capabilities:
1. A DAG (Directed Acyclic Graph) for a basic block is constructed by creating a node for each initial value of variables and for each operator applied to existing nodes.
2. If an operation \$y \\text{ op } z\$ is encountered and an identical operation node with the same children already exists, the existing node is reused rather than creating a duplicate node. This directly identifies and eliminates local common subexpressions.
3. Furthermore, root nodes with no parents whose values are not live on exit from the block can be deleted, directly performing dead code elimination.
4. Loop optimizations, inter-procedural allocation, and global code hoisting require control-flow graph (CFG) analysis across multiple blocks, not a single basic-block DAG.
5. Thus, option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q29',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''CPU Scheduling''',
    questionText: '''Three processes \$P_1, P_2, P_3\$ arrive at times 0, 1, and 2 ms with CPU burst times of 6, 4, and 2 ms, respectively. The operating system employs preemptive Shortest Remaining Time First (SRTF) scheduling. What is the average waiting time of the processes?''',
    options: ['''2.00 ms''', '''2.67 ms''', '''3.33 ms''', '''4.00 ms'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''SRTF Gantt Chart and Metric Calculation:
1. Timeline trace:
   - At \$t = 0\$: Only \$P_1\$ has arrived (remaining burst = 6). \$P_1\$ executes.
   - At \$t = 1\$: \$P_2\$ arrives with burst 4. \$P_1\$'s remaining burst is 5. Since \$4 < 5\$, \$P_2\$ preempts \$P_1\$.
   - At \$t = 2\$: \$P_3\$ arrives with burst 2. \$P_2\$'s remaining burst is 3. Since \$2 < 3\$, \$P_3\$ preempts \$P_2\$.
   - \$P_3\$ executes from \$t = 2\$ to \$t = 4\$ and completes at \$t = 4\$.
   - At \$t = 4\$: Ready processes are \$P_2\$ (remaining 3) and \$P_1\$ (remaining 5). \$P_2\$ has the shortest remaining time.
   - \$P_2\$ executes from \$t = 4\$ to \$t = 7\$ and completes at \$t = 7\$.
   - At \$t = 7\$: \$P_1\$ resumes with remaining burst 5 and runs until \$t = 12\$, completing at \$t = 12\$.

2. Completion and Waiting Times:
   - Completion Times (\$C_i\$): \$P_1 = 12, P_2 = 7, P_3 = 4\$.
   - Turnaround Times (\$TAT_i = C_i - \\text{Arrival}_i\$):
     - \$P_1: 12 - 0 = 12\$
     - \$P_2: 7 - 1 = 6\$
     - \$P_3: 4 - 2 = 2\$
   - Waiting Times (\$W_i = TAT_i - \\text{Burst}_i\$):
     - \$P_1: 12 - 6 = 6\\text{ ms}\$
     - \$P_2: 6 - 4 = 2\\text{ ms}\$
     - \$P_3: 2 - 2 = 0\\text{ ms}\$

3. Average Waiting Time:
   \$\$\\text{Average Waiting Time} = \\frac{6 + 2 + 0}{3} = \\frac{8}{3} \\approx 2.67\\text{ ms}\$\$
4. Hence, option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q30',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''Deadlock Prevention''',
    questionText: '''Which of Coffman's four necessary conditions for deadlock is invalidated if an operating system protocol mandates that every process must request and receive all of its required resources simultaneously prior to commencing execution?''',
    options: ['''Mutual Exclusion''', '''Hold and Wait''', '''No Preemption''', '''Circular Wait'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Deadlock Prevention Protocols:
1. The four Coffman conditions necessary for deadlock are:
   - Mutual Exclusion
   - Hold and Wait
   - No Preemption
   - Circular Wait
2. The "Hold and Wait" condition requires that a process must be holding at least one resource while waiting to acquire additional resources that are currently being held by other processes.
3. If a protocol forces a process to request all its resources at once before starting (and allocates them only if all are available simultaneously), the process will never hold resources while waiting for others.
4. Hence, this protocol directly eliminates the "Hold and Wait" condition. Option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q31',
    year: 2026,
    subject: '''Databases''',
    topic: '''Relational Algebra''',
    questionText: '''Let relations \$R(A, B)\$ and \$S(B, C)\$ be given with common attribute \$B\$. Which of the following relational algebra expressions is NOT equivalent to the natural join \$R \\bowtie S\$?''',
    options: ['''\$\\pi_{R.A, R.B, S.C}(\\sigma_{R.B = S.B}(R \\times S))\$''', '''\$\\sigma_{R.B = S.B}(R \\times S)\$''', '''\$\\pi_{R.A, R.B, S.C}(R \\bowtie_{R.B = S.B} S)\$''', '''\$\\pi_{R.A, R.B, S.C}((R \\times S) - \\sigma_{R.B \\ne S.B}(R \\times S))\$'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Relational Algebra Schema Comparison:
1. The natural join \$R \\bowtie S\$ combines tuples on matching \$R.B = S.B\$ and projects out the redundant duplicate join attribute, yielding a relation with schema \$(A, B, C)\$ (3 attributes).
2. Option (B), \$\\sigma_{R.B = S.B}(R \\times S)\$, performs a cross-product and selects matching tuples, but does NOT project out the duplicate column. Its schema contains 4 attributes: \$(R.A, R.B, S.B, S.C)\$.
3. Because two relational expressions cannot be equivalent if their schemas have different attribute counts, option (B) is NOT equivalent to \$R \\bowtie S\$.
4. Hence, option (B) is the correct answer.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q32',
    year: 2026,
    subject: '''Databases''',
    topic: '''Normalization''',
    questionText: '''Consider the relational schema \$R(A, B, C, D)\$ with the functional dependency set:
\$\$F = \\{A \\to B, \\, B \\to C, \\, C \\to D\\}\$\$
What is the highest normal form satisfied by relation \$R\$?''',
    options: ['''1NF''', '''2NF''', '''3NF''', '''BCNF'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Normal Form Classification:
1. Candidate Key Determination:
   - \$A^+ = \\{A, B, C, D\\}\$.
   - Neither \$B, C,\$ nor \$D\$ can derive \$A\$.
   - Thus, the unique candidate key is \$A\$.
   - Prime attribute: \$\\{A\\}\$.
   - Non-prime attributes: \$\\{B, C, D\\}\$.

2. Testing 2NF:
   - A relation is in 2NF if it is in 1NF and no non-prime attribute is partially dependent on any candidate key.
   - Since the candidate key is the single attribute \$A\$, no proper subset of a candidate key exists.
   - Therefore, partial functional dependencies are impossible, so \$R\$ is in 2NF.

3. Testing 3NF:
   - For every non-trivial FD \$X \\to Y\$, either \$X\$ must be a superkey or \$Y\$ must be a prime attribute.
   - Consider \$B \\to C\$:
     - \$B\$ is not a superkey (\$B^+ = \\{B, C, D\\} \\ne \\{A, B, C, D\\}\$).
     - \$C\$ is not a prime attribute (\$C \\notin \\{A\\}\$).
   - This violates the 3NF condition (it represents a transitive dependency \$A \\to B \\to C\$).
   - Hence, \$R\$ is NOT in 3NF.

4. Conclusion: The highest normal form is 2NF. Option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q33',
    year: 2026,
    subject: '''Computer Networks''',
    topic: '''CIDR & Subnetting''',
    questionText: '''An organization is allocated the classless address block `200.10.0.0/16`. The network administrator needs to design subnets such that each subnet can accommodate at least 500 usable host interfaces. What is the maximum number of such subnets that can be created?''',
    options: ['''64''', '''128''', '''256''', '''512'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Subnet Sizing Calculation:
1. Usable host constraint:
   - Each subnet requires at least 500 usable hosts.
   - Number of usable hosts with \$h\$ host bits is \$2^h - 2\$.
   - \$2^8 - 2 = 254 < 500\$.
   - \$2^9 - 2 = 510 \\ge 500\$.
   - Therefore, at least \$h = 9\$ bits must be reserved for the host ID.
2. Subnet mask calculation:
   - Total bits in IPv4 address \$= 32\$.
   - Network prefix length \$= 32 - h = 32 - 9 = /23\$.
3. Subnet bits available:
   - Allocated block is `/16`.
   - Subnet bits \$s = 23 - 16 = 7\$ bits.
4. Total subnets created:
   \$\$\\text{Total Subnets} = 2^s = 2^7 = 128\$\$
5. Hence, option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q34',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Posets & Lattices''',
    questionText: '''Let \$(L, \\le)\$ be a finite bounded lattice with least element 0 and greatest element 1. Which of the following statements are ALWAYS TRUE?''',
    options: ['''Every finite lattice is a complete lattice.''', '''Every distributive lattice is also a modular lattice.''', '''In any complemented lattice, every element has a unique complement.''', '''In a distributive lattice, if an element has a complement, that complement is unique.'''],
    correctAnswer: '''A, B, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Lattice Theory Theorems:
1. Statement (A): In any finite lattice, every non-empty subset is finite, so its least upper bound (join) and greatest lower bound (meet) exist within the lattice. The empty set has join 0 and meet 1. Hence, every finite lattice is complete. (A is TRUE).
2. Statement (B): A lattice is distributive if \$a \\wedge (b \\vee c) = (a \\wedge b) \\vee (a \\wedge c)\$. A lattice is modular if \$a \\le c \\implies a \\vee (b \\wedge c) = (a \\vee b) \\wedge c\$. Distributivity implies modularity for all lattices. (B is TRUE).
3. Statement (C): In non-distributive complemented lattices (such as the diamond lattice \$M_3\$ or pentagon lattice \$N_5\$), an element can have multiple distinct complements. Thus complements are not necessarily unique. (C is FALSE).
4. Statement (D): In a distributive lattice, if an element \$a\$ has complements \$b_1\$ and \$b_2\$, then \$b_1 = b_1 \\wedge 1 = b_1 \\wedge (a \\vee b_2) = (b_1 \\wedge a) \\vee (b_1 \\wedge b_2) = 0 \\vee (b_1 \\wedge b_2) = b_1 \\wedge b_2\$. By symmetry, \$b_2 = b_1 \\wedge b_2\$, which implies \$b_1 = b_2\$. Thus complements in distributive lattices are strictly unique. (D is TRUE).
5. Hence, correct options are A, B, and D.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q35',
    year: 2026,
    subject: '''Digital Logic''',
    topic: '''Floating Point Representation''',
    questionText: '''A floating-point number is stored using the IEEE-754 single-precision format. The hexadecimal representation of the 32-bit pattern is `0x40C00000`. Determine the decimal equivalent value represented by this bit pattern.''',
    options: [],
    correctAnswer: '''6''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''IEEE-754 Single Precision Decoding:
1. Hexadecimal `0x40C00000` to binary:
   - `4` \$= 0100_2\$
   - `0` \$= 0000_2\$
   - `C` \$= 1100_2\$
   - Remaining digits are zeros.
   Binary string:
   `0 10000001 10000000000000000000000`

2. Field separation:
   - Sign bit \$S = 0\$ (positive number).
   - Biased exponent \$E = 10000001_2 = 128 + 1 = 129\$.
   - Mantissa bits \$M = 1000000..._2 = 2^{-1} = 0.5\$.

3. Real value formula:
   \$\$\\text{Value} = (-1)^S \\times (1 + M) \\times 2^{E - 127}\$\$
   \$\$\\text{Exponent} = 129 - 127 = 2\$\$
   \$\$\\text{Significand} = 1 + 0.5 = 1.5\$\$
   \$\$\\text{Value} = 1.5 \\times 2^2 = 1.5 \\times 4 = 6\$\$

4. The decimal equivalent value is exactly 6.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q36',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Combinatorics & Functions''',
    questionText: '''Let \$A\$ be a set of 5 distinct elements and \$B\$ be a set of 3 distinct elements. How many onto (surjective) functions \$f: A \\to B\$ can be defined?''',
    options: ['''120''', '''150''', '''180''', '''243'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Inclusion-Exclusion Principle for Surjections:
1. Formula for the number of onto functions from a set of size \$n\$ to a set of size \$m\$:
   \$\$N = \\sum_{k=0}^{m} (-1)^k \\binom{m}{k} (m - k)^n\$\$
2. Here \$n = 5\$ and \$m = 3\$:
   \$\$N = \\binom{3}{0}(3 - 0)^5 - \\binom{3}{1}(3 - 1)^5 + \\binom{3}{2}(3 - 2)^5 - \\binom{3}{3}(3 - 3)^5\$\$
3. Evaluating each term:
   - Term 0: \$1 \\times 3^5 = 1 \\times 243 = 243\$
   - Term 1: \$3 \\times 2^5 = 3 \\times 32 = 96\$
   - Term 2: \$3 \\times 1^5 = 3 \\times 1 = 3\$
   - Term 3: \$1 \\times 0 = 0\$
4. Total onto functions:
   \$\$N = 243 - 96 + 3 = 150\$\$
5. Alternative check via Stirling Numbers of the Second Kind:
   \$\$N = m! \\times S(n, m) = 3! \\times S(5, 3) = 6 \\times 25 = 150\$\$
6. Hence, option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q37',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Projection Matrices & Eigenvalues''',
    questionText: '''Let \$P\$ be a real symmetric \$n \\times n\$ matrix (\$n \\ge 2\$) satisfying \$P^2 = P\$ (an orthogonal projection matrix). If the trace \$\\text{tr}(P) = k\$ with \$1 \\le k < n\$, which of the following assertions is FALSE?''',
    options: ['''The only possible eigenvalues of \$P\$ are 0 and 1.''', '''The rank of matrix \$P\$ is equal to \$k\$.''', '''The matrix \$(I - P)\$ is also an orthogonal projector with rank \$n - k\$.''', '''The determinant of matrix \$P\$ is equal to 1.'''],
    correctAnswer: '''D''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Properties of Idempotent Projection Matrices:
1. Eigenvalues: Since \$P^2 = P\$, for any eigenvalue \$\\lambda\$, \$\\lambda^2 = \\lambda \\implies \\lambda(\\lambda - 1) = 0 \\implies \\lambda \\in \\{0, 1\\}\$. (A is TRUE).
2. Rank and Trace: For idempotent matrices, \$\\text{rank}(P) = \\text{tr}(P) = k\$. (B is TRUE).
3. Complementary Projector: \$(I - P)^2 = I - 2P + P^2 = I - 2P + P = I - P\$.
   Furthermore, \$\\text{rank}(I - P) = \\text{tr}(I - P) = n - \\text{tr}(P) = n - k\$. (C is TRUE).
4. Determinant: The determinant is the product of all eigenvalues. Since \$k < n\$, the multiplicity of the eigenvalue 0 is \$n - k \\ge 1\$.
   Therefore, at least one eigenvalue is 0, which implies:
   \$\$\\det(P) = \\prod_{i=1}^n \\lambda_i = 1^k \\times 0^{n-k} = 0\$\$
   Thus, asserting \$\\det(P) = 1\$ is FALSE.
5. Hence, option (D) is the correct answer.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q38',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Double Integrals''',
    questionText: '''Evaluate the double integral by changing the order of integration:
\$\$I = \\int_{0}^{1} \\int_{y}^{1} e^{x^2} \\, dx \\, dy\$\$''',
    options: ['''\$e - 1\$''', '''\$\\frac{e - 1}{2}\$''', '''\$\\frac{e + 1}{2}\$''', '''\$\\frac{e^2 - 1}{2}\$'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Change of Order of Integration:
1. Original region of integration \$R\$:
   \$\$0 \\le y \\le 1 \\quad \\text{and} \\quad y \\le x \\le 1\$\$
   This represents the triangular region bounded by \$x = y\$, \$x = 1\$, and \$y = 0\$.
2. Inverting order to integrate with respect to \$y\$ first:
   - For a fixed \$x \\in [0, 1]\$, \$y\$ ranges from \$0\$ up to \$x\$.
   \$\$I = \\int_{0}^{1} \\left( \\int_{0}^{x} e^{x^2} \\, dy \\right) dx\$\$
3. Integrating the inner integral:
   \$\$\\int_{0}^{x} e^{x^2} \\, dy = e^{x^2} [y]_0^x = x e^{x^2}\$\$
4. Integrating the outer integral:
   \$\$I = \\int_{0}^{1} x e^{x^2} \\, dx\$\$
   Substitute \$u = x^2 \\implies du = 2x \\, dx \\implies x \\, dx = \\frac{du}{2}\$.
   When \$x = 0, u = 0\$; when \$x = 1, u = 1\$.
   \$\$I = \\frac{1}{2} \\int_{0}^{1} e^u \\, du = \\frac{1}{2} [e^u]_0^1 = \\frac{1}{2} (e^1 - e^0) = \\frac{e - 1}{2}\$\$
5. Hence, option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q39',
    year: 2026,
    subject: '''Probability & Statistics''',
    topic: '''Exponential Distribution''',
    questionText: '''Inter-arrival times of request packets at a network gateway follow an exponential distribution with mean 10 ms (rate parameter \$\\lambda = 0.1\\text{ ms}^{-1}\$). If no packet has arrived during the first 15 ms, what is the probability that the next packet arrives within the subsequent 10 ms?''',
    options: ['''\$1 - e^{-1}\$''', '''\$e^{-1} - e^{-2.5}\$''', '''\$1 - e^{-2.5}\$''', '''\$e^{-1.5}\$'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Memoryless Property of the Exponential Distribution:
1. Let \$X\$ denote the inter-arrival time.
   \$X \\sim \\text{Exp}(\\lambda)\$ with \$\\lambda = \\frac{1}{10} = 0.1\\text{ ms}^{-1}\$.
2. We seek the conditional probability:
   \$\$P(X \\le 15 + 10 \\mid X > 15) = P(X \\le 25 \\mid X > 15)\$\$
3. By the memoryless property of the exponential distribution:
   \$\$P(X > s + t \\mid X > s) = P(X > t)\$\$
   Consequently:
   \$\$P(X \\le s + t \\mid X > s) = 1 - P(X > s + t \\mid X > s) = 1 - P(X > t) = P(X \\le t)\$\$
4. Setting \$s = 15\$ and \$t = 10\$:
   \$\$P(X \\le 25 \\mid X > 15) = P(X \\le 10) = 1 - e^{-\\lambda (10)} = 1 - e^{-0.1 \\times 10} = 1 - e^{-1}\$\$
5. Numerical value: \$1 - e^{-1} \\approx 1 - 0.36788 = 0.63212\$.
6. Hence, option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q40',
    year: 2026,
    subject: '''Digital Logic''',
    topic: '''Synchronous Sequential Circuits''',
    questionText: '''A 2-bit synchronous counter with state variables \$(Q_1, Q_0)\$ executes the following repeating state sequence:
\$\$00 \\to 10 \\to 11 \\to 01 \\to 00\$\$
If the counter is designed using two edge-triggered D flip-flops with inputs \$D_1\$ and \$D_0\$, which of the following pairs of minimal Boolean expressions correctly implements the next-state logic?''',
    options: ['''\$D_1 = \\overline{Q_0}, \\quad D_0 = Q_1\$''', '''\$D_1 = Q_0, \\quad D_0 = \\overline{Q_1}\$''', '''\$D_1 = Q_1 \\oplus Q_0, \\quad D_0 = Q_1\$''', '''\$D_1 = \\overline{Q_1}, \\quad D_0 = \\overline{Q_0}\$'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''State Transition Table Derivation:
1. Tabulate Present State \$(Q_1, Q_0)\$ and Next State \$(Q_1^+, Q_0^+)\$:
   - Present \$00 \\to\$ Next \$10 \\implies D_1 = 1, D_0 = 0\$
   - Present \$10 \\to\$ Next \$11 \\implies D_1 = 1, D_0 = 1\$
   - Present \$11 \\to\$ Next \$01 \\implies D_1 = 0, D_0 = 1\$
   - Present \$01 \\to\$ Next \$00 \\implies D_1 = 0, D_0 = 0\$

2. Karnaugh Map for \$D_1\$:
   - For \$Q_1 Q_0 = 00\$: \$D_1 = 1\$
   - For \$Q_1 Q_0 = 10\$: \$D_1 = 1\$
   - For \$Q_1 Q_0 = 01\$: \$D_1 = 0\$
   - For \$Q_1 Q_0 = 11\$: \$D_1 = 0\$
   \$D_1\$ is 1 when \$Q_0 = 0\$.
   Thus, \$D_1 = \\overline{Q_0}\$.

3. Karnaugh Map for \$D_0\$:
   - For \$Q_1 Q_0 = 00\$: \$D_0 = 0\$
   - For \$Q_1 Q_0 = 10\$: \$D_0 = 1\$
   - For \$Q_1 Q_0 = 01\$: \$D_0 = 0\$
   - For \$Q_1 Q_0 = 11\$: \$D_0 = 1\$
   \$D_0\$ is 1 when \$Q_1 = 1\$.
   Thus, \$D_0 = Q_1\$.

4. Therefore:
   \$\$D_1 = \\overline{Q_0}, \\quad D_0 = Q_1\$\$
5. Hence, option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q41',
    year: 2026,
    subject: '''Computer Organization and Architecture''',
    topic: '''Virtual Memory & TLB''',
    questionText: '''A processor uses a 32-bit virtual address space and a two-level page table hierarchy with 4 KB page frames. The Translation Lookaside Buffer (TLB) has a hit latency of 10 ns and a hit ratio of 95%. Main memory access latency is 80 ns. Assuming page tables reside entirely in main memory and TLB lookup occurs first, what is the Effective Memory Access Time (EMAT) for a memory reference?''',
    options: ['''90 ns''', '''98 ns''', '''105 ns''', '''120 ns'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Calculation of EMAT with Two-Level Paging:
1. Scenario 1: TLB Hit (probability \$0.95\$):
   - The TLB provides the frame number directly in 10 ns.
   - The actual data is then fetched from main memory in 80 ns.
   - Latency on Hit \$= T_{TLB} + T_{MEM} = 10 + 80 = 90\\text{ ns}\$.

2. Scenario 2: TLB Miss (probability \$0.05\$):
   - The TLB lookup takes 10 ns.
   - Because paging has two levels, fetching the physical address requires:
     - 1 memory access to the Level-1 page table (80 ns).
     - 1 memory access to the Level-2 page table (80 ns).
   - Finally, 1 memory access to fetch the requested target data (80 ns).
   - Latency on Miss \$= T_{TLB} + 3 \\times T_{MEM} = 10 + 3 \\times 80 = 250\\text{ ns}\$.

3. Effective Memory Access Time:
   \$\$\\text{EMAT} = 0.95 \\times 90 + 0.05 \\times 250\$\$
   \$\$\\text{EMAT} = 85.5 + 12.5 = 98.0\\text{ ns}\$\$

4. Hence, option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q42',
    year: 2026,
    subject: '''Programming in C''',
    topic: '''Recursion with Static Variables''',
    questionText: '''Consider the following recursive C program:

```c
#include <stdio.h>
int fun(int n) {
    static int count = 0;
    count++;
    if (n <= 1) return 1;
    return fun(n - 1) + fun(n - 2) + count;
}
int main() {
    printf("%d", fun(4));
    return 0;
}
```
What is the printed output of the program?''',
    options: ['''23''', '''28''', '''34''', '''41'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Step-by-Step Recursive Call Tree Trace:
1. `count` is a static variable initialized to 0. Every call to `fun` increments `count` by 1.
2. In C, addition operands are evaluated left to right.
   Expression: `fun(n - 1) + fun(n - 2) + count`.
   `fun(n - 1)` is called first, then `fun(n - 2)`, and finally `count` is read.

3. Call Sequence:
   - Call 1: `fun(4)`, count becomes 1. Evaluates: `fun(3) + fun(2) + count`.
     - Call 2: `fun(3)`, count becomes 2. Evaluates: `fun(2) + fun(1) + count`.
       - Call 3: `fun(2)`, count becomes 3. Evaluates: `fun(1) + fun(0) + count`.
         - Call 4: `fun(1)`, count becomes 4. Returns 1.
         - Call 5: `fun(0)`, count becomes 5. Returns 1.
         - `count` is now 5.
         - Returns: \$1 + 1 + 5 = 7\$. (Return value of Call 3).
       - Call 6: `fun(1)`, count becomes 6. Returns 1.
       - `count` is now 6.
       - Returns: \$7 + 1 + 6 = 14\$. (Return value of Call 2, which is `fun(3)`).
     - Now evaluate second operand of `fun(4)`: `fun(2)`.
       - Call 7: `fun(2)`, count becomes 7. Evaluates: `fun(1) + fun(0) + count`.
         - Call 8: `fun(1)`, count becomes 8. Returns 1.
         - Call 9: `fun(0)`, count becomes 9. Returns 1.
         - `count` is now 9.
         - Returns: \$1 + 1 + 9 = 11\$. (Return value of Call 7, which is `fun(2)`).
     - Now evaluate third operand `count` in `fun(4)`. Current `count` is 9!
     - Returns: \$14 + 11 + 9 = 34\$.

4. Output printed is 34. Option (C) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q43',
    year: 2026,
    subject: '''Data Structures''',
    topic: '''Graph DFS Classification''',
    questionText: '''Let \$G = (V, E)\$ be a directed graph. During a Depth-First Search (DFS) traversal, directed edge \$(u, v)\$ is classified as a BACK EDGE if and only if which of the following conditions is satisfied?''',
    options: ['''\$v\$ is an ancestor of \$u\$ in the DFS forest.''', '''\$v\$ is a descendant of \$u\$ in the DFS forest.''', '''\$v\$ is already marked finished (black) and is neither an ancestor nor a descendant of \$u\$.''', '''\$v\$ is discovered for the first time during the traversal along edge \$(u, v)\$.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''DFS Edge Classification in Directed Graphs:
1. In a DFS forest of a directed graph:
   - Tree Edge: An edge \$(u, v)\$ where \$v\$ is discovered for the first time (state changes from WHITE to GRAY).
   - Back Edge: An edge \$(u, v)\$ connecting \$u\$ to an ancestor \$v\$ in the DFS tree (connecting to an active GRAY vertex, including self-loops).
   - Forward Edge: A non-tree edge \$(u, v)\$ connecting \$u\$ to a descendant \$v\$ in the DFS tree.
   - Cross Edge: An edge \$(u, v)\$ connecting \$u\$ to a previously completed vertex \$v\$ (BLACK) where \$v\$ is neither an ancestor nor a descendant.
2. Hence, \$(u, v)\$ is a back edge if and only if \$v\$ is an ancestor of \$u\$ in the DFS tree.
3. Option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q44',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Dynamic Programming''',
    questionText: '''Consider the matrix chain multiplication problem for four matrices with the following dimension vector:
\$\$p = \\langle 10, \\, 20, \\, 5, \\, 15, \\, 30 \\rangle\$\$
where matrix \$A_1\$ is \$10 \\times 20\$, \$A_2\$ is \$20 \\times 5\$, \$A_3\$ is \$5 \\times 15\$, and \$A_4\$ is \$15 \\times 30\$. What is the minimum number of scalar multiplications required to compute the product \$A_1 A_2 A_3 A_4\$?''',
    options: ['''4750''', '''6250''', '''7500''', '''11250'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Matrix Chain DP Table Computation:
1. Chain length 2 (\$m[i, i+1]\$):
   - \$m[1, 2] = p_0 p_1 p_2 = 10 \\times 20 \\times 5 = 1000\$
   - \$m[2, 3] = p_1 p_2 p_3 = 20 \\times 5 \\times 15 = 1500\$
   - \$m[3, 4] = p_2 p_3 p_4 = 5 \\times 15 \\times 30 = 2250\$

2. Chain length 3 (\$m[i, i+2]\$):
   - For \$m[1, 3]\$:
     - \$k = 1: m[1, 1] + m[2, 3] + p_0 p_1 p_3 = 0 + 1500 + (10 \\times 20 \\times 15) = 1500 + 3000 = 4500\$
     - \$k = 2: m[1, 2] + m[3, 3] + p_0 p_2 p_3 = 1000 + 0 + (10 \\times 5 \\times 15) = 1000 + 750 = 1750\$
     - Minimum: \$m[1, 3] = 1750\$ (split at \$k=2\$).
   - For \$m[2, 4]\$:
     - \$k = 2: m[2, 2] + m[3, 4] + p_1 p_2 p_4 = 0 + 2250 + (20 \\times 5 \\times 30) = 2250 + 3000 = 5250\$
     - \$k = 3: m[2, 3] + m[4, 4] + p_1 p_3 p_4 = 1500 + 0 + (20 \\times 15 \\times 30) = 1500 + 9000 = 10500\$
     - Minimum: \$m[2, 4] = 5250\$ (split at \$k=2\$).

3. Chain length 4 (\$m[1, 4]\$):
   - \$k = 1: m[1, 1] + m[2, 4] + p_0 p_1 p_4 = 0 + 5250 + (10 \\times 20 \\times 30) = 5250 + 6000 = 11250\$
   - \$k = 2: m[1, 2] + m[3, 4] + p_0 p_2 p_4 = 1000 + 2250 + (10 \\times 5 \\times 30) = 3250 + 1500 = 4750\$
   - \$k = 3: m[1, 3] + m[4, 4] + p_0 p_3 p_4 = 1750 + 0 + (10 \\times 15 \\times 30) = 1750 + 4500 = 6250\$
   - Optimal split is at \$k = 2\$: \$((A_1 A_2)(A_3 A_4))\$.
   - Minimum scalar multiplications \$= 4750\$.

4. Hence, option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q45',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Shortest Path Algorithms''',
    questionText: '''Let \$G = (V, E)\$ be a directed graph with edge weight function \$w: E \\to \\mathbb{R}\$. Under which of the following conditions is Dijkstra's single-source shortest path algorithm (implemented with a min-priority queue) mathematically GUARANTEED to find the correct shortest path distances to all reachable vertices?''',
    options: ['''Whenever all edge weights are non-negative (\$w(e) \\ge 0\$ for all \$e \\in E\$).''', '''Whenever there are no negative-weight cycles, even if negative edge weights are present.''', '''Whenever the graph is a Directed Acyclic Graph (DAG), irrespective of edge signs.''', '''Whenever all simple cycles have an even number of edges.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Mathematical Correctness of Dijkstra's Algorithm:
1. Dijkstra's algorithm operates on the greedy choice property: when a vertex \$u\$ with the minimum tentative distance \$d[u]\$ is extracted from the priority queue, \$d[u]\$ is permanently finalized as the true shortest path distance \$\\delta(s, u)\$.
2. This invariant holds if and only if no subsequent path from \$s\$ to \$u\$ can have a smaller total weight.
3. If negative edge weights exist (even in a DAG with no cycles):
   - A vertex \$u\$ could be extracted and marked visited with distance \$d[u]\$.
   - Later, a path traversing a negative-weight edge could discover a shorter route to \$u\$, which Dijkstra's algorithm fails to update because \$u\$ is never re-inserted or reconsidered.
4. Thus, Dijkstra's algorithm is mathematically guaranteed to work if and only if all edge weights are non-negative (\$w(e) \\ge 0\$).
5. Hence, option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q46',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''Decidability & Rice's Theorem''',
    questionText: '''Consider the following three decision problems regarding Turing machines with alphabet \$\\{0, 1\\}\$:
- \$L_1 = \\{\\langle M \\rangle \\mid M \\text{ is a Turing machine that accepts at least 10 strings}\\}\$
- \$L_2 = \\{\\langle M \\rangle \\mid M \\text{ is a Turing machine that halts within 100 transitions on the empty input } \\epsilon\\}\$
- \$L_3 = \\{\\langle M \\rangle \\mid M \\text{ is a Turing machine such that } L(M) \\text{ is a regular language}\\}\$

Which of the following correctly classifies the decidability of \$L_1, L_2,\$ and \$L_3\$?''',
    options: ['''\$L_1\$ is decidable, \$L_2\$ is decidable, \$L_3\$ is undecidable''', '''\$L_1\$ is undecidable, \$L_2\$ is decidable, \$L_3\$ is undecidable''', '''\$L_1\$ is undecidable, \$L_2\$ is undecidable, \$L_3\$ is undecidable''', '''\$L_1\$ is decidable, \$L_2\$ is undecidable, \$L_3\$ is decidable'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Decidability and Rice's Theorem Analysis:
1. Analysis of \$L_1\$:
   - The property "accepts at least 10 strings" depends solely on the language \$L(M)\$ recognized by \$M\$, not the code syntax.
   - It is non-trivial (some TMs accept \$\\ge 10\$ strings, e.g., \$\\Sigma^*\$; some do not, e.g., \$\\emptyset\$).
   - By Rice's Theorem (Part 1), any non-trivial semantic property of the language of a Turing machine is undecidable.
   - Thus, \$L_1\$ is undecidable (it is RE, but not recursive).

2. Analysis of \$L_2\$:
   - \$L_2\$ tests whether \$M\$ halts within 100 transitions on \$\\epsilon\$.
   - This is a bounded execution step problem. A universal Turing machine or simulator can run \$M\$ on \$\\epsilon\$ for at most 100 steps.
   - If \$M\$ halts within 100 steps, answer YES; otherwise (it reaches step 101 without halting), answer NO.
   - The simulation is guaranteed to terminate in finite time.
   - Thus, \$L_2\$ is decidable.

3. Analysis of \$L_3\$:
   - The property "\$L(M)\$ is a regular language" is a semantic property of \$L(M)\$.
   - It is non-trivial (some TMs accept regular languages like \$\\{0\\}^*\$; others accept non-regular languages like \$\\{0^n 1^n\\}\$).
   - By Rice's Theorem, \$L_3\$ is undecidable (in fact, not even RE).

4. Conclusion: \$L_1\$ is undecidable, \$L_2\$ is decidable, \$L_3\$ is undecidable.
5. Hence, option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q47',
    year: 2026,
    subject: '''Compiler Design''',
    topic: '''LR Parsing Conflicts''',
    questionText: '''In the canonical collection of LR(0) items for a context-free grammar, a particular parser state \$I_k\$ contains the following two items:
\$\$A \\to \\alpha \\cdot\$\$
\$\$B \\to \\beta \\cdot a \\gamma\$\$
where \$A, B\$ are non-terminals, \$\\alpha, \\beta, \\gamma\$ are arbitrary grammar strings, and \$a\$ is a terminal symbol. If \$a \\in \\text{FOLLOW}(A)\$, what type of parsing conflict is present in state \$I_k\$ under SLR(1) parsing rules?''',
    options: ['''Shift-Reduce conflict''', '''Reduce-Reduce conflict''', '''Shift-Shift conflict''', '''No parsing conflict occurs'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''SLR(1) Parsing Table Construction:
1. In state \$I_k\$:
   - The item \$A \\to \\alpha \\cdot\$ is a complete item indicating a reduction by rule \$A \\to \\alpha\$. In an SLR(1) parser, a reduce action is entered in state \$I_k\$ for every terminal symbol belonging to \$\\text{FOLLOW}(A)\$.
   - The item \$B \\to \\beta \\cdot a \\gamma\$ has the dot immediately preceding the terminal \$a\$. This mandates a SHIFT action on input terminal \$a\$.
2. Given condition:
   - \$a \\in \\text{FOLLOW}(A)\$.
   - Therefore, in the parsing table entry for state \$I_k\$ under lookahead column \$a\$, the parser is instructed to:
     - Shift \$a\$ (due to \$B \\to \\beta \\cdot a \\gamma\$).
     - Reduce by \$A \\to \\alpha\$ (due to \$A \\to \\alpha \\cdot\$ and \$a \\in \\text{FOLLOW}(A)\$).
3. Having both a shift action and a reduce action in the same table entry constitutes a classic Shift-Reduce conflict.
4. Hence, option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q48',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''Page Replacement Algorithms''',
    questionText: '''An operating system allocates 3 physical page frames (initially empty) to a process. Consider the page reference string:
\$\$7, \\, 0, \\, 1, \\, 2, \\, 0, \\, 3, \\, 0, \\, 4, \\, 2, \\, 3, \\, 0, \\, 3, \\, 2\$\$
How many total page faults occur under First-In First-Out (FIFO) and Least Recently Used (LRU) page replacement algorithms, respectively?''',
    options: ['''10 and 9''', '''9 and 10''', '''10 and 8''', '''8 and 9'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Execution Trace for 3 Frames:
1. FIFO Replacement Trace:
   - Ref 7: [7] -> Fault (1)
   - Ref 0: [7, 0] -> Fault (2)
   - Ref 1: [7, 0, 1] -> Fault (3)
   - Ref 2: replace 7 -> [2, 0, 1] -> Fault (4)
   - Ref 0: hit -> [2, 0, 1]
   - Ref 3: replace 0 -> [2, 3, 1] -> Fault (5)
   - Ref 0: replace 1 -> [2, 3, 0] -> Fault (6)
   - Ref 4: replace 2 -> [4, 3, 0] -> Fault (7)
   - Ref 2: replace 3 -> [4, 2, 0] -> Fault (8)
   - Ref 3: replace 0 -> [4, 2, 3] -> Fault (9)
   - Ref 0: replace 4 -> [0, 2, 3] -> Fault (10)
   - Ref 3: hit -> [0, 2, 3]
   - Ref 2: hit -> [0, 2, 3]
   Total FIFO Faults = 10.

2. LRU Replacement Trace:
   - Ref 7: [7] -> Fault (1)
   - Ref 0: [7, 0] -> Fault (2)
   - Ref 1: [7, 0, 1] -> Fault (3)
   - Ref 2: least recent is 7 -> replace 7 -> [2, 0, 1] -> Fault (4)
   - Ref 0: hit -> recency order: 1 (oldest), 2, 0 (newest)
   - Ref 3: least recent is 1 -> replace 1 -> [2, 0, 3] -> Fault (5) (recency: 2, 0, 3)
   - Ref 0: hit -> recency: 2, 3, 0
   - Ref 4: least recent is 2 -> replace 2 -> [4, 3, 0] -> Fault (6) (recency: 3, 0, 4)
   - Ref 2: least recent is 3 -> replace 3 -> [4, 2, 0] -> Fault (7) (recency: 0, 4, 2)
   - Ref 3: least recent is 0 -> replace 0 -> [3, 4, 2] -> Fault (8) (recency: 4, 2, 3)
   - Ref 0: least recent is 4 -> replace 4 -> [3, 0, 2] -> Fault (9) (recency: 2, 3, 0)
   - Ref 3: hit -> recency: 2, 0, 3
   - Ref 2: hit -> recency: 0, 3, 2
   Total LRU Faults = 9.

3. Hence, FIFO incurs 10 page faults and LRU incurs 9 page faults. Option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q49',
    year: 2026,
    subject: '''Databases''',
    topic: '''Conflict Serializability''',
    questionText: '''Consider the following concurrent schedule \$S\$ involving transactions \$T_1, T_2,\$ and \$T_3\$:
\$\$S: r_1(X); \\, r_2(Z); \\, r_1(Z); \\, r_3(X); \\, r_3(Y); \\, w_1(X); \\, w_2(Z); \\, w_3(Y); \\, w_2(Y)\$\$
Which of the following assertions regarding schedule \$S\$ is correct?''',
    options: ['''Schedule \$S\$ is not conflict serializable due to a directed cycle between \$T_1\$ and \$T_2\$.''', '''Schedule \$S\$ is conflict serializable with the equivalent serial order \$T_3 \\to T_1 \\to T_2\$.''', '''Schedule \$S\$ is conflict serializable with the equivalent serial order \$T_1 \\to T_2 \\to T_3\$.''', '''Schedule \$S\$ is conflict serializable with the equivalent serial order \$T_2 \\to T_3 \\to T_1\$.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Conflict Precedence Graph Construction:
1. Identify all pairs of conflicting operations \$(o_i, o_j)\$ belonging to distinct transactions (\$i \\ne j\$) accessing the same data item, where at least one operation is a write:
   - Data item \$X\$:
     - \$r_3(X)\$ occurs before \$w_1(X) \\implies\$ Directed edge \$T_3 \\to T_1\$.
   - Data item \$Z\$:
     - \$r_1(Z)\$ occurs before \$w_2(Z) \\implies\$ Directed edge \$T_1 \\to T_2\$.
   - Data item \$Y\$:
     - \$r_3(Y)\$ occurs before \$w_2(Y) \\implies\$ Directed edge \$T_3 \\to T_2\$.
     - \$w_3(Y)\$ occurs before \$w_2(Y) \\implies\$ Directed edge \$T_3 \\to T_2\$.

2. Graph edges:
   - \$T_3 \\to T_1\$
   - \$T_1 \\to T_2\$
   - \$T_3 \\to T_2\$

3. Cycle detection:
   - Edges form a Directed Acyclic Graph (DAG): \$T_3 \\to T_1 \\to T_2\$.
   - There are no directed cycles.
   - Therefore, \$S\$ is conflict serializable.

4. Topological Sort:
   - \$T_3\$ has in-degree 0 (executes first).
   - \$T_1\$ has in-degree 1 from \$T_3\$ (executes second).
   - \$T_2\$ has in-degree 2 from \$T_3\$ and \$T_1\$ (executes last).
   - Equivalent serial schedule is \$T_3 \\to T_1 \\to T_2\$.

5. Hence, option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q50',
    year: 2026,
    subject: '''Computer Networks''',
    topic: '''TCP Congestion Control''',
    questionText: '''A TCP entity operates using TCP Tahoe with a Maximum Segment Size (MSS) of 1 KB and initial Slow Start Threshold \$\\text{ssthresh} = 32\\text{ KB}\$. The sender starts in Slow Start with \$\\text{cwnd} = 1\\text{ KB}\$. Transmission proceeds without packet loss up to round 8, during which \$\\text{cwnd}\$ is 34 KB. During transmission round 8, a retransmission timeout (RTO) occurs. What are the values of \$\\text{ssthresh}\$ and \$\\text{cwnd}\$ immediately after timeout handling commences?''',
    options: ['''\$\\text{ssthresh} = 17\\text{ KB}, \\quad \\text{cwnd} = 1\\text{ KB}\$''', '''\$\\text{ssthresh} = 16\\text{ KB}, \\quad \\text{cwnd} = 1\\text{ KB}\$''', '''\$\\text{ssthresh} = 17\\text{ KB}, \\quad \\text{cwnd} = 17\\text{ KB}\$''', '''\$\\text{ssthresh} = 32\\text{ KB}, \\quad \\text{cwnd} = 1\\text{ KB}\$'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''TCP Tahoe Congestion Recovery Dynamics:
1. TCP Tahoe congestion policy states:
   - Whenever packet loss is detected via a Retransmission Timeout (RTO):
     \$\$\\text{ssthresh}_{new} = \\max\\left(2 \\times \\text{MSS}, \\, \\left\\lfloor \\frac{\\text{cwnd}}{2} \\right\\rfloor\\right)\$\$
     \$\$\\text{cwnd}_{new} = 1 \\times \\text{MSS}\$\$
2. Given values at the moment of timeout:
   - \$\\text{cwnd} = 34\\text{ KB}\$.
   - \$\\text{ssthresh}_{new} = \\frac{34}{2} = 17\\text{ KB}\$.
   - \$\\text{cwnd}_{new} = 1\\text{ KB}\$.
3. Transmission then re-enters the Slow Start phase starting from \$\\text{cwnd} = 1\\text{ KB}\$ until it reaches the new threshold of \$17\\text{ KB}\$.
4. Hence, option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q51',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Sorting Lower Bounds & Properties''',
    questionText: '''Which of the following statements regarding comparison-based and non-comparison sorting algorithms are TRUE?''',
    options: ['''Any deterministic comparison-based algorithm for sorting \$n\$ elements requires at least \$\\lceil \\log_2(n!) \\rceil = \\Omega(n \\log n)\$ comparisons in the worst case.''', '''Counting Sort sorts \$n\$ integers in the range \$[0, k-1]\$ in \$\\Theta(n + k)\$ time and is a stable sorting algorithm.''', '''QuickSort can be modified to guarantee \$O(n \\log n)\$ worst-case execution time by selecting the pivot element using the linear-time Median-of-Medians selection algorithm.''', '''In-place standard HeapSort using a binary max-heap is inherently a stable sorting algorithm.'''],
    correctAnswer: '''A, B, C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis of Sorting Properties:
1. Statement (A): Decision tree model for comparison sorting of \$n\$ elements has \$n!\$ leaves. The height of the binary decision tree is at least \$\\lceil \\log_2(n!) \\rceil\$. By Stirling's approximation, \$\\log_2(n!) = \\Omega(n \\log n)\$. (A is TRUE).
2. Statement (B): Counting Sort constructs a count array of size \$k\$ and traverses the input of size \$n\$ backwards to place elements into output array, running in \$\\Theta(n + k)\$ time. Because it scans backwards and places equal elements in identical relative order, it is strictly stable. (B is TRUE).
3. Statement (C): The Median-of-Medians (BFPRT) algorithm finds a pivot with rank between \$30\\%\$ and \$70\\%\$ in \$O(n)\$ time. This guarantees that each recursive partition is at most \$7n/10\$, yielding the recurrence \$T(n) \\le T(n/5) + T(7n/10) + O(n) = O(n \\log n)\$ in the worst case. (C is TRUE).
4. Statement (D): In-place HeapSort repeatedly swaps the maximum element from the root to the end of the array and restores the heap property via `max_heapify`. This swapping alters the relative positions of duplicate keys, making standard HeapSort unstable. (D is FALSE).
5. Hence, options A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q52',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''Context-Free Grammars & Parsers''',
    questionText: '''Which of the following assertions regarding grammars and parsing models are TRUE?''',
    options: ['''Every LL(1) grammar is completely unambiguous.''', '''An ambiguous context-free grammar can never be an LR(\$k\$) grammar for any integer \$k \\ge 0\$.''', '''The formal language \$L = \\{a^n b^n c^n \\mid n \\ge 1\\}\$ can be accepted by an LALR(1) parser.''', '''Every regular language can be generated by an LL(1) grammar.'''],
    correctAnswer: '''A, B, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Formal Grammar Theorems:
1. Statement (A): If a grammar is ambiguous, some string has at least two distinct leftmost derivations. That string would produce multiple entries in at least one cell of the LL(1) parsing table, violating the LL(1) property. Thus, all LL(1) grammars are unambiguous. (A is TRUE).
2. Statement (B): An ambiguous grammar allows multiple rightmost derivations for some input sentence. Consequently, at some point in the parsing process, an LR(\$k\$) parser cannot uniquely decide whether to shift or reduce, or which reduction rule to apply, resulting in unavoidable conflicts regardless of lookahead length \$k\$. Thus no ambiguous grammar can be LR(\$k\$). (B is TRUE).
3. Statement (C): The language \$\\{a^n b^n c^n \\mid n \\ge 1\\}\$ is a classic non-context-free language (provable by the Pumping Lemma for CFLs). Because LALR(1) parsers only accept deterministic context-free languages (DCFLs), it cannot parse \$L\$. (C is FALSE).
4. Statement (D): Any regular language is accepted by a DFA. The DFA can be directly converted into a right-linear grammar where each state corresponds to a non-terminal. With deterministic transitions, each non-terminal has pairwise disjoint FIRST sets and no \$\\epsilon\$-ambiguities, yielding an LL(1) grammar. (D is TRUE).
5. Hence, options A, B, and D are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q53',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''Synchronization Primitives''',
    questionText: '''Which of the following assertions regarding concurrent process synchronization are TRUE?''',
    options: ['''Peterson's solution mathematically guarantees Mutual Exclusion, Progress, and Bounded Waiting for two cooperating processes.''', '''Uncontrolled use of binary semaphores in real-time operating systems can lead to Priority Inversion unless Priority Inheritance or Priority Ceiling protocols are enforced.''', '''Hardware-assisted atomic instructions like `test_and_set` eliminate busy-waiting in mutual exclusion spinlocks.''', '''A monitor abstraction guarantees that at most one active process is executing inside the monitor at any given instant.'''],
    correctAnswer: '''A, B, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Synchronization Primitives Analysis:
1. Statement (A): Peterson's solution uses `flag[2]` and `turn` variables. It provides mutual exclusion (both cannot be in critical section simultaneously), progress (the process not in CS cannot block the other), and bounded waiting (a process enters after at most one turn of the other). (A is TRUE).
2. Statement (B): Priority inversion occurs when a low-priority process holds a lock required by a high-priority process, and a medium-priority process preempts the low-priority process. Priority Inheritance solves this by temporarily elevating the low-priority process to the high priority level. (B is TRUE).
3. Statement (C): Atomic instructions like `test_and_set` and `compare_and_swap` provide hardware primitives to build spinlocks, but the spinlocks themselves still continuously loop (busy-wait) until the lock is released. (C is FALSE).
4. Statement (D): A monitor is a synchronization construct that encapsulates shared data and procedures, with language-level or compiler-enforced mutual exclusion guaranteeing only one process executes within the monitor at any instant. (D is TRUE).
5. Hence, options A, B, and D are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q54',
    year: 2026,
    subject: '''Databases''',
    topic: '''Transactions & Crash Recovery''',
    questionText: '''Which of the following statements concerning database transaction recovery and concurrency control are TRUE?''',
    options: ['''Under the Write-Ahead Logging (WAL) protocol, the log record for any data update must be forced to stable storage before the corresponding dirty database buffer page is written to disk.''', '''Strict Two-Phase Locking (Strict 2PL) guarantees serializability and inherently prevents cascading aborts (rollbacks).''', '''In deferred database modification schemes, uncommitted transactions never write dirty data to stable database disk pages, eliminating the need for UNDO operations during crash recovery.''', '''View serializability of an arbitrary schedule can be tested in deterministic polynomial time using an augmented precedence graph.'''],
    correctAnswer: '''A, B, C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Database Recovery and Concurrency Theorems:
1. Statement (A): The fundamental rule of Write-Ahead Logging (WAL) mandates that before a modified page is written from memory buffer to disk, the log record describing the update must be flushed to stable non-volatile storage. (A is TRUE).
2. Statement (B): Strict 2PL requires that all exclusive (write) locks held by a transaction must be retained until the transaction commits or aborts. Because no other transaction can read uncommitted updates, dirty reads are impossible, which eliminates cascading aborts. (B is TRUE).
3. Statement (C): Under deferred database modification, updates are written only to the log during transaction execution. Dirty buffers are written to the database disk only after the transaction successfully commits. Therefore, active uncommitted transactions during a crash have left no footprints on the database disk, so only REDO operations are required for committed transactions; NO UNDO is needed. (C is TRUE).
4. Statement (D): Testing whether a schedule is conflict serializable is in P (topological sort on precedence graph in \$O(V+E)\$). However, testing View Serializability is known to be NP-Complete (Papadimitriou, 1979). (D is FALSE).
5. Hence, options A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q55',
    year: 2026,
    subject: '''Computer Networks''',
    topic: '''Routing Protocols''',
    questionText: '''Which of the following statements regarding routing protocols in computer networks are TRUE?''',
    options: ['''OSPF is an intradomain Link-State protocol that utilizes Dijkstra's algorithm to compute the shortest path tree from the root to all destinations.''', '''Routing Information Protocol (RIP) utilizes the Bellman-Ford distance vector algorithm and suffers from the Count-to-Infinity problem during link failures.''', '''Border Gateway Protocol (BGP) is an inter-autonomous system Path-Vector routing protocol that includes the AS-Path attribute to detect and prevent routing loops.''', '''Split Horizon with Poisoned Reverse completely prevents all routing loops in arbitrary network topologies for Distance Vector protocols.'''],
    correctAnswer: '''A, B, C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Analysis of Routing Protocols:
1. Statement (A): OSPF (Open Shortest Path First) floods link-state advertisements (LSAs) throughout the area, allowing every router to construct an identical topology database and independently execute Dijkstra's algorithm. (A is TRUE).
2. Statement (B): RIP sends distance vectors to immediate neighbors every 30 seconds using hop count (metric \$\\le 15\$, with 16 indicating infinity). On link failures, slow propagation of bad news can cause mutual incrementing of distance vectors (Count-to-Infinity). (B is TRUE).
3. Statement (C): BGP advertises reachable network prefixes alongside the complete list of Autonomous Systems (AS-Path) traversed. If an AS sees its own ASN in the AS-Path, it rejects the advertisement, cleanly preventing loops. (C is TRUE).
4. Statement (D): Split Horizon with Poisoned Reverse eliminates two-node routing loops, but it fails to prevent loops involving three or more routers (e.g., A tells B, B tells C, C tells A). (D is FALSE).
5. Hence, options A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q56',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Graph Theory & Hamiltonian Cycles''',
    questionText: '''Let \$G = (V, E)\$ be a simple, connected, undirected graph with \$n \\ge 3\$ vertices. Which of the following conditions mathematically GUARANTEE that \$G\$ contains a Hamiltonian cycle?''',
    options: ['''Dirac's Condition: The degree of every vertex \$v \\in V\$ satisfies \$\\text{deg}(v) \\ge \\frac{n}{2}\$.''', '''Ore's Condition: For every pair of distinct non-adjacent vertices \$u, v \\in V\$, \$\\text{deg}(u) + \\text{deg}(v) \\ge n\$.''', '''Euler's Condition: Every vertex in \$G\$ has an even degree.''', '''Bipartite Structure: \$G\$ is isomorphic to the complete bipartite graph \$K_{m, m}\$ where \$m \\ge 2\$.'''],
    correctAnswer: '''A, B, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Hamiltonian Graph Theorems:
1. Statement (A) (Dirac's Theorem, 1952): If \$n \\ge 3\$ and every vertex has degree at least \$n/2\$, then \$G\$ is Hamiltonian. (A is TRUE).
2. Statement (B) (Ore's Theorem, 1960): If \$n \\ge 3\$ and for every pair of non-adjacent vertices \$u, v\$, \$\\text{deg}(u) + \\text{deg}(v) \\ge n\$, then \$G\$ is Hamiltonian. (B is TRUE).
3. Statement (C): Even degrees at all vertices guarantee that \$G\$ has an Eulerian circuit (traverses every edge once), but NOT necessarily a Hamiltonian cycle (which must visit every vertex once). A counterexample is two triangles connected at a single cut vertex (a bow-tie graph): all degrees are even (4, 2, 2, 2, 2), but it has no Hamiltonian cycle because visiting the cut vertex twice is forbidden. (C is FALSE).
4. Statement (D): In \$K_{m, m}\$ with \$m \\ge 2\$, vertices alternate between partition \$X\$ and partition \$Y\$: \$x_1 y_1 x_2 y_2 \\dots x_m y_m x_1\$. Since \$|X| = |Y| = m\$ and all edges between \$X\$ and \$Y\$ exist, this forms a valid Hamiltonian cycle. (D is TRUE).
5. Hence, options A, B, and D are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q57',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Spanning Trees''',
    questionText: '''Determine the total number of distinct spanning trees that can be formed from the complete bipartite graph \$K_{2, 4}\$.''',
    options: [],
    correctAnswer: '''32''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Spanning Trees of Complete Bipartite Graph:
1. Cayley's theorem extension for complete bipartite graphs \$K_{m, n}\$:
   \$\$\\tau(K_{m, n}) = m^{n-1} \\cdot n^{m-1}\$\$
2. Here \$m = 2\$ and \$n = 4\$:
   \$\$\\tau(K_{2, 4}) = 2^{4-1} \\cdot 4^{2-1} = 2^3 \\cdot 4^1 = 8 \\cdot 4 = 32\$\$
3. Therefore, exactly 32 distinct spanning trees can be formed.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q58',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Minimum Spanning Trees''',
    questionText: '''Consider an undirected graph with vertex set \$V = \\{A, B, C, D, E, F\\}\$ and the following weighted edges:
\$\$(A, B): 4, \\, (A, C): 2, \\, (B, C): 1, \\, (B, D): 5, \\, (C, D): 8, \\, (C, E): 10, \\, (D, E): 2, \\, (D, F): 6, \\, (E, F): 3\$\$
Calculate the total weight of the Minimum Spanning Tree (MST) of this graph.''',
    options: [],
    correctAnswer: '''13''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Kruskal's Algorithm Step-by-Step Trace:
1. Sort all edges in non-decreasing order of weight:
   1. \$(B, C)\$ with weight 1
   2. \$(A, C)\$ with weight 2
   3. \$(D, E)\$ with weight 2
   4. \$(E, F)\$ with weight 3
   5. \$(A, B)\$ with weight 4
   6. \$(B, D)\$ with weight 5
   7. \$(D, F)\$ with weight 6
   8. \$(C, D)\$ with weight 8
   9. \$(C, E)\$ with weight 10

2. Iterative edge selection:
   - Edge \$(B, C)\$ [wt 1]: Connects \$B\$ and \$C\$. Disjoint sets: \$\\{B, C\\}\$. Total wt = 1.
   - Edge \$(A, C)\$ [wt 2]: Connects \$A\$ to \$\\{B, C\\}\$. Disjoint sets: \$\\{A, B, C\\}\$. Total wt = \$1 + 2 = 3\$.
   - Edge \$(D, E)\$ [wt 2]: Connects \$D\$ and \$E\$. Disjoint sets: \$\\{A, B, C\\}, \\{D, E\\}\$. Total wt = \$3 + 2 = 5\$.
   - Edge \$(E, F)\$ [wt 3]: Connects \$F\$ to \$\\{D, E\\}\$. Disjoint sets: \$\\{A, B, C\\}, \\{D, E, F\\}\$. Total wt = \$5 + 3 = 8\$.
   - Edge \$(A, B)\$ [wt 4]: Both \$A, B \\in \\{A, B, C\\}\$. Creates a cycle! Discarded.
   - Edge \$(B, D)\$ [wt 5]: Connects component \$\\{A, B, C\\}\$ with component \$\\{D, E, F\\}\$. Merged into single component \$\\{A, B, C, D, E, F\\}\$. Total wt = \$8 + 5 = 13\$.

3. All 6 vertices are now connected using \$6 - 1 = 5\$ edges.
4. Total MST weight \$= 1 + 2 + 2 + 3 + 5 = 13\$.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q59',
    year: 2026,
    subject: '''Digital Logic''',
    topic: '''Carry Lookahead Adder''',
    questionText: '''A 4-bit Carry Lookahead Adder (CLA) computes sum bits \$S_i = P_i \\oplus C_i\$ and carry bits \$C_{i+1} = G_i + P_i C_i\$, where \$P_i = A_i \\oplus B_i\$ and \$G_i = A_i B_i\$. The logic gate propagation delays are:
- XOR gate: 2 ns
- AND gate: 1 ns
- OR gate: 1 ns
Assume that all inputs \$A_i, B_i,\$ and initial carry \$C_0\$ are applied simultaneously at time \$t = 0\$. What is the total worst-case propagation delay (in nanoseconds) required for all sum bits and the final carry-out bit \$C_4\$ to become stable?''',
    options: [],
    correctAnswer: '''6''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Propagation Delay Analysis of CLA:
1. Stage 1: Generate (\$G_i\$) and Propagate (\$P_i\$) Signals:
   - \$G_i = A_i B_i\$ (2-input AND gate): delay = 1 ns.
   - \$P_i = A_i \\oplus B_i\$ (2-input XOR gate): delay = 2 ns.
   - Both \$P_i\$ and \$G_i\$ are available for all \$i \\in \\{0, 1, 2, 3\\}\$ at time \$t = 2\\text{ ns}\$.

2. Stage 2: Carry Lookahead Generator:
   - The carry equations are:
     \$\$C_1 = G_0 + P_0 C_0\$\$
     \$\$C_2 = G_1 + P_1 G_0 + P_1 P_0 C_0\$\$
     \$\$C_3 = G_2 + P_2 G_1 + P_2 P_1 G_0 + P_2 P_1 P_0 C_0\$\$
     \$\$C_4 = G_3 + P_3 G_2 + P_3 P_2 G_1 + P_3 P_2 P_1 G_0 + P_3 P_2 P_1 P_0 C_0\$\$
   - Each carry is realized using a two-level AND-OR network:
     - Level 1: AND gates evaluate product terms (e.g., \$P_3 P_2 P_1 P_0 C_0\$). Delay = 1 ns.
     - Level 2: OR gate sums the product terms. Delay = 1 ns.
   - Time when all carries \$C_1, C_2, C_3, C_4\$ are simultaneously available:
     \$\$t_{\\text{carries}} = t_{P, G} + t_{\\text{AND}} + t_{\\text{OR}} = 2 + 1 + 1 = 4\\text{ ns}\$\$

3. Stage 3: Sum Output Bits:
   - \$S_i = P_i \\oplus C_i\$.
   - \$P_i\$ is ready at 2 ns.
   - \$C_i\$ is ready at 4 ns.
   - The XOR gate takes 2 ns.
   - Sum bits \$S_i\$ are stable at:
     \$\$t_{\\text{sum}} = \\max(t_P, t_C) + t_{\\text{XOR}} = 4 + 2 = 6\\text{ ns}\$\$

4. Overall Delay:
   - \$C_4\$ is ready at 4 ns.
   - All sum bits \$S_0, S_1, S_2, S_3\$ are ready at 6 ns.
   - The worst-case delay for all outputs to stabilize is \$\\max(4, 6) = 6\\text{ ns}\$.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q60',
    year: 2026,
    subject: '''Computer Organization and Architecture''',
    topic: '''Cache Memory Directory Overhead''',
    questionText: '''A computer system with a 64-bit physical address space employs a 64 KB, 4-way set-associative cache with a block size of 64 bytes. Each cache line contains 1 valid bit, 1 dirty bit, and the tag bits. Calculate the total size of the cache tag directory (metadata storage) in bytes.''',
    options: [],
    correctAnswer: '''6656''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Cache Directory Overhead Calculation:
1. Cache Geometry:
   - Total Cache Capacity \$= 64\\text{ KB} = 64 \\times 1024 = 65,536\\text{ bytes}\$.
   - Block Size \$= 64\\text{ bytes} = 2^6\\text{ bytes} \\implies \\text{Block Offset} = 6\\text{ bits}\$.
   - Total number of cache lines:
     \$\$N_{\\text{lines}} = \\frac{65,536}{64} = 1024\\text{ lines}\$\$
   - Number of lines per set (associativity) \$= 4\$.
   - Total number of sets:
     \$\$N_{\\text{sets}} = \\frac{1024}{4} = 256 = 2^8 \\implies \\text{Set Index} = 8\\text{ bits}\$\$

2. Tag Bits per Line:
   - Physical Address \$= 64\\text{ bits}\$.
   - \$\\text{Tag Bits} = 64 - (\\text{Index Bits} + \\text{Offset Bits}) = 64 - (8 + 6) = 64 - 14 = 50\\text{ bits}\$.

3. Metadata Bits per Cache Line:
   \$\$\\text{Metadata} = \\text{Tag Bits} + \\text{Valid Bit} + \\text{Dirty Bit} = 50 + 1 + 1 = 52\\text{ bits}\$\$

4. Total Directory Overhead:
   \$\$\\text{Total Bits} = 1024 \\text{ lines} \\times 52\\text{ bits/line} = 53,248\\text{ bits}\$\$
   \$\$\\text{Total Bytes} = \\frac{53,248}{8} = 6656\\text{ bytes}\$\$

5. Therefore, the tag directory size is exactly 6656 bytes.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q61',
    year: 2026,
    subject: '''Programming in C''',
    topic: '''Loop Analysis & Number Theory''',
    questionText: '''Consider the following C code snippet:

```c
int count = 0;
for (int i = 1; i <= 100; i++) {
    for (int j = 1; j <= i; j++) {
        if (i % j == 0) {
            count++;
        }
    }
}
```
What is the final integer value stored in variable `count` after execution finishes?''',
    options: [],
    correctAnswer: '''482''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Loop Invariant and Number Theory Derivation:
1. For each integer \$i\$ from 1 to 100, the inner loop iterates \$j\$ from 1 to \$i\$.
2. The condition `i % j == 0` evaluates to true whenever \$j\$ is a positive divisor of \$i\$.
3. Thus, for each \$i\$, the inner loop increments `count` by \$d(i)\$, where \$d(i)\$ is the number of positive divisors of \$i\$.
4. The total value of `count` is:
   \$\$\\text{count} = \\sum_{i=1}^{100} d(i)\$\$
5. By Dirichlet's divisor problem / swapping order of summation:
   \$\$\\sum_{i=1}^{100} d(i) = \\sum_{j=1}^{100} \\left\\lfloor \\frac{100}{j} \\right\\rfloor\$\$
6. Evaluating the sum:
   - \$j = 1: 100\$
   - \$j = 2: 50\$
   - \$j = 3: 33\$
   - \$j = 4: 25\$
   - \$j = 5: 20\$
   - \$j = 6: 16\$
   - \$j = 7: 14\$
   - \$j = 8: 12\$
   - \$j = 9: 11\$
   - \$j = 10: 10\$
   - Subtotal (1 to 10) = 291
   - \$j = 11: 9\$
   - \$j = 12: 8\$
   - \$j = 13: 7\$
   - \$j = 14: 7\$
   - \$j = 15: 6\$
   - \$j = 16: 6\$
   - \$j = 17..20\$ (4 terms): \$5 \\times 4 = 20\$
   - \$j = 21..25\$ (5 terms): \$4 \\times 5 = 20\$
   - \$j = 26..33\$ (8 terms): \$3 \\times 8 = 24\$
   - \$j = 34..50\$ (17 terms): \$2 \\times 17 = 34\$
   - \$j = 51..100\$ (50 terms): \$1 \\times 50 = 50\$
   Total \$= 291 + 9 + 8 + 7 + 7 + 6 + 6 + 20 + 20 + 24 + 34 + 50 = 482\$.

7. The final value of `count` is exactly 482.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q62',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''Disk Scheduling''',
    questionText: '''A magnetic disk has 200 cylinders numbered 0 to 199. The read/write head is currently positioned at cylinder 50 and is moving in the direction of increasing cylinder numbers. The queue of pending I/O requests is:
\$\$82, \\, 170, \\, 43, \\, 140, \\, 24, \\, 16, \\, 190\$\$
Using the Circular SCAN (C-SCAN) algorithm, the head services requests while moving towards the highest cylinder (199), then immediately jumps to cylinder 0 without servicing requests, and resumes moving upwards. Assuming the return movement from cylinder 199 to cylinder 0 is INCLUDED in the count, what is the total head movement in cylinders?''',
    options: [],
    correctAnswer: '''391''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''C-SCAN Head Movement Trace:
1. Current head position: 50 (direction: upward toward 199).
2. Pending requests: \$\\{16, 24, 43, 82, 140, 170, 190\\}\$.
3. Forward service phase (upward from 50):
   - Visits: \$82 \\to 140 \\to 170 \\to 190 \\to 199\$ (disk boundary).
   - Head movement for this phase:
     \$\$\\Delta_1 = 199 - 50 = 149\\text{ cylinders}\$\$
4. Return jump phase:
   - Head returns directly from cylinder 199 to cylinder 0.
   - Head movement for return:
     \$\$\\Delta_2 = 199 - 0 = 199\\text{ cylinders}\$\$
5. Upward service phase from 0:
   - Visits remaining requests in ascending order: \$16 \\to 24 \\to 43\$.
   - Head movement for this phase:
     \$\$\\Delta_3 = 43 - 0 = 43\\text{ cylinders}\$\$
6. Total head movement:
   \$\$\\text{Total} = \\Delta_1 + \\Delta_2 + \\Delta_3 = 149 + 199 + 43 = 391\\text{ cylinders}\$\$
7. The total head movement is exactly 391 cylinders.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q63',
    year: 2026,
    subject: '''Databases''',
    topic: '''B+ Trees''',
    questionText: '''Consider a B+ tree index constructed on a relation stored on a disk with a block size of 1024 bytes. The search key size is 12 bytes, the record pointer size is 8 bytes, and the block pointer size is 6 bytes. What is the maximum order \$p\$ (maximum number of block pointers) of an INTERNAL node in this B+ tree?''',
    options: [],
    correctAnswer: '''57''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''B+ Tree Internal Node Order Calculation:
1. In an internal node of a B+ tree of order \$p\$:
   - The node contains at most \$p\$ block pointers (child pointers).
   - The node contains at most \$p - 1\$ search key values.
2. The total storage occupied by an internal node must fit within one disk block:
   \$\$p \\times (\\text{Block Pointer Size}) + (p - 1) \\times (\\text{Search Key Size}) \\le \\text{Block Size}\$\$
3. Substitute the given parameter values:
   \$\$p \\times 6 + (p - 1) \\times 12 \\le 1024\$\$
   \$\$6p + 12p - 12 \\le 1024\$\$
   \$\$18p - 12 \\le 1024\$\$
   \$\$18p \\le 1036\$\$
   \$\$p \\le \\frac{1036}{18} \\approx 57.555\$\$
4. Since the order \$p\$ must be a non-negative integer:
   \$\$p_{\\max} = 57\$\$
5. Verification:
   - For \$p = 57\$: \$57 \\times 6 + 56 \\times 12 = 342 + 672 = 1014\\text{ bytes} \\le 1024\\text{ bytes}\$.
   - For \$p = 58\$: \$58 \\times 6 + 57 \\times 12 = 348 + 684 = 1032\\text{ bytes} > 1024\\text{ bytes}\$.
6. Therefore, the maximum order of an internal node is exactly 57.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q64',
    year: 2026,
    subject: '''Computer Networks''',
    topic: '''Sliding Window Protocol''',
    questionText: '''A point-to-point satellite link has a bandwidth of 100 Mbps (\$10^8\$ bps) and a one-way propagation delay of 20 ms. Data frames have a fixed length of 1000 bytes. To achieve 100% channel utilization using the Go-Back-N sliding window protocol (assuming acknowledgements are instantaneous and the transmission channel is error-free), what is the MINIMUM number of bits required in the sequence number field?''',
    options: [],
    correctAnswer: '''9''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Sliding Window Protocol Window Sizing:
1. Transmission delay (\$T_t\$):
   \$\$\\text{Frame Size} = 1000 \\times 8 = 8000\\text{ bits}\$\$
   \$\$T_t = \\frac{8000\\text{ bits}}{10^8\\text{ bps}} = 8 \\times 10^{-5}\\text{ s} = 0.08\\text{ ms}\$\$
2. Propagation delay (\$T_p\$):
   \$\$T_p = 20\\text{ ms}\$\$
3. Parameter \$a\$:
   \$\$a = \\frac{T_p}{T_t} = \\frac{20}{0.08} = 250\$\$
4. Optimal window size \$W\$ for \$100\\%\$ utilization:
   \$\$W = 1 + 2a = 1 + 2(250) = 501\\text{ frames}\$\$
5. Sequence number bits constraint in Go-Back-N:
   - For Go-Back-N with \$k\$ sequence number bits, the maximum sender window size is:
     \$\$W \\le 2^k - 1\$\$
   - Therefore:
     \$\$2^k - 1 \\ge 501 \\implies 2^k \\ge 502\$\$
6. Determine minimal integer \$k\$:
   - For \$k = 8\$: \$2^8 = 256 < 502\$ (insufficient).
   - For \$k = 9\$: \$2^9 = 512 \\ge 502\$ (sufficient).
7. Hence, the minimum number of sequence number bits is 9.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK4_Q65',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''DFA State Minimization''',
    questionText: '''Let \$L\$ be the language over \$\\{0, 1\\}\$ consisting of all strings that either end with the substring `01` OR end with the substring `10`. Determine the minimum number of states in a minimal Deterministic Finite Automaton (DFA) that accepts \$L\$.''',
    options: [],
    correctAnswer: '''5''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Minimal DFA State Construction:
1. Language definition:
   \$\$L = \\{w \\in \\{0, 1\\}^* \\mid w \\text{ ends in } 01 \\text{ or } 10\\}\$\$
2. State equivalence classes (tracking relevant suffix history):
   - State \$q_0\$: Empty string \$\\epsilon\$ (start state). No bits processed yet.
   - State \$q_1\$: String ends in 0, but not preceded by 1 (e.g., `0`, `00`).
   - State \$q_2\$: String ends in 1, but not preceded by 0 (e.g., `1`, `11`).
   - State \$q_{01}\$: String ends in `01` (Accepting State).
   - State \$q_{10}\$: String ends in `10` (Accepting State).

3. State transition function \$\\delta\$:
   - From \$q_0\$:
     - On 0 \$\\to q_1\$
     - On 1 \$\\to q_2\$
   - From \$q_1\$ (ends in 0):
     - On 0 \$\\to q_1\$ (still ends in 0)
     - On 1 \$\\to q_{01}\$ (ends in 01, accepted!)
   - From \$q_2\$ (ends in 1):
     - On 0 \$\\to q_{10}\$ (ends in 10, accepted!)
     - On 1 \$\\to q_2\$ (still ends in 1)
   - From \$q_{01}\$ (ends in 01):
     - On 0 \$\\to q_{10}\$ (string ends in 010 \$\\implies\$ ends in 10, accepted!)
     - On 1 \$\\to q_2\$ (string ends in 011 \$\\implies\$ ends in 11, non-accepting)
   - From \$q_{10}\$ (ends in 10):
     - On 0 \$\\to q_1\$ (string ends in 100 \$\\implies\$ ends in 00, non-accepting)
     - On 1 \$\\to q_{01}\$ (string ends in 101 \$\\implies\$ ends in 01, accepted!)

4. Distinguishability of States:
   - \$q_{01}\$ and \$q_{10}\$ are distinguishable: on input 0, \$\\delta(q_{01}, 0) = q_{10}\$ (accepting), while \$\\delta(q_{10}, 0) = q_1\$ (non-accepting).
   - \$q_1\$ and \$q_2\$ are distinguishable: on input 1, \$\\delta(q_1, 1) = q_{01}\$ (accepting), while \$\\delta(q_2, 1) = q_2\$ (non-accepting).
   - \$q_0\$ is distinguishable from \$q_1\$ on input 1 (leads to \$q_2\$ vs \$q_{01}\$).
   - All 5 states are reachable from \$q_0\$ and pairwise distinguishable by the Myhill-Nerode theorem.

5. Therefore, the minimal DFA contains exactly 5 states.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
];
