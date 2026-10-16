import 'dart:convert';

class RoadmapData {
  static final Map<String, dynamic> da3MonthRoadmap = jsonDecode(r'''
{
  "meta": {
    "exam": "GATE DA 2027",
    "exam_date": "February 2027",
    "roadmap_type": "3-month (fresh start)",
    "start_date": "2026-11-01",
    "end_date": "2027-01-31",
    "total_weeks": 13,
    "target": "65+ marks, sub-500 AIR",
    "note": "Designed for students starting from zero. Every subject covered from scratch. Minimum 6 hrs/day weekdays, 8+ hrs weekends. No prior preparation assumed.",
    "total_marks": 100,
    "aptitude_marks": 15,
    "core_marks": 85
  },
  "daily_routine": {
    "weekday": [
      { "time": "04:00-06:30", "block": "Deep study – new concepts from scratch (lecture + notes)" },
      { "time": "06:30-07:00", "block": "Error log update + formula revision" },
      { "time": "20:00-22:00", "block": "PYQ practice + DPP on today's topic" },
      { "time": "22:00-22:15", "block": "Next-day planning + study plan check" }
    ],
    "weekend": [
      { "time": "04:00-07:30", "block": "Revision – full previous week topics" },
      { "time": "08:00-10:00", "block": "Topic-wise PYQ set (timed, all years)" },
      { "time": "10:30-12:00", "block": "Mock test or timed mixed problem set" },
      { "time": "20:00-21:30", "block": "Mock analysis + error log update" }
    ],
    "rules": [
      "Start every topic from absolute basics – do not skip fundamentals",
      "No passive lecture watching – pause after every concept and solve problems",
      "PYQs immediately after each topic, not at the end of the week",
      "Error log: write every wrong answer with mistake type and correct concept",
      "Sunday evening: plan the full coming week day by day",
      "Mock tests every Sunday from Week 10 onwards",
      "General Aptitude: 30 min every Saturday throughout the plan"
    ]
  },
  "subject_weightage": [
    { "subject": "General Aptitude", "marks": 15, "priority": "High – always 15 marks, easy scoring" },
    { "subject": "Probability & Statistics", "marks": "12-18", "priority": "Highest – biggest section in DA" },
    { "subject": "Linear Algebra", "marks": "8-12", "priority": "High" },
    { "subject": "Calculus & Optimization", "marks": "8-12", "priority": "High" },
    { "subject": "Machine Learning", "marks": "10-15", "priority": "High" },
    { "subject": "Artificial Intelligence", "marks": "4-8", "priority": "Medium" },
    { "subject": "DBMS", "marks": "6-10", "priority": "High" },
    { "subject": "DSA", "marks": "8-12", "priority": "High" },
    { "subject": "Python Programming", "marks": "4-8", "priority": "Medium – high ROI, easy marks" }
  ],
  "phases": [
    {
      "phase": 1,
      "title": "Linear Algebra + Probability & Statistics",
      "weeks": "1-4",
      "dates": "Nov 1 – Nov 28, 2026",
      "subjects": ["Linear Algebra", "Probability & Statistics"],
      "note": "These two are the highest weightage math subjects in GATE DA. Start here. Build from zero.",
      "weekly_plan": [
        {
          "week": 1,
          "subject": "Linear Algebra",
          "topics": [
            "Vectors and vector spaces",
            "Linear independence, basis, dimension",
            "Rank, nullity, rank-nullity theorem",
            "System of linear equations (Ax=b)",
            "Eigenvalues and eigenvectors",
            "Diagonalization"
          ],
          "daily_targets": {
            "Mon": "Vectors, vector spaces, subspaces – lecture from scratch + 10 PYQs",
            "Tue": "Linear independence, basis, dimension – lecture + DPP",
            "Wed": "Rank, nullity, rank-nullity theorem – lecture + PYQs",
            "Thu": "System of linear equations (Ax=b): consistency, infinite solutions – lecture + problems",
            "Fri": "Eigenvalues and eigenvectors – lecture + 10 PYQs",
            "Sat": "Diagonalization, symmetric matrices, PSD – lecture + PYQs + 30 min Aptitude",
            "Sun": "LA week 1 full revision + all week PYQs re-attempt + next week planning"
          }
        },
        {
          "week": 2,
          "subject": "Linear Algebra (continued) + start P&S",
          "topics": [
            "Matrix norms, trace, determinant",
            "Orthogonality, Gram-Schmidt",
            "SVD (conceptual)",
            "Projections",
            "Probability axioms",
            "Conditional probability, Bayes theorem"
          ],
          "daily_targets": {
            "Mon": "Matrix norms, trace, determinant properties – lecture + PYQs",
            "Tue": "Orthogonality, Gram-Schmidt process – lecture + DPP",
            "Wed": "SVD (conceptual understanding) + projections – lecture + PYQs",
            "Thu": "Full LA PYQ set (GATE DA 2024 + 2025, all LA questions, timed) – review errors",
            "Fri": "Probability: sample space, events, axioms – lecture from scratch + PYQs",
            "Sat": "Conditional probability, Bayes theorem, total probability – lecture + PYQs + 30 min Aptitude",
            "Sun": "LA complete revision + Bayes problems + next week planning"
          }
        },
        {
          "week": 3,
          "subject": "Probability & Statistics – Distributions + Random Variables",
          "topics": [
            "Discrete random variables: PMF, CDF",
            "Binomial, Poisson, Geometric distributions",
            "Continuous random variables",
            "Uniform, Exponential, Normal distributions",
            "Expectation, variance, moments",
            "MGF"
          ],
          "daily_targets": {
            "Mon": "Discrete RVs: PMF, CDF, expected value – lecture from scratch + PYQs",
            "Tue": "Binomial, Poisson, Geometric distributions – lecture + DPP",
            "Wed": "Continuous RVs: PDF, CDF – Uniform, Exponential distributions – lecture + PYQs",
            "Thu": "Normal distribution (standard normal, Z-scores) – lecture + problems",
            "Fri": "Expectation, variance, standard deviation, moments – lecture + PYQs",
            "Sat": "MGF, moment-generating functions – lecture + PYQs + 30 min Aptitude",
            "Sun": "Distributions full revision + GATE DA PYQ blitz (all distribution questions) + planning"
          }
        },
        {
          "week": 4,
          "subject": "Probability & Statistics – Joint Distributions + Inference",
          "topics": [
            "Joint distributions, marginal, conditional distributions",
            "Covariance, correlation",
            "Central Limit Theorem, Law of Large Numbers",
            "Sampling distributions",
            "Point estimation: MLE, MAP",
            "Hypothesis testing basics",
            "Confidence intervals"
          ],
          "daily_targets": {
            "Mon": "Joint distributions: joint PMF/PDF, marginal, conditional – lecture + PYQs",
            "Tue": "Covariance, correlation, independence of RVs – lecture + DPP",
            "Wed": "CLT, LLN, sampling distributions (t, chi-square, F) – lecture + PYQs",
            "Thu": "Point estimation: MLE, MAP – lecture + problems",
            "Fri": "Hypothesis testing (null/alternate, Type I/II errors, p-value) + confidence intervals – lecture + PYQs",
            "Sat": "Full P&S PYQ set (GATE DA 2024 + 2025, all P&S questions, timed) + 30 min Aptitude",
            "Sun": "Mock test 1: Linear Algebra + Probability & Statistics (full, 90 min) + analysis"
          }
        }
      ],
      "phase_end_milestone": "100% LA + P&S PYQs (GATE DA 2024 + 2025) attempted. Mock 1 score > 60%."
    },
    {
      "phase": 2,
      "title": "Calculus + Optimization + Machine Learning + AI",
      "weeks": "5-9",
      "dates": "Nov 29 – Jan 2, 2027",
      "subjects": ["Calculus", "Optimization", "Machine Learning", "Artificial Intelligence"],
      "weekly_plan": [
        {
          "week": 5,
          "subject": "Calculus + Optimization",
          "topics": [
            "Limits, continuity (single and multivariable)",
            "Partial derivatives, chain rule, total derivative",
            "Gradient, directional derivative",
            "Hessian, critical points, maxima/minima",
            "Taylor series expansion",
            "Convex functions and convex sets",
            "Gradient descent, SGD, mini-batch GD",
            "KKT conditions, Lagrange multipliers"
          ],
          "daily_targets": {
            "Mon": "Limits, continuity, partial derivatives – lecture from scratch + PYQs",
            "Tue": "Chain rule, total derivative, gradient, directional derivative – lecture + DPP",
            "Wed": "Hessian matrix, critical points, maxima/minima (multivariable) – lecture + PYQs",
            "Thu": "Taylor series + convexity (definition, properties, examples) – lecture + problems",
            "Fri": "Gradient descent, SGD, learning rate, convergence – lecture + PYQs",
            "Sat": "Lagrange multipliers, KKT conditions + full Calculus+Optimization PYQ set (timed) + 30 min Aptitude",
            "Sun": "Calculus + Optimization full revision + mock mini-test + planning"
          }
        },
        {
          "week": 6,
          "subject": "Machine Learning – Supervised Learning",
          "topics": [
            "Linear regression (closed form + gradient descent)",
            "Logistic regression",
            "Regularization: L1 (Lasso), L2 (Ridge)",
            "Bias-variance tradeoff",
            "Cross-validation",
            "Support Vector Machines",
            "Decision trees (ID3, entropy, Gini index)"
          ],
          "daily_targets": {
            "Mon": "Linear regression: closed form solution, gradient descent derivation – lecture from scratch + PYQs",
            "Tue": "Logistic regression: sigmoid, cross-entropy loss – lecture + DPP",
            "Wed": "Regularization (L1/L2), bias-variance tradeoff, overfitting/underfitting – lecture + PYQs",
            "Thu": "SVM: hard margin, soft margin, kernel trick – lecture + problems",
            "Fri": "Decision trees: entropy, information gain, Gini, ID3 algorithm – lecture + PYQs",
            "Sat": "Cross-validation, evaluation metrics (accuracy, precision, recall, F1, ROC-AUC) – lecture + PYQs + 30 min Aptitude",
            "Sun": "Supervised ML full revision + GATE DA PYQ blitz + planning"
          }
        },
        {
          "week": 7,
          "subject": "Machine Learning – Unsupervised + Ensemble + Neural Nets",
          "topics": [
            "k-means clustering",
            "PCA (principal component analysis)",
            "Gaussian Mixture Models, EM algorithm",
            "Bagging, Boosting, Random Forest, AdaBoost",
            "Neural networks: perceptron, backpropagation",
            "Activation functions",
            "k-NN"
          ],
          "daily_targets": {
            "Mon": "k-means clustering: algorithm, convergence, limitations – lecture from scratch + PYQs",
            "Tue": "PCA: derivation using eigenvalues, variance explained – lecture + DPP",
            "Wed": "GMM, EM algorithm: expectation and maximization steps – lecture + PYQs",
            "Thu": "Ensemble: Bagging, Boosting, Random Forest, AdaBoost – lecture + problems",
            "Fri": "Neural networks: perceptron, feedforward, backpropagation, activation functions – lecture + PYQs",
            "Sat": "k-NN + full ML PYQ set (GATE DA 2024 + 2025, all ML questions, timed) + 30 min Aptitude",
            "Sun": "Mock test 2: LA + P&S + Calculus + ML (90 min) + analysis"
          }
        },
        {
          "week": 8,
          "subject": "Artificial Intelligence",
          "topics": [
            "Uninformed search: BFS, DFS, UCS",
            "Informed search: A*, greedy best-first",
            "Heuristics, admissibility",
            "Minimax algorithm, alpha-beta pruning",
            "Constraint satisfaction problems (CSP)",
            "Propositional logic",
            "First-order logic (FOL)"
          ],
          "daily_targets": {
            "Mon": "Uninformed search: BFS, DFS, UCS – time/space complexity – lecture from scratch + PYQs",
            "Tue": "Informed search: A* (admissible heuristic), greedy best-first – lecture + DPP",
            "Wed": "Minimax algorithm, alpha-beta pruning – lecture + PYQs",
            "Thu": "CSP: backtracking, constraint propagation, arc consistency – lecture + problems",
            "Fri": "Propositional logic: connectives, truth tables, resolution – lecture + PYQs",
            "Sat": "FOL: quantifiers, predicates + full AI PYQ set (GATE DA 2024 + 2025) + 30 min Aptitude",
            "Sun": "AI full revision + mock mini-test: AI only + planning"
          }
        },
        {
          "week": 9,
          "subject": "DBMS",
          "topics": [
            "ER model",
            "Relational model, relational algebra",
            "SQL",
            "Normalization: 1NF, 2NF, 3NF, BCNF",
            "Transactions: ACID properties",
            "Concurrency control",
            "Indexing: B-tree, B+-tree, hashing"
          ],
          "daily_targets": {
            "Mon": "ER model: entities, attributes, relationships, ER-to-relational mapping – lecture from scratch + PYQs",
            "Tue": "Relational algebra: select, project, join, division – lecture + DPP",
            "Wed": "SQL: joins (inner/outer/cross), subqueries, aggregation, GROUP BY – lecture + PYQs",
            "Thu": "Normalization: functional dependencies, 1NF to BCNF, lossy/lossless decomposition – lecture + problems",
            "Fri": "Transactions: ACID, serializability, conflict serializability, 2PL – lecture + PYQs",
            "Sat": "Indexing (B-tree, B+-tree) + full DBMS PYQ set (GATE DA 2024 + 2025, timed) + 30 min Aptitude",
            "Sun": "Mock test 3: LA + P&S + Calculus + ML + AI + DBMS (full 3-hr mock) + analysis"
          }
        }
      ],
      "phase_end_milestone": "Calculus + ML + AI + DBMS PYQs done. Mock 3 score > 55% (fresh start benchmark)."
    },
    {
      "phase": 3,
      "title": "DSA + Python + General Aptitude + Full Revision + Mocks",
      "weeks": "10-13",
      "dates": "Jan 3 – Jan 31, 2027",
      "subjects": ["DSA", "Python Programming", "General Aptitude", "All subjects – revision + mock tests"],
      "weekly_plan": [
        {
          "week": 10,
          "subject": "DSA + Python Programming",
          "topics": [
            "Arrays, linked lists, stacks, queues",
            "Trees: BST, AVL, heaps",
            "Graphs: BFS, DFS, shortest path, MST",
            "Hashing",
            "Sorting algorithms and complexity",
            "Dynamic programming",
            "Python: syntax, built-in data structures",
            "Python: OOP, comprehensions, lambda",
            "NumPy, Pandas basics"
          ],
          "daily_targets": {
            "Mon": "Arrays, stacks, queues, linked lists + sorting (merge, quick, heap) + complexity – lecture from scratch + PYQs",
            "Tue": "BST, AVL trees (rotations), heaps, priority queues – lecture + DPP",
            "Wed": "Graphs: BFS, DFS, Dijkstra, Bellman-Ford, MST (Prim, Kruskal) – lecture + PYQs",
            "Thu": "Hashing + DP (LCS, knapsack, LIS, edit distance) – lecture + problems",
            "Fri": "Python: lists, dicts, sets, tuples, comprehensions, OOP, lambda, map/filter – PYQs",
            "Sat": "NumPy (arrays, broadcasting, indexing) + Pandas (Series, DataFrame, groupby) – PYQs + Full DSA + Python PYQ set (timed) + 30 min Aptitude",
            "Sun": "Mock test 4: FULL SYLLABUS (3 hr, timed, all subjects) + analysis"
          }
        },
        {
          "week": 11,
          "subject": "General Aptitude Sprint + Revision Round 1",
          "topics": [
            "Verbal ability: reading comprehension, grammar, vocabulary",
            "Numerical ability: percentages, ratio, time-work, time-speed",
            "Analytical reasoning: series, puzzles, data interpretation",
            "Full syllabus rapid revision (1 subject per day)"
          ],
          "daily_targets": {
            "Mon": "Aptitude: verbal ability (RC passages, grammar, fill-in-the-blanks) – PYQ blitz (last 5 years)",
            "Tue": "Aptitude: numerical ability (percentages, profit-loss, ratio, time-work) – PYQ blitz",
            "Wed": "Aptitude: analytical reasoning (series, analogies, puzzles, DI) – PYQ blitz",
            "Thu": "LA + P&S rapid revision – formula sheet + GateOverflow problem set (40 questions, 60 min)",
            "Fri": "Calculus + Optimization + ML – formula sheet + GateOverflow problem set (40 questions)",
            "Sat": "AI + DBMS + DSA + Python – formula sheet + GateOverflow problem set + 30 min Aptitude",
            "Sun": "Mock test 5: FULL SYLLABUS including Aptitude (3 hr) + analysis"
          }
        },
        {
          "week": 12,
          "subject": "Targeted Weak Area Revision + Intensive Mocks",
          "topics": ["Based on mock 5 analysis – drill weakest subjects"],
          "daily_targets": {
            "Mon": "Weakest subject from mock 5 – deep drill (3 hrs: re-study from basics + PYQs)",
            "Tue": "2nd weakest subject – deep drill",
            "Wed": "3rd weakest subject + all previous wrong answers re-attempt",
            "Thu": "Mock test 6 (full syllabus + Aptitude, 3 hr, timed)",
            "Fri": "Mock 6 analysis + error log + formula sheet update",
            "Sat": "Mock test 7 (full syllabus + Aptitude, 3 hr) – exam conditions (morning slot) + 30 min Aptitude",
            "Sun": "Mock 7 analysis + rest"
          }
        },
        {
          "week": 13,
          "subject": "Final Revision + Exam Week",
          "topics": ["Formula sheets only, no new problems, confidence mocks, exam"],
          "daily_targets": {
            "Mon": "Mock test 8 – exact exam conditions (3 hr, morning, full syllabus)",
            "Tue": "Mock 8 analysis + re-attempt all wrong answers",
            "Wed": "Formula sheet revision: LA + P&S + Calculus + Optimization",
            "Thu": "Formula sheet revision: ML + AI + DBMS + DSA + Python + Aptitude",
            "Fri": "Zero new problems. Light read of formula sheets only. Sleep 10 PM.",
            "Sat": "Rest. Exam logistics prep. Sleep by 9 PM.",
            "Sun": "GATE DA 2027 EXAM"
          }
        }
      ],
      "phase_end_milestone": "8+ full mocks done. All subjects covered from scratch. Formula sheets ready. Average mock score 60+."
    }
  ],
  "mock_schedule": [
    { "mock": 1, "week": 4, "date_approx": "Nov 28", "scope": "Linear Algebra + Probability & Statistics", "duration_min": 90 },
    { "mock": 2, "week": 7, "date_approx": "Dec 19", "scope": "LA + P&S + Calculus + ML", "duration_min": 90 },
    { "mock": 3, "week": 9, "date_approx": "Jan 2", "scope": "Full syllabus except DSA + Python + Aptitude", "duration_min": 180 },
    { "mock": 4, "week": 10, "date_approx": "Jan 9", "scope": "Full syllabus (all subjects)", "duration_min": 180 },
    { "mock": 5, "week": 11, "date_approx": "Jan 16", "scope": "Full syllabus + Aptitude", "duration_min": 180 },
    { "mock": 6, "week": 12, "date_approx": "Jan 22", "scope": "Full syllabus + Aptitude", "duration_min": 180 },
    { "mock": 7, "week": 12, "date_approx": "Jan 25", "scope": "Full syllabus + Aptitude – exam conditions", "duration_min": 180 },
    { "mock": 8, "week": 13, "date_approx": "Jan 27", "scope": "Full syllabus + Aptitude – exam conditions", "duration_min": 180 }
  ],
  "weekly_targets_summary": [
    { "week": 1, "focus": "Linear Algebra (complete)", "pyq_goal": "All LA PYQs 2024+2025" },
    { "week": 2, "focus": "LA wrap-up + P&S start (Bayes)", "pyq_goal": "Full LA PYQ set timed" },
    { "week": 3, "focus": "Probability distributions, expectation, variance", "pyq_goal": "All distribution PYQs 2024+2025" },
    { "week": 4, "focus": "Joint distributions, CLT, MLE, hypothesis testing", "pyq_goal": "Full P&S PYQ set + Mock 1" },
    { "week": 5, "focus": "Calculus + Optimization (complete)", "pyq_goal": "All Calculus + Optimization PYQs" },
    { "week": 6, "focus": "ML supervised learning", "pyq_goal": "Supervised ML PYQs 2024+2025" },
    { "week": 7, "focus": "ML unsupervised + ensemble + neural nets", "pyq_goal": "Full ML PYQs + Mock 2" },
    { "week": 8, "focus": "Artificial Intelligence (complete)", "pyq_goal": "All AI PYQs 2024+2025" },
    { "week": 9, "focus": "DBMS (complete)", "pyq_goal": "All DBMS PYQs + Mock 3 (full syllabus)" },
    { "week": 10, "focus": "DSA + Python (complete)", "pyq_goal": "All DSA + Python PYQs + Mock 4" },
    { "week": 11, "focus": "General Aptitude + Revision Round 1", "pyq_goal": "Aptitude PYQs + Mock 5 full syllabus" },
    { "week": 12, "focus": "Weak area drill + Mocks 6 + 7", "pyq_goal": "Weakest subjects re-drilled" },
    { "week": 13, "focus": "Final revision + Exam", "pyq_goal": "Mock 8 + formula sheets + exam" }
  ]
}

''');

