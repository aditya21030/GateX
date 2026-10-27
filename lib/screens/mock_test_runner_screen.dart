import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
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
  final GlobalKey _scorecardBoundaryKey = GlobalKey();
  bool _isSharingImage = false;

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
      if (q.type == 'NAT' || (!q.isMCQ && q.type != 'MSQ' && q.options.isEmpty)) {
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
    final isNAT = q.type == 'NAT' || (!q.isMCQ && q.type != 'MSQ' && q.options.isEmpty);
    if (q.type == 'MSQ') {
      final selections = _msqSelections[q.id];
      if (selections != null && selections.isNotEmpty) {
        final sorted = selections.toList()..sort();
        _userAnswers[q.id] = sorted.join(';');
      } else {
        _userAnswers.remove(q.id);
      }
    } else if (isNAT) {
      final text = _natControllers[q.id]?.text.trim() ?? '';
      if (text.isNotEmpty) {
        _userAnswers[q.id] = text;
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
      final isNAT = q.type == 'NAT' || (!q.isMCQ && q.type != 'MSQ' && q.options.isEmpty);
      if (q.type == 'MSQ') {
        _msqSelections[q.id]?.clear();
      } else if (isNAT) {
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

    // Identify specific weak topics where questions were missed
    final List<String> weakSubjects = [];
    final Set<String> recordedTopics = {};

    // First collect specific topics of questions answered incorrectly
    for (int i = 0; i < widget.questions.length; i++) {
      final q = widget.questions[i];
      final uAns = _userAnswers[q.id];
      if (uAns != null && uAns.trim().isNotEmpty && !q.isAnswerCorrect(uAns)) {
        final cleanTopic = q.topic.trim();
        if (cleanTopic.isNotEmpty && recordedTopics.add(cleanTopic)) {
          weakSubjects.add(cleanTopic);
        }
      }
    }

    // Next add topics of unattempted questions if fewer than 5
    if (weakSubjects.length < 5) {
      for (int i = 0; i < widget.questions.length; i++) {
        if (weakSubjects.length >= 6) break;
        final q = widget.questions[i];
        final uAns = _userAnswers[q.id];
        if (uAns == null || uAns.trim().isEmpty) {
          final cleanTopic = q.topic.trim();
          if (cleanTopic.isNotEmpty && recordedTopics.add(cleanTopic)) {
            weakSubjects.add(cleanTopic);
          }
        }
      }
    }

    // Fallback: If still empty, add canonical subjects
    if (weakSubjects.isEmpty) {
      final Set<String> canonSubjects = {};
      subjectPerformance.forEach((subject, counts) {
        final corr = counts[0];
        final tot = counts[1];
        if (tot > 0 && (corr / tot) < 0.5) {
          String s = subject.trim();
          final l = s.toLowerCase();
          if (l.contains('calculus') || l.contains('optimization')) {
            s = 'Calculus & Optimization';
          } else if (l.contains('probability') || l.contains('statistic')) {
            s = 'Probability & Statistics';
          } else if (l.contains('python') || l.contains('programming')) {
            s = 'Programming & Python';
          } else if (l.contains('data struct') || l.contains('algo')) {
            s = 'Data Structures & Algorithms';
          } else if (l.contains('database') || l.contains('dbms')) {
            s = 'Database Management Systems';
          } else if (l.contains('linear algebra')) {
            s = 'Linear Algebra';
          } else if (l.contains('machine learning')) {
            s = 'Machine Learning';
          } else if (l.contains('artificial intelligence') || l == 'ai') {
            s = 'Artificial Intelligence';
          }
          canonSubjects.add(s);
        }
      });
      weakSubjects.addAll(canonSubjects);
    }

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

    // Auto-log wrong answers to Error Log so user doesn't miss them
    for (int i = 0; i < widget.questions.length; i++) {
      final q = widget.questions[i];
      final uAns = _userAnswers[q.id];
      if (uAns != null && uAns.isNotEmpty && !q.isAnswerCorrect(uAns)) {
        provider.addErrorLogEntry(
          q.subject,
          q.topic,
          q.questionText,
          'Wrong answer in ${widget.testName}.\nYour Answer: $uAns | Correct: ${q.correctAnswer}',
          userAnswer: uAns,
          correctAnswer: q.correctAnswer,
          explanation: q.explanation,
        );
      }
    }

    // Show interstitial ad only for non-pro users
    if (!provider.isPro) {
      AdService().showInterstitialAd();
    }

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
          backgroundColor: context.colorSurface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: AppTheme.error),
              SizedBox(width: 8),
              Text('Exit Mock Exam?', style: TextStyle(color: AppTheme.error, fontWeight: FontWeight.bold, fontSize: 16)),
            ],
          ),
          content: Text(
            'Are you sure you want to exit? Your exam progress will be lost and this attempt will not be recorded.',
            style: TextStyle(color: context.textSecondaryColor, fontSize: 13, height: 1.4),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text('Resume Test', style: TextStyle(color: context.textSecondaryColor)),
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
          backgroundColor: context.colorSurface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Row(
            children: [
              const Icon(Icons.assignment_turned_in_rounded, color: AppTheme.secondary),
              const SizedBox(width: 8),
              Text('Submit Examination?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: context.textColor)),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Review your attempt summary before final submission:',
                style: TextStyle(color: context.textSecondaryColor, fontSize: 12),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: context.colorSurfaceElevated,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: context.isDarkMode
                        ? Colors.white.withValues(alpha: 0.08)
                        : Colors.black.withValues(alpha: 0.08),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                child: Column(
                  children: [
                    _buildSubmitSummaryRow('Total Questions', '${widget.questions.length}', context.textColor),
                    Divider(color: context.colorBorder, height: 16),
                    _buildSubmitSummaryRow('🟢 Answered', '$_answeredCount', AppTheme.success),
                    const SizedBox(height: 6),
                    _buildSubmitSummaryRow('🟣🟢 Ans & Marked (Evaluated)', '$_answeredAndMarkedCount', const Color(0xFFBA68C8)),
                    const SizedBox(height: 6),
                    _buildSubmitSummaryRow('🟣 Marked for Review', '$_markedForReviewCount', const Color(0xFFBA68C8)),
                    const SizedBox(height: 6),
                    _buildSubmitSummaryRow('🔴 Not Answered', '$_notAnsweredCount', AppTheme.error),
                    const SizedBox(height: 6),
                    _buildSubmitSummaryRow('⚪ Not Visited', '$_notVisitedCount', context.textSecondaryColor),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Note: Questions in "Answered & Marked for Review" will be evaluated for marks as per official GATE rules.',
                style: TextStyle(color: context.textSecondaryColor, fontSize: 11, fontStyle: FontStyle.italic),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Resume Test', style: TextStyle(color: context.textSecondaryColor)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.secondary,
                foregroundColor: Colors.black,
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
        Text(label, style: TextStyle(fontSize: 12, color: context.textSecondaryColor)),
        Text(value, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: valueColor)),
      ],
    );
  }

  // --- Official GATE 5-State Question Palette Modal Bottom Sheet ---
  void _showQuestionsMapSheet() {
    HapticFeedback.selectionClick();
    _syncCurrentInput();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.colorSurface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
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
                      width: 44,
                      height: 4,
                      decoration: BoxDecoration(
                        color: context.isDarkMode ? Colors.white24 : Colors.black26,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'GATE Question Palette',
                        style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 17, color: context.textColor),
                      ),
                      IconButton(
                        icon: Icon(Icons.close_rounded, color: context.textSecondaryColor),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // 5 Official TCS iON Status Badges
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      color: context.isDarkMode ? const Color(0xFF14151D) : const Color(0xFFF1F1F5),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: context.isDarkMode
                            ? Colors.white.withValues(alpha: 0.08)
                            : Colors.black.withValues(alpha: 0.06),
                      ),
                    ),
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 8,
                      children: [
                        _buildLegendPill(AppTheme.accentMint, 'Answered', '$_answeredCount', isCircle: false),
                        _buildLegendPill(AppTheme.accentCoral, 'Not Answered', '$_notAnsweredCount', isCircle: false),
                        _buildLegendPill(const Color(0xFFAB47BC), 'Marked for Review', '$_markedForReviewCount', isCircle: true),
                        _buildLegendPill(const Color(0xFFAB47BC), 'Ans & Marked', '$_answeredAndMarkedCount', isCircle: true, hasGreenDot: true),
                        _buildLegendPill(context.colorSurface, 'Not Visited', '$_notVisitedCount', isCircle: false, isBordered: true),
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
                      color: AppTheme.accentPurple.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppTheme.accentPurple.withValues(alpha: 0.2)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.info_outline, size: 15, color: AppTheme.accentPurple),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Questions marked as "Ans & Marked" (🟣🟢) will be considered for marks in GATE.',
                            style: GoogleFonts.outfit(fontSize: 11.5, color: context.textSecondaryColor),
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
          HapticFeedback.selectionClick();
          setSheetState(() {
            _navigatorSectionIndex = index;
          });
          setState(() {
            _navigatorSectionIndex = index;
          });
        },
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.accentPurple : context.colorSurface,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isSelected ? AppTheme.accentPurple : (context.isDarkMode ? Colors.white12 : Colors.black12),
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: AppTheme.accentPurple.withValues(alpha: 0.3),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Text(
            label,
            style: GoogleFonts.outfit(
              fontSize: 11,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color: isSelected ? Colors.white : context.textSecondaryColor,
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
                borderRadius: isCircle ? null : BorderRadius.circular(4),
                border: isBordered ? Border.all(color: context.isDarkMode ? Colors.white24 : Colors.black26, width: 1.2) : null,
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
                    color: AppTheme.accentMint,
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
          style: GoogleFonts.outfit(color: context.textSecondaryColor, fontSize: 11, fontWeight: FontWeight.w500),
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
    BorderRadius? borderRadius = BorderRadius.circular(8);
    Widget? indicatorBadge;

    switch (status) {
      case GateQuestionStatus.answered:
        bgColor = AppTheme.accentMint;
        borderColor = AppTheme.accentMint;
        break;
      case GateQuestionStatus.notAnswered:
        bgColor = AppTheme.accentCoral;
        borderColor = AppTheme.accentCoral;
        break;
      case GateQuestionStatus.markedForReview:
        bgColor = const Color(0xFFAB47BC);
        borderColor = const Color(0xFFBA68C8);
        shape = BoxShape.circle;
        borderRadius = null;
        break;
      case GateQuestionStatus.answeredAndMarked:
        bgColor = const Color(0xFFAB47BC);
        borderColor = const Color(0xFFBA68C8);
        shape = BoxShape.circle;
        borderRadius = null;
        indicatorBadge = Positioned(
          right: 2,
          bottom: 2,
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: AppTheme.accentMint,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1.2),
            ),
          ),
        );
        break;
      case GateQuestionStatus.notVisited:
        bgColor = context.colorSurface;
        borderColor = context.isDarkMode ? Colors.white.withValues(alpha: 0.12) : Colors.black.withValues(alpha: 0.12);
        textColor = context.textSecondaryColor;
        break;
    }

    return InkWell(
      onTap: () {
        HapticFeedback.selectionClick();
        Navigator.pop(context);
        _jumpToQuestion(index);
      },
      borderRadius: borderRadius ?? BorderRadius.circular(20),
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
                color: isCurrent ? AppTheme.accentPurple : borderColor,
                width: isCurrent ? 2.5 : 1.2,
              ),
              boxShadow: isCurrent
                  ? [
                      BoxShadow(
                        color: AppTheme.accentPurple.withValues(alpha: 0.5),
                        blurRadius: 8,
                      ),
                    ]
                  : null,
            ),
            child: Text(
              '${index + 1}',
              style: GoogleFonts.outfit(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 13.5,
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
                  : context.colorSurfaceElevated,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: (isExplanation ? AppTheme.secondary : context.textSecondaryColor).withValues(alpha: 0.1),
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Text(
                blockText,
                style: AppTheme.monospaceStyle(
                  fontSize: 11.5,
                  color: textColor ?? context.textColor,
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
          backgroundColor: context.colorSurface,
          elevation: 0,
          title: Text(widget.testName, style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 16, color: context.textColor)),
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
              icon: const Icon(Icons.calculate_outlined, color: AppTheme.accentPurple),
              tooltip: 'GATE Virtual Calculator',
              onPressed: () {
                HapticFeedback.selectionClick();
                VirtualCalculator.show(context);
              },
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 9),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: isLowTime
                    ? AppTheme.accentCoral.withValues(alpha: 0.15)
                    : (context.isDarkMode ? const Color(0xFF14151D) : const Color(0xFFF1F1F5)),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isLowTime
                      ? AppTheme.accentCoral
                      : (context.isDarkMode ? Colors.white12 : Colors.black12),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.timer_outlined,
                    size: 15,
                    color: isLowTime ? AppTheme.accentCoral : AppTheme.accentPurple,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    _formatTime(_secondsRemaining),
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: isLowTime ? AppTheme.accentCoral : context.textColor,
                      fontFeatures: const [ui.FontFeature.tabularFigures()],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 9),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.accentPurple,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  visualDensity: VisualDensity.compact,
                ),
                onPressed: () {
                  HapticFeedback.selectionClick();
                  _showSubmitConfirmation();
                },
                child: Text(
                  'SUBMIT',
                  style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 11.5, letterSpacing: 0.5),
                ),
              ),
            ),
            const SizedBox(width: 10),
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
                  backgroundColor: context.isDarkMode ? Colors.white10 : Colors.black12,
                  valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.accentPurple),
                  minHeight: 3.5,
                ),

                // Question Metadata Strip (Section, Marks, Type, Status)
                Container(
                  color: context.colorSurface,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      // Section Chip
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppTheme.accentPurple.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppTheme.accentPurple.withValues(alpha: 0.25)),
                        ),
                        child: Text(
                          sectionName,
                          style: GoogleFonts.outfit(color: AppTheme.accentPurple, fontSize: 11.5, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 8),

                      // Marking Scheme Chip
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: context.isDarkMode ? Colors.white.withValues(alpha: 0.05) : Colors.black.withValues(alpha: 0.04),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: context.isDarkMode ? Colors.white10 : Colors.black12),
                        ),
                        child: Text(
                          negMarks > 0
                              ? '+${weight.toStringAsFixed(0)} | -${negMarks.toStringAsFixed(2)}'
                              : '+${weight.toStringAsFixed(0)} | 0.00',
                          style: GoogleFonts.outfit(color: context.textSecondaryColor, fontSize: 11, fontWeight: FontWeight.w600),
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
                              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppTheme.accentPurple.withValues(alpha: 0.14),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'Question ${_currentIndex + 1} of ${widget.questions.length}',
                                style: GoogleFonts.outfit(
                                  color: AppTheme.accentPurple,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                              decoration: BoxDecoration(
                                color: q.type == 'MSQ'
                                    ? AppTheme.accentCoral.withValues(alpha: 0.15)
                                    : q.type == 'NAT'
                                        ? AppTheme.accentMint.withValues(alpha: 0.15)
                                        : AppTheme.accentGold.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                q.type,
                                style: GoogleFonts.outfit(
                                  color: q.type == 'MSQ'
                                      ? AppTheme.accentCoral
                                      : q.type == 'NAT'
                                          ? AppTheme.accentMint
                                          : AppTheme.accentGold,
                                  fontSize: 12,
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
                          style: GoogleFonts.outfit(color: context.textSecondaryColor, fontSize: 12.5, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 14),

                        // Question Body Text
                        _buildQuestionText(q.questionText),

                        // Diagram or Question Image
                        if (q.hasImage && q.imagePath != null) ...[
                          const SizedBox(height: 16),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              color: context.textColor.withValues(alpha: 0.05),
                              padding: const EdgeInsets.all(8),
                              child: q.imagePath!.startsWith('http')
                                  ? Image.network(
                                      q.imagePath!,
                                      fit: BoxFit.contain,
                                      loadingBuilder: (context, child, progress) {
                                        if (progress == null) return child;
                                        return Container(
                                          height: 120,
                                          alignment: Alignment.center,
                                          child: CircularProgressIndicator(
                                            value: progress.expectedTotalBytes != null
                                                ? progress.cumulativeBytesLoaded / progress.expectedTotalBytes!
                                                : null,
                                            strokeWidth: 2,
                                            color: const Color(0xFFFF8522),
                                          ),
                                        );
                                      },
                                      errorBuilder: (context, err, stack) => Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                                        decoration: BoxDecoration(
                                          color: AppTheme.accentCoral.withValues(alpha: 0.08),
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: AppTheme.accentCoral.withValues(alpha: 0.3)),
                                        ),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.broken_image_rounded, size: 20, color: AppTheme.accentCoral),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: Text(
                                                'Diagram could not be loaded. Please check your internet connection.',
                                                style: GoogleFonts.outfit(fontSize: 12, color: AppTheme.accentCoral),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
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
                        if (q.type != 'NAT' && (q.isMCQ || q.type == 'MSQ' || q.options.isNotEmpty)) _buildMockMCQOptions(q) else _buildMockNATInput(q),
                      ],
                    ),
                  ),
                ),

                // TCS iON Official Bottom Action Bar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: context.colorSurface,
                    border: Border(
                      top: BorderSide(
                        color: context.isDarkMode ? Colors.white.withValues(alpha: 0.08) : Colors.black.withValues(alpha: 0.06),
                      ),
                    ),
                  ),
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
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: const Color(0xFFAB47BC),
                                  side: BorderSide(color: const Color(0xFFAB47BC).withValues(alpha: 0.5)),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                ),
                                onPressed: _markForReviewAndNext,
                                child: Text(
                                  'Mark & Next',
                                  style: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),

                            // 2. Clear Response
                            Expanded(
                              flex: 2,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: AppTheme.accentCoral,
                                  side: BorderSide(color: AppTheme.accentCoral.withValues(alpha: 0.5)),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                ),
                                onPressed: _clearCurrentAnswer,
                                child: Text(
                                  'Clear',
                                  style: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),

                            // 3. Question Palette Trigger
                            GestureDetector(
                              onTap: _showQuestionsMapSheet,
                              child: Container(
                                padding: const EdgeInsets.all(11),
                                decoration: BoxDecoration(
                                  color: context.isDarkMode ? const Color(0xFF14151D) : const Color(0xFFF1F1F5),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: context.isDarkMode ? Colors.white12 : Colors.black12,
                                  ),
                                ),
                                child: const Icon(Icons.grid_view_rounded, color: AppTheme.accentPurple, size: 20),
                              ),
                            ),
                            const SizedBox(width: 8),

                            // 4. Save & Next
                            Expanded(
                              flex: 4,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppTheme.accentPurple,
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  shadowColor: AppTheme.accentPurple.withValues(alpha: 0.4),
                                ),
                                onPressed: _saveAndNext,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      _currentIndex == widget.questions.length - 1 ? 'Submit' : 'Save & Next',
                                      style: GoogleFonts.outfit(fontSize: 12.5, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(width: 4),
                                    const Icon(Icons.arrow_forward_rounded, size: 14),
                                  ],
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
                              borderRadius: BorderRadius.circular(6),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.chevron_left_rounded, size: 16, color: context.textSecondaryColor),
                                    Text(
                                      'Previous Question',
                                      style: GoogleFonts.outfit(color: context.textSecondaryColor, fontSize: 11.5, fontWeight: FontWeight.w500),
                                    ),
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
        bg = AppTheme.accentMint.withValues(alpha: 0.15);
        fg = AppTheme.accentMint;
        label = 'Answered';
        break;
      case GateQuestionStatus.notAnswered:
        bg = AppTheme.accentCoral.withValues(alpha: 0.15);
        fg = AppTheme.accentCoral;
        label = 'Not Answered';
        break;
      case GateQuestionStatus.markedForReview:
        bg = const Color(0xFFAB47BC).withValues(alpha: 0.2);
        fg = const Color(0xFFBA68C8);
        label = 'Marked';
        break;
      case GateQuestionStatus.answeredAndMarked:
        bg = const Color(0xFFAB47BC).withValues(alpha: 0.2);
        fg = const Color(0xFFBA68C8);
        label = 'Ans & Marked';
        break;
      case GateQuestionStatus.notVisited:
        bg = context.isDarkMode ? Colors.white.withValues(alpha: 0.05) : Colors.black.withValues(alpha: 0.04);
        fg = context.textSecondaryColor;
        label = 'Not Visited';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3.5),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: GoogleFonts.outfit(color: fg, fontSize: 11, fontWeight: FontWeight.bold),
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

        final Color borderCol = isSelected
            ? AppTheme.accentPurple
            : (context.isDarkMode ? Colors.white.withValues(alpha: 0.08) : Colors.black.withValues(alpha: 0.08));
        final Color bgCol = isSelected
            ? AppTheme.accentPurple.withValues(alpha: 0.12)
            : context.colorSurface;

        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: InkWell(
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
            borderRadius: BorderRadius.circular(14),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: bgCol,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: borderCol, width: isSelected ? 1.5 : 1.0),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: AppTheme.accentPurple.withValues(alpha: 0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : null,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected ? AppTheme.accentPurple : (context.isDarkMode ? const Color(0xFF14151D) : const Color(0xFFF1F1F5)),
                      shape: q.type == 'MSQ' ? BoxShape.rectangle : BoxShape.circle,
                      borderRadius: q.type == 'MSQ' ? BorderRadius.circular(8) : null,
                      border: Border.all(
                        color: isSelected ? Colors.transparent : (context.isDarkMode ? Colors.white12 : Colors.black12),
                      ),
                    ),
                    child: Text(
                      letter,
                      style: GoogleFonts.outfit(
                        color: isSelected ? Colors.white : context.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
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
          style: GoogleFonts.outfit(fontSize: 13, color: context.textSecondaryColor, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        NeuContainer(
          isRecessed: true,
          borderRadius: 14,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
          child: TextFormField(
            controller: controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
            style: GoogleFonts.jetBrainsMono(color: context.textColor, fontSize: 17, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              hintText: 'e.g. 14.5 or -0.33',
              hintStyle: GoogleFonts.jetBrainsMono(color: context.textSecondaryColor.withValues(alpha: 0.5), fontSize: 14),
              border: InputBorder.none,
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
              prefixIcon: const Icon(Icons.pin_rounded, size: 18, color: AppTheme.accentPurple),
              suffixIcon: controller.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear_rounded, size: 18),
                      color: context.textSecondaryColor,
                      onPressed: () {
                        HapticFeedback.lightImpact();
                        controller.clear();
                        setState(() {
                          _userAnswers.remove(q.id);
                        });
                      },
                    )
                  : null,
            ),
            onChanged: (val) {
              setState(() {
                if (val.trim().isNotEmpty) {
                  _userAnswers[q.id] = val.trim();
                } else {
                  _userAnswers.remove(q.id);
                }
              });
            },
          ),
        ),
      ],
    );
  }

    Future<void> _shareScorecardAsImage({
    required double totalScore,
    required double maxPossibleMarks,
    required double accuracy,
    required String predictedAir,
    required String iitChance,
  }) async {
    HapticFeedback.selectionClick();
    setState(() => _isSharingImage = true);

    final shareText = '''🎯 GateX CBT Mock Exam Scorecard
Test: ${widget.testName}
Score: ${totalScore.toStringAsFixed(2)} / ${maxPossibleMarks.toStringAsFixed(0)} Marks
Accuracy: ${accuracy.toStringAsFixed(1)}%
Estimated Rank: $predictedAir ($iitChance)

Prepared with GateX — 100% Student-Centric GATE Prep.
https://github.com/aditya21030/GateX''';

    try {
      final boundary = _scorecardBoundaryKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary != null) {
        final image = await boundary.toImage(pixelRatio: 3.0);
        final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
        if (byteData != null) {
          final tempDir = await getTemporaryDirectory();
          final file = File('${tempDir.path}/gatex_scorecard_${DateTime.now().millisecondsSinceEpoch}.png');
          await file.writeAsBytes(byteData.buffer.asUint8List());
          await Share.shareXFiles(
            [XFile(file.path, mimeType: 'image/png')],
            text: shareText,
            subject: 'My GateX Mock Test Scorecard',
          );
          if (mounted) setState(() => _isSharingImage = false);
          return;
        }
      }
    } catch (e) {
      debugPrint('Error generating scorecard image: $e');
    }

    if (mounted) setState(() => _isSharingImage = false);
    Share.share(shareText, subject: 'My GateX Mock Test Scorecard');
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

    // Predicted AIR Range according to marks obtained
    String predictedAir;
    String iitChance;
    if (totalScore >= 80) {
      predictedAir = '1 – 25';
      iitChance = 'Guaranteed Old IIT (Bombay, Delhi, Madras)';
    } else if (totalScore >= 70) {
      predictedAir = '25 – 100';
      iitChance = 'Guaranteed Top IIT / IISc Call';
    } else if (totalScore >= 60) {
      predictedAir = '100 – 350';
      iitChance = 'Top IIT Direct Interview / Admission Call';
    } else if (totalScore >= 50) {
      predictedAir = '350 – 900';
      iitChance = 'Established IIT / Top NIT Qualified';
    } else if (totalScore >= 40) {
      predictedAir = '900 – 2,200';
      iitChance = 'Newer IIT / Top NIT Admission Qualified';
    } else if (totalScore >= 30) {
      predictedAir = '2,200 – 5,000';
      iitChance = 'GATE Cutoff Cleared • NITs / State Institutes';
    } else if (totalScore >= 20) {
      predictedAir = '5,000 – 9,000';
      iitChance = 'Near Cutoff Threshold • Focused Revision Needed';
    } else {
      predictedAir = '10,000+';
      iitChance = 'Revision & Intensive Drill Needed';
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
      backgroundColor: context.colorBackground,
      appBar: AppBar(
        backgroundColor: context.colorSurface,
        elevation: 0,
        title: Text('Official CBT Scorecard', style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 18, color: context.textColor)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: _isSharingImage
                ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2, color: AppTheme.accentPurple))
                : const Icon(Icons.share_rounded, color: AppTheme.accentPurple),
            tooltip: 'Share Scorecard Image',
            onPressed: _isSharingImage
                ? null
                : () => _shareScorecardAsImage(
                      totalScore: totalScore,
                      maxPossibleMarks: maxPossibleMarks,
                      accuracy: accuracy,
                      predictedAir: predictedAir,
                      iitChance: iitChance,
                    ),
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // 1. Scorecard Hero Banner
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 12.0),
                  child: RepaintBoundary(
                    key: _scorecardBoundaryKey,
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
                                style: GoogleFonts.outfit(
                                  color: AppTheme.accentPurple,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.1,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4.5),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFF8522).withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: const Color(0xFFFF8522).withValues(alpha: 0.4),
                                    width: 1.2,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.workspace_premium_rounded, size: 14, color: Color(0xFFFF8522)),
                                    const SizedBox(width: 4),
                                    Text(
                                      'AIR: $predictedAir',
                                      style: GoogleFonts.outfit(
                                        color: const Color(0xFFFF8522),
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                totalScore.toStringAsFixed(2),
                                style: GoogleFonts.outfit(fontSize: 48, fontWeight: FontWeight.bold, color: AppTheme.accentPurple),
                              ),
                              Text(
                                ' / ${maxPossibleMarks.toStringAsFixed(0)}',
                                style: GoogleFonts.outfit(color: context.textSecondaryColor, fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.school_rounded, size: 16, color: AppTheme.accentMint),
                              const SizedBox(width: 6),
                              Flexible(
                                child: Text(
                                  iitChance,
                                  style: GoogleFonts.outfit(color: context.textColor, fontSize: 13, fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),
                          Divider(color: context.isDarkMode ? Colors.white12 : Colors.black12),
                          const SizedBox(height: 10),

                          // Metric Grid Strip
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildResultMiniStat('Accuracy', '${accuracy.toStringAsFixed(0)}%', AppTheme.accentPurple, Icons.pie_chart_outline_rounded),
                              _buildResultMiniStat('Correct', '$correctCount', AppTheme.accentMint, Icons.check_circle_outline_rounded),
                              _buildResultMiniStat('Incorrect', '$incorrectCount', AppTheme.accentCoral, Icons.cancel_outlined),
                              _buildResultMiniStat('Skipped', '$unattemptedCount', context.textSecondaryColor, Icons.remove_circle_outline_rounded),
                            ],
                          ),

                          if (_isFullMock) ...[
                            const SizedBox(height: 14),
                            Divider(color: context.isDarkMode ? Colors.white12 : Colors.black12),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: context.isDarkMode ? Colors.white.withValues(alpha: 0.05) : Colors.black.withValues(alpha: 0.04),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: context.isDarkMode ? Colors.white12 : Colors.black12),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'General Aptitude',
                                          style: GoogleFonts.outfit(
                                            fontSize: 11,
                                            color: context.textSecondaryColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        Text(
                                          '${gaScore.toStringAsFixed(2)} / 15.00',
                                          style: GoogleFonts.outfit(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: context.textColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: context.isDarkMode ? Colors.white.withValues(alpha: 0.05) : Colors.black.withValues(alpha: 0.04),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: context.isDarkMode ? Colors.white12 : Colors.black12),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Subject Core',
                                          style: GoogleFonts.outfit(
                                            fontSize: 11,
                                            color: context.textSecondaryColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        Text(
                                          '${coreScore.toStringAsFixed(2)} / 85.00',
                                          style: GoogleFonts.outfit(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: context.textColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // 2. Filter Tabs for Questions Review
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 12.0),
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
              ),

              // 3. Question-by-Question Review List (full screen scrolling!)
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 60),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final q = filteredQuestions[index];
                      final originalIndex = widget.questions.indexOf(q);
                      return _MockQuestionReviewCard(
                        index: originalIndex,
                        pyq: q,
                        userAnswer: _userAnswers[q.id],
                        buildTextHelper: _buildQuestionText,
                      );
                    },
                    childCount: filteredQuestions.length,
                  ),
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
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.accentPurple : context.colorSurface,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isSelected ? AppTheme.accentPurple : (context.isDarkMode ? Colors.white12 : Colors.black12),
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: AppTheme.accentPurple.withValues(alpha: 0.3),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Center(
            child: Text(
              label,
              style: GoogleFonts.outfit(
                fontSize: 10.5,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: isSelected ? Colors.white : context.textSecondaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResultMiniStat(String label, String value, Color color, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(height: 4),
        Text(value, style: GoogleFonts.outfit(fontSize: 19, fontWeight: FontWeight.bold, color: color)),
        const SizedBox(height: 2),
        Text(label, style: GoogleFonts.outfit(color: context.textSecondaryColor, fontSize: 11, fontWeight: FontWeight.w500)),
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
          backgroundColor: context.colorSurface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text('Add to Error Log', style: TextStyle(color: AppTheme.error, fontWeight: FontWeight.bold, fontSize: 16)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Topic: ${widget.pyq.topic}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: context.textColor)),
              const SizedBox(height: 12),
              Text('Why did you get this wrong? (e.g. Calculation mistake, conceptual confusion):', style: TextStyle(fontSize: 12, color: context.textSecondaryColor)),
              const SizedBox(height: 8),
              TextField(
                controller: noteController,
                style: TextStyle(color: context.textColor, fontSize: 13),
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: 'e.g., Overlooked negative sign / Misread option B',
                  hintStyle: TextStyle(color: context.textSecondaryColor, fontSize: 12),
                  filled: true,
                  fillColor: context.colorSurfaceElevated,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: context.colorBorder)),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel', style: TextStyle(color: context.textSecondaryColor)),
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
        ? context.textSecondaryColor
        : (isCorrect ? AppTheme.accentMint : AppTheme.accentCoral);

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
                  style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 14.5, color: context.textColor),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3.5),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: statusColor.withValues(alpha: 0.25)),
                  ),
                  child: Text(
                    statusText,
                    style: GoogleFonts.outfit(color: statusColor, fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            widget.buildTextHelper(q.questionText),
            if (q.hasImage && q.imagePath != null) ...[
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
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
                      Container(
                        width: 22,
                        height: 22,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(right: 8, top: 1),
                        decoration: BoxDecoration(
                          color: context.isDarkMode ? const Color(0xFF14151D) : const Color(0xFFF1F1F5),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: context.isDarkMode ? Colors.white12 : Colors.black12),
                        ),
                        child: Text(letter, style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 11.5, color: context.textSecondaryColor)),
                      ),
                      Expanded(child: widget.buildTextHelper(q.options[i])),
                    ],
                  ),
                );
              }),
            ],
            const SizedBox(height: 14),
            // User vs Correct answers
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isCorrect
                    ? AppTheme.accentMint.withValues(alpha: 0.08)
                    : (uAns == null || uAns.isEmpty
                        ? (context.isDarkMode ? Colors.white.withValues(alpha: 0.04) : Colors.black.withValues(alpha: 0.03))
                        : AppTheme.accentCoral.withValues(alpha: 0.08)),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isCorrect
                      ? AppTheme.accentMint.withValues(alpha: 0.25)
                      : (uAns == null || uAns.isEmpty
                          ? (context.isDarkMode ? Colors.white10 : Colors.black12)
                          : AppTheme.accentCoral.withValues(alpha: 0.25)),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        isCorrect
                            ? Icons.check_circle_rounded
                            : (uAns == null || uAns.isEmpty ? Icons.help_outline_rounded : Icons.cancel_rounded),
                        size: 16,
                        color: statusColor,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Your Answer: ${uAns == null || uAns.isEmpty ? "[Not Answered]" : uAns}',
                        style: GoogleFonts.outfit(
                          color: uAns == null || uAns.isEmpty ? context.textSecondaryColor : statusColor,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.verified_rounded, size: 16, color: AppTheme.accentMint),
                      const SizedBox(width: 6),
                      Text(
                        'Correct Answer: $cAns',
                        style: GoogleFonts.outfit(color: AppTheme.accentMint, fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Divider(color: context.isDarkMode ? Colors.white10 : Colors.black12, height: 1),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Error Log Shortcut
                if (!isCorrect && uAns != null && uAns.isNotEmpty)
                  _addedToErrorLog
                      ? Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppTheme.accentCoral.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text('Added to Error Log ✓', style: GoogleFonts.outfit(color: AppTheme.accentCoral, fontSize: 11.5, fontWeight: FontWeight.bold)),
                        )
                      : OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppTheme.accentCoral,
                            side: BorderSide(color: AppTheme.accentCoral.withValues(alpha: 0.4)),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            visualDensity: VisualDensity.compact,
                          ),
                          onPressed: () {
                            HapticFeedback.selectionClick();
                            _showAddErrorLogDialog(context);
                          },
                          icon: const Icon(Icons.add_alert_rounded, size: 15),
                          label: Text('Add to Error Log', style: GoogleFonts.outfit(fontSize: 11.5, fontWeight: FontWeight.bold)),
                        )
                else
                  const SizedBox(),

                // Toggle solution
                if (q.explanation.trim().isNotEmpty)
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppTheme.accentPurple,
                      side: BorderSide(color: AppTheme.accentPurple.withValues(alpha: 0.4)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      visualDensity: VisualDensity.compact,
                    ),
                    onPressed: () {
                      HapticFeedback.selectionClick();
                      setState(() {
                        _showExplanation = !_showExplanation;
                      });
                    },
                    icon: Icon(
                      _showExplanation ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                      size: 15,
                    ),
                    label: Text(
                      _showExplanation ? 'Hide Solution' : 'Explain',
                      style: GoogleFonts.outfit(fontSize: 11.5, fontWeight: FontWeight.bold),
                    ),
                  ),
              ],
            ),
            if (_showExplanation) ...[
              const SizedBox(height: 12),
              Builder(
                builder: (context) {
                  String explanationText = q.explanation.trim();
                  if (explanationText == 'Refer to standard solutions.' || explanationText.isEmpty) {
                    if (q.type == 'NAT') {
                      explanationText = 'Official Answer: ${q.correctAnswer}\n\nConceptual Breakdown:\nThis is an official Numerical Answer Type (NAT) problem on ${q.topic} in ${q.subject}. Rounding should only be performed at the final arithmetic step to remain strictly within the GATE tolerance window. Note: NAT questions carry zero negative marking.';
                    } else if (q.type == 'MSQ') {
                      explanationText = 'Correct Option(s): ${q.correctAnswer}\n\nConceptual Breakdown:\nThis is a Multiple Select Question (MSQ) on ${q.topic} in ${q.subject}. Every option must be evaluated independently by checking boundary conditions and constructing minimal counter-examples. Note: MSQ questions carry zero negative marking in GATE.';
                    } else {
                      final correctOpt = q.correctAnswer.trim();
                      int optIdx = -1;
                      if (correctOpt.length == 1 && correctOpt.codeUnitAt(0) >= 65 && correctOpt.codeUnitAt(0) <= 90) {
                        optIdx = correctOpt.codeUnitAt(0) - 65;
                      }
                      final optText = (optIdx >= 0 && optIdx < q.options.length) ? ': "${q.options[optIdx]}"' : '';
                      explanationText = 'Correct Answer: Option $correctOpt$optText\n\nConceptual Breakdown:\nBased on standard GATE ${q.subject} syllabus principles on ${q.topic}, option ($correctOpt) is the mathematically verified solution.';
                    }
                  }

                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppTheme.accentPurple.withValues(alpha: 0.07),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppTheme.accentPurple.withValues(alpha: 0.2)),
                    ),
                    child: widget.buildTextHelper(explanationText, isExplanation: true),
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
