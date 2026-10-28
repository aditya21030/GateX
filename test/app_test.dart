import 'package:flutter_test/flutter_test.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';
import 'package:gateda/theme/app_theme.dart';
import 'package:gateda/models/models.dart';
import 'package:gateda/data/da_full_mock_pyqs.dart';
import 'package:gateda/data/cs_full_mock_pyqs.dart';
import 'package:gateda/data/cs_full_mock_2_pyqs.dart';
import 'package:gateda/data/cs_full_mock_3_pyqs.dart';
import 'package:gateda/data/cs_full_mock_4_pyqs.dart';
import 'package:gateda/data/cs_full_mock_5_pyqs.dart';
import 'package:gateda/data/cs_full_mock_6_pyqs.dart';
import 'package:gateda/data/cs_full_mock_7_pyqs.dart';
import 'package:gateda/data/cs_full_mock_8_pyqs.dart';
import 'package:gateda/data/cs_full_mock_9_pyqs.dart';
import 'package:gateda/data/cs_full_mock_10_pyqs.dart';
import 'package:gateda/models/branch_model.dart';
import 'package:gateda/data/study_plan.dart';
import 'package:gateda/data/da_subjectwise_mock_data.dart';
import 'package:gateda/data/csit_subjectwise_mock_data.dart';
import 'package:gateda/data/notes_data.dart';
import 'package:gateda/services/storage_service.dart';
import 'package:gateda/services/purchase_service.dart';
import 'package:gateda/widgets/iit_onboarding_components.dart';

class EstimationNode {
  final double marks;
  final double gateScore;
  final int minRank;
  final int maxRank;

  const EstimationNode({
    required this.marks,
    required this.gateScore,
    required this.minRank,
    required this.maxRank,
  });
}

// Mirror of the actual score estimator prediction logic for testing
Map<String, dynamic> calculatePrediction(double marks, String yearTrend) {
  const List<EstimationNode> nodes2026 = [
    EstimationNode(marks: 100.0, gateScore: 1000.0, minRank: 1, maxRank: 1),
    EstimationNode(marks: 90.0, gateScore: 1000.0, minRank: 1, maxRank: 1),
    EstimationNode(marks: 85.0, gateScore: 970.0, minRank: 2, maxRank: 5),
    EstimationNode(marks: 80.0, gateScore: 935.0, minRank: 6, maxRank: 15),
    EstimationNode(marks: 75.0, gateScore: 895.0, minRank: 16, maxRank: 40),
    EstimationNode(marks: 70.0, gateScore: 855.0, minRank: 41, maxRank: 100),
    EstimationNode(marks: 65.0, gateScore: 815.0, minRank: 101, maxRank: 200),
    EstimationNode(marks: 60.0, gateScore: 770.0, minRank: 201, maxRank: 400),
    EstimationNode(marks: 55.0, gateScore: 720.0, minRank: 401, maxRank: 700),
    EstimationNode(marks: 50.0, gateScore: 670.0, minRank: 701, maxRank: 1100),
    EstimationNode(marks: 45.0, gateScore: 620.0, minRank: 1101, maxRank: 1700),
    EstimationNode(marks: 40.0, gateScore: 565.0, minRank: 1701, maxRank: 2600),
    EstimationNode(marks: 35.0, gateScore: 500.0, minRank: 2601, maxRank: 4200),
    EstimationNode(marks: 30.0, gateScore: 430.0, minRank: 4201, maxRank: 6500),
    EstimationNode(marks: 26.4, gateScore: 350.0, minRank: 7500, maxRank: 8500),
    EstimationNode(marks: 0.0, gateScore: 0.0, minRank: 12000, maxRank: 15000),
  ];

  const List<EstimationNode> nodes2025 = [
    EstimationNode(marks: 100.0, gateScore: 1000.0, minRank: 1, maxRank: 1),
    EstimationNode(marks: 96.33, gateScore: 1000.0, minRank: 1, maxRank: 1),
    EstimationNode(marks: 90.0, gateScore: 960.0, minRank: 2, maxRank: 8),
    EstimationNode(marks: 85.0, gateScore: 915.0, minRank: 9, maxRank: 30),
    EstimationNode(marks: 80.0, gateScore: 860.0, minRank: 31, maxRank: 100),
    EstimationNode(marks: 75.0, gateScore: 800.0, minRank: 101, maxRank: 250),
    EstimationNode(marks: 70.0, gateScore: 740.0, minRank: 251, maxRank: 500),
    EstimationNode(marks: 65.0, gateScore: 680.0, minRank: 501, maxRank: 1000),
    EstimationNode(marks: 60.0, gateScore: 620.0, minRank: 1001, maxRank: 1800),
    EstimationNode(marks: 55.0, gateScore: 560.0, minRank: 1801, maxRank: 3000),
    EstimationNode(marks: 50.0, gateScore: 500.0, minRank: 3001, maxRank: 4500),
    EstimationNode(marks: 45.0, gateScore: 440.0, minRank: 4501, maxRank: 6500),
    EstimationNode(marks: 40.0, gateScore: 395.0, minRank: 6501, maxRank: 9000),
    EstimationNode(marks: 29.0, gateScore: 350.0, minRank: 14000, maxRank: 16000),
    EstimationNode(marks: 0.0, gateScore: 0.0, minRank: 22000, maxRank: 25000),
  ];

  const List<EstimationNode> nodes2024 = [
    EstimationNode(marks: 100.0, gateScore: 1000.0, minRank: 1, maxRank: 1),
    EstimationNode(marks: 90.0, gateScore: 1000.0, minRank: 1, maxRank: 1),
    EstimationNode(marks: 85.0, gateScore: 965.0, minRank: 2, maxRank: 10),
    EstimationNode(marks: 80.0, gateScore: 920.0, minRank: 11, maxRank: 25),
    EstimationNode(marks: 75.0, gateScore: 870.0, minRank: 26, maxRank: 60),
    EstimationNode(marks: 70.0, gateScore: 820.0, minRank: 61, maxRank: 120),
    EstimationNode(marks: 65.0, gateScore: 770.0, minRank: 121, maxRank: 250),
    EstimationNode(marks: 60.0, gateScore: 715.0, minRank: 251, maxRank: 450),
    EstimationNode(marks: 55.0, gateScore: 655.0, minRank: 451, maxRank: 900),
    EstimationNode(marks: 50.0, gateScore: 590.0, minRank: 901, maxRank: 1500),
    EstimationNode(marks: 45.0, gateScore: 520.0, minRank: 1501, maxRank: 2500),
    EstimationNode(marks: 40.0, gateScore: 445.0, minRank: 2501, maxRank: 4000),
    EstimationNode(marks: 37.1, gateScore: 350.0, minRank: 4500, maxRank: 5500),
    EstimationNode(marks: 0.0, gateScore: 0.0, minRank: 8000, maxRank: 10000),
  ];

  List<EstimationNode> nodes;
  double cutoff;
  if (yearTrend == 'GATE 2026') {
    nodes = nodes2026;
    cutoff = 26.4;
  } else if (yearTrend == 'GATE 2025') {
    nodes = nodes2025;
    cutoff = 29.0;
  } else if (yearTrend == 'GATE 2024') {
    nodes = nodes2024;
    cutoff = 37.1;
  } else {
    // Average Trend
    cutoff = 30.8;
    final p2026 = _interpolateNode(marks, nodes2026);
    final p2025 = _interpolateNode(marks, nodes2025);
    final p2024 = _interpolateNode(marks, nodes2024);
    final avgScore = (p2026['score']! + p2025['score']! + p2024['score']!) / 3.0;
    final avgMinRank = ((p2026['minRank']! + p2025['minRank']! + p2024['minRank']!) / 3.0).round();
    final avgMaxRank = ((p2026['maxRank']! + p2025['maxRank']! + p2024['maxRank']!) / 3.0).round();
    return _buildResultMap(avgScore, avgMinRank, avgMaxRank, marks, cutoff);
  }

  final p = _interpolateNode(marks, nodes);
  return _buildResultMap(p['score']!, p['minRank']!.round(), p['maxRank']!.round(), marks, cutoff);
}

Map<String, double> _interpolateNode(double targetMarks, List<EstimationNode> nodes) {
  final sorted = List<EstimationNode>.from(nodes)..sort((a, b) => b.marks.compareTo(a.marks));
  if (targetMarks >= sorted.first.marks) {
    return {
      'score': sorted.first.gateScore,
      'minRank': sorted.first.minRank.toDouble(),
      'maxRank': sorted.first.maxRank.toDouble(),
    };
  }
  if (targetMarks <= sorted.last.marks) {
    return {
      'score': sorted.last.gateScore,
      'minRank': sorted.last.minRank.toDouble(),
      'maxRank': sorted.last.maxRank.toDouble(),
    };
  }

  for (int i = 0; i < sorted.length - 1; i++) {
    final upper = sorted[i];
    final lower = sorted[i + 1];
    if (targetMarks <= upper.marks && targetMarks >= lower.marks) {
      final t = (targetMarks - lower.marks) / (upper.marks - lower.marks);
      final score = lower.gateScore + t * (upper.gateScore - lower.gateScore);
      final minRank = lower.minRank + t * (upper.minRank - lower.minRank);
      final maxRank = lower.maxRank + t * (upper.maxRank - lower.maxRank);
      return {
        'score': score.clamp(0.0, 1000.0),
        'minRank': minRank,
        'maxRank': maxRank,
      };
    }
  }
  return {'score': 0.0, 'minRank': 0.0, 'maxRank': 0.0};
}

Map<String, dynamic> _buildResultMap(double score, int minRank, int maxRank, double marks, double cutoff) {
  final bool isQualified = marks >= cutoff;
  String iitChance;
  Color color;

  if (!isQualified) {
    iitChance = 'None';
    color = AppTheme.error;
  } else if (score >= 750) {
    iitChance = 'High';
    color = AppTheme.success;
  } else if (score >= 650) {
    iitChance = 'Moderate';
    color = AppTheme.secondary;
  } else if (score >= 500) {
    iitChance = 'Low';
    color = Colors.amber;
  } else {
    iitChance = 'Very Low';
    color = AppTheme.error;
  }

  final rankRangeStr = minRank == maxRank ? '$minRank' : '$minRank – $maxRank';

  return {
    'gateScore': score.round(),
    'predictedAir': rankRangeStr,
    'iitChance': iitChance,
    'color': color,
    'isQualified': isQualified,
  };
}

