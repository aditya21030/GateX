import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../models/models.dart';
import '../theme/app_theme.dart';
import '../providers/app_provider.dart';
import '../services/ad_service.dart';
import '../widgets/virtual_calculator.dart';
import '../widgets/neu_widgets.dart';

enum GateQuestionStatus {
  notVisited,
  notAnswered,
  answered,
  markedForReview,
  answeredAndMarked,
}

class MockTestRunnerScreen extends StatefulWidget {
  final List<PYQ> questions;
  final Duration duration;
  final String testName;

  const MockTestRunnerScreen({
    super.key,
    required this.questions,
    required this.duration,
    required this.testName,
  });

  @override
  State<MockTestRunnerScreen> createState() => _MockTestRunnerScreenState();
}

class _MockTestRunnerScreenState extends State<MockTestRunnerScreen> {
  // Navigation
  int _currentIndex = 0;

  // Answers mapping: questionId -> userAnswer
  final Map<String, String> _userAnswers = {};

  // Marked for review questions
  final Set<String> _markedForReview = {};

  // Visited questions
  final Set<String> _visitedQuestions = {};

  // Timer
  late int _secondsRemaining;
  Timer? _timer;
  late DateTime _startTime;

  // Test state
  bool _isTestSubmitted = false;

  // Local MSQ choices: questionId -> Set of options
  final Map<String, Set<String>> _msqSelections = {};

  // NAT controllers: questionId -> Controller
  final Map<String, TextEditingController> _natControllers = {};

  // Question Navigator section filter (0 = All, 1 = Section 1 GA, 2 = Section 2 Core)
  int _navigatorSectionIndex = 0;

  // Scorecard review filter ('All', 'Incorrect', 'Correct', 'Unattempted')
  String _reviewFilter = 'All';

  static final Map<String, Widget> _questionWidgetCache = {};

  @override
  void initState() {
    super.initState();
    AdService().setAdSuspended(true);
    _secondsRemaining = widget.duration.inSeconds;
    _startTime = DateTime.now();

    if (widget.questions.isNotEmpty) {
      _visitedQuestions.add(widget.questions[0].id);
    }

    // Initialize NAT controllers
    for (var q in widget.questions) {
      if (!q.isMCQ) {
        _natControllers[q.id] = TextEditingController();
      }
    }

    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        _timer?.cancel();
        _autoSubmitTest();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    AdService().setAdSuspended(false);
    for (var controller in _natControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  String _formatTime(int totalSeconds) {
    final int hours = totalSeconds ~/ 3600;
    final int minutes = (totalSeconds % 3600) ~/ 60;
    final int seconds = totalSeconds % 60;

    final String minStr = minutes.toString().padLeft(2, '0');
    final String secStr = seconds.toString().padLeft(2, '0');

    if (hours > 0) {
      final String hourStr = hours.toString().padLeft(2, '0');
      return '$hourStr:$minStr:$secStr';
    }
    return '$minStr:$secStr';
  }

  // --- Official GATE 5-State Status Helper ---
  GateQuestionStatus _getQuestionStatus(int index) {
    final q = widget.questions[index];
    final hasAns = _userAnswers.containsKey(q.id) && _userAnswers[q.id]!.trim().isNotEmpty;
    final isMarked = _markedForReview.contains(q.id);
    final isVisited = _visitedQuestions.contains(q.id);

    if (isMarked && hasAns) return GateQuestionStatus.answeredAndMarked;
    if (isMarked && !hasAns) return GateQuestionStatus.markedForReview;
    if (hasAns) return GateQuestionStatus.answered;
    if (isVisited) return GateQuestionStatus.notAnswered;
    return GateQuestionStatus.notVisited;
  }

  int get _answeredCount => widget.questions.where((q) {
        final hasAns = _userAnswers.containsKey(q.id) && _userAnswers[q.id]!.trim().isNotEmpty;
        final isMarked = _markedForReview.contains(q.id);
        return hasAns && !isMarked;
      }).length;

  int get _answeredAndMarkedCount => widget.questions.where((q) {
        final hasAns = _userAnswers.containsKey(q.id) && _userAnswers[q.id]!.trim().isNotEmpty;
        final isMarked = _markedForReview.contains(q.id);
        return hasAns && isMarked;
      }).length;

  int get _markedForReviewCount => widget.questions.where((q) {
        final hasAns = _userAnswers.containsKey(q.id) && _userAnswers[q.id]!.trim().isNotEmpty;
        final isMarked = _markedForReview.contains(q.id);
        return !hasAns && isMarked;
      }).length;

  int get _notAnsweredCount => widget.questions.where((q) {
        final hasAns = _userAnswers.containsKey(q.id) && _userAnswers[q.id]!.trim().isNotEmpty;
        final isMarked = _markedForReview.contains(q.id);
        final isVisited = _visitedQuestions.contains(q.id);
        return !hasAns && !isMarked && isVisited;
      }).length;

  int get _notVisitedCount => widget.questions.where((q) {
        return !_visitedQuestions.contains(q.id);
      }).length;

  bool get _isFullMock => widget.questions.length >= 65;

  double _getQuestionWeight(int index) {
    if (_isFullMock) {
      if ((index >= 0 && index < 5) || (index >= 10 && index < 35)) {
        return 1.0;
      }
      return 2.0;
    }
    return 1.0;
  }

  double _getQuestionNegativeMarks(int index) {
    final q = widget.questions[index];
    if (q.type != 'MCQ') return 0.0;
    return _getQuestionWeight(index) / 3.0;
  }

  String _getSectionName(int index) {
    final q = widget.questions[index];
    if (_isFullMock) {
      return index < 10 ? 'Section 1: General Aptitude' : 'Section 2: Subject Core';
    }
    if (q.subject.toLowerCase().contains('aptitude')) {
      return 'Section 1: General Aptitude';
    }
    return q.subject;
  }

  void _syncCurrentInput() {
    if (_currentIndex < 0 || _currentIndex >= widget.questions.length) return;
    final q = widget.questions[_currentIndex];
    if (!q.isMCQ) {
      final text = _natControllers[q.id]?.text.trim() ?? '';
      if (text.isNotEmpty) {
        _userAnswers[q.id] = text;
      } else {
        _userAnswers.remove(q.id);
      }
    } else if (q.type == 'MSQ') {
      final selections = _msqSelections[q.id];
      if (selections != null && selections.isNotEmpty) {
        final sorted = selections.toList()..sort();
        _userAnswers[q.id] = sorted.join(';');
      } else {
        _userAnswers.remove(q.id);
      }
    }
  }

  void _clearCurrentAnswer() {
    final q = widget.questions[_currentIndex];
    HapticFeedback.lightImpact();
    setState(() {
      _userAnswers.remove(q.id);
      if (q.type == 'MSQ') {
        _msqSelections[q.id]?.clear();
      } else if (!q.isMCQ) {
        _natControllers[q.id]?.clear();
      }
    });
  }

  void _saveAndNext() {
    HapticFeedback.selectionClick();
    _syncCurrentInput();
    final q = widget.questions[_currentIndex];

    setState(() {
      // If answered, remove from marked for review to become explicitly Answered
      if (_userAnswers.containsKey(q.id) && _userAnswers[q.id]!.trim().isNotEmpty) {
        _markedForReview.remove(q.id);
      }

      if (_currentIndex < widget.questions.length - 1) {
        _currentIndex++;
        _visitedQuestions.add(widget.questions[_currentIndex].id);
      } else {
        _showSubmitConfirmation();
      }
    });
  }

  void _markForReviewAndNext() {
    HapticFeedback.selectionClick();
    _syncCurrentInput();
    final q = widget.questions[_currentIndex];

    setState(() {
      _markedForReview.add(q.id);
      if (_currentIndex < widget.questions.length - 1) {
        _currentIndex++;
        _visitedQuestions.add(widget.questions[_currentIndex].id);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Marked for Review. This is the last question.'),
            duration: Duration(seconds: 2),
            backgroundColor: Color(0xFF7B1FA2),
          ),
        );
      }
    });
  }

