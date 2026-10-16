import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../theme/app_theme.dart';
import 'error_log_screen.dart';
import 'pomodoro_screen.dart';
import 'score_estimator_screen.dart';
import 'formula_sheet_screen.dart';
import 'mock_tracker_screen.dart';
import 'mock_test_runner_screen.dart';
import 'weightage_screen.dart';
import 'revision_screen.dart';
import 'pro_upgrade_screen.dart';
import '../models/models.dart';
import '../services/ad_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _pulsingController;
  String? _tempActiveExam;

  @override
  void initState() {
    super.initState();
    _pulsingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulsingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final today = DateTime.now();
    final examDate = DateTime(2027, 2, 1);
    final daysLeft = max(0, examDate.difference(today).inDays);
    final weeksLeft = (daysLeft / 7).floor();
    final monthsLeft = (daysLeft / 30.4).floor();

    // Determine Urgency Color
    Color urgencyColor;
    if (daysLeft > 200) {
      urgencyColor = AppTheme.success;
    } else if (daysLeft >= 100) {
      urgencyColor = Colors.amber;
    } else {
      urgencyColor = AppTheme.error;
    }

    // Today's topics from planner
    final todayTopics = provider.getTopicsForDate(today);
    final hasTodayPlan = todayTopics.isNotEmpty;
    final todayTopic = hasTodayPlan ? todayTopics[0] : null;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'GateX ',
              style: AppTheme.poppinsBold(fontSize: 22),
            ),
            if (provider.selectedExam == 'BOTH')
              Container(
                margin: const EdgeInsets.only(left: 12),
                height: 32,
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppTheme.primary.withValues(alpha: 0.3)),
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
              Container(
                margin: const EdgeInsets.only(left: 8, top: 4),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppTheme.primary.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  provider.activeExam ?? 'DA',
                  style: const TextStyle(
                    color: AppTheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        ),
        actions: [
          if (provider.isSyncingGlobalData)
            const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Center(
                child: SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2, color: AppTheme.primary),
                ),
              ),
            ),
          // Pro Pass Pill
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ProUpgradeScreen()));
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFB300).withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFFFB300).withValues(alpha: 0.5)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.workspace_premium_rounded, size: 14, color: Color(0xFFFFB300)),
                    const SizedBox(width: 4),
                    Text(
                      provider.isPro ? 'PRO' : 'GO PRO',
                      style: const TextStyle(
                        color: Color(0xFFFFB300),
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.flash_on, color: Colors.amber),
            onPressed: () {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('You are on a $daysLeft days countdown! Keep grinding!'),
                  backgroundColor: AppTheme.primary,
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. COUNTDOWN CARD
                  _buildCountdownCard(context, daysLeft, weeksLeft, monthsLeft, urgencyColor),
                  const SizedBox(height: 20),

                  // 2. 90-DAY SPRINT MODE BANNER & RAPID FIRE
                  _buildSprintModeBanner(context, provider),
                  const SizedBox(height: 20),

                  // 3. TODAY'S PLAN CARD
                  _buildTodayPlanCard(context, provider, todayTopic),
                  const SizedBox(height: 20),

                  // 3. STATS ROW
                  _buildStatsRow(provider),
                  const SizedBox(height: 20),

                  // 4. MOCK TEST SUMMARY
                  _buildMockSummaryCard(context, provider),
                  const SizedBox(height: 20),

                  // 5. QUICK ACTIONS
                  Text(
                    'Quick Actions',
                    style: AppTheme.poppinsBold(fontSize: 18).copyWith(color: context.textColor),
                  ),
                  const SizedBox(height: 12),
                  _buildQuickActionsGrid(context, provider),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCountdownCard(BuildContext context, int daysLeft, int weeksLeft, int monthsLeft, Color urgencyColor) {
    final planStart = DateTime(2026, 5, 1);
    final examDate = DateTime(2027, 2, 1);
    final totalPrepDays = examDate.difference(planStart).inDays; // 276
    final today = DateTime.now();

    double prepPercentRemaining = 1.0;
    if (today.isAfter(examDate)) {
      prepPercentRemaining = 0.0;
    } else if (today.isAfter(planStart)) {
      final daysRemaining = examDate.difference(today).inDays;
      prepPercentRemaining = (daysRemaining / totalPrepDays).clamp(0.0, 1.0);
    }

    return Card(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              context.colorSurface,
              context.colorSurface.withOpacity(0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Text(
              'GATE DA 2027 COUNTDOWN',
              style: TextStyle(
                color: context.textSecondaryColor,
                fontSize: 11,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 20),
            Stack(
              alignment: Alignment.center,
              children: [
                // Glow effect behind
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: urgencyColor.withOpacity(0.12),
                        blurRadius: 30,
                        spreadRadius: 5,
                      )
                    ],
                  ),
                ),
                // Outer track mapping prep progress
                SizedBox(
                  width: 140,
                  height: 140,
                  child: RepaintBoundary(
                    child: CircularProgressIndicator(
                      value: prepPercentRemaining,
                      strokeWidth: 8,
                      backgroundColor: AppTheme.surface.withOpacity(0.04),
                      valueColor: AlwaysStoppedAnimation<Color>(urgencyColor),
                    ),
                  ),
                ),
                // Pulsing Ring
                RepaintBoundary(
                  child: AnimatedBuilder(
                    animation: _pulsingController,
                    builder: (context, child) {
                      return Container(
                        width: 124,
                        height: 124,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: urgencyColor.withOpacity(0.15 * (1.0 - _pulsingController.value)),
                            width: 1.0 + (_pulsingController.value * 4.0),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Days Number
                Container(
                  width: 116,
                  height: 116,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF14141E), // Slightly darker surface for contrast
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$daysLeft',
                        style: AppTheme.timerStyle(fontSize: 40, color: urgencyColor),
                      ),
                      Text(
                        'Days Left',
                        style: TextStyle(
                          color: AppTheme.textSecondary,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCountdownBadge(Icons.calendar_view_week, '$weeksLeft Weeks', 'Remaining'),
                const SizedBox(width: 16),
                _buildCountdownBadge(Icons.calendar_month, '$monthsLeft Months', 'Remaining'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCountdownBadge(IconData icon, String value, String sub) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppTheme.textPrimary.withOpacity(0.03),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.textPrimary.withOpacity(0.05)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppTheme.secondary),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                sub,
                style: const TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 8,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSprintModeBanner(BuildContext context, AppProvider provider) {
    final isSprint = provider.isSprintMode;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colorSurface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isSprint ? AppTheme.secondary.withValues(alpha: 0.4) : Colors.white.withValues(alpha: 0.06),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    isSprint ? Icons.bolt_rounded : Icons.calendar_month_rounded,
                    color: isSprint ? AppTheme.secondary : AppTheme.textSecondary,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    isSprint ? '⚡ 90-DAY CRUNCH SPRINT' : 'STANDARD SYLLABUS PLAN',
                    style: TextStyle(
                      color: isSprint ? AppTheme.secondary : context.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      letterSpacing: 1.1,
                    ),
                  ),
                ],
              ),
              // Mode Toggle
              InkWell(
                onTap: () => provider.toggleSprintMode(),
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: isSprint ? AppTheme.secondary.withValues(alpha: 0.15) : Colors.white.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: isSprint ? AppTheme.secondary : Colors.white24),
                  ),
                  child: Text(
                    isSprint ? 'Switch to Full' : 'Switch to Sprint',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: isSprint ? AppTheme.secondary : AppTheme.textSecondary,
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (isSprint) ...[
            const SizedBox(height: 12),
            const Text(
              'High-Yield Target Sequence (~70 Marks)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                _buildPriorityChip('Aptitude 15M', AppTheme.primary),
                _buildPriorityChip('Prob & Stats 18M', AppTheme.secondary),
                _buildPriorityChip('Machine Learning 20M', Colors.amber),
                _buildPriorityChip('Linear Algebra 13M', Colors.blueAccent),
              ],
            ),
            const SizedBox(height: 14),
            // Rapid Fire 15-Minute Button
            InkWell(
              onTap: () {
                final questions = provider.getDailyRapidFireQuestions();
                if (questions.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No questions available in the question bank yet.')),
                  );
                  return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MockTestRunnerScreen(
                      questions: questions,
                      duration: const Duration(minutes: 15),
                      testName: '15-Min Daily Rapid Fire',
                    ),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppTheme.secondary.withValues(alpha: 0.18),
                      AppTheme.primary.withValues(alpha: 0.15),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppTheme.secondary.withValues(alpha: 0.4)),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: AppTheme.secondary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.play_arrow_rounded, color: AppTheme.background, size: 20),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Daily 15-Min Rapid Fire Quiz',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white),
                          ),
                          SizedBox(height: 2),
                          Text(
                            '10 random high-yield questions • Instant streak credit',
                            style: TextStyle(fontSize: 10, color: AppTheme.textSecondary),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios_rounded, color: AppTheme.secondary, size: 14),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildPriorityChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Text(
        label,
        style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildTodayPlanCard(BuildContext context, AppProvider provider, TopicStatus? todayTopic) {
    final completed = todayTopic?.isCompleted ?? false;
    final percentage = completed ? 1.0 : 0.0;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "TODAY'S PLAN",
                  style: TextStyle(
                    color: AppTheme.secondary,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: completed
                        ? AppTheme.success.withOpacity(0.15)
                        : AppTheme.primary.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    completed ? "Completed" : "Pending",
                    style: TextStyle(
                      color: completed ? AppTheme.success : AppTheme.primary,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (todayTopic != null) ...[
              Text(
                '📐 ${todayTopic.subjectName} — ${todayTopic.topicName}',
                style: AppTheme.poppinsBold(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                'Estimated: 3 hours · Difficulty: ${todayTopic.difficulty}',
                style: const TextStyle(color: AppTheme.textSecondary, fontSize: 13),
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: percentage,
                  backgroundColor: AppTheme.background,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    completed ? AppTheme.success : AppTheme.primary,
                  ),
                  minHeight: 8,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: completed ? AppTheme.surface : AppTheme.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: completed ? AppTheme.success.withOpacity(0.5) : Colors.transparent,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {
                    // Navigate to Planner tab
                    provider.setSelectedIndex(1);
                  },
                  child: Text(
                    completed ? "View Study Planner" : "Start Today's Session",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ),
              ),
            ] else ...[
              const Text(
                '🎉 No topics scheduled for today! Take a mock test or revise your error log.',
                style: TextStyle(color: AppTheme.textPrimary, fontSize: 14),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {
                    provider.setSelectedIndex(1);
                  },
                  child: const Text(
                    "Open Planner Screen",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildStatsRow(AppProvider provider) {
    final completedTopicsCount = provider.topics.where((t) => t.isCompleted).length;
    final completedPYQsCount = provider.pyqs.where((p) => p.isCompleted).length;
    final mocksCount = provider.mockLogs.length;

    return Column(
      children: [
        Row(
          children: [
            _buildStreakCard(context, provider),
            const SizedBox(width: 12),
            _buildStatCard('✅ Done', '$completedTopicsCount Topics'),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            _buildStatCard('📝 PYQs', '$completedPYQsCount Solved'),
            const SizedBox(width: 12),
            _buildStatCard('📊 Mock Tests', '$mocksCount Logged'),
          ],
        ),
      ],
    );
  }

  Widget _buildMockSummaryCard(BuildContext context, AppProvider provider) {
    final mocks = provider.mockLogs;
    final bool hasMocks = mocks.isNotEmpty;

    if (!hasMocks) {
      return Card(
        child: InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MockTrackerScreen()),
          ),
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.show_chart_rounded, color: Colors.blue, size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Track Mock Exams',
                        style: AppTheme.poppinsBold(fontSize: 14),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'No mock tests logged yet. Track your scores to gauge your preparation level.',
                        style: TextStyle(color: AppTheme.textSecondary, fontSize: 11),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, color: AppTheme.textSecondary, size: 20),
              ],
            ),
          ),
        ),
      );
    }

    final latestMock = mocks.last;
    final double avgScore = mocks.map((m) => m.score).reduce((a, b) => a + b) / mocks.length;
    final Color scoreColor = latestMock.score >= 75
        ? AppTheme.success
        : (latestMock.score >= 50 ? Colors.amber : AppTheme.error);

    return Card(
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MockTrackerScreen()),
        ),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'LATEST MOCK TEST SUMMARY',
                    style: TextStyle(
                      color: AppTheme.secondary,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const Icon(Icons.chevron_right, color: AppTheme.textSecondary, size: 18),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          latestMock.name,
                          style: AppTheme.poppinsBold(fontSize: 14),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Latest Score: ${latestMock.score.toStringAsFixed(1)} / 100',
                          style: TextStyle(
                            color: scoreColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.blue.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Text(
                          avgScore.toStringAsFixed(1),
                          style: AppTheme.timerStyle(fontSize: 16, color: Colors.blue),
                        ),
                        const Text(
                          'Avg Score',
                          style: TextStyle(color: AppTheme.textSecondary, fontSize: 8, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (latestMock.weakSubjects.isNotEmpty) ...[
                const SizedBox(height: 10),
                const Divider(height: 1, color: AppTheme.background),
                const SizedBox(height: 10),
                Text(
                  'Weak Areas: ${latestMock.weakSubjects.join(", ")}',
                  style: const TextStyle(color: AppTheme.textSecondary, fontSize: 11),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchButton(BuildContext context, AppProvider provider, String title) {
    final currentExam = _tempActiveExam ?? provider.activeExam;
    final isActive = currentExam == title;
    
    return GestureDetector(
      onTap: () {
        if (!isActive) {
          setState(() => _tempActiveExam = title);
          Future.delayed(const Duration(milliseconds: 150), () {
            if (mounted) {
              provider.setActiveExam(title);
              // We don't need to reset _tempActiveExam to null immediately, 
              // it will be overwritten when provider updates or we can just leave it.
              // But resetting is cleaner:
              setState(() => _tempActiveExam = null);
            }
          });
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: isActive ? AppTheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.white : AppTheme.textSecondary,
            fontSize: 12,
            fontWeight: isActive ? FontWeight.bold : FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 6),
              Text(
                value,
                style: AppTheme.timerStyle(fontSize: 18, color: AppTheme.textPrimary),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStreakCard(BuildContext context, AppProvider provider) {
    final bool canRestore = provider.previousStreak > 0 && provider.streak <= 1;

    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '🔥 Streak',
                    style: TextStyle(color: AppTheme.textSecondary, fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  if (canRestore)
                    InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Loading Ad to Restore Streak...')),
                        );
                        AdService().showRewardedAd(
                          onUserEarnedReward: () {
                            provider.restoreStreak();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Streak Restored successfully! 🔥'),
                                backgroundColor: AppTheme.success,
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.orange.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.orange.withValues(alpha: 0.5)),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.play_circle_outline, color: Colors.orange, size: 12),
                            SizedBox(width: 4),
                            Text('Restore', style: TextStyle(color: Colors.orange, fontSize: 10, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                '${provider.streak} Days',
                style: AppTheme.timerStyle(fontSize: 18, color: canRestore ? Colors.orange : AppTheme.textPrimary),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActionsGrid(BuildContext context, AppProvider provider) {
    final bool isTablet = MediaQuery.of(context).size.width >= 600;
    final actions = [
      _QuickActionItem(
        icon: Icons.timer,
        label: 'Pomodoro',
        color: AppTheme.secondary,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PomodoroScreen()),
        ),
      ),
      _QuickActionItem(
        icon: Icons.calculate_outlined,
        label: 'Score Estimator',
        color: Colors.orange,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ScoreEstimatorScreen()),
        ),
      ),
      _QuickActionItem(
        icon: Icons.functions_rounded,
        label: 'Formula Sheet',
        color: Colors.teal,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FormulaSheetScreen()),
        ),
      ),
      _QuickActionItem(
        icon: Icons.assignment_rounded,
        label: 'Mock Test',
        color: Colors.blue,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MockTrackerScreen()),
        ),
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isTablet ? 3 : 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: isTablet ? 2.8 : 2.2,
      ),
      itemCount: actions.length,
      itemBuilder: (context, index) {
        final action = actions[index];
        return InkWell(
          onTap: action.onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppTheme.textSecondary.withOpacity(0.1)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: action.color.withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(action.icon, color: action.color, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    action.label,
                    style: const TextStyle(
                      color: AppTheme.textPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _QuickActionItem {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  _QuickActionItem({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });
}
