import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/neu_widgets.dart';
import 'error_log_screen.dart';
import 'formula_sheet_screen.dart';
import 'pro_upgrade_screen.dart';
import 'community_screen.dart';
import 'score_estimator_screen.dart';
import 'coap_screen.dart';
import 'weightage_screen.dart';
import 'mock_test_runner_screen.dart';
import 'pomodoro_screen.dart';
import '../widgets/virtual_calculator.dart';
import '../models/models.dart';
import '../data/minimock_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PYQ> _generateRapidFireQuestions(AppProvider provider) {
    List<PYQ> pool = [];
    if (provider.activeExam == 'DA') {
      if (daMiniMockQuestions.isNotEmpty) {
        pool = List.from(daMiniMockQuestions);
      } else {
        pool = List.from(provider.pyqs);
      }
    } else {
      if (csitMiniMockQuestions.isNotEmpty) {
        pool = List.from(csitMiniMockQuestions);
      } else {
        pool = List.from(provider.pyqs);
      }
    }
    pool.shuffle();
    return pool.take(min(5, pool.length)).toList();
  }

  void _startRapidFire(AppProvider provider) {
    HapticFeedback.mediumImpact();
    final questions = _generateRapidFireQuestions(provider);
    if (questions.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Loading questions for Daily Rapid Fire...'),
          backgroundColor: AppTheme.primary,
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MockTestRunnerScreen(
          questions: questions,
          duration: const Duration(minutes: 10),
          testName: 'Daily Rapid Fire (10 Min)',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);

    // GATE 2027 Countdown
    final now = DateTime.now();
    final gateExamDate = DateTime(2027, 2, 1);
    final daysLeft = max(0, gateExamDate.difference(now).inDays);
    final weeksLeft = (daysLeft / 7).ceil();
    final monthsLeft = (daysLeft / 30).floor();

    final Color urgencyColor;
    if (daysLeft >= 180) {
      urgencyColor = AppTheme.accentMint;
    } else if (daysLeft >= 100) {
      urgencyColor = AppTheme.accentGold;
    } else {
      urgencyColor = AppTheme.accentCoral;
    }

    // Today's topics from planner
    final today = DateTime.now();
    final todayTopics = provider.getTopicsForDate(today);
    final todayTopic = todayTopics.isNotEmpty ? todayTopics[0] : null;

    final completedTopicsCount = provider.topics.where((t) => t.isCompleted).length;
    final totalTopicsCount = provider.topics.isNotEmpty ? provider.topics.length : 1;
    final completedPYQsCount = provider.pyqs.where((p) => p.isCompleted).length;
    final mocksCount = provider.mockLogs.length;

    return Scaffold(
      backgroundColor: context.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: context.scaffoldBackground,
        elevation: 0,
        title: Row(
          children: [
            Text(
              'GateX',
              style: AppTheme.poppinsBold(fontSize: 22, color: context.textColor),
            ),
            if (provider.selectedExam == 'BOTH')
              Container(
                margin: const EdgeInsets.only(left: 10),
                height: 30,
                decoration: BoxDecoration(
                  color: context.colorSurfaceElevated,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildSwitchButton(context, provider, 'DA'),
                    _buildSwitchButton(context, provider, 'CSIT'),
                  ],
                ),
              )
            else
              GestureDetector(
                onTap: () {
                  HapticFeedback.selectionClick();
                  _showBranchSwitcherSheet(context, provider);
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppTheme.accentPurple.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppTheme.accentPurple.withValues(alpha: 0.3)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        provider.activeExam ?? 'DA',
                        style: const TextStyle(
                          color: AppTheme.accentPurple,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                      const SizedBox(width: 3),
                      const Icon(Icons.arrow_drop_down_rounded, size: 14, color: AppTheme.accentPurple),
                    ],
                  ),
                ),
              ),
          ],
        ),
        actions: [
          // Tactile Streak Flame Pill
          NeuContainer(
            borderRadius: 16,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.local_fire_department_rounded, size: 16, color: AppTheme.accentFlame),
                const SizedBox(width: 4),
                Text(
                  '${provider.streak}d',
                  style: const TextStyle(
                    color: AppTheme.accentFlame,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),

          // Pro Pass Pill
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                HapticFeedback.selectionClick();
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ProUpgradeScreen()));
              },
              child: NeuContainer(
                borderRadius: 16,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      provider.isPro ? Icons.workspace_premium_rounded : Icons.star_border_rounded,
                      size: 14,
                      color: provider.isPro ? AppTheme.accentGold : context.textSecondaryColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      provider.isPro ? 'PRO' : 'PASS',
                      style: TextStyle(
                        color: provider.isPro ? AppTheme.accentGold : context.textSecondaryColor,
                        fontSize: 10.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 6),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. NEUMORPHIC STREAK & WEEKDAY HERO
                _buildStreakHero(context, provider),
                const SizedBox(height: 16),

                // 2. ⚡ 10-MINUTE DAILY RAPID FIRE SPRINT
                _buildRapidFireSprint(context, provider),
                const SizedBox(height: 16),

                // 3. GATE 2027 COUNTDOWN
                _buildCountdown(context, provider, daysLeft, weeksLeft, monthsLeft, urgencyColor),
                const SizedBox(height: 16),

                // 4. DAILY MISSIONS (Minimal text, clear progress)
                _buildDailyMissions(context, provider, todayTopic),
                const SizedBox(height: 16),

                // 5. COMPACT 3-STAT NEUMORPHIC CARDS
                _buildStatsGrid(context, completedTopicsCount, totalTopicsCount, completedPYQsCount, mocksCount),
                const SizedBox(height: 20),

                // 6. CORE STUDY TOOLS (2x2 Tactile Grid)
                _buildToolsGrid(context, provider),
                const SizedBox(height: 16),

                // 7. PEER DOUBT COMMUNITY BANNER
                _buildCommunityBanner(context),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 1. NEUMORPHIC STREAK HERO (Minimal Text, Tactile Day Buttons)
  Widget _buildStreakHero(BuildContext context, AppProvider provider) {
    final streak = provider.streak;
    final todayWeekday = DateTime.now().weekday; // 1 = Mon, 7 = Sun
    const weekDays = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    return NeuContainer(
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF9F43), Color(0xFFFF5252)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.accentFlame.withValues(alpha: 0.35),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Icon(Icons.local_fire_department_rounded, color: Colors.white, size: 26),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$streak Day Streak',
                      style: AppTheme.poppinsBold(fontSize: 16, color: context.textColor),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      streak > 1 ? 'Goal on track' : 'Solve 1 PYQ to maintain streak',
                      style: TextStyle(color: context.textSecondaryColor, fontSize: 11),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 7 Tactile Weekday Pills
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(7, (index) {
              final dayNum = index + 1;
              final isToday = dayNum == todayWeekday;
              final isCompleted = dayNum <= todayWeekday && (todayWeekday - dayNum) < streak;

              return Column(
                children: [
                  NeuContainer(
                    width: 38,
                    height: 38,
                    borderRadius: 19,
                    isRecessed: !isCompleted && !isToday,
                    padding: EdgeInsets.zero,
                    color: isCompleted
                        ? AppTheme.accentFlame
                        : (isToday ? AppTheme.accentFlame.withValues(alpha: 0.15) : null),
                    alignment: Alignment.center,
                    child: isCompleted
                        ? const Icon(Icons.check_rounded, color: Colors.white, size: 18)
                        : Text(
                            weekDays[index],
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: isToday ? AppTheme.accentFlame : context.textSecondaryColor,
                            ),
                          ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    weekDays[index],
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                      color: isToday ? AppTheme.accentFlame : context.textSecondaryColor,
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }

  // 2. ⚡ 10-MINUTE RAPID FIRE SPRINT (Vibe Coded Shimmer Container)
  Widget _buildRapidFireSprint(BuildContext context, AppProvider provider) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            AppTheme.accentPurple.withValues(alpha: context.isDarkMode ? 0.22 : 0.08),
            const Color(0xFF06B6D4).withValues(alpha: context.isDarkMode ? 0.14 : 0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(
          color: AppTheme.accentPurple.withValues(alpha: context.isDarkMode ? 0.35 : 0.20),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.accentPurple.withValues(alpha: context.isDarkMode ? 0.16 : 0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: NeuContainer(
        borderRadius: 20,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppTheme.accentPurple, Color(0xFF06B6D4)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.accentPurple.withValues(alpha: 0.35),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Icon(Icons.bolt_rounded, color: Colors.white, size: 24),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rapid Fire',
                    style: AppTheme.poppinsBold(fontSize: 14, color: context.textColor),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppTheme.accentPurple.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          '5 Qs • 10m',
                          style: TextStyle(color: AppTheme.accentPurple, fontSize: 9.5, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Timed Practice',
                        style: TextStyle(color: context.textSecondaryColor, fontSize: 11),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            NeuButton(
              isPrimary: true,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              borderRadius: 14,
              onPressed: () => _startRapidFire(provider),
              child: const Text(
                'Start',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 3. GATE 2027 COUNTDOWN
  Widget _buildCountdown(
    BuildContext context,
    AppProvider provider,
    int daysLeft,
    int weeksLeft,
    int monthsLeft,
    Color urgencyColor,
  ) {
    final examName = provider.activeExam == 'CSIT' ? 'GATE CS/IT 2027' : 'GATE DA 2027';
    final planStart = DateTime(2026, 5, 1);
    final examDate = DateTime(2027, 2, 1);
    final totalPrepDays = examDate.difference(planStart).inDays;
    final today = DateTime.now();

    double prepPercentElapsed = 0.0;
    if (today.isAfter(examDate)) {
      prepPercentElapsed = 1.0;
    } else if (today.isAfter(planStart)) {
      final daysPassed = today.difference(planStart).inDays;
      prepPercentElapsed = (daysPassed / totalPrepDays).clamp(0.0, 1.0);
    }

    return NeuContainer(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                examName,
                style: TextStyle(
                  color: context.textSecondaryColor,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: urgencyColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '$daysLeft Days Left',
                  style: TextStyle(
                    color: urgencyColor,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          NeuProgressBar(
            progress: prepPercentElapsed,
            progressColor: urgencyColor,
            height: 8,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$weeksLeft wks remaining',
                style: TextStyle(color: context.textSecondaryColor, fontSize: 10.5),
              ),
              Text(
                '${(prepPercentElapsed * 100).toStringAsFixed(0)}% Season Elapsed • 1 Feb 2027',
                style: TextStyle(color: context.textSecondaryColor, fontSize: 10.5, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 4. DAILY MISSIONS (Minimal Text, Daily Resetting Goals)
  Widget _buildDailyMissions(BuildContext context, AppProvider provider, TopicStatus? todayTopic) {
    final bool topicDone = todayTopic?.isCompleted ?? false;
    final int todayPyqs = provider.todayPyqsSolvedCount;
    final bool pyqTargetDone = todayPyqs >= 5;
    final bool mockTakenToday = provider.isMockTakenToday;

    int missionsDone = 0;
    if (topicDone) missionsDone++;
    if (pyqTargetDone) missionsDone++;
    if (mockTakenToday) missionsDone++;

    return NeuContainer(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'TODAY\'S GOALS',
                style: TextStyle(
                  color: context.textSecondaryColor,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: missionsDone == 3
                      ? AppTheme.accentMint.withValues(alpha: 0.15)
                      : AppTheme.accentPurple.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '$missionsDone of 3',
                  style: TextStyle(
                    color: missionsDone == 3 ? AppTheme.accentMint : AppTheme.accentPurple,
                    fontSize: 10.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Mission 1: Syllabus Topic
          _buildMissionRow(
            context: context,
            icon: Icons.menu_book_rounded,
            iconColor: AppTheme.accentCyan,
            title: todayTopic != null ? todayTopic.topicName : 'Daily Syllabus Topic',
            ratioText: topicDone ? '1/1' : '0/1',
            progress: topicDone ? 1.0 : 0.0,
            isCompleted: topicDone,
            onTap: () => provider.setSelectedIndex(1),
          ),
          const SizedBox(height: 10),

          // Mission 2: Solve 5 PYQs (Daily Reset)
          _buildMissionRow(
            context: context,
            icon: Icons.checklist_rtl_rounded,
            iconColor: AppTheme.accentGold,
            title: 'Solve 5 PYQs Today',
            ratioText: '${min(5, todayPyqs)}/5',
            progress: (todayPyqs / 5.0).clamp(0.0, 1.0),
            isCompleted: pyqTargetDone,
            onTap: () => provider.setSelectedIndex(2),
          ),
          const SizedBox(height: 10),

          // Mission 3: Test or Sprint (Today)
          _buildMissionRow(
            context: context,
            icon: Icons.sports_score_rounded,
            iconColor: AppTheme.accentCoral,
            title: 'Mock Test or Drill Today',
            ratioText: mockTakenToday ? '1/1' : '0/1',
            progress: mockTakenToday ? 1.0 : 0.0,
            isCompleted: mockTakenToday,
            onTap: () => _startRapidFire(provider),
          ),
        ],
      ),
    );
  }

  Widget _buildMissionRow({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String title,
    required String ratioText,
    required double progress,
    required bool isCompleted,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: () {
        HapticFeedback.selectionClick();
        onTap();
      },
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: context.colorSurfaceElevated,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            NeuIconTile(
              icon: icon,
              iconColor: iconColor,
              size: 34,
              iconSize: 16,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: isCompleted ? AppTheme.accentMint : context.textColor,
                  decoration: isCompleted ? TextDecoration.lineThrough : null,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    ratioText,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: isCompleted ? AppTheme.accentMint : context.textSecondaryColor,
                    ),
                  ),
                  const SizedBox(height: 3),
                  NeuProgressBar(
                    progress: progress,
                    progressColor: isCompleted ? AppTheme.accentMint : iconColor,
                    height: 4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 5. COMPACT 3-STAT NEUMORPHIC CARDS
  Widget _buildStatsGrid(
    BuildContext context,
    int topicsDone,
    int totalTopics,
    int pyqsSolved,
    int mocksCount,
  ) {
    return Row(
      children: [
        _buildStatTile(
          context: context,
          icon: Icons.checklist_rtl_rounded,
          iconColor: AppTheme.accentPurple,
          label: 'Syllabus',
          value: '${((topicsDone / totalTopics) * 100).toStringAsFixed(0)}%',
          onTap: () => Provider.of<AppProvider>(context, listen: false).setSelectedIndex(1),
        ),
        const SizedBox(width: 10),
        _buildStatTile(
          context: context,
          icon: Icons.menu_book_rounded,
          iconColor: AppTheme.accentGold,
          label: 'PYQs',
          value: '$pyqsSolved',
          onTap: () => Provider.of<AppProvider>(context, listen: false).setSelectedIndex(2),
        ),
        const SizedBox(width: 10),
        _buildStatTile(
          context: context,
          icon: Icons.sports_score_rounded,
          iconColor: AppTheme.accentMint,
          label: 'Mocks',
          value: '$mocksCount',
          onTap: () => Provider.of<AppProvider>(context, listen: false).setSelectedIndex(3),
        ),
      ],
    );
  }

  Widget _buildStatTile({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          HapticFeedback.selectionClick();
          onTap();
        },
        child: NeuContainer(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          borderRadius: 18,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NeuIconTile(
                icon: icon,
                iconColor: iconColor,
                size: 32,
                iconSize: 16,
              ),
              const SizedBox(height: 8),
              Text(
                value,
                style: AppTheme.timerStyle(fontSize: 16, color: context.textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 1),
              Text(
                label,
                style: TextStyle(color: context.textSecondaryColor, fontSize: 10.5, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 6. HIGH-YIELD STUDY TOOLS (Tactile Grid with Calculator, Formulas, COAP, Estimator, Mistakes, Doubts, Focus)
  Widget _buildToolsGrid(BuildContext context, AppProvider provider) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _ToolTile(
                icon: Icons.functions_rounded,
                iconColor: AppTheme.accentCyan,
                label: 'Formulas',
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const FormulaSheetScreen())),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _ToolTile(
                icon: Icons.calculate_rounded,
                iconColor: const Color(0xFF10B981),
                label: 'Calculator',
                onTap: () => VirtualCalculator.show(context),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: _ToolTile(
                icon: Icons.assessment_outlined,
                iconColor: AppTheme.accentGold,
                label: 'Estimator',
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ScoreEstimatorScreen())),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _ToolTile(
                icon: Icons.account_balance_outlined,
                iconColor: const Color(0xFF38BDF8),
                label: 'COAP & CCMT',
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const COAPScreen())),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: _ToolTile(
                icon: Icons.error_outline_rounded,
                iconColor: AppTheme.accentCoral,
                label: 'Mistakes',
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ErrorLogScreen())),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _ToolTile(
                icon: Icons.bar_chart_rounded,
                iconColor: AppTheme.accentMint,
                label: 'Weightage',
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const WeightageScreen())),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: _ToolTile(
                icon: Icons.forum_rounded,
                iconColor: AppTheme.accentPurple,
                label: 'Doubts',
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CommunityScreen())),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _ToolTile(
                icon: Icons.timer_outlined,
                iconColor: const Color(0xFFF59E0B),
                label: 'Focus Timer',
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PomodoroScreen())),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // 7. PEER DOUBT COMMUNITY BANNER
  Widget _buildCommunityBanner(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        Navigator.push(context, MaterialPageRoute(builder: (_) => const CommunityScreen()));
      },
      child: NeuContainer(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        borderRadius: 18,
        child: Row(
          children: [
            const NeuIconTile(
              icon: Icons.forum_rounded,
              iconColor: AppTheme.accentMint,
              size: 38,
              iconSize: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Aspirant Community',
                    style: AppTheme.poppinsBold(fontSize: 13, color: context.textColor),
                  ),
                  Text(
                    'Discuss doubts with fellow aspirants',
                    style: TextStyle(color: context.textSecondaryColor, fontSize: 10.5),
                  ),
                ],
              ),
            ),
            NeuButton(
              isPrimary: true,
              borderRadius: 12,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: const Text('Join', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  void _showBranchSwitcherSheet(BuildContext context, AppProvider provider) {
    showModalBottomSheet(
      context: context,
      backgroundColor: context.scaffoldBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select Active Branch',
                    style: AppTheme.poppinsBold(fontSize: 16, color: context.textColor),
                  ),
                  IconButton(
                    icon: Icon(Icons.close_rounded, color: context.textSecondaryColor),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _buildBranchTile(
                context: context,
                title: 'GATE DA (Data Science & AI)',
                subtitle: 'Machine Learning, AI, Probability & Linear Algebra',
                isSelected: provider.activeExam == 'DA' && provider.selectedExam != 'BOTH',
                onTap: () {
                  provider.setExams('DA', 'DA');
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 10),
              _buildBranchTile(
                context: context,
                title: 'GATE CS/IT (Computer Science)',
                subtitle: 'Algorithms, OS, CN, DBMS, TOC, Compiler',
                isSelected: provider.activeExam == 'CSIT' && provider.selectedExam != 'BOTH',
                onTap: () {
                  provider.setExams('CSIT', 'CSIT');
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 10),
              _buildBranchTile(
                context: context,
                title: 'Dual Preparation (BOTH)',
                subtitle: 'Switch between DA & CS/IT anytime via top bar',
                isSelected: provider.selectedExam == 'BOTH',
                onTap: () {
                  provider.setExams('BOTH', provider.activeExam ?? 'DA');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBranchTile({
    required BuildContext context,
    required String title,
    required String subtitle,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        onTap();
      },
      child: NeuContainer(
        borderRadius: 16,
        padding: const EdgeInsets.all(12),
        color: isSelected ? AppTheme.accentPurple.withValues(alpha: 0.12) : null,
        border: Border.all(
          color: isSelected ? AppTheme.accentPurple : (context.isDarkMode ? Colors.white10 : Colors.black12),
          width: isSelected ? 1.5 : 1.0,
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked_rounded : Icons.radio_button_off_rounded,
              color: isSelected ? AppTheme.accentPurple : context.textSecondaryColor,
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.5,
                      color: isSelected ? AppTheme.accentPurple : context.textColor,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 11, color: context.textSecondaryColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchButton(BuildContext context, AppProvider provider, String exam) {
    final isSelected = provider.activeExam == exam;
    return GestureDetector(
      onTap: () => provider.setActiveExam(exam),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.accentPurple : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          exam,
          style: TextStyle(
            color: isSelected ? Colors.white : context.textSecondaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}

class _ToolTile extends StatefulWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final VoidCallback onTap;

  const _ToolTile({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.onTap,
  });

  @override
  State<_ToolTile> createState() => _ToolTileState();
}

class _ToolTileState extends State<_ToolTile> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: () {
        HapticFeedback.selectionClick();
        widget.onTap();
      },
      child: AnimatedScale(
        scale: _isPressed ? 0.96 : 1.0,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOutCubic,
        child: NeuContainer(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
          borderRadius: 18,
          child: Row(
            children: [
              NeuIconTile(
                icon: widget.icon,
                iconColor: widget.iconColor,
                size: 36,
                iconSize: 19,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  widget.label,
                  style: AppTheme.poppinsBold(fontSize: 13, color: context.textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(Icons.chevron_right_rounded, color: context.textSecondaryColor.withValues(alpha: 0.5), size: 16),
            ],
          ),
        ),
      ),
    );
  }
}
