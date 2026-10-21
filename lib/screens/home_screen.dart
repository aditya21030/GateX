import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/neu_widgets.dart';
import 'error_log_screen.dart';
import 'pro_upgrade_screen.dart';
import 'score_estimator_screen.dart';
import 'mock_test_runner_screen.dart';
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
        title: Text(
          'GateX',
          style: AppTheme.poppinsBold(fontSize: 22, color: context.textColor),
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

                // 2. GATE COUNTDOWN (Remaining Days placed above Rapid Fire)
                _buildCountdown(context, provider, daysLeft, weeksLeft, monthsLeft, urgencyColor),
                const SizedBox(height: 16),

                // 3. ⚡ 10-MINUTE DAILY RAPID FIRE SPRINT
                _buildRapidFireSprint(context, provider),
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
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 1. NEUMORPHIC STREAK HERO (Refined Warm Ember Orange with Clean Legible Accents)
  Widget _buildStreakHero(BuildContext context, AppProvider provider) {
    final streak = provider.streak;
    final todayWeekday = DateTime.now().weekday; // 1 = Mon, 7 = Sun
    const weekDays = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    const streakOrange = Color(0xFFEA580C);

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: context.isDarkMode
              ? const [Color(0xFF8A3008), Color(0xFF5E1F03)]
              : const [Color(0xFFFFF2E8), Color(0xFFFFE0CC)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: streakOrange.withValues(alpha: context.isDarkMode ? 0.45 : 0.7),
          width: 1.4,
        ),
        boxShadow: [
          BoxShadow(
            color: streakOrange.withValues(alpha: context.isDarkMode ? 0.22 : 0.15),
            blurRadius: 16,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: streakOrange.withValues(alpha: context.isDarkMode ? 0.35 : 0.15),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: streakOrange.withValues(alpha: 0.4)),
                ),
                child: Icon(
                  Icons.local_fire_department_rounded,
                  color: context.isDarkMode ? const Color(0xFFFFB088) : streakOrange,
                  size: 28,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$streak Day Streak 🔥',
                      style: GoogleFonts.poppins(
                        fontSize: 16.5,
                        fontWeight: FontWeight.bold,
                        color: context.isDarkMode ? Colors.white : const Color(0xFF7C2D12),
                        letterSpacing: -0.3,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      streak > 1 ? 'Goal on track • Keep pushing!' : 'Solve 1 PYQ to ignite streak',
                      style: GoogleFonts.outfit(
                        color: context.isDarkMode ? const Color(0xFFFFD4B8) : const Color(0xFF9A3412),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: streakOrange.withValues(alpha: context.isDarkMode ? 0.25 : 0.12),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: streakOrange.withValues(alpha: context.isDarkMode ? 0.5 : 0.4)),
                ),
                child: Text(
                  'ACTIVE',
                  style: GoogleFonts.outfit(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8,
                    color: context.isDarkMode ? const Color(0xFFFFB088) : streakOrange,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 7 Weekday Pills
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(7, (index) {
              final dayNum = index + 1;
              final isToday = dayNum == todayWeekday;
              final isCompleted = dayNum <= todayWeekday && (todayWeekday - dayNum) < streak;

              return Column(
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: isCompleted
                          ? streakOrange
                          : (isToday
                              ? streakOrange.withValues(alpha: context.isDarkMode ? 0.3 : 0.18)
                              : (context.isDarkMode ? Colors.white.withValues(alpha: 0.08) : Colors.black.withValues(alpha: 0.05))),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isToday
                            ? streakOrange
                            : (isCompleted
                                ? Colors.transparent
                                : (context.isDarkMode ? Colors.white.withValues(alpha: 0.12) : Colors.black.withValues(alpha: 0.1))),
                        width: isToday ? 2.0 : 1.0,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: isCompleted
                        ? const Icon(Icons.check_rounded, color: Colors.white, size: 20)
                        : Text(
                            weekDays[index],
                            style: GoogleFonts.outfit(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: isToday
                                  ? (context.isDarkMode ? const Color(0xFFFFB088) : streakOrange)
                                  : (context.isDarkMode ? const Color(0xFFFFD4B8).withValues(alpha: 0.6) : const Color(0xFF9A3412).withValues(alpha: 0.6)),
                            ),
                          ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    weekDays[index],
                    style: GoogleFonts.outfit(
                      fontSize: 10.5,
                      fontWeight: isToday ? FontWeight.bold : FontWeight.w600,
                      color: context.isDarkMode ? const Color(0xFFFFD4B8) : const Color(0xFF7C2D12),
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

  // 2. GATE 2027 COUNTDOWN (Modernized & Clean)
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
    const streakOrange = Color(0xFFEA580C);

    double prepPercentElapsed = 0.0;
    if (today.isAfter(examDate)) {
      prepPercentElapsed = 1.0;
    } else if (today.isAfter(planStart)) {
      final daysPassed = today.difference(planStart).inDays;
      prepPercentElapsed = (daysPassed / totalPrepDays).clamp(0.0, 1.0);
    }

    return NeuContainer(
      padding: const EdgeInsets.all(18),
      borderRadius: 22,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppTheme.accentPurple.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.timer_outlined, size: 16, color: AppTheme.accentPurple),
              ),
              const SizedBox(width: 8),
              Text(
                examName,
                style: GoogleFonts.outfit(
                  color: context.textColor,
                  fontSize: 13.5,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 3 Countdown metric tiles with perfectly aligned heights and baselines
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 72,
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                  decoration: BoxDecoration(
                    color: context.colorSurfaceElevated,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: context.colorBorder),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$daysLeft',
                        style: GoogleFonts.outfit(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: streakOrange,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'DAYS LEFT',
                        maxLines: 1,
                        style: GoogleFonts.outfit(
                          fontSize: 9.5,
                          fontWeight: FontWeight.bold,
                          color: context.textSecondaryColor,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  height: 72,
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                  decoration: BoxDecoration(
                    color: context.colorSurfaceElevated,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: context.colorBorder),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$weeksLeft',
                        style: GoogleFonts.outfit(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: AppTheme.accentMint,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'WEEKS',
                        maxLines: 1,
                        style: GoogleFonts.outfit(
                          fontSize: 9.5,
                          fontWeight: FontWeight.bold,
                          color: context.textSecondaryColor,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  height: 72,
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                  decoration: BoxDecoration(
                    color: context.colorSurfaceElevated,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: context.colorBorder),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '1 Feb',
                        style: GoogleFonts.outfit(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: AppTheme.accentPurple,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'EXAM DATE',
                        maxLines: 1,
                        style: GoogleFonts.outfit(
                          fontSize: 9.5,
                          fontWeight: FontWeight.bold,
                          color: context.textSecondaryColor,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Progress Bar (Color matches the streak orange) & Meta
          NeuProgressBar(
            progress: prepPercentElapsed,
            progressColor: streakOrange,
            height: 7,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${(prepPercentElapsed * 100).toStringAsFixed(0)}% prep period elapsed',
                style: GoogleFonts.outfit(color: context.textSecondaryColor, fontSize: 11, fontWeight: FontWeight.w500),
              ),
              Text(
                'Make each day count 🚀',
                style: GoogleFonts.outfit(color: AppTheme.accentPurple, fontSize: 11, fontWeight: FontWeight.bold),
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
          border: Border.all(
            color: isCompleted ? AppTheme.accentMint.withValues(alpha: 0.35) : Colors.transparent,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            NeuIconTile(
              icon: isCompleted ? Icons.check_circle_rounded : icon,
              iconColor: isCompleted ? AppTheme.accentMint : iconColor,
              size: 34,
              iconSize: 16,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: isCompleted ? (context.isDarkMode ? Colors.white : AppTheme.textPrimary) : context.textColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
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

  // 6. HIGH-YIELD PRACTICE & PREDICTION TOOLS
  Widget _buildToolsGrid(BuildContext context, AppProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  HapticFeedback.selectionClick();
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ScoreEstimatorScreen()));
                },
                child: NeuContainer(
                  borderRadius: 18,
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const NeuIconTile(
                            icon: Icons.auto_awesome,
                            iconColor: AppTheme.accentGold,
                            size: 36,
                            iconSize: 18,
                          ),
                          
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'AIR Predictor',
                        style: AppTheme.poppinsBold(fontSize: 13.5, color: context.textColor),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Rank & Score Forecast',
                        style: TextStyle(fontSize: 10.5, color: context.textSecondaryColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  HapticFeedback.selectionClick();
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ErrorLogScreen()));
                },
                child: NeuContainer(
                  borderRadius: 18,
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const NeuIconTile(
                            icon: Icons.error_outline_rounded,
                            iconColor: AppTheme.accentCoral,
                            size: 36,
                            iconSize: 18,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                            decoration: BoxDecoration(
                              color: AppTheme.accentCoral.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              '${provider.errorLog.length} Saved',
                              style: const TextStyle(
                                fontSize: 9.5,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.accentCoral,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Mistakes Log',
                        style: AppTheme.poppinsBold(fontSize: 13.5, color: context.textColor),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Turn Errors into Marks',
                        style: TextStyle(fontSize: 10.5, color: context.textSecondaryColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
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