  static final Map<String, dynamic> da6MonthRoadmap = jsonDecode(r'''
{
  "meta": {
    "exam": "GATE DA 2027",
    "exam_date": "February 2027",
    "roadmap_type": "6-month",
    "start_date": "2026-08-01",
    "end_date": "2027-01-31",
    "total_weeks": 26,
    "target": "75+ marks, sub-200 AIR"
  },
  "daily_routine": {
    "weekday": [
      {
        "time": "04:00-06:00",
        "block": "Deep study \u2013 new concepts (lecture + notes)"
      },
      {
        "time": "06:00-07:00",
        "block": "PYQ practice \u2013 topic just covered"
      },
      {
        "time": "20:00-21:30",
        "block": "DPP / GateOverflow problems on today's topic"
      },
      {
        "time": "21:30-22:00",
        "block": "Error log update + next-day planning"
      }
    ],
    "weekend": [
      {
        "time": "04:00-07:00",
        "block": "Revision \u2013 previous week topics (heavy session)"
      },
      {
        "time": "07:30-09:30",
        "block": "Full topic-wise PYQ set (all years, timed)"
      },
      {
        "time": "10:00-12:00",
        "block": "Mock test or timed mixed problem set"
      },
      {
        "time": "20:00-22:00",
        "block": "Mock analysis + error log review"
      }
    ],
    "notes": [
      "No passive lecture watching \u2013 pause and solve before moving on",
      "Error log: note question, mistake type, correct concept after every session",
      "PYQs immediately after each topic, not at the end",
      "Sunday evening: plan the full coming week"
    ]
  },
  "phases": [
    {
      "phase": 1,
      "title": "Linear Algebra + Probability & Statistics",
      "weeks": "1\u20136",
      "dates": "Aug 1 \u2013 Sep 12, 2026",
      "subjects": [
        "Linear Algebra",
        "Probability & Statistics"
      ],
      "weekly_plan": [
        {
          "week": 1,
          "subject": "Linear Algebra",
          "topics": [
            "Vectors, vector spaces, subspaces",
            "Linear independence, basis, rank"
          ],
          "daily_targets": {
            "Mon": "Vectors & vector spaces \u2013 lecture + 10 PYQs",
            "Tue": "Linear independence & basis \u2013 lecture + DPP",
            "Wed": "Rank-nullity theorem \u2013 lecture + PYQs",
            "Thu": "Systems of equations (Ax=b) \u2013 lecture + problems",
            "Fri": "Revision + error log + 20 mixed PYQs",
            "Sat": "Full LA week-1 PYQ set (timed)",
            "Sun": "Weak area drill + next week planning"
          }
        },
        {
          "week": 2,
          "subject": "Linear Algebra",
          "topics": [
            "Eigenvalues, eigenvectors",
            "Diagonalization",
            "PSD matrices"
          ],
          "daily_targets": {
            "Mon": "Eigenvalues & eigenvectors \u2013 lecture + 10 PYQs",
            "Tue": "Diagonalization \u2013 lecture + DPP",
            "Wed": "PSD, symmetric matrices \u2013 lecture + PYQs",
            "Thu": "SVD intro \u2013 lecture + problems",
            "Fri": "Revision + error log",
            "Sat": "Full LA week-2 PYQ set",
            "Sun": "Mock mini-test: LA week 1+2"
          }
        },
        {
          "week": 3,
          "subject": "Linear Algebra",
          "topics": [
            "Matrix transformations",
            "Norms",
            "LA for ML applications"
          ],
          "daily_targets": {
            "Mon": "Matrix norms, trace, determinant \u2013 lecture + PYQs",
            "Tue": "Orthogonality, Gram-Schmidt \u2013 lecture + DPP",
            "Wed": "Projections \u2013 lecture + PYQs",
            "Thu": "LA applications in ML (PCA conceptual) \u2013 notes",
            "Fri": "Revision + error log",
            "Sat": "Full LA PYQ set 2024+2025 (all LA questions)",
            "Sun": "Weak area drill + planning"
          }
        },
        {
          "week": 4,
          "subject": "Probability & Statistics",
          "topics": [
            "Probability axioms, conditional probability, Bayes"
          ],
          "daily_targets": {
            "Mon": "Sample space, events, axioms \u2013 lecture + 10 PYQs",
            "Tue": "Conditional probability \u2013 lecture + DPP",
            "Wed": "Bayes theorem \u2013 lecture + PYQs",
            "Thu": "Total probability, independence \u2013 lecture + problems",
            "Fri": "Revision + error log",
            "Sat": "P&S week-4 PYQ set",
            "Sun": "LA revision sprint (30 min) + planning"
          }
        },
        {
          "week": 5,
          "subject": "Probability & Statistics",
          "topics": [
            "Random variables, distributions (discrete)",
            "Expectation, variance, moments"
          ],
          "daily_targets": {
            "Mon": "Discrete RVs, PMF, CDF \u2013 lecture + PYQs",
            "Tue": "Binomial, Poisson, Geometric \u2013 lecture + DPP",
            "Wed": "Expectation, variance \u2013 lecture + PYQs",
            "Thu": "MGF, moments \u2013 lecture + problems",
            "Fri": "Revision + error log",
            "Sat": "P&S week-5 PYQ set",
            "Sun": "Mock mini-test: P&S discrete"
          }
        },
        {
          "week": 6,
          "subject": "Probability & Statistics",
          "topics": [
            "Continuous distributions",
            "Joint distributions",
            "CLT, LLN"
          ],
          "daily_targets": {
            "Mon": "Uniform, Exponential, Normal \u2013 lecture + PYQs",
            "Tue": "Joint distributions, marginal, conditional \u2013 lecture + DPP",
            "Wed": "Covariance, correlation \u2013 lecture + PYQs",
            "Thu": "CLT, LLN, sampling distributions \u2013 lecture + problems",
            "Fri": "Revision + error log",
            "Sat": "Full P&S PYQ set 2024+2025",
            "Sun": "Phase 1 full revision + mini mock"
          }
        }
      ],
      "phase_end_milestone": "Solve 100% of GATE DA 2024+2025 LA and P&S questions independently"
    },
    {
      "phase": 2,
      "title": "Calculus + Optimization",
      "weeks": "7\u201311",
      "dates": "Sep 13 \u2013 Oct 17, 2026",
      "subjects": [
        "Calculus",
        "Optimization"
      ],
      "weekly_plan": [
        {
          "week": 7,
          "subject": "Calculus",
          "topics": [
            "Limits, continuity, differentiability",
            "Partial derivatives"
          ],
          "daily_targets": {
            "Mon": "Limits & continuity (multivariable) \u2013 lecture + PYQs",
            "Tue": "Partial derivatives \u2013 lecture + DPP",
            "Wed": "Chain rule, total derivative \u2013 lecture + PYQs",
            "Thu": "Gradient, directional derivative \u2013 lecture + problems",
            "Fri": "Revision + error log",
            "Sat": "Calculus week-7 PYQ set",
            "Sun": "P&S revision sprint + planning"
          }
        },
        {
          "week": 8,
          "subject": "Calculus",
          "topics": [
            "Maxima/minima (multivariable)",
            "Integration, series"
          ],
          "daily_targets": {
            "Mon": "Hessian, critical points \u2013 lecture + PYQs",
            "Tue": "Multivariable optimization \u2013 lecture + DPP",
            "Wed": "Taylor series expansion \u2013 lecture + PYQs",
            "Thu": "Integration (review) \u2013 problems",
            "Fri": "Revision + error log",
            "Sat": "Calculus full PYQ set",
            "Sun": "Mock mini-test: Calculus"
          }
        },
        {
          "week": 9,
          "subject": "Optimization",
          "topics": [
            "Convex functions, convex sets",
            "Gradient descent variants"
          ],
          "daily_targets": {
            "Mon": "Convexity definitions & properties \u2013 lecture + PYQs",
            "Tue": "Gradient descent, learning rate \u2013 lecture + DPP",
            "Wed": "SGD, mini-batch GD \u2013 lecture + PYQs",
            "Thu": "Convergence analysis \u2013 lecture + problems",
            "Fri": "Revision + error log",
            "Sat": "Optimization week-9 PYQ set",
            "Sun": "Calculus revision sprint + planning"
          }
        },
        {
          "week": 10,
          "subject": "Optimization",
          "topics": [
            "Constrained optimization",
            "Lagrange multipliers",
            "KKT conditions"
          ],
          "daily_targets": {
            "Mon": "Lagrange multipliers \u2013 lecture + PYQs",
            "Tue": "KKT conditions \u2013 lecture + DPP",
            "Wed": "Constrained optimization problems \u2013 PYQs",
            "Thu": "LP basics (conceptual for GATE) \u2013 notes + PYQs",
            "Fri": "Revision + error log",
            "Sat": "Full Optimization PYQ set",
            "Sun": "Mock mini-test: Optimization"
          }
        },
        {
          "week": 11,
          "subject": "Revision & Integration",
          "topics": [
            "LA + P&S + Calculus + Optimization combined revision"
          ],
          "daily_targets": {
            "Mon": "LA full revision \u2013 GateOverflow problems",
            "Tue": "P&S full revision \u2013 GateOverflow problems",
            "Wed": "Calculus full revision \u2013 GateOverflow problems",
            "Thu": "Optimization full revision \u2013 GateOverflow problems",
            "Fri": "Error log review across all 4 subjects",
            "Sat": "Full-length mock test: Phase 1+2 topics only",
            "Sun": "Mock analysis + weak topic targeting"
          }
        }
      ],
      "phase_end_milestone": "Achieve >80% on any Phase 1+2 mock test"
    },
    {
      "phase": 3,
      "title": "AI / ML + DBMS",
      "weeks": "12\u201317",
      "dates": "Oct 18 \u2013 Nov 21, 2026",
      "subjects": [
        "Machine Learning",
        "Artificial Intelligence",
        "DBMS"
      ],
      "weekly_plan": [
        {
          "week": 12,
          "subject": "Machine Learning",
          "topics": [
            "Supervised learning: Linear regression, logistic regression"
          ],
          "daily_targets": {
            "Mon": "Linear regression (closed form + GD) \u2013 lecture + PYQs",
            "Tue": "Logistic regression \u2013 lecture + DPP",
            "Wed": "Regularization (L1/L2) \u2013 lecture + PYQs",
            "Thu": "Bias-variance tradeoff \u2013 lecture + problems",
            "Fri": "Revision + error log",
            "Sat": "ML week-12 PYQ set",
            "Sun": "Planning + Phase 2 revision sprint"
          }
        },
        {
          "week": 13,
          "subject": "Machine Learning",
          "topics": [
            "Decision trees, SVM, k-NN",
            "Evaluation metrics"
          ],
          "daily_targets": {
            "Mon": "Decision trees (ID3, entropy, Gini) \u2013 lecture + PYQs",
            "Tue": "SVM (hard/soft margin, kernel) \u2013 lecture + DPP",
            "Wed": "k-NN \u2013 lecture + PYQs",
            "Thu": "Evaluation: accuracy, F1, ROC-AUC \u2013 lecture + problems",
            "Fri": "Revision + error log",
            "Sat": "ML week-13 PYQ set",
            "Sun": "Mock mini-test: ML supervised"
          }
        },
        {
          "week": 14,
          "subject": "Machine Learning",
          "topics": [
            "Unsupervised: k-means, PCA, GMM",
            "Ensemble methods"
          ],
          "daily_targets": {
            "Mon": "k-means clustering \u2013 lecture + PYQs",
            "Tue": "PCA (derivation via LA) \u2013 lecture + DPP",
            "Wed": "GMM, EM algorithm \u2013 lecture + PYQs",
            "Thu": "Bagging, Boosting, Random Forest \u2013 lecture + problems",
            "Fri": "Revision + error log",
            "Sat": "Full ML PYQ set 2024+2025",
            "Sun": "Mock mini-test: ML full"
          }
        },
        {
          "week": 15,
          "subject": "Artificial Intelligence",
          "topics": [
            "Search algorithms",
            "Constraint satisfaction",
            "Knowledge representation"
          ],
          "daily_targets": {
            "Mon": "BFS, DFS, A*, heuristics \u2013 lecture + PYQs",
            "Tue": "Minimax, alpha-beta pruning \u2013 lecture + DPP",
            "Wed": "CSP, backtracking \u2013 lecture + PYQs",
            "Thu": "Propositional logic, FOL \u2013 lecture + problems",
            "Fri": "Revision + error log",
            "Sat": "AI week-15 PYQ set",
            "Sun": "ML revision sprint + planning"
          }
        },
        {
          "week": 16,
          "subject": "DBMS",
          "topics": [
            "ER model, Relational model",
            "SQL, Normalization"
          ],
          "daily_targets": {
            "Mon": "ER model, ER-to-relational mapping \u2013 lecture + PYQs",
            "Tue": "Relational algebra \u2013 lecture + DPP",
            "Wed": "SQL (joins, aggregation, nested) \u2013 lecture + PYQs",
            "Thu": "Normalization (1NF\u2013BCNF) \u2013 lecture + problems",
            "Fri": "Revision + error log",
            "Sat": "DBMS week-16 PYQ set",
            "Sun": "AI revision sprint + planning"
          }
        },
        {
          "week": 17,
          "subject": "DBMS",
          "topics": [
            "Transactions, Indexing",
            "DBMS + AI+ML revision"
          ],
          "daily_targets": {
            "Mon": "Transactions, ACID, concurrency \u2013 lecture + PYQs",
            "Tue": "Indexing (B-tree, hashing) \u2013 lecture + DPP",
            "Wed": "Full DBMS PYQ set 2024+2025",
            "Thu": "AI full revision \u2013 GateOverflow",
            "Fri": "Error log review: ML+AI+DBMS",
            "Sat": "Full-length mock: Phase 3 topics",
            "Sun": "Mock analysis + weak area drill"
          }
        }
      ],
      "phase_end_milestone": "Cover all high-weightage ML/AI/DBMS PYQs; mock score >75%"
    },
    {
      "phase": 4,
      "title": "DSA + Python Programming",
      "weeks": "18\u201321",
      "dates": "Nov 22 \u2013 Dec 19, 2026",
      "subjects": [
        "Data Structures & Algorithms",
        "Python Programming"
      ],
      "weekly_plan": [
        {
          "week": 18,
          "subject": "DSA",
          "topics": [
            "Arrays, Linked Lists, Stacks, Queues",
            "Time & space complexity"
          ],
          "daily_targets": {
            "Mon": "Arrays, searching, sorting \u2013 lecture + PYQs",
            "Tue": "Linked lists \u2013 lecture + DPP",
            "Wed": "Stacks, queues, deque \u2013 lecture + PYQs",
            "Thu": "Complexity analysis (Master theorem) \u2013 lecture + problems",
            "Fri": "Revision + error log",
            "Sat": "DSA week-18 PYQ set",
            "Sun": "Phase 3 revision sprint + planning"
          }
        },
        {
          "week": 19,
          "subject": "DSA",
          "topics": [
            "Trees (BST, AVL, Heaps)",
            "Hashing"
          ],
          "daily_targets": {
            "Mon": "BST operations \u2013 lecture + PYQs",
            "Tue": "AVL trees, rotations \u2013 lecture + DPP",
            "Wed": "Heaps, priority queues \u2013 lecture + PYQs",
            "Thu": "Hashing (collision resolution) \u2013 lecture + problems",
            "Fri": "Revision + error log",
            "Sat": "DSA week-19 PYQ set",
            "Sun": "Mock mini-test: DSA trees"
          }
        },
        {
          "week": 20,
          "subject": "DSA",
          "topics": [
            "Graphs (BFS, DFS, shortest paths)",
            "Dynamic programming"
          ],
          "daily_targets": {
            "Mon": "Graph representations, BFS, DFS \u2013 lecture + PYQs",
            "Tue": "Dijkstra, Bellman-Ford \u2013 lecture + DPP",
            "Wed": "MST (Prim, Kruskal) \u2013 lecture + PYQs",
            "Thu": "DP (memoization, tabulation, classic problems) \u2013 lecture + problems",
            "Fri": "Revision + error log",
            "Sat": "Full DSA PYQ set 2024+2025",
            "Sun": "Mock mini-test: DSA full"
          }
        },
        {
          "week": 21,
          "subject": "Python Programming",
          "topics": [
            "Python syntax, data structures",
            "NumPy, Pandas basics for GATE"
          ],
          "daily_targets": {
            "Mon": "Python lists, dicts, sets, comprehensions \u2013 PYQs",
            "Tue": "Functions, lambda, map/filter \u2013 PYQs",
            "Wed": "OOP basics in Python \u2013 PYQs",
            "Thu": "NumPy arrays, indexing, ops \u2013 PYQs",
            "Fri": "Pandas (Series, DataFrame, groupby) \u2013 PYQs",
            "Sat": "Full Python PYQ set 2024+2025",
            "Sun": "DSA revision sprint + planning"
          }
        }
      ],
      "phase_end_milestone": "DSA + Python PYQs >85% accuracy; no pending lecture lectures"
    },
    {
      "phase": 5,
      "title": "Full Syllabus Revision + Mocks",
      "weeks": "22\u201326",
      "dates": "Dec 20, 2026 \u2013 Jan 31, 2027",
      "subjects": [
        "All subjects \u2013 revision + mock tests"
      ],
      "weekly_plan": [
        {
          "week": 22,
          "subject": "Revision Sprint 1",
          "topics": [
            "LA, P&S full revision"
          ],
          "daily_targets": {
            "Mon": "LA: all formulas, PYQs (1.5 hr)",
            "Tue": "P&S: all distributions, PYQs (1.5 hr)",
            "Wed": "LA + P&S combined GateOverflow set",
            "Thu": "Mock test 1 (full syllabus, 3 hr)",
            "Fri": "Mock 1 analysis + error log",
            "Sat": "Weak topics from mock 1 \u2013 drill",
            "Sun": "Planning + rest"
          }
        },
        {
          "week": 23,
          "subject": "Revision Sprint 2",
          "topics": [
            "Calculus, Optimization, ML revision"
          ],
          "daily_targets": {
            "Mon": "Calculus: key concepts + PYQs",
            "Tue": "Optimization: GD variants + PYQs",
            "Wed": "ML: supervised + unsupervised PYQs",
            "Thu": "Mock test 2 (full syllabus, 3 hr)",
            "Fri": "Mock 2 analysis + error log",
            "Sat": "Weak topics from mock 2 \u2013 drill",
            "Sun": "Planning + rest"
          }
        },
        {
          "week": 24,
          "subject": "Revision Sprint 3",
          "topics": [
            "AI, DBMS, DSA revision"
          ],
          "daily_targets": {
            "Mon": "AI: search + logic PYQs",
            "Tue": "DBMS: SQL + normalization PYQs",
            "Wed": "DSA: graphs + DP PYQs",
            "Thu": "Mock test 3 (full syllabus, 3 hr)",
            "Fri": "Mock 3 analysis + error log",
            "Sat": "Python + weak areas from error log",
            "Sun": "Planning + rest"
          }
        },
        {
          "week": 25,
          "subject": "Intense Mock Phase",
          "topics": [
            "Mock every 2 days, error log focus"
          ],
          "daily_targets": {
            "Mon": "Mock test 4 (timed, 3 hr)",
            "Tue": "Mock 4 analysis + hardest wrong questions",
            "Wed": "Mock test 5 (timed, 3 hr)",
            "Thu": "Mock 5 analysis + formula sheet update",
            "Fri": "Conceptual weak areas re-watch (selective)",
            "Sat": "Mock test 6 (timed, 3 hr)",
            "Sun": "Mock 6 analysis + rest"
          }
        },
        {
          "week": 26,
          "subject": "Final Week",
          "topics": [
            "Light revision, formula sheets, exam readiness"
          ],
          "daily_targets": {
            "Mon": "Formula sheet revision \u2013 LA + P&S",
            "Tue": "Formula sheet revision \u2013 Calculus + Optimization + ML",
            "Wed": "Quick PYQ pass \u2013 AI + DBMS + DSA + Python",
            "Thu": "Half mock (1.5 hr) + rest",
            "Fri": "Light revision only \u2013 no new problems",
            "Sat": "Rest, logistics, sleep early",
            "Sun": "GATE DA EXAM"
          }
        }
      ],
      "phase_end_milestone": "Mock test scores consistently 75+ marks; all major topics revised 3+ times"
    }
  ],
  "weekly_targets_summary": [
    {
      "weeks": "1\u20133",
      "focus": "Linear Algebra",
      "pyq_goal": "100% LA PYQs 2024+2025"
    },
    {
      "weeks": "4\u20136",
      "focus": "Probability & Statistics",
      "pyq_goal": "100% P&S PYQs 2024+2025"
    },
    {
      "weeks": "7\u20138",
      "focus": "Calculus",
      "pyq_goal": "100% Calculus PYQs"
    },
    {
      "weeks": "9\u201310",
      "focus": "Optimization",
      "pyq_goal": "100% Optimization PYQs"
    },
    {
      "weeks": "11",
      "focus": "Phase 1+2 Revision",
      "pyq_goal": "Full mock Phase 1+2"
    },
    {
      "weeks": "12\u201314",
      "focus": "Machine Learning",
      "pyq_goal": "100% ML PYQs 2024+2025"
    },
    {
      "weeks": "15",
      "focus": "AI",
      "pyq_goal": "100% AI PYQs"
    },
    {
      "weeks": "16\u201317",
      "focus": "DBMS",
      "pyq_goal": "100% DBMS PYQs"
    },
    {
      "weeks": "18\u201320",
      "focus": "DSA",
      "pyq_goal": "100% DSA PYQs 2024+2025"
    },
    {
      "weeks": "21",
      "focus": "Python",
      "pyq_goal": "100% Python PYQs"
    },
    {
      "weeks": "22\u201326",
      "focus": "Revision + Mocks",
      "pyq_goal": "6+ full mocks, 75+ avg score"
    }
  ]
}
''');

