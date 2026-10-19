import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../theme/app_theme.dart';
import 'error_log_screen.dart';
import 'formula_sheet_screen.dart';
import 'mock_tracker_screen.dart';
import 'pro_upgrade_screen.dart';
import 'community_screen.dart';
import '../models/models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _tempActiveExam;

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
      urgencyColor = AppTheme.warning;
    } else {
      urgencyColor = AppTheme.error;
    }

    // Today's topics from planner
    final todayTopics = provider.getTopicsForDate(today);
    final hasTodayPlan = todayTopics.isNotEmpty;
    final todayTopic = hasTodayPlan ? todayTopics[0] : null;

    final completedTopicsCount = provider.topics.where((t) => t.isCompleted).length;
    final completedPYQsCount = provider.pyqs.where((p) => p.isCompleted).length;
    final mocksCount = provider.mockLogs.length;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'GateX',
              style: AppTheme.poppinsBold(fontSize: 22),
            ),
            if (provider.selectedExam == 'BOTH')
              Container(
                margin: const EdgeInsets.only(left: 12),
                height: 32,
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
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
                margin: const EdgeInsets.only(left: 10),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppTheme.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppTheme.primary.withValues(alpha: 0.3)),
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
          // Streak Badge
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12.0),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppTheme.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.local_fire_department_rounded, size: 16, color: Colors.orange),
                const SizedBox(width: 4),
                Text(
                  '${provider.streak}d',
                  style: const TextStyle(
                    color: Colors.white,
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
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ProUpgradeScreen()));
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: provider.isPro ? AppTheme.primary.withValues(alpha: 0.15) : AppTheme.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: provider.isPro
                        ? AppTheme.primary.withValues(alpha: 0.6)
                        : Colors.white.withValues(alpha: 0.12),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      provider.isPro ? Icons.workspace_premium_rounded : Icons.star_border_rounded,
                      size: 14,
                      color: provider.isPro ? AppTheme.primary : AppTheme.textSecondary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      provider.isPro ? 'PRO' : 'PRO PASS',
                      style: TextStyle(
                        color: provider.isPro ? Colors.white : AppTheme.textSecondary,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
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
                // 1. SLEEK COUNTDOWN HERO CARD
                _buildCountdownCard(context, provider, daysLeft, weeksLeft, monthsLeft, urgencyColor),
                const SizedBox(height: 16),

                // 2. TODAY'S TARGET CARD
                _buildTodayPlanCard(context, provider, todayTopic),
                const SizedBox(height: 16),

                // 3. STATS STRIP
                _buildStatsStrip(completedTopicsCount, provider.topics.length, completedPYQsCount, mocksCount),
                const SizedBox(height: 20),

                // 4. CORE STUDY TOOLS (2x2 GRID)
                Text(
                  'Study Tools',
                  style: AppTheme.poppinsBold(fontSize: 16),
                ),
                const SizedBox(height: 10),
                _buildStudyToolsGrid(context, provider),
                const SizedBox(height: 16),

                // 5. PEER DOUBT SOLVING BANNER
                _buildCommunityBanner(context),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCountdownCard(
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

    double prepPercentRemaining = 1.0;
    if (today.isAfter(examDate)) {
      prepPercentRemaining = 0.0;
    } else if (today.isAfter(planStart)) {
      final daysRemaining = examDate.difference(today).inDays;
      prepPercentRemaining = (daysRemaining / totalPrepDays).clamp(0.0, 1.0);
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: urgencyColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      examName.toUpperCase(),
                      style: const TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.06),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    '1 Feb 2027',
                    style: TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  '$daysLeft',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: urgencyColor,
                    letterSpacing: -1.0,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Days Left',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                Text(
                  '$weeksLeft wks  •  $monthsLeft mos',
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppTheme.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: LinearProgressIndicator(
                value: prepPercentRemaining,
                minHeight: 6,
                backgroundColor: Colors.white.withValues(alpha: 0.08),
                valueColor: AlwaysStoppedAnimation<Color>(urgencyColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTodayPlanCard(BuildContext context, AppProvider provider, TopicStatus? todayTopic) {
    final completed = todayTopic?.isCompleted ?? false;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "TODAY'S TARGET",
                  style: TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: completed
                        ? AppTheme.success.withValues(alpha: 0.15)
                        : AppTheme.primary.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    completed ? "Completed" : "Scheduled",
                    style: TextStyle(
                      color: completed ? AppTheme.success : AppTheme.primary,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (todayTopic != null) ...[
              Text(
                '${todayTopic.subjectName} — ${todayTopic.topicName}',
                style: AppTheme.poppinsBold(fontSize: 15),
              ),
              const SizedBox(height: 6),
              Text(
                'Estimated: 2.5 hours  •  ${todayTopic.difficulty} Difficulty',
                style: const TextStyle(color: AppTheme.textSecondary, fontSize: 13),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: completed ? AppTheme.surface : AppTheme.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: completed ? Colors.white.withValues(alpha: 0.15) : Colors.transparent,
                          ),
                        ),
                      ),
                      onPressed: () {
                        provider.setSelectedIndex(1); // Open Planner tab
                      },
                      child: Text(
                        completed ? "View in Planner" : "Start Study Session",
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ),
                  ),
                ],
              ),
            ] else ...[
              const Text(
                'No target assigned for today! Practice PYQs or take a mock test.',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.white.withValues(alpha: 0.15)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                ),
                onPressed: () => provider.setSelectedIndex(2), // PYQs tab
                child: const Text(
                  'Practice PYQs',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStatsStrip(int topicsDone, int totalTopics, int pyqsSolved, int mocksCount) {
    return Row(
      children: [
        _buildStatTile('Topics Covered', '$topicsDone / $totalTopics'),
        const SizedBox(width: 10),
        _buildStatTile('PYQs Solved', '$pyqsSolved'),
        const SizedBox(width: 10),
        _buildStatTile('Mocks Taken', '$mocksCount'),
      ],
    );
  }

  Widget _buildStatTile(String label, String value) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStudyToolsGrid(BuildContext context, AppProvider provider) {
    final tools = [
      _StudyTool(
        title: 'PYQs Bank',
        subtitle: 'Year & Subject wise',
        icon: Icons.assignment_outlined,
        color: AppTheme.primary,
        onTap: () => provider.setSelectedIndex(2),
      ),
      _StudyTool(
        title: 'Mock Tests',
        subtitle: 'Full & Mini Mocks',
        icon: Icons.assessment_outlined,
        color: AppTheme.secondary,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const MockTrackerScreen()),
        ),
      ),
      _StudyTool(
        title: 'Formula Sheets',
        subtitle: 'Key Concept Recall',
        icon: Icons.functions_rounded,
        color: Colors.amber,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const FormulaSheetScreen()),
        ),
      ),
      _StudyTool(
        title: 'Error Log',
        subtitle: 'Target Weak Areas',
        icon: Icons.error_outline_rounded,
        color: AppTheme.error,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ErrorLogScreen()),
        ),
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: tools.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 2.2,
      ),
      itemBuilder: (context, index) {
        final tool = tools[index];
        return Card(
          child: InkWell(
            onTap: tool.onTap,
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: tool.color.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(tool.icon, color: tool.color, size: 20),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          tool.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          tool.subtitle,
                          style: const TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 10,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCommunityBanner(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CommunityScreen()),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppTheme.secondary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.forum_rounded, color: AppTheme.secondary, size: 24),
              ),
              const SizedBox(width: 14),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Peer Doubt Solving',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Discuss tricky concepts & shortcuts with rankers',
                      style: TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: AppTheme.textSecondary),
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
}

class _StudyTool {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _StudyTool({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });
}
