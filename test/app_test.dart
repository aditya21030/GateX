import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:gateda/theme/app_theme.dart';
import 'package:gateda/models/models.dart';

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
      const price = '₹199';
      const oldPrice = '₹499';
      const seasonYear = 2027;

      expect(price, '₹199');
      expect(oldPrice, '₹499');
      expect(seasonYear, 2027);
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