  void _jumpToQuestion(int index) {
    _syncCurrentInput();
    setState(() {
      _currentIndex = index;
      _visitedQuestions.add(widget.questions[index].id);
    });
  }

  void _autoSubmitTest() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Time is up! Submitting your examination automatically.'),
        backgroundColor: AppTheme.error,
        duration: Duration(seconds: 3),
      ),
    );
    _calculateAndSubmit();
  }

  void _calculateAndSubmit() {
    _timer?.cancel();
    _syncCurrentInput();

    // Sync all NAT inputs
    _natControllers.forEach((qId, controller) {
      final text = controller.text.trim();
      if (text.isNotEmpty) {
        _userAnswers[qId] = text;
      }
    });

    // Sync all MSQ choices
    _msqSelections.forEach((qId, selections) {
      if (selections.isNotEmpty) {
        final sorted = selections.toList()..sort();
        _userAnswers[qId] = sorted.join(';');
      }
    });

    double totalScore = 0.0;
    double maxPossibleMarks = 0.0;
    int correctCount = 0;
    int incorrectCount = 0;
    int unattemptedCount = 0;

    double gaScore = 0.0;
    double coreScore = 0.0;

    final Map<String, List<int>> subjectPerformance = {}; // subject -> [correct, total]

    for (int i = 0; i < widget.questions.length; i++) {
      final q = widget.questions[i];
      final weight = _getQuestionWeight(i);
      maxPossibleMarks += weight;

      final uAns = _userAnswers[q.id];

      // Track subject performance
      subjectPerformance.putIfAbsent(q.subject, () => [0, 0]);
      subjectPerformance[q.subject]![1]++;

      final isGa = _isFullMock ? i < 10 : q.subject.toLowerCase().contains('aptitude');

      if (uAns == null || uAns.trim().isEmpty) {
        unattemptedCount++;
      } else {
        final isCorrect = q.isAnswerCorrect(uAns);

        if (isCorrect) {
          correctCount++;
          totalScore += weight;
          if (isGa) {
            gaScore += weight;
          } else {
            coreScore += weight;
          }
          subjectPerformance[q.subject]![0]++;
        } else {
          incorrectCount++;
          if (q.type == 'MCQ') {
            final penalty = weight / 3.0;
            totalScore -= penalty;
            if (isGa) {
              gaScore -= penalty;
            } else {
              coreScore -= penalty;
            }
          }
        }
      }
    }

    if (totalScore < 0) totalScore = 0.0;

    final double percentageScore = maxPossibleMarks > 0 ? (totalScore / maxPossibleMarks) * 100.0 : 0.0;

    // Identify weak subjects (< 50% accuracy)
    final List<String> weakSubjects = [];
    subjectPerformance.forEach((subject, counts) {
      final corr = counts[0];
      final tot = counts[1];
      if (tot > 0 && (corr / tot) < 0.5) {
        weakSubjects.add(subject);
      }
    });

    final timeTakenMinutes = DateTime.now().difference(_startTime).inMinutes;

    // Save Mock Test Log
    final provider = Provider.of<AppProvider>(context, listen: false);
    provider.addMockTest(
      widget.testName,
      DateTime.now(),
      percentageScore,
      weakSubjects,
      'GATE CBT Mock Completed.\nScore: ${totalScore.toStringAsFixed(2)} / ${maxPossibleMarks.toStringAsFixed(0)} (Aptitude: ${gaScore.toStringAsFixed(1)}, Core: ${coreScore.toStringAsFixed(1)})\nAccuracy: ${(correctCount / (correctCount + incorrectCount > 0 ? correctCount + incorrectCount : 1) * 100).toStringAsFixed(1)}%\nCorrect: $correctCount, Incorrect: $incorrectCount, Unattempted: $unattemptedCount\nTime: $timeTakenMinutes mins',
    );

    AdService().showInterstitialAd();

    setState(() {
      _isTestSubmitted = true;
    });
  }

  Future<bool> _onWillPop() async {
    if (_isTestSubmitted) return true;

    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppTheme.surface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: AppTheme.error),
              SizedBox(width: 8),
              Text('Exit Mock Exam?', style: TextStyle(color: AppTheme.error, fontWeight: FontWeight.bold, fontSize: 16)),
            ],
          ),
          content: const Text(
            'Are you sure you want to exit? Your exam progress will be lost and this attempt will not be recorded.',
            style: TextStyle(color: AppTheme.textSecondary, fontSize: 13, height: 1.4),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Resume Test', style: TextStyle(color: AppTheme.textSecondary)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.error,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Exit Exam', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );

    return confirm ?? false;
  }

  void _showSubmitConfirmation() {
    _syncCurrentInput();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppTheme.surface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Row(
            children: [
              Icon(Icons.assignment_turned_in_rounded, color: AppTheme.secondary),
              SizedBox(width: 8),
              Text('Submit Examination?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Review your attempt summary before final submission:',
                style: TextStyle(color: AppTheme.textSecondary, fontSize: 12),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: AppTheme.background,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                child: Column(
                  children: [
                    _buildSubmitSummaryRow('Total Questions', '${widget.questions.length}', Colors.white),
                    const Divider(color: Colors.white10, height: 16),
                    _buildSubmitSummaryRow('🟢 Answered', '$_answeredCount', AppTheme.success),
                    const SizedBox(height: 6),
                    _buildSubmitSummaryRow('🟣🟢 Ans & Marked (Evaluated)', '$_answeredAndMarkedCount', const Color(0xFFBA68C8)),
                    const SizedBox(height: 6),
                    _buildSubmitSummaryRow('🟣 Marked for Review', '$_markedForReviewCount', const Color(0xFFBA68C8)),
                    const SizedBox(height: 6),
                    _buildSubmitSummaryRow('🔴 Not Answered', '$_notAnsweredCount', AppTheme.error),
                    const SizedBox(height: 6),
                    _buildSubmitSummaryRow('⚪ Not Visited', '$_notVisitedCount', AppTheme.textSecondary),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Note: Questions in "Answered & Marked for Review" will be evaluated for marks as per official GATE rules.',
                style: TextStyle(color: AppTheme.textSecondary, fontSize: 11, fontStyle: FontStyle.italic),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Resume Test', style: TextStyle(color: AppTheme.textSecondary)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.secondary,
                foregroundColor: AppTheme.background,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              ),
              onPressed: () {
                Navigator.pop(context);
                _calculateAndSubmit();
              },
              child: const Text('Submit Exam', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSubmitSummaryRow(String label, String value, Color valueColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
        Text(value, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: valueColor)),
      ],
    );
  }

  // --- Official GATE 5-State Question Palette Modal Bottom Sheet ---
  void _showQuestionsMapSheet() {
    _syncCurrentInput();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppTheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            List<int> displayedIndices = [];
            if (_isFullMock) {
              if (_navigatorSectionIndex == 1) {
                displayedIndices = List.generate(10, (i) => i);
              } else if (_navigatorSectionIndex == 2) {
                displayedIndices = List.generate(55, (i) => i + 10);
              } else {
                displayedIndices = List.generate(widget.questions.length, (i) => i);
              }
            } else {
              displayedIndices = List.generate(widget.questions.length, (i) => i);
            }

            return Container(
              height: MediaQuery.of(context).size.height * 0.85,
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'GATE Question Palette',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: AppTheme.textSecondary),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // 5 Official TCS iON Status Badges
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppTheme.background,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 8,
                      children: [
                        _buildLegendPill(AppTheme.success, 'Answered', '$_answeredCount', isCircle: false),
                        _buildLegendPill(AppTheme.error, 'Not Answered', '$_notAnsweredCount', isCircle: false),
                        _buildLegendPill(const Color(0xFF7B1FA2), 'Marked for Review', '$_markedForReviewCount', isCircle: true),
                        _buildLegendPill(const Color(0xFF7B1FA2), 'Ans & Marked', '$_answeredAndMarkedCount', isCircle: true, hasGreenDot: true),
                        _buildLegendPill(AppTheme.surface, 'Not Visited', '$_notVisitedCount', isCircle: false, isBordered: true),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Section filter tabs (if full mock)
                  if (_isFullMock) ...[
                    Row(
                      children: [
                        _buildSectionPill(0, 'All (65)', setSheetState),
                        const SizedBox(width: 8),
                        _buildSectionPill(1, 'Section 1: GA (10)', setSheetState),
                        const SizedBox(width: 8),
                        _buildSectionPill(2, 'Section 2: Core (55)', setSheetState),
                      ],
                    ),
                    const SizedBox(height: 12),
                  ],

                  // Question Numbers Grid
                  Expanded(
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.15,
                      ),
                      itemCount: displayedIndices.length,
                      itemBuilder: (context, i) {
                        final questionIndex = displayedIndices[i];
                        final isCurrent = questionIndex == _currentIndex;
                        return _buildQuestionGridItem(questionIndex, isCurrent);
                      },
                    ),
                  ),

                  // Bottom note on evaluation
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppTheme.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppTheme.primary.withValues(alpha: 0.2)),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.info_outline, size: 14, color: AppTheme.primary),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Questions marked as "Ans & Marked" (🟣🟢) will be considered for marks in GATE.',
                            style: TextStyle(fontSize: 11, color: AppTheme.textSecondary),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildSectionPill(int index, String label, StateSetter setSheetState) {
    final isSelected = _navigatorSectionIndex == index;
    return Expanded(
      child: InkWell(
        onTap: () {
          setSheetState(() {
            _navigatorSectionIndex = index;
          });
          setState(() {
            _navigatorSectionIndex = index;
          });
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.primary : AppTheme.background,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? AppTheme.primary : Colors.white.withValues(alpha: 0.1),
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 10.5,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Colors.white : AppTheme.textSecondary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLegendPill(Color color, String label, String count, {bool isCircle = false, bool hasGreenDot = false, bool isBordered = false}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: color,
                shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
                borderRadius: isCircle ? null : BorderRadius.circular(3),
                border: isBordered ? Border.all(color: Colors.white24, width: 1.2) : null,
              ),
            ),
            if (hasGreenDot)
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: AppTheme.success,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(width: 5),
        Text(
          '$label: $count',
          style: const TextStyle(color: AppTheme.textSecondary, fontSize: 10.5, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildQuestionGridItem(int index, bool isCurrent) {
    final status = _getQuestionStatus(index);

    Color bgColor;
    Color borderColor;
    Color textColor = Colors.white;
    BoxShape shape = BoxShape.rectangle;
    BorderRadius? borderRadius = BorderRadius.circular(6);
    Widget? indicatorBadge;

    switch (status) {
      case GateQuestionStatus.answered:
        bgColor = AppTheme.success;
        borderColor = AppTheme.success;
        break;
      case GateQuestionStatus.notAnswered:
        bgColor = AppTheme.error;
        borderColor = AppTheme.error;
        break;
      case GateQuestionStatus.markedForReview:
        bgColor = const Color(0xFF7B1FA2);
        borderColor = const Color(0xFF9C27B0);
        shape = BoxShape.circle;
        borderRadius = null;
        break;
      case GateQuestionStatus.answeredAndMarked:
        bgColor = const Color(0xFF7B1FA2);
        borderColor = const Color(0xFF9C27B0);
        shape = BoxShape.circle;
        borderRadius = null;
        indicatorBadge = Positioned(
          right: 2,
          bottom: 2,
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: AppTheme.success,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1.2),
            ),
          ),
        );
        break;
      case GateQuestionStatus.notVisited:
        bgColor = AppTheme.surface;
        borderColor = Colors.white.withValues(alpha: 0.12);
        textColor = AppTheme.textSecondary;
        break;
    }

    return InkWell(
      onTap: () {
        Navigator.pop(context);
        _jumpToQuestion(index);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: bgColor,
              shape: shape,
              borderRadius: borderRadius,
              border: Border.all(
                color: isCurrent ? AppTheme.secondary : borderColor,
                width: isCurrent ? 2.5 : 1.2,
              ),
              boxShadow: isCurrent
                  ? [
                      BoxShadow(
                        color: AppTheme.secondary.withValues(alpha: 0.4),
                        blurRadius: 8,
                      ),
                    ]
                  : null,
            ),
            child: Text(
              '${index + 1}',
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
          ?indicatorBadge,
        ],
      ),
    );
  }

  // --- Monospace & Formula Formatter ---
  Widget _buildQuestionText(String text, {bool isExplanation = false, Color? textColor}) {
    final cacheKey = '${text.hashCode}_${isExplanation}_${textColor?.value}';
    if (_questionWidgetCache.containsKey(cacheKey)) {
      return _questionWidgetCache[cacheKey]!;
    }

    final lines = text.split('\n');
    final List<Widget> widgets = [];

    List<String> currentBlock = [];
    bool isMonospaceBlock = false;

    void flushBlock() {
      if (currentBlock.isEmpty) return;
      final blockText = currentBlock.join('\n');
      if (isMonospaceBlock) {
        widgets.add(
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              color: isExplanation
                  ? AppTheme.secondary.withValues(alpha: 0.04)
                  : AppTheme.surface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: (isExplanation ? AppTheme.secondary : AppTheme.textSecondary).withValues(alpha: 0.1),
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Text(
                blockText,
                style: AppTheme.monospaceStyle(
                  fontSize: 11.5,
                  color: textColor ?? AppTheme.textPrimary,
                ),
              ),
            ),
          ),
        );
      } else {
        widgets.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              blockText,
              style: TextStyle(
                fontSize: isExplanation ? 13 : 15,
                fontWeight: isExplanation ? FontWeight.normal : FontWeight.w500,
                color: textColor ?? AppTheme.textPrimary,
                height: 1.4,
              ),
            ),
          ),
        );
      }
      currentBlock = [];
    }

    for (final line in lines) {
      final trimmed = line.trim();

      if (trimmed.startsWith('```')) {
        flushBlock();
        isMonospaceBlock = !isMonospaceBlock;
        continue;
      }

      bool hasBoxDrawing = false;
      for (int i = 0; i < line.length; i++) {
        final code = line.codeUnitAt(i);
        if (code >= 0x2500 && code <= 0x257F) {
          hasBoxDrawing = true;
          break;
        }
      }

      final isCodeOrTableLine =
          hasBoxDrawing ||
          trimmed.startsWith('|') ||
          trimmed.startsWith('def ') ||
          trimmed.startsWith('if ') ||
          trimmed.startsWith('elif ') ||
          trimmed.startsWith('else:') ||
          trimmed.startsWith('return ') ||
          trimmed.startsWith('print(') ||
          trimmed.startsWith('for ') ||
          trimmed.startsWith('while ') ||
          trimmed.startsWith('SELECT') ||
          trimmed.startsWith('FROM') ||
          trimmed.startsWith('WHERE') ||
          trimmed.startsWith('AND ') ||
          trimmed.startsWith('OR ') ||
          trimmed.startsWith('GROUP BY') ||
          trimmed.startsWith('ORDER BY') ||
          trimmed.startsWith('M =') ||
          trimmed.startsWith('Table:') ||
          trimmed.startsWith('Table C:') ||
          trimmed.startsWith('Distance Matrix:') ||
          trimmed.startsWith('Table 1:') ||
          trimmed.startsWith('Table 2:') ||
          trimmed.startsWith('Table 3:') ||
          trimmed.startsWith('Table 4:') ||
          trimmed.contains('if x <') ||
          trimmed.contains('if x >') ||
          trimmed.contains('if x ∈') ||
          trimmed.startsWith('f(x) =') ||
          trimmed.startsWith('f(x) = {') ||
          trimmed.startsWith('f(x) ={') ||
          trimmed.startsWith('{') ||
          trimmed.startsWith('-x,') ||
          trimmed.startsWith('-x ,') ||
          trimmed.startsWith('x,') ||
          trimmed.startsWith('x ,') ||
          trimmed.startsWith('ax2') ||
          trimmed.startsWith('ax²') ||
          trimmed.startsWith('x²');

      if (isCodeOrTableLine) {
        if (!isMonospaceBlock && currentBlock.isNotEmpty) {
          flushBlock();
        }
        isMonospaceBlock = true;
        currentBlock.add(line);
      } else {
        if (trimmed.isEmpty) {
          currentBlock.add(line);
        } else {
          if (isMonospaceBlock && currentBlock.isNotEmpty) {
            flushBlock();
          }
          isMonospaceBlock = false;
          currentBlock.add(line);
        }
      }
    }
    flushBlock();

    final result = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
    _questionWidgetCache[cacheKey] = result;
    return result;
  }

  @override
  Widget build(BuildContext context) {
    if (_isTestSubmitted) {
      return _buildScoreSummaryScreen();
    }

    final q = widget.questions[_currentIndex];
    final bool isLowTime = _secondsRemaining < 300; // 5 minutes
    final double weight = _getQuestionWeight(_currentIndex);
    final double negMarks = _getQuestionNegativeMarks(_currentIndex);
    final String sectionName = _getSectionName(_currentIndex);
    final status = _getQuestionStatus(_currentIndex);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final shouldPop = await _onWillPop();
        if (shouldPop && context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.testName, style: AppTheme.poppinsBold(fontSize: 15)),
          leading: IconButton(
            icon: const Icon(Icons.close_rounded),
            onPressed: () async {
              final shouldPop = await _onWillPop();
              if (shouldPop && context.mounted) {
                Navigator.of(context).pop();
              }
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.calculate_outlined),
              tooltip: 'GATE Virtual Calculator',
              onPressed: () {
                VirtualCalculator.show(context);
              },
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: isLowTime ? AppTheme.error.withValues(alpha: 0.15) : AppTheme.surface,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: isLowTime ? AppTheme.error : Colors.white12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.timer_outlined,
                    size: 15,
                    color: isLowTime ? AppTheme.error : AppTheme.secondary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    _formatTime(_secondsRemaining),
                    style: AppTheme.timerStyle(
                      fontSize: 14,
                      color: isLowTime ? AppTheme.error : AppTheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 6),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: AppTheme.secondary,
                visualDensity: VisualDensity.compact,
              ),
              onPressed: _showSubmitConfirmation,
              child: const Text('SUBMIT', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              children: [
                // Top Progress Strip
                LinearProgressIndicator(
                  value: (_currentIndex + 1) / widget.questions.length,
                  backgroundColor: AppTheme.surface,
                  valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.secondary),
                  minHeight: 3.5,
                ),

                // Question Metadata Strip (Section, Marks, Type, Status)
                Container(
                  color: AppTheme.surface,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      // Section Chip
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppTheme.background,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
                        ),
                        child: Text(
                          sectionName,
                          style: const TextStyle(color: AppTheme.secondary, fontSize: 11, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 8),

                      // Marking Scheme Chip
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppTheme.background,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          negMarks > 0
                              ? '+${weight.toStringAsFixed(0)} | -${negMarks.toStringAsFixed(2)}'
                              : '+${weight.toStringAsFixed(0)} | 0.00',
                          style: const TextStyle(color: AppTheme.textSecondary, fontSize: 11, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Spacer(),

                      // Current Status Indicator Pill
                      _buildCurrentStatusChip(status),
                    ],
                  ),
                ),

                // Main Scrollable Question Area
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: AppTheme.primary.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                'Question ${_currentIndex + 1} of ${widget.questions.length}',
                                style: const TextStyle(
                                  color: AppTheme.primary,
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: q.type == 'MSQ'
                                    ? AppTheme.error.withValues(alpha: 0.15)
                                    : q.type == 'NAT'
                                        ? AppTheme.success.withValues(alpha: 0.15)
                                        : AppTheme.primary.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                q.type,
                                style: TextStyle(
                                  color: q.type == 'MSQ'
                                      ? AppTheme.error
                                      : q.type == 'NAT'
                                          ? AppTheme.success
                                          : AppTheme.primary,
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),

                        // Subject & Topic Path
                        Text(
                          '${q.subject} > ${q.topic}',
                          style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12),
                        ),
                        const SizedBox(height: 14),

                        // Question Body Text
                        _buildQuestionText(q.questionText),

                        // Diagram or Question Image
                        if (q.hasImage && q.imagePath != null) ...[
                          const SizedBox(height: 16),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              color: AppTheme.textPrimary.withValues(alpha: 0.05),
                              padding: const EdgeInsets.all(8),
                              child: q.imagePath!.startsWith('http')
                                  ? Image.network(
                                      q.imagePath!,
                                      fit: BoxFit.contain,
                                      errorBuilder: (context, err, stack) => const SizedBox(),
                                    )
                                  : Image.asset(
                                      q.imagePath!,
                                      fit: BoxFit.contain,
                                      errorBuilder: (context, err, stack) => const SizedBox(),
                                    ),
                            ),
                          ),
                        ],
                        const SizedBox(height: 24),

                        // Answer Options (MCQ, MSQ, or NAT)
                        if (q.isMCQ) _buildMockMCQOptions(q) else _buildMockNATInput(q),
                      ],
                    ),
                  ),
                ),

                // TCS iON Official Bottom Action Bar
                Container(
                  color: context.scaffoldBackground,
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  child: SafeArea(
                    top: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            // 1. Mark for Review & Next
                            Expanded(
                              flex: 3,
                              child: NeuButton(
                                onPressed: _markForReviewAndNext,
                                isPrimary: false,
                                borderRadius: 12,
                                height: 42,
                                child: const Text(
                                  'Mark & Next',
                                  style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold, color: Color(0xFFBA68C8)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),

                            // 2. Clear Response
                            Expanded(
                              flex: 2,
                              child: NeuButton(
                                onPressed: _clearCurrentAnswer,
                                isPrimary: false,
                                borderRadius: 12,
                                height: 42,
                                child: const Text(
                                  'Clear',
                                  style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold, color: AppTheme.error),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),

                            // 3. Question Palette Trigger
                            GestureDetector(
                              onTap: _showQuestionsMapSheet,
                              child: const NeuContainer(
                                borderRadius: 12,
                                padding: EdgeInsets.all(10),
                                child: Icon(Icons.grid_view_rounded, color: AppTheme.accentPurple, size: 20),
                              ),
                            ),
                            const SizedBox(width: 8),

                            // 4. Save & Next
                            Expanded(
                              flex: 4,
                              child: NeuButton(
                                onPressed: _saveAndNext,
                                isPrimary: true,
                                borderRadius: 12,
                                height: 42,
                                child: Text(
                                  _currentIndex == widget.questions.length - 1 ? 'Submit' : 'Save & Next',
                                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (_currentIndex > 0) ...[
                          const SizedBox(height: 6),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: () {
                                HapticFeedback.selectionClick();
                                _syncCurrentInput();
                                setState(() {
                                  _currentIndex--;
                                  _visitedQuestions.add(widget.questions[_currentIndex].id);
                                });
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.chevron_left_rounded, size: 16, color: AppTheme.textSecondary),
                                    Text('Previous Question', style: TextStyle(color: AppTheme.textSecondary, fontSize: 11)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentStatusChip(GateQuestionStatus status) {
    Color bg;
    Color fg;
    String label;

    switch (status) {
      case GateQuestionStatus.answered:
        bg = AppTheme.success.withValues(alpha: 0.15);
        fg = AppTheme.success;
        label = 'Answered';
        break;
      case GateQuestionStatus.notAnswered:
        bg = AppTheme.error.withValues(alpha: 0.15);
        fg = AppTheme.error;
        label = 'Not Answered';
        break;
      case GateQuestionStatus.markedForReview:
        bg = const Color(0xFF7B1FA2).withValues(alpha: 0.2);
        fg = const Color(0xFFBA68C8);
        label = 'Marked';
        break;
      case GateQuestionStatus.answeredAndMarked:
        bg = const Color(0xFF7B1FA2).withValues(alpha: 0.2);
        fg = const Color(0xFFBA68C8);
        label = 'Ans & Marked';
        break;
      case GateQuestionStatus.notVisited:
        bg = Colors.white.withValues(alpha: 0.05);
        fg = AppTheme.textSecondary;
        label = 'Not Visited';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(color: fg, fontSize: 11, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildMockMCQOptions(PYQ q) {
    if (q.type == 'MSQ') {
      _msqSelections[q.id] ??= {};
    }

    return Column(
      children: List.generate(q.options.length, (index) {
        final option = q.options[index];
        final letter = String.fromCharCode(65 + index); // A, B, C, D
        final isSelected = q.type == 'MSQ'
            ? _msqSelections[q.id]!.contains(letter)
            : _userAnswers[q.id] == letter;

        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: GestureDetector(
            onTap: () {
              HapticFeedback.selectionClick();
              setState(() {
                if (q.type == 'MSQ') {
                  if (_msqSelections[q.id]!.contains(letter)) {
                    _msqSelections[q.id]!.remove(letter);
                  } else {
                    _msqSelections[q.id]!.add(letter);
                  }
                  if (_msqSelections[q.id]!.isEmpty) {
                    _userAnswers.remove(q.id);
                  } else {
                    final sorted = _msqSelections[q.id]!.toList()..sort();
                    _userAnswers[q.id] = sorted.join(';');
                  }
                } else {
                  _userAnswers[q.id] = letter;
                }
              });
            },
            child: NeuContainer(
              isRecessed: isSelected,
              borderRadius: 14,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NeuContainer(
                    isRecessed: !isSelected,
                    borderRadius: q.type == 'MSQ' ? 6 : 14,
                    padding: const EdgeInsets.all(5),
                    child: SizedBox(
                      width: 18,
                      height: 18,
                      child: Center(
                        child: Text(
                          letter,
                          style: TextStyle(
                            color: isSelected ? AppTheme.accentPurple : context.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildQuestionText(
                      option,
                      isExplanation: true,
                      textColor: isSelected ? AppTheme.accentPurple : context.textColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildMockNATInput(PYQ q) {
    final controller = _natControllers[q.id] ??= TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Numerical Answer (NAT):',
          style: TextStyle(fontSize: 12, color: context.textSecondaryColor, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        NeuContainer(
          isRecessed: true,
          borderRadius: 14,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
          child: TextFormField(
            controller: controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
            style: TextStyle(color: context.textColor, fontSize: 16, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              hintText: 'e.g. 14.5 or -0.33',
              hintStyle: TextStyle(color: context.textSecondaryColor, fontSize: 14),
              border: InputBorder.none,
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
              prefixIcon: const Icon(Icons.pin_rounded, size: 18, color: AppTheme.accentPurple),
            ),
            onChanged: (val) {
              if (val.trim().isNotEmpty) {
                _userAnswers[q.id] = val.trim();
              } else {
                _userAnswers.remove(q.id);
              }
            },
          ),
        ),
      ],
    );
  }

  // --- Official GATE CBT Scorecard & Analysis Screen ---
  Widget _buildScoreSummaryScreen() {
    double totalScore = 0.0;
    double maxPossibleMarks = 0.0;
    int correctCount = 0;
    int incorrectCount = 0;
    int unattemptedCount = 0;

    double gaScore = 0.0;
    double coreScore = 0.0;

    for (int i = 0; i < widget.questions.length; i++) {
      final q = widget.questions[i];
      final weight = _getQuestionWeight(i);
      maxPossibleMarks += weight;
      final uAns = _userAnswers[q.id];
      final isGa = _isFullMock ? i < 10 : q.subject.toLowerCase().contains('aptitude');

      if (uAns == null || uAns.trim().isEmpty) {
        unattemptedCount++;
      } else {
        final isCorrect = q.isAnswerCorrect(uAns);
        if (isCorrect) {
          correctCount++;
          totalScore += weight;
          if (isGa) {
            gaScore += weight;
          } else {
            coreScore += weight;
          }
        } else {
          incorrectCount++;
          if (q.type == 'MCQ') {
            final penalty = weight / 3.0;
            totalScore -= penalty;
            if (isGa) {
              gaScore -= penalty;
            } else {
              coreScore -= penalty;
            }
          }
        }
      }
    }
    if (totalScore < 0) totalScore = 0.0;

    final double accuracy = (correctCount + incorrectCount > 0)
        ? (correctCount / (correctCount + incorrectCount)) * 100.0
        : 0.0;

    // Predicted AIR Range & IIT Call Estimator
    String predictedAir = 'N/A';
    String iitChance = 'N/A';
    if (totalScore >= 75) {
      predictedAir = 'Top 100';
      iitChance = 'Guaranteed Old IIT (Bombay, Delhi, Madras)';
    } else if (totalScore >= 60) {
      predictedAir = '150 – 500';
      iitChance = 'Top IIT Direct Call';
    } else if (totalScore >= 45) {
      predictedAir = '800 – 2500';
      iitChance = 'New IIT / Top NIT Qualified';
    } else {
      predictedAir = '3000+';
      iitChance = 'Revision & Drill Needed';
    }

    final filteredQuestions = widget.questions.where((q) {
      final uAns = _userAnswers[q.id];
      final isCorrect = q.isAnswerCorrect(uAns);
      if (_reviewFilter == 'Correct') return isCorrect && uAns != null && uAns.isNotEmpty;
      if (_reviewFilter == 'Incorrect') return !isCorrect && uAns != null && uAns.isNotEmpty;
      if (_reviewFilter == 'Unattempted') return uAns == null || uAns.isEmpty;
      return true;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Official CBT Scorecard', style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_rounded, color: AppTheme.secondary),
            tooltip: 'Share Scorecard',
            onPressed: () {
              final shareText = '''🎯 GateX CBT Mock Exam Scorecard
Test: ${widget.testName}
Score: ${totalScore.toStringAsFixed(2)} / ${maxPossibleMarks.toStringAsFixed(0)} Marks
Accuracy: ${accuracy.toStringAsFixed(1)}%
Correct: $correctCount | Incorrect: $incorrectCount | Skipped: $unattemptedCount
Estimated Rank: $predictedAir ($iitChance)

Prepared with GateX — 100% Student-Centric GATE Prep.
https://github.com/aditya21030/GateX''';
              Share.share(shareText, subject: 'My GateX Mock Test Scorecard');
            },
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            children: [
              // Scorecard Hero Banner
              // Scorecard Hero Banner in NeuContainer
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: NeuContainer(
                  borderRadius: 20,
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.testName.toUpperCase(),
                            style: const TextStyle(color: AppTheme.accentPurple, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.1),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: AppTheme.accentPurple.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              'AIR: $predictedAir',
                              style: const TextStyle(color: AppTheme.accentPurple, fontSize: 11, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            totalScore.toStringAsFixed(2),
                            style: AppTheme.timerStyle(fontSize: 44, color: AppTheme.accentPurple),
                          ),
                          Text(
                            ' / ${maxPossibleMarks.toStringAsFixed(0)}',
                            style: TextStyle(color: context.textSecondaryColor, fontSize: 18),
                          ),
                        ],
                      ),
                      Text(
                        iitChance,
                        style: TextStyle(color: context.textSecondaryColor, fontSize: 12),
                      ),
                      const SizedBox(height: 14),
                      Divider(color: context.isDarkMode ? Colors.white12 : Colors.black12),
                      const SizedBox(height: 10),

                      // Metric Grid Strip
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildResultMiniStat('Accuracy', '${accuracy.toStringAsFixed(0)}%', AppTheme.accentPurple),
                          _buildResultMiniStat('Correct', '$correctCount', AppTheme.accentMint),
                          _buildResultMiniStat('Incorrect', '$incorrectCount', AppTheme.error),
                          _buildResultMiniStat('Skipped', '$unattemptedCount', context.textSecondaryColor),
                        ],
                      ),

                      if (_isFullMock) ...[
                        const SizedBox(height: 12),
                        Divider(color: context.isDarkMode ? Colors.white12 : Colors.black12),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'General Aptitude: ${gaScore.toStringAsFixed(2)} / 15.00',
                              style: TextStyle(fontSize: 11, color: context.textSecondaryColor, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Subject Core: ${coreScore.toStringAsFixed(2)} / 85.00',
                              style: TextStyle(fontSize: 11, color: context.textSecondaryColor, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),

              // Filter Tabs for Questions Review
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    _buildReviewFilterChip('All (${widget.questions.length})', 'All'),
                    const SizedBox(width: 8),
                    _buildReviewFilterChip('Incorrect ($incorrectCount)', 'Incorrect'),
                    const SizedBox(width: 8),
                    _buildReviewFilterChip('Correct ($correctCount)', 'Correct'),
                    const SizedBox(width: 8),
                    _buildReviewFilterChip('Skipped ($unattemptedCount)', 'Unattempted'),
                  ],
                ),
              ),
              const SizedBox(height: 8),

              // Question-by-Question Review List
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  physics: const BouncingScrollPhysics(),
                  itemCount: filteredQuestions.length,
                  itemBuilder: (context, index) {
                    final q = filteredQuestions[index];
                    final originalIndex = widget.questions.indexOf(q);
                    return _MockQuestionReviewCard(
                      index: originalIndex,
                      pyq: q,
                      userAnswer: _userAnswers[q.id],
                      buildTextHelper: _buildQuestionText,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReviewFilterChip(String label, String filterKey) {
    final isSelected = _reviewFilter == filterKey;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          HapticFeedback.selectionClick();
          setState(() {
            _reviewFilter = filterKey;
          });
        },
        child: NeuContainer(
          isRecessed: isSelected,
          borderRadius: 10,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 10.5,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? AppTheme.accentPurple : context.textSecondaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResultMiniStat(String label, String value, Color color) {
    return Column(
      children: [
        Text(value, style: AppTheme.timerStyle(fontSize: 18, color: color)),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 10.5)),
      ],
    );
  }
}

class _MockQuestionReviewCard extends StatefulWidget {
  final int index;
  final PYQ pyq;
  final String? userAnswer;
  final Widget Function(String, {bool isExplanation, Color? textColor}) buildTextHelper;

  const _MockQuestionReviewCard({
    required this.index,
    required this.pyq,
    required this.userAnswer,
    required this.buildTextHelper,
  });

  @override
  State<_MockQuestionReviewCard> createState() => _MockQuestionReviewCardState();
}

class _MockQuestionReviewCardState extends State<_MockQuestionReviewCard> {
  bool _showExplanation = false;
  bool _addedToErrorLog = false;

  void _showAddErrorLogDialog(BuildContext context) {
    final noteController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppTheme.surface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text('Add to Error Log', style: TextStyle(color: AppTheme.error, fontWeight: FontWeight.bold, fontSize: 16)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Topic: ${widget.pyq.topic}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
              const SizedBox(height: 12),
              const Text('Why did you get this wrong? (e.g. Calculation mistake, conceptual confusion):', style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
              const SizedBox(height: 8),
              TextField(
                controller: noteController,
                style: const TextStyle(color: AppTheme.textPrimary, fontSize: 13),
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: 'e.g., Overlooked negative sign / Misread option B',
                  hintStyle: const TextStyle(color: AppTheme.textSecondary, fontSize: 12),
                  filled: true,
                  fillColor: AppTheme.background,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel', style: TextStyle(color: AppTheme.textSecondary)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppTheme.error),
              onPressed: () {
                final whyWrongText = noteController.text.trim();
                final provider = Provider.of<AppProvider>(context, listen: false);
                provider.addErrorLogEntry(
                  widget.pyq.subject,
                  widget.pyq.topic,
                  widget.pyq.questionText,
                  whyWrongText.isNotEmpty ? whyWrongText : 'Incorrect in CBT mock test.',
                );
                setState(() {
                  _addedToErrorLog = true;
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Added to Error Log!'),
                    backgroundColor: AppTheme.error,
                  ),
                );
              },
              child: const Text('Add to Journal', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final q = widget.pyq;
    final uAns = widget.userAnswer;
    final cAns = q.correctAnswer;

    final isCorrect = q.isAnswerCorrect(uAns);

    final Color statusColor = uAns == null || uAns.isEmpty
        ? AppTheme.textSecondary
        : (isCorrect ? AppTheme.success : AppTheme.error);

    final String statusText = uAns == null || uAns.isEmpty
        ? 'Skipped'
        : (isCorrect ? 'Correct' : 'Incorrect');

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: NeuContainer(
        borderRadius: 18,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Q. ${widget.index + 1} (${q.type})',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    statusText,
                    style: TextStyle(color: statusColor, fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            widget.buildTextHelper(q.questionText),
            if (q.hasImage && q.imagePath != null) ...[
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: q.imagePath!.startsWith('http')
                    ? Image.network(q.imagePath!, fit: BoxFit.contain, errorBuilder: (c, e, s) => const SizedBox())
                    : Image.asset(q.imagePath!, fit: BoxFit.contain, errorBuilder: (c, e, s) => const SizedBox()),
              ),
            ],
            if (q.options.isNotEmpty) ...[
              const SizedBox(height: 12),
              ...List.generate(q.options.length, (i) {
                final letter = String.fromCharCode(65 + i);
                return Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('$letter. ', style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.textSecondary)),
                      Expanded(child: widget.buildTextHelper(q.options[i])),
                    ],
                  ),
                );
              }),
            ],
            const SizedBox(height: 16),
            // User vs Correct answers
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.background,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Answer: ${uAns == null || uAns.isEmpty ? "[Not Answered]" : uAns}',
                    style: TextStyle(
                      color: uAns == null || uAns.isEmpty ? AppTheme.textSecondary : statusColor,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Correct Answer: $cAns',
                    style: const TextStyle(color: AppTheme.success, fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Divider(color: AppTheme.background, height: 1),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Error Log Shortcut
                if (!isCorrect && uAns != null && uAns.isNotEmpty)
                  _addedToErrorLog
                      ? const Text('Added to Error Log', style: TextStyle(color: AppTheme.error, fontSize: 12, fontWeight: FontWeight.bold))
                      : TextButton.icon(
                          onPressed: () => _showAddErrorLogDialog(context),
                          icon: const Icon(Icons.add_alert_rounded, color: AppTheme.error, size: 16),
                          label: const Text('Add to Error Log', style: TextStyle(color: AppTheme.error, fontSize: 12, fontWeight: FontWeight.bold)),
                        )
                else
                  const SizedBox(),

                // Toggle solution
                if (q.explanation.trim().isNotEmpty)
                  TextButton.icon(
                    onPressed: () {
                      setState(() {
                        _showExplanation = !_showExplanation;
                      });
                    },
                    icon: Icon(
                      _showExplanation ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                      color: AppTheme.secondary,
                      size: 16,
                    ),
                    label: Text(
                      _showExplanation ? 'Hide Explanation' : 'Explain',
                      style: const TextStyle(color: AppTheme.secondary, fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
              ],
            ),
            if (_showExplanation) ...[
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppTheme.secondary.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppTheme.secondary.withValues(alpha: 0.15)),
                ),
                child: widget.buildTextHelper(q.explanation, isExplanation: true),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