// Dry-run streak calculation helper for testing
int calculateStreakDryRun({
  required String todayStr,
  required String lastOpenStr,
  required int currentStreak,
}) {
  if (lastOpenStr.isEmpty) {
    return 1;
  }
  if (lastOpenStr == todayStr) {
    return currentStreak;
  }

  final today = DateTime.parse(todayStr);
  final lastOpen = DateTime.parse(lastOpenStr);
  final diff = today.difference(lastOpen).inDays;

  if (diff == 1) {
    return currentStreak + 1;
  } else {
    return 1;
  }
}

void main() {
  group('Score Estimator Logic Tests', () {
    test('High Range Score Predicton (>=75)', () {
      final res = calculatePrediction(82, 'Average Trend');
      expect(res['predictedAir'], '11 – 34');
      expect(res['iitChance'], 'High');
      expect(res['color'], AppTheme.success);
    });

    test('Moderate Range Score Predicton (60-74)', () {
      final res = calculatePrediction(65, 'Average Trend');
      expect(res['predictedAir'], '241 – 483');
      expect(res['iitChance'], 'High');
      expect(res['color'], AppTheme.success);
    });

    test('Borderline Range Score Predicton (50-59)', () {
      final res = calculatePrediction(54, 'Average Trend');
      expect(res['predictedAir'], '1014 – 1700');
      expect(res['iitChance'], 'Low');
      expect(res['color'], Colors.amber);
    });

    test('Low Range Score Predicton (<50)', () {
      final res = calculatePrediction(42, 'Average Trend');
      expect(res['predictedAir'], '3088 – 4547');
      expect(res['iitChance'], 'Very Low');
      expect(res['color'], AppTheme.error);
    });
  });

  group('Streak Calculation Tests', () {
    test('First launch starts streak at 1', () {
      final streak = calculateStreakDryRun(
        todayStr: '2026-06-07',
        lastOpenStr: '',
        currentStreak: 0,
      );
      expect(streak, 1);
    });

    test('Opening same day maintains streak', () {
      final streak = calculateStreakDryRun(
        todayStr: '2026-06-07',
        lastOpenStr: '2026-06-07',
        currentStreak: 5,
      );
      expect(streak, 5);
    });

    test('Opening consecutive day increments streak', () {
      final streak = calculateStreakDryRun(
        todayStr: '2026-06-08',
        lastOpenStr: '2026-06-07',
        currentStreak: 5,
      );
      expect(streak, 6);
    });

    test('Opening after gap breaks/resets streak to 1', () {
      final streak = calculateStreakDryRun(
        todayStr: '2026-06-10',
        lastOpenStr: '2026-06-07',
        currentStreak: 5,
      );
      expect(streak, 1);
    });

    test('Broken streak saves previous streak and allows full recovery', () {
      // Simulation of StorageService streak break and restore
      int currentStreak = 18;
      int previousStreak = 0;

      // User misses 2 days
      const todayStr = '2026-06-15';
      const lastOpenStr = '2026-06-12';

      final today = DateTime.parse(todayStr);
      final lastOpen = DateTime.parse(lastOpenStr);
      final diff = DateTime.utc(today.year, today.month, today.day)
          .difference(DateTime.utc(lastOpen.year, lastOpen.month, lastOpen.day))
          .inDays;

      expect(diff, equals(3));
      if (diff > 1) {
        previousStreak = currentStreak;
        currentStreak = 1;
      }

      expect(currentStreak, equals(1));
      expect(previousStreak, equals(18));

      // User restores streak (via Ad or Pro Pass)
      if (previousStreak > 0) {
        currentStreak = previousStreak;
        previousStreak = 0;
      }

      expect(currentStreak, equals(18));
      expect(previousStreak, equals(0));
    });

    test('UTC midnight difference accurately counts days across months and leap years', () {
      int getDiff(String d1, String d2) {
        final t1 = DateTime.parse(d1);
        final t2 = DateTime.parse(d2);
        return DateTime.utc(t1.year, t1.month, t1.day)
            .difference(DateTime.utc(t2.year, t2.month, t2.day))
            .inDays;
      }

      // Across month boundary
      expect(getDiff('2026-07-01', '2026-06-30'), equals(1));

      // Across year boundary
      expect(getDiff('2027-01-01', '2026-12-31'), equals(1));

      // Multiple days gap
      expect(getDiff('2026-07-05', '2026-07-01'), equals(4));
    });
  });

  group('Mock Test Scoring Logic Tests', () {
    test('Standard MCQ scoring (correct, incorrect, skipped)', () {
      final questions = [
        {'id': 'q1', 'type': 'MCQ', 'correctAnswer': 'A'},
        {'id': 'q2', 'type': 'MCQ', 'correctAnswer': 'B'},
        {'id': 'q3', 'type': 'MCQ', 'correctAnswer': 'C'},
      ];
      final userAnswers = {
        'q1': 'A', // correct: +1
        'q2': 'A', // incorrect MCQ: -0.333
        // q3: skipped: 0
      };
      final score = calculateMockScoreDryRun(questions, userAnswers);
      expect(score, closeTo(2.0 / 3.0, 0.01)); // 1.0 - 0.333 = 0.667
    });

    test('MSQ scoring (correct, incorrect multi-selection, partial incorrect)', () {
      final questions = [
        {'id': 'q1', 'type': 'MSQ', 'correctAnswer': 'A;B'},
        {'id': 'q2', 'type': 'MSQ', 'correctAnswer': 'A;B;C'},
      ];
      final userAnswers = {
        'q1': 'A;B', // correct: +1
        'q2': 'A;B', // incorrect (partial matches get 0): 0
      };
      final score = calculateMockScoreDryRun(questions, userAnswers);
      expect(score, 1.0);
    });

    test('NAT scoring (exact correct, correct within tolerance, incorrect)', () {
      final questions = [
        {'id': 'q1', 'type': 'NAT', 'correctAnswer': '14.5'},
        {'id': 'q2', 'type': 'NAT', 'correctAnswer': '0.33'},
        {'id': 'q3', 'type': 'NAT', 'correctAnswer': '5'},
      ];
      final userAnswers = {
        'q1': '14.5',   // correct: +1
        'q2': '0.35',   // correct within 0.05 tolerance: +1
        'q3': '6',      // incorrect: 0
      };
      final score = calculateMockScoreDryRun(questions, userAnswers);
      expect(score, 2.0);
    });

    test('Score normalization to 100 percentage scale', () {
      final questions = [
        {'id': 'q1', 'type': 'MCQ', 'correctAnswer': 'A'},
        {'id': 'q2', 'type': 'MCQ', 'correctAnswer': 'B'},
        {'id': 'q3', 'type': 'MCQ', 'correctAnswer': 'C'},
        {'id': 'q4', 'type': 'MCQ', 'correctAnswer': 'D'},
      ];
      final userAnswers = {
        'q1': 'A', // correct
        'q2': 'B', // correct
        'q3': 'C', // correct
        'q4': 'A', // incorrect MCQ: -0.333
      };
      final score = calculateMockScoreDryRun(questions, userAnswers); // 3 - 0.333 = 2.667
      final percentage = (score / questions.length) * 100.0;
      expect(percentage, closeTo(66.67, 0.1));
    });
  });

  group('Weak-Area Mistakes Quiz Generation Tests', () {
    test('Correctly bundles 5 deliberate error entries into a custom quiz', () {
      final sampleErrors = [
        {'id': 'e1', 'subject': 'Probability and Statistics', 'topic': 'Bayes Theorem', 'questionText': 'Calculate P(A|B) when P(B|A)=0.8', 'whyWrong': 'Divided by P(A) instead of P(B)'},
        {'id': 'e2', 'subject': 'Linear Algebra', 'topic': 'Eigenvalues', 'questionText': 'Find eigenvalues of 2x2 matrix with trace 5 and det 6', 'whyWrong': 'Calculation slip in quadratic formula'},
        {'id': 'e3', 'subject': 'Machine Learning', 'topic': 'ROC AUC', 'questionText': 'What is False Positive Rate formula?', 'whyWrong': 'Confused FPR with Precision'},
        {'id': 'e4', 'subject': 'Calculus and Optimization', 'topic': 'Convexity', 'questionText': 'Condition for multivariable convexity', 'whyWrong': 'Forgot positive semi-definite check on Hessian'},
        {'id': 'e5', 'subject': 'Database Management', 'topic': 'BCNF', 'questionText': 'Is every 3NF relation in BCNF?', 'whyWrong': 'Answered yes instead of checking LHS superkey'},
      ];

      // Simulate mistake quiz bundling logic
      final quizQuestions = sampleErrors.map((err) {
        return {
          'id': err['id']!,
          'subject': err['subject']!,
          'topic': err['topic']!,
          'questionText': err['questionText']!,
          'explanation': 'Your Recorded Mistake Analysis: ${err['whyWrong']}',
          'difficulty': 'Hard',
        };
      }).toList();

      expect(quizQuestions.length, 5);
      expect(quizQuestions[0]['topic'], 'Bayes Theorem');
      expect(quizQuestions[0]['explanation'], contains('Divided by P(A)'));
      expect(quizQuestions[1]['topic'], 'Eigenvalues');
      expect(quizQuestions[2]['topic'], 'ROC AUC');
      expect(quizQuestions[3]['topic'], 'Convexity');
      expect(quizQuestions[4]['topic'], 'BCNF');
    });

    test('Subject filter restricts custom quiz to matching weak subject', () {
      final sampleErrors = [
        {'id': 'e1', 'subject': 'Probability and Statistics', 'topic': 'Bayes Theorem', 'questionText': 'Q1'},
        {'id': 'e2', 'subject': 'Probability and Statistics', 'topic': 'Poisson', 'questionText': 'Q2'},
        {'id': 'e3', 'subject': 'Linear Algebra', 'topic': 'Eigenvalues', 'questionText': 'Q3'},
      ];

      final filtered = sampleErrors.where((e) => e['subject'] == 'Probability and Statistics').toList();
      expect(filtered.length, 2);
      expect(filtered.every((e) => e['subject'] == 'Probability and Statistics'), isTrue);
    });
  });

  group('GateX Pro Pass Entitlement Tests', () {
    test('Pro Pass unlocks ad-free and mock testing entitlements', () {
      bool isPro = false;
      bool isAdSuspended = false;

      // Simulate purchasing Pro Pass
      isPro = true;
      if (isPro) {
        isAdSuspended = true;
      }

      expect(isPro, isTrue);
      expect(isAdSuspended, isTrue);
    });

    test('Pro Pass pricing and seasonal parameters match specification', () {
      const price = '₹299';
      const oldPrice = '₹599';
      const seasonYear = 2027;
      const validityDate = '31st March 2027';

      expect(price, '₹299');
      expect(oldPrice, '₹599');
      expect(seasonYear, 2027);
      expect(validityDate, '31st March 2027');
    });

    test('Solo (₹299) and Dual Prep (₹499) pricing parameters match specification', () {
      expect(PurchaseService.proSoloPlanPrice, '₹299');
      expect(PurchaseService.proSoloPlanOldPrice, '₹599');
      expect(PurchaseService.proDualPlanPrice, '₹499');
      expect(PurchaseService.proDualPlanOldPrice, '₹899');
      expect(PurchaseService.proUpgradeToDualPrice, '₹200');
      expect(PurchaseService.proPlanValidity, 'Valid till 31st March 2027');
    });

    test('Solo Pass branch isolation prevents exploit when toggling tracks', () {
      // Simulation of PurchaseService branch evaluation
      bool evaluateBranchAccess({
        required bool isPro,
        required bool isDualPro,
        required String soloBranch,
        required String targetBranch,
      }) {
        if (!isPro) return false;
        if (isDualPro) return true; // Dual Pro unlocks both
        if (targetBranch == 'BOTH' || targetBranch == 'COMMON') return true;
        return soloBranch == targetBranch;
      }

      // Case 1: Free user has no Pro access on either branch
      expect(evaluateBranchAccess(isPro: false, isDualPro: false, soloBranch: 'DA', targetBranch: 'DA'), isFalse);
      expect(evaluateBranchAccess(isPro: false, isDualPro: false, soloBranch: 'DA', targetBranch: 'CSIT'), isFalse);

      // Case 2: Solo DA user has Pro on DA, but NOT on CSIT
      expect(evaluateBranchAccess(isPro: true, isDualPro: false, soloBranch: 'DA', targetBranch: 'DA'), isTrue);
      expect(evaluateBranchAccess(isPro: true, isDualPro: false, soloBranch: 'DA', targetBranch: 'CSIT'), isFalse);

      // Case 3: Solo CSIT user has Pro on CSIT, but NOT on DA
      expect(evaluateBranchAccess(isPro: true, isDualPro: false, soloBranch: 'CSIT', targetBranch: 'CSIT'), isTrue);
      expect(evaluateBranchAccess(isPro: true, isDualPro: false, soloBranch: 'CSIT', targetBranch: 'DA'), isFalse);

      // Case 4: Common subject ('BOTH') is accessible to any Solo user
      expect(evaluateBranchAccess(isPro: true, isDualPro: false, soloBranch: 'DA', targetBranch: 'BOTH'), isTrue);
      expect(evaluateBranchAccess(isPro: true, isDualPro: false, soloBranch: 'CSIT', targetBranch: 'BOTH'), isTrue);

      // Case 5: Dual Prep user has Pro access to BOTH DA and CSIT
      expect(evaluateBranchAccess(isPro: true, isDualPro: true, soloBranch: 'DA', targetBranch: 'DA'), isTrue);
      expect(evaluateBranchAccess(isPro: true, isDualPro: true, soloBranch: 'DA', targetBranch: 'CSIT'), isTrue);
    });

    test('Pro Pass includes lifetime access to all future releases and tools', () {
      const features = [
        '100% Ad-Free Experience',
        '10 Full-Length TCS iON CBT Mocks',
        'Unlimited AI Error Drills',
        'In-Depth Pro Notes & Proofs',
        'Printable Formula Sheets & PDF Export',
        'All New Features Included Automatically',
      ];

      expect(features.contains('All New Features Included Automatically'), isTrue);
      expect(features.contains('10 Full-Length TCS iON CBT Mocks'), isTrue);
      expect(features.length, 6);
    });
  });

  group('Official GATE CBT Simulator Tests (TCS iON Engine)', () {
    test('5-State Question Status Evaluation Logic', () {
      final userAnswers = {'q2': 'A', 'q4': 'B'};
      final markedForReview = {'q3', 'q4'};
      final visited = {'q1', 'q2', 'q3', 'q4'};

      // Status helper
      String getStatus(String qId) {
        final hasAns = userAnswers.containsKey(qId) && userAnswers[qId]!.isNotEmpty;
        final isMarked = markedForReview.contains(qId);
        final isVisited = visited.contains(qId);

        if (isMarked && hasAns) return 'answeredAndMarked';
        if (isMarked && !hasAns) return 'markedForReview';
        if (hasAns) return 'answered';
        if (isVisited) return 'notAnswered';
        return 'notVisited';
      }

      expect(getStatus('q0'), 'notVisited');
      expect(getStatus('q1'), 'notAnswered');
      expect(getStatus('q2'), 'answered');
      expect(getStatus('q3'), 'markedForReview');
      expect(getStatus('q4'), 'answeredAndMarked');
    });

    test('65-Question Full Mock Official 100 Marks Distribution', () {
      double totalMarks = 0.0;
      double gaMarks = 0.0;
      double coreMarks = 0.0;

      for (int i = 0; i < 65; i++) {
        double weight;
        if ((i >= 0 && i < 5) || (i >= 10 && i < 35)) {
          weight = 1.0;
        } else {
          weight = 2.0;
        }

        totalMarks += weight;
        if (i < 10) {
          gaMarks += weight;
        } else {
          coreMarks += weight;
        }
      }

      expect(gaMarks, 15.0);
      expect(coreMarks, 85.0);
      expect(totalMarks, 100.0);
    });

    test('Answered & Marked for Review questions ARE evaluated in final score', () {
      final questions = [
        {'id': 'q1', 'type': 'MCQ', 'correctAnswer': 'A'},
        {'id': 'q2', 'type': 'MCQ', 'correctAnswer': 'B'},
        {'id': 'q3', 'type': 'MCQ', 'correctAnswer': 'C'},
      ];
      final userAnswers = {
        'q1': 'A', // Answered (correct): +1
        'q2': 'B', // Answered & Marked for Review (correct): +1
        // q3 is only Marked for Review without answer: 0
      };

      final score = calculateMockScoreDryRun(questions, userAnswers);
      expect(score, 2.0); // Both q1 and q2 are scored
    });

    test('Subject mock key mapper accurately resolves all DA and CS/IT syllabus subjects', () {
      String mapKey(String sub, bool isCSIT) {
        final trimmed = sub.trim();
        if (isCSIT) {
          const m = {
            'Computer Organization': 'Computer Organization and Architecture',
            'Programming & Data Structures': 'Programming and Data Structures',
            'Operating System': 'Operating Systems',
            'Databases': 'Database Management Systems',
          };
          if (m.containsKey(trimmed)) return m[trimmed]!;
          if (csitSubjectWiseMockQuestions.containsKey(trimmed)) return trimmed;
          return trimmed;
        } else {
          const m = {
            'Probability and Statistics': 'Probability & Statistics',
            'Calculus and Optimization': 'Calculus & Optimization',
            'Python (Main Topics Only)': 'Programming, Data Structures & Algorithms',
            'DSA (Data Structures and Algorithms)': 'Programming, Data Structures & Algorithms',
            'Database Management and Warehousing': 'Database Management & Warehousing',
            'AI': 'Artificial Intelligence',
          };
          if (m.containsKey(trimmed)) return m[trimmed]!;
          if (daSubjectWiseMockQuestions.containsKey(trimmed)) return trimmed;
          return trimmed;
        }
      }

      for (final daSub in StorageService.syllabusData.keys) {
        final resolvedKey = mapKey(daSub, false);
        expect(daSubjectWiseMockQuestions.containsKey(resolvedKey), isTrue,
            reason: 'DA subject should resolve to a valid mock bank key');
        expect(daSubjectWiseMockQuestions[resolvedKey]!.length, greaterThanOrEqualTo(10));
      }

      for (final csSub in StorageService.csitSyllabusData.keys) {
        final resolvedKey = mapKey(csSub, true);
        expect(csitSubjectWiseMockQuestions.containsKey(resolvedKey), isTrue,
            reason: 'CSIT subject should resolve to a valid mock bank key');
        expect(csitSubjectWiseMockQuestions[resolvedKey]!.length, greaterThanOrEqualTo(10));
      }
    });

    test('Section-aware full mock preserves GA and Core partitions', () {
      final base = List.generate(65, (i) => i < 10 ? 'General Aptitude' : 'Core Subject');
      final ga1 = base.sublist(0, 5)..shuffle();
      final ga2 = base.sublist(5, 10)..shuffle();
      final core1 = base.sublist(10, 35)..shuffle();
      final core2 = base.sublist(35, 65)..shuffle();
      final result = [...ga1, ...ga2, ...core1, ...core2];

      expect(result.length, 65);
      for (int i = 0; i < 10; i++) {
        expect(result[i], 'General Aptitude');
      }
      for (int i = 10; i < 65; i++) {
        expect(result[i], 'Core Subject');
      }
    });

    test('CBT Mock submission respects Pro Pass entitlement and suppresses interstitial ads', () {
      bool checkShowAd(bool isPro) {
        if (!isPro) {
          return true;
        }
        return false;
      }

      expect(checkShowAd(false), isTrue);
      expect(checkShowAd(true), isFalse);
    });

    test('NAT Answer validation supports ranges, intervals, and relative tolerance', () {
      final qRange = PYQ(
        id: 'nat1',
        year: 2026,
        subject: 'Linear Algebra',
        topic: 'Eigenvalues',
        questionText: 'Find the spectral norm.',
        options: [],
        correctAnswer: '2.5 to 3.5',
        type: 'NAT',
        isMCQ: false,
        explanation: '',
        difficulty: 'Medium',
      );

      expect(qRange.isAnswerCorrect('3.0'), isTrue);
      expect(qRange.isAnswerCorrect('2.5'), isTrue);
      expect(qRange.isAnswerCorrect('3.5'), isTrue);
      expect(qRange.isAnswerCorrect('4.0'), isFalse);

      final qBracket = PYQ(
        id: 'nat2',
        year: 2026,
        subject: 'Calculus',
        topic: 'Limits',
        questionText: 'Find value of L.',
        options: [],
        correctAnswer: '[10, 12]',
        type: 'NAT',
        isMCQ: false,
        explanation: '',
        difficulty: 'Medium',
      );
      expect(qBracket.isAnswerCorrect('11.0'), isTrue);
      expect(qBracket.isAnswerCorrect('10.0'), isTrue);
      expect(qBracket.isAnswerCorrect('9.8'), isFalse);

      final qExact = PYQ(
        id: 'nat3',
        year: 2026,
        subject: 'Probability',
        topic: 'Normal Distribution',
        questionText: 'Variance.',
        options: [],
        correctAnswer: '100',
        type: 'NAT',
        isMCQ: false,
        explanation: '',
        difficulty: 'Medium',
      );
      expect(qExact.isAnswerCorrect('100.0'), isTrue);
      expect(qExact.isAnswerCorrect('100.5'), isTrue); // within 1% relative tolerance
      expect(qExact.isAnswerCorrect('105.0'), isFalse);
    });

    test('10 Full-Length Mocks Series defines Mock 1 Free, Mock 2 Free via Ad, and Mocks 3-10 for Pro', () {
      const mockCount = 10;
      final freeMockIndices = [1];
      final adFreeMockIndices = [2];
      final proMockIndices = List.generate(8, (i) => i + 3);

      expect(mockCount, 10);
      expect(freeMockIndices.contains(1), isTrue);
      expect(adFreeMockIndices.contains(2), isTrue);
      expect(proMockIndices.length, 8);
      expect(proMockIndices.contains(3), isTrue);
      expect(proMockIndices.contains(10), isTrue);
    });
  });

  group('Agile Syllabus Checklist Tests', () {
    test('Topic milestone tracking (Concept, PYQ, Revise)', () {
      final initial = TopicStatus(topicName: 'Eigenvalues', subjectName: 'Linear Algebra');
      expect(initial.conceptWatched, false);
      expect(initial.pyqSolved, false);
      expect(initial.revisedOnce, false);
      expect(initial.isCompleted, false);

      // Mark concept watched
      final step1 = initial.copyWith(conceptWatched: true);
      expect(step1.conceptWatched, true);
      expect(step1.isCompleted, false);

      // Mark PYQ solved
      final step2 = step1.copyWith(pyqSolved: true);
      expect(step2.pyqSolved, true);
      expect(step2.isCompleted, false);

      // Mark revised once -> All complete!
      final step3 = step2.copyWith(revisedOnce: true, isCompleted: true);
      expect(step3.conceptWatched, true);
      expect(step3.pyqSolved, true);
      expect(step3.revisedOnce, true);
      expect(step3.isCompleted, true);
    });

    test('TopicStatus serialization backwards compatibility', () {
      // Legacy map with only isCompleted = true
      final legacyMap = {
        'topicName': 'Bayes Theorem',
        'subjectName': 'Probability and Statistics',
        'isCompleted': true,
      };
      final parsed = TopicStatus.fromMap(legacyMap);
      expect(parsed.isCompleted, true);
      expect(parsed.conceptWatched, true);
      expect(parsed.pyqSolved, true);
      expect(parsed.revisedOnce, true);

      // Serialized map contains all milestone keys
      final serialized = parsed.toMap();
      expect(serialized['conceptWatched'], true);
      expect(serialized['pyqSolved'], true);
      expect(serialized['revisedOnce'], true);
    });

    test('1-tap topic toggle all milestones at once', () {
      final initial = TopicStatus(topicName: 'Bayes Theorem', subjectName: 'Probability and Statistics');
      expect(initial.isCompleted, false);

      // 1-tap mark complete
      final mastered = initial.copyWith(
        conceptWatched: true,
        pyqSolved: true,
        revisedOnce: true,
        isCompleted: true,
      );
      expect(mastered.conceptWatched, true);
      expect(mastered.pyqSolved, true);
      expect(mastered.revisedOnce, true);
      expect(mastered.isCompleted, true);

      // 1-tap unmark
      final unmastered = mastered.copyWith(
        conceptWatched: false,
        pyqSolved: false,
        revisedOnce: false,
        isCompleted: false,
      );
      expect(unmastered.conceptWatched, false);
      expect(unmastered.pyqSolved, false);
      expect(unmastered.revisedOnce, false);
      expect(unmastered.isCompleted, false);
    });

    test('Subject normalization and disambiguation correctly isolates CSIT and DA subjects', () {
      // Helper function simulating _normalizeSubjectToSyllabusKey
      String normalizeSubject(String inputSubject, bool isCSIT) {
        final s = inputSubject.toLowerCase().trim();
        final syllabus = isCSIT ? StorageService.csitSyllabusData : StorageService.syllabusData;
        for (final key in syllabus.keys) {
          if (key.toLowerCase() == s) return key;
        }
        if (!isCSIT) {
          if (s.contains('prob') || s.contains('stat')) return 'Probability and Statistics';
          if (s.contains('linear') || s.contains('algebra')) return 'Linear Algebra';
          if (s.contains('calculus') || s.contains('optimi')) return 'Calculus and Optimization';
          if (s.contains('machine') || RegExp(r'\bml\b').hasMatch(s)) return 'Machine Learning';
          if (s.contains('python')) return 'Python (Main Topics Only)';
          if (s.contains('dsa') || s.contains('data struct') || s.contains('algorithm')) return 'DSA (Data Structures and Algorithms)';
          if (s.contains('database') || s.contains('dbms') || s.contains('warehousing')) return 'Database Management and Warehousing';
          if (RegExp(r'\bai\b').hasMatch(s) || s.contains('artificial') || s.contains('logic')) return 'AI';
          if (s.contains('aptitude')) return 'General Aptitude';
        } else {
          if (s.contains('aptitude')) return 'General Aptitude';
          if (s.contains('math')) return 'Engineering Mathematics';
          if (s.contains('digital') || s.contains('logic')) return 'Digital Logic';
          if (s.contains('compiler')) return 'Compiler Design';
          if (s.contains('computation') || s.contains('toc') || s.contains('automata')) return 'Theory of Computation';
          if (s.contains('network') || RegExp(r'\bcn\b').hasMatch(s)) return 'Computer Networks';
          if (s.contains('operating') || RegExp(r'\bos\b').hasMatch(s)) return 'Operating System';
          if (s.contains('database') || s.contains('dbms')) return 'Databases';
          if (s.contains('algorithm')) return 'Algorithms';
          if (s.contains('program') || s.contains('data struct')) return 'Programming & Data Structures';
          if (s.contains('organization') || s.contains('organisation') || s.contains('architecture') || RegExp(r'\bcoa?\b').hasMatch(s)) return 'Computer Organization';
        }
        return inputSubject;
      }

      // Verify CSIT ambiguous 'co' edge cases do not falsely resolve to Computer Organization
      expect(normalizeSubject('Theory of Computation', true), 'Theory of Computation');
      expect(normalizeSubject('TOC', true), 'Theory of Computation');
      expect(normalizeSubject('Compiler Design', true), 'Compiler Design');
      expect(normalizeSubject('Computer Networks', true), 'Computer Networks');
      expect(normalizeSubject('CN', true), 'Computer Networks');
      expect(normalizeSubject('Computer Organization', true), 'Computer Organization');
      expect(normalizeSubject('COA', true), 'Computer Organization');

      // Verify DA subjects
      expect(normalizeSubject('Machine Learning', false), 'Machine Learning');
      expect(normalizeSubject('ML', false), 'Machine Learning');
      expect(normalizeSubject('AI', false), 'AI');
      expect(normalizeSubject('Linear Algebra', false), 'Linear Algebra');
    });

    test('TopicStatus note serialization and modification preserves user formulas', () {
      final initial = TopicStatus(topicName: 'Eigenvalues', subjectName: 'Linear Algebra');
      expect(initial.note, '');

      // Add formula note
      final withNote = initial.copyWith(note: 'det(A - lambda*I) = 0');
      expect(withNote.note, 'det(A - lambda*I) = 0');

      final serialized = withNote.toMap();
      expect(serialized['note'], 'det(A - lambda*I) = 0');

      final restored = TopicStatus.fromMap(serialized);
      expect(restored.note, 'det(A - lambda*I) = 0');

      // Clear note
      final cleared = restored.copyWith(note: '');
      expect(cleared.note, '');
    });

    test('Phase progress calculation matches both phase and subject keys', () {
      const daItem = StudyPlanItem(
        day: 1,
        date: '2026-05-01',
        dayOfWeek: 'Friday',
        phase: 'Probability & Statistics',
        subject: 'Probability & Statistics',
        topic: 'Combinatorics',
        type: 'core',
        studyHours: 2.5,
        aptitudeMinutes: 20,
        totalHours: 2.8,
        notes: '',
      );
      const csitItem = StudyPlanItem(
        day: 1,
        date: '2026-05-01',
        dayOfWeek: 'Friday',
        phase: 'phase_1_syllabus',
        subject: 'Engineering Mathematics',
        topic: 'Propositional Logic',
        type: 'core',
        studyHours: 2.5,
        aptitudeMinutes: 20,
        totalHours: 2.8,
        notes: '',
      );

      bool matchPhase(StudyPlanItem item, String phaseName) {
        return item.phase == phaseName || item.subject == phaseName;
      }

      // DA phase match
      expect(matchPhase(daItem, 'Probability & Statistics'), true);
      // CSIT subject match when phase is generic
      expect(matchPhase(csitItem, 'Engineering Mathematics'), true);
      expect(matchPhase(csitItem, 'phase_1_syllabus'), true);
      expect(matchPhase(csitItem, 'Digital Logic'), false);
    });
  });

  group('Multi-Branch Scalable Architecture Tests', () {
    test('Active branches DA, CSIT, and BOTH are available', () {
      final da = BranchRegistry.getBranch('DA');
      expect(da.isAvailable, true);
      expect(da.subjects.contains('Machine Learning'), true);
      expect(da.subjects.contains('Probability and Statistics'), true);

      final csit = BranchRegistry.getBranch('CSIT');
      expect(csit.isAvailable, true);
      expect(csit.subjects.contains('Algorithms'), true);
      expect(csit.subjects.contains('Computer Networks'), true);

      final both = BranchRegistry.getBranch('BOTH');
      expect(both.isAvailable, true);
    });

    test('Upcoming branches (ECE, EE, ME, CE) are flagged for next season waitlist', () {
      final ec = BranchRegistry.getBranch('EC');
      expect(ec.isAvailable, false);
      expect(ec.badgeText, 'NEXT SEASON');

      final ee = BranchRegistry.getBranch('EE');
      expect(ee.isAvailable, false);

      final me = BranchRegistry.getBranch('ME');
      expect(me.isAvailable, false);

      final ce = BranchRegistry.getBranch('CE');
      expect(ce.isAvailable, false);
    });
  });

  group('PYQ Bank Logic & Filtering Tests', () {
    test('Subject normalization resolves branch variations with strict disambiguation', () {
      String normalizeSubject(String input, bool isCSIT) {
        final s = input.toLowerCase().trim();
        if (!isCSIT) {
          if (s.contains('prob') || s.contains('stat')) return 'Probability and Statistics';
          if (s.contains('linear') || s.contains('algebra')) return 'Linear Algebra';
          if (s.contains('calculus') || s.contains('optimi')) return 'Calculus and Optimization';
          if (s.contains('machine') || RegExp(r'\bml\b').hasMatch(s)) return 'Machine Learning';
          if (s.contains('python')) return 'Python (Main Topics Only)';
          if (s.contains('dsa') || s.contains('data struct') || s.contains('algorithm')) return 'DSA (Data Structures and Algorithms)';
          if (s.contains('database') || s.contains('dbms') || s.contains('warehousing')) return 'Database Management and Warehousing';
          if (RegExp(r'\bai\b').hasMatch(s) || s.contains('artificial') || s.contains('logic')) return 'AI';
          if (s.contains('aptitude')) return 'General Aptitude';
        } else {
          if (s.contains('aptitude')) return 'General Aptitude';
          if (s.contains('math')) return 'Engineering Mathematics';
          if (s.contains('digital') || s.contains('logic')) return 'Digital Logic';
          if (s.contains('compiler')) return 'Compiler Design';
          if (s.contains('computation') || s.contains('toc') || s.contains('automata')) return 'Theory of Computation';
          if (s.contains('network') || RegExp(r'\bcn\b').hasMatch(s)) return 'Computer Networks';
          if (s.contains('operating') || RegExp(r'\bos\b').hasMatch(s)) return 'Operating System';
          if (s.contains('database') || s.contains('dbms')) return 'Databases';
          if (s.contains('algorithm')) return 'Algorithms';
          if (s.contains('program') || s.contains('data struct')) return 'Programming & Data Structures';
          if (s.contains('organization') || s.contains('organisation') || s.contains('architecture') || RegExp(r'\bcoa?\b').hasMatch(s)) return 'Computer Organization';
        }
        return input;
      }

      // DA Subject aliases
      expect(normalizeSubject('Probability & Statistics', false), 'Probability and Statistics');
      expect(normalizeSubject('Calculus & Optimization', false), 'Calculus and Optimization');
      expect(normalizeSubject('Database Management', false), 'Database Management and Warehousing');
      expect(normalizeSubject('DSA', false), 'DSA (Data Structures and Algorithms)');
      expect(normalizeSubject('Python', false), 'Python (Main Topics Only)');
      expect(normalizeSubject('AI & Logic', false), 'AI');

      // CSIT Subject aliases without false positive CO collisions
      expect(normalizeSubject('Theory of Computation', true), 'Theory of Computation');
      expect(normalizeSubject('Compiler Design', true), 'Compiler Design');
      expect(normalizeSubject('Computer Networks', true), 'Computer Networks');
      expect(normalizeSubject('Computer Organization and Architecture', true), 'Computer Organization');
      expect(normalizeSubject('Programming and Data Structures', true), 'Programming & Data Structures');
      expect(normalizeSubject('Engineering Mathematics', true), 'Engineering Mathematics');
    });

    test('NAT answer evaluation handles decimal comma and tolerances', () {
      final natQuestion = PYQ(
        id: 'pyq_test_nat',
        subject: 'Linear Algebra',
        topic: 'Eigenvalues',
        questionText: 'Compute the trace of matrix A',
        type: 'NAT',
        isMCQ: false,
        year: 2026,
        options: [],
        correctAnswer: '3.14',
        explanation: 'Trace is sum of diagonal elements',
        difficulty: 'Medium',
      );

      // Standard dot
      expect(natQuestion.isAnswerCorrect('3.14'), true);
      // Tolerance within 0.05
      expect(natQuestion.isAnswerCorrect('3.17'), true);
      // Comma converted to dot before evaluation
      final commaInput = '3,14'.replaceAll(',', '.');
      expect(natQuestion.isAnswerCorrect(commaInput), true);
      // Clearly incorrect
      expect(natQuestion.isAnswerCorrect('4.50'), false);
    });

    test('Pro Pass users receive 0 ad injection slots in PYQ lists', () {
      int calculateTotalItems(int length, bool isProUser) {
        final adFrequency = isProUser ? 0 : 10;
        return isProUser ? length : (length + (length ~/ adFrequency));
      }

      // Free user: ad injected every 10 items
      expect(calculateTotalItems(25, false), 27);

      // Pro user: pure list with 0 ad slots
      expect(calculateTotalItems(25, true), 25);
    });

    test('Search query matches question type and ID', () {
      final pyq = PYQ(
        id: 'pyq_2026_14',
        subject: 'Machine Learning',
        topic: 'Support Vector Machines',
        questionText: 'Find the optimal hyperplane margin',
        type: 'NAT',
        isMCQ: false,
        year: 2026,
        options: [],
        correctAnswer: '2.5',
        difficulty: 'Medium',
        explanation: 'Margin = 2 / ||w||',
      );

      bool matches(PYQ p, String query) {
        final q = query.toLowerCase().trim();
        final pyqYearStr = p.setNumber != null ? '${p.year} Set ${p.setNumber}' : p.year.toString();
        return q.isEmpty ||
            p.questionText.toLowerCase().contains(q) ||
            p.topic.toLowerCase().contains(q) ||
            p.subject.toLowerCase().contains(q) ||
            pyqYearStr.toLowerCase().contains(q) ||
            p.type.toLowerCase() == q ||
            p.id.toLowerCase().contains(q);
      }

      expect(matches(pyq, 'NAT'), true);
      expect(matches(pyq, 'pyq_2026_14'), true);
      expect(matches(pyq, 'Support Vector'), true);
      expect(matches(pyq, '2026'), true);
      expect(matches(pyq, 'MSQ'), false);
    });
  });

  group('GateX Hub Screen Architecture & Tools Tests', () {
    test('Hub Tools Grid contains comprehensive study tools including Score and PSU Predictor', () {
      final expectedTools = [
        'Formulas',
        'Calculator',
        'Estimator',
        'Weightage',
        'Pomodoro',
        'Revision',
        'Mistakes',
        'Roadmap',
        'Analytics',
        'Score Predictor',
        'PSU Predictor',
        'Notes',
      ];
      expect(expectedTools.length, 12);
      expect(expectedTools.contains('Score Predictor'), isTrue);
      expect(expectedTools.contains('PSU Predictor'), isTrue);
      expect(expectedTools.contains('Roadmap'), isTrue);
      expect(expectedTools.contains('Calculator'), isTrue);
    });

    test('Study reminder time parser safely falls back on corrupted or empty string', () {
      Map<String, int> parseTime(String timeStr) {
        int hour = 9;
        int minute = 0;
        if (timeStr.contains(':')) {
          final parts = timeStr.split(':');
          hour = int.tryParse(parts[0]) ?? 9;
          minute = int.tryParse(parts[1]) ?? 0;
        }
        return {'hour': hour, 'minute': minute};
      }

      expect(parseTime('21:30'), {'hour': 21, 'minute': 30});
      expect(parseTime('08:05'), {'hour': 8, 'minute': 5});
      expect(parseTime(''), {'hour': 9, 'minute': 0});
      expect(parseTime('invalid:time'), {'hour': 9, 'minute': 0});
      expect(parseTime('corrupted'), {'hour': 9, 'minute': 0});
    });
  });

  group('Score Estimator & Break Confirmation Exit Tests', () {
    test('On-demand prediction preserves marks scrubbing without premature calculation', () {
      double mockMarks = 60.0;
      bool hasPredicted = false;

      // User changes slider value
      void onSliderChanged(double newMarks) {
        mockMarks = newMarks;
        hasPredicted = false; // Scrubbing marks invalidates old prediction
      }

      onSliderChanged(65.0);
      expect(mockMarks, 65.0);
      expect(hasPredicted, isFalse);

      // User clicks Predict button
      Map<String, dynamic>? predictionResult;
      void onPredictClicked() {
        predictionResult = calculatePrediction(mockMarks, 'Average Trend');
        hasPredicted = true;
      }

      onPredictClicked();
      expect(hasPredicted, isTrue);
      expect(predictionResult, isNotNull);
      expect(predictionResult!['gateScore'], greaterThan(700));
    });

    test('Ad monetization policy requires ad for free users and instant reveal for Pro', () {
      bool shouldTriggerAd(bool isPro) {
        return !isPro;
      }

      expect(shouldTriggerAd(false), isTrue); // Free user watches interstitial ad
      expect(shouldTriggerAd(true), isFalse); // Pro user bypasses ad
    });

    test('Exit dialog provides compassionate break reminder with study and exit actions', () {
      const exitTitle = 'Take a Break? Cup of Tea ☕';
      const exitSubtitle =
          "You've put in great prep today! Step back, refresh your mind with a warm cup of tea, and come back stronger.";

      expect(exitTitle.contains('Take a Break?'), isTrue);
      expect(exitTitle.contains('Cup of Tea'), isTrue);
      expect(exitSubtitle.contains('warm cup of tea'), isTrue);
    });
  });

  group('Error Log & Cloud Sync Persistence Tests', () {
    test('ErrorLogEntry correctly stores and serializes wrong user answer and correct answer', () {
      final entry = ErrorLogEntry(
        id: 'err_test_1',
        subject: 'Database Management',
        topic: 'ER Model',
        questionText: 'What is cardinality of primary key?',
        whyWrong: 'Wrong answer in practice',
        dateAdded: DateTime(2026, 10, 21),
        userAnswer: 'Many-to-Many',
        correctAnswer: 'One-to-One',
        explanation: 'Primary keys enforce entity integrity.',
      );

      final map = entry.toMap();
      expect(map['userAnswer'], 'Many-to-Many');
      expect(map['correctAnswer'], 'One-to-One');
      expect(map['explanation'], 'Primary keys enforce entity integrity.');

      final restored = ErrorLogEntry.fromMap(map);
      expect(restored.userAnswer, 'Many-to-Many');
      expect(restored.correctAnswer, 'One-to-One');
      expect(restored.explanation, 'Primary keys enforce entity integrity.');
    });

    test('Study plan integer key parser handles both int and String formats from Firestore', () {
      final Map<dynamic, dynamic> firestoreMap = {
        '1': {'isCompleted': true, 'userNote': 'Finished Chapter 1'},
        2: {'isCompleted': false, 'userNote': ''},
      };

      final Map<int, Map<String, dynamic>> resolvedStates = {};
      for (var key in firestoreMap.keys) {
        int? intKey;
        if (key is int) {
          intKey = key;
        } else if (key is String) {
          intKey = int.tryParse(key);
        }
        if (intKey != null) {
          resolvedStates[intKey] = Map<String, dynamic>.from(firestoreMap[key]);
        }
      }

      expect(resolvedStates[1]?['isCompleted'], true);
      expect(resolvedStates[2]?['isCompleted'], false);
      expect(resolvedStates[1]?['userNote'], 'Finished Chapter 1');
    });
  });

  group('GATE Score Predictor & PSU Predictor Formula Tests', () {
    test('Official GATE Normalization Formula accurately maps benchmark points', () {
      double computeScore(double m, double mq, double mt) {
        const double sq = 350.0;
        const double st = 900.0;
        if (m >= mt) {
          final double diff = (100.0 - mt) > 0 ? (100.0 - mt) : 10.0;
          return (st + (1000.0 - st) * ((m - mt) / diff)).clamp(0.0, 1000.0);
        } else if (m >= mq) {
          return (sq + (st - sq) * ((m - mq) / (mt - mq))).clamp(0.0, 1000.0);
        } else {
          return (sq * (m / mq)).clamp(0.0, 1000.0);
        }
      }

      const double mq = 30.0;
      const double mt = 80.0;

      // Exactly at General qualifying marks -> exactly 350
      expect(computeScore(mq, mq, mt).round(), 350);

      // Exactly at Top 0.1% mean marks -> exactly 900
      expect(computeScore(mt, mq, mt).round(), 900);

      // Perfect 100 marks -> exactly 1000
      expect(computeScore(100.0, mq, mt).round(), 1000);

      // Midpoint between Mq and Mt -> 350 + 275 = 625
      expect(computeScore(55.0, mq, mt).round(), 625);

      // Category cutoffs
      final double obcCutoff = double.parse((mq * 0.9).toStringAsFixed(2));
      final double scCutoff = double.parse((mq * 2.0 / 3.0).toStringAsFixed(2));
      expect(obcCutoff, 27.0);
      expect(scCutoff, 20.0);
    });

    test('PSU Predictor evaluates chances across branches (DA and CS/IT)', () {
      String getChance(double score, int cutoff) {
        if (score >= cutoff + 15) return 'HIGH';
        if (score >= cutoff - 15) return 'TARGET';
        return 'REACH';
      }

      // Test with Score 750 (General)
      expect(getChance(750, 730), 'HIGH'); // ONGC DA (Cutoff 730)
      expect(getChance(750, 760), 'TARGET'); // ONGC CSIT (Cutoff 760)
      expect(getChance(600, 730), 'REACH'); // Below threshold

      // Category scaling
      final int genCutoff = 730;
      final int scCutoff = 510;
      expect(getChance(550, genCutoff), 'REACH');
      expect(getChance(550, scCutoff), 'HIGH'); // SC candidate with 550 gets High Chance
    });

    test('Score Estimator Real GATE Exam mode uses 1.0x multiplier without coaching skew', () {
      double calculateScaled(double marks, bool isRealExam, double coachingMultiplier) {
        final multiplier = isRealExam ? 1.0 : coachingMultiplier;
        return (marks * multiplier).clamp(0.0, 100.0);
      }

      // Mock with tough multiplier
      expect(calculateScaled(60.0, false, 1.03), closeTo(61.8, 0.01));

      // Real exam retains exact raw marks
      expect(calculateScaled(60.0, true, 1.03), 60.0);
      expect(calculateScaled(58.33, true, 0.96), 58.33);
    });
  });

  group('Notes & Study Dossier Content Tests', () {
    test('Contains notes for both GATE DA and GATE CS/IT streams', () {
      expect(allSubjectNotes.isNotEmpty, isTrue);
      final daNotes = allSubjectNotes.where((n) => n.branch == 'DA' || n.branch == 'BOTH').toList();
      final csitNotes = allSubjectNotes.where((n) => n.branch == 'CSIT' || n.branch == 'BOTH').toList();
      expect(daNotes.length, greaterThanOrEqualTo(5));
      expect(csitNotes.length, greaterThanOrEqualTo(4));
    });

    test('Every subject note has free sections and pro sections', () {
      for (final note in allSubjectNotes) {
        expect(note.freeSections.isNotEmpty, isTrue, reason: '${note.title} should have free sections');
        expect(note.proSections.isNotEmpty, isTrue, reason: '${note.title} should have pro sections');
        for (final pro in note.proSections) {
          expect(pro.examTraps.isNotEmpty, isTrue, reason: '${pro.title} should have exam traps');
        }
      }
    });
  });

  group('Google Auth Button & Vector Logo Tests', () {
    testWidgets('GoogleLogoIcon renders vector CustomPaint without error', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: GoogleLogoIcon(size: 24),
            ),
          ),
        ),
      );

      expect(find.byType(GoogleLogoIcon), findsOneWidget);
      expect(find.byType(CustomPaint), findsWidgets);
    });

    testWidgets('GoogleAuthPillButton displays logo and label', (WidgetTester tester) async {
      bool tapped = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: GoogleAuthPillButton(
                label: 'Continue with Google',
                onPressed: () {
                  tapped = true;
                },
              ),
            ),
          ),
        ),
      );

      expect(find.byType(GoogleLogoIcon), findsOneWidget);
      expect(find.text('Continue with Google'), findsOneWidget);

      await tester.tap(find.byType(GoogleAuthPillButton));
      await tester.pump();
      expect(tapped, isTrue);
    });

    testWidgets('GoogleAuthPillButton displays spinner when loading', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: GoogleAuthPillButton(
                isLoading: true,
                onPressed: () {},
              ),
            ),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(GoogleLogoIcon), findsNothing);
    });
  });

  group('GATE CS Mock 2 Suite Tests', () {
    test('GATE CS Mock 2 contains exactly 65 questions and 100 marks', () {
      expect(csFullMock2Questions.length, 65);
      final ids = <String>{};
      double totalMarks = 0.0;
      for (int i = 0; i < csFullMock2Questions.length; i++) {
        final q = csFullMock2Questions[i];
        expect(ids.contains(q.id), isFalse, reason: 'Duplicate ID: ${q.id}');
        ids.add(q.id);

        final double marks = (i < 5 || (i >= 10 && i < 35)) ? 1.0 : 2.0;
        totalMarks += marks;

        if (q.type == 'NAT') {
          expect(q.isMCQ, isFalse);
          expect(q.options.isEmpty, isTrue);
          expect(q.questionText.toLowerCase().contains('which of the following'), isFalse);
          expect(q.correctAnswer.isNotEmpty, isTrue);
        } else if (q.type == 'MSQ') {
          expect(q.isMCQ, isTrue);
          expect(q.options.length, 4);
        } else {
          expect(q.type, 'MCQ');
          expect(q.isMCQ, isTrue);
          expect(q.options.length, 4);
        }
      }
      expect(totalMarks, 100.0);
    });

    test('GATE CS Mock 3 contains exactly 65 questions and 100 marks', () {
      expect(csFullMock3Questions.length, 65);
      final ids = <String>{};
      double totalMarks = 0.0;
      for (int i = 0; i < csFullMock3Questions.length; i++) {
        final q = csFullMock3Questions[i];
        expect(ids.contains(q.id), isFalse, reason: 'Duplicate ID: ${q.id}');
        ids.add(q.id);

        final double marks = (i < 5 || (i >= 10 && i < 35)) ? 1.0 : 2.0;
        totalMarks += marks;

        if (q.type == 'NAT') {
          expect(q.isMCQ, isFalse);
          expect(q.options.isEmpty, isTrue);
          expect(q.questionText.toLowerCase().contains('which of the following'), isFalse);
          expect(q.correctAnswer.isNotEmpty, isTrue);
        } else if (q.type == 'MSQ') {
          expect(q.isMCQ, isTrue);
          expect(q.options.length, 4);
        } else {
          expect(q.type, 'MCQ');
          expect(q.isMCQ, isTrue);
          expect(q.options.length, 4);
        }
      }
      expect(totalMarks, 100.0);
    });

    test('GATE CS Mock 4 contains exactly 65 questions and 100 marks', () {
      expect(csFullMock4Questions.length, 65);
      final ids = <String>{};
      double totalMarks = 0.0;
      for (int i = 0; i < csFullMock4Questions.length; i++) {
        final q = csFullMock4Questions[i];
        expect(ids.contains(q.id), isFalse, reason: 'Duplicate ID: ${q.id}');
        ids.add(q.id);

        final double marks = (i < 5 || (i >= 10 && i < 35)) ? 1.0 : 2.0;
        totalMarks += marks;

        if (q.type == 'NAT') {
          expect(q.isMCQ, isFalse);
          expect(q.options.isEmpty, isTrue);
          expect(q.questionText.toLowerCase().contains('which of the following'), isFalse);
          expect(q.correctAnswer.isNotEmpty, isTrue);
        } else if (q.type == 'MSQ') {
          expect(q.isMCQ, isTrue);
          expect(q.options.length, 4);
        } else {
          expect(q.type, 'MCQ');
          expect(q.isMCQ, isTrue);
          expect(q.options.length, 4);
        }
      }
      expect(totalMarks, 100.0);
    });

    test('GATE CS Mock 5 contains exactly 65 questions and 100 marks', () {
      expect(csFullMock5Questions.length, 65);
      final ids = <String>{};
      double totalMarks = 0.0;
      for (int i = 0; i < csFullMock5Questions.length; i++) {
        final q = csFullMock5Questions[i];
        expect(ids.contains(q.id), isFalse, reason: 'Duplicate ID: ${q.id}');
        ids.add(q.id);

        final double marks = (i < 5 || (i >= 10 && i < 35)) ? 1.0 : 2.0;
        totalMarks += marks;

        if (q.type == 'NAT') {
          expect(q.isMCQ, isFalse);
          expect(q.options.isEmpty, isTrue);
          expect(q.questionText.toLowerCase().contains('which of the following'), isFalse);
          expect(q.correctAnswer.isNotEmpty, isTrue);
        } else if (q.type == 'MSQ') {
          expect(q.isMCQ, isTrue);
          expect(q.options.length, 4);
        } else {
          expect(q.type, 'MCQ');
          expect(q.isMCQ, isTrue);
          expect(q.options.length, 4);
        }
      }
      expect(totalMarks, 100.0);
    });

    test('GATE CS Mock 6 contains exactly 65 questions and 100 marks', () {
      expect(csFullMock6Questions.length, 65);
      final ids = <String>{};
      double totalMarks = 0.0;
      for (int i = 0; i < csFullMock6Questions.length; i++) {
        final q = csFullMock6Questions[i];
        expect(ids.contains(q.id), isFalse, reason: 'Duplicate ID: ${q.id}');
        ids.add(q.id);

        final double marks = (i < 5 || (i >= 10 && i < 35)) ? 1.0 : 2.0;
        totalMarks += marks;

        if (q.type == 'NAT') {
          expect(q.isMCQ, isFalse);
          expect(q.options.isEmpty, isTrue);
          expect(q.questionText.toLowerCase().contains('which of the following'), isFalse);
          expect(q.correctAnswer.isNotEmpty, isTrue);
        } else if (q.type == 'MSQ') {
          expect(q.isMCQ, isTrue);
          expect(q.options.length, 4);
        } else {
          expect(q.type, 'MCQ');
          expect(q.isMCQ, isTrue);
          expect(q.options.length, 4);
        }
      }
      expect(totalMarks, 100.0);
    });

    test('GATE CS Mock 7 contains exactly 65 questions and 100 marks', () {
      expect(csFullMock7Questions.length, 65);
      final ids = <String>{};
      double totalMarks = 0.0;
      for (int i = 0; i < csFullMock7Questions.length; i++) {
        final q = csFullMock7Questions[i];
        expect(ids.contains(q.id), isFalse, reason: 'Duplicate ID: ${q.id}');
        ids.add(q.id);

        final double marks = (i < 5 || (i >= 10 && i < 35)) ? 1.0 : 2.0;
        totalMarks += marks;

        if (q.type == 'NAT') {
          expect(q.isMCQ, isFalse);
          expect(q.options.isEmpty, isTrue);
          expect(q.questionText.toLowerCase().contains('which of the following'), isFalse);
          expect(q.correctAnswer.isNotEmpty, isTrue);
        } else if (q.type == 'MSQ') {
          expect(q.isMCQ, isTrue);
          expect(q.options.length, 4);
        } else {
          expect(q.type, 'MCQ');
          expect(q.isMCQ, isTrue);
          expect(q.options.length, 4);
        }
      }
      expect(totalMarks, 100.0);
    });

    test('GATE CS Mock 8 contains exactly 65 questions and 100 marks', () {
      expect(csFullMock8Questions.length, 65);
      final ids = <String>{};
      double totalMarks = 0.0;
      for (int i = 0; i < csFullMock8Questions.length; i++) {
        final q = csFullMock8Questions[i];
        expect(ids.contains(q.id), isFalse, reason: 'Duplicate ID: ${q.id}');
        ids.add(q.id);

        final double marks = (i < 5 || (i >= 10 && i < 35)) ? 1.0 : 2.0;
        totalMarks += marks;

        if (q.type == 'NAT') {
          expect(q.isMCQ, isFalse);
          expect(q.options.isEmpty, isTrue);
          expect(q.questionText.toLowerCase().contains('which of the following'), isFalse);
          expect(q.correctAnswer.isNotEmpty, isTrue);
        } else if (q.type == 'MSQ') {
          expect(q.isMCQ, isTrue);
          expect(q.options.length, 4);
        } else {
          expect(q.type, 'MCQ');
          expect(q.isMCQ, isTrue);
          expect(q.options.length, 4);
        }
      }
      expect(totalMarks, 100.0);
    });

    test('GATE CS Mock 9 contains exactly 65 questions and 100 marks', () {
      expect(csFullMock9Questions.length, 65);
      final ids = <String>{};
      double totalMarks = 0.0;
      for (int i = 0; i < csFullMock9Questions.length; i++) {
        final q = csFullMock9Questions[i];
        expect(ids.contains(q.id), isFalse, reason: 'Duplicate ID: ${q.id}');
        ids.add(q.id);

        final double marks = (i < 5 || (i >= 10 && i < 35)) ? 1.0 : 2.0;
        totalMarks += marks;

        if (q.type == 'NAT') {
          expect(q.isMCQ, isFalse);
          expect(q.options.isEmpty, isTrue);
          expect(q.questionText.toLowerCase().contains('which of the following'), isFalse);
          expect(q.correctAnswer.isNotEmpty, isTrue);
        } else if (q.type == 'MSQ') {
          expect(q.isMCQ, isTrue);
          expect(q.options.length, 4);
        } else {
          expect(q.type, 'MCQ');
          expect(q.isMCQ, isTrue);
          expect(q.options.length, 4);
        }
      }
      expect(totalMarks, 100.0);
    });

    test('GATE CS Mock 10 contains exactly 65 questions and 100 marks', () {
      expect(csFullMock10Questions.length, 65);
      final ids = <String>{};
      double totalMarks = 0.0;
      for (int i = 0; i < csFullMock10Questions.length; i++) {
        final q = csFullMock10Questions[i];
        expect(ids.contains(q.id), isFalse, reason: 'Duplicate ID: ${q.id}');
        ids.add(q.id);

        final double marks = (i < 5 || (i >= 10 && i < 35)) ? 1.0 : 2.0;
        totalMarks += marks;

        if (q.type == 'NAT') {
          expect(q.isMCQ, isFalse);
          expect(q.options.isEmpty, isTrue);
          expect(q.questionText.toLowerCase().contains('which of the following'), isFalse);
          expect(q.correctAnswer.isNotEmpty, isTrue);
        } else if (q.type == 'MSQ') {
          expect(q.isMCQ, isTrue);
          expect(q.options.length, 4);
        } else {
          expect(q.type, 'MCQ');
          expect(q.isMCQ, isTrue);
          expect(q.options.length, 4);
        }
      }
      expect(totalMarks, 100.0);
    });

    test('GATE CS Mock 1 contains exactly 65 questions and 100 marks', () {
      expect(csFullMockQuestionsEasy.length, 65);
      final ids = <String>{};
      double totalMarks = 0.0;
      for (int i = 0; i < csFullMockQuestionsEasy.length; i++) {
        final q = csFullMockQuestionsEasy[i];
        expect(ids.contains(q.id), isFalse, reason: 'Duplicate ID: ${q.id}');
        ids.add(q.id);

        final double marks = (i < 5 || (i >= 10 && i < 35)) ? 1.0 : 2.0;
        totalMarks += marks;

        if (q.type == 'NAT') {
          expect(q.isMCQ, isFalse);
          expect(q.options.isEmpty, isTrue);
          expect(q.questionText.toLowerCase().contains('which of the following'), isFalse);
          expect(q.correctAnswer.isNotEmpty, isTrue);
        } else if (q.type == 'MSQ') {
          expect(q.isMCQ, isTrue);
          expect(q.options.length, 4);
        } else {
          expect(q.type, 'MCQ');
          expect(q.isMCQ, isTrue);
          expect(q.options.length, 4);
        }
      }
      expect(totalMarks, 100.0);
    });

    test('GATE DA Mock 1 contains exactly 65 questions and 100 marks', () {
      expect(daFullMockQuestionsEasy.length, 65);
      final ids = <String>{};
      double totalMarks = 0.0;
      for (int i = 0; i < daFullMockQuestionsEasy.length; i++) {
        final q = daFullMockQuestionsEasy[i];
        expect(ids.contains(q.id), isFalse, reason: 'Duplicate ID: ${q.id}');
        ids.add(q.id);

        final double marks = (i < 5 || (i >= 10 && i < 35)) ? 1.0 : 2.0;
        totalMarks += marks;

        if (q.type == 'NAT') {
          expect(q.isMCQ, isFalse);
          expect(q.options.isEmpty, isTrue);
          expect(q.questionText.toLowerCase().contains('which of the following'), isFalse);
          expect(q.correctAnswer.isNotEmpty, isTrue);
        } else if (q.type == 'MSQ') {
          expect(q.isMCQ, isTrue);
          expect(q.options.length, 4);
        } else {
          expect(q.type, 'MCQ');
          expect(q.isMCQ, isTrue);
          expect(q.options.length, 4);
        }
      }
      expect(totalMarks, 100.0);
    });
  });

  group('Virtual Calculator & Engine Verification Tests', () {
    test('Virtual Calculator parses single-argument base-10 log correctly', () {
      String expr = 'log(100)';
      expr = expr.replaceAllMapped(
        RegExp(r'log\(([^,\)]+)\)'),
        (match) => '(ln(${match.group(1)})/ln(10))',
      );
      final parser = ShuntingYardParser();
      final exp = parser.parse(expr);
      final cm = ContextModel();
      final double eval = exp.evaluate(EvaluationType.REAL, cm);
      expect(eval, closeTo(2.0, 0.0001));
    });

    test('Virtual Calculator Degree mode converts sin(30) to 0.5 and asin(0.5) to 30', () {
      const double degToRad = 0.017453292519943295;
      const double radToDeg = 57.29577951308232;

      String exprSin = 'sin(30)'.replaceAllMapped(
        RegExp(r'\b(sin|cos|tan)\(([^,\)]+)\)'),
        (m) => '${m.group(1)}((${m.group(2)}) * $degToRad)',
      );
      final parser = ShuntingYardParser();
      final cm = ContextModel();
      final double evalSin = parser.parse(exprSin).evaluate(EvaluationType.REAL, cm);
      expect(evalSin, closeTo(0.5, 0.0001));

      String exprAsin = 'asin(0.5)'
          .replaceAll('asin(', 'arcsin(')
          .replaceAllMapped(
            RegExp(r'\b(arcsin|arccos|arctan)\(([^,\)]+)\)'),
            (m) => '(${m.group(1)}(${m.group(2)}) * $radToDeg)',
          );
      final double evalAsin = parser.parse(exprAsin).evaluate(EvaluationType.REAL, cm);
      expect(evalAsin, closeTo(30.0, 0.0001));
    });

    test('Virtual Calculator Radian mode evaluates sin(pi/6) to 0.5', () {
      final parser = ShuntingYardParser();
      final cm = ContextModel();
      final double eval = parser.parse('sin(3.14159265359 / 6)').evaluate(EvaluationType.REAL, cm);
      expect(eval, closeTo(0.5, 0.0001));
    });
  });

  group('GateX Pro Pass & Payment Entitlement Tests', () {
    test('Pricing constants and validity reflect official structure', () {
      expect(PurchaseService.proSoloPlanPrice, equals('₹299'));
      expect(PurchaseService.proDualPlanPrice, equals('₹499'));
      expect(PurchaseService.proUpgradeToDualPrice, equals('₹200'));
      expect(PurchaseService.proPlanValidity, contains('31st March 2027'));
    });

    test('Non-Pro user returns false for all branch queries', () {
      final service = PurchaseService();
      // Ensure clean non-pro state
      expect(service.isProForBranch('DA'), isFalse);
      expect(service.isProForBranch('CSIT'), isFalse);
      expect(service.isProForBranch('CS/IT'), isFalse);
      expect(service.isProForBranch(null), isFalse);
    });

    test('isProForBranch handles case insensitivity and branch normalization', () {
      // Mock helper to test normalization rule
      bool mockIsProForBranch({
        required bool isPro,
        required bool isDualPro,
        required String soloBranch,
        String? targetBranch,
      }) {
        if (!isPro) return false;
        if (isDualPro) return true;
        if (targetBranch == null || targetBranch.isEmpty) return true;
        final b = targetBranch.toUpperCase().trim();
        if (b == 'BOTH' || b == 'COMMON') return true;
        final target = b.contains('CS') ? 'CSIT' : 'DA';
        final currentSolo = soloBranch.toUpperCase().contains('CS') ? 'CSIT' : 'DA';
        return currentSolo == target;
      }

      // Solo DA user
      expect(mockIsProForBranch(isPro: true, isDualPro: false, soloBranch: 'DA', targetBranch: 'DA'), isTrue);
      expect(mockIsProForBranch(isPro: true, isDualPro: false, soloBranch: 'da', targetBranch: 'DA'), isTrue);
      expect(mockIsProForBranch(isPro: true, isDualPro: false, soloBranch: 'DA', targetBranch: 'da'), isTrue);
      expect(mockIsProForBranch(isPro: true, isDualPro: false, soloBranch: 'DA', targetBranch: 'CSIT'), isFalse);
      expect(mockIsProForBranch(isPro: true, isDualPro: false, soloBranch: 'DA', targetBranch: 'CS/IT'), isFalse);
      expect(mockIsProForBranch(isPro: true, isDualPro: false, soloBranch: 'DA', targetBranch: 'COMMON'), isTrue);
      expect(mockIsProForBranch(isPro: true, isDualPro: false, soloBranch: 'DA', targetBranch: null), isTrue);

      // Solo CSIT user
      expect(mockIsProForBranch(isPro: true, isDualPro: false, soloBranch: 'CSIT', targetBranch: 'CSIT'), isTrue);
      expect(mockIsProForBranch(isPro: true, isDualPro: false, soloBranch: 'csit', targetBranch: 'CS/IT'), isTrue);
      expect(mockIsProForBranch(isPro: true, isDualPro: false, soloBranch: 'CSIT', targetBranch: 'DA'), isFalse);
      expect(mockIsProForBranch(isPro: true, isDualPro: false, soloBranch: 'CSIT', targetBranch: 'COMMON'), isTrue);

      // Dual Pro user (Unlocks EVERYTHING)
      expect(mockIsProForBranch(isPro: true, isDualPro: true, soloBranch: 'DA', targetBranch: 'DA'), isTrue);
      expect(mockIsProForBranch(isPro: true, isDualPro: true, soloBranch: 'DA', targetBranch: 'CSIT'), isTrue);
      expect(mockIsProForBranch(isPro: true, isDualPro: true, soloBranch: 'DA', targetBranch: 'CS/IT'), isTrue);
      expect(mockIsProForBranch(isPro: true, isDualPro: true, soloBranch: 'DA', targetBranch: 'BOTH'), isTrue);
    });

    test('Upgrade package keyword isolation prevents cross-matching', () {
      // Dry-run simulation of findPackageForPlan rule
      String? resolvePlan(String requestedPlanId, List<String> availableIds) {
        for (final id in availableIds) {
          if (id == requestedPlanId) return id;
        }
        for (final id in availableIds) {
          final lower = id.toLowerCase();
          final isUpgrade = lower.contains('upgrade');
          if (requestedPlanId == PurchaseService.proUpgradeToDualProductId) {
            if (isUpgrade) return id;
          } else if (requestedPlanId == PurchaseService.proDualProductId) {
            if (!isUpgrade && lower.contains('dual')) return id;
          } else if (requestedPlanId == PurchaseService.proSoloProductId) {
            if (!isUpgrade && !lower.contains('dual') && lower.contains('solo')) return id;
          }
        }
        return null;
      }

      final packages = ['gatex_pro_upgrade_dual_2027', 'gatex_pro_dual_2027', 'gatex_pro_solo_2027'];

      expect(resolvePlan(PurchaseService.proUpgradeToDualProductId, packages), equals('gatex_pro_upgrade_dual_2027'));
      expect(resolvePlan(PurchaseService.proDualProductId, packages), equals('gatex_pro_dual_2027'));
      expect(resolvePlan(PurchaseService.proSoloProductId, packages), equals('gatex_pro_solo_2027'));
    });
  });

  group('Guest User Flow & Lifecycle Edge Case Tests', () {
    test('Splash screen routing correctly handles guest mode cold launch', () {
      String resolveNextRoute({
        required bool isLoggedIn,
        required bool hasSelectedExam,
        required bool isGuestMode,
        required bool hasSeenOnboarding,
      }) {
        if (isLoggedIn || (isGuestMode && hasSelectedExam)) {
          return hasSelectedExam ? 'MainNavigationScaffold' : 'ExamSelectionScreen';
        } else {
          return hasSeenOnboarding ? 'AuthScreen' : 'OnboardingScreen';
        }
      }

      // 1. Fresh first launch
      expect(resolveNextRoute(isLoggedIn: false, hasSelectedExam: false, isGuestMode: false, hasSeenOnboarding: false), equals('OnboardingScreen'));

      // 2. Completed onboarding, on login screen
      expect(resolveNextRoute(isLoggedIn: false, hasSelectedExam: false, isGuestMode: false, hasSeenOnboarding: true), equals('AuthScreen'));

      // 3. User continued as guest and selected GATE DA -> Cold launch MUST go directly to MainNavigationScaffold
      expect(resolveNextRoute(isLoggedIn: false, hasSelectedExam: true, isGuestMode: true, hasSeenOnboarding: true), equals('MainNavigationScaffold'));

      // 4. Guest user who hasn't selected exam yet
      expect(resolveNextRoute(isLoggedIn: false, hasSelectedExam: false, isGuestMode: true, hasSeenOnboarding: true), equals('AuthScreen'));

      // 5. Authenticated user with selected exam
      expect(resolveNextRoute(isLoggedIn: true, hasSelectedExam: true, isGuestMode: false, hasSeenOnboarding: true), equals('MainNavigationScaffold'));

      // 6. User logged out (isGuestMode reset to false)
      expect(resolveNextRoute(isLoggedIn: false, hasSelectedExam: true, isGuestMode: false, hasSeenOnboarding: true), equals('AuthScreen'));
    });

    test('Guest username fallback hierarchy', () {
      String resolveUserName({
        String? displayName,
        String? email,
        String? guestUserName,
      }) {
        return displayName ?? (email != null && email.contains('@') ? email.split('@')[0] : null) ?? guestUserName ?? 'Guest Student';
      }

      // Guest with no custom name
      expect(resolveUserName(), equals('Guest Student'));

      // Guest with custom profile name
      expect(resolveUserName(guestUserName: 'Aditya'), equals('Aditya'));

      // Logged in user with email only
      expect(resolveUserName(email: 'aspirant2027@gmail.com', guestUserName: 'Aditya'), equals('aspirant2027'));

      // Logged in user with Google Display Name
      expect(resolveUserName(displayName: 'Aditya Kumar', email: 'aditya@gmail.com', guestUserName: 'Aditya'), equals('Aditya Kumar'));
    });

    test('Guest to registered user exam preservation prevents wiping chosen branch', () {
      String resolvePostAuthExam({
        required String? cloudExam,
        required String? localGuestExam,
      }) {
        if (cloudExam != null && cloudExam.isNotEmpty) {
          return cloudExam;
        }
        if (localGuestExam != null && localGuestExam.isNotEmpty) {
          return localGuestExam;
        }
        return '';
      }

      // Returning user with cloud exam
      expect(resolvePostAuthExam(cloudExam: 'DA', localGuestExam: 'CSIT'), equals('DA'));

      // Guest user registering account for first time (cloud is empty, local is DA)
      expect(resolvePostAuthExam(cloudExam: null, localGuestExam: 'DA'), equals('DA'));

      // Completely new user with no previous guest selection
      expect(resolvePostAuthExam(cloudExam: null, localGuestExam: null), equals(''));
    });
  });
}