  static final Map<String, dynamic> cs3MonthRoadmap = jsonDecode(r'''
{
  "meta": {
    "exam": "GATE CS/IT 2027",
    "exam_date": "February 2027",
    "roadmap_type": "3-month (fresh start)",
    "start_date": "2026-11-01",
    "end_date": "2027-01-31",
    "total_weeks": 13,
    "target": "55+ marks, sub-1000 AIR",
    "note": "Designed for students starting from absolute zero. Every subject covered from scratch. No prior preparation assumed. Minimum 6 hrs/day weekdays, 8+ hrs weekends. GATE CS has 11 subjects — time is tight, consistency is everything.",
    "total_marks": 100,
    "aptitude_marks": 15,
    "core_marks": 85
  },
  "daily_routine": {
    "weekday": [
      { "time": "04:00-06:30", "block": "Deep study – new concepts from scratch (lecture + notes)" },
      { "time": "06:30-07:00", "block": "Error log update + formula revision" },
      { "time": "20:00-22:00", "block": "PYQ practice + DPP on today's topic" },
      { "time": "22:00-22:15", "block": "Next-day planning + study plan check" }
    ],
    "weekend": [
      { "time": "04:00-07:30", "block": "Revision – full previous week topics" },
      { "time": "08:00-10:00", "block": "Topic-wise PYQ set (timed, all years)" },
      { "time": "10:30-12:00", "block": "Mock test or timed mixed problem set" },
      { "time": "20:00-21:30", "block": "Mock analysis + error log update" }
    ],
    "rules": [
      "Start every topic from absolute basics – never skip fundamentals",
      "No passive lecture watching – pause after every concept and solve problems",
      "PYQs immediately after each topic, not at the end of the week",
      "Error log: write every wrong answer with mistake type and correct concept",
      "Sunday evening: plan the full coming week day by day",
      "GateOverflow is the primary PYQ discussion platform for GATE CS",
      "Mock tests every Sunday from Week 10 onwards",
      "General Aptitude: 30 min every Saturday throughout the plan"
    ]
  },
  "subject_weightage": [
    { "subject": "General Aptitude", "marks": 15, "priority": "High – always 15 marks, easy scoring" },
    { "subject": "Engineering Mathematics", "marks": "11-15", "priority": "High – Discrete Math + Probability heavy" },
    { "subject": "Algorithms", "marks": "8-12", "priority": "High" },
    { "subject": "Operating Systems", "marks": "8-12", "priority": "High" },
    { "subject": "Computer Networks", "marks": "8-12", "priority": "High" },
    { "subject": "DBMS", "marks": "6-10", "priority": "High" },
    { "subject": "Programming & Data Structures", "marks": "6-10", "priority": "High" },
    { "subject": "Theory of Computation", "marks": "6-10", "priority": "High" },
    { "subject": "Computer Organization & Architecture", "marks": "6-10", "priority": "High" },
    { "subject": "Compiler Design", "marks": "4-8", "priority": "Medium" },
    { "subject": "Digital Logic", "marks": "4-6", "priority": "Medium – low effort, decent marks" }
  ],
  "phases": [
    {
      "phase": 1,
      "title": "Engineering Mathematics + Digital Logic + Programming & Data Structures",
      "weeks": "1-5",
      "dates": "Nov 1 – Nov 28, 2026",
      "subjects": ["Engineering Mathematics", "Digital Logic", "Programming & Data Structures"],
      "note": "Math and DS are the foundation. Every other subject uses these concepts. Start here, build strong.",
      "weekly_plan": [
        {
          "week": 1,
          "subject": "Engineering Mathematics – Linear Algebra + Calculus",
          "topics": [
            "Matrices: types, operations, determinant, rank",
            "System of linear equations",
            "Eigenvalues and eigenvectors",
            "Limits, continuity, differentiability",
            "Partial derivatives, maxima/minima",
            "Integration basics"
          ],
          "daily_targets": {
            "Mon": "Matrices: types, operations, determinant, rank, row reduction – lecture from scratch + 10 PYQs",
            "Tue": "System of linear equations: consistency (Rouche-Capelli), solutions – lecture + DPP",
            "Wed": "Eigenvalues and eigenvectors, diagonalization – lecture + PYQs",
            "Thu": "Limits, continuity, differentiability (single variable) – lecture from scratch + PYQs",
            "Fri": "Partial derivatives, chain rule, maxima/minima (multivariable) – lecture + PYQs",
            "Sat": "Integration (definite, improper) + LA + Calculus PYQ set (timed, 45 min) + 30 min Aptitude",
            "Sun": "LA + Calculus full revision + all week wrong answers re-attempt + next week planning"
          }
        },
        {
          "week": 2,
          "subject": "Engineering Mathematics – Probability + Discrete Math",
          "topics": [
            "Probability axioms, conditional probability, Bayes theorem",
            "Random variables, distributions (Binomial, Poisson, Normal)",
            "Expectation, variance",
            "Set theory, relations, functions",
            "Propositional logic, predicate logic",
            "Graph theory: types, connectivity, planarity, coloring",
            "Combinatorics, recurrence relations"
          ],
          "daily_targets": {
            "Mon": "Probability axioms, conditional probability, Bayes theorem, total probability – lecture from scratch + PYQs",
            "Tue": "Random variables: PMF, CDF, Binomial, Poisson, Normal – expectation, variance – lecture + DPP",
            "Wed": "Set theory, relations (reflexive/symmetric/transitive/equivalence), functions – lecture from scratch + PYQs",
            "Thu": "Propositional logic: connectives, truth tables, tautology, resolution – predicate logic, quantifiers – lecture + PYQs",
            "Fri": "Graph theory: types, degree, connectivity, Euler/Hamiltonian, planarity, coloring, trees – lecture + PYQs",
            "Sat": "Combinatorics (permutation, combination, pigeonhole) + recurrence relations + full Engg Math PYQ set (timed) + 30 min Aptitude",
            "Sun": "Mock mini-test: full Engineering Mathematics (60 min) + analysis + planning"
          }
        },
        {
          "week": 3,
          "subject": "Digital Logic",
          "topics": [
            "Number systems: binary, octal, hexadecimal, conversions",
            "Boolean algebra, De Morgan's laws",
            "K-map minimization (SOP, POS)",
            "Combinational circuits: MUX, DEMUX, encoder, decoder, adder, subtractor",
            "Flip-flops: SR, JK, D, T",
            "Sequential circuits: counters, shift registers",
            "Hazards, PLDs"
          ],
          "daily_targets": {
            "Mon": "Number systems: binary, octal, hex, conversions, 2's complement, IEEE 754 – lecture from scratch + PYQs",
            "Tue": "Boolean algebra: theorems, De Morgan, SOP/POS + K-map minimization (2/3/4/5 variable) – lecture + DPP",
            "Wed": "Combinational circuits: MUX, DEMUX, encoder, decoder, full adder, subtractor – lecture + PYQs",
            "Thu": "Flip-flops: SR, JK, D, T – state tables, excitation tables – lecture + problems",
            "Fri": "Sequential circuits: synchronous/asynchronous counters, shift registers, sequence detectors – lecture + PYQs",
            "Sat": "Hazards, PLDs + full Digital Logic PYQ set (timed, all years) + 30 min Aptitude",
            "Sun": "Digital Logic full revision + mock mini-test: DL only + planning"
          }
        },
        {
          "week": 4,
          "subject": "Programming & Data Structures – C + Linear DS",
          "topics": [
            "C: pointers, arrays, structs, dynamic memory",
            "C: recursion, parameter passing",
            "Arrays, stacks, queues, linked lists",
            "Hashing"
          ],
          "daily_targets": {
            "Mon": "C: data types, pointers, pointer arithmetic, arrays, strings – lecture from scratch + PYQs",
            "Tue": "C: structs, unions, dynamic memory (malloc, calloc, free), scope – lecture + DPP",
            "Wed": "C: functions, recursion (factorial, fibonacci, tree recursion), parameter passing (value vs reference) – lecture + PYQs",
            "Thu": "Arrays, stacks, queues (linear, circular), deque – implementations + PYQs",
            "Fri": "Linked lists: singly, doubly, circular – insert, delete, reverse – lecture + PYQs",
            "Sat": "Hashing: hash functions, chaining, open addressing (linear/quadratic probing) + C + Linear DS PYQ set (timed) + 30 min Aptitude",
            "Sun": "C + Linear DS full revision + mock mini-test + planning"
          }
        },
        {
          "week": 5,
          "subject": "Programming & Data Structures – Trees + Graphs",
          "topics": [
            "Binary trees: traversals, height, diameter",
            "BST: insert, delete, search, successor",
            "AVL trees: rotations, balance factor",
            "Heaps: min-heap, max-heap, heap sort",
            "Graphs: representations, BFS, DFS",
            "Spanning trees, topological sort"
          ],
          "daily_targets": {
            "Mon": "Binary trees: inorder, preorder, postorder traversals, height, level order – lecture from scratch + PYQs",
            "Tue": "BST: insert, delete (all 3 cases), search, inorder successor – lecture + DPP",
            "Wed": "AVL trees: balance factor, LL/RR/LR/RL rotations, height – lecture + PYQs",
            "Thu": "Heaps: min-heap, max-heap, heapify, heap sort, priority queue – lecture + problems",
            "Fri": "Graphs: adjacency matrix vs list, BFS (level order), DFS (recursive + stack) – lecture + PYQs",
            "Sat": "Topological sort, spanning trees + full DS PYQ set (last 10 years, timed) + 30 min Aptitude",
            "Sun": "Mock test 1: Engg Math + Digital Logic + full DS (90 min) + analysis"
          }
        }
      ],
      "phase_end_milestone": "100% Engg Math + Digital Logic + DS PYQs (last 10 years) attempted. Mock 1 score > 50%."
    },
    {
      "phase": 2,
      "title": "Algorithms + TOC + Compiler Design + OS + DBMS",
      "weeks": "6-11",
      "dates": "Nov 29 – Jan 9, 2027",
      "subjects": ["Algorithms", "Theory of Computation", "Compiler Design", "Operating Systems", "DBMS"],
      "note": "Core CS theory subjects. Each starts from scratch. High weightage group — do not rush. 6 weeks for 5 subjects.",
      "weekly_plan": [
        {
          "week": 6,
          "subject": "Algorithms",
          "topics": [
            "Asymptotic analysis: Big-O, Omega, Theta",
            "Recurrence relations: Master theorem, substitution",
            "Sorting: bubble, insertion, selection, merge, quick, heap, counting, radix",
            "Searching: binary search, interpolation search",
            "Divide and conquer",
            "Greedy algorithms",
            "Dynamic programming",
            "Graph algorithms: Dijkstra, Bellman-Ford, Floyd-Warshall, Prim, Kruskal",
            "Backtracking",
            "P, NP, NP-complete, NP-hard"
          ],
          "daily_targets": {
            "Mon": "Asymptotic analysis (Big-O, Omega, Theta) + recurrence (Master theorem, substitution) – lecture from scratch + PYQs",
            "Tue": "Sorting: merge sort, quick sort (analysis, best/worst/avg), heap sort + counting/radix – lecture + DPP",
            "Wed": "Binary search + Divide and conquer (merge sort recurrence, binary search analysis) – lecture + PYQs",
            "Thu": "Greedy: activity selection, fractional knapsack, Huffman coding, job scheduling – lecture + problems",
            "Fri": "DP: LCS, LIS, 0-1 knapsack, matrix chain multiplication, edit distance, coin change – lecture + PYQs",
            "Sat": "Graph algorithms (Dijkstra, Bellman-Ford, Floyd-Warshall, Prim, Kruskal, topological sort, SCC) + P/NP + full Algorithms PYQ set (timed) + 30 min Aptitude",
            "Sun": "Algorithms full revision + mock mini-test: Algorithms only + planning"
          }
        },
        {
          "week": 7,
          "subject": "Theory of Computation",
          "topics": [
            "DFA: design, state minimization",
            "NFA, epsilon-NFA, NFA-to-DFA conversion",
            "Regular expressions: construction, equivalence",
            "Pumping lemma for regular languages",
            "Context-free grammars: derivations, parse trees",
            "CNF, GNF conversions",
            "Pushdown automata (PDA)",
            "Pumping lemma for CFLs",
            "Turing machines",
            "Decidability, undecidability, Halting problem",
            "Rice's theorem"
          ],
          "daily_targets": {
            "Mon": "DFA: design, state minimization + NFA, epsilon-NFA, NFA-to-DFA conversion – lecture from scratch + PYQs",
            "Tue": "Regular expressions: construction, RE-to-DFA, equivalence + closure properties of regular languages – lecture + DPP",
            "Wed": "Pumping lemma (regular) + CFG: derivations, ambiguity, parse trees, leftmost/rightmost derivation – lecture + PYQs",
            "Thu": "CNF, GNF conversions + PDA (by final state and empty stack) + CFL pumping lemma + closure properties – lecture + problems",
            "Fri": "Turing machines: design, variants (multi-tape, non-deterministic) + decidability vs undecidability – lecture + PYQs",
            "Sat": "Halting problem, reduction, Rice's theorem, Post Correspondence Problem + full TOC PYQ set (last 10 years, timed) + 30 min Aptitude",
            "Sun": "Mock test 2: Engg Math + DL + DS + Algorithms + TOC (full 3-hr mock) + analysis"
          }
        },
        {
          "week": 8,
          "subject": "Compiler Design",
          "topics": [
            "Phases of compilation",
            "Lexical analysis: tokens, patterns, LEX",
            "First and Follow sets",
            "LL(1) parsing and table construction",
            "LR(0), SLR(1), CLR(1), LALR(1) parsing",
            "Syntax-directed translation",
            "Intermediate code: 3-address code, quadruples",
            "Code optimization: peephole, DAG",
            "Symbol table, error recovery"
          ],
          "daily_targets": {
            "Mon": "Phases of compiler + Lexical analysis: tokens, lexemes, patterns, LEX tool – lecture from scratch + PYQs",
            "Tue": "First set and Follow set computation (practice multiple grammars) – lecture + DPP",
            "Wed": "LL(1) parsing: conditions, table construction, parsing trace – lecture + PYQs",
            "Thu": "LR(0), SLR(1) parsing: items, closure, goto, table construction – lecture + problems",
            "Fri": "CLR(1), LALR(1) parsing: differences, table construction – lecture + PYQs",
            "Sat": "Syntax-directed translation + 3-address code + code optimization (peephole, DAG) + symbol table + full Compiler Design PYQ set (timed) + 30 min Aptitude",
            "Sun": "Compiler Design full revision + mock mini-test: TOC + Compiler Design + planning"
          }
        },
        {
          "week": 9,
          "subject": "Operating Systems – Process Management + Memory",
          "topics": [
            "Processes, threads, PCB, process states",
            "CPU scheduling: FCFS, SJF, SRTF, Round Robin, Priority",
            "Process synchronization: semaphores, mutex, monitors",
            "Critical section problem, Peterson's solution",
            "Deadlock: conditions, prevention, avoidance, detection, recovery",
            "Banker's algorithm",
            "Memory management: contiguous allocation, fragmentation",
            "Paging: page tables, TLB, multi-level paging",
            "Virtual memory, demand paging",
            "Page replacement: FIFO, LRU, Optimal, Belady's anomaly"
          ],
          "daily_targets": {
            "Mon": "Processes vs threads, PCB, process states + CPU scheduling: FCFS, SJF, SRTF, RR, Priority – Gantt chart PYQs – lecture from scratch + PYQs",
            "Tue": "Process synchronization: semaphores (counting + binary), mutex, monitors + critical section + Peterson's solution – lecture + DPP",
            "Wed": "Deadlock: 4 conditions, prevention, avoidance (Banker's algorithm), detection, recovery – lecture + PYQs",
            "Thu": "Memory management: contiguous allocation, internal/external fragmentation + paging: page tables, TLB, address translation – lecture + problems",
            "Fri": "Multi-level paging + virtual memory, demand paging, page fault handling – lecture + PYQs",
            "Sat": "Page replacement algorithms (FIFO, LRU, Optimal, Belady's anomaly) + OS Process + Memory PYQ set (timed) + 30 min Aptitude",
            "Sun": "Mock test 3: + Compiler Design + OS (partial) added to mock scope (full 3 hr) + analysis"
          }
        },
        {
          "week": 10,
          "subject": "Operating Systems – File Systems + I/O + DBMS",
          "topics": [
            "File systems: inode structure, directory, allocation methods (contiguous, linked, indexed)",
            "Disk scheduling: FCFS, SSTF, SCAN, C-SCAN, LOOK",
            "RAID levels (0,1,5)",
            "I/O subsystem, device drivers, interrupts",
            "ER model",
            "Relational model, relational algebra",
            "SQL",
            "Normalization: 1NF to BCNF",
            "Transactions: ACID, serializability, 2PL",
            "Indexing: B-tree, B+-tree, hashing"
          ],
          "daily_targets": {
            "Mon": "File systems: inode, directory structure, contiguous/linked/indexed allocation + disk scheduling (FCFS, SSTF, SCAN, C-SCAN) – lecture from scratch + PYQs",
            "Tue": "RAID levels + I/O subsystem + full OS PYQ set (last 10 years, timed) – all OS topics",
            "Wed": "ER model: entities, attributes, relationships, weak entities, ER-to-relational mapping + relational algebra: select, project, join, division – lecture from scratch + PYQs",
            "Thu": "SQL: DDL, DML, joins (inner/outer/cross/self), subqueries, aggregation, GROUP BY, HAVING – lecture + DPP",
            "Fri": "Normalization: functional dependencies, 1NF, 2NF, 3NF, BCNF, decomposition (lossy/lossless), dependency preservation – lecture + PYQs",
            "Sat": "Transactions (ACID, serializability, conflict serializability, 2PL) + Indexing (B-tree, B+-tree) + full DBMS PYQ set (timed) + 30 min Aptitude",
            "Sun": "Mock test 4: all subjects covered so far (full 3 hr) + analysis"
          }
        },
        {
          "week": 11,
          "subject": "Computer Networks",
          "topics": [
            "OSI model: 7 layers, functions",
            "TCP/IP model: 5 layers",
            "Physical layer basics",
            "Data link layer: framing, error detection (CRC, Hamming), error correction",
            "MAC protocols: ALOHA, CSMA/CD, CSMA/CA",
            "Network layer: IPv4 addressing, subnetting, CIDR, NAT",
            "Routing algorithms: distance vector (RIP), link state (OSPF), BGP",
            "Transport layer: TCP (3-way handshake, flow control, congestion control), UDP",
            "Application layer: DNS, HTTP, FTP, SMTP, DHCP, SNMP"
          ],
          "daily_targets": {
            "Mon": "OSI + TCP/IP models (every layer function, protocols at each layer) + Physical layer (Nyquist, Shannon) – lecture from scratch + PYQs",
            "Tue": "Data link layer: framing, error detection (CRC, Hamming code), error correction + ARQ protocols (Stop-and-Wait, Go-Back-N, Selective Repeat) – lecture + DPP",
            "Wed": "MAC protocols: Pure ALOHA, Slotted ALOHA, CSMA/CD, CSMA/CA + Ethernet + MAC addresses – lecture + PYQs",
            "Thu": "Network layer: IPv4 addressing, subnetting, CIDR, NAT + routing algorithms (RIP, OSPF, BGP) – lecture + problems",
            "Fri": "Transport layer: TCP (3-way handshake, 4-way teardown, sliding window, flow control, congestion control – slow start, AIMD) + UDP – lecture + PYQs",
            "Sat": "Application layer (DNS, HTTP/HTTPS, FTP, SMTP, DHCP) + full Computer Networks PYQ set (last 10 years, timed) + 30 min Aptitude",
            "Sun": "Mock test 5: full syllabus except CO&A + Aptitude (full 3 hr) + analysis"
          }
        }
      ],
      "phase_end_milestone": "Algorithms + TOC + Compiler + OS + DBMS + Networks PYQs done. Mock 5 score > 50%. Only CO&A remaining."
    },
    {
      "phase": 3,
      "title": "Computer Organization & Architecture + General Aptitude + Full Revision + Mocks",
      "weeks": "12-13",
      "dates": "Jan 10 – Jan 31, 2027",
      "subjects": ["Computer Organization & Architecture", "General Aptitude", "All subjects – revision + mock tests"],
      "note": "Final sprint. CO&A in week 12. Week 13 is pure revision + mocks. No new topics after Jan 20.",
      "weekly_plan": [
        {
          "week": 12,
          "subject": "Computer Organization & Architecture + General Aptitude Sprint",
          "topics": [
            "Number representation: 2's complement, BCD, IEEE 754 floating point",
            "ALU design, fast adders",
            "Instruction formats, addressing modes",
            "CPU: datapath, instruction cycle, hardwired vs microprogrammed control",
            "Pipelining: stages, structural/data/control hazards, forwarding, stalling",
            "Cache memory: direct mapped, set-associative, fully associative, replacement policies, write policies",
            "Main memory: DRAM, address calculation",
            "I/O organization: polling, interrupts, DMA",
            "Aptitude: verbal, numerical, analytical reasoning"
          ],
          "daily_targets": {
            "Mon": "Number representation (2's complement, BCD, IEEE 754) + ALU design + instruction formats + addressing modes – lecture from scratch + PYQs",
            "Tue": "CPU: datapath, instruction cycle, hardwired vs microprogrammed control unit – lecture + DPP",
            "Wed": "Pipelining: 5-stage pipeline, structural/data/control hazards, data forwarding, branch prediction, stalling – lecture + PYQs",
            "Thu": "Cache memory: direct mapped, set-associative, fully associative mapping + replacement policies (LRU, FIFO, Random) + write policies (write-through, write-back) – lecture + problems",
            "Fri": "Main memory organization, DRAM, address calculation + I/O: polling, interrupt-driven, DMA – lecture + PYQs",
            "Sat": "Full CO&A PYQ set (last 10 years, timed) + Aptitude: verbal ability + numerical ability + analytical reasoning PYQ blitz (last 5 years) + 30 min Aptitude",
            "Sun": "Mock test 6: FULL SYLLABUS including CO&A + Aptitude (full 3 hr, exam conditions) + analysis"
          }
        },
        {
          "week": 13,
          "subject": "Full Revision + Intensive Mocks + Exam",
          "topics": ["Targeted weak area revision, formula sheets, full mocks, exam"],
          "daily_targets": {
            "Mon": "Weakest 2 subjects from Mock 6 – deep drill (3 hrs each: re-study from basics + PYQs)",
            "Tue": "Mock test 7 (full syllabus + Aptitude, 3 hr, exact exam conditions – morning slot)",
            "Wed": "Mock 7 analysis + all wrong answers re-attempt + error log",
            "Thu": "Mock test 8 (full syllabus + Aptitude, 3 hr, exact exam conditions)",
            "Fri": "Mock 8 analysis + formula sheet revision: Engg Math + DL + DS + Algorithms + TOC + Compiler",
            "Sat": "Formula sheet revision: OS + DBMS + Networks + CO&A + Aptitude + 30 min Aptitude PYQ blitz",
            "Sun": "GATE CS/IT 2027 EXAM"
          }
        }
      ],
      "phase_end_milestone": "8+ full mocks done. All 11 subjects covered from scratch. Formula sheets ready."
    }
  ],
  "mock_schedule": [
    { "mock": 1, "week": 5, "date_approx": "Nov 28", "scope": "Engg Math + Digital Logic + DS", "duration_min": 90 },
    { "mock": 2, "week": 7, "date_approx": "Dec 12", "scope": "Engg Math + DL + DS + Algorithms + TOC", "duration_min": 180 },
    { "mock": 3, "week": 9, "date_approx": "Dec 26", "scope": "+ Compiler Design + OS (Process + Memory)", "duration_min": 180 },
    { "mock": 4, "week": 10, "date_approx": "Jan 2", "scope": "All covered so far (up to DBMS)", "duration_min": 180 },
    { "mock": 5, "week": 11, "date_approx": "Jan 9", "scope": "Full syllabus except CO&A + Aptitude", "duration_min": 180 },
    { "mock": 6, "week": 12, "date_approx": "Jan 16", "scope": "Full syllabus + CO&A + Aptitude", "duration_min": 180 },
    { "mock": 7, "week": 13, "date_approx": "Jan 20", "scope": "Full syllabus + Aptitude – exam conditions", "duration_min": 180 },
    { "mock": 8, "week": 13, "date_approx": "Jan 23", "scope": "Full syllabus + Aptitude – exam conditions", "duration_min": 180 }
  ],
  "weekly_targets_summary": [
    { "week": 1, "focus": "Engg Math – Linear Algebra + Calculus", "pyq_goal": "LA + Calculus PYQs (last 10 years)" },
    { "week": 2, "focus": "Engg Math – Probability + Discrete Math", "pyq_goal": "Full Engg Math PYQ set timed" },
    { "week": 3, "focus": "Digital Logic (complete)", "pyq_goal": "Full Digital Logic PYQ set (last 10 years)" },
    { "week": 4, "focus": "DS – C + Linear DS + Hashing", "pyq_goal": "C + Linear DS PYQs" },
    { "week": 5, "focus": "DS – Trees + Graphs", "pyq_goal": "Full DS PYQ set + Mock 1 (Engg Math + DL + DS)" },
    { "week": 6, "focus": "Algorithms (complete)", "pyq_goal": "Full Algorithms PYQ set (last 10 years)" },
    { "week": 7, "focus": "Theory of Computation (complete)", "pyq_goal": "Full TOC PYQ set + Mock 2" },
    { "week": 8, "focus": "Compiler Design (complete)", "pyq_goal": "Full Compiler Design PYQ set" },
    { "week": 9, "focus": "OS – Process + Memory Management", "pyq_goal": "OS Process + Memory PYQs + Mock 3" },
    { "week": 10, "focus": "OS – File/I/O + DBMS (complete)", "pyq_goal": "Full OS + DBMS PYQ set + Mock 4" },
    { "week": 11, "focus": "Computer Networks (complete)", "pyq_goal": "Full Networks PYQ set + Mock 5 full syllabus" },
    { "week": 12, "focus": "CO&A (complete) + Aptitude Sprint", "pyq_goal": "Full CO&A PYQ set + Mock 6 full syllabus" },
    { "week": 13, "focus": "Weak area revision + Mocks 7 + 8 + Exam", "pyq_goal": "8 full mocks done + formula sheets" }
  ]
}

''');

