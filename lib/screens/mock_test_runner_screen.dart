import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../theme/app_theme.dart';
import '../providers/app_provider.dart';
import '../services/ad_service.dart';
import '../widgets/virtual_calculator.dart';
import 'error_log_screen.dart';

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

  static final Map<String, Widget> _questionWidgetCache = {};

  @override
  void initState() {
    super.initState();
    AdService().setAdSuspended(true);
    _secondsRemaining = widget.duration.inSeconds;
    _startTime = DateTime.now();
    _visitedQuestions.add(widget.questions[0].id);

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

  void _autoSubmitTest() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Time is up! Submitting your test automatically.'),
        backgroundColor: AppTheme.error,
        duration: Duration(seconds: 3),
      ),
    );
    _calculateAndSubmit();
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

  void _calculateAndSubmit() {
    _timer?.cancel();

    // Sync all NAT inputs before calculating
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

    double calculatedScore = 0.0;
    int correctCount = 0;
    int incorrectCount = 0;
    int unattemptedCount = 0;

    final Map<String, bool> answersCorrectness = {};
    final Map<String, List<String>> subjectPerformance = {}; // subject -> [correct/total]

    for (var q in widget.questions) {
      final uAns = _userAnswers[q.id];
      final cAns = q.correctAnswer;

      // Initialize subject tracking
      if (!subjectPerformance.containsKey(q.subject)) {
        subjectPerformance[q.subject] = ['0', '0']; // [correct, total]
      }
      final currentTotal = int.parse(subjectPerformance[q.subject]![1]);
      subjectPerformance[q.subject]![1] = (currentTotal + 1).toString();

      if (uAns == null || uAns.isEmpty) {
        unattemptedCount++;
        answersCorrectness[q.id] = false;
      } else {
        final isCorrect = q.isAnswerCorrect(uAns);

        if (isCorrect) {
          correctCount++;
          calculatedScore += 1.0;
          answersCorrectness[q.id] = true;

          final currentCorrect = int.parse(subjectPerformance[q.subject]![0]);
          subjectPerformance[q.subject]![0] = (currentCorrect + 1).toString();
        } else {
          incorrectCount++;
          answersCorrectness[q.id] = false;
          if (q.type == 'MCQ') {
            calculatedScore -= 1.0 / 3.0; // standard negative marking for MCQ
          }
        }
      }
    }

    // Limit score to >= 0
    if (calculatedScore < 0) {
      calculatedScore = 0.0;
    }

    // Normalize score to percentage (0 - 100)
    final double maxScore = widget.questions.length.toDouble();
    final double percentageScore = (calculatedScore / maxScore) * 100.0;

    // Identify weak subjects (where accuracy is < 50%)
    final List<String> weakSubjects = [];
    subjectPerformance.forEach((subject, counts) {
      final double corr = double.parse(counts[0]);
      final double tot = double.parse(counts[1]);
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
      'In-App practice test completed.\nAccuracy: ${(correctCount / maxScore * 100).toStringAsFixed(1)}%\nCorrect: $correctCount, Incorrect: $incorrectCount, Unattempted: $unattemptedCount\nTime taken: $timeTakenMinutes mins',
    );

    // Show Interstitial Ad right after they submit
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
          title: const Text('Quit Mock Test?', style: TextStyle(color: AppTheme.error)),
          content: const Text('Are you sure you want to exit? Your progress will be lost and this test will not be saved.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel', style: TextStyle(color: AppTheme.textSecondary)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppTheme.error),
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Exit Test', style: TextStyle(color: AppTheme.textPrimary)),
            ),
          ],
        );
      },
    );

    return confirm ?? false;
  }

  void _showSubmitConfirmation() {
    // Sync inputs
    _natControllers.forEach((qId, controller) {
      final text = controller.text.trim();
      if (text.isNotEmpty) {
        _userAnswers[qId] = text;
      } else {
        _userAnswers.remove(qId);
      }
    });
    _msqSelections.forEach((qId, selections) {
      if (selections.isNotEmpty) {
        final sorted = selections.toList()..sort();
        _userAnswers[qId] = sorted.join(';');
      } else {
        _userAnswers.remove(qId);
      }
    });

    final answeredCount = _userAnswers.length;
    final unansweredCount = widget.questions.length - answeredCount;
    final markedCount = _markedForReview.length;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppTheme.surface,
          title: const Text('Submit Test?'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total Questions: ${widget.questions.length}'),
              const SizedBox(height: 8),
              Text('Answered: $answeredCount', style: const TextStyle(color: AppTheme.success, fontWeight: FontWeight.bold)),
              Text('Unanswered: $unansweredCount', style: TextStyle(color: unansweredCount > 0 ? AppTheme.error : AppTheme.textSecondary)),
              Text('Marked for Review: $markedCount', style: const TextStyle(color: Colors.purpleAccent)),
              const SizedBox(height: 16),
              const Text('Do you want to submit and view your score?'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Go Back', style: TextStyle(color: AppTheme.textSecondary)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppTheme.secondary),
              onPressed: () {
                Navigator.pop(context); // Close dialog
                _calculateAndSubmit();
              },
              child: const Text('Submit Test', style: TextStyle(color: AppTheme.background, fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  void _showQuestionsMapSheet() {
    // Sync inputs locally before displaying sheet
    _natControllers.forEach((qId, controller) {
      final text = controller.text.trim();
      if (text.isNotEmpty) {
        _userAnswers[qId] = text;
      } else {
        _userAnswers.remove(qId);
      }
    });
    _msqSelections.forEach((qId, selections) {
      if (selections.isNotEmpty) {
        final sorted = selections.toList()..sort();
        _userAnswers[qId] = sorted.join(';');
      } else {
        _userAnswers.remove(qId);
      }
    });

    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Question Navigator',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: AppTheme.textSecondary),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Legend
              Wrap(
                spacing: 12,
                children: [
                  _buildLegendItem(Colors.green, 'Answered'),
                  _buildLegendItem(Colors.purpleAccent, 'Marked'),
                  _buildLegendItem(AppTheme.primary, 'Visited'),
                  _buildLegendItem(AppTheme.background, 'Unvisited'),
                ],
              ),
              const SizedBox(height: 16),
              Flexible(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: widget.questions.length,
                  itemBuilder: (context, index) {
                    final q = widget.questions[index];
                    final isMarked = _markedForReview.contains(q.id);
                    final isAnswered = _userAnswers.containsKey(q.id) && _userAnswers[q.id]!.isNotEmpty;
                    final isVisited = _visitedQuestions.contains(q.id);
                    final isCurrent = index == _currentIndex;

                    Color circleCol = AppTheme.background;
                    Color borderCol = Colors.white.withValues(alpha: 0.1);

                    if (isAnswered) {
                      circleCol = AppTheme.success.withValues(alpha: 0.2);
                      borderCol = AppTheme.success;
                    } else if (isMarked) {
                      circleCol = Colors.purple.withValues(alpha: 0.2);
                      borderCol = Colors.purpleAccent;
                    } else if (isVisited) {
                      circleCol = AppTheme.primary.withValues(alpha: 0.15);
                      borderCol = AppTheme.primary;
                    }

                    if (isCurrent) {
                      borderCol = AppTheme.secondary;
                    }

                    return InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        setState(() {
                          _currentIndex = index;
                          _visitedQuestions.add(q.id);
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: circleCol,
                          shape: BoxShape.circle,
                          border: Border.all(color: borderCol, width: isCurrent ? 2.5 : 1.5),
                        ),
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            color: isCurrent ? AppTheme.secondary : Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLegendItem(Color color, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.2),
            shape: BoxShape.circle,
            border: Border.all(color: color, width: 1.5),
          ),
        ),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 11)),
      ],
    );
  }

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
    final bool isLast = _currentIndex == widget.questions.length - 1;
    final bool isLowTime = _secondsRemaining < 300; // 5 minutes

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
          title: Text(widget.testName, style: AppTheme.poppinsBold(fontSize: 16)),
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
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.calculate_outlined),
                  tooltip: 'Virtual Calculator',
                  onPressed: () {
                    VirtualCalculator.show(context);
                  },
                ),
                Icon(
                  Icons.timer_outlined,
                  size: 18,
                  color: isLowTime ? AppTheme.error : AppTheme.secondary,
                ),
                const SizedBox(width: 4),
                Text(
                  _formatTime(_secondsRemaining),
                  style: AppTheme.timerStyle(
                    fontSize: 16,
                    color: isLowTime ? AppTheme.error : AppTheme.secondary,
                  ),
                ),
                const SizedBox(width: 12),
              ],
            )
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
                  minHeight: 4,
                ),
                // Question Content
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
                                color: AppTheme.primary.withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                'Q. ${_currentIndex + 1} of ${widget.questions.length}',
                                style: const TextStyle(
                                  color: AppTheme.primary,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: q.type == 'MSQ'
                                    ? AppTheme.error.withValues(alpha: 0.12)
                                    : q.type == 'NAT'
                                        ? AppTheme.success.withValues(alpha: 0.12)
                                        : AppTheme.primary.withValues(alpha: 0.12),
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
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const Spacer(),
                            if (_userAnswers.containsKey(q.id) && _userAnswers[q.id]!.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(right: 4.0),
                                child: TextButton.icon(
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    visualDensity: VisualDensity.compact,
                                  ),
                                  onPressed: _clearCurrentAnswer,
                                  icon: const Icon(Icons.clear_rounded, size: 14, color: AppTheme.error),
                                  label: const Text('Clear Response', style: TextStyle(color: AppTheme.error, fontSize: 11, fontWeight: FontWeight.bold)),
                                ),
                              ),
                            IconButton(
                              icon: Icon(
                                _markedForReview.contains(q.id)
                                    ? Icons.bookmark
                                    : Icons.bookmark_border,
                                color: _markedForReview.contains(q.id)
                                    ? Colors.purpleAccent
                                    : AppTheme.textSecondary,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (_markedForReview.contains(q.id)) {
                                    _markedForReview.remove(q.id);
                                  } else {
                                    _markedForReview.add(q.id);
                                  }
                                });
                              },
                              tooltip: 'Mark for Review',
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        // Subject Tag
                        Text(
                          '${q.subject} > ${q.topic}',
                          style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12),
                        ),
                        const SizedBox(height: 16),
                        // Question Body
                        _buildQuestionText(q.questionText),
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
                        // Answer inputs
                        if (q.isMCQ)
                          _buildMockMCQOptions(q)
                        else
                          _buildMockNATInput(q),
                      ],
                    ),
                  ),
                ),
                // Bottom control bar
                Container(
                  color: AppTheme.surface,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.background,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        ),
                        onPressed: _currentIndex > 0
                            ? () {
                                HapticFeedback.selectionClick();
                                setState(() {
                                  _currentIndex--;
                                  _visitedQuestions.add(widget.questions[_currentIndex].id);
                                });
                              }
                            : null,
                        child: const Text('PREVIOUS'),
                      ),
                      IconButton(
                        icon: const Icon(Icons.grid_view_rounded, color: AppTheme.secondary),
                        onPressed: () {
                          HapticFeedback.lightImpact();
                          _showQuestionsMapSheet();
                        },
                        tooltip: 'View Question Navigator',
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isLast ? AppTheme.secondary : AppTheme.primary,
                          foregroundColor: isLast ? AppTheme.background : Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        ),
                        onPressed: () {
                          HapticFeedback.selectionClick();
                          if (isLast) {
                            _showSubmitConfirmation();
                          } else {
                            setState(() {
                              _currentIndex++;
                              _visitedQuestions.add(widget.questions[_currentIndex].id);
                            });
                          }
                        },
                        child: Text(
                          isLast ? 'SUBMIT TEST' : 'NEXT',
                          style: TextStyle(
                            fontWeight: isLast ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
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

        return Card(
          margin: const EdgeInsets.only(bottom: 8.0),
          color: isSelected ? AppTheme.primary.withValues(alpha: 0.08) : AppTheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: isSelected ? AppTheme.primary : Colors.white.withValues(alpha: 0.05),
              width: 1.5,
            ),
          ),
          child: InkWell(
            onTap: () {
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
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected ? AppTheme.primary : AppTheme.background,
                      shape: q.type == 'MSQ' ? BoxShape.rectangle : BoxShape.circle,
                      borderRadius: q.type == 'MSQ' ? BorderRadius.circular(6) : null,
                      border: Border.all(
                        color: isSelected ? Colors.transparent : AppTheme.textSecondary.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Text(
                      letter,
                      style: TextStyle(
                        color: isSelected ? Colors.white : AppTheme.textPrimary,
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
                      textColor: isSelected ? AppTheme.primary : AppTheme.textPrimary,
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
        const Text(
          'Enter your numerical answer:',
          style: TextStyle(fontSize: 12, color: AppTheme.textSecondary, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          style: const TextStyle(color: AppTheme.textPrimary, fontSize: 16),
          decoration: InputDecoration(
            hintText: 'e.g., 14.5 or 0.33',
            hintStyle: const TextStyle(color: AppTheme.textSecondary),
            filled: true,
            fillColor: AppTheme.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppTheme.textPrimary.withValues(alpha: 0.05)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppTheme.primary, width: 1.5),
            ),
          ),
          onChanged: (val) {
            if (val.trim().isNotEmpty) {
              _userAnswers[q.id] = val.trim();
            } else {
              _userAnswers.remove(q.id);
            }
          },
        ),
      ],
    );
  }

  Widget _buildScoreSummaryScreen() {
    double calculatedScore = 0.0;
    int correctCount = 0;
    int incorrectCount = 0;
    int unattemptedCount = 0;

    for (var q in widget.questions) {
      final uAns = _userAnswers[q.id];
      final cAns = q.correctAnswer;

      if (uAns == null || uAns.isEmpty) {
        unattemptedCount++;
      } else {
        final isCorrect = q.isAnswerCorrect(uAns);

        if (isCorrect) {
          correctCount++;
          calculatedScore += 1.0;
        } else {
          incorrectCount++;
          if (q.type == 'MCQ') {
            calculatedScore -= 1.0 / 3.0;
          }
        }
      }
    }
    if (calculatedScore < 0) calculatedScore = 0.0;

    final double maxScore = widget.questions.length.toDouble();
    final double accuracy = maxScore > 0 ? (correctCount / maxScore) * 100.0 : 0.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Results'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            children: [
              // Top summary Card
              Card(
                margin: const EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(widget.testName.toUpperCase(), style: const TextStyle(color: AppTheme.secondary, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.1)),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            calculatedScore.toStringAsFixed(2),
                            style: AppTheme.timerStyle(fontSize: 48, color: AppTheme.secondary),
                          ),
                          Text(' / ${maxScore.toStringAsFixed(0)}', style: const TextStyle(color: AppTheme.textSecondary, fontSize: 20)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text('Final Practice Score', style: TextStyle(color: AppTheme.textSecondary, fontSize: 13)),
                      const SizedBox(height: 16),
                      const Divider(color: AppTheme.background),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildResultMiniStat('Accuracy', '${accuracy.toStringAsFixed(0)}%', AppTheme.primary),
                          _buildResultMiniStat('Correct', '$correctCount', AppTheme.success),
                          _buildResultMiniStat('Incorrect', '$incorrectCount', AppTheme.error),
                          _buildResultMiniStat('Skipped', '$unattemptedCount', AppTheme.textSecondary),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  physics: const BouncingScrollPhysics(),
                  itemCount: widget.questions.length,
                  itemBuilder: (context, index) {
                    final q = widget.questions[index];
                    return _MockQuestionReviewCard(
                      index: index,
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

  Widget _buildResultMiniStat(String label, String value, Color color) {
    return Column(
      children: [
        Text(value, style: AppTheme.timerStyle(fontSize: 20, color: color)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 10)),
      ],
    );
  }
}

class _MockQuestionReviewCard extends StatefulWidget {
  final int index;
  final PYQ pyq;
  final String? userAnswer;
  final Widget Function(String, {bool isExplanation}) buildTextHelper;

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
          title: const Text('Add to Error Log', style: TextStyle(color: AppTheme.error)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Topic: ${widget.pyq.topic}'),
              const SizedBox(height: 12),
              const Text('Why did you get this wrong? (e.g. Calculation error, concept forgotten)', style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
              const SizedBox(height: 6),
              TextField(
                controller: noteController,
                style: const TextStyle(color: AppTheme.textPrimary),
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: 'e.g., Read option wrong / Forgot standard formula',
                  hintStyle: const TextStyle(color: AppTheme.textSecondary, fontSize: 13),
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
                  whyWrongText.isNotEmpty ? whyWrongText : 'Incorrect in mock practice test.',
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
              child: const Text('Add Log', style: TextStyle(color: AppTheme.textPrimary)),
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

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
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
