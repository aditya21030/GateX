// AUTO-GENERATED GATE CS MOCK 6 QUESTIONS (ULTRA-TOUGH FACULTY LEVEL)
import '../models/models.dart';

final List<PYQ> csFullMock6Questions = [
  PYQ(
    id: 'CS_MOCK6_Q01',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Verbal Ability''',
    questionText: '''Select the pair that exhibits the same logical and semantic relationship as the capitalized pair:

OBFUSCATE : CLARITY ::''',
    options: ['''ENERVATE : VIGOR''', '''SUBSTANTIATE : PROOF''', '''DELIBERATE : CAUTION''', '''PROLIFERATE : ABUNDANCE'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Analogy and Semantic Relationship:
1. To "obfuscate" means to make obscure, unclear, or unintelligible; thus, obfuscating diminishes or destroys "clarity" (Action : Concept It Deprives).
2. To "enervate" means to cause someone or something to lose energy, strength, or vitality; thus, enervating deprives something of "vigor".
3. The relationship in (A) is an exact functional analog: \$X\$ acts to destroy or diminish \$Y\$.
4. In (B), substantiating provides proof (strengthens).
5. In (C), deliberating involves caution.
6. In (D), proliferating leads to abundance.
7. Therefore, option (A) is the correct analogy.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q02',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Verbal Ability''',
    questionText: '''Identify the sentence that is grammatically correct and free of dangling or misplaced modifiers:''',
    options: ['''Having compiled the codebase without warnings, the unit tests were executed by the deployment server.''', '''Having compiled the codebase without warnings, the deployment server executed the unit tests.''', '''The deployment server, having compiled the codebase without warnings, the unit tests were executed.''', '''Having compiled the codebase without warnings, execution of the unit tests began.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Dangling Modifier Analysis:
1. The introductory participial phrase is "Having compiled the codebase without warnings".
2. The implied logical subject of this action must immediately follow the comma.
3. In option (A), the noun following the comma is "the unit tests", which absurdly implies the unit tests compiled the codebase. (Dangling modifier).
4. In option (D), the subject is "execution", which cannot compile code. (Dangling modifier).
5. In option (C), the sentence lacks coherent clausal syntax (comma splice and double subject error).
6. In option (B), the subject following the comma is "the deployment server", which is the entity that compiled the codebase. The modifier correctly attaches to its logical agent.
7. Hence, option (B) is grammatically sound.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q03',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude''',
    questionText: '''The subscription price of a cloud computing platform was increased by 25%. However, due to festive season competition, the vendor announced a promotional discount of 20% on the updated price. What is the net percentage change in the subscription price compared to the original price?''',
    options: ['''0% (No change)''', '''+5% increase''', '''-5% decrease''', '''+2% increase'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Successive Percentage Change Formula:
1. Let the original price be \$P_0 = 100\$.
2. Price after 25% increase:
   \$\$P_1 = 100 \\times (1 + 0.25) = 125\$\$
3. Price after 20% promotional discount on \$P_1\$:
   \$\$P_2 = 125 \\times (1 - 0.20) = 125 \\times 0.80 = 100\$\$
4. Net change:
   \$\$\\Delta\\% = \\frac{100 - 100}{100} \\times 100\\% = 0\\%\$\$
5. Alternatively, using the successive formula \$x + y + \\frac{xy}{100}\$:
   \$\$25 - 20 + \\frac{(25)(-20)}{100} = 5 - \\frac{500}{100} = 5 - 5 = 0\\%\$\$
6. Hence, there is 0% net change. Option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q04',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Spatial Aptitude''',
    questionText: '''A symmetrical geometric 3D object is viewed from three mutually orthogonal directions: Front, Top, and Side. Both the Front View and Side View appear as identical isosceles triangles of base 6 cm and height 8 cm, while the Top View appears as a perfect circle of diameter 6 cm. What is the 3D geometric solid?''',
    options: ['''A right circular cylinder''', '''A right circular cone''', '''A triangular prism''', '''A regular tetrahedron'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Orthographic Projection Analysis:
1. Top View: A circle of diameter 6 cm indicates that any horizontal cross-section perpendicular to the vertical axis is circular.
2. Front View and Side View: Both are isosceles triangles with base 6 cm and height 8 cm. This indicates that the vertical profile tapers linearly from a circular base of diameter 6 cm to a single vertex (apex) at a vertical distance of 8 cm.
3. This is the exact orthographic projection definition of a right circular cone.
4. Hence, option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q05',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude''',
    questionText: '''What is the smaller angle between the hour hand and the minute hand of an accurate analog clock at 3:40?''',
    options: ['''120°''', '''130°''', '''140°''', '''150°'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Clock Angle Derivation:
1. Formula for the angle between hands at \$H\$ hours and \$M\$ minutes:
   \$\$\\theta = |30H - 5.5M|\$\$
2. Here \$H = 3\$ and \$M = 40\$:
   \$\$30H = 30 \\times 3 = 90^\\circ\$\$
   \$\$5.5M = 5.5 \\times 40 = 220^\\circ\$\$
   \$\$\\theta = |90 - 220| = |-130| = 130^\\circ\$\$
3. The reflex angle is \$360^\\circ - 130^\\circ = 230^\\circ\$. The smaller angle is \$130^\\circ\$.
4. Hence, option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q06',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Quantitative Aptitude''',
    questionText: '''Two trains \$T_1\$ and \$T_2\$ of lengths 180 meters and 220 meters, respectively, travel on parallel tracks in opposite directions. The speed of \$T_1\$ is 72 km/h, and the speed of \$T_2\$ is 108 km/h. How many seconds will it take from the moment their locomotives meet until their rear ends completely clear each other?''',
    options: ['''8.0 seconds''', '''10.0 seconds''', '''12.5 seconds''', '''14.4 seconds'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Relative Velocity & Crossing Time:
1. Total distance to be covered for the trains to completely pass each other:
   \$\$D = L_1 + L_2 = 180\\text{ m} + 220\\text{ m} = 400\\text{ meters}\$\$
2. Convert speeds from km/h to m/s:
   - Speed of \$T_1\$: \$v_1 = 72 \\times \\frac{5}{18} = 20\\text{ m/s}\$
   - Speed of \$T_2\$: \$v_2 = 108 \\times \\frac{5}{18} = 30\\text{ m/s}\$
3. Since they move in opposite directions, the relative speed is:
   \$\$v_{\\text{rel}} = v_1 + v_2 = 20 + 30 = 50\\text{ m/s}\$\$
4. Time taken to clear each other:
   \$\$t = \\frac{D}{v_{\\text{rel}}} = \\frac{400\\text{ m}}{50\\text{ m/s}} = 8.0\\text{ seconds}\$\$
5. Hence, option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q07',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Data Interpretation''',
    questionText: '''The compound annual growth rates (CAGR) of three divisions of a technology company over a 3-year period are:
- Hardware: Initial Revenue = ₹400 Cr, CAGR = 10%
- Software: Initial Revenue = ₹200 Cr, CAGR = 20%
- Services: Initial Revenue = ₹100 Cr, CAGR = 30%

What is the total combined revenue of all three divisions at the end of the 3-year period (rounded to the nearest integer)?''',
    options: ['''₹1042 Cr''', '''₹1098 Cr''', '''₹1132 Cr''', '''₹1195 Cr'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Compound Growth Revenue Calculation:
1. Formula: \$R_3 = R_0 (1 + r)^3\$.
2. Hardware (\$R_0 = 400, r = 0.10\$):
   \$\$R_{\\text{HW}} = 400 \\times (1.10)^3 = 400 \\times 1.331 = ₹532.4\\text{ Cr}\$\$
3. Software (\$R_0 = 200, r = 0.20\$):
   \$\$R_{\\text{SW}} = 200 \\times (1.20)^3 = 200 \\times 1.728 = ₹345.6\\text{ Cr}\$\$
4. Services (\$R_0 = 100, r = 0.30\$):
   \$\$R_{\\text{Serv}} = 100 \\times (1.30)^3 = 100 \\times 2.197 = ₹219.7\\text{ Cr}\$\$
5. Total Combined Revenue:
   \$\$R_{\\text{total}} = 532.4 + 345.6 + 219.7 = ₹1097.7\\text{ Cr} \\approx ₹1098\\text{ Cr}\$\$
6. Hence, option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q08',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Logical Reasoning (Coded Relations)''',
    questionText: '''Consider the following relationship codes:
- \$P + Q\$ means '\$P\$ is the father of \$Q\$'
- \$P - Q\$ means '\$P\$ is the mother of \$Q\$'
- \$P \\times Q\$ means '\$P\$ is the brother of \$Q\$'
- \$P \\div Q\$ means '\$P\$ is the sister of \$Q\$'

Which of the following expressions indicates that '\$M\$ is the maternal grandmother of \$T\$'?''',
    options: ['''\$M - K + T\$''', '''\$M - K - T\$''', '''\$M + K - T\$''', '''\$M \\times K - T\$'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Logical Expression Decoding:
1. Requirement: \$M\$ is the maternal grandmother of \$T\$.
   - This means \$M\$ is the mother of a person (say \$K\$), and that person \$K\$ is the mother of \$T\$.
2. Evaluating Option (B): \$M - K - T\$
   - \$M - K\$: \$M\$ is the mother of \$K\$.
   - \$K - T\$: \$K\$ is the mother of \$T\$.
   - Since \$M\$ is the mother of \$T\$'s mother, \$M\$ is the maternal grandmother of \$T\$.
3. Evaluating Option (A): \$M - K + T\$
   - \$M\$ is the mother of \$K\$, and \$K\$ is the father of \$T\$. This makes \$M\$ the paternal grandmother.
4. Evaluating Option (C): \$M + K - T\$
   - \$M\$ is the father of \$K\$ (male), so \$M\$ cannot be a grandmother.
5. Evaluating Option (D): \$M \\times K - T\$
   - \$M\$ is the brother of \$K\$, which makes \$M\$ an uncle/great-uncle.
6. Hence, option (B) is the correct expression.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q09',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Geometry & Mensuration''',
    questionText: '''A solid metallic right circular cone of base radius 6 cm and height 24 cm is melted and recast into identical small spherical balls of radius 2 cm each. Assuming no loss of metal during the recasting process, how many small spherical balls are formed?''',
    options: ['''18''', '''27''', '''36''', '''54'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Volume Conservation Calculation:
1. Volume of the right circular cone:
   \$\$V_{\\text{cone}} = \\frac{1}{3} \\pi r_c^2 h_c\$\$
   With \$r_c = 6\\text{ cm}\$ and \$h_c = 24\\text{ cm}\$:
   \$\$V_{\\text{cone}} = \\frac{1}{3} \\pi (6)^2 (24) = \\frac{1}{3} \\pi (36)(24) = 288\\pi\\text{ cm}^3\$\$
2. Volume of one small spherical ball:
   \$\$V_{\\text{sphere}} = \\frac{4}{3} \\pi r_s^3\$\$
   With \$r_s = 2\\text{ cm}\$:
   \$\$V_{\\text{sphere}} = \\frac{4}{3} \\pi (2)^3 = \\frac{4}{3} \\pi (8) = \\frac{32}{3}\\pi\\text{ cm}^3\$\$
3. Number of small spherical balls formed:
   \$\$N = \\frac{V_{\\text{cone}}}{V_{\\text{sphere}}} = \\frac{288\\pi}{\\frac{32}{3}\\pi} = \\frac{288 \\times 3}{32} = 9 \\times 3 = 27\$\$
4. Hence, exactly 27 spheres are formed. Option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q10',
    year: 2026,
    subject: '''General Aptitude''',
    topic: '''Verbal Reasoning''',
    questionText: '''Read the excerpt below:

"The traditional dichotomy between centralized monolithic architectures and decentralized microservices often ignores organizational dynamics. Conway's Law dictates that systems mirror the communication structures of the organizations that design them. Consequently, an organization with fragmented teams attempting to build a distributed microservice mesh will merely create a distributed monolith—inheriting all the coordination overheads of microservices alongside all the tight coupling of monolithic systems."

Which of the following assertions is most directly supported by the author's argument?''',
    options: ['''Microservice architectures always eliminate communication overhead among developer teams.''', '''Architectural paradigms cannot succeed without alignment with the organization's underlying communication topology.''', '''Monolithic architectures are superior to microservices for all modern enterprise applications.''', '''Conway's Law applies exclusively to legacy software built before the advent of containerization.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Critical Reading Analysis:
1. The author notes that organizational communication structure dictates system structure (Conway's Law), and warns that deploying microservices without appropriate team communication alignment produces a "distributed monolith" with the worst of both worlds.
2. This establishes that technical architectural patterns cannot succeed without harmonizing with organizational communication topology.
3. Option (A) is contradicted by the text (microservices introduce coordination overheads).
4. Option (C) makes an unsupported absolute claim ("superior for all").
5. Option (D) falsely restricts Conway's Law to legacy systems.
6. Thus, option (B) is the strictly supported assertion.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q11',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Predicate Logic''',
    questionText: '''Let \$P(x)\$ be a predicate on a non-empty domain \$D\$, and let \$Q\$ be a proposition that does NOT depend on the variable \$x\$. Which of the following first-order logic equivalences is ALWAYS VALID?''',
    options: ['''\$(\\forall x P(x)) \\to Q \\equiv \\exists x (P(x) \\to Q)\$''', '''\$(\\forall x P(x)) \\to Q \\equiv \\forall x (P(x) \\to Q)\$''', '''\$(\\exists x P(x)) \\to Q \\equiv \\exists x (P(x) \\to Q)\$''', '''\$Q \\to (\\forall x P(x)) \\equiv \\exists x (Q \\to P(x))\$'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Quantifier Scope and Implication Equivalence:
1. By the definition of material implication, \$A \\to B \\equiv \\neg A \\lor B\$.
2. Rewrite the left-hand side of (A):
   \$\$(\\forall x P(x)) \\to Q \\equiv \\neg(\\forall x P(x)) \\lor Q\$\$
3. By De Morgan's Law for quantifiers:
   \$\$\\neg(\\forall x P(x)) \\equiv \\exists x \\neg P(x)\$\$
   Therefore:
   \$\$(\\exists x \\neg P(x)) \\lor Q\$\$
4. Since \$Q\$ does not depend on \$x\$, we can bring \$Q\$ inside the existential quantifier:
   \$\$\\exists x (\\neg P(x) \\lor Q) \\equiv \\exists x (P(x) \\to Q)\$\$
5. Thus, \$(\\forall x P(x)) \\to Q \\equiv \\exists x (P(x) \\to Q)\$ is universally valid.
6. Hence, option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q12',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Relations''',
    questionText: '''Let \$A\$ be a finite set containing \$n\$ elements. How many distinct REFLEXIVE binary relations can be defined on set \$A\$?''',
    options: ['''\$2^n\$''', '''\$2^{n^2}\$''', '''\$2^{n(n-1)}\$''', '''\$2^{n(n+1)/2}\$'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Reflexive Relations Count Derivation:
1. A binary relation \$R\$ on \$A\$ is a subset of the Cartesian product \$A \\times A\$.
2. The total number of ordered pairs in \$A \\times A\$ is \$|A \\times A| = n^2\$.
3. These \$n^2\$ pairs can be partitioned into:
   - \$n\$ diagonal pairs of the form \$(a_i, a_i)\$ where \$1 \\le i \\le n\$.
   - \$n^2 - n = n(n - 1)\$ non-diagonal pairs of the form \$(a_i, a_j)\$ with \$i \\ne j\$.
4. For \$R\$ to be reflexive, every diagonal pair \$(a_i, a_i)\$ MUST be included in \$R\$. (There is only 1 choice for each diagonal pair: it must be present).
5. For each of the \$n(n - 1)\$ non-diagonal pairs, it may independently either be included or excluded from \$R\$ (2 choices each).
6. Total number of reflexive relations:
   \$\$N = 1^n \\times 2^{n(n-1)} = 2^{n(n-1)}\$\$
7. Option (C) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q13',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Determinants & Trace''',
    questionText: '''Let \$A\$ be an invertible \$4 \\times 4\$ real matrix with determinant \$\\det(A) = 3\$. What is the determinant of the matrix \$2A^{-1}\$?''',
    options: ['''\$\\frac{2}{3}\$''', '''\$\\frac{8}{3}\$''', '''\$\\frac{16}{3}\$''', '''\$\\frac{3}{16}\$'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Properties of Determinants:
1. For any \$n \\times n\$ matrix \$M\$ and scalar \$c\$:
   \$\$\\det(c M) = c^n \\det(M)\$\$
2. For an invertible matrix \$A\$:
   \$\$\\det(A^{-1}) = \\frac{1}{\\det(A)}\$\$
3. Here, \$A\$ is of dimension \$n = 4\$, and \$c = 2\$:
   \$\$\\det(2A^{-1}) = 2^4 \\times \\det(A^{-1}) = 16 \\times \\frac{1}{\\det(A)}\$\$
4. Given \$\\det(A) = 3\$:
   \$\$\\det(2A^{-1}) = 16 \\times \\frac{1}{3} = \\frac{16}{3}\$\$
5. Hence, option (C) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q14',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Mean Value Theorem''',
    questionText: '''Consider the function \$f(x) = x^3 - 3x\$ defined on the closed interval \$[0, 2]\$. According to Lagrange's Mean Value Theorem, there exists at least one value \$c \\in (0, 2)\$ such that \$f'(c) = \\frac{f(2) - f(0)}{2 - 0}\$. What is this value of \$c\$?''',
    options: ['''\$\\frac{1}{\\sqrt{3}}\$''', '''\$\\frac{2}{\\sqrt{3}}\$''', '''\$1\$''', '''\$\\sqrt{2}\$'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Lagrange's Mean Value Theorem Application:
1. \$f(x) = x^3 - 3x\$ is a polynomial, hence continuous on \$[0, 2]\$ and differentiable on \$(0, 2)\$.
2. Calculate function values at endpoints:
   - \$f(0) = 0 - 0 = 0\$
   - \$f(2) = 2^3 - 3(2) = 8 - 6 = 2\$
3. Average rate of change:
   \$\$\\frac{f(2) - f(0)}{2 - 0} = \\frac{2 - 0}{2} = 1\$\$
4. Compute derivative \$f'(x)\$:
   \$\$f'(x) = 3x^2 - 3\$\$
5. Setting \$f'(c) = 1\$:
   \$\$3c^2 - 3 = 1 \\implies 3c^2 = 4 \\implies c^2 = \\frac{4}{3}\$\$
   \$\$c = \\pm \\frac{2}{\\sqrt{3}}\$\$
6. Since \$c\$ must lie strictly in the open interval \$(0, 2)\$:
   \$\$c = \\frac{2}{\\sqrt{3}} \\approx 1.1547 \\in (0, 2)\$\$
7. Hence, option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q15',
    year: 2026,
    subject: '''Probability & Statistics''',
    topic: '''Continuous Uniform Distribution''',
    questionText: '''A continuous random variable \$X\$ is uniformly distributed over the interval \$[2, 8]\$. What is the variance \$\\text{Var}(X)\$ of the random variable \$X\$?''',
    options: ['''1''', '''2''', '''3''', '''4'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Uniform Distribution Variance:
1. For a continuous uniform distribution \$U(a, b)\$, the variance is given by:
   \$\$\\text{Var}(X) = \\frac{(b - a)^2}{12}\$\$
2. Here \$a = 2\$ and \$b = 8\$:
   \$\$b - a = 8 - 2 = 6\$\$
   \$\$\\text{Var}(X) = \\frac{6^2}{12} = \\frac{36}{12} = 3\$\$
3. Hence, the variance is 3. Option (C) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q16',
    year: 2026,
    subject: '''Digital Logic''',
    topic: '''Canonical Forms''',
    questionText: '''A Boolean function of three variables \$A, B, C\$ has the canonical sum-of-minterms representation:
\$\$F(A, B, C) = \\sum m(0, 2, 4, 6, 7)\$\$
What is the equivalent canonical product-of-maxterms representation of \$F\$?''',
    options: ['''\$\\prod M(1, 3, 5)\$''', '''\$\\prod M(0, 2, 4, 6, 7)\$''', '''\$\\prod M(1, 3, 5, 7)\$''', '''\$\\prod M(0, 1, 3, 5)\$'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Duality of Minterms and Maxterms:
1. For three variables \$A, B, C\$, the universal set of indices is \$\\{0, 1, 2, 3, 4, 5, 6, 7\\}\$.
2. The on-set minterms are \$\\{0, 2, 4, 6, 7\\}\$.
3. The off-set minterms (where \$F = 0\$) are the complement indices:
   \$\$\\{0, 1, 2, 3, 4, 5, 6, 7\\} \\setminus \\{0, 2, 4, 6, 7\\} = \\{1, 3, 5\\}\$\$
4. In canonical Boolean representation, a function is the product of its off-set maxterms:
   \$\$F(A, B, C) = \\prod M(1, 3, 5)\$\$
5. Hence, option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q17',
    year: 2026,
    subject: '''Digital Logic''',
    topic: '''Priority Encoders''',
    questionText: '''In a 4-to-2 active-HIGH priority encoder with inputs \$D_3, D_2, D_1, D_0\$ (where \$D_3\$ has the highest priority and \$D_0\$ has the lowest priority) and binary outputs \$Y_1 Y_0\$: If the input bit pattern applied is \$D_3 D_2 D_1 D_0 = 0110\$, what are the output values \$Y_1 Y_0\$?''',
    options: ['''\$00\$''', '''\$01\$''', '''\$10\$''', '''\$11\$'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Priority Encoder Truth Table:
1. Priority hierarchy: \$D_3 > D_2 > D_1 > D_0\$.
2. Given input pattern: \$D_3 = 0, D_2 = 1, D_1 = 1, D_0 = 0\$.
3. Since \$D_3 = 0\$, the highest priority active line is \$D_2\$ (which is 1).
4. Lower priority active lines (such as \$D_1 = 1\$) are completely ignored.
5. The binary encoding for input line 2 is:
   \$\$Y_1 = 1, \\quad Y_0 = 0\$\$
6. Thus, output \$Y_1 Y_0 = 10\$. Option (C) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q18',
    year: 2026,
    subject: '''Computer Organization and Architecture''',
    topic: '''Booth's Multiplication Algorithm''',
    questionText: '''When multiplying a multiplicand by the 8-bit signed 2's complement multiplier \$M = 00111100_2\$ using standard radix-2 Booth's algorithm, how many total arithmetic operations (additions or subtractions) will be executed?''',
    options: ['''2''', '''4''', '''6''', '''8'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Booth's Algorithm Operation Count:
1. In Booth's algorithm, the multiplier bits \$M = m_7 m_6 m_5 m_4 m_3 m_2 m_1 m_0\$ are scanned alongside an implicit initial bit \$m_{-1} = 0\$.
2. Multiplier sequence: `0 0 1 1 1 1 0 0` with \$m_{-1} = 0\$.
   Bit pairs \$(m_i, m_{i-1})\$ from \$i = 0\$ to 7:
   - \$i=0: (m_0, m_{-1}) = (0, 0) \\implies\$ No operation
   - \$i=1: (m_1, m_0) = (0, 0) \\implies\$ No operation
   - \$i=2: (m_2, m_1) = (1, 0) \\implies\$ SUBTRACTION (transition \$1 \\leftarrow 0\$)
   - \$i=3: (m_3, m_2) = (1, 1) \\implies\$ No operation
   - \$i=4: (m_4, m_3) = (1, 1) \\implies\$ No operation
   - \$i=5: (m_5, m_4) = (1, 1) \\implies\$ No operation
   - \$i=6: (m_6, m_5) = (0, 1) \\implies\$ ADDITION (transition \$0 \\leftarrow 1\$)
   - \$i=7: (m_7, m_6) = (0, 0) \\implies\$ No operation
3. Arithmetic operations performed:
   - 1 subtraction at \$i = 2\$.
   - 1 addition at \$i = 6\$.
4. Total arithmetic operations \$= 1 + 1 = 2\$.
5. Hence, option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q19',
    year: 2026,
    subject: '''Computer Organization and Architecture''',
    topic: '''Direct Memory Access (DMA)''',
    questionText: '''In a computer system utilizing Direct Memory Access (DMA) in **Cycle Stealing** mode, how does the DMA controller interact with the CPU for system bus access?''',
    options: ['''The DMA controller retains continuous control of the system bus until the entire contiguous block of data is transferred.''', '''The DMA controller takes control of the system bus to transfer exactly one data word, after which it immediately relinquishes the bus back to the CPU.''', '''The DMA controller transfers data only when the CPU executes an explicit I/O polling loop.''', '''The DMA controller bypasses the system bus entirely by writing data over a dedicated fiber channel.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''DMA Transfer Modes:
1. Burst Mode (Block Transfer): The DMA controller takes control of the system bus and transfers the entire block of data in one continuous operation, keeping the CPU suspended until completion.
2. Cycle Stealing Mode: The DMA controller acquires the system bus, transfers a single data word (or byte), and immediately releases the bus back to the CPU. If the CPU does not need the bus during that cycle, no CPU stall occurs; if the CPU requires the bus, it is delayed by exactly one bus cycle.
3. Transparent Mode: The DMA controller transfers data only during clock phases when the CPU is not accessing the bus.
4. Hence, Cycle Stealing transfers one word and relinquishes the bus. Option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q20',
    year: 2026,
    subject: '''Programming in C''',
    topic: '''Variable Shadowing & Block Scope''',
    questionText: '''Consider the following C program:

```c
#include <stdio.h>
int x = 10;
int main() {
    int x = 20;
    {
        int x = 30;
        printf("%d ", x);
    }
    printf("%d ", x);
    return 0;
}
```
What is the output printed by the program?''',
    options: ['''30 10''', '''30 20''', '''20 10''', '''30 30'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Variable Shadowing in Nested Scopes:
1. `int x = 10;` declares a global variable with file scope.
2. `int x = 20;` in `main()` shadows the global `x` throughout the function body.
3. In the inner block `{ int x = 30; ... }`, a new local variable `x` is declared, shadowing the outer local variable.
4. The first `printf` inside the inner block accesses this inner `x`, printing `30`.
5. When the inner block terminates, its local `x` goes out of scope and is deallocated.
6. The second `printf` accesses `main`'s local `x`, which retains its value of `20`.
7. Thus, the program prints `30 20`. Option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q21',
    year: 2026,
    subject: '''Data Structures''',
    topic: '''Linked Lists & Floyd's Algorithm''',
    questionText: '''In a singly linked list with \$n\$ nodes that contains a cycle, Floyd's Cycle Detection algorithm (the Tortoise and the Hare) uses two pointers: `slow` advancing by 1 node per iteration, and `fast` advancing by 2 nodes per iteration. If both pointers are initialized at the head of the list, what is the guarantee regarding their meeting point and the required auxiliary space?''',
    options: ['''The pointers are guaranteed to meet inside the cycle within \$O(n)\$ steps using \$O(1)\$ auxiliary space.''', '''The pointers may loop indefinitely without meeting if the cycle length is an odd number.''', '''The pointers will only meet if an auxiliary hash table of size \$O(n)\$ is maintained.''', '''The pointers always meet at the very first node (entry point) of the cycle on their first encounter.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Floyd's Cycle Finding Proof:
1. Let \$m\$ be the distance from the head to the start of the cycle, and \$k\$ be the length of the cycle (\$k \\le n\$).
2. Once both `slow` and `fast` enter the cycle:
   - At each step, the relative distance between `fast` and `slow` within the cycle decreases by 1 modulo \$k\$ (since \$2 - 1 = 1\$).
   - Therefore, `fast` will catch up to `slow` in at most \$k\$ steps after `slow` enters the cycle.
3. Total steps taken before meeting is at most \$m + k \\le n\$, which is \$O(n)\$ time.
4. Only two pointer variables are stored, requiring \$O(1)\$ auxiliary space.
5. They meet at some node within the cycle (not necessarily the start of the cycle on the first encounter).
6. Hence, option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q22',
    year: 2026,
    subject: '''Data Structures''',
    topic: '''Binary Tree Degree Properties''',
    questionText: '''In any non-empty binary tree, let \$n_0\$ denote the number of leaf nodes (nodes with 0 children) and \$n_2\$ denote the number of internal nodes with exactly 2 children. What is the mathematical relationship between \$n_0\$ and \$n_2\$?''',
    options: ['''\$n_0 = n_2 + 1\$''', '''\$n_0 = 2 n_2\$''', '''\$n_0 = n_2 - 1\$''', '''\$n_0 = n_2 + n_1\$'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Binary Tree Node-Edge Theorem:
1. Let \$n\$ be the total number of nodes in the binary tree:
   \$\$n = n_0 + n_1 + n_2\$\$
   where \$n_1\$ is the number of nodes with exactly 1 child.
2. In any tree with \$n\$ nodes, the total number of edges is:
   \$\$e = n - 1\$\$
3. Every node with 1 child contributes 1 outgoing edge, and every node with 2 children contributes 2 outgoing edges (leaves contribute 0 edges):
   \$\$e = 1 \\cdot n_1 + 2 \\cdot n_2\$\$
4. Equating the two expressions for \$e\$:
   \$\$n - 1 = n_1 + 2n_2\$\$
   Substitute \$n = n_0 + n_1 + n_2\$:
   \$\$(n_0 + n_1 + n_2) - 1 = n_1 + 2n_2\$\$
   \$\$n_0 + n_2 - 1 = 2n_2\$\$
   \$\$n_0 - 1 = n_2 \\implies n_0 = n_2 + 1\$\$
5. Hence, option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q23',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Selection Algorithms (QuickSelect)''',
    questionText: '''What are the expected (average-case) and worst-case time complexities of the randomized QuickSelect algorithm when finding the \$k\$-th smallest element in an unsorted array of \$n\$ distinct elements?''',
    options: ['''Expected \$O(n)\$, Worst-case \$O(n^2)\$''', '''Expected \$O(n \\log n)\$, Worst-case \$O(n \\log n)\$''', '''Expected \$O(n)\$, Worst-case \$O(n \\log n)\$''', '''Expected \$O(\\log n)\$, Worst-case \$O(n)\$'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''QuickSelect Complexity Analysis:
1. Randomized QuickSelect selects a random pivot and partitions the array into elements smaller and larger than the pivot.
2. Unlike QuickSort (which recursively sorts both partitions), QuickSelect recursively descends into ONLY the single partition containing the \$k\$-th element.
3. Expected Time:
   - On average, the pivot splits the array into roughly equal halves:
     \$\$T(n) = T(n/2) + O(n) = O(n) + O(n/2) + O(n/4) + \\dots = O(n)\$\$
4. Worst-case Time:
   - If the pivot chosen at every step is the extreme element (minimum or maximum), the partition size decreases by only 1:
     \$\$T(n) = T(n - 1) + O(n) = O(n^2)\$\$
5. Hence, Expected is \$O(n)\$ and Worst-case is \$O(n^2)\$. Option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q24',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Topological Sorting''',
    questionText: '''Which of the following conditions is both NECESSARY and SUFFICIENT for a directed graph \$G = (V, E)\$ to possess at least one valid topological sorting of its vertices?''',
    options: ['''\$G\$ must be strongly connected.''', '''\$G\$ must be a Directed Acyclic Graph (DAG).''', '''\$G\$ must contain a directed Hamiltonian path.''', '''The in-degree of every vertex in \$G\$ must be at least 1.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Topological Sorting Theorem:
1. A topological sort of a directed graph \$G = (V, E)\$ is a linear ordering of all vertices such that for every directed edge \$(u, v) \\in E\$, vertex \$u\$ appears before vertex \$v\$ in the ordering.
2. If \$G\$ contains a directed cycle \$v_1 \\to v_2 \\to \\dots \\to v_k \\to v_1\$, then \$v_1\$ must precede \$v_2\$, which precedes \$\\dots\$ which precedes \$v_k\$, which precedes \$v_1\$, creating an impossible circular precedence contradiction. Thus, \$G\$ cannot contain any directed cycles.
3. Conversely, every Directed Acyclic Graph (DAG) possesses at least one vertex with in-degree 0, and by repeatedly removing such vertices (Kahn's algorithm), a valid topological sort is guaranteed to be found.
4. Hence, being a DAG is both necessary and sufficient. Option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q25',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''Pumping Lemma & Regularity''',
    questionText: '''Which of the following formal languages over the alphabet \$\\Sigma = \\{0, 1\\}\$ is NON-REGULAR?''',
    options: ['''\$L_1 = \\{0^n 1^m \\mid n \\ge 0, \\, m \\ge 0\\}\$''', '''\$L_2 = \\{w \\in \\{0, 1\\}^* \\mid w \\text{ contains an equal number of } 0\\text{s and } 1\\text{s}\\}\$''', '''\$L_3 = \\{w \\in \\{0, 1\\}^* \\mid w \\text{ begins with } 01 \\text{ and ends with } 10\\}\$''', '''\$L_4 = \\{0^{2n} \\mid n \\ge 0\\}\$'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Regularity Testing:
1. \$L_1 = \\{0^n 1^m\\}\$: Denoted by regular expression \$0^* 1^*\$. (Regular).
2. \$L_3\$: Denoted by regular expression \$01(0 + 1)^* 10\$. (Regular).
3. \$L_4 = \\{0^{2n}\\}\$: Denoted by regular expression \$(00)^*\$. (Regular).
4. \$L_2 = \\{w \\mid N_0(w) = N_1(w)\\}\$:
   - If \$L_2\$ were regular, then by closure under intersection with regular language \$0^* 1^*\$, the language \$L_2 \\cap 0^* 1^* = \\{0^n 1^n \\mid n \\ge 0\\}\$ would be regular.
   - But \$\\{0^n 1^n\\}\$ is the prototypical non-regular language (requires unbounded memory to count zeros and match with ones).
   - Thus, \$L_2\$ is NOT regular. Option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q26',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''Chomsky Normal Form (CNF)''',
    questionText: '''Let \$G\$ be a Context-Free Grammar in Chomsky Normal Form (CNF) where every production is of the form \$A \\to B C\$ or \$A \\to a\$. How many derivation steps are required to derive a terminal string \$w\$ of length \$|w| = n\$ (\$n \\ge 1\$)?''',
    options: ['''\$n\$''', '''\$2n - 1\$''', '''\$2n\$''', '''\$n^2\$'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Derivation Length in CNF:
1. In CNF:
   - Each application of a rule of the form \$A \\to B C\$ replaces one non-terminal with two non-terminals, increasing the number of non-terminals by exactly 1.
   - Starting from the single start symbol \$S\$, to produce a sentential form containing \$n\$ non-terminals requires:
     \$\$n - 1 \\text{ applications of } A \\to B C\$\$
2. Each of the \$n\$ non-terminals must then be replaced by a terminal symbol using rules of the form \$A \\to a\$:
   \$\$n \\text{ applications of } A \\to a\$\$
3. Total number of derivation steps:
   \$\$\\text{Total Steps} = (n - 1) + n = 2n - 1\$\$
4. Hence, option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q27',
    year: 2026,
    subject: '''Compiler Design''',
    topic: '''Three-Address Code (Triples)''',
    questionText: '''In the intermediate code representation of a compiler, which data structure avoids declaring explicit temporary variable names by referencing intermediate values via the array index of the statement itself?''',
    options: ['''Quadruples''', '''Triples''', '''Indirect Triples''', '''Symbol Tables'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Intermediate Code Representations:
1. Quadruples: A record structure with four fields `(op, arg1, arg2, result)`. Explicit temporary names (e.g., \$t_1, t_2\$) must be generated and stored in the `result` field.
2. Triples: A record structure with three fields `(op, arg1, arg2)`. The result of an operation is referred to by its position (array index or pointer) in the triples array, completely avoiding temporary variable names in the symbol table.
3. Indirect Triples: Uses an array of pointers to a separate triples array to facilitate code reordering during optimization.
4. Hence, Triples avoids explicit temporary names. Option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q28',
    year: 2026,
    subject: '''Compiler Design''',
    topic: '''Basic Blocks & Leaders''',
    questionText: '''In the partition of intermediate code into basic blocks, which of the following statements is NOT classified as a LEADER?''',
    options: ['''The very first statement of the three-address intermediate code.''', '''Any statement that is the target of a conditional or unconditional branch (jump).''', '''Any statement that immediately follows a conditional or unconditional branch (jump).''', '''The statement immediately preceding an unconditional jump statement.'''],
    correctAnswer: '''D''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Rules for Identifying Basic Block Leaders:
1. By the standard algorithm (Dragon Book):
   - Rule 1: The first statement of three-address code is a leader.
   - Rule 2: Any statement that is the target of a conditional or unconditional goto is a leader.
   - Rule 3: Any statement that immediately follows a conditional or unconditional goto is a leader.
2. A statement that *precedes* a jump is the end of a basic block, not a leader of a new block.
3. Therefore, option (D) is NOT a leader.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q29',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''Dual-Mode Operation''',
    questionText: '''Which of the following processor instructions is categorized as a PRIVILEGED instruction that must be disallowed in user mode?''',
    options: ['''Read the hardware time-of-day clock register.''', '''Modify the memory management Base and Limit registers.''', '''Perform arithmetic addition on general-purpose CPU registers.''', '''Push an operand onto the user runtime stack.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Privileged Instructions:
1. Privileged instructions are instructions that can potentially compromise hardware resources, memory isolation, or system integrity if executed maliciously or erroneously by user programs.
2. Modifying the Base and Limit registers (or page table base registers) alters physical memory protection boundaries. If a user program could modify these registers, it could access kernel memory or any other process's address space.
3. Thus, modifying memory management registers is strictly a privileged instruction.
4. Reading system clock, arithmetic, and stack operations are unprivileged.
5. Option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q30',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''Thread Models''',
    questionText: '''In an operating system implementing the Many-to-One multithreading model (where multiple user-level threads are mapped to a single kernel thread): What occurs when one user-level thread invokes a blocking system call?''',
    options: ['''Only the calling user thread blocks, and the thread library switches execution to another ready user thread.''', '''The entire process blocks because the underlying kernel thread is placed in the wait state by the OS kernel.''', '''The kernel automatically spawns a new kernel thread to keep the process running.''', '''The blocking system call is silently converted into an asynchronous non-blocking signal.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Many-to-One Thread Model Limitation:
1. In the Many-to-One model, thread management is handled entirely by a user-space thread library without kernel awareness.
2. The operating system kernel only recognizes and schedules the single kernel thread representing the entire process.
3. When any user thread makes a blocking system call (e.g., synchronous read from disk):
   - The OS kernel suspends the single kernel thread.
   - Because the single kernel thread is blocked, no other user-level threads belonging to that process can be scheduled.
   - The entire process is blocked.
4. Option (B) correctly describes this fundamental limitation.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q31',
    year: 2026,
    subject: '''Databases''',
    topic: '''Referential Integrity''',
    questionText: '''Consider two relational tables:
`Department(dept_id PRIMARY KEY, dept_name)`
`Employee(emp_id PRIMARY KEY, emp_name, dept_id REFERENCES Department(dept_id) ON DELETE CASCADE)`

If a record in table `Department` with `dept_id = 10` is deleted, what happens to the tuples in `Employee`?''',
    options: ['''The delete operation on `Department` is rejected and an integrity violation error is raised.''', '''All tuples in `Employee` with `dept_id = 10` are automatically deleted by the database engine.''', '''The `dept_id` attribute of matching tuples in `Employee` is updated to `NULL`.''', '''The matching `Employee` tuples are reassigned to a default department.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''SQL Foreign Key Cascading Actions:
1. The foreign key constraint specifies `ON DELETE CASCADE`.
2. When a parent record in the referenced table `Department` is deleted, the cascade rule automatically deletes all child records in the referencing table `Employee` that reference the deleted primary key value.
3. Thus, all employee tuples with `dept_id = 10` are automatically deleted.
4. If `ON DELETE SET NULL` had been specified, the column would be set to `NULL`. If `ON DELETE RESTRICT` (or default) had been specified, the deletion would be rejected.
5. Option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q32',
    year: 2026,
    subject: '''Databases''',
    topic: '''File Indexing Types''',
    questionText: '''An index constructed on an ordered data file where the search key specifies an ordering that is DIFFERENT from the physical sequential ordering of records on disk is called a:''',
    options: ['''Primary Index''', '''Clustering Index''', '''Secondary Index''', '''Dense Primary Index'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Index Classification Definitions:
1. Primary Index: An index on an ordered file where the search key is the primary key (or candidate key) that determines the physical storage order of records.
2. Clustering Index: An index on an ordered file where the search key is a non-key field that defines the physical ordering of records.
3. Secondary Index: An index on an attribute that does NOT dictate the physical sequential arrangement of records on disk (the data file is either unordered or ordered by a different field).
4. Hence, an index on an alternative ordering field is a Secondary Index. Option (C) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q33',
    year: 2026,
    subject: '''Computer Networks''',
    topic: '''Private IPv4 Addresses (RFC 1918)''',
    questionText: '''Which of the following IPv4 address blocks is designated as a private address space according to RFC 1918?''',
    options: ['''`10.0.0.0/8`''', '''`172.16.0.0/12`''', '''`192.168.0.0/16`''', '''All of the above'''],
    correctAnswer: '''D''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''RFC 1918 Private IPv4 Address Blocks:
1. Class A Private Range: `10.0.0.0` to `10.255.255.255` (CIDR prefix `10.0.0.0/8`, \$2^{24}\$ addresses).
2. Class B Private Range: `172.16.0.0` to `172.31.255.255` (CIDR prefix `172.16.0.0/12`, \$2^{20}\$ addresses).
3. Class C Private Range: `192.168.0.0` to `192.168.255.255` (CIDR prefix `192.168.0.0/16`, \$2^{16}\$ addresses).
4. All three ranges are non-routable on the public internet and reserved for private networks.
5. Hence, option (D) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q34',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Orthogonal Matrices''',
    questionText: '''Let \$Q\$ be a real \$n \\times n\$ orthogonal matrix (\$Q^T Q = Q Q^T = I\$). Which of the following statements are ALWAYS TRUE?''',
    options: ['''The determinant of \$Q\$ satisfies \$\\det(Q) = \\pm 1\$.''', '''For any vector \$x \\in \\mathbb{R}^n\$, the Euclidean norm is preserved: \$\\|Q x\\| = \\|x\\|\$.''', '''All real eigenvalues of \$Q\$ must be either \$+1\$ or \$-1\$.''', '''The matrix inverse is equal to its transpose: \$Q^{-1} = Q^T\$.'''],
    correctAnswer: '''A, B, C, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Properties of Real Orthogonal Matrices:
1. Statement (A): \$\\det(Q^T Q) = \\det(I) = 1 \\implies \\det(Q^T)\\det(Q) = (\\det(Q))^2 = 1 \\implies \\det(Q) = \\pm 1\$. (A is TRUE).
2. Statement (B): \$\\|Q x\\|^2 = (Qx)^T (Qx) = x^T Q^T Q x = x^T I x = x^T x = \\|x\\|^2\$. Taking the square root gives \$\\|Q x\\| = \\|x\\|\$. (B is TRUE).
3. Statement (C): If \$\\lambda\$ is an eigenvalue of \$Q\$ with eigenvector \$v \\ne 0\$, then \$Q v = \\lambda v \\implies \\|Q v\\| = \\|\\lambda v\\| = |\\lambda| \\|v\\|\$. Since \$\\|Q v\\| = \\|v\\|\$, we have \$|\\lambda| = 1\$. If \$\\lambda \\in \\mathbb{R}\$, then \$\\lambda = \\pm 1\$. (C is TRUE).
4. Statement (D): By definition, \$Q^T Q = I \\implies Q^{-1} = Q^T\$. (D is TRUE).
5. Hence, all four statements A, B, C, and D are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q35',
    year: 2026,
    subject: '''Digital Logic''',
    topic: '''Minterm Binary Representation''',
    questionText: '''In a 3-variable Boolean function \$F(A, B, C)\$ where \$A\$ is the Most Significant Bit (MSB) and \$C\$ is the Least Significant Bit (LSB), what is the decimal index of the minterm corresponding to the input combination \$A = 1, \\, B = 0, \\, C = 1\$?''',
    options: [],
    correctAnswer: '''5''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Minterm Index Calculation:
1. Variables in order of significance: \$(A, B, C)\$ with weights \$(2^2, 2^1, 2^0) = (4, 2, 1)\$.
2. Given input combination: \$A = 1, B = 0, C = 1\$.
3. Binary representation: \$101_2\$.
4. Convert binary to decimal:
   \$\$\\text{Index} = 1 \\times 4 + 0 \\times 2 + 1 \\times 1 = 4 + 0 + 1 = 5\$\$
5. Thus, the minterm is \$m_5\$ and its decimal index is 5.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q36',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Stirling Numbers of the Second Kind''',
    questionText: '''In how many ways can a set of 5 distinct elements \$\\{1, 2, 3, 4, 5\\}\$ be partitioned into exactly 3 non-empty subsets?''',
    options: ['''15''', '''25''', '''50''', '''90'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Stirling Number \$S(n, k)\$ Calculation:
1. The number of partitions of an \$n\$-element set into \$k\$ non-empty subsets is given by the Stirling Number of the Second Kind \$S(n, k)\$.
2. Explicit formula:
   \$\$S(n, k) = \\frac{1}{k!} \\sum_{j=0}^{k} (-1)^{k-j} \\binom{k}{j} j^n\$\$
3. For \$n = 5\$ and \$k = 3\$:
   \$\$S(5, 3) = \\frac{1}{3!} \\left[ (-1)^3 \\binom{3}{0} 0^5 + (-1)^2 \\binom{3}{1} 1^5 + (-1)^1 \\binom{3}{2} 2^5 + (-1)^0 \\binom{3}{3} 3^5 \\right]\$\$
   \$\$= \\frac{1}{6} \\left[ 0 + 1 \\times 3 \\times 1 - 3 \\times 32 + 1 \\times 1 \\times 243 \\right]\$\$
   \$\$= \\frac{1}{6} [ 3 - 96 + 243 ] = \\frac{1}{6} [ 150 ] = 25\$\$
4. Recurrence check:
   - \$S(n, k) = k S(n-1, k) + S(n-1, k-1)\$
   - \$S(4, 2) = 7, \\, S(4, 3) = 6 \\implies S(5, 3) = 3(6) + 7 = 18 + 7 = 25\$.
5. Hence, there are exactly 25 ways. Option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q37',
    year: 2026,
    subject: '''Linear Algebra''',
    topic: '''Adjoint of a Matrix''',
    questionText: '''Let \$A\$ be a \$3 \\times 3\$ real invertible matrix with determinant \$\\det(A) = 4\$. What is the determinant of the double adjoint matrix \$\\det(\\text{adj}(\\text{adj}(A)))\$?''',
    options: ['''16''', '''64''', '''256''', '''1024'''],
    correctAnswer: '''C''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Determinant of Iterated Adjoints:
1. For any \$n \\times n\$ matrix \$A\$:
   \$\$\\text{adj}(A) = \\det(A) \\cdot A^{-1}\$\$
   \$\$\\det(\\text{adj}(A)) = (\\det(A))^{n-1}\$\$
2. For the second adjoint:
   \$\$\\text{adj}(\\text{adj}(A)) = (\\det(A))^{n-2} \\cdot A\$\$
3. Taking the determinant of both sides:
   \$\$\\det(\\text{adj}(\\text{adj}(A))) = \\det\\left( (\\det(A))^{n-2} \\cdot A \\right)\$\$
   Since scaling an \$n \\times n\$ matrix by scalar \$c\$ scales its determinant by \$c^n\$:
   \$\$\\det(\\text{adj}(\\text{adj}(A))) = \\left( (\\det(A))^{n-2} \\right)^n \\cdot \\det(A) = (\\det(A))^{n(n-2) + 1} = (\\det(A))^{(n-1)^2}\$\$
4. With \$n = 3\$ and \$\\det(A) = 4\$:
   \$\$(n - 1)^2 = (3 - 1)^2 = 2^2 = 4\$\$
   \$\$\\det(\\text{adj}(\\text{adj}(A))) = 4^4 = 256\$\$
5. Hence, option (C) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q38',
    year: 2026,
    subject: '''Calculus''',
    topic: '''Directional Derivative & Gradient''',
    questionText: '''What is the maximum directional derivative of the scalar field \$\\phi(x, y, z) = 2x^2 + 3y^2 + z^2\$ at the point \$P(2, 1, 3)\$?''',
    options: ['''\$2\\sqrt{34}\$''', '''\$14\$''', '''\$20\$''', '''\$4\\sqrt{17}\$'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Maximum Directional Derivative:
1. The directional derivative of a scalar field \$\\phi\$ in the direction of unit vector \$\\mathbf{u}\$ is:
   \$\$D_{\\mathbf{u}} \\phi = \\nabla \\phi \\cdot \\mathbf{u} = \\|\\nabla \\phi\\| \\cos\\theta\$\$
2. The maximum value occurs when \$\\mathbf{u}\$ is in the direction of the gradient (\$\\theta = 0^\\circ\$), where the maximum directional derivative equals the magnitude of the gradient \$\\|\\nabla \\phi\\|\$.
3. Compute the gradient vector \$\\nabla \\phi\$:
   \$\$\\nabla \\phi = \\left( \\frac{\\partial \\phi}{\\partial x}, \\frac{\\partial \\phi}{\\partial y}, \\frac{\\partial \\phi}{\\partial z} \\right) = (4x, \\, 6y, \\, 2z)\$\$
4. Evaluate at point \$P(2, 1, 3)\$:
   \$\$\\nabla \\phi(2, 1, 3) = (4(2), \\, 6(1), \\, 2(3)) = (8, \\, 6, \\, 6)\$\$
5. Compute the Euclidean norm:
   \$\$\\|\\nabla \\phi\\| = \\sqrt{8^2 + 6^2 + 6^2} = \\sqrt{64 + 36 + 36} = \\sqrt{136}\$\$
   \$\$\\sqrt{136} = \\sqrt{4 \\times 34} = 2\\sqrt{34}\$\$
6. Hence, the maximum directional derivative is \$2\\sqrt{34}\$. Option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q39',
    year: 2026,
    subject: '''Probability & Statistics''',
    topic: '''Normal Approximation to Binomial''',
    questionText: '''A fair coin is tossed independently 400 times. Let \$X\$ denote the number of heads obtained. Using the Central Limit Theorem with continuity correction, what is the standardized normal expression for the probability that at least 220 heads are obtained, \$P(X \\ge 220)\$? (where \$\\Phi(z)\$ is the standard normal cumulative distribution function)''',
    options: ['''\$1 - \\Phi(1.95)\$''', '''\$1 - \\Phi(2.00)\$''', '''\$\\Phi(1.95)\$''', '''\$1 - \\Phi(1.90)\$'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Normal Approximation with Continuity Correction:
1. Binomial parameters: \$n = 400, p = 0.5\$.
   \$\$\\text{Mean } \\mu = np = 400 \\times 0.5 = 200\$\$
   \$\$\\text{Variance } \\sigma^2 = np(1 - p) = 400 \\times 0.5 \\times 0.5 = 100 \\implies \\sigma = 10\$\$
2. Continuity correction for discrete integer variable \$X\$:
   \$\$P(X \\ge 220) = P(X_{\\text{cont}} \\ge 219.5)\$\$
3. Standardizing to standard normal variable \$Z \\sim N(0, 1)\$:
   \$\$Z = \\frac{219.5 - \\mu}{\\sigma} = \\frac{219.5 - 200}{10} = \\frac{19.5}{10} = 1.95\$\$
4. Therefore:
   \$\$P(X \\ge 220) \\approx P(Z \\ge 1.95) = 1 - \\Phi(1.95)\$\$
5. Hence, option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q40',
    year: 2026,
    subject: '''Digital Logic''',
    topic: '''FSM State Minimization''',
    questionText: '''A synchronous sequential circuit has states \$\\{A, B, C, D, E, F\\}\$ with the following state transitions and outputs:
- Present state \$A\$: Next state on \$x=0\$ is \$B\$, on \$x=1\$ is \$C\$; Output \$z = 0\$
- Present state \$B\$: Next state on \$x=0\$ is \$D\$, on \$x=1\$ is \$E\$; Output \$z = 1\$
- Present state \$C\$: Next state on \$x=0\$ is \$F\$, on \$x=1\$ is \$A\$; Output \$z = 0\$
- Present state \$D\$: Next state on \$x=0\$ is \$B\$, on \$x=1\$ is \$C\$; Output \$z = 0\$
- Present state \$E\$: Next state on \$x=0\$ is \$D\$, on \$x=1\$ is \$E\$; Output \$z = 1\$
- Present state \$F\$: Next state on \$x=0\$ is \$F\$, on \$x=1\$ is \$A\$; Output \$z = 0\$

What is the minimum number of states in the completely reduced equivalent state machine?''',
    options: ['''2 states''', '''3 states''', '''4 states''', '''5 states'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''State Equivalence Partitioning:
1. Initial 0-equivalence partition based on outputs \$z\$:
   - \$P_0 = (A, C, D, F) \\quad (\\text{output } 0)\$
   - \$P_1 = (B, E) \\quad (\\text{output } 1)\$
2. Analyze group \$(A, C, D, F)\$:
   - For \$A\$: on \$0 \\to B \\in P_1\$; on \$1 \\to C \\in P_0\$.
   - For \$D\$: on \$0 \\to B \\in P_1\$; on \$1 \\to C \\in P_0\$.
   - For \$C\$: on \$0 \\to F \\in P_0\$; on \$1 \\to A \\in P_0\$.
   - For \$F\$: on \$0 \\to F \\in P_0\$; on \$1 \\to A \\in P_0\$.
   - Notice \$A\$ and \$D\$ have identical transitions to \$(P_1, P_0)\$.
   - \$C\$ and \$F\$ have identical transitions to \$(P_0, P_0)\$.
   - Thus, \$(A, C, D, F)\$ splits into \$(A, D)\$ and \$(C, F)\$.
3. Analyze group \$(B, E)\$:
   - For \$B\$: on \$0 \\to D \\in (A, D)\$; on \$1 \\to E \\in (B, E)\$.
   - For \$E\$: on \$0 \\to D \\in (A, D)\$; on \$1 \\to E \\in (B, E)\$.
   - Both transition to \$(A, D)\$ on 0, and \$(B, E)\$ on 1.
   - Thus \$B\$ and \$E\$ remain equivalent.
4. Next partition:
   \$\$P_{\\text{final}} = \\{(A, D), \\, (C, F), \\, (B, E)\\}\$\$
5. No further splitting occurs.
6. The minimum number of states in the equivalent reduced machine is exactly 3.
7. Hence, option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q41',
    year: 2026,
    subject: '''Computer Organization and Architecture''',
    topic: '''Cache Coherence (MESI)''',
    questionText: '''In a multicore system utilizing the 4-state MESI (Modified, Exclusive, Shared, Invalid) snooping cache coherence protocol: When a processor core attempts to execute a Write operation (`PrWr`) on a cache block currently held in the **Shared (S)** state, what state transition and bus transaction take place?''',
    options: ['''The block transitions to Modified (M), and a Bus Upgrade / Invalidation request is broadcast on the shared bus.''', '''The block transitions to Exclusive (E) silently without broadcasting any bus signals.''', '''The block transitions to Invalid (I), forcing the processor to stall until main memory updates.''', '''The block remains in the Shared (S) state while writing the value through to main memory.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''MESI State Transition for Write Hit on Shared Line:
1. In the MESI protocol, the Shared (S) state indicates that the cache line is valid, up-to-date with main memory, and may be present in one or more other processor caches.
2. A processor cannot perform a local write to a line in state S because doing so would create an inconsistent stale copy in the other caches.
3. Therefore, upon a processor write (`PrWr`):
   - The local cache controller issues an invalidation signal (`BusUpgr` or `BusRdX`) on the shared bus.
   - All other caches snooping this transaction invalidate their local copies of the block (transitioning from S to I).
   - The writing processor acquires exclusive write ownership and updates the line, transitioning its local state from Shared (S) to Modified (M).
4. Option (A) correctly describes this protocol behavior.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q42',
    year: 2026,
    subject: '''Programming in C''',
    topic: '''Pointers to Pointers''',
    questionText: '''Consider the following C program:

```c
#include <stdio.h>
int main() {
    char *str[] = {"GATE", "CSIT", "EXAM", "TEST"};
    char **ptr[] = {str + 3, str + 2, str + 1, str};
    char ***pp = ptr;
    printf("%s", **++pp);
    return 0;
}
```
What is the string printed by this program?''',
    options: ['''TEST''', '''EXAM''', '''CSIT''', '''GATE'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Step-by-Step Pointer Dereference Trace:
1. `str` is an array of string pointers:
   - `str[0] = "GATE"`
   - `str[1] = "CSIT"`
   - `str[2] = "EXAM"`
   - `str[3] = "TEST"`
2. `ptr` is an array of pointers to `char*`:
   - `ptr[0] = str + 3 = &str[3]`
   - `ptr[1] = str + 2 = &str[2]`
   - `ptr[2] = str + 1 = &str[1]`
   - `ptr[3] = str = &str[0]`
3. `char ***pp = ptr;`:
   - `pp` initially points to `ptr[0]`.
4. Expression `**++pp`:
   - `++pp` is a pre-increment on `pp`. `pp` now points to `ptr[1]`.
   - First dereference `*++pp` yields the value stored in `ptr[1]`, which is `&str[2]`.
   - Second dereference `**++pp` yields `*(&str[2]) = str[2]`.
   - `str[2]` points to the string `"EXAM"`.
5. The `printf("%s", ...)` outputs `"EXAM"`.
6. Hence, option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q43',
    year: 2026,
    subject: '''Data Structures''',
    topic: '''Red-Black Trees''',
    questionText: '''In a valid Red-Black Tree, every simple path from any node \$x\$ to a descendant leaf contains the same number of black nodes, defined as the black-height \$bh(x)\$. What is the MAXIMUM possible number of internal nodes in a Red-Black Tree whose root has black-height \$bh\$?''',
    options: ['''\$2^{bh} - 1\$''', '''\$2^{2 bh} - 1\$''', '''\$2^{bh + 1} - 1\$''', '''\$4^{bh} + 1\$'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Red-Black Tree Extremal Node Bounds:
1. In a Red-Black Tree, red nodes cannot have red children (no two consecutive red nodes on any path).
2. Therefore, along any path from the root to a leaf, red nodes can alternate with black nodes at most once per black node.
3. The maximum possible height \$h\$ of a Red-Black Tree with root black-height \$bh\$ occurs when red and black nodes strictly alternate on every path from the root to the leaves:
   \$\$h \\le 2 \\times bh\$\$
4. A binary tree of maximum height \$h = 2 bh\$ has the maximum number of internal nodes when it is a full binary tree of height \$2 bh\$:
   \$\$N_{\\max} = 2^h - 1 = 2^{2 bh} - 1 = (4^{bh} - 1)\$\$
5. (Conversely, the minimum number of internal nodes occurs when all nodes are black, giving \$N_{\\min} = 2^{bh} - 1\$).
6. Hence, the maximum number of internal nodes is \$2^{2 bh} - 1\$.
7. Option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q44',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Bellman-Ford Algorithm''',
    questionText: '''Let \$G = (V, E)\$ be a directed weighted graph with \$n = |V|\$ vertices and \$m = |E|\$ edges. The Bellman-Ford algorithm relaxes all edges \$n - 1\$ times. How does the algorithm definitively detect whether \$G\$ contains a negative-weight cycle reachable from the source vertex \$s\$?''',
    options: ['''It checks whether the priority queue becomes empty before visiting all vertices.''', '''It executes an \$n\$-th pass of edge relaxations; if for any edge \$(u, v) \\in E\$, \$d[u] + w(u, v) < d[v]\$, then a reachable negative-weight cycle exists.''', '''It computes the strongly connected components of \$G\$ using Kosaraju's algorithm.''', '''It tests whether the sum of shortest path distances to all vertices is negative.'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Bellman-Ford Negative Cycle Detection:
1. In a graph with no negative-weight cycles, every shortest path is simple and contains at most \$n - 1\$ edges.
2. Therefore, after \$n - 1\$ iterations of relaxing all edges, all shortest path distances \$d[v]\$ are guaranteed to have converged to their optimal values \$\\delta(s, v)\$.
3. If an \$n\$-th relaxation pass is executed and there exists any edge \$(u, v)\$ such that:
   \$\$d[u] + w(u, v) < d[v]\$\$
   it implies that a path with \$n\$ or more edges has a smaller weight than any simple path.
4. This can happen if and only if the path has traversed a negative-weight cycle.
5. Thus, the \$n\$-th relaxation check detects reachable negative-weight cycles.
6. Option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q45',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''KMP String Matching (Prefix Function)''',
    questionText: '''Consider the pattern string \$P = \\text{"ABABCABAB"}\$ used in the Knuth-Morris-Pratt (KMP) string matching algorithm. What is the prefix function (failure array) \$\\pi[0..8]\$ computed for pattern \$P\$?''',
    options: ['''\$[0, 0, 1, 2, 0, 1, 2, 3, 4]\$''', '''\$[0, 1, 0, 2, 0, 1, 2, 3, 4]\$''', '''\$[0, 0, 1, 2, 1, 2, 3, 4, 5]\$''', '''\$[0, 0, 0, 2, 0, 1, 2, 2, 3]\$'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''KMP Failure Function Table Construction:
1. \$\\pi[i]\$ is the length of the longest proper prefix of \$P[0..i]\$ that is also a suffix of \$P[0..i]\$.
2. Evaluating each index for \$P = \\text{"ABABCABAB"}\$:
   - \$i = 0\$: \$P[0..0] = \\text{"A"}\$. No proper prefix \$\\implies \\pi[0] = 0\$.
   - \$i = 1\$: \$P[0..1] = \\text{"AB"}\$. Proper prefixes: {"A"}. Suffixes: {"B"}. No match \$\\implies \\pi[1] = 0\$.
   - \$i = 2\$: \$P[0..2] = \\text{"ABA"}\$. Prefix "A" matches suffix "A" \$\\implies \\pi[2] = 1\$.
   - \$i = 3\$: \$P[0..3] = \\text{"ABAB"}\$. Prefix "AB" matches suffix "AB" \$\\implies \\pi[3] = 2\$.
   - \$i = 4\$: \$P[0..4] = \\text{"ABABC"}\$. No prefix ends in 'C' \$\\implies \\pi[4] = 0\$.
   - \$i = 5\$: \$P[0..5] = \\text{"ABABCA"}\$. Prefix "A" matches suffix "A" \$\\implies \\pi[5] = 1\$.
   - \$i = 6\$: \$P[0..6] = \\text{"ABABCAB"}\$. Prefix "AB" matches suffix "AB" \$\\implies \\pi[6] = 2\$.
   - \$i = 7\$: \$P[0..7] = \\text{"ABABCABA"}\$. Prefix "ABA" matches suffix "ABA" \$\\implies \\pi[7] = 3\$.
   - \$i = 8\$: \$P[0..8] = \\text{"ABABCABAB"}\$. Prefix "ABAB" matches suffix "ABAB" \$\\implies \\pi[8] = 4\$.
3. The resulting array is:
   \$\$\\pi = [0, 0, 1, 2, 0, 1, 2, 3, 4]\$\$
4. Hence, option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q46',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''Decidability & Linear Bounded Automata''',
    questionText: '''Which of the following decision problems regarding Context-Sensitive Languages (CSLs) and Linear Bounded Automata (LBAs) is mathematically DECIDABLE?''',
    options: ['''The Membership Problem: Given an LBA \$M\$ and an input string \$w\$, determining whether \$w \\in L(M)\$.''', '''The Emptiness Problem: Given an LBA \$M\$, determining whether \$L(M) = \\emptyset\$.''', '''The Universality Problem: Given an LBA \$M\$, determining whether \$L(M) = \\Sigma^*\$.''', '''The Equivalence Problem: Given two LBAs \$M_1\$ and \$M_2\$, determining whether \$L(M_1) = L(M_2)\$.'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Decidability of Context-Sensitive Languages:
1. A Linear Bounded Automaton (LBA) is a non-deterministic Turing machine whose tape head cannot move beyond the portion of the tape initially occupied by the input string \$w\$ (delimited by left and right endmarkers).
2. For an input string of length \$n = |w|\$:
   - There are \$|Q|\$ states.
   - The tape head can be in \$n\$ positions.
   - The tape cells can hold \$|\\Gamma|^n\$ distinct strings.
   - Total number of distinct tape configurations:
     \$\$C = |Q| \\times n \\times |\\Gamma|^n\$\$
3. Because \$C\$ is strictly finite, a simulation of \$M\$ on \$w\$ that exceeds \$C\$ steps without halting must have entered an infinite repetition loop.
4. Hence, an algorithm can simulate \$M\$ on \$w\$ for at most \$C\$ steps; if it accepts within \$C\$ steps, answer YES; otherwise, answer NO.
5. Thus, the Membership Problem for LBAs (and CSLs) is DECIDABLE.
6. The Emptiness, Universality, and Equivalence problems for LBAs are all undecidable (reductions from Turing machine halting).
7. Option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q47',
    year: 2026,
    subject: '''Compiler Design''',
    topic: '''Dataflow Analysis (Liveness)''',
    questionText: '''In compiler optimization, Live Variable Analysis is used to identify variables whose values may be read on some execution path before being redefined. Which of the following correctly specifies the direction of analysis and the transfer equation for each basic block \$B\$?''',
    options: ['''Backward analysis with \$\\text{IN}[B] = \\text{use}[B] \\cup (\\text{OUT}[B] \\setminus \\text{def}[B])\$ and \$\\text{OUT}[B] = \\bigcup_{S \\in \\text{succ}(B)} \\text{IN}[S]\$''', '''Forward analysis with \$\\text{OUT}[B] = \\text{gen}[B] \\cup (\\text{IN}[B] \\setminus \\text{kill}[B])\$ and \$\\text{IN}[B] = \\bigcup_{P \\in \\text{pred}(B)} \\text{OUT}[P]\$''', '''Backward analysis with \$\\text{IN}[B] = \\text{def}[B] \\cup (\\text{OUT}[B] \\setminus \\text{use}[B])\$ and \$\\text{OUT}[B] = \\bigcap_{S \\in \\text{succ}(B)} \\text{IN}[S]\$''', '''Forward analysis with \$\\text{OUT}[B] = \\text{use}[B] \\cup \\text{def}[B]\$'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Live Variable Analysis Equations:
1. Direction: A variable is live at point \$p\$ if its current value will be read in the future (along some path from \$p\$ to program exit). Therefore, liveness information flows backwards from program exit to entry (Backward Dataflow Analysis).
2. Confluence operator: A variable is live on exit from block \$B\$ if it is live on entry to ANY of \$B\$'s successors:
   \$\$\\text{OUT}[B] = \\bigcup_{S \\in \\text{succ}(B)} \\text{IN}[S]\$\$
3. Transfer equation: A variable is live on entry to \$B\$ if it is used in \$B\$ before any definition (\$\\text{use}[B]\$), OR if it is live on exit from \$B\$ and not killed (redefined) within \$B\$ (\$\\text{OUT}[B] \\setminus \\text{def}[B]\$):
   \$\$\\text{IN}[B] = \\text{use}[B] \\cup (\\text{OUT}[B] \\setminus \\text{def}[B])\$\$
4. Hence, option (A) is the correct formulation.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q48',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''Synchronization (Readers-Writers)''',
    questionText: '''In the standard semaphore solution to the First Readers-Writers problem (favoring readers):

```c
// Reader:
wait(mutex);
read_count++;
if (read_count == 1) wait(wrt);
signal(mutex);
// reading...
wait(mutex);
read_count--;
if (read_count == 0) signal(wrt);
signal(mutex);
```
What concurrency issue can arise if reader processes arrive continuously in overlapping intervals?''',
    options: ['''Deadlock between reader processes''', '''Starvation of writer processes''', '''Violation of mutual exclusion among concurrent readers''', '''Priority inversion among readers'''],
    correctAnswer: '''B''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Reader-Preference Starvation Analysis:
1. In the first readers-writers problem, once the first reader acquires the `wrt` semaphore (`read_count == 1`), any subsequent reader increments `read_count` and directly proceeds to read without waiting on `wrt`.
2. As long as `read_count > 0`, the semaphore `wrt` remains locked.
3. If new readers continuously arrive before earlier readers finish (so `read_count` never drops to 0), a waiting writer process blocked on `wrt` will wait indefinitely.
4. This results in writer starvation.
5. Option (B) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q49',
    year: 2026,
    subject: '''Databases''',
    topic: '''BCNF Normalization''',
    questionText: '''Consider the relational schema \$R(A, B, C, D)\$ with the functional dependency set:
\$\$F = \\{A \\to B, \\, B \\to C, \\, C \\to D, \\, D \\to A\\}\$\$
What is the HIGHEST normal form satisfied by relation \$R\$?''',
    options: ['''1NF''', '''2NF''', '''3NF''', '''BCNF'''],
    correctAnswer: '''D''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Normal Form Evaluation for Circular Dependencies:
1. Compute attribute closures under \$F\$:
   - \$A^+ = \\{A, B, C, D\\} \\implies A\$ is a candidate key.
   - \$B^+ = \\{B, C, D, A\\} \\implies B\$ is a candidate key.
   - \$C^+ = \\{C, D, A, B\\} \\implies C\$ is a candidate key.
   - \$D^+ = \\{D, A, B, C\\} \\implies D\$ is a candidate key.
2. Candidate Keys of \$R\$: \$\\{A\\}, \\{B\\}, \\{C\\}, \\{D\\}\$.
   Every single attribute in the relation is prime!
3. Testing Boyce-Codd Normal Form (BCNF):
   - A relation is in BCNF if for every non-trivial functional dependency \$X \\to Y \\in F^+\$, the determinant \$X\$ is a superkey.
   - In each FD:
     - In \$A \\to B\$: \$A\$ is a superkey.
     - In \$B \\to C\$: \$B\$ is a superkey.
     - In \$C \\to D\$: \$C\$ is a superkey.
     - In \$D \\to A\$: \$D\$ is a superkey.
4. Because the left-hand side of every dependency is a superkey, relation \$R\$ satisfies BCNF.
5. Hence, the highest normal form is BCNF. Option (D) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q50',
    year: 2026,
    subject: '''Computer Networks''',
    topic: '''BGP Path Selection''',
    questionText: '''When a Border Gateway Protocol (BGP) speaker learns multiple valid routes to the same destination network prefix, in what order are the top three route selection criteria evaluated?''',
    options: ['''Highest `LOCAL-PREF` \$\\to\$ Shortest `AS-PATH` length \$\\to\$ Lowest `MED`''', '''Lowest `MED` \$\\to\$ Highest `LOCAL-PREF` \$\\to\$ Shortest `AS-PATH` length''', '''Shortest `AS-PATH` length \$\\to\$ Highest `LOCAL-PREF` \$\\to\$ Lowest Router ID''', '''Highest Weight \$\\to\$ Lowest `MED` \$\\to\$ Shortest `AS-PATH` length'''],
    correctAnswer: '''A''',
    isMCQ: true,
    type: 'MCQ',
    explanation: '''Standard BGP Best Path Selection Hierarchy:
1. Step 1: Prefer highest `Weight` (Cisco proprietary, local to router).
2. Step 2: Prefer highest `LOCAL-PREF` (advertised throughout the AS).
3. Step 3: Prefer locally originated routes.
4. Step 4: Prefer the route with the shortest `AS-PATH` length (fewer autonomous system hops).
5. Step 5: Prefer lowest origin type (IGP < EGP < INCOMPLETE).
6. Step 6: Prefer lowest Multi-Exit Discriminator (`MED`) received from the neighboring AS.
7. Thus, the top standard non-proprietary sequence is: `Highest LOCAL-PREF -> Shortest AS-PATH -> Lowest MED`.
8. Option (A) is correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q51',
    year: 2026,
    subject: '''Data Structures''',
    topic: '''Self-Balancing Trees (AVL vs Red-Black)''',
    questionText: '''Which of the following statements comparing AVL trees and Red-Black trees are TRUE?''',
    options: ['''AVL trees maintain a stricter balance criterion than Red-Black trees, typically yielding shorter tree heights and faster search queries for read-heavy workloads.''', '''Inserting an element into an AVL tree requires at most 2 tree rotations (one single or double rotation) to restore balance.''', '''Inserting an element into a Red-Black tree requires at most 2 tree rotations to restore the red-black coloring properties.''', '''Deleting an element from an AVL tree can cause \$O(\\log n)\$ rotations propagating up to the root, whereas deleting an element from a Red-Black tree requires at most 3 rotations.'''],
    correctAnswer: '''A, B, C, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Comprehensive Comparison of AVL and Red-Black Trees:
1. Statement (A): AVL tree balance requires balance factor \$\\in \\{-1, 0, +1\\}\$, bounding height by \$\\approx 1.44 \\log_2 n\$. Red-Black tree height is bounded by \$2 \\log_2(n + 1)\$. The stricter height bound makes AVL trees faster for lookups. (A is TRUE).
2. Statement (B): During AVL insertion, once a single or double rotation is performed at the lowest unbalanced node, the height of the subtree is restored to its pre-insertion height, requiring no further rotations. (B is TRUE).
3. Statement (C): During Red-Black insertion, fixing violations involves recoloring and at most 2 rotations (case 2 and case 3). (C is TRUE).
4. Statement (D): During AVL deletion, a rotation can decrease subtree height, triggering rebalancing at successive ancestors all the way to the root (\$O(\\log n)\$ rotations). In a Red-Black tree, deletion requires at most 3 rotations (case 4). (D is TRUE).
5. Hence, all four statements (A, B, C, D) are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q52',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''Language Family Closure Properties''',
    questionText: '''Which of the following statements regarding the closure properties of formal language families are TRUE?''',
    options: ['''Regular languages are closed under the reversal operation (\$L^R\$).''', '''Context-Free Languages are closed under union and concatenation, but are NOT closed under complementation.''', '''Recursive (Decidable) languages are closed under complementation, union, and intersection.''', '''Recursively Enumerable (Turing-recognizable) languages are closed under intersection.'''],
    correctAnswer: '''A, B, C, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Closure Properties Verification:
1. Statement (A): If \$L\$ is regular, there is an NFA for \$L\$. Reversing all transition arrows and interchanging start and accept states yields an NFA for \$L^R\$. Thus regular languages are closed under reversal. (A is TRUE).
2. Statement (B): CFLs are closed under union (\$S \\to S_1 \\mid S_2\$) and concatenation (\$S \\to S_1 S_2\$). They are not closed under intersection, and since \$L_1 \\cap L_2 = \\overline{\\overline{L_1} \\cup \\overline{L_2}}\$, they cannot be closed under complementation. (B is TRUE).
3. Statement (C): Decidable languages are closed under all Boolean operations: complementation (invert accept/reject), union/intersection (run both deciders sequentially). (C is TRUE).
4. Statement (D): If \$L_1, L_2 \\in \\text{RE}\$, a Turing machine can run both recognizers in lockstep on two tapes; it accepts if both accept. Thus RE is closed under intersection. (D is TRUE).
5. Hence, all four options (A, B, C, D) are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q53',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''CPU Scheduling Policies''',
    questionText: '''Which of the following assertions regarding CPU scheduling algorithms are TRUE?''',
    options: ['''First-Come First-Served (FCFS) scheduling is vulnerable to the Convoy Effect, where short CPU-burst processes suffer high waiting times behind long CPU-bound processes.''', '''Non-preemptive Shortest Job First (SJF) is provably optimal in minimizing the average waiting time among all non-preemptive scheduling algorithms.''', '''Priority scheduling with static priorities can lead to process starvation, which can be mitigated using the Aging technique.''', '''In Round Robin (RR) scheduling, as the time quantum \$q \\to \\infty\$, the algorithm becomes equivalent to Shortest Remaining Time First (SRTF).'''],
    correctAnswer: '''A, B, C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''CPU Scheduling Properties:
1. Statement (A): In FCFS, when a long CPU-bound job occupies the CPU, I/O-bound processes finish their short bursts and sit idle in the ready queue waiting for the long job, decreasing CPU and device utilization (Convoy Effect). (A is TRUE).
2. Statement (B): Moving a shorter job before a longer job decreases the waiting time of the short job by more than it increases the waiting time of the long job, provably minimizing average waiting time. (B is TRUE).
3. Statement (C): Static low-priority processes can starve if higher priority processes continuously arrive. Aging gradually increments the priority of waiting processes over time. (C is TRUE).
4. Statement (D): As \$q \\to \\infty\$, each process runs to completion on its first turn, making Round Robin equivalent to First-Come First-Served (FCFS), NOT SRTF. (D is FALSE).
5. Hence, options A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q54',
    year: 2026,
    subject: '''Databases''',
    topic: '''Two-Phase Locking (2PL)''',
    questionText: '''Which of the following assertions regarding Two-Phase Locking (2PL) protocols are TRUE?''',
    options: ['''Basic Two-Phase Locking (2PL) mathematically guarantees that any concurrent execution schedule is conflict serializable.''', '''Basic Two-Phase Locking (2PL) is completely immune to deadlocks.''', '''Strict Two-Phase Locking (Strict 2PL) prevents cascading aborts by holding all exclusive (write) locks until the transaction commits or aborts.''', '''Rigorous Two-Phase Locking holds both shared and exclusive locks until the transaction completes, causing transactions to serialize in the exact order of their commits.'''],
    correctAnswer: '''A, C, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Concurrency Control and 2PL Protocols:
1. Statement (A): The Two-Phase Locking theorem proves that if every transaction acquires all locks before releasing any lock, the precedence graph is acyclic, guaranteeing conflict serializability. (A is TRUE).
2. Statement (B): Basic 2PL is NOT immune to deadlocks. Two transactions can easily form a circular wait by each acquiring a lock and requesting the lock held by the other. (B is FALSE).
3. Statement (C): Strict 2PL mandates that exclusive locks are held until commit, preventing dirty reads and cascading rollbacks. (C is TRUE).
4. Statement (D): Rigorous 2PL holds all shared and exclusive locks until commit, ensuring commit-order serializability. (D is TRUE).
5. Hence, options A, C, and D are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q55',
    year: 2026,
    subject: '''Computer Networks''',
    topic: '''TCP Protocols & Mechanisms''',
    questionText: '''Which of the following statements regarding TCP mechanisms and protocol enhancements are TRUE?''',
    options: ['''TCP Fast Retransmit initiates retransmission of a missing segment upon the arrival of 3 duplicate ACKs without waiting for the retransmission timer to expire.''', '''TCP SYN Cookies protect servers from SYN Flood DoS attacks by encoding connection parameters into the initial sequence number, deferring state allocation until the final ACK arrives.''', '''Selective Acknowledgment (SACK) allows the receiver to explicitly acknowledge discontiguous blocks of successfully received packets.''', '''In TCP Reno, upon detecting packet loss via 3 duplicate ACKs, the congestion window is reset immediately to 1 MSS.'''],
    correctAnswer: '''A, B, C''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''TCP Transport Mechanisms:
1. Statement (A): Fast Retransmit uses 3 duplicate ACKs (4 identical ACKs total) as a strong heuristic of packet loss, retransmitting immediately before RTO expiration. (A is TRUE).
2. Statement (B): SYN Cookies compute a cryptographic hash of client IP, client port, and server secret to form the SYN-ACK sequence number. No transmission control block (TCB) state is allocated in memory until the 3-way handshake completes. (B is TRUE).
3. Statement (C): SACK (RFC 2018) uses TCP options to specify up to 4 discontiguous blocks received, allowing the sender to retransmit only missing segments. (C is TRUE).
4. Statement (D): In TCP Reno, receiving 3 duplicate ACKs triggers Fast Recovery, which sets \$\\text{ssthresh} = \\text{cwnd}/2\$ and \$\\text{cwnd} = \\text{ssthresh} + 3\\text{ MSS}\$ (it does NOT reset to 1 MSS; TCP Tahoe resets to 1 MSS). (D is FALSE).
5. Hence, options A, B, and C are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q56',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Graph Coloring Theorems''',
    questionText: '''Let \$G = (V, E)\$ be a simple, connected, undirected graph with maximum vertex degree \$\\Delta(G)\$ and chromatic number \$\\chi(G)\$. Which of the following statements are ALWAYS TRUE?''',
    options: ['''Brooks' Theorem: \$\\chi(G) \\le \\Delta(G)\$ for any connected graph \$G\$, unless \$G\$ is a complete graph or an odd cycle.''', '''If \$G\$ is a bipartite graph containing at least one edge, its chromatic number is \$\\chi(G) = 2\$.''', '''Four Color Theorem: Every planar graph can be properly vertex-colored using at most 4 colors.''', '''Every tree containing 2 or more vertices has chromatic number \$\\chi(T) = 2\$.'''],
    correctAnswer: '''A, B, C, D''',
    isMCQ: true,
    type: 'MSQ',
    explanation: '''Graph Coloring Fundamental Theorems:
1. Statement (A) (Brooks' Theorem, 1941): For every connected graph, \$\\chi(G) \\le \\Delta(G)\$ with exactly two exceptions: complete graphs \$K_n\$ (where \$\\chi = \\Delta + 1\$) and odd cycles \$C_{2k+1}\$ (where \$\\chi = 3, \\Delta = 2\$). (A is TRUE).
2. Statement (B): By definition, a bipartite graph has vertices partitioned into two independent sets with all edges running between them. Thus, 2 colors suffice, and since it has at least one edge, \$\\chi(G) = 2\$. (B is TRUE).
3. Statement (C) (Four Color Theorem, Appel & Haken, 1976): Every planar graph is 4-colorable: \$\\chi(G) \\le 4\$. (C is TRUE).
4. Statement (D): Any tree is acyclic, hence has no odd cycles, meaning every tree is bipartite. For trees with \$\\ge 2\$ vertices, there is at least one edge, so \$\\chi(T) = 2\$. (D is TRUE).
5. Hence, all four statements (A, B, C, D) are correct.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q57',
    year: 2026,
    subject: '''Discrete Mathematics''',
    topic: '''Combinatorics & Integer Solutions''',
    questionText: '''Determine the total number of integer solutions to the equation:
\$\$x_1 + x_2 + x_3 + x_4 = 20\$\$
satisfying the lower-bound constraints \$x_1 \\ge 1, \\, x_2 \\ge 2, \\, x_3 \\ge 3, \\, x_4 \\ge 4\$.''',
    options: [],
    correctAnswer: '''286''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Integer Partition with Constraints:
1. Define substitution variables to transform into non-negative integers (\$y_i \\ge 0\$):
   - \$y_1 = x_1 - 1 \\implies x_1 = y_1 + 1\$
   - \$y_2 = x_2 - 2 \\implies x_2 = y_2 + 2\$
   - \$y_3 = x_3 - 3 \\implies x_3 = y_3 + 3\$
   - \$y_4 = x_4 - 4 \\implies x_4 = y_4 + 4\$
2. Substitute into the equation:
   \$\$(y_1 + 1) + (y_2 + 2) + (y_3 + 3) + (y_4 + 4) = 20\$\$
   \$\$y_1 + y_2 + y_3 + y_4 + 10 = 20\$\$
   \$\$y_1 + y_2 + y_3 + y_4 = 10 \\quad \\text{with } y_i \\ge 0\$\$
3. The number of non-negative integer solutions to \$y_1 + \\dots + y_k = n\$ is:
   \$\$N = \\binom{n + k - 1}{k - 1}\$\$
4. With \$n = 10\$ and \$k = 4\$:
   \$\$N = \\binom{10 + 4 - 1}{4 - 1} = \\binom{13}{3}\$\$
   \$\$\\binom{13}{3} = \\frac{13 \\times 12 \\times 11}{3 \\times 2 \\times 1} = \\frac{1716}{6} = 286\$\$
5. The number of solutions is exactly 286.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q58',
    year: 2026,
    subject: '''Algorithms''',
    topic: '''Fractional Knapsack''',
    questionText: '''A knapsack has a maximum carrying capacity of \$W = 50\\text{ kg}\$. Four items are available with values and weights:
- Item 1: Value = ₹120, Weight = 30 kg
- Item 2: Value = ₹100, Weight = 20 kg
- Item 3: Value = ₹60, Weight = 10 kg
- Item 4: Value = ₹50, Weight = 5 kg

What is the MAXIMUM total value (in ₹) that can be packed into the knapsack under the Fractional Knapsack problem model?''',
    options: [],
    correctAnswer: '''270''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Greedy Fractional Knapsack Computation:
1. Compute the value-to-weight ratio for each item:
   - Item 4: \$50 / 5 = 10.0\\text{ ₹/kg}\$
   - Item 3: \$60 / 10 = 6.0\\text{ ₹/kg}\$
   - Item 2: \$100 / 20 = 5.0\\text{ ₹/kg}\$
   - Item 1: \$120 / 30 = 4.0\\text{ ₹/kg}\$

2. Greedy selection in decreasing order of ratio:
   - Step 1: Take Item 4 completely (wt = 5 kg \$\\le 50\$).
     Weight remaining \$= 50 - 5 = 45\\text{ kg}\$. Profit accumulated \$= ₹50\$.
   - Step 2: Take Item 3 completely (wt = 10 kg \$\\le 45\$).
     Weight remaining \$= 45 - 10 = 35\\text{ kg}\$. Profit accumulated \$= 50 + 60 = ₹110\$.
   - Step 3: Take Item 2 completely (wt = 20 kg \$\\le 35\$).
     Weight remaining \$= 35 - 20 = 15\\text{ kg}\$. Profit accumulated \$= 110 + 100 = ₹210\$.
   - Step 4: For Item 1 (weight 30 kg, ratio 4.0), take the fraction that fills the remaining 15 kg:
     Fraction \$= \\frac{15}{30} = 0.5\$.
     Value added \$= 0.5 \\times 120 = ₹60\$.
     Weight remaining \$= 15 - 15 = 0\\text{ kg}\$.

3. Total maximum profit:
   \$\$\\text{Total Value} = 210 + 60 = ₹270\$\$
4. The maximum value is exactly 270.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q59',
    year: 2026,
    subject: '''Digital Logic''',
    topic: '''Carry Select Adder Delay''',
    questionText: '''An 8-bit Carry Select Adder is partitioned into two 4-bit blocks: Block 0 (lower 4 bits) and Block 1 (upper 4 bits). Block 0 is implemented as a standard 4-bit Ripple Carry Adder. Block 1 computes both hypothetical addition results simultaneously using two parallel 4-bit Ripple Carry Adders (one with carry-in 0, and one with carry-in 1), and a 2-to-1 multiplexer selects the correct outputs once Block 0's carry-out arrives. The gate delays are:
- Full Adder carry-out delay = 2 ns
- Full Adder sum delay = 3 ns
- 2-to-1 Multiplexer delay = 1 ns
Assuming all inputs arrive at \$t = 0\$, what is the total propagation delay (in nanoseconds) required for all sum and carry outputs to become stable?''',
    options: [],
    correctAnswer: '''10''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Carry Select Adder Propagation Delay:
1. Block 0 (Lower 4-bit RCA):
   - Computes carry-out \$C_4\$ through 4 full adders:
     \$\$t_{C_4} = 4 \\times 2\\text{ ns} = 8\\text{ ns}\$\$
   - Computes lower sum bits \$S_0..S_3\$:
     \$\$t_{S_{0..3}} = (4 - 1) \\times 2 + 3 = 6 + 3 = 9\\text{ ns}\$\$

2. Block 1 (Upper 4-bit parallel RCAs):
   - Operates in parallel starting at \$t = 0\$.
   - Computes hypothetical sum bits for \$C_{\\text{in}} = 0\$ and \$C_{\\text{in}} = 1\$:
     \$\$t_{\\text{sum\\_cand}} = 3 \\times 2 + 3 = 9\\text{ ns}\$\$
   - Computes hypothetical carry-outs:
     \$\$t_{\\text{carry\\_cand}} = 4 \\times 2 = 8\\text{ ns}\$\$
   - Both candidate inputs to the multiplexer are stable at \$t = \\max(8, 9) = 9\\text{ ns}\$.

3. Multiplexing stage:
   - The MUX select input is \$C_4\$, which is ready at \$t = 8\\text{ ns}\$.
   - The MUX data inputs are ready at \$t = 9\\text{ ns}\$.
   - The MUX can only produce valid outputs after both data inputs and select signals are stable:
     \$\$t_{\\text{ready}} = \\max(t_{\\text{select}}, \\, t_{\\text{data}}) = \\max(8, \\, 9) = 9\\text{ ns}\$\$
   - Adding the MUX delay of 1 ns:
     \$\$t_{\\text{final}} = 9 + 1 = 10\\text{ ns}\$\$

4. Therefore, the worst-case propagation delay is 10 ns.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q60',
    year: 2026,
    subject: '''Computer Organization and Architecture''',
    topic: '''Multi-Level Cache EMAT''',
    questionText: '''A computer system incorporates a two-level cache hierarchy with main memory. The system parameters are:
- L1 Cache: Hit latency = 2 ns, Local miss rate = 10%
- L2 Cache: Hit latency = 10 ns, Local miss rate = 20%
- Main Memory: Access latency = 100 ns

Calculate the Effective Memory Access Time (EMAT) of this system in nanoseconds.''',
    options: [],
    correctAnswer: '''5''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Effective Memory Access Time (EMAT) Derivation:
1. Formula for hierarchical multi-level cache:
   \$\$\\text{EMAT} = T_{L1} + (1 - H_{L1}) \\times [T_{L2} + (1 - H_{L2}) \\times T_{MM}]\$\$
2. Given parameters:
   - \$T_{L1} = 2\\text{ ns}\$
   - Miss rate of L1: \$(1 - H_{L1}) = 0.10\$
   - \$T_{L2} = 10\\text{ ns}\$
   - Miss rate of L2: \$(1 - H_{L2}) = 0.20\$
   - \$T_{MM} = 100\\text{ ns}\$

3. Compute L1 Miss Penalty:
   \$\$\\text{Penalty}_{L1} = T_{L2} + (1 - H_{L2}) \\times T_{MM} = 10 + (0.20 \\times 100) = 10 + 20 = 30\\text{ ns}\$\$

4. Compute overall EMAT:
   \$\$\\text{EMAT} = 2 + 0.10 \\times 30 = 2 + 3 = 5\\text{ ns}\$\$

5. The Effective Memory Access Time is exactly 5 nanoseconds.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q61',
    year: 2026,
    subject: '''Programming in C''',
    topic: '''Bitwise Manipulation''',
    questionText: '''Consider the following C program snippet:

```c
#include <stdio.h>
int main() {
    unsigned char a = 0x35;
    unsigned char b = 0x0A;
    unsigned char c = (a & 0x0F) | ((b << 4) ^ 0x20);
    printf("%u", c);
    return 0;
}
```
What is the unsigned decimal value printed by the program?''',
    options: [],
    correctAnswer: '''133''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Bitwise Operations Step-by-Step Trace:
1. `unsigned char a = 0x35;`
   - In binary: \$0011\\,0101_2\$.
   - Bitwise AND with `0x0F` (\$0000\\,1111_2\$):
     \$\$a \\,\\&\\, 0\\text{x0F} = 0011\\,0101_2 \\,\\&\\, 0000\\,1111_2 = 0000\\,0101_2 = 0\\text{x05}\$\$

2. `unsigned char b = 0x0A;`
   - In binary: \$0000\\,1010_2\$.
   - Left-shift by 4 bits:
     \$\$b \\ll 4 = 1010\\,0000_2 = 0\\text{xA0}\$\$
   - Bitwise XOR with `0x20` (\$0010\\,0000_2\$):
     \$\$(b \\ll 4) \\,\\hat{}\\ 0\\text{x20} = 1010\\,0000_2 \\,\\hat{}\\ 0010\\,0000_2 = 1000\\,0000_2 = 0\\text{x80}\$\$

3. Bitwise OR of both results:
   \$\$c = 0\\text{x05} \\mid 0\\text{x80} = 0000\\,0101_2 \\mid 1000\\,0000_2 = 1000\\,0101_2 = 0\\text{x85}\$\$

4. Convert `0x85` to decimal:
   \$\$\\text{Decimal} = 8 \\times 16 + 5 = 128 + 5 = 133\$\$
5. The output printed is 133.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q62',
    year: 2026,
    subject: '''Operating Systems''',
    topic: '''Inverted Page Table Sizing''',
    questionText: '''A computer system features 4 GB (\$2^{32}\$ bytes) of physical memory with a page frame size of 4 KB (\$2^{12}\$ bytes). An Inverted Page Table is used to map physical frames to virtual pages. Each entry in the inverted page table occupies exactly 6 bytes. What is the total memory space consumed by the inverted page table in KILOBYTES (KB)?''',
    options: [],
    correctAnswer: '''6144''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Inverted Page Table Size Calculation:
1. In an inverted page table, there is exactly ONE entry per physical memory frame.
2. Calculate the total number of physical frames:
   \$\$N_{\\text{frames}} = \\frac{\\text{Physical Memory Size}}{\\text{Page Frame Size}} = \\frac{4\\text{ GB}}{4\\text{ KB}} = \\frac{2^{32}\\text{ bytes}}{2^{12}\\text{ bytes}} = 2^{20} = 1,048,576\\text{ frames}\$\$
3. Size of each table entry \$= 6\\text{ bytes}\$.
4. Total size of the inverted page table in bytes:
   \$\$\\text{Size} = 2^{20} \\times 6\\text{ bytes} = 6 \\times 2^{20}\\text{ bytes} = 6\\text{ MB}\$\$
5. Convert megabytes to kilobytes:
   \$\$\\text{Size in KB} = 6 \\times 1024\\text{ KB} = 6144\\text{ KB}\$\$
6. The inverted page table consumes exactly 6144 KB.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q63',
    year: 2026,
    subject: '''Databases''',
    topic: '''External Merge Sort''',
    questionText: '''A database table contains \$N = 1000\$ disk blocks. The buffer pool allocated to execute External Merge Sort provides \$B = 10\$ buffer frames. How many TOTAL disk block I/Os (sum of block reads and block writes) are required to completely sort the table using the standard External Merge Sort algorithm?''',
    options: [],
    correctAnswer: '''8000''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''External Merge Sort I/O Cost:
1. Pass 0 (Initial Run Generation):
   - Reads all 1000 blocks into buffer in chunks of size \$B = 10\$, sorts them internally, and writes them back.
   - Number of initial sorted runs \$= \\lceil N / B \\rceil = \\lceil 1000 / 10 \\rceil = 100\$ runs of 10 blocks each.
   - I/Os in Pass 0: 1000 reads + 1000 writes \$= 2000\$ disk I/Os.

2. Merge Passes (using \$(B - 1) = 9\$-way merge):
   - Pass 1:
     Merges 100 runs in groups of 9.
     Number of runs produced \$= \\lceil 100 / 9 \\rceil = 12\$ runs.
     I/Os in Pass 1: 1000 reads + 1000 writes \$= 2000\$ disk I/Os.
   - Pass 2:
     Merges 12 runs in groups of 9.
     Number of runs produced \$= \\lceil 12 / 9 \\rceil = 2\$ runs.
     I/Os in Pass 2: 1000 reads + 1000 writes \$= 2000\$ disk I/Os.
   - Pass 3:
     Merges 2 runs into 1 final sorted table.
     I/Os in Pass 3: 1000 reads + 1000 writes \$= 2000\$ disk I/Os.

3. Total Passes \$= 1 + 3 = 4\$ passes.
4. Total Disk I/Os \$= 4 \\times 2 \\times N = 4 \\times 2 \\times 1000 = 8000\$ I/Os.
5. The answer is exactly 8000.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q64',
    year: 2026,
    subject: '''Computer Networks''',
    topic: '''IPv4 Packet Fragmentation''',
    questionText: '''An IPv4 datagram of total size 4000 bytes (comprising a standard 20-byte IP header and 3980 bytes of data payload) reaches a router interface with a Maximum Transmission Unit (MTU) of 1500 bytes. The router fragments the datagram. What is the value stored in the Fragment Offset field of the THIRD fragment?''',
    options: [],
    correctAnswer: '''370''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''IPv4 Fragmentation Field Computation:
1. Maximum Transmission Unit (MTU) \$= 1500\\text{ bytes}\$.
   - IP header size \$= 20\\text{ bytes}\$.
   - Maximum data payload per fragment \$= 1500 - 20 = 1480\\text{ bytes}\$.
   - Note that \$1480\$ is a multiple of 8 (\$1480 / 8 = 185\$).

2. Fragment breakdown of the 3980-byte payload:
   - Fragment 1:
     - Payload: bytes 0 through 1479 (1480 bytes).
     - Fragment Offset: \$0 / 8 = 0\$.
     - More Fragments (\$MF\$) flag \$= 1\$.
   - Fragment 2:
     - Payload: bytes 1480 through 2959 (1480 bytes).
     - Fragment Offset: \$1480 / 8 = 185\$.
     - More Fragments (\$MF\$) flag \$= 1\$.
   - Fragment 3:
     - Remaining payload \$= 3980 - 2960 = 1020\\text{ bytes}\$.
     - Payload: bytes 2960 through 3979.
     - Fragment Offset: \$\\frac{2960}{8} = 370\$.
     - More Fragments (\$MF\$) flag \$= 0\$.
     - Total length \$= 1020 + 20 = 1040\\text{ bytes} \\le 1500\$.

3. The Fragment Offset value of the third fragment is 370.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
  PYQ(
    id: 'CS_MOCK6_Q65',
    year: 2026,
    subject: '''Theory of Computation''',
    topic: '''DFA State Minimization for Parity''',
    questionText: '''Let \$L\$ be the language over \$\\{0, 1\\}\$ consisting of all strings that contain an ODD number of 1s AND an EVEN number of 0s. What is the minimum number of states in a minimal Deterministic Finite Automaton (DFA) that accepts language \$L\$?''',
    options: [],
    correctAnswer: '''4''',
    isMCQ: false,
    type: 'NAT',
    explanation: '''Minimal DFA for Joint Parity:
1. The language requires tracking two independent binary parity conditions:
   - Parity of the number of 0s: Even (\$E_0\$) or Odd (\$O_0\$).
   - Parity of the number of 1s: Even (\$E_1\$) or Odd (\$O_1\$).
2. The product state space consists of \$2 \\times 2 = 4\$ states:
   - \$q_0 = (E_0, E_1)\$: Start state (0 zeros, 0 ones \$\\implies\$ both even).
   - \$q_1 = (E_0, O_1)\$: Even zeros, Odd ones. (Accepting state!).
   - \$q_2 = (O_0, E_1)\$: Odd zeros, Even ones.
   - \$q_3 = (O_0, O_1)\$: Odd zeros, Odd ones.
3. State Transitions:
   - Reading '0' toggles the parity of 0s:
     - \$\\delta(q_0, 0) = q_2\$, \$\\delta(q_2, 0) = q_0\$
     - \$\\delta(q_1, 0) = q_3\$, \$\\delta(q_3, 0) = q_1\$
   - Reading '1' toggles the parity of 1s:
     - \$\\delta(q_0, 1) = q_1\$, \$\\delta(q_1, 1) = q_0\$
     - \$\\delta(q_2, 1) = q_3\$, \$\\delta(q_3, 1) = q_2\$
4. Distinguishability:
   - All 4 states are reachable from \$q_0\$.
   - Any pair of states differs in the parity of either 0s, 1s, or both, and can be distinguished by appending an appropriate suffix string (such as \$\\epsilon, 0, 1,\$ or \$01\$).
   - By the Myhill-Nerode theorem, none of the 4 states can be merged.
5. Therefore, the minimal DFA contains exactly 4 states.''',
    difficulty: 'Hard',
    hasImage: false,
  ),
];