  static final Map<String, dynamic> cs6MonthRoadmap = jsonDecode(r'''
{
  "meta": {
    "exam": "GATE CS/IT 2027",
    "exam_date": "February 2027",
    "roadmap_type": "6-month",
    "start_date": "2026-08-01",
    "end_date": "2027-01-31",
    "total_weeks": 26,
    "target": "70+ marks, sub-200 AIR",
    "total_marks": 100,
    "aptitude_marks": 15,
    "core_marks": 85
  },
  "daily_routine": {
    "weekday": [
      { "time": "04:00-06:00", "block": "Deep study – new concepts (lecture + notes)" },
      { "time": "06:00-07:00", "block": "PYQ practice – topic just covered" },
      { "time": "20:00-21:30", "block": "DPP / GateOverflow problems on today's topic" },
      { "time": "21:30-22:00", "block": "Error log update + next-day planning" }
    ],
    "weekend": [
      { "time": "04:00-07:00", "block": "Revision – previous week topics (heavy session)" },
      { "time": "07:30-09:30", "block": "Full topic-wise PYQ set (all years, timed)" },
      { "time": "10:00-12:00", "block": "Mock test or timed mixed problem set" },
      { "time": "20:00-22:00", "block": "Mock analysis + error log review" }
    ],
    "rules": [
      "No passive lecture watching – pause and solve before moving on",
      "Error log: note question, mistake type, correct concept after every session",
      "PYQs immediately after each topic, not at the end of the phase",
      "Sunday evening: plan the full coming week",
      "GateOverflow is the primary PYQ + discussion source for GATE CS"
    ]
  },
  "subject_weightage": [
    { "subject": "General Aptitude", "marks": 15, "priority": "High – always 15 marks" },
    { "subject": "Engineering Mathematics", "marks": "11-15", "priority": "High" },
    { "subject": "Algorithms", "marks": "8-12", "priority": "High" },
    { "subject": "Operating Systems", "marks": "8-12", "priority": "High" },
    { "subject": "Computer Networks", "marks": "8-12", "priority": "High" },
    { "subject": "DBMS", "marks": "6-10", "priority": "High" },
    { "subject": "Programming & Data Structures", "marks": "6-10", "priority": "High" },
    { "subject": "Theory of Computation", "marks": "6-10", "priority": "High" },
    { "subject": "Computer Organization & Architecture", "marks": "6-10", "priority": "High" },
    { "subject": "Compiler Design", "marks": "4-8", "priority": "Medium" },
    { "subject": "Digital Logic", "marks": "4-6", "priority": "Medium" }
  ],
  "phases": [
    {
      "phase": 1,
      "title": "Engineering Mathematics + Digital Logic",
      "weeks": "1-5",
      "dates": "Aug 1 – Aug 28, 2026",
      "subjects": ["Engineering Mathematics", "Digital Logic"],
      "weekly_plan": [
        {
          "week": 1,
          "subject": "Engineering Mathematics – Linear Algebra + Calculus",
          "topics": ["Matrices, rank, determinants", "Eigenvalues, eigenvectors", "Limits, continuity, partial derivatives", "Maxima/minima, integration"],
          "daily_targets": {
            "Mon": "Matrices: rank, row reduction, determinants – lecture + 10 PYQs",
            "Tue": "Eigenvalues, eigenvectors, diagonalization – lecture + DPP",
            "Wed": "System of linear equations (Ax=b) – lecture + PYQs",
            "Thu": "Limits, continuity, partial derivatives – lecture + problems",
            "Fri": "Maxima/minima (single + multi variable) – lecture + PYQs",
            "Sat": "LA + Calculus full PYQ set (timed, 45 min)",
            "Sun": "Weak area drill + next week planning"
          }
        },
        {
          "week": 2,
          "subject": "Engineering Mathematics – Probability + Combinatorics",
          "topics": ["Probability axioms, conditional probability, Bayes", "Discrete distributions", "Permutations, combinations, pigeonhole"],
          "daily_targets": {
            "Mon": "Probability axioms, conditional probability – lecture + 10 PYQs",
            "Tue": "Bayes theorem, total probability – lecture + DPP",
            "Wed": "Random variables, expectation, variance – lecture + PYQs",
            "Thu": "Binomial, Poisson, Uniform distributions – lecture + problems",
            "Fri": "Counting, permutations, combinations, pigeonhole – lecture + PYQs",
            "Sat": "Probability + Combinatorics PYQ set (timed)",
            "Sun": "Mock mini-test: full Engg Math"
          }
        },
        {
          "week": 3,
          "subject": "Engineering Mathematics – Discrete Math",
          "topics": ["Set theory, relations, functions", "Graph theory basics", "Propositional + predicate logic", "Recurrence relations"],
          "daily_targets": {
            "Mon": "Set theory, relations, functions, partial orders – lecture + PYQs",
            "Tue": "Propositional logic, predicates, quantifiers – lecture + DPP",
            "Wed": "Graph theory: types, connectivity, trees, coloring – lecture + PYQs",
            "Thu": "Recurrence relations, generating functions – lecture + problems",
            "Fri": "Revision + error log: all Engg Math",
            "Sat": "Full Engg Math PYQ set (last 10 years, timed)",
            "Sun": "Mock mini-test: Engg Math complete"
          }
        },
        {
          "week": 4,
          "subject": "Digital Logic",
          "topics": ["Boolean algebra, K-map minimization", "Combinational circuits", "Number systems"],
          "daily_targets": {
            "Mon": "Boolean algebra, theorems, De Morgan – lecture + PYQs",
            "Tue": "K-map (2/3/4/5 variable), SOP, POS minimization – lecture + DPP",
            "Wed": "Number systems: binary, octal, hex, conversions – lecture + PYQs",
            "Thu": "Combinational circuits: MUX, DEMUX, encoder, decoder, adder – lecture + problems",
            "Fri": "Revision + error log",
            "Sat": "Digital Logic combinational PYQ set (timed)",
            "Sun": "Engg Math revision sprint + planning"
          }
        },
        {
          "week": 5,
          "subject": "Digital Logic",
          "topics": ["Sequential circuits: flip-flops, counters, registers", "Hazards", "PLDs"],
          "daily_targets": {
            "Mon": "Flip-flops (SR, JK, D, T), state tables – lecture + PYQs",
            "Tue": "Counters (synchronous, asynchronous) – lecture + DPP",
            "Wed": "Shift registers, sequence detectors – lecture + PYQs",
            "Thu": "Hazards, race conditions, PLDs – lecture + problems",
            "Fri": "Revision + error log: Digital Logic full",
            "Sat": "Full Digital Logic PYQ set (last 10 years, timed)",
            "Sun": "Mock mini-test: Engg Math + Digital Logic"
          }
        }
      ],
      "phase_end_milestone": "100% Engg Math + Digital Logic PYQs (last 10 years) solved independently"
    },
    {
      "phase": 2,
      "title": "Programming & Data Structures + Algorithms",
      "weeks": "6-11",
      "dates": "Aug 29 – Oct 3, 2026",
      "subjects": ["Programming & Data Structures", "Algorithms"],
      "weekly_plan": [
        {
          "week": 6,
          "subject": "Programming & Data Structures – C Fundamentals",
          "topics": ["C: pointers, arrays, structs", "Recursion", "Parameter passing"],
          "daily_targets": {
            "Mon": "C: pointers, pointer arithmetic, arrays – lecture + PYQs",
            "Tue": "C: structs, unions, dynamic memory (malloc/free) – lecture + DPP",
            "Wed": "C: functions, recursion (tree recursion, backtracking) – lecture + PYQs",
            "Thu": "Parameter passing (call by value vs reference), scope – lecture + problems",
            "Fri": "Revision + error log",
            "Sat": "C programming PYQ set (timed)",
            "Sun": "Phase 1 revision sprint + planning"
          }
        },
        {
          "week": 7,
          "subject": "Programming & Data Structures – Linear DS",
          "topics": ["Arrays, stacks, queues", "Linked lists", "Hashing"],
          "daily_targets": {
            "Mon": "Arrays: searching, sorting overview – lecture + PYQs",
            "Tue": "Stacks, queues, deque, circular queue – lecture + DPP",
            "Wed": "Linked lists (singly, doubly, circular) – lecture + PYQs",
            "Thu": "Hashing: hash functions, collision resolution (chaining, open addressing) – problems",
            "Fri": "Revision + error log",
            "Sat": "Linear DS PYQ set (timed)",
            "Sun": "Mock mini-test: C + linear DS"
          }
        },
        {
          "week": 8,
          "subject": "Programming & Data Structures – Trees + Graphs",
          "topics": ["Binary trees, BST, AVL", "Heaps", "Graph representations"],
          "daily_targets": {
            "Mon": "Binary trees: traversals (inorder/preorder/postorder), height – lecture + PYQs",
            "Tue": "BST: insert, delete, search – lecture + DPP",
            "Wed": "AVL trees: rotations, balance factor – lecture + PYQs",
            "Thu": "Heaps, heap sort, priority queues – lecture + problems",
            "Fri": "Graph representations (adjacency matrix/list), BFS, DFS – lecture + PYQs",
            "Sat": "Trees + Graphs PYQ set (timed)",
            "Sun": "Mock mini-test: full DS"
          }
        },
        {
          "week": 9,
          "subject": "Algorithms – Sorting + Searching",
          "topics": ["Sorting algorithms and complexity", "Divide and conquer", "Searching"],
          "daily_targets": {
            "Mon": "Bubble, insertion, selection, merge, quick sort – complexity analysis + PYQs",
            "Tue": "Heap sort, counting sort, radix sort – lecture + DPP",
            "Wed": "Divide and conquer: merge sort, quick sort (analysis), binary search – PYQs",
            "Thu": "Master theorem – lecture + problems",
            "Fri": "Revision + error log",
            "Sat": "Sorting + Searching PYQ set (timed)",
            "Sun": "DS revision sprint + planning"
          }
        },
        {
          "week": 10,
          "subject": "Algorithms – Graph + Greedy + DP",
          "topics": ["Graph algorithms: shortest path, MST, topological sort", "Greedy algorithms", "Dynamic programming"],
          "daily_targets": {
            "Mon": "Dijkstra, Bellman-Ford, Floyd-Warshall – lecture + PYQs",
            "Tue": "MST: Prim, Kruskal – lecture + DPP",
            "Wed": "Topological sort, SCC (Kosaraju) – lecture + PYQs",
            "Thu": "Greedy: activity selection, fractional knapsack, Huffman coding – problems",
            "Fri": "Revision + error log",
            "Sat": "Graph algorithms PYQ set (timed)",
            "Sun": "Mock mini-test: graph + greedy"
          }
        },
        {
          "week": 11,
          "subject": "Algorithms – DP + Advanced + Complexity",
          "topics": ["Dynamic programming", "Backtracking", "P, NP, NP-complete"],
          "daily_targets": {
            "Mon": "DP: LCS, LIS, matrix chain multiplication, 0/1 knapsack – lecture + PYQs",
            "Tue": "DP: edit distance, coin change, subset sum – lecture + DPP",
            "Wed": "Backtracking: n-queens, graph coloring – lecture + PYQs",
            "Thu": "P, NP, NP-complete, NP-hard – definitions, examples + PYQs",
            "Fri": "Revision + error log: full Algorithms",
            "Sat": "Full Algorithms PYQ set (last 10 years, timed)",
            "Sun": "Mock test: DS + Algorithms (full, 90 min)"
          }
        }
      ],
      "phase_end_milestone": "DS + Algorithms PYQs >85% accuracy; all complexity proofs understood"
    },
    {
      "phase": 3,
      "title": "Theory of Computation + Compiler Design",
      "weeks": "12-16",
      "dates": "Oct 4 – Nov 7, 2026",
      "subjects": ["Theory of Computation", "Compiler Design"],
      "weekly_plan": [
        {
          "week": 12,
          "subject": "Theory of Computation – Regular Languages",
          "topics": ["DFA, NFA, epsilon-NFA", "Regular expressions", "Regular grammars", "Pumping lemma"],
          "daily_targets": {
            "Mon": "DFA: design, state minimization – lecture + PYQs",
            "Tue": "NFA, epsilon-NFA, NFA-to-DFA conversion – lecture + DPP",
            "Wed": "Regular expressions: construction, equivalence – lecture + PYQs",
            "Thu": "Regular grammars, closure properties of regular languages – problems",
            "Fri": "Pumping lemma for regular languages – lecture + PYQs",
            "Sat": "Regular languages PYQ set (timed)",
            "Sun": "DS + Algo revision sprint + planning"
          }
        },
        {
          "week": 13,
          "subject": "Theory of Computation – CFLs + Pushdown Automata",
          "topics": ["Context-free grammars", "Pushdown automata", "CFL pumping lemma", "CNF, GNF"],
          "daily_targets": {
            "Mon": "Context-free grammars: derivations, parse trees – lecture + PYQs",
            "Tue": "Pushdown automata (by final state / empty stack) – lecture + DPP",
            "Wed": "CNF, GNF conversions – lecture + PYQs",
            "Thu": "CFL pumping lemma + closure properties of CFLs – problems",
            "Fri": "Revision + error log",
            "Sat": "CFLs + PDA PYQ set (timed)",
            "Sun": "Mock mini-test: Regular + CFLs"
          }
        },
        {
          "week": 14,
          "subject": "Theory of Computation – Turing Machines + Decidability",
          "topics": ["Turing machines", "Decidability, undecidability", "Halting problem", "Rice's theorem"],
          "daily_targets": {
            "Mon": "Turing machines: design, variants (multi-tape, non-deterministic) – lecture + PYQs",
            "Tue": "Decidable vs undecidable problems – lecture + DPP",
            "Wed": "Halting problem, reduction technique – lecture + PYQs",
            "Thu": "Rice's theorem, Post correspondence problem – problems",
            "Fri": "Revision + error log: full TOC",
            "Sat": "Full TOC PYQ set (last 10 years, timed)",
            "Sun": "Mock test: full TOC (60 min)"
          }
        },
        {
          "week": 15,
          "subject": "Compiler Design – Lexical + Syntax Analysis",
          "topics": ["Lexical analysis, LEX", "Parsing: LL(1), LR(0), SLR, CLR, LALR", "First, Follow sets"],
          "daily_targets": {
            "Mon": "Lexical analysis: tokens, patterns, LEX tool – lecture + PYQs",
            "Tue": "First and Follow set computation – lecture + DPP",
            "Wed": "LL(1) parsing, LL(1) table construction – lecture + PYQs",
            "Thu": "LR(0), SLR(1) parsing – lecture + problems",
            "Fri": "CLR(1), LALR(1) parsing – lecture + PYQs",
            "Sat": "Parsing PYQ set (timed)",
            "Sun": "TOC revision sprint + planning"
          }
        },
        {
          "week": 16,
          "subject": "Compiler Design – Semantic + Code Generation",
          "topics": ["Syntax-directed translation", "Intermediate code generation", "Code optimization", "Symbol table, error recovery"],
          "daily_targets": {
            "Mon": "Syntax-directed translation, attribute grammars – lecture + PYQs",
            "Tue": "Intermediate code: 3-address code, quadruples – lecture + DPP",
            "Wed": "Code optimization techniques (DAG, peephole) – lecture + PYQs",
            "Thu": "Symbol table, error recovery, register allocation – problems",
            "Fri": "Revision + error log: full Compiler Design",
            "Sat": "Full Compiler Design PYQ set (last 10 years, timed)",
            "Sun": "Mock test: TOC + Compiler Design (90 min)"
          }
        }
      ],
      "phase_end_milestone": "TOC + Compiler Design PYQs >80% accuracy; all automata proofs clear"
    },
    {
      "phase": 4,
      "title": "Operating Systems + DBMS",
      "weeks": "17-21",
      "dates": "Nov 8 – Dec 12, 2026",
      "subjects": ["Operating Systems", "DBMS"],
      "weekly_plan": [
        {
          "week": 17,
          "subject": "Operating Systems – Process Management",
          "topics": ["Processes, threads", "CPU scheduling algorithms", "Process synchronization", "Deadlocks"],
          "daily_targets": {
            "Mon": "Process vs thread, PCB, process states – lecture + PYQs",
            "Tue": "CPU scheduling: FCFS, SJF, SRTF, RR, priority – Gantt chart PYQs",
            "Wed": "Process synchronization: semaphores, mutex, monitors – lecture + DPP",
            "Thu": "Critical section problem, Peterson's solution – lecture + PYQs",
            "Fri": "Deadlock: conditions, detection, avoidance (Banker's algorithm) – lecture + problems",
            "Sat": "Process management PYQ set (timed)",
            "Sun": "TOC + Compiler revision sprint + planning"
          }
        },
        {
          "week": 18,
          "subject": "Operating Systems – Memory + File Systems",
          "topics": ["Memory management: paging, segmentation", "Virtual memory, page replacement", "File systems"],
          "daily_targets": {
            "Mon": "Memory management: contiguous allocation, fragmentation – lecture + PYQs",
            "Tue": "Paging: page tables, TLB, multi-level paging – lecture + DPP",
            "Wed": "Virtual memory, demand paging – lecture + PYQs",
            "Thu": "Page replacement: FIFO, LRU, Optimal – Belady's anomaly – problems",
            "Fri": "File systems: inode, directory structure, allocation methods – PYQs",
            "Sat": "Memory + File systems PYQ set (timed)",
            "Sun": "Mock test: full OS (90 min)"
          }
        },
        {
          "week": 19,
          "subject": "Operating Systems – I/O + Disk",
          "topics": ["I/O management", "Disk scheduling", "OS full revision"],
          "daily_targets": {
            "Mon": "I/O subsystem, device drivers, interrupts – lecture + PYQs",
            "Tue": "Disk scheduling: FCFS, SSTF, SCAN, C-SCAN – lecture + DPP",
            "Wed": "RAID levels – lecture + PYQs",
            "Thu": "OS full revision – GateOverflow problem set (all years)",
            "Fri": "Error log review: full OS",
            "Sat": "Full OS PYQ set (last 10 years, timed)",
            "Sun": "Mock mini-test: OS"
          }
        },
        {
          "week": 20,
          "subject": "DBMS – ER, Relational Model, SQL",
          "topics": ["ER model", "Relational model, relational algebra", "SQL", "Normalization"],
          "daily_targets": {
            "Mon": "ER model: entities, attributes, relationships, ER-to-relational – lecture + PYQs",
            "Tue": "Relational algebra: select, project, join, division – lecture + DPP",
            "Wed": "SQL: joins, subqueries, aggregation, nested queries – lecture + PYQs",
            "Thu": "Normalization: 1NF, 2NF, 3NF, BCNF, decomposition – problems",
            "Fri": "Revision + error log",
            "Sat": "DBMS week-20 PYQ set (timed)",
            "Sun": "OS revision sprint + planning"
          }
        },
        {
          "week": 21,
          "subject": "DBMS – Transactions, Indexing, Advanced",
          "topics": ["Transactions, concurrency control", "Indexing: B/B+ trees", "DBMS full revision"],
          "daily_targets": {
            "Mon": "Transactions: ACID, serializability, conflict serializability – lecture + PYQs",
            "Tue": "Concurrency control: 2PL, timestamp, optimistic – lecture + DPP",
            "Wed": "Indexing: B-tree, B+-tree, hashing – lecture + PYQs",
            "Thu": "Query processing, query optimization basics – problems",
            "Fri": "Error log review: full DBMS",
            "Sat": "Full DBMS PYQ set (last 10 years, timed)",
            "Sun": "Mock test: OS + DBMS (90 min)"
          }
        }
      ],
      "phase_end_milestone": "OS + DBMS PYQs >85% accuracy; Banker's algorithm and 2PL fully solved"
    },
    {
      "phase": 5,
      "title": "Computer Networks + Computer Organization & Architecture",
      "weeks": "22-24",
      "dates": "Dec 13 – Dec 26, 2026",
      "subjects": ["Computer Networks", "Computer Organization & Architecture"],
      "weekly_plan": [
        {
          "week": 22,
          "subject": "Computer Networks",
          "topics": ["OSI + TCP/IP layers", "Data link layer: framing, ARQ protocols, MAC", "Network layer: IP, routing"],
          "daily_targets": {
            "Mon": "OSI model, TCP/IP model – functions of each layer + PYQs",
            "Tue": "Data link: framing, error detection/correction (Hamming, CRC) – lecture + DPP",
            "Wed": "MAC protocols: ALOHA, CSMA/CD, CSMA/CA – lecture + PYQs",
            "Thu": "Network layer: IP addressing, subnetting, CIDR – lecture + problems",
            "Fri": "Routing: distance vector (RIP), link state (OSPF), BGP – lecture + PYQs",
            "Sat": "Network layer + Data link PYQ set (timed)",
            "Sun": "Phase 4 revision sprint + planning"
          }
        },
        {
          "week": 23,
          "subject": "Computer Networks – Transport + Application",
          "topics": ["Transport layer: TCP, UDP, congestion control", "Application layer: DNS, HTTP, FTP, SMTP"],
          "daily_targets": {
            "Mon": "Transport layer: TCP (3-way handshake, sliding window, flow control) – lecture + PYQs",
            "Tue": "Congestion control: slow start, AIMD, RED – lecture + DPP",
            "Wed": "UDP, comparison with TCP – lecture + PYQs",
            "Thu": "Application layer: DNS, HTTP, FTP, SMTP, DHCP – lecture + problems",
            "Fri": "Revision + error log: full Networks",
            "Sat": "Full Computer Networks PYQ set (last 10 years, timed)",
            "Sun": "Mock test: full Networks (60 min)"
          }
        },
        {
          "week": 24,
          "subject": "Computer Organization & Architecture",
          "topics": ["Number representation, ALU", "CPU: datapath, control unit, pipelining", "Memory hierarchy: cache, virtual memory", "I/O systems"],
          "daily_targets": {
            "Mon": "Number representation: 2's complement, IEEE 754 floating point – lecture + PYQs",
            "Tue": "ALU design, adders, multiplication algorithms – lecture + DPP",
            "Wed": "CPU: instruction cycle, datapath, hardwired vs microprogrammed – lecture + PYQs",
            "Thu": "Pipelining: hazards (structural, data, control), forwarding – lecture + problems",
            "Fri": "Cache memory: mapping (direct/set-associative/fully), replacement policies, write policies – PYQs",
            "Sat": "Full CO&A PYQ set (last 10 years, timed)",
            "Sun": "Mock test: Networks + CO&A (90 min)"
          }
        }
      ],
      "phase_end_milestone": "Networks + CO&A PYQs >80% accuracy; subnetting and pipelining fully solved"
    },
    {
      "phase": 6,
      "title": "General Aptitude + Full Revision + Mocks",
      "weeks": "25-26",
      "dates": "Dec 27, 2026 – Jan 31, 2027",
      "subjects": ["General Aptitude", "All subjects – revision + mock tests"],
      "weekly_plan": [
        {
          "week": 25,
          "subject": "General Aptitude + Revision Sprint 1",
          "topics": ["Verbal ability, analytical reasoning, numerical ability", "Engg Math + Digital Logic + DS + Algo revision"],
          "daily_targets": {
            "Mon": "Aptitude: verbal ability (RC, grammar, vocab) – lecture + PYQs",
            "Tue": "Aptitude: numerical ability (percentages, ratio, time-work) – PYQs",
            "Wed": "Aptitude: analytical reasoning + data interpretation – PYQs",
            "Thu": "Engg Math + Digital Logic – formula sheet + GateOverflow blitz (40 questions)",
            "Fri": "DS + Algorithms – formula sheet + GateOverflow blitz (40 questions)",
            "Sat": "Mock test 1 (full syllabus, 3 hr, timed)",
            "Sun": "Mock 1 analysis + error log update"
          }
        },
        {
          "week": 26,
          "subject": "Revision Sprint 2 + Mocks",
          "topics": ["TOC + Compiler + OS + DBMS + Networks + CO&A revision"],
          "daily_targets": {
            "Mon": "TOC + Compiler Design – formula sheet + GateOverflow blitz",
            "Tue": "OS + DBMS – formula sheet + GateOverflow blitz",
            "Wed": "Networks + CO&A – formula sheet + GateOverflow blitz",
            "Thu": "Mock test 2 (full syllabus, 3 hr)",
            "Fri": "Mock 2 analysis + error log",
            "Sat": "Mock test 3 (full syllabus, 3 hr)",
            "Sun": "Mock 3 analysis + planning for final 5 weeks"
          }
        },
        {
          "week": "27-30",
          "subject": "Intensive Mock + Targeted Revision",
          "topics": ["2 mocks per week, weak area drilling, formula sheets"],
          "daily_targets": {
            "Mon": "Weakest subject from last mock – deep drill (3 hrs + PYQs)",
            "Tue": "2nd weakest subject – deep drill",
            "Wed": "Mock test (full syllabus, 3 hr)",
            "Thu": "Mock analysis + hardest wrong questions re-attempt",
            "Fri": "Mock test (full syllabus, 3 hr)",
            "Sat": "Mock analysis + error log",
            "Sun": "Light revision + rest + next week planning"
          }
        },
        {
          "week": "Final Week",
          "subject": "Final Week",
          "topics": ["Formula sheets, light revision, exam prep"],
          "daily_targets": {
            "Mon": "Formula sheet – Engg Math + Digital Logic + DS + Algo",
            "Tue": "Formula sheet – TOC + Compiler Design + OS",
            "Wed": "Formula sheet – DBMS + Networks + CO&A + Aptitude",
            "Thu": "Half mock (1.5 hr) – confidence check only",
            "Fri": "Zero new problems. Light formula sheet read. Sleep 10 PM.",
            "Sat": "Rest. Exam logistics. Sleep by 9 PM.",
            "Sun": "GATE CS/IT 2027 EXAM"
          }
        }
      ],
      "phase_end_milestone": "10+ full mocks done. Average score 70+. All subjects revised 3+ times."
    }
  ],
  "weekly_targets_summary": [
    { "weeks": "1-3", "focus": "Engineering Mathematics", "pyq_goal": "100% Engg Math PYQs (last 10 years)" },
    { "weeks": "4-5", "focus": "Digital Logic", "pyq_goal": "100% Digital Logic PYQs (last 10 years)" },
    { "weeks": "6-8", "focus": "Programming & Data Structures", "pyq_goal": "100% DS PYQs" },
    { "weeks": "9-11", "focus": "Algorithms", "pyq_goal": "100% Algorithms PYQs" },
    { "weeks": "12-14", "focus": "Theory of Computation", "pyq_goal": "100% TOC PYQs" },
    { "weeks": "15-16", "focus": "Compiler Design", "pyq_goal": "100% Compiler Design PYQs" },
    { "weeks": "17-19", "focus": "Operating Systems", "pyq_goal": "100% OS PYQs" },
    { "weeks": "20-21", "focus": "DBMS", "pyq_goal": "100% DBMS PYQs" },
    { "weeks": "22-23", "focus": "Computer Networks", "pyq_goal": "100% Networks PYQs" },
    { "weeks": "24", "focus": "CO&A", "pyq_goal": "100% CO&A PYQs" },
    { "weeks": "25-26+", "focus": "Aptitude + Revision + Mocks", "pyq_goal": "10+ full mocks, 70+ avg score" }
  ]
}

''');
}
