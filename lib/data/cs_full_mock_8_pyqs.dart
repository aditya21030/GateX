// AUTO-GENERATED GATE CS MOCK 8 QUESTIONS (ULTRA-TOUGH FACULTY LEVEL)
import '../models/models.dart';

final List<PYQ> csFullMock8Questions = [
  PYQ(
    id: 'CS_MOCK8_Q01',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Verbal Ability''',
    questionText: '''Select the word that best completes the sentence to convey precise logical meaning:

"The defense attorney's argument appeared convincing on the surface, but a rigorous scrutiny of the evidence revealed it to be utterly _______."''',
    options: ['''specious''', '''cogent''', '''perspicuous''', '''veracious'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Vocabulary in Context:
1. The contrast signaled by "appeared convincing on the surface, but a rigorous scrutiny ... revealed it to be utterly _______" requires an adjective meaning superficially plausible or attractive, but actually wrong or deceitful.
2. "Specious" precisely means having a deceptive attraction or superficial plausibility, but fundamentally fallacious.
3. "Cogent" means clear, logical, and convincing (the opposite of what scrutiny revealed).
4. "Perspicuous" means clearly expressed and easily understood.
5. "Veracious" means speaking or representing the truth.
6. Therefore, option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q02',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Verbal Ability (Grammar & Parallelism)''',
    questionText: '''Which of the following sentences adheres to correct grammatical syntax and parallel structure?''',
    options: ['''The software architect insisted on not only refactoring the legacy modules but also optimizing the database queries.''', '''The software architect insisted not only on refactoring the legacy modules, but also optimized the database queries.''', '''The software architect not only insisted on refactoring the legacy modules, but also to optimize the database queries.''', '''The software architect insisted on refactoring not only the legacy modules but also to optimize the database queries.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Correlative Conjunction Parallelism:
- The correlative pair "not only ... but also" must link parallel grammatical structures.
- In option (A): "on not only [refactoring ...] but also [optimizing ...]" places two parallel gerund phrases immediately following the conjunctions.
- In (B), "on refactoring" is paired with the finite past verb "optimized" (non-parallel).
- In (C), "insisted on refactoring" is paired with infinitive "to optimize" (non-parallel).
- In (D), noun phrase "the legacy modules" is paired with infinitive "to optimize" (non-parallel).
- Hence, (A) is the grammatically correct sentence.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q03',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude (Mixtures)''',
    questionText: '''A container holds 60 liters of pure milk. From this container, 12 liters of milk are removed and replaced with water. Next, 12 liters of the resulting mixture are removed and replaced with water. What is the final volume of pure milk (in liters) remaining in the container?''',
    options: ['''36.0 liters''', '''38.4 liters''', '''40.0 liters''', '''42.8 liters'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Successive Replacement Formula:
1. Initial volume of pure liquid V = 60 liters.
2. Volume replaced in each iteration x = 12 liters.
3. Number of replacements n = 2.
4. Final quantity of pure liquid = V * (1 - x / V)^n.
5. Fraction remaining per step = (1 - 12 / 60) = (1 - 0.20) = 0.80 = 4/5.
6. After 2 replacements: 60 * (4/5)^2 = 60 * (16 / 25) = 60 * 0.64 = 38.4 liters.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q04',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Spatial Aptitude''',
    questionText: '''A standard 2D Cartesian coordinate plane contains a right triangle with vertices at (0, 0), (4, 0), and (0, 3). The triangle is first rotated 90° counterclockwise about the origin, and then reflected across the y-axis. What are the coordinates of the image of the vertex originally located at (4, 0)?''',
    options: ['''(0, 4)''', '''(0, -4)''', '''(4, 0)''', '''(-4, 0)'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''2D Spatial Transformations:
1. Vertex: P = (4, 0).
2. Step 1: Rotate 90° counterclockwise about the origin:
   Transformation: (x, y) -> (-y, x).
   Image P1 = (-0, 4) = (0, 4).
3. Step 2: Reflect across the y-axis:
   Transformation: (x, y) -> (-x, y).
   Image P2 = (-0, 4) = (0, 4).
4. Thus, the final coordinates are (0, 4).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q05',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude (Number Properties)''',
    questionText: '''What is the remainder when 3^2026 is divided by 5?''',
    options: ['''1''', '''2''', '''3''', '''4'''],
    correctAnswer: '''D''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Modular Arithmetic and Fermat's Little Theorem:
1. We compute 3^2026 mod 5.
2. Since 5 is prime and gcd(3, 5) = 1, by Fermat's Little Theorem: 3^4 ≡ 1 (mod 5).
3. We divide exponent 2026 by 4:
   2026 = 4 * 506 + 2.
4. Therefore:
   3^2026 ≡ (3^4)^506 * 3^2 ≡ (1)^506 * 9 ≡ 1 * 9 ≡ 4 (mod 5).
5. The remainder is 4.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q06',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude (Circular Tracks)''',
    questionText: '''Two runners, P and Q, start simultaneously from the same point on a circular track of circumference 600 meters. P runs in the clockwise direction at 15 m/s, and Q runs in the counterclockwise direction at 10 m/s. After how many seconds from the start will they meet for the 4th time?''',
    options: ['''72 seconds''', '''96 seconds''', '''120 seconds''', '''144 seconds'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Circular Track Meeting Time:
1. Relative speed in opposite directions = v_P + v_Q = 15 + 10 = 25 m/s.
2. Circumference of the track L = 600 m.
3. Time taken for the first meeting:
   t_1 = L / (v_P + v_Q) = 600 / 25 = 24 seconds.
4. In circular motion, subsequent meetings occur at identical constant intervals of 24 seconds.
5. Time taken for the 4th meeting:
   t_4 = 4 * 24 = 96 seconds.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q07',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Data Interpretation''',
    questionText: '''A cloud hosting firm reports server resource allocation across four departments:
Engineering: 450 TB, Sales: 250 TB, Marketing: 200 TB, Operations: 100 TB.
If Operations increases its allocation by 50% and Engineering reduces its allocation by 20%, what is the new percentage share of Operations in the total allocation?''',
    options: ['''12.5%''', '''15.6%''', '''16.7%''', '''18.2%'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Data Interpretation Steps:
1. Original allocations:
   Engineering = 450, Sales = 250, Marketing = 200, Operations = 100.
2. Revised allocations:
   - Engineering: 450 * (1 - 0.20) = 360 TB.
   - Operations: 100 * (1 + 0.50) = 150 TB.
   - Sales: 250 TB (unchanged).
   - Marketing: 200 TB (unchanged).
3. New total allocation = 360 + 250 + 200 + 150 = 960 TB.
4. Percentage share of Operations = (150 / 960) * 100% = (5 / 32) * 100% = 15.625% ≈ 15.6%.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q08',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Logical Reasoning (Linear Arrangement)''',
    questionText: '''Six researchers—U, V, W, X, Y, and Z—are seated in a single row of six chairs facing North.
1. W is seated exactly at one of the extreme ends.
2. V is seated immediately to the right of X.
3. Neither X nor V is adjacent to W.
4. Y is seated immediately to the left of Z.
5. U is seated in the third chair from the left end.

Which researcher is seated at the extreme right end?''',
    options: ['''W''', '''Z''', '''V''', '''Y'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Linear Deduction Steps:
Chairs numbered 1 to 6 from left to right.
1. Clue 5: U is in chair 3.
   Row: [ _ , _ , U , _ , _ , _ ]
2. Clue 1: W is at an extreme end (chair 1 or chair 6).
   - Case 1: W is in chair 1.
     Row: [ W , _ , U , _ , _ , _ ]
     Now V is immediately to the right of X -> (X, V) block.
     Neither X nor V is adjacent to W (so chair 2 cannot be X or V).
     Therefore, the (X, V) block must occupy chairs 4 and 5:
     Row: [ W , _ , U , X , V , _ ]
     Then Y and Z must be seated together: "Y is immediately to the left of Z" -> (Y, Z) block.
     Chairs remaining are 2 and 6 (which are separated!). A block of size 2 cannot fit!
     Hence Case 1 is IMPOSSIBLE.
   - Case 2: W is in chair 6.
     Row: [ _ , _ , U , _ , _ , W ]
     Neither X nor V is adjacent to W (so chair 5 cannot be X or V).
     Therefore, the (X, V) block cannot use chair 5, so it must occupy chairs 1 and 2!
     Row: [ X , V , U , _ , _ , W ]
     Now chairs 4 and 5 are empty and adjacent.
     The (Y, Z) block fits perfectly in chairs 4 and 5:
     Row: [ X , V , U , Y , Z , W ]
3. Verification:
   1: X, 2: V, 3: U, 4: Y, 5: Z, 6: W.
   - W is at extreme end (chair 6) - YES.
   - V is immediately right of X (chairs 1, 2) - YES.
   - Neither X nor V is adjacent to W - YES.
   - Y is immediately left of Z (chairs 4, 5) - YES.
   - U is 3rd from left - YES.
4. Researcher at extreme right end (chair 6) is W.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q09',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude (Intersecting Chords)''',
    questionText: '''Two chords AB and CD of a circle intersect internally at point P. The lengths of segments AP, PB, and CP are 4 cm, 9 cm, and 3 cm, respectively. What is the length of chord CD (in cm)?''',
    options: ['''12 cm''', '''15 cm''', '''16 cm''', '''18 cm'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Intersecting Chords Theorem:
1. For two chords AB and CD intersecting at P:
   AP * PB = CP * PD.
2. Given AP = 4, PB = 9, CP = 3:
   4 * 9 = 3 * PD => 36 = 3 * PD => PD = 12 cm.
3. Total length of chord CD = CP + PD = 3 + 12 = 15 cm.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q10',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Critical Reading''',
    questionText: '''Read the following passage:
"Automation bias refers to the human tendency to favor suggestions from automated decision-making systems and to ignore contradictory information made without automation, even when the human possesses superior contextual knowledge. In high-stakes environments such as autonomous aviation and medical diagnostics, uncritical deference to automated recommendations can transform rare software edge-case anomalies into systemic fatal outcomes."

Which of the following is the PRIMARY assertion supported by the passage?''',
    options: ['''Automated decision systems should be completely eliminated from aviation and medical healthcare.''', '''Human operators risk catastrophe when they unquestioningly subordinate their contextual judgment to algorithmic outputs.''', '''Machine learning algorithms always exhibit higher error rates than trained human diagnosticians.''', '''Automation bias only occurs when human operators lack domain expertise.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Critical Reading Analysis:
- The passage argues that "uncritical deference to automated recommendations can transform rare software edge-case anomalies into systemic fatal outcomes" even when humans possess superior contextual knowledge.
- This directly establishes option (B): human operators risk catastrophe when they unquestioningly subordinate contextual judgment to algorithmic outputs.
- Options A, C, and D exaggerate or misstate the text's claims.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q11',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Mathematical Logic (First-Order Logic Equivalence)''',
    questionText: '''Let P(x) be a predicate and let Q be a proposition that does not involve the variable x. Which of the following first-order logic formulas is logically EQUIVALENT to: ∀x (P(x) → Q)?''',
    options: ['''(∃x P(x)) → Q''', '''(∀x P(x)) → Q''', '''∀x (P(x) ∧ Q)''', '''∃x (P(x) → Q)'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Quantifier Scope and Implication:
1. ∀x (P(x) → Q) ≡ ∀x (¬P(x) ∨ Q).
2. Since Q does not depend on x, Q can be factored out of the universal quantifier:
   ∀x (¬P(x) ∨ Q) ≡ (∀x ¬P(x)) ∨ Q.
3. By De Morgan's duality: ∀x ¬P(x) ≡ ¬(∃x P(x)).
4. Substituting gives: ¬(∃x P(x)) ∨ Q.
5. By the definition of implication: ¬(∃x P(x)) ∨ Q ≡ (∃x P(x)) → Q.
6. Thus, option (A) is the correct logical equivalence.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q12',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Set Theory (Equivalence Relations & Bell Numbers)''',
    questionText: '''Let S be a set containing exactly 4 distinct elements. What is the total number of distinct equivalence relations that can be defined on S?''',
    options: ['''10''', '''14''', '''15''', '''16'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Equivalence Relations and Bell Numbers:
- The number of equivalence relations on a set of size n equals the number of partitions of the set, given by the Bell number B_n.
- Bell triangle construction:
  Row 1: 1
  Row 2: 1, 2
  Row 3: 2, 3, 5
  Row 4: 5, 7, 10, 15
- Thus, B_4 = 15.
- Therefore, exactly 15 distinct equivalence relations can be defined on a set of 4 elements.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q13',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Eigenvalues and Trace''',
    questionText: '''A 3 x 3 real matrix A has trace equal to 9 and determinant equal to 24. If two of the eigenvalues of A are 2 and 3, what is the third eigenvalue of A?''',
    options: ['''1''', '''2''', '''3''', '''4'''],
    correctAnswer: '''D''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Trace and Determinant Properties:
1. Trace(A) = λ1 + λ2 + λ3.
   Given Trace = 9, λ1 = 2, λ2 = 3:
   2 + 3 + λ3 = 9 => λ3 = 9 - 5 = 4.
2. Verify with Determinant:
   Det(A) = λ1 * λ2 * λ3 = 2 * 3 * 4 = 24, which exactly matches the given determinant.
3. Therefore, the third eigenvalue is 4.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q14',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Limits (L'Hôpital's Rule)''',
    questionText: '''Evaluate the limit:
L = lim_{x -> 0} (e^x - 1 - x) / x^2''',
    options: ['''0''', '''1/2''', '''1''', '''∞'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''L'Hôpital's Rule / Taylor Series:
1. Direct substitution gives (1 - 1 - 0) / 0 = 0/0 (indeterminate form).
2. Differentiating numerator and denominator with respect to x:
   lim_{x -> 0} (e^x - 1) / (2x).
3. This is still 0/0. Apply L'Hôpital's rule a second time:
   lim_{x -> 0} e^x / 2 = e^0 / 2 = 1/2.
4. Hence, the limit evaluates to 1/2.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q15',
    year: 2026,
    subject: '''Probability''',
    topic: '''Poisson Distribution''',
    questionText: '''Let X be a Poisson random variable whose variance is 4. What is the probability that X = 0?''',
    options: ['''e^(-2)''', '''e^(-4)''', '''4 * e^(-4)''', '''1/4'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Poisson Distribution Properties:
1. For a Poisson distribution with parameter λ:
   Mean = Var(X) = λ.
2. Given Var(X) = 4, we have λ = 4.
3. Probability mass function: P(X = k) = (e^(-λ) * λ^k) / k!.
4. For k = 0: P(X = 0) = (e^(-4) * 4^0) / 0! = e^(-4).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q16',
    year: 2026,
    subject: '''Digital Logic''',
    topic: '''Multiplexers (Universal Implementation)''',
    questionText: '''Consider implementing a 3-variable Boolean function F(A, B, C) using a single 4-to-1 multiplexer with select lines S1 = A, S0 = B. If F(A, B, C) = ∑ m(1, 3, 4, 6), what inputs must be applied to lines (I0, I1, I2, I3)?''',
    options: ['''I0 = C, I1 = C, I2 = C', I3 = C\'''', '''I0 = C, I1 = 0, I2 = 1, I3 = C\'''', '''I0 = C', I1 = C', I2 = C, I3 = C''', '''I0 = 1, I1 = 0, I2 = C, I3 = C\''''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''4-to-1 MUX Implementation:
Select inputs S1 = A, S0 = B.
- When AB = 00: minterms are m0 (C=0) and m1 (C=1). F is 1 for m1 -> I0 = C.
- When AB = 01: minterms are m2 (C=0) and m3 (C=1). F is 1 for m3 -> I1 = C.
- When AB = 10: minterms are m4 (C=0) and m5 (C=1). F is 1 for m4 -> I2 = C'.
- When AB = 11: minterms are m6 (C=0) and m7 (C=1). F is 1 for m6 -> I3 = C'.
Therefore, inputs (I0, I1, I2, I3) = (C, C, C', C').''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q17',
    year: 2026,
    subject: '''Digital Logic''',
    topic: '''Combinational Hazards (Static-1 Hazard)''',
    questionText: '''In combinational logic circuits, under what condition does a Static-1 hazard occur in a sum-of-products implementation?''',
    options: ['''When an input transition moves between two adjacent minterms that are covered by different prime implicants without an overlapping consensus term.''', '''When the output momentarily drops to 0 during an input transition between two 0-cells in the Karnaugh map.''', '''When two clock signals arrive out of phase at the inputs of a flip-flop.''', '''When an active-low preset overrides the synchronous clear line.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Static-1 Hazard:
- A Static-1 hazard occurs when an output is supposed to remain at logic 1 during an input transition between two adjacent 1s in a K-map, but temporarily glitches to 0 due to unequal path propagation delays.
- This happens when the two adjacent 1-minterms are covered by separate prime implicants without an overlapping redundant implicant (consensus term) bridging them.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q18',
    year: 2026,
    subject: '''Computer Organization and Architecture''',
    topic: '''Addressing Modes (PC-Relative Addressing)''',
    questionText: '''An instruction stored at memory byte address 0x1000 has a length of 4 bytes. The instruction performs a PC-relative branch with an offset of +28 bytes. The processor architecture updates the Program Counter (PC) to point to the next sequential instruction before calculating branch targets. What is the effective branch target address?''',
    options: ['''0x101C''', '''0x1020''', '''0x1024''', '''0x1028'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''PC-Relative Address Calculation:
1. Current instruction address = 0x1000.
2. Instruction length = 4 bytes.
3. Updated PC after fetch = 0x1000 + 4 = 0x1004.
4. Offset = +28 (decimal) = 0x1C (hex).
5. Effective Target Address = Updated PC + Offset = 0x1004 + 0x001C = 0x1020.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q19',
    year: 2026,
    subject: '''Computer Organization and Architecture''',
    topic: '''Control Unit Design (Hardwired vs Microprogrammed)''',
    questionText: '''Which of the following statements correctly characterizes a Hardwired Control Unit in comparison with a Microprogrammed Control Unit?''',
    options: ['''Hardwired control units achieve faster instruction execution speeds because control signals are generated directly by combinational logic circuits.''', '''Hardwired control units offer greater flexibility for adding new complex instructions via firmware updates.''', '''Microprogrammed control units completely avoid the use of control memory ROM.''', '''Horizontal microinstructions require extensive external decoding logic compared to vertical microinstructions.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Hardwired vs Microprogrammed Control:
- Hardwired control uses dedicated combinational logic gates, decoders, and counters to generate control signals directly, offering the highest operational speed.
- Microprogrammed control stores microinstructions in a control memory ROM, making it more flexible and easier to modify, but slower due to memory access latency.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q20',
    year: 2026,
    subject: '''Programming and Data Structures''',
    topic: '''C Arrays and Pointer Arithmetic''',
    questionText: '''Consider the following C code snippet:

```c
#include <stdio.h>

int main() {
    int a[3][4] = {
        {10, 20, 30, 40},
        {50, 60, 70, 80},
        {90, 100, 110, 120}
    };
    int *p = *(a + 1) + 2;
    printf("%d", *p);
    return 0;
}
```
What is the printed output?''',
    options: ['''60''', '''70''', '''80''', '''110'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Multidimensional Array Pointer Arithmetic:
1. `a` is a 2D array of type `int[3][4]`.
2. `a + 1` points to row 1 (the 2nd row: `{50, 60, 70, 80}`).
3. `*(a + 1)` decays to a pointer to the first element of row 1, i.e., `&a[1][0]`.
4. `*(a + 1) + 2` points to `&a[1][2]` (the 3rd element of row 1).
5. The value at `a[1][2]` is 70.
6. Dereferencing `*p` yields 70.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q21',
    year: 2026,
    subject: '''Programming and Data Structures''',
    topic: '''Stacks (Infix to Postfix Conversion)''',
    questionText: '''Convert the following infix expression to its equivalent postfix representation using standard operator precedence (where ^ is right-associative exponentiation, * and / have equal precedence, + and - have equal precedence):

a + b * c ^ d - e / f''',
    options: ['''a b c d ^ * + e f / -''', '''a b + c d ^ * e f / -''', '''a b c * d ^ + e f / -''', '''a b c d * ^ + e f / -'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Infix to Postfix Operator Precedence:
1. Operators: ^ (highest, right-associative), * and / (middle, left-associative), + and - (lowest, left-associative).
2. Step 1: Evaluate highest precedence: c ^ d -> c d ^.
3. Step 2: Evaluate multiplication: b * (c d ^) -> b c d ^ *.
4. Step 3: Evaluate addition: a + (b c d ^ *) -> a b c d ^ * +.
5. Step 4: Evaluate division: e / f -> e f /.
6. Step 5: Evaluate subtraction: (a b c d ^ * +) - (e f /) -> a b c d ^ * + e f / -.
7. Result: a b c d ^ * + e f / -.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q22',
    year: 2026,
    subject: '''Programming and Data Structures''',
    topic: '''AVL Trees (Tree Rebalancing Rotations)''',
    questionText: '''An initially balanced AVL tree contains keys {30, 20, 40, 10, 25}. Key 28 is inserted into the tree. Which rotation must be executed at node 30 to restore the AVL balance property?''',
    options: ['''Left-Right (LR) double rotation''', '''Right-Left (RL) double rotation''', '''Left-Left (LL) single rotation''', '''Right-Right (RR) single rotation'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''AVL Insertion and Rebalancing:
1. Existing tree structure:
   - Root is 30.
   - Left child of 30 is 20; right child of 30 is 40.
   - Children of 20: left child 10, right child 25.
2. Insert 28:
   - 28 < 30 (go left to 20).
   - 28 > 20 (go right to 25).
   - 28 > 25 (insert as right child of 25).
3. Compute balance factors (height(left) - height(right)):
   - Node 25: left 0, right 1 -> BF = -1.
   - Node 20: left 1, right 2 -> BF = -1.
   - Node 40: left 0, right 0 -> BF = 0.
   - Node 30: left height = 3 (path 20-25-28), right height = 1 (path 40) -> BF = 3 - 1 = +2 (imbalance!).
4. The newly inserted node 28 is in the RIGHT subtree of the LEFT child of 30.
5. Therefore, a Left-Right (LR) double rotation is required at node 30.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q23',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Sorting Lower Bounds (Decision Tree Model)''',
    questionText: '''Which of the following statements rigorously explains why any comparison-based sorting algorithm requires Ω(n log n) comparisons in the worst case to sort n distinct elements?''',
    options: ['''A binary decision tree sorting n elements must have at least n! leaves, requiring height h ≥ ⌈log_2(n!)⌉ = Ω(n log n).''', '''Every comparison eliminates at most two possible permutations from the search space.''', '''Linear-time sorting algorithms cannot execute on random-access machines.''', '''Sorting reduces to finding the convex hull, which requires quadratic time.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Decision Tree Lower Bound:
- In the decision tree model for comparison sorting, each internal node represents a comparison A[i] ≤ A[j].
- Each of the n! possible input permutations must correspond to at least one distinct leaf node in the decision tree.
- A binary tree of height h has at most 2^h leaves.
- Hence, 2^h ≥ n! => h ≥ log_2(n!).
- By Stirling's approximation, log_2(n!) = n log_2(n) - n log_2(e) + O(log n) = Ω(n log n).
- The worst-case number of comparisons is the height h, which is Ω(n log n).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q24',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Graph Traversal (Breadth-First Search)''',
    questionText: '''Which property of Breadth-First Search (BFS) guarantees that it computes single-source shortest path distances in an unweighted undirected graph G = (V, E) in O(V + E) time?''',
    options: ['''Vertices are visited in non-decreasing order of their distance from the source using a FIFO queue.''', '''Edges are relaxed repeatedly in topological order using a priority queue.''', '''BFS explores the deepest path in the graph before backtracking via recursion.''', '''All cross-edges in the BFS tree have identical edge weights.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''BFS Shortest Path Guarantee:
- BFS enqueues vertices in non-decreasing order of their hop distance d(s, v) from the source s.
- The FIFO queue maintains the invariant that at any moment, the queue contains vertices with distance d followed by vertices with distance d + 1.
- Each vertex and edge is examined a constant number of times, resulting in optimal O(V + E) shortest path computation.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q25',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''Regular Languages (Closure Properties)''',
    questionText: '''Which of the following operations does NOT preserve regularity across the family of Regular Languages?''',
    options: ['''Infinite union of regular languages''', '''Set intersection of two regular languages''', '''Set difference of two regular languages''', '''Homomorphism applied to a regular language'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Closure Properties of Regular Languages:
- Regular languages are closed under finite union, intersection, set difference, complementation, concatenation, Kleene star, and homomorphism.
- However, regular languages are NOT closed under infinite union. For example, any non-regular language L = {a^n b^n | n ≥ 0} is the infinite union of singleton strings ⋃_{n=0}^∞ {a^n b^n}, where each singleton set {a^n b^n} is regular.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q26',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''Pumping Lemma for Regular Languages''',
    questionText: '''Let L be a regular language with pumping length p. For every string w in L with |w| ≥ p, the Pumping Lemma asserts that w can be partitioned as w = xyz such that which of the following conditions holds?''',
    options: ['''|xy| ≤ p, |y| ≥ 1, and for all i ≥ 0, x(y^i)z ∈ L''', '''|yz| ≤ p, |y| ≥ 1, and for all i ≥ 1, x(y^i)z ∈ L''', '''|y| ≤ p, |xy| ≥ 1, and for all i ≥ 0, (x^i)yz ∈ L''', '''|xyz| ≤ p, |y| = 1, and for all i ≥ 0, xy(z^i) ∈ L'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Formal Statement of Pumping Lemma:
For any regular language L, there exists a constant p ≥ 1 such that every w ∈ L with |w| ≥ p can be written as w = xyz satisfying:
1. |xy| ≤ p (pumping substring occurs within the first p symbols),
2. |y| ≥ 1 (the pumped substring is non-empty),
3. For all integers i ≥ 0, x(y^i)z ∈ L.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q27',
    year: 2026,
    subject: '''Compiler Design''',
    topic: '''Lexical Analysis (Longest Match / Maximal Munch)''',
    questionText: '''In compiler lexical analysis, how does a scanner resolve ambiguity when the input stream matches prefixes of multiple regular expressions (for example, the keyword "if" versus an identifier "if_statement")?''',
    options: ['''By adopting the Maximal Munch (longest match) rule, preferring the token that consumes the largest number of input characters.''', '''By prioritizing the token defined earliest in the grammar specification regardless of match length.''', '''By reporting a compile-time syntax error whenever two token rules overlap.''', '''By buffering the entire source file and querying the LALR parser for lookahead context.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Maximal Munch Rule:
- Lexical analyzers use the "Maximal Munch" (longest match) principle: between two competing token matches, the lexer selects the token that matches the longest initial substring.
- Ties in match length are resolved by rule priority (the pattern listed first in the lex specification wins).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q28',
    year: 2026,
    subject: '''Compiler Design''',
    topic: '''Syntax-Directed Translation (S-Attributed vs L-Attributed)''',
    questionText: '''Which of the following statements regarding Syntax-Directed Definitions (SDDs) is correct?''',
    options: ['''An S-attributed SDD contains only synthesized attributes and can be evaluated bottom-up during LR parsing.''', '''An L-attributed SDD forbids synthesized attributes entirely.''', '''Every L-attributed SDD can be evaluated without any restrictions on evaluation order.''', '''S-attributed definitions require inherited attributes to propagate types from left to right.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''S-Attributed and L-Attributed SDDs:
- An S-attributed definition utilizes exclusively synthesized attributes (computed from the attribute values of children nodes).
- Because children are evaluated before parents in bottom-up LR parsing, S-attributed translations can be implemented naturally on the parser stack without creating an explicit parse tree.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q29',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''Process Management (State Transitions)''',
    questionText: '''In a preemptive operating system kernel, which of the following process state transitions is directly triggered by an external hardware timer interrupt?''',
    options: ['''Running -> Ready''', '''Running -> Blocked (Waiting)''', '''Blocked (Waiting) -> Ready''', '''Ready -> Running'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Process State Transitions:
- Running -> Ready: Occurs when a process exhausts its allotted time slice (CPU quantum), triggered by the periodic timer interrupt.
- Running -> Blocked: Occurs when a process requests an I/O operation or waits for a synchronization event.
- Blocked -> Ready: Occurs when an I/O device finishes service and generates an interrupt.
- Ready -> Running: Occurs when the scheduler selects a process and dispatches it.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q30',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''Virtual Memory (Thrashing & Working Set)''',
    questionText: '''In virtual memory systems, what causes Thrashing to occur?''',
    options: ['''The sum of the working set sizes of all active processes exceeds the total number of available physical page frames.''', '''A program references memory locations exclusively within a single small loop.''', '''The Translation Lookaside Buffer (TLB) experiences a 100% hit rate.''', '''All page frames in physical memory are marked as read-only.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Thrashing:
- Thrashing occurs when the operating system spends more time paging (swapping pages between RAM and disk) than executing instructions.
- This happens when total physical memory is insufficient to hold the working sets of all active processes: ∑ WSS_i > Total Available Frames. Processes constantly evict each other's active pages, causing a cascade of page faults.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q31',
    year: 2026,
    subject: '''Databases''',
    topic: '''Relational Design (Canonical Cover)''',
    questionText: '''Which of the following is NOT a mandatory condition for a set of functional dependencies F_c to qualify as a Canonical Cover of F?''',
    options: ['''Every functional dependency in F_c must have a composite right-hand side consisting of at least two attributes.''', '''F_c must be logically equivalent to F (F_c^+ = F^+).''', '''F_c must contain no extraneous attributes on the left-hand or right-hand side of any dependency.''', '''Each left-hand side of a functional dependency in F_c must be unique.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Canonical Cover Properties:
A canonical cover F_c satisfies:
1. F_c is logically equivalent to F (F_c^+ = F^+).
2. No functional dependency in F_c contains extraneous attributes.
3. Each left-hand side of a dependency in F_c is unique (achieved by applying union rule: A -> B and A -> C becomes A -> BC).
- There is NO requirement that the RHS must contain two or more attributes; singleton RHS attributes are completely valid.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q32',
    year: 2026,
    subject: '''Databases''',
    topic: '''Normalization (Lossless Join Decomposition)''',
    questionText: '''A relation schema R is decomposed into R1 and R2. Under what necessary and sufficient condition is this decomposition guaranteed to be a Lossless-Join Decomposition with respect to functional dependency set F?''',
    options: ['''(R1 ∩ R2) -> R1 ∈ F+ or (R1 ∩ R2) -> R2 ∈ F+''', '''(R1 ∪ R2) -> R1 ∈ F+''', '''R1 ∩ R2 = ∅''', '''R1 and R2 must each be in Boyce-Codd Normal Form (BCNF)'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Lossless Join Theorem:
A binary decomposition of R into (R1, R2) is lossless if and only if the common attributes (R1 ∩ R2) form a superkey for at least one of the decomposed relations:
(R1 ∩ R2) -> R1 ∈ F+  OR  (R1 ∩ R2) -> R2 ∈ F+.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q33',
    year: 2026,
    subject: '''Computer Networks''',
    topic: '''Transport Layer (TCP vs UDP Protocols)''',
    questionText: '''Which of the following statements correctly compares the transport layer protocols TCP and UDP?''',
    options: ['''TCP is a connection-oriented byte-stream protocol with a minimum header of 20 bytes, while UDP is a connectionless datagram protocol with an 8-byte header.''', '''TCP guarantees message boundary preservation, whereas UDP transmits continuous unformatted byte streams.''', '''UDP incorporates congestion control mechanisms using additive increase and multiplicative decrease.''', '''TCP checksum computation is optional in IPv4, whereas UDP checksum is mandatory in IPv4.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''TCP vs UDP Characteristics:
- TCP: Connection-oriented, reliable byte-stream service with flow control, congestion control, and a minimum header size of 20 bytes.
- UDP: Connectionless, best-effort message-oriented service that preserves datagram boundaries with a fixed 8-byte header and no built-in flow or congestion control.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q34',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Planar Graphs & Euler's Formula''',
    questionText: '''Let G = (V, E) be a connected simple planar graph with V ≥ 3 vertices, E edges, and F faces. Which of the following statements are ALWAYS TRUE?''',
    options: ['''Euler's formula states that V - E + F = 2.''', '''The number of edges satisfies the upper bound E ≤ 3V - 6.''', '''Every planar graph is 4-colorable.''', '''The complete bipartite graph K_{3,3} is planar.'''],
    correctAnswer: '''A, B, C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Planar Graph Theorems:
- A is TRUE: Euler's formula for connected planar graphs is V - E + F = 2.
- B is TRUE: Since each face is bounded by at least 3 edges, 2E ≥ 3F. Substituting into Euler's formula yields E ≤ 3V - 6.
- C is TRUE: By the Four Color Theorem (Appel and Haken), every planar graph has chromatic number χ(G) ≤ 4.
- D is FALSE: K_{3,3} is the canonical non-planar utility graph (Kuratowski's theorem).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q35',
    year: 2026,
    subject: '''Computer Organization and Architecture''',
    topic: '''Cache Memory (Tag Field Calculation)''',
    questionText: '''A 32-bit byte-addressable system utilizes a 64 KB 4-way set-associative cache with 32-byte cache lines. Calculate the number of bits in the Tag field of the memory address.''',
    options: [],
    correctAnswer: '''18''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Cache Address Field Breakdown:
1. Block size = 32 bytes = 2^5 bytes => Offset field = 5 bits.
2. Total cache size = 64 KB = 2^16 bytes.
3. Total number of lines = 2^16 / 2^5 = 2^11 = 2048 lines.
4. Set associativity = 4 ways.
5. Number of sets = 2048 / 4 = 512 = 2^9 sets.
6. Set Index field = log_2(512) = 9 bits.
7. Tag field = 32 - (Index + Offset) = 32 - (9 + 5) = 32 - 14 = 18 bits.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q36',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Generating Functions''',
    questionText: '''What is the ordinary generating function G(x) = ∑_{n=0}^∞ a_n * x^n for the sequence defined by a_n = 3^n - 2^n for all n ≥ 0?''',
    options: ['''x / ((1 - 3x) * (1 - 2x))''', '''1 / ((1 - 3x) * (1 - 2x))''', '''(1 - x) / ((1 - 3x) * (1 - 2x))''', '''(5x) / ((1 - 3x) * (1 - 2x))'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Generating Function Derivation:
1. G(x) = ∑_{n=0}^∞ (3^n - 2^n) * x^n = ∑_{n=0}^∞ (3x)^n - ∑_{n=0}^∞ (2x)^n.
2. Using geometric series formula ∑_{n=0}^∞ r^n = 1 / (1 - r):
   G(x) = 1 / (1 - 3x) - 1 / (1 - 2x).
3. Combine into a single fraction:
   G(x) = [(1 - 2x) - (1 - 3x)] / [(1 - 3x)(1 - 2x)]
        = (1 - 2x - 1 + 3x) / [(1 - 3x)(1 - 2x)]
        = x / [(1 - 3x)(1 - 2x)].
4. Hence, option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q37',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Matrix Diagonalizability''',
    questionText: '''Under which necessary and sufficient condition is an n x n real matrix A diagonalizable over R?''',
    options: ['''For every eigenvalue λ of A, its geometric multiplicity equals its algebraic multiplicity, and all eigenvalues are real.''', '''A must be a strictly upper-triangular matrix with zero trace.''', '''A must have all identical eigenvalues.''', '''The determinant of A must be strictly equal to its trace.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Diagonalizability Criterion:
- A matrix A is diagonalizable if and only if there exists an invertible matrix P such that P^(-1)AP is diagonal.
- This holds if and only if A has n linearly independent eigenvectors.
- In spectral theory, this is equivalent to: for every eigenvalue λ of A, the geometric multiplicity dim(ker(A - λI)) equals the algebraic multiplicity (multiplicity of λ as a root of the characteristic polynomial), with all eigenvalues lying in R.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q38',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Multivariable Extrema (Hessian Matrix)''',
    questionText: '''Consider the multivariable function f(x, y) = x^3 + y^3 - 3xy. Classify the critical points (0, 0) and (1, 1):''',
    options: ['''(0, 0) is a saddle point, and (1, 1) is a local minimum.''', '''(0, 0) is a local maximum, and (1, 1) is a local minimum.''', '''(0, 0) is a local minimum, and (1, 1) is a saddle point.''', '''Both (0, 0) and (1, 1) are local minima.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Second Derivative Test for Multivariable Extrema:
1. First partial derivatives:
   f_x = 3x^2 - 3y = 0 => y = x^2.
   f_y = 3y^2 - 3x = 0 => x = y^2.
   Substituting y = x^2 gives x = x^4 => x(x^3 - 1) = 0 => x = 0 or x = 1.
   Critical points: (0, 0) and (1, 1).
2. Second partial derivatives:
   f_xx = 6x, f_yy = 6y, f_xy = -3.
3. Discriminant D = f_xx * f_yy - (f_xy)^2 = (6x)(6y) - (-3)^2 = 36xy - 9.
4. Evaluate at (0, 0):
   D = 36(0)(0) - 9 = -9 < 0 => (0, 0) is a SADDLE POINT.
5. Evaluate at (1, 1):
   D = 36(1)(1) - 9 = 27 > 0, and f_xx = 6(1) = 6 > 0 => (1, 1) is a LOCAL MINIMUM.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q39',
    year: 2026,
    subject: '''Probability''',
    topic: '''Bayes' Theorem (Binary Communication Channel)''',
    questionText: '''A digital communications channel transmits bit 0 with probability 0.6 and bit 1 with probability 0.4. Due to channel noise, a transmitted 0 is received as 1 with probability 0.05, and a transmitted 1 is received as 0 with probability 0.10. Given that bit 1 was received at the receiver, what is the probability that bit 1 was actually transmitted?''',
    options: ['''12 / 13 (≈ 0.923)''', '''9 / 10 (≈ 0.900)''', '''3 / 4 (≈ 0.750)''', '''6 / 7 (≈ 0.857)'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Bayes' Theorem Calculation:
1. Prior probabilities: P(T0) = 0.6, P(T1) = 0.4.
2. Transition probabilities:
   - P(R1 | T0) = 0.05
   - P(R1 | T1) = 1 - 0.10 = 0.90
3. Total probability of receiving 1:
   P(R1) = P(T0)*P(R1 | T0) + P(T1)*P(R1 | T1)
         = (0.6 * 0.05) + (0.4 * 0.90)
         = 0.03 + 0.36 = 0.39.
4. Posterior probability P(T1 | R1):
   P(T1 | R1) = [P(T1) * P(R1 | T1)] / P(R1)
              = 0.36 / 0.39 = 36 / 39 = 12 / 13 ≈ 0.923.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q40',
    year: 2026,
    subject: '''Digital Logic''',
    topic: '''FSM State Reduction & Equivalence''',
    questionText: '''In a Mealy finite state machine, under what formal condition are two states S_i and S_j considered equivalent (S_i ~ S_j)?''',
    options: ['''For every input sequence of arbitrary length, applying the sequence starting from S_i produces the identical output sequence as starting from S_j.''', '''Both states must have identical binary state encoding assignments.''', '''Both states transition to the reset state on input 0.''', '''The number of incoming transitions to S_i equals the number of incoming transitions to S_j.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''State Equivalence in FSMs:
- By definition, two states S_i and S_j of an FSM are equivalent if and only if for every possible input sequence x ∈ Σ*, the machine produces exactly the same output sequence regardless of whether it begins in state S_i or S_j.
- Equivalent states can be merged, yielding the minimal state automaton.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q41',
    year: 2026,
    subject: '''Computer Organization and Architecture''',
    topic: '''Arithmetic (Booth's Multiplication Algorithm)''',
    questionText: '''When multiplying multiplicand M by the 6-bit 2's complement multiplier Y = 011110_2 using Booth's multiplication algorithm, how many addition and subtraction operations are performed on the accumulator?''',
    options: ['''1 addition, 1 subtraction''', '''2 additions, 2 subtractions''', '''3 additions, 1 subtraction''', '''4 additions, 0 subtractions'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Booth's Recoding:
1. Multiplier Y = 011110_2.
2. Append Y_{-1} = 0 to the right: bits are (Y5, Y4, Y3, Y2, Y1, Y0, Y_{-1}) = (0, 1, 1, 1, 1, 0, 0).
3. Examine consecutive pairs (Y_i, Y_{i-1}):
   - i = 0: (Y0, Y_{-1}) = (0, 0) -> No operation
   - i = 1: (Y1, Y0) = (1, 0) -> SUBTRACT multiplicand (-M)
   - i = 2: (Y2, Y1) = (1, 1) -> No operation
   - i = 3: (Y3, Y2) = (1, 1) -> No operation
   - i = 4: (Y4, Y3) = (1, 1) -> No operation
   - i = 5: (Y5, Y4) = (0, 1) -> ADD multiplicand (+M)
4. Total operations = 1 addition and 1 subtraction.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q42',
    year: 2026,
    subject: '''Programming and Data Structures''',
    topic: '''Balanced Trees (Red-Black Tree Invariants)''',
    questionText: '''Which of the following is NOT an invariant property of a valid Red-Black Tree?''',
    options: ['''Every path from the root to any NIL leaf node contains an equal number of red nodes.''', '''Every node is either red or black.''', '''The root node is always black.''', '''If a node is red, then both of its children must be black.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Red-Black Tree Properties:
The standard properties are:
1. Every node is either red or black.
2. The root is black.
3. Every leaf (NIL) is black.
4. If a node is red, then both its children are black (no two reds in a row).
5. For each node, all simple paths from the node to descendant leaves contain the same number of BLACK nodes (black-height).
- Option (A) falsely claims paths have an equal number of RED nodes, which is incorrect.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q43',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Shortest Paths (Bellman-Ford Negative Cycle Detection)''',
    questionText: '''How does the Bellman-Ford algorithm reliably detect the presence of a negative-weight cycle reachable from the source vertex s in a directed graph G = (V, E)?''',
    options: ['''After relaxing all edges |V| - 1 times, if any edge (u, v) can still be relaxed such that d[v] > d[u] + w(u, v), a negative cycle exists.''', '''If the topological sorting of vertices fails due to a back-edge.''', '''If any priority queue extract-min operation returns a negative distance value.''', '''If the sum of all edge weights in the graph is strictly negative.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Bellman-Ford Negative Cycle Detection:
- In any graph without negative-weight cycles, the shortest path between any two vertices contains at most |V| - 1 edges.
- Therefore, relaxing all edges |V| - 1 times is guaranteed to find all shortest path distances.
- If an additional |V|-th pass can further reduce any distance (d[v] > d[u] + w(u, v)), then a negative-weight cycle is reachable from s.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q44',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Greedy Algorithms (Huffman Coding Expected Length)''',
    questionText: '''A source alphabet contains five characters {A, B, C, D, E} with occurrence probabilities 0.40, 0.25, 0.15, 0.10, and 0.10, respectively. What is the expected code word length (in bits per character) of the optimal prefix code constructed by Huffman's algorithm?''',
    options: ['''2.15 bits''', '''2.25 bits''', '''2.00 bits''', '''2.40 bits'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Huffman Tree Construction:
1. Initial frequencies: A: 0.40, B: 0.25, C: 0.15, D: 0.10, E: 0.10.
2. Combine lowest two (D and E): weight = 0.10 + 0.10 = 0.20 (node DE).
   Pool: A: 0.40, B: 0.25, DE: 0.20, C: 0.15.
3. Combine lowest two (C and DE): weight = 0.15 + 0.20 = 0.35 (node CDE).
   Pool: A: 0.40, CDE: 0.35, B: 0.25.
4. Combine lowest two (B and CDE): weight = 0.25 + 0.35 = 0.60 (node BCDE).
   Pool: BCDE: 0.60, A: 0.40.
5. Combine remaining two: Root = 1.00.
6. Code lengths:
   - A: depth 1 -> length = 1 bit.
   - B: depth 2 -> length = 2 bits.
   - C: depth 3 -> length = 3 bits.
   - D: depth 4 -> length = 4 bits.
   - E: depth 4 -> length = 4 bits.
7. Expected length L = (0.40 * 1) + (0.25 * 2) + (0.15 * 3) + (0.10 * 4) + (0.10 * 4)
                    = 0.40 + 0.50 + 0.45 + 0.40 + 0.40 = 2.15 bits/symbol.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q45',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Knapsack Problems (Greedy vs Dynamic Programming)''',
    questionText: '''Which of the following statements correctly differentiates the Fractional Knapsack problem from the 0/1 Knapsack problem?''',
    options: ['''Fractional Knapsack exhibits the greedy choice property and can be solved in O(n log n) time, whereas 0/1 Knapsack is NP-complete.''', '''0/1 Knapsack can be solved in polynomial time using a greedy algorithm based on value-to-weight ratio.''', '''Fractional Knapsack cannot be solved using dynamic programming.''', '''Both Fractional and 0/1 Knapsack are solvable in polynomial time using Kruskal's algorithm.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Knapsack Problem Classification:
- Fractional Knapsack allows taking fractions of items. It exhibits both optimal substructure and the greedy choice property, solved optimally in O(n log n) time by sorting items by v_i / w_i.
- 0/1 Knapsack requires taking entire items (0 or 1). It lacks the greedy choice property and is a known NP-complete decision problem (solvable in pseudo-polynomial time O(n * W) via DP).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q46',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''Chomsky Normal Form (Derivation Steps)''',
    questionText: '''Let G be a Context-Free Grammar in Chomsky Normal Form (CNF) where every production is of the form A -> BC or A -> a. How many derivation steps are required to generate a terminal string of length n (n ≥ 1) in G?''',
    options: ['''2n - 1''', '''2n''', '''n^2''', '''2^(n-1)'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''CNF Derivation Steps:
1. In a CNF grammar:
   - Rules of the form A -> BC increase the number of non-terminals by 1.
   - Rules of the form A -> a replace a non-terminal with a terminal.
2. In any parse tree yielding a string of length n:
   - There are n leaves (each produced by a rule A -> a), requiring exactly n steps.
   - The tree has (n - 1) internal branchings (each produced by a rule A -> BC), requiring exactly n - 1 steps.
3. Total number of derivation steps = (n - 1) + n = 2n - 1.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q47',
    year: 2026,
    subject: '''Compiler Design''',
    topic: '''LR Parsing (LALR(1) vs Canonical LR(1) Conflicts)''',
    questionText: '''When constructing an LALR(1) parsing table by merging states of a Canonical LR(1) parser that share identical LR(0) cores, which of the following statements correctly describes the potential conflicts that can be introduced?''',
    options: ['''Merging can introduce Reduce-Reduce conflicts, but can NEVER introduce Shift-Reduce conflicts.''', '''Merging can introduce Shift-Reduce conflicts, but can NEVER introduce Reduce-Reduce conflicts.''', '''Merging can introduce both Shift-Reduce and Reduce-Reduce conflicts.''', '''Merging never introduces any conflicts of any kind.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''LALR(1) State Merging Properties:
- In LR(1) parsing, shift actions depend solely on the LR(0) core and the terminal symbol on the input transition. Because merging only combines states with identical LR(0) cores, no new shift actions are created, making shift-reduce conflicts IMPOSSIBLE to introduce.
- However, reduce actions depend on the union of lookahead sets. Merging can combine lookaheads such that two different reductions have overlapping lookaheads, introducing REDUCE-REDUCE conflicts.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q48',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''CPU Scheduling (Multilevel Feedback Queue)''',
    questionText: '''In a Multilevel Feedback Queue (MLFQ) scheduling algorithm, what mechanism is specifically employed to prevent indefinite starvation of long-running CPU-bound processes?''',
    options: ['''Priority Boost: After a fixed time period S, all processes in the system are moved to the topmost priority queue.''', '''Decreasing the time quantum of queues as priority decreases.''', '''Disallowing any process from ever being demoted to a lower queue.''', '''Scheduling all processes strictly using First-Come, First-Served regardless of priority.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''MLFQ Priority Boost:
- In MLFQ, CPU-bound processes consume their time slice and are demoted to lower-priority queues.
- If a constant stream of interactive (I/O-bound) jobs arrives, lower-priority queues will starve indefinitely.
- The standard solution is Priority Boost: periodically (after time threshold S), the OS elevates all processes to the highest-priority queue, resetting their accumulated quantum and guaranteeing CPU time.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q49',
    year: 2026,
    subject: '''Databases''',
    topic: '''Relational Normalization (BCNF vs 3NF Trade-off)''',
    questionText: '''Which of the following statements correctly characterizes the fundamental trade-off between Boyce-Codd Normal Form (BCNF) and Third Normal Form (3NF) decompositions?''',
    options: ['''A lossless decomposition into 3NF is always guaranteed to preserve all functional dependencies, whereas a lossless decomposition into BCNF may not preserve all functional dependencies.''', '''BCNF decomposition always preserves all functional dependencies, while 3NF may lose dependencies.''', '''Every 3NF decomposition is guaranteed to eliminate all data redundancy and update anomalies.''', '''Testing whether a schema is in 3NF is NP-hard, whereas testing for BCNF is polynomial.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''BCNF vs 3NF Trade-Off:
- For any relation schema, it is always possible to find a decomposition into 3NF that is both lossless-join and dependency-preserving.
- For BCNF, a lossless-join decomposition is always achievable, but dependency preservation CANNOT always be guaranteed.
- Example: R(A, B, C) with F = {AB -> C, C -> B}. Candidate keys are AB and AC. C -> B violates BCNF. Decomposing to eliminate the violation loses dependency AB -> C.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q50',
    year: 2026,
    subject: '''Computer Networks''',
    topic: '''Routing Algorithms (Distance Vector & Count-to-Infinity)''',
    questionText: '''In Distance Vector Routing protocols, what phenomenon causes routing metric values to incrementally increase toward infinity when a link fails, and what mechanism is commonly used to prevent two-node routing loops?''',
    options: ['''Count-to-Infinity problem; mitigated by Split Horizon with Poison Reverse.''', '''TCP Silly Window Syndrome; mitigated by Nagle's algorithm.''', '''BGP routing black hole; mitigated by OSPF link-state advertisements.''', '''Broadcast storm; mitigated by Spanning Tree Protocol.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Count-to-Infinity and Split Horizon:
- In Distance Vector protocols (like RIP), when a destination becomes unreachable, neighboring routers can mistakenly update each other with mutually dependent paths, causing route costs to count up to infinity.
- Split Horizon prevents a router from advertising a route back on the same interface through which it learned it.
- Poison Reverse advertises an unreachable metric (infinity) back on that interface, immediately breaking two-node routing loops.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q51',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''Decidability of Context-Free Languages''',
    questionText: '''Which of the following decision problems are DECIDABLE for the family of Context-Free Languages (CFLs)?''',
    options: ['''Emptiness: Is L(G) = ∅?''', '''Finiteness: Is L(G) a finite language?''', '''Universality: Is L(G) = Σ*?''', '''Equivalence: Is L(G1) = L(G2)?'''],
    correctAnswer: '''A, B''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''CFL Decidability:
- Emptiness (Is L = ∅?): Decidable for CFLs in polynomial time by checking if the start symbol can derive any terminal string.
- Finiteness (Is L finite?): Decidable for CFLs by checking for cycles among productive non-terminals in CNF.
- Universality (Is L = Σ*?): Undecidable for CFLs (reducible from the halting problem / valid computation histories of Turing machines).
- Equivalence (Is L1 = L2?): Undecidable for CFLs.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q52',
    year: 2026,
    subject: '''Compiler Design''',
    topic: '''Code Optimization (Loop Optimizations)''',
    questionText: '''Which of the following are valid loop optimization techniques employed in modern optimizing compilers?''',
    options: ['''Loop-Invariant Code Motion (hoisting statements out of the loop that compute identical values in every iteration).''', '''Induction Variable Elimination (replacing linear expressions of loop counters with simpler operations).''', '''Loop Unrolling (replicating loop bodies to reduce branching overhead and expose instruction-level parallelism).''', '''Loop Fusion (combining two adjacent loops with identical iteration spaces into a single loop).'''],
    correctAnswer: '''A, B, C, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Loop Optimization Techniques:
- All four techniques are classic loop optimizations:
  1. Loop-Invariant Code Motion: Moves invariant calculations outside the loop header.
  2. Induction Variable Elimination: Eliminates redundant counter variables.
  3. Loop Unrolling: Expands iterations to eliminate branch penalties.
  4. Loop Fusion: Merges adjacent loops that share trip counts to improve cache locality.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q53',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''File Systems (Unix Inode Architecture)''',
    questionText: '''A Unix-style file system uses an inode structure with 12 direct block pointers, 1 single indirect pointer, 1 double indirect pointer, and 1 triple indirect pointer. Disk block size is 4 KB (4096 bytes), and each disk block pointer requires 4 bytes. Which of the following statements are TRUE?''',
    options: ['''Each indirect disk block can store exactly 1024 block pointers.''', '''The 12 direct block pointers can address at most 48 KB of file data.''', '''The single indirect block pointer can address at most 4 MB of file data.''', '''The double indirect block pointer can address at most 4 GB of file data.'''],
    correctAnswer: '''A, B, C, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Unix Inode Capacity Calculation:
- Block size = 4096 bytes. Pointer size = 4 bytes.
- Pointers per indirect block = 4096 / 4 = 1024 = 2^10 pointers (A is TRUE).
- 12 direct pointers: 12 * 4 KB = 48 KB (B is TRUE).
- Single indirect pointer: 1024 blocks * 4 KB = 4096 KB = 4 MB (C is TRUE).
- Double indirect pointer: 1024 * 1024 blocks * 4 KB = 2^20 * 4 KB = 4 GB (D is TRUE).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q54',
    year: 2026,
    subject: '''Databases''',
    topic: '''Concurrency Control (Two-Phase Locking Protocol)''',
    questionText: '''Which of the following statements regarding the Two-Phase Locking (2PL) protocol are TRUE?''',
    options: ['''Basic 2PL guarantees that every allowable schedule is conflict serializable.''', '''Basic 2PL does not prevent deadlocks; deadlock detection or prevention mechanisms are still required.''', '''Strict 2PL requires all exclusive locks to be held until transaction commit/abort, thereby guaranteeing Recoverability and avoiding cascading aborts.''', '''Rigorous 2PL requires all locks (both shared and exclusive) to be retained until the transaction terminates.'''],
    correctAnswer: '''A, B, C, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Two-Phase Locking Protocols:
- A is TRUE: 2PL guarantees conflict serializability because transactions serialize according to their lock points.
- B is TRUE: 2PL is susceptible to deadlocks due to circular wait for locks.
- C is TRUE: Strict 2PL holds exclusive locks until commit/abort, guaranteeing that transactions read only committed data (cascadeless).
- D is TRUE: Rigorous 2PL holds ALL locks until commit, making serialization order equal to commit order.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q55',
    year: 2026,
    subject: '''Computer Networks''',
    topic: '''Congestion Control (TCP Tahoe and Reno)''',
    questionText: '''Which of the following statements regarding TCP congestion control mechanisms are TRUE?''',
    options: ['''In the Slow Start phase, the congestion window (cwnd) doubles every Round-Trip Time (RTT) if all segments are acknowledged.''', '''When cwnd reaches ssthresh, TCP transitions from Slow Start into Congestion Avoidance, increasing cwnd linearly by 1 MSS per RTT.''', '''Upon detecting packet loss via three duplicate ACKs, TCP Reno executes Fast Recovery, halving ssthresh and setting cwnd = ssthresh + 3 MSS.''', '''Upon a retransmission timeout (RTO), TCP Reno resets cwnd to 1 MSS and sets ssthresh = cwnd / 2.'''],
    correctAnswer: '''A, B, C, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''TCP Reno and Congestion Control:
- A is TRUE: Slow Start increases cwnd by 1 MSS for every ACK received, resulting in exponential growth (doubling each RTT).
- B is TRUE: When cwnd ≥ ssthresh, TCP enters additive increase (Congestion Avoidance).
- C is TRUE: Fast Retransmit and Fast Recovery in TCP Reno avoids resetting cwnd to 1 upon 3 duplicate ACKs; instead it sets cwnd = ssthresh + 3 MSS.
- D is TRUE: Upon a coarse retransmission timeout (RTO), TCP resets cwnd to 1 MSS and sets ssthresh to half the in-flight window.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q56',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''NP-Completeness (Reductions & Theorems)''',
    questionText: '''Which of the following polynomial-time reductions and statements are KNOWN and VALID in computational complexity theory?''',
    options: ['''3-SAT is polynomial-time reducible to CLIQUE (3-SAT ≤_P CLIQUE).''', '''VERTEX-COVER is polynomial-time reducible to INDEPENDENT-SET (VERTEX-COVER ≤_P INDEPENDENT-SET).''', '''HAMILTONIAN-CYCLE is polynomial-time reducible to the decision version of TRAVELING-SALESPERSON-PROBLEM.''', '''If any single NP-Complete problem can be solved in deterministic polynomial time, then P = NP.'''],
    correctAnswer: '''A, B, C, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''NP-Completeness Foundations:
- A is TRUE: Karp's classic reduction converts 3-SAT clauses into k-clique subgraphs.
- B is TRUE: A vertex subset S is a vertex cover of G iff V \\ S is an independent set of G.
- C is TRUE: Hamiltonian Cycle reduces to TSP by assigning edge weights of 1 for graph edges and 2 for non-edges, checking for tour of length ≤ |V|.
- D is TRUE: By definition of NP-completeness, every problem in NP reduces to an NP-complete problem in polynomial time. Hence solving one in P implies P = NP.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q57',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Combinatorics (Surjective Functions)''',
    questionText: '''Calculate the total number of surjective (onto) functions from a set A containing 5 elements to a set B containing 3 elements.''',
    options: [],
    correctAnswer: '''150''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Surjective Functions Formula:
Number of onto functions from set of size m to set of size n:
N = sum_{k=0}^n (-1)^k * C(n, k) * (n - k)^m.
Here m = 5, n = 3:
N = C(3, 0)*3^5 - C(3, 1)*2^5 + C(3, 2)*1^5 - C(3, 3)*0^5
  = 1 * 243 - 3 * 32 + 3 * 1 - 0
  = 243 - 96 + 3 = 150.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q58',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Determinant of Block Triangular Matrix''',
    questionText: '''Consider the 4 x 4 block upper-triangular matrix:

M = [
  [2, 1, 5, 7],
  [0, 3, 4, 6],
  [0, 0, 4, 2],
  [0, 0, 1, 5]
]

Calculate the determinant of matrix M.''',
    options: [],
    correctAnswer: '''108''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Determinant of Block Triangular Matrix:
1. Matrix M has block structure:
   M = [ A  C ]
       [ 0  B ]
   where A = [[2, 1], [0, 3]] and B = [[4, 2], [1, 5]].
2. det(M) = det(A) * det(B).
3. det(A) = 2*3 - 1*0 = 6.
4. det(B) = 4*5 - 2*1 = 20 - 2 = 18.
5. det(M) = 6 * 18 = 108.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q59',
    year: 2026,
    subject: '''Digital Logic''',
    topic: '''Multiplexers (Tree Architecture)''',
    questionText: '''Calculate the minimum number of 4-to-1 multiplexers required to construct a 64-to-1 multiplexer without using any additional external logic gates.''',
    options: [],
    correctAnswer: '''21''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Multiplexer Tree Synthesis:
1. Stage 1: To accommodate 64 input lines using 4-to-1 MUXes:
   64 / 4 = 16 MUXes (producing 16 intermediate outputs).
2. Stage 2: To multiplex the 16 outputs:
   16 / 4 = 4 MUXes (producing 4 intermediate outputs).
3. Stage 3: To multiplex the 4 outputs into a single output:
   4 / 4 = 1 MUX.
4. Total 4-to-1 MUXes required = 16 + 4 + 1 = 21.
5. Verification via formula: (64 - 1) / (4 - 1) = 63 / 3 = 21.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q60',
    year: 2026,
    subject: '''Computer Organization and Architecture''',
    topic: '''Memory Hierarchy (Average Memory Access Time)''',
    questionText: '''A processor memory hierarchy comprises an L1 cache, an L2 cache, and main memory. The access time of L1 cache is 1 ns with a hit rate of 90%. The access time of L2 cache is 10 ns with a local hit rate of 80%. Main memory access time is 100 ns. Caches are accessed sequentially on a miss. Calculate the Average Memory Access Time (AMAT) of the processor in nanoseconds.''',
    options: [],
    correctAnswer: '''4''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''AMAT Calculation:
1. AMAT = T_L1 + (1 - H_L1) * [T_L2 + (1 - H_L2) * T_MM].
2. Given:
   T_L1 = 1 ns, H_L1 = 0.90 => Miss_L1 = 0.10.
   T_L2 = 10 ns, H_L2 = 0.80 => Miss_L2 = 0.20.
   T_MM = 100 ns.
3. L2 Miss Penalty = T_L2 + Miss_L2 * T_MM
                   = 10 + 0.20 * 100 = 10 + 20 = 30 ns.
4. AMAT = 1 + 0.10 * 30 = 1 + 3.0 = 4 ns.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q61',
    year: 2026,
    subject: '''Programming and Data Structures''',
    topic: '''C Recursion Tracing''',
    questionText: '''Consider the following recursive C function:

int fun(int n) {
    if (n <= 1) return 1;
    if (n % 2 == 0) return 2 * fun(n / 2) + 1;
    return fun(n - 1) + 3;
}

Calculate the integer value returned by the function call fun(10).''',
    options: [],
    correctAnswer: '''21''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Recursive Execution Trace:
1. fun(10): n is even -> 2 * fun(5) + 1.
2. fun(5): n is odd -> fun(4) + 3.
3. fun(4): n is even -> 2 * fun(2) + 1.
4. fun(2): n is even -> 2 * fun(1) + 1.
5. fun(1): returns 1.
Unwinding:
- fun(2) = 2 * 1 + 1 = 3.
- fun(4) = 2 * 3 + 1 = 7.
- fun(5) = 7 + 3 = 10.
- fun(10) = 2 * 10 + 1 = 21.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q62',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Graph Theory (Spanning Trees of Bipartite Graphs)''',
    questionText: '''Calculate the total number of spanning trees in the complete bipartite graph K_{2, 3}.''',
    options: [],
    correctAnswer: '''12''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Spanning Trees of Complete Bipartite Graph:
- Cayley's theorem extension for complete bipartite graph K_{m, n}:
  Number of spanning trees T(K_{m, n}) = m^(n - 1) * n^(m - 1).
- For K_{2, 3}, m = 2 and n = 3:
  T(K_{2, 3}) = 2^(3 - 1) * 3^(2 - 1)
              = 2^2 * 3^1
              = 4 * 3 = 12.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q63',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''Disk Geometry (Storage Capacity)''',
    questionText: '''A hard disk drive contains 8 double-sided platters (all recording surfaces utilized). Each surface is divided into 2048 concentric tracks, and each track is formatted into 512 sectors. If each sector stores 512 bytes of user data, calculate the total storage capacity of the disk drive in Megabytes (MB), where 1 MB = 2^20 bytes.''',
    options: [],
    correctAnswer: '''8192''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Disk Storage Capacity:
1. Number of surfaces = 8 platters * 2 surfaces/platter = 16 surfaces = 2^4.
2. Tracks per surface = 2048 = 2^11.
3. Sectors per track = 512 = 2^9.
4. Bytes per sector = 512 = 2^9 bytes.
5. Total capacity in bytes:
   2^4 * 2^11 * 2^9 * 2^9 = 2^33 bytes.
6. Capacity in MB = 2^33 / 2^20 = 2^13 = 8192 MB.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q64',
    year: 2026,
    subject: '''Databases''',
    topic: '''Relational Algebra (Natural Join Cardinality)''',
    questionText: '''Let relation R(A, B) contain exactly 50 tuples and relation S(B, C) contain exactly 30 tuples. Attribute B in R is a foreign key referencing the primary key B of relation S. Neither relation contains any NULL values. Calculate the EXACT number of tuples in the natural join (R ⋈ S).''',
    options: [],
    correctAnswer: '''50''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Natural Join Cardinality under Foreign Key:
1. Attribute B is the primary key of S, so all B values in S are strictly unique.
2. Attribute B in R is a foreign key referencing S(B). By referential integrity (and no NULLs), every tuple in R matches exactly one tuple in S.
3. Therefore, each of the 50 tuples in R joins with exactly one tuple in S, resulting in exactly 50 tuples in R ⋈ S.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK8_Q65',
    year: 2026,
    subject: '''Computer Networks''',
    topic: '''IPv4 Subnetting (Usable Host IP Count)''',
    questionText: '''An organization is allocated the network block 192.168.10.0/24. The network administrator partitions this address space into subnets with a /26 prefix length. Calculate the maximum number of usable host IP addresses available in each /26 subnet.''',
    options: [],
    correctAnswer: '''62''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Subnet Host Capacity:
1. Subnet mask prefix length = /26.
2. Host bits h = 32 - 26 = 6 bits.
3. Total IP addresses per subnet = 2^6 = 64.
4. Two addresses in each subnet are reserved:
   - All host bits 0: Subnet Network ID.
   - All host bits 1: Subnet Directed Broadcast Address.
5. Usable host addresses = 2^h - 2 = 64 - 2 = 62.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
];
