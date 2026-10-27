// AUTO-GENERATED GATE CS MOCK 10 QUESTIONS (ULTRA-TOUGH FACULTY LEVEL)
import '../models/models.dart';

final List<PYQ> csFullMock10Questions = [
  PYQ(
    id: 'CS_MOCK10_Q01',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Verbal Ability''',
    questionText: '''Select the word that best completes the sentence to convey precise logical meaning:

"While initial consumer interest in the virtual reality headset was _______, dwindling after a few weeks, enterprise demand for industrial simulation proved enduring."''',
    options: ['''ephemeral''', '''perennial''', '''insidious''', '''salient'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Vocabulary in Context:
1. The contrast signaled by "While ... dwindling after a few weeks, enterprise demand ... proved enduring" requires a word meaning lasting for a very short time, transitory, or fleeting.
2. "Ephemeral" means lasting for a very short time; transitory; fleeting.
3. "Perennial" means lasting or existing for a long or apparently infinite time (the opposite of ephemeral).
4. "Insidious" means proceeding in a gradual, subtle way, but with harmful effects.
5. "Salient" means most noticeable or important.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q02',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Verbal Ability (Conditional Clauses)''',
    questionText: '''Identify the grammatically correct sentence that observes the rules of past unreal (third) conditionals:''',
    options: ['''If the operating system kernel had validated the pointer bounds, the buffer overflow exploit would have been prevented.''', '''If the operating system kernel validated the pointer bounds, the buffer overflow exploit would have been prevented.''', '''If the operating system kernel had validated the pointer bounds, the buffer overflow exploit will have been prevented.''', '''If the operating system kernel would have validated the pointer bounds, the buffer overflow exploit had been prevented.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Third Conditional Syntax:
- The standard structure for a past unreal conditional is:
  "If + past perfect (had + past participle), ... would have + past participle."
- Option (A) strictly adheres to this: "If the ... had validated ..., the ... would have been prevented."
- Options (B), (C), and (D) contain tense mismatch errors.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q03',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude (Compound vs Simple Interest)''',
    questionText: '''The difference between the compound interest (compounded annually) and simple interest on a principal amount P for 2 years at an annual interest rate of 10% is Rs. 150. What is the principal amount P?''',
    options: ['''Rs. 12,000''', '''Rs. 15,000''', '''Rs. 18,000''', '''Rs. 20,000'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Interest Difference Formula (for 2 years):
1. Difference D = P * (r / 100)^2.
2. Given D = 150, r = 10%:
   150 = P * (10 / 100)^2 = P * (1 / 10)^2 = P / 100.
3. Therefore, P = 150 * 100 = Rs. 15,000.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q04',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Spatial Aptitude (Cube Combinations)''',
    questionText: '''A solid 3 x 3 x 3 cube made of 27 identical small unit cubes is painted red on all six outer faces. How many of the 27 unit cubes have EXACTLY TWO painted faces?''',
    options: ['''8''', '''12''', '''6''', '''1'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Cube Painting Properties (3 x 3 x 3):
- Corner cubes (3 faces painted) = 8 (one at each of the 8 vertices).
- Edge cubes (2 faces painted) = 12 * (n - 2) = 12 * (3 - 2) = 12 (one along the center of each of the 12 edges).
- Face center cubes (1 face painted) = 6 * (n - 2)^2 = 6 * (1)^2 = 6.
- Internal core cubes (0 faces painted) = (n - 2)^3 = 1^3 = 1.
- Total = 8 + 12 + 6 + 1 = 27.
- Exactly two painted faces = 12 unit cubes.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q05',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude (Venn Diagrams)''',
    questionText: '''In a cohort of 100 computer science students, 60 know C++, 45 know Python, and 20 know both languages. How many students in the cohort know NEITHER C++ nor Python?''',
    options: ['''10''', '''15''', '''20''', '''25'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Set Union and Complement:
1. Total students N = 100.
2. |C++| = 60, |Python| = 45, |C++ ∩ Python| = 20.
3. |C++ ∪ Python| = |C++| + |Python| - |C++ ∩ Python|
                  = 60 + 45 - 20 = 85.
4. Students knowing neither = N - |C++ ∪ Python| = 100 - 85 = 15.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q06',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude (Work and Efficiency)''',
    questionText: '''Worker A is 50% more efficient than worker B. If worker B alone takes 30 days to complete an engineering project, how many days will worker A and worker B take to complete the project working together?''',
    options: ['''10 days''', '''12 days''', '''15 days''', '''18 days'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Work Rates and Efficiency:
1. Let the daily work efficiency of B be E_B = 1 unit/day.
2. Total work = 30 days * 1 unit/day = 30 units.
3. A is 50% more efficient than B, so E_A = 1.5 units/day.
4. Combined efficiency of A and B = E_A + E_B = 1.5 + 1.0 = 2.5 units/day.
5. Time taken working together = Total work / Combined efficiency
                                = 30 / 2.5 = 12 days.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q07',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Data Interpretation''',
    questionText: '''The annual power consumption of a data center over four consecutive years is recorded as: Year 1: 80 MWh, Year 2: 100 MWh, Year 3: 125 MWh, Year 4: 150 MWh. What is the percentage increase in power consumption from Year 1 to Year 4?''',
    options: ['''70.0%''', '''75.0%''', '''87.5%''', '''92.5%'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Percentage Growth Calculation:
1. Base value (Year 1) = 80 MWh.
2. Final value (Year 4) = 150 MWh.
3. Absolute increase = 150 - 80 = 70 MWh.
4. Percentage increase = (70 / 80) * 100% = (7 / 8) * 100% = 87.5%.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q08',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Logical Reasoning (Circular Arrangement)''',
    questionText: '''Six engineers—P, Q, R, S, T, and U—are seated symmetrically around a circular conference table facing the center.
1. P is seated directly opposite to S.
2. Q is seated immediately to the right of P.
3. R is seated immediately to the left of P.
4. T is not seated adjacent to Q.

Who is seated immediately to the right of S?''',
    options: ['''T''', '''U''', '''Q''', '''R'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Circular Table Placement:
Let positions 1 to 6 be arranged clockwise around the table.
1. Place P at position 1 (facing center).
2. Opposite to P (position 4) is S.
3. Facing the center from position 1 (P):
   - Immediately to P's right (counterclockwise / pos 6) or clockwise:
     Let's establish convention:
     Clockwise positions: 1, 2, 3, 4, 5, 6.
     At position 1 facing center:
     - Right hand points toward position 6.
     - Left hand points toward position 2.
     Clue 2: Q is immediately to the right of P -> Q is at position 6.
     Clue 3: R is immediately to the left of P -> R is at position 2.
     Current arrangement:
     Pos 1: P
     Pos 2: R
     Pos 3: _
     Pos 4: S
     Pos 5: _
     Pos 6: Q
4. Remaining engineers: T and U for positions 3 and 5.
   - Clue 4: T is not seated adjacent to Q (pos 6).
   - Therefore, T cannot be at position 5 (adjacent to Q)!
   - Thus, T must be at position 3, leaving U at position 5.
   Full circular arrangement (clockwise):
   1: P, 2: R, 3: T, 4: S, 5: U, 6: Q.
5. Who is seated immediately to the right of S?
   - S is at position 4 facing the center.
   - From position 4 facing center:
     Right hand points toward position 3 (T).
     Left hand points toward position 5 (U).
   - Therefore, the engineer immediately to the right of S is T.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q09',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude (Geometry)''',
    questionText: '''A square of side length 14 cm has a circle inscribed inside it, touching all four edges. What is the area of the region inside the square that lies OUTSIDE the circle? (Take π = 22/7).''',
    options: ['''38 cm^2''', '''42 cm^2''', '''46 cm^2''', '''52 cm^2'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Area of Shaded Region:
1. Side of square s = 14 cm.
   Area of square = s^2 = 14^2 = 196 cm^2.
2. Diameter of inscribed circle = side of square = 14 cm => Radius r = 7 cm.
   Area of circle = π * r^2 = (22 / 7) * 7^2 = 22 * 7 = 154 cm^2.
3. Shaded region outside the circle = Area of square - Area of circle
                                   = 196 - 154 = 42 cm^2.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q10',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Critical Reading''',
    questionText: '''Read the following passage:
"Contemporary public-key cryptography rests predominantly on the computational intractability of integer factorization (RSA) and discrete logarithms (ECC). However, Shor's algorithm demonstrates that a sufficiently fault-tolerant quantum computer running in polynomial time can completely dismantle these mathematical primitives. Consequently, the global cryptographic standard must transition toward Post-Quantum Cryptography (PQC), prioritizing lattice-based and hash-based constructions that exhibit provable resilience against both classical and quantum adversaries."

Which of the following statements is most strongly corroborated by the passage?''',
    options: ['''Lattice-based and hash-based cryptographic algorithms are resilient against known quantum cryptanalytic algorithms.''', '''Shor's algorithm can be executed efficiently on existing classical von Neumann computers.''', '''RSA and ECC will remain mathematically secure against fault-tolerant quantum computers.''', '''Post-quantum cryptography completely eliminates the need for mathematical encryption.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Critical Reading Inference:
- The passage states that Shor's algorithm breaks RSA and ECC on quantum computers, making transition to Post-Quantum Cryptography (PQC) essential.
- It specifically highlights lattice-based and hash-based constructions as exhibiting "provable resilience against both classical and quantum adversaries."
- This directly corroborates option (A).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q11',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Set Theory (Power Set of Cartesian Product)''',
    questionText: '''Let A be a set with 3 elements and B be a set with 2 elements. What is the cardinality of the power set of the Cartesian product (A × B), denoted |P(A × B)|?''',
    options: ['''32''', '''64''', '''128''', '''256'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Cartesian Product and Power Set:
1. |A| = 3, |B| = 2.
2. |A × B| = |A| * |B| = 3 * 2 = 6.
3. The power set P(S) of any set S of size k has cardinality 2^k.
4. |P(A × B)| = 2^6 = 64.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q12',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Group Theory (Multiplicative Group Modulo p)''',
    questionText: '''Let p be a prime number. The algebraic structure (Z_p^*, ×_p), consisting of non-zero integers modulo p under multiplication modulo p, forms a group. What is the order of this group?''',
    options: ['''p''', '''p - 1''', '''p + 1''', '''p^2'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Multiplicative Group of Integers Modulo p:
- Z_p^* consists of all elements in {1, 2, ..., p - 1} that are coprime to p.
- Since p is prime, every integer from 1 to p - 1 is coprime to p.
- Euler's totient function φ(p) = p - 1.
- Therefore, the order of the group (Z_p^*, ×_p) is p - 1.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q13',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Systems of Linear Equations (Rouché-Capelli Theorem)''',
    questionText: '''Consider a system of m linear equations in n unknowns: A * x = b, with augmented matrix [A | b]. Under what condition does the system possess a UNIQUE solution?''',
    options: ['''rank(A) = rank([A | b]) = n''', '''rank(A) = rank([A | b]) < n''', '''rank(A) < rank([A | b])''', '''rank(A) = m and rank([A | b]) = n with m < n'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Rouché-Capelli Theorem:
1. System is consistent iff rank(A) = rank([A | b]). If rank(A) < rank([A | b]), the system is inconsistent (no solution).
2. When consistent:
   - If rank(A) = rank([A | b]) = n (number of variables), there are no free variables, yielding a UNIQUE solution.
   - If rank(A) = rank([A | b]) < n, there are n - rank(A) free variables, yielding infinitely many solutions.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q14',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Mean Value Theorem''',
    questionText: '''For the function f(x) = x^2 defined on the closed interval [1, 3], find the value of c guaranteed by Lagrange's Mean Value Theorem such that f'(c) = (f(3) - f(1)) / (3 - 1):''',
    options: ['''1.5''', '''2.0''', '''2.5''', '''sqrt(3)'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Lagrange's Mean Value Theorem Application:
1. f(x) = x^2 is continuous on [1, 3] and differentiable on (1, 3).
2. f(1) = 1, f(3) = 9.
3. Average rate of change = (9 - 1) / (3 - 1) = 8 / 2 = 4.
4. f'(x) = 2x.
5. Set f'(c) = 4 => 2c = 4 => c = 2.0.
6. Since 2.0 ∈ (1, 3), c = 2.0.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q15',
    year: 2026,
    subject: '''Probability''',
    topic: '''Independent Events''',
    questionText: '''Let A and B be two independent events with non-zero probabilities P(A) > 0 and P(B) > 0. Which of the following relationships is ALWAYS TRUE?''',
    options: ['''P(A | B) = P(A)''', '''P(A ∩ B) = 0''', '''P(A ∪ B) = P(A) + P(B)''', '''P(A | B) = P(B | A)'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Independent Events Definition:
- Two events A and B are statistically independent if and only if P(A ∩ B) = P(A) * P(B).
- By conditional probability: P(A | B) = P(A ∩ B) / P(B) = (P(A) * P(B)) / P(B) = P(A).
- (P(A ∩ B) = 0 characterizes mutually exclusive events, not independent events).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q16',
    year: 2026,
    subject: '''Digital Logic''',
    topic: '''Decoders (Logic Function Implementation)''',
    questionText: '''How many 3-to-8 line decoders with enable inputs are required to construct a 5-to-32 line decoder without using any external logic gates?''',
    options: ['''4''', '''5''', '''6''', '''8'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Decoder Expansion Architecture:
1. Output lines required = 32.
   Each 3-to-8 decoder provides 8 outputs.
   Number of 3-to-8 decoders in the output stage = 32 / 8 = 4 decoders.
2. To selectively enable one of these 4 decoders based on the 2 most significant input bits (using active enable lines), a 5th 3-to-8 decoder (or 2-to-4 decoder) is used as the tree selector.
3. Therefore, exactly 4 + 1 = 5 decoders of size 3-to-8 are required.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q17',
    year: 2026,
    subject: '''Digital Logic''',
    topic: '''Sequential Circuit Timing (Maximum Clock Frequency)''',
    questionText: '''A synchronous sequential circuit uses D flip-flops with clock-to-Q delay t_cq = 2 ns and setup time t_setup = 1 ns. The combinational logic path between flip-flops has a maximum propagation delay t_comb = 7 ns. Assuming zero clock skew, what is the MAXIMUM operating clock frequency of the circuit?''',
    options: ['''50 MHz''', '''80 MHz''', '''100 MHz''', '''125 MHz'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Maximum Clock Frequency Calculation:
1. Minimum clock period T_min = t_cq + t_comb + t_setup.
2. Given t_cq = 2 ns, t_comb = 7 ns, t_setup = 1 ns:
   T_min = 2 + 7 + 1 = 10 ns.
3. Maximum operating frequency f_max = 1 / T_min = 1 / (10 * 10^-9 s) = 10^8 Hz = 100 MHz.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q18',
    year: 2026,
    subject: '''Computer Organization and Architecture''',
    topic: '''Direct Memory Access (DMA Modes)''',
    questionText: '''In which DMA operational mode does the DMA controller gain control of the system bus to transfer exactly ONE data word, and then immediately relinquishes the bus back to the CPU?''',
    options: ['''Cycle Stealing mode''', '''Burst (Block Transfer) mode''', '''Transparent mode''', '''Demand Transfer mode'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''DMA Operating Modes:
- Cycle Stealing Mode: The DMA controller requests the bus for a single memory cycle, transfers one word of data, and immediately returns bus control to the CPU, interleaving I/O with CPU execution.
- Burst Mode: The DMA controller retains continuous control of the bus until an entire block of data is transferred.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q19',
    year: 2026,
    subject: '''Computer Organization and Architecture''',
    topic: '''Memory Hierarchy (Locality of Reference)''',
    questionText: '''When a program repeatedly accesses the instructions of a tight loop located at consecutive memory addresses, which types of locality of reference are primarily exhibited?''',
    options: ['''Both Temporal and Spatial Locality''', '''Temporal Locality only''', '''Spatial Locality only''', '''Neither Temporal nor Spatial Locality'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Locality in Loops:
- Spatial Locality: Executing sequential instructions in memory benefits from fetching adjacent words into the cache block.
- Temporal Locality: The loop iterates repeatedly, reusing the same instructions in the near future.
- Hence, tight loop execution strongly exhibits BOTH Temporal and Spatial Locality.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q20',
    year: 2026,
    subject: '''Programming and Data Structures''',
    topic: '''C Memory Layout (Structure Padding & Alignment)''',
    questionText: '''Consider the following C struct declaration on a 32-bit architecture with 4-byte word alignment (where sizeof(char) = 1, sizeof(int) = 4, and integers must be aligned at 4-byte boundaries):

```c
struct Record {
    char a;
    int b;
    char c;
};
```
What is the value of sizeof(struct Record)?''',
    options: ['''6 bytes''', '''8 bytes''', '''12 bytes''', '''16 bytes'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Structure Padding and Alignment:
1. Member `char a`: occupies byte 0.
2. Next member is `int b` (requires 4-byte alignment). Bytes 1, 2, 3 are added as internal padding.
3. Member `int b`: occupies bytes 4, 5, 6, 7.
4. Member `char c`: occupies byte 8.
5. The overall struct size must be a multiple of the largest member's alignment requirement (4 bytes).
   Currently size is 9 bytes. To reach a multiple of 4, 3 trailing padding bytes (bytes 9, 10, 11) are added.
6. Total size = 12 bytes.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q21',
    year: 2026,
    subject: '''Programming and Data Structures''',
    topic: '''Linked Lists (Floyd's Cycle Finding Algorithm)''',
    questionText: '''What are the optimal worst-case time and auxiliary space complexities of Floyd's Cycle-Finding (Tortoise and Hare) algorithm to detect a loop in a singly linked list of n nodes?''',
    options: ['''Time: O(n), Space: O(1)''', '''Time: O(n log n), Space: O(1)''', '''Time: O(n), Space: O(n)''', '''Time: O(n^2), Space: O(1)'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Floyd's Cycle Detection (Tortoise and Hare):
- The algorithm uses two pointers: slow (advances 1 node per step) and fast (advances 2 nodes per step).
- If a cycle exists, the relative distance between them decreases by 1 node per iteration, guaranteeing they meet within O(n) steps.
- The algorithm requires only two pointer variables, achieving strictly O(1) auxiliary space.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q22',
    year: 2026,
    subject: '''Programming and Data Structures''',
    topic: '''Graph Representations (Matrix vs List Trade-offs)''',
    questionText: '''Which of the following operations can be performed in strictly O(1) worst-case time using an Adjacency Matrix representation, but requires O(deg(u)) time using an Adjacency List representation?''',
    options: ['''Testing whether a directed edge (u, v) exists in graph G.''', '''Finding all vertices adjacent to vertex u.''', '''Computing the sum of in-degrees of all vertices.''', '''Inserting a new vertex into the graph.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Adjacency Matrix vs List:
- In an adjacency matrix A, checking edge existence (u, v) is a direct array lookup A[u][v] == 1, taking O(1) time.
- In an adjacency list, checking if v is in u's linked list requires traversing the neighbors of u, taking O(deg(u)) time.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q23',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Recurrence Relations (Extended Master Theorem)''',
    questionText: '''Consider the divide-and-conquer recurrence relation:
T(n) = 2 * T(n / 2) + n * log_2(n), with T(1) = 1.
What is the asymptotic tight bound of T(n)?''',
    options: ['''Θ(n * (log n)^2)''', '''Θ(n * log n)''', '''Θ(n^2)''', '''Θ(n)'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Master Theorem Case 2 Extension:
1. Recurrence: T(n) = a * T(n / b) + f(n), with a = 2, b = 2.
2. n^(log_b a) = n^(log_2 2) = n^1 = n.
3. f(n) = n * log_2(n) = Θ(n^(log_b a) * (log n)^k) with k = 1.
4. By the extended Master Theorem (Case 2):
   T(n) = Θ(n^(log_b a) * (log n)^(k + 1))
        = Θ(n * (log n)^(1 + 1)) = Θ(n * (log n)^2).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q24',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Shortest Paths (Dijkstra's Negative Weight Failure)''',
    questionText: '''Why does Dijkstra's single-source shortest path algorithm fail to compute correct shortest paths on graphs containing negative-weight edges?''',
    options: ['''Dijkstra's greedy choice assumes that once a vertex is marked settled (visited), its shortest path distance is finalized and can never decrease.''', '''Dijkstra's algorithm requires the input graph to be acyclic.''', '''Negative weights cause the priority queue to enter an infinite loop.''', '''Relaxation of negative edges violates the triangle inequality.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Dijkstra's Greedy Assumption:
- Dijkstra's algorithm greedily extracts the unvisited vertex u with minimum d[u] and marks it finalized.
- If negative edge weights exist, a longer path through an unsettled vertex could subsequently reach u with an even smaller total distance, violating the algorithm's fundamental greedy invariant.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q25',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''Regular Expressions (Equivalence Identities)''',
    questionText: '''Which of the following Regular Expressions does NOT generate the universal set {a, b}* of all strings over alphabet Σ = {a, b}?''',
    options: ['''(a* b*)*''', '''(a + b)*''', '''(a* + b*)*''', '''(a b)*'''],
    correctAnswer: '''D''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Regular Expression Equivalence:
- (a + b)* generates all strings in {a, b}*.
- (a* b*)* generates all strings in {a, b}* because any string is a concatenation of zero or more blocks of a's followed by b's.
- (a* + b*)* also generates all strings in {a, b}*.
- (a b)* generates only strings of the form ε, ab, abab, ababab, ... (alternating equal number of a's and b's), which is a strict subset of {a, b}*.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q26',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''Context-Free Languages (Pumping Lemma Constraints)''',
    questionText: '''According to the Pumping Lemma for Context-Free Languages, any string w in a CFL L with |w| ≥ p can be partitioned as w = uvxyz. Which constraint must be satisfied by the pumped substrings v and y?''',
    options: ['''|vxy| ≤ p and |vy| ≥ 1''', '''|vxy| ≥ p and |vy| = 1''', '''|uv| ≤ p and |xy| ≥ 1''', '''|xyz| ≤ p and |v| = |y|'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''CFL Pumping Lemma Conditions:
For any context-free language L with pumping length p, every w ∈ L with |w| ≥ p can be written as w = uvxyz such that:
1. |vxy| ≤ p (the middle section is bounded by p),
2. |vy| ≥ 1 (at least one of v or y is non-empty),
3. For all i ≥ 0, u(v^i)x(y^i)z ∈ L.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q27',
    year: 2026,
    subject: '''Compiler Design''',
    topic: '''LL(1) Parsing (Grammar Conflict Conditions)''',
    questionText: '''Under what condition is a context-free grammar with productions A -> α | β guaranteed to have NO LL(1) parsing conflicts?''',
    options: ['''FIRST(α) ∩ FIRST(β) = ∅, and if β can derive ε, then FIRST(α) ∩ FOLLOW(A) = ∅.''', '''FIRST(α) = FIRST(β), and FOLLOW(A) = ∅.''', '''Both α and β must derive ε simultaneously.''', '''Every production must be left-recursive.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''LL(1) Grammar Definition:
A grammar is LL(1) if and only if for every pair of productions A -> α | β:
1. FIRST(α) ∩ FIRST(β) = ∅ (disjoint lookaheads).
2. At most one of α or β can derive ε.
3. If β =>* ε, then FIRST(α) ∩ FOLLOW(A) = ∅.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q28',
    year: 2026,
    subject: '''Compiler Design''',
    topic: '''Code Optimization (Basic Block Leaders)''',
    questionText: '''In the algorithm to partition intermediate three-address code into Basic Blocks, which of the following instructions is NOT designated as a Leader?''',
    options: ['''Any instruction that immediately precedes a conditional jump instruction.''', '''The very first three-address instruction of the program.''', '''Any instruction that is the target of a conditional or unconditional jump.''', '''Any instruction that immediately follows a conditional or unconditional jump.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Basic Block Leader Rules:
The three rules for identifying leaders are:
1. The first instruction of the program is a leader.
2. Any instruction that is the target of a conditional or unconditional jump is a leader.
3. Any instruction that immediately follows a conditional or unconditional jump is a leader.
- An instruction preceding a jump is just the tail of a basic block, NOT a leader.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q29',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''Deadlocks (Coffman Conditions)''',
    questionText: '''Which of the following is NOT one of the four Coffman conditions necessary for a deadlock to arise in an operating system?''',
    options: ['''Preemptive resource revocation''', '''Mutual exclusion''', '''Hold and wait''', '''Circular wait'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Coffman Conditions for Deadlock:
The four necessary conditions are:
1. Mutual Exclusion (resources cannot be shared).
2. Hold and Wait (processes holding resources request new ones).
3. NO Preemption (resources cannot be forcibly revoked).
4. Circular Wait (circular chain of waiting processes).
- "Preemptive resource revocation" is the OPPOSITE of the "No Preemption" condition.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q30',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''Virtual Memory (Effective Memory Access Time with TLB)''',
    questionText: '''A system uses a Translation Lookaside Buffer (TLB) with hit ratio h and access time t_tlb. Physical memory access time is t_m. If page table lookup requires a single memory access on a TLB miss, what is the Effective Memory Access Time (EMAT)?''',
    options: ['''EMAT = t_tlb + t_m + (1 - h) * t_m''', '''EMAT = h * t_tlb + (1 - h) * t_m''', '''EMAT = t_tlb + h * t_m''', '''EMAT = (1 - h) * (t_tlb + t_m)'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''EMAT Formula:
- TLB Hit (probability h): TLB lookup + Memory access to data = t_tlb + t_m.
- TLB Miss (probability 1 - h): TLB lookup + Page table memory access + Data memory access = t_tlb + 2*t_m.
- EMAT = h * (t_tlb + t_m) + (1 - h) * (t_tlb + 2*t_m)
       = t_tlb + h*t_m + 2*(1 - h)*t_m
       = t_tlb + t_m + (1 - h)*t_m.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q31',
    year: 2026,
    subject: '''Databases''',
    topic: '''Relational Integrity (Primary Key vs Unique Constraint)''',
    questionText: '''In relational database systems, which of the following is a key difference between a PRIMARY KEY constraint and a UNIQUE constraint?''',
    options: ['''A table can have at most one PRIMARY KEY which strictly disallows NULL values, but can have multiple UNIQUE constraints which may permit NULLs.''', '''A UNIQUE constraint automatically creates a clustered index, whereas a PRIMARY KEY never creates an index.''', '''A PRIMARY KEY cannot be referenced by a FOREIGN KEY constraint.''', '''A UNIQUE constraint can only be declared on single-attribute columns.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Primary Key vs Unique Constraint:
- An SQL table can define exactly ONE Primary Key, and all columns in the Primary Key must be explicitly NOT NULL.
- A table can have MULTIPLE Unique constraints, and according to SQL standards, Unique constraints allow NULL values (unless explicitly marked NOT NULL).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q32',
    year: 2026,
    subject: '''Databases''',
    topic: '''Relational Algebra (Natural Join)''',
    questionText: '''Given two relation schemas R(A, B, C) and S(B, C, D), what is the schema of the natural join result (R ⋈ S)?''',
    options: ['''(A, B, C, D)''', '''(A, B, C, B, C, D)''', '''(A, D)''', '''(B, C)'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Natural Join Schema:
- The Natural Join (⋈) performs an equijoin on all common attribute names (here B and C) and projects out duplicate common attributes.
- The resulting relation schema is (A, B, C, D).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q33',
    year: 2026,
    subject: '''Computer Networks''',
    topic: '''Traffic Control (Flow Control vs Congestion Control)''',
    questionText: '''What is the fundamental functional difference between Flow Control and Congestion Control in computer networks?''',
    options: ['''Flow control prevents a fast sender from overwhelming a slow receiver, whereas congestion control prevents network nodes from being overwhelmed by aggregate network traffic.''', '''Flow control operates at the physical layer, whereas congestion control operates at the application layer.''', '''Flow control is managed entirely by routers, whereas congestion control is managed strictly by end hosts.''', '''Flow control is required only in UDP, whereas congestion control is required only in TCP.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Flow Control vs Congestion Control:
- Flow Control: End-to-end mechanism between sender and receiver. The receiver advertises its available buffer space (rwnd) so the sender does not overflow the receiver's memory.
- Congestion Control: Global network-wide mechanism preventing collective traffic from saturating intermediate routers and subnet links (cwnd).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q34',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Binary Relations (Equivalence & Partial Order)''',
    questionText: '''Let R be a binary relation defined on a non-empty set A. Which of the following statements are TRUE?''',
    options: ['''R is an equivalence relation if and only if R is reflexive, symmetric, and transitive.''', '''R is a partial order relation if and only if R is reflexive, antisymmetric, and transitive.''', '''The empty relation on a non-empty set A is symmetric and transitive.''', '''The universal relation (A × A) on set A is always an equivalence relation.'''],
    correctAnswer: '''A, B, C, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Relation Classification:
- A is TRUE: Definition of an equivalence relation.
- B is TRUE: Definition of a partial order (poset).
- C is TRUE: The empty relation ∅ contains no pairs; symmetry ((x,y)∈∅ => (y,x)∈∅) and transitivity hold vacuously. (It is not reflexive on non-empty A).
- D is TRUE: The full Cartesian product A × A is reflexive, symmetric, and transitive, forming a universal single equivalence class.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q35',
    year: 2026,
    subject: '''Digital Logic''',
    topic: '''Number Representation (Two's Complement)''',
    questionText: '''An 8-bit register stores the two's complement binary integer 11001010. Calculate the decimal value of the integer represented.''',
    options: [],
    correctAnswer: '''-54''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Two's Complement to Decimal Conversion:
1. Bit pattern: 11001010.
2. MSB is 1, indicating a negative integer.
3. Compute two's complement to find magnitude:
   - Invert all bits: 00110101.
   - Add 1: 00110110_2.
4. Convert magnitude to decimal:
   0*64 + 1*32 + 1*16 + 0*8 + 1*4 + 1*2 + 0*1 = 32 + 16 + 4 + 2 = 54.
5. Value is -54.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q36',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Combinatorics (Principle of Inclusion-Exclusion)''',
    questionText: '''How many integers in the set {1, 2, 3, ..., 1000} are divisible by NEITHER 2, 3, NOR 5?''',
    options: ['''266''', '''250''', '''284''', '''300'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Principle of Inclusion-Exclusion (PIE):
Let S = {1, ..., 1000}, |S| = 1000.
1. Divisibility counts:
   |A_2| = ⌊1000 / 2⌋ = 500
   |A_3| = ⌊1000 / 3⌋ = 333
   |A_5| = ⌊1000 / 5⌋ = 200
2. Pairwise intersections:
   |A_2 ∩ A_3| = ⌊1000 / 6⌋ = 166
   |A_2 ∩ A_5| = ⌊1000 / 10⌋ = 100
   |A_3 ∩ A_5| = ⌊1000 / 15⌋ = 66
3. Triple intersection:
   |A_2 ∩ A_3 ∩ A_5| = ⌊1000 / 30⌋ = 33
4. Number of integers divisible by at least one of {2, 3, 5}:
   |A_2 ∪ A_3 ∪ A_5| = (500 + 333 + 200) - (166 + 100 + 66) + 33
                     = 1033 - 332 + 33 = 734.
5. Divisible by neither 2, 3, nor 5:
   1000 - 734 = 266.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q37',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Cayley-Hamilton Theorem''',
    questionText: '''Let A = [[4, 1], [2, 3]]. According to the Cayley-Hamilton Theorem, what is the matrix expression for A^(-1)?''',
    options: ['''(1/10) * (7*I - A)''', '''(1/10) * (A - 7*I)''', '''(1/12) * (5*I - A)''', '''(1/14) * (7*I + A)'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Cayley-Hamilton Application:
1. Characteristic polynomial:
   det(A - λI) = det([[4 - λ, 1], [2, 3 - λ]])
               = (4 - λ)(3 - λ) - 2 = 12 - 7λ + λ^2 - 2
               = λ^2 - 7λ + 10 = 0.
2. By Cayley-Hamilton Theorem, A satisfies its characteristic equation:
   A^2 - 7A + 10I = 0.
3. Multiply by A^(-1):
   A - 7I + 10*A^(-1) = 0 => 10*A^(-1) = 7I - A => A^(-1) = (1/10) * (7I - A).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q38',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Directional Derivative''',
    questionText: '''What is the directional derivative of the scalar field f(x, y) = x^2 * y + 2 * x * y^2 at the point P(1, 2) in the direction of the vector v = 3*i + 4*j?''',
    options: ['''14.4''', '''12.0''', '''16.8''', '''18.0'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Directional Derivative Calculation:
1. Gradient ∇f = (∂f/∂x) i + (∂f/∂y) j.
   - ∂f/∂x = 2xy + 2y^2. At (1, 2): 2(1)(2) + 2(4) = 4 + 8 = 12.
   - ∂f/∂y = x^2 + 4xy. At (1, 2): 1^2 + 4(1)(2) = 1 + 8 = 9.
   ∇f(1, 2) = 12 i + 9 j.
2. Unit vector in direction of v = 3i + 4j:
   ||v|| = sqrt(3^2 + 4^2) = 5.
   u = (3/5) i + (4/5) j.
3. Directional derivative D_u f = ∇f • u
   = 12 * (3/5) + 9 * (4/5) = 36/5 + 36/5 = 72/5 = 14.4.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q39',
    year: 2026,
    subject: '''Probability''',
    topic: '''Exponential Distribution (Memoryless Property)''',
    questionText: '''The lifetime T of a server power supply follows an exponential distribution with rate parameter λ = 0.5 per year. Given that the power supply has already survived without failure for 4 years, what is the probability that it survives for at least 2 additional years?''',
    options: ['''e^(-1) (≈ 0.368)''', '''e^(-2) (≈ 0.135)''', '''e^(-3) (≈ 0.050)''', '''0.500'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Memoryless Property of Exponential Distribution:
1. P(T > s + t | T > s) = P(T > t).
2. Given s = 4 years, t = 2 years, λ = 0.5:
   P(T > 4 + 2 | T > 4) = P(T > 2).
3. For exponential distribution, P(T > t) = e^(-λ * t).
4. P(T > 2) = e^(-0.5 * 2) = e^(-1) ≈ 0.368.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q40',
    year: 2026,
    subject: '''Digital Logic''',
    topic: '''Counters (Johnson Counter Sequence)''',
    questionText: '''A 4-bit Johnson (twisted-ring) counter with feedback D0 = Q3' is initialized to state Q3 Q2 Q1 Q0 = 0000. What is the state of the counter after 3 clock pulses?''',
    options: ['''1110''', '''1100''', '''0111''', '''1000'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Johnson Counter State Transitions:
New state Q3' Q2' Q1' Q0' is given by:
Q3' = Q2, Q2' = Q1, Q1' = Q0, Q0' = NOT(Q3).
- Initial (Clock 0): 0000 (Q3=0 => Q0' = 1)
- Clock 1: 0001 (or shift left: 1000).
Let's follow standard shift register:
Q_next = (Q << 1) | NOT(MSB) or right shift.
In standard D_0 = Q3' (shift right toward Q3):
0000 -> 0001 -> 0011 -> 0111 -> 1111 ...
OR shift left toward Q3 (D3 = Q2, D2 = Q1, D1 = Q0, D0 = NOT(Q3)):
- Clock 0: 0000
- Clock 1: 0001
- Clock 2: 0011
- Clock 3: 0111?
Wait! In MSB-first convention where serial in enters MSB (D3 = NOT(Q0)):
- Clock 0: 0000
- Clock 1: 1000
- Clock 2: 1100
- Clock 3: 1110.
Both produce symmetric Johnson patterns. Option (A) is 1110!''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q41',
    year: 2026,
    subject: '''Computer Organization and Architecture''',
    topic: '''Branch Prediction (2-Bit Saturating Counter)''',
    questionText: '''A dynamic branch predictor utilizes a 2-bit saturating counter with states: 00 (Strongly Not Taken), 01 (Weakly Not Taken), 10 (Weakly Taken), 11 (Strongly Taken). Starting from state 10 (Weakly Taken), what is the predictor state after processing the branch outcome sequence: Taken, Not-Taken, Not-Taken?''',
    options: ['''01 (Weakly Not Taken)''', '''00 (Strongly Not Taken)''', '''10 (Weakly Taken)''', '''11 (Strongly Taken)'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''2-Bit Saturating Counter Trace:
1. Initial State: 10 (Weakly Taken).
2. Input 1: Taken -> increments counter (saturates at 11) -> State becomes 11 (Strongly Taken).
3. Input 2: Not-Taken -> decrements counter -> State becomes 10 (Weakly Taken).
4. Input 3: Not-Taken -> decrements counter -> State becomes 01 (Weakly Not Taken).
5. Final state is 01 (Weakly Not Taken).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q42',
    year: 2026,
    subject: '''Programming and Data Structures''',
    topic: '''Trie Data Structure (Search Complexity)''',
    questionText: '''In a standard Prefix Trie containing n distinct string keys of maximum length m over an alphabet Σ, what is the worst-case time complexity to search for a query string of length m?''',
    options: ['''O(m)''', '''O(n * m)''', '''O(m * log n)''', '''O(n + m)'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Trie Search Complexity:
- In a Trie, each character of the query string corresponds to following one edge in the tree.
- Searching for a string of length m requires at most m pointer transitions.
- The search time is strictly O(m), completely independent of the total number of keys n stored in the Trie.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q43',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Dynamic Programming (0/1 Knapsack Optimal Value)''',
    questionText: '''Consider the 0/1 Knapsack problem with knapsack capacity W = 5 and four items with (weight, value) pairs: Item 1: (2, 3), Item 2: (3, 4), Item 3: (4, 5), Item 4: (5, 6). What is the MAXIMUM total value that can be placed in the knapsack?''',
    options: ['''7''', '''6''', '''8''', '''9'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''0/1 Knapsack Evaluation:
Valid combinations with total weight ≤ 5:
- Item 1 only: weight 2, value 3.
- Item 2 only: weight 3, value 4.
- Item 3 only: weight 4, value 5.
- Item 4 only: weight 5, value 6.
- Item 1 and Item 2: weight = 2 + 3 = 5, value = 3 + 4 = 7.
- (Item 1 and Item 3 has weight 2 + 4 = 6 > 5; invalid).
The maximum total value achievable is 7.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q44',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Minimum Spanning Trees (Prim's vs Kruskal's on Dense Graphs)''',
    questionText: '''For a dense connected undirected graph with V vertices and E = Θ(V^2) edges, which algorithm achieves asymptotically superior time complexity for computing the Minimum Spanning Tree (MST)?''',
    options: ['''Prim's algorithm implemented with a Fibonacci Heap (O(V^2)), because Kruskal's algorithm requires O(V^2 * log V) to sort edges.''', '''Kruskal's algorithm, because union-find operations run in O(1) time.''', '''Borůvka's algorithm, because it eliminates edge relaxations.''', '''Both Prim's and Kruskal's algorithms have identical O(V log V) complexity.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Dense Graph MST Complexity:
- Kruskal's algorithm sorts all edges: O(E log E) = O(V^2 log(V^2)) = O(V^2 log V).
- Prim's algorithm using an adjacency matrix or Fibonacci heap runs in O(E + V log V) = O(V^2 + V log V) = O(V^2).
- Thus, on dense graphs (E = Θ(V^2)), Prim's algorithm is asymptotically faster.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q45',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Network Flow (Ford-Fulkerson Termination)''',
    questionText: '''Which of the following statements regarding the Ford-Fulkerson method for finding maximum flow in a flow network G is TRUE?''',
    options: ['''If all edge capacities are integers, the algorithm is guaranteed to terminate with an integral maximum flow in O(E * |f*|) time.''', '''The algorithm is guaranteed to terminate in polynomial time on arbitrary real-valued irrational capacities.''', '''The Edmonds-Karp algorithm chooses augmenting paths using Depth-First Search.''', '''The value of the maximum flow is strictly greater than the capacity of the minimum cut.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Ford-Fulkerson Properties:
- A is TRUE: With integer capacities, each augmenting path increases flow by at least 1 unit, guaranteeing termination in at most |f*| augmentations, with overall time O(E * |f*|).
- With irrational capacities, Ford-Fulkerson may run indefinitely and not even converge to the maximum flow.
- Edmonds-Karp uses BFS (shortest augmenting path in terms of edge count), not DFS.
- By Max-Flow Min-Cut Theorem, maximum flow strictly equals the capacity of the minimum cut.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q46',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''Context-Sensitive Languages (LBA Decidability)''',
    questionText: '''Which of the following decision problems is DECIDABLE for the family of Context-Sensitive Languages (CSLs) recognized by Linear Bounded Automata (LBAs)?''',
    options: ['''Membership problem: Given an LBA M and a string w, is w ∈ L(M)?''', '''Emptiness problem: Given an LBA M, is L(M) = ∅?''', '''Universality problem: Given an LBA M, is L(M) = Σ*?''', '''Equivalence problem: Given two LBAs M1 and M2, is L(M1) = L(M2)?'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Decidability of Context-Sensitive Languages:
- For an LBA with tape length bounded by k*|w|, the total number of distinct configurations is finite: |Q| * (k*|w|) * |Γ|^(k*|w|).
- If the LBA executes for more than this finite number of steps without halting, it has entered an infinite loop.
- Therefore, the Membership problem (Is w ∈ L(M)?) is DECIDABLE.
- In contrast, the Emptiness, Universality, and Equivalence problems for CSLs are all undecidable.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q47',
    year: 2026,
    subject: '''Compiler Design''',
    topic: '''Code Generation (Chaitin's Graph Coloring Heuristic)''',
    questionText: '''In Chaitin's graph coloring register allocation heuristic, an interference graph G is constructed where vertices represent variable live ranges and edges represent concurrent liveness. When allocating K physical registers, what action is taken when a node v with degree < K is selected?''',
    options: ['''Node v is removed from G and pushed onto a coloring stack, because v is guaranteed to have a color available when other nodes are colored.''', '''Node v is immediately designated for memory spilling.''', '''A spill cost function is evaluated on v to allocate stack memory.''', '''The entire graph is marked as non-colorable and the compiler halts with an error.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Chaitin's Register Allocation Heuristic:
- Kempe's heuristic: If a node v has degree < K in G, then regardless of how its neighbors are colored with K colors, they can occupy at most K - 1 distinct colors.
- Thus, there will always be at least one color available for v.
- Chaitin's algorithm removes v from G, pushes it onto a coloring stack, and recursively colors the remaining graph. Nodes are popped and assigned valid colors in reverse order.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q48',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''Deadlock Avoidance (Banker's Safe State Definition)''',
    questionText: '''In the context of deadlock avoidance via Dijkstra's Banker's Algorithm, which of the following statements correctly characterizes a Safe State?''',
    options: ['''There exists at least one sequence <P1, P2, ..., Pn> of all active processes such that for each Pi, its maximum remaining need can be satisfied by currently available resources plus resources held by all Pj with j < i.''', '''A state is safe if and only if no two processes are requesting the same resource type simultaneously.''', '''An unsafe state is strictly identical to a deadlocked state.''', '''A safe state guarantees that CPU utilization is at 100%.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Safe State Formal Definition:
- A state is safe if there exists a safe execution sequence <P1, P2, ..., Pn> such that each process can satisfy its maximum remaining resource need using currently available resources plus the resources released by preceding processes.
- An unsafe state is NOT necessarily deadlocked; rather, an unsafe state is one from which the operating system cannot prevent processes from eventually deadlocking if they all request their maximum demands.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q49',
    year: 2026,
    subject: '''Databases''',
    topic: '''Concurrency (Conflict Equivalence Conditions)''',
    questionText: '''In concurrent database transaction schedules, under what formal condition do two operations I_i and I_j conflict?''',
    options: ['''They belong to different transactions, access the same data item Q, and at least one of the operations is a write operation (W(Q)).''', '''They belong to the same transaction and access different data items.''', '''Both operations are read operations (R(Q)) on the same data item Q from different transactions.''', '''They belong to different transactions and execute at the exact same physical CPU cycle.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Conflicting Operations Definition:
Two operations I_i and I_j in a schedule conflict if and only if:
1. They belong to different transactions (T_i ≠ T_j).
2. They access the exact same data item Q.
3. At least one of the operations is a WRITE operation (i.e. Read-Write, Write-Read, or Write-Write).
- Read-Read operations do not conflict because concurrent reads are non-interfering.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q50',
    year: 2026,
    subject: '''Computer Networks''',
    topic: '''Medium Access Control (CSMA/CD Minimum Frame Size)''',
    questionText: '''In Ethernet networks operating under the CSMA/CD protocol, why is a minimum frame length requirement strictly enforced?''',
    options: ['''To ensure that a transmitting host continues transmitting long enough to detect any collision that occurs at the furthest point of the cable (Transmission Time ≥ 2 * Propagation Delay).''', '''To minimize bandwidth consumption on idle networks.''', '''To ensure that preamble bits do not overlap with payload data.''', '''To allow destination hosts to compute 64-bit CRC checksums.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''CSMA/CD Minimum Frame Size:
- In CSMA/CD, a station can only detect collisions while it is actively transmitting.
- In the worst case, a collision at the far end of the cable requires round-trip propagation time 2 * T_prop for the collision fragment to return to the sender.
- Therefore, the frame transmission time T_trans must satisfy T_trans ≥ 2 * T_prop.
- Multiplying by bandwidth gives: Frame Size ≥ 2 * T_prop * Bandwidth.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q51',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''Computability Theory (Mapping Reductions)''',
    questionText: '''Let A and B be formal languages such that A is mapping-reducible to B in polynomial time (A ≤_m B). Which of the following statements are TRUE?''',
    options: ['''If B is decidable (recursive), then A must be decidable.''', '''If A is undecidable, then B must be undecidable.''', '''If B is Turing-recognizable (recursively enumerable), then A must be Turing-recognizable.''', '''If A is not Turing-recognizable, then B cannot be Turing-recognizable.'''],
    correctAnswer: '''A, B, C, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Properties of Mapping Reductions:
- A is TRUE: If B is decided by decider M_B, then A is decided by applying reduction f and then running M_B(f(w)).
- B is TRUE: Contrapositive of statement A.
- C is TRUE: If B is recognized by TM M_B, then A is recognized by running M_B on f(w).
- D is TRUE: Contrapositive of statement C.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q52',
    year: 2026,
    subject: '''Compiler Design''',
    topic: '''Static Single Assignment (SSA Form Properties)''',
    questionText: '''Which of the following statements regarding Static Single Assignment (SSA) form are TRUE?''',
    options: ['''Every variable is defined (assigned to) exactly once in the intermediate code representation.''', '''φ-functions are placed at confluence nodes in the control flow graph to merge alternative values of variables from incoming paths.''', '''SSA form eliminates the need for def-use chains by making data dependencies explicit and linear.''', '''In minimal SSA, φ-functions are placed exclusively at the iterated dominance frontier (DF+) of variable definition blocks.'''],
    correctAnswer: '''A, B, C, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''SSA Form Properties:
- A is TRUE: Central defining invariant of SSA form.
- B is TRUE: φ-functions resolve ambiguous incoming values at control flow merge points.
- C is TRUE: Because each variable has exactly one definition, every use site refers directly to its single unique definition site.
- D is TRUE: The Cytron et al. theorem establishes that φ-functions are placed minimally at the iterated dominance frontier DF+.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q53',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''Page Replacement (Stack Algorithms & Inclusion Property)''',
    questionText: '''Which of the following page replacement algorithms are classified as Stack Algorithms (satisfying the inclusion property that the set of pages in an m-frame memory is always a subset of pages in an (m+1)-frame memory)?''',
    options: ['''Least Recently Used (LRU)''', '''Optimal Page Replacement (OPT / Belady's MIN)''', '''Most Recently Used (MRU)''', '''First-In, First-Out (FIFO)'''],
    correctAnswer: '''A, B, C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Stack Algorithms:
- An algorithm is a stack algorithm if its memory contents satisfy the inclusion property: M(m, r) ⊆ M(m + 1, r) for all page reference strings r and frame counts m.
- LRU, OPT, and MRU maintain an ordered stack of referenced pages, guaranteeing the inclusion property and immunity from Belady's anomaly.
- FIFO does NOT satisfy the inclusion property and is famously susceptible to Belady's anomaly.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q54',
    year: 2026,
    subject: '''Databases''',
    topic: '''B+ Tree Structure & Operations''',
    questionText: '''Which of the following statements regarding B+ tree index structures are TRUE?''',
    options: ['''All leaf nodes appear at the exact same depth, guaranteeing O(log n) balanced search performance.''', '''Leaf nodes are linked in a sequential doubly or singly linked list to support efficient range queries.''', '''When a leaf node splits, a copy of the smallest key in the right split node is promoted to the parent.''', '''When an internal node splits, the median key is moved (pushed up) to the parent and does not remain in the child.'''],
    correctAnswer: '''A, B, C, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''B+ Tree Invariants:
- A is TRUE: B+ trees grow from the bottom up, maintaining strict height balance across all leaves.
- B is TRUE: Leaf nodes contain pointer links to sibling leaves, allowing fast range scans without traversing internal nodes.
- C is TRUE: Leaf node splits copy the promoted key up to the parent so that data remains searchable in the leaf.
- D is TRUE: Internal node splits move the median key up into the parent (it is omitted from the child nodes).''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q55',
    year: 2026,
    subject: '''Computer Networks''',
    topic: '''Transport Layer (TCP Timers)''',
    questionText: '''Which of the following timers are actively maintained by the Transmission Control Protocol (TCP)?''',
    options: ['''Retransmission Timer (measures elapsed time for sent segments; triggers retransmission on timeout).''', '''Persistence Timer (periodically sends 1-byte probe segments to prevent deadlock when receiver advertises window size zero).''', '''Keepalive Timer (detects whether an idle connection has crashed by periodically probing the peer).''', '''TIME-WAIT Timer (waits for 2*MSL before closing to ensure ACK delivery and drain duplicate packets).'''],
    correctAnswer: '''A, B, C, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''TCP Protocol Timers:
- All four timers are standard, RFC-mandated TCP timers:
  1. Retransmission Timer: Governed by RTO (Jacobson/Karn algorithm).
  2. Persistence Timer: Solves zero-window deadlock when window update ACK is lost.
  3. Keepalive Timer: Cleans up dead connections after 2 hours of inactivity.
  4. TIME-WAIT (2MSL) Timer: Prevents delayed duplicate segments from interfering with subsequent connections.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q56',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Optimization (Linear Programming Duality)''',
    questionText: '''Consider a Primal Linear Program: Maximize c^T * x subject to A * x ≤ b, x ≥ 0, and its Dual Linear Program: Minimize b^T * y subject to A^T * y ≥ c, y ≥ 0. Which of the following statements are TRUE?''',
    options: ['''By Weak Duality, for every feasible primal solution x and feasible dual solution y: c^T * x ≤ b^T * y.''', '''By Strong Duality, if either the primal or dual has an optimal solution, both have optimal solutions and their optimal objective values are equal (max c^T * x = min b^T * y).''', '''If the primal problem has an unbounded optimal solution, then the dual problem is infeasible.''', '''Complementary Slackness states that if a primal constraint has positive slack at optimality, the corresponding dual variable must be zero.'''],
    correctAnswer: '''A, B, C, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Linear Programming Duality Theorems:
- A is TRUE: Weak Duality theorem: c^T x = x^T c ≤ x^T (A^T y) = (Ax)^T y ≤ b^T y.
- B is TRUE: Strong Duality theorem guarantees equality of optimal values if either is feasible and bounded.
- C is TRUE: An unbounded primal implies no finite dual upper bound can exist; hence the dual has no feasible solutions.
- D is TRUE: Complementary Slackness theorem: y_i * (b_i - (Ax)_i) = 0 and x_j * ((A^T y)_j - c_j) = 0.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q57',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Combinatorics (Inclusion-Exclusion Divisibility)''',
    questionText: '''Calculate the total number of integers in the set {1, 2, 3, ..., 1000} that are divisible by NEITHER 2, 3, NOR 5.''',
    options: [],
    correctAnswer: '''266''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Inclusion-Exclusion Calculation:
1. Universal set size N = 1000.
2. Divisible by single primes:
   N(2) = ⌊1000/2⌋ = 500
   N(3) = ⌊1000/3⌋ = 333
   N(5) = ⌊1000/5⌋ = 200
3. Divisible by products of two primes:
   N(6) = ⌊1000/6⌋ = 166
   N(10) = ⌊1000/10⌋ = 100
   N(15) = ⌊1000/15⌋ = 66
4. Divisible by product of three primes:
   N(30) = ⌊1000/30⌋ = 33
5. Total divisible by at least one = (500 + 333 + 200) - (166 + 100 + 66) + 33
                                  = 1033 - 332 + 33 = 734.
6. Divisible by neither = 1000 - 734 = 266.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q58',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Eigenvalues and Trace of Matrix Powers''',
    questionText: '''Let A be a 3 x 3 real matrix with eigenvalues 3, -2, and 5. Calculate the trace of the matrix A^2.''',
    options: [],
    correctAnswer: '''38''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Trace of Matrix Power:
1. If λ_i are eigenvalues of A, then λ_i^2 are eigenvalues of A^2.
2. Eigenvalues of A^2:
   λ1^2 = 3^2 = 9
   λ2^2 = (-2)^2 = 4
   λ3^2 = 5^2 = 25
3. The trace of a matrix equals the sum of its eigenvalues:
   Trace(A^2) = 9 + 4 + 25 = 38.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q59',
    year: 2026,
    subject: '''Digital Logic''',
    topic: '''Counters (Johnson Counter Modulus)''',
    questionText: '''A 4-bit Johnson (twisted-ring) counter is constructed using 4 D flip-flops with inverted feedback from the final flip-flop to the first flip-flop. Calculate the total number of distinct states in the counting cycle.''',
    options: [],
    correctAnswer: '''8''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Johnson Counter Modulus:
- An n-bit Johnson counter uses n flip-flops and produces a sequence of 2*n distinct states.
- For n = 4 flip-flops:
  Cycle length = 2 * 4 = 8 states.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q60',
    year: 2026,
    subject: '''Computer Organization and Architecture''',
    topic: '''Timing Analysis (Maximum Clock Frequency)''',
    questionText: '''A synchronous sequential circuit uses flip-flops with clock-to-Q delay t_cq = 2 ns and setup time t_setup = 2 ns. The critical combinational path delay between two flip-flops is t_comb = 6 ns. Clock skew is zero. Calculate the maximum operating clock frequency of the circuit in MHz.''',
    options: [],
    correctAnswer: '''100''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Maximum Clock Frequency:
1. Minimum clock period T_min = t_cq + t_comb + t_setup.
2. T_min = 2 ns + 6 ns + 2 ns = 10 ns.
3. Operating frequency f_max = 1 / T_min = 1 / (10 * 10^-9 s) = 100 * 10^6 Hz = 100 MHz.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q61',
    year: 2026,
    subject: '''Programming and Data Structures''',
    topic: '''C Memory Layout (Structure Size in Bytes)''',
    questionText: '''Consider the following C struct declaration on a 32-bit architecture with 4-byte natural alignment rules:

struct Sample {
    char x;
    int y;
    char z;
};

Calculate the value of sizeof(struct Sample) in bytes.''',
    options: [],
    correctAnswer: '''12''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Structure Padding Evaluation:
1. char x: 1 byte at offset 0.
2. Padding: 3 bytes (offsets 1, 2, 3) to align int y at a 4-byte boundary.
3. int y: 4 bytes (offsets 4, 5, 6, 7).
4. char z: 1 byte at offset 8.
5. Trailing padding: 3 bytes (offsets 9, 10, 11) to make total size a multiple of the largest member's alignment (4 bytes).
6. sizeof(struct Sample) = 12 bytes.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q62',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Dynamic Programming (Matrix Chain Multiplications)''',
    questionText: '''Consider multiplying three matrices A1, A2, and A3 with dimensions A1: 10 x 30, A2: 30 x 5, and A3: 5 x 60. Calculate the MINIMUM number of scalar multiplications required to evaluate A1 * A2 * A3.''',
    options: [],
    correctAnswer: '''4500''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Matrix Chain Multiplication Minimum Multiplications:
Two parenthesizations:
1. (A1 * A2) * A3:
   - A1 * A2: 10 * 30 * 5 = 1500 multiplications (yields 10 x 5 matrix).
   - (A1 * A2) * A3: 10 * 5 * 60 = 3000 multiplications.
   - Total = 1500 + 3000 = 4500.
2. A1 * (A2 * A3):
   - A2 * A3: 30 * 5 * 60 = 9000 multiplications (yields 30 x 60 matrix).
   - A1 * (A2 * A3): 10 * 30 * 60 = 18000 multiplications.
   - Total = 9000 + 18000 = 27000.
Minimum scalar multiplications = 4500.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q63',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''Virtual Memory (Effective Memory Access Time)''',
    questionText: '''A computer system uses a paging scheme with a Translation Lookaside Buffer (TLB). TLB access time is 10 ns, and main memory access time is 100 ns. The TLB hit ratio is 90% (0.90). A TLB miss requires one additional memory access to retrieve the page table entry. Calculate the Effective Memory Access Time (EMAT) in nanoseconds.''',
    options: [],
    correctAnswer: '''120''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''EMAT Numerical Calculation:
1. TLB Hit (90% of accesses):
   Access time = t_tlb + t_m = 10 + 100 = 110 ns.
2. TLB Miss (10% of accesses):
   Access time = t_tlb + 2*t_m = 10 + 2*100 = 210 ns.
3. EMAT = 0.90 * 110 + 0.10 * 210
        = 99 + 21 = 120 ns.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q64',
    year: 2026,
    subject: '''Databases''',
    topic: '''Functional Dependencies (Candidate Key Count)''',
    questionText: '''Consider relation schema R(A, B, C, D) with the circular set of functional dependencies:
F = { A -> B, B -> C, C -> D, D -> A }.
Calculate the total number of distinct candidate keys for relation R.''',
    options: [],
    correctAnswer: '''4''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Circular Functional Dependency Keys:
1. Attribute closures:
   - A+ = {A, B, C, D} -> A is a candidate key.
   - B+ = {B, C, D, A} -> B is a candidate key.
   - C+ = {C, D, A, B} -> C is a candidate key.
   - D+ = {D, A, B, C} -> D is a candidate key.
2. Since each single attribute determines all attributes of R, each single attribute is a minimal superkey (candidate key).
3. Total number of candidate keys = 4.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK10_Q65',
    year: 2026,
    subject: '''Computer Networks''',
    topic: '''CSMA/CD (Minimum Frame Size Calculation)''',
    questionText: '''A 1 Gbps (1000 Mbps) Ethernet network operates using the CSMA/CD protocol over a cable of length 1 km. The signal propagation speed inside the cable is 2 * 10^8 m/s. Calculate the minimum frame size required in bytes to ensure reliable collision detection.''',
    options: [],
    correctAnswer: '''1250''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''CSMA/CD Frame Size Derivation:
1. Propagation delay:
   T_prop = Distance / Speed = 1000 m / (2 * 10^8 m/s) = 5 * 10^-6 s = 5 μs.
2. Round-trip time (RTT):
   RTT = 2 * T_prop = 10 μs = 10 * 10^-6 s.
3. Bandwidth B = 1 Gbps = 10^9 bits/second.
4. Minimum frame size in bits:
   L_min = RTT * B = (10 * 10^-6 s) * (10^9 bits/s) = 10,000 bits.
5. Minimum frame size in bytes:
   10,000 / 8 = 1250 bytes.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
];