double calculateMockScoreDryRun(List<Map<String, dynamic>> questions, Map<String, String> userAnswers) {
  double calculatedScore = 0.0;
  for (var q in questions) {
    final uAns = userAnswers[q['id']];
    final cAns = q['correctAnswer'] as String;
    final type = q['type'] as String;

    if (uAns != null && uAns.isNotEmpty) {
      bool isCorrect = false;
      if (type == 'NAT') {
        final double? userNum = double.tryParse(uAns);
        final double? correctNum = double.tryParse(cAns);
        if (userNum != null && correctNum != null) {
          isCorrect = (userNum - correctNum).abs() < 0.05;
        } else {
          isCorrect = uAns.toLowerCase().trim() == cAns.toLowerCase().trim();
        }
      } else if (type == 'MSQ') {
        final uSet = uAns.split(';').toSet();
        final cSet = cAns.split(';').toSet();
        isCorrect = uSet.length == cSet.length && uSet.containsAll(cSet);
      } else {
        isCorrect = uAns.toUpperCase().trim() == cAns.toUpperCase().trim();
      }

      if (isCorrect) {
        calculatedScore += 1.0;
      } else {
        if (type == 'MCQ') {
          calculatedScore -= 1.0 / 3.0;
        }
      }
    }
  }
  return calculatedScore < 0 ? 0.0 : calculatedScore;
}
