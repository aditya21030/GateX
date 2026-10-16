import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../theme/app_theme.dart';
import 'score_estimator_screen.dart';
import 'mock_tracker_screen.dart';

class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final pyqs = provider.pyqs;
    final int solvedCount = pyqs.where((p) => p.isCompleted).length;
    final int totalPyqs = pyqs.isNotEmpty ? pyqs.length : 1;
    final double pyqProgress = (solvedCount / totalPyqs).clamp(0.0, 1.0);

    // Accuracy calculation
    int correctCount = 0;
    for (var p in pyqs.where((p) => p.isCompleted && p.userAnswer != null)) {
      if (p.isAnswerCorrect(p.userAnswer)) correctCount++;
    }
    final double accuracy = solvedCount > 0 ? (correctCount / solvedCount) * 100 : 0.0;

    // Mock logs calculation
    final mockLogs = provider.mockLogs;
    double avgMockScore = 0.0;
    if (mockLogs.isNotEmpty) {
      avgMockScore = mockLogs.map((m) => m.score).reduce((a, b) => a + b) / mockLogs.length;
    }

    // Determine estimated percentile tier
    String tierTitle = 'Foundation Phase';
    String tierBadge = 'Keep Practicing';
    Color tierColor = Colors.teal;
    String tierAdvice = 'Complete at least 50 high-yield PYQs and attempt your first mock test to unlock your live All-India standing estimate.';

    if (mockLogs.isNotEmpty) {
      if (avgMockScore >= 70) {
        tierTitle = 'Top 1% Potential';
        tierBadge = 'Estimated AIR 1 – 150';
        tierColor = AppTheme.secondary;
        tierAdvice = 'Outstanding performance! Maintain speed and avoid careless NAT errors to secure your top IIT/IISc seat.';
      } else if (avgMockScore >= 55) {
        tierTitle = 'Top 5% Potential';
        tierBadge = 'Estimated AIR 150 – 600';
        tierColor = Colors.amber;
        tierAdvice = 'Strong scoring zone! Focus heavily on MSQ accuracy and revision queue to break into the Top 100.';
      } else if (avgMockScore >= 40) {
        tierTitle = 'Top 15% Potential';
        tierBadge = 'Estimated AIR 600 – 2,000';
        tierColor = Colors.orange;
        tierAdvice = 'Solid foundation. Prioritize high-weightage topics (Aptitude, Stats, ML) to push your score past 55+.';
      } else {
        tierTitle = 'Qualifying Range';
        tierBadge = 'Estimated AIR 2,000 – 6,000';
        tierColor = AppTheme.error;
        tierAdvice = 'Focus on eliminating negative marks in MCQs and strengthening fundamental definitions using Formula Sheets.';
      }
    }

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Performance & Standing'),
        elevation: 0,
        backgroundColor: AppTheme.surface,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. TOP HERO CARD
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.amber.shade900, Colors.orange.shade700],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.amber.withValues(alpha: 0.25),
                    blurRadius: 18,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.emoji_events_rounded, size: 48, color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    tierTitle,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.25),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      tierBadge,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    tierAdvice,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withValues(alpha: 0.95),
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 2. LIVE PREPARATION METRICS
            const Text(
              'YOUR PREPARATION BENCHMARKS',
              style: TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 11,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: _buildMetricTile(
                    icon: Icons.local_fire_department_rounded,
                    iconColor: Colors.deepOrange,
                    label: 'Study Streak',
                    value: '${provider.streak} Days',
                    subtitle: 'Consistency metric',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildMetricTile(
                    icon: Icons.check_circle_rounded,
                    iconColor: AppTheme.secondary,
                    label: 'PYQs Solved',
                    value: '$solvedCount / $totalPyqs',
                    subtitle: '${(pyqProgress * 100).toStringAsFixed(0)}% Completed',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildMetricTile(
                    icon: Icons.track_changes_rounded,
                    iconColor: tierColor,
                    label: 'Practice Accuracy',
                    value: solvedCount > 0 ? '${accuracy.toStringAsFixed(0)}%' : 'N/A',
                    subtitle: '$correctCount correct',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildMetricTile(
                    icon: Icons.bar_chart_rounded,
                    iconColor: Colors.blueAccent,
                    label: 'Mock Average',
                    value: mockLogs.isNotEmpty ? avgMockScore.toStringAsFixed(1) : 'No Mocks',
                    subtitle: '${mockLogs.length} Tests taken',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // 3. TARGET MILESTONES CARD
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppTheme.surface,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.stars_rounded, color: Colors.amber, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Target Milestones for AIR < 500',
                        style: AppTheme.poppinsBold(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildMilestoneRow('Solve all GATE DA (2024–2026) PYQs twice', solvedCount >= 100),
                  const SizedBox(height: 10),
                  _buildMilestoneRow('Maintain accuracy > 75% on 2-mark questions', accuracy >= 75),
                  const SizedBox(height: 10),
                  _buildMilestoneRow('Attempt at least 5 Full-Length CBT Mock Tests', mockLogs.length >= 5),
                  const SizedBox(height: 10),
                  _buildMilestoneRow('Zero unreviewed errors in your Error Log', provider.errorLog.isEmpty),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 4. ACTION BUTTONS
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppTheme.secondary),
                      foregroundColor: AppTheme.secondary,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    icon: const Icon(Icons.calculate_outlined, size: 18),
                    label: const Text('Score Estimator', style: TextStyle(fontWeight: FontWeight.bold)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ScoreEstimatorScreen()));
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    icon: const Icon(Icons.assignment_rounded, size: 18),
                    label: const Text('Take a Mock', style: TextStyle(fontWeight: FontWeight.bold)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const MockTrackerScreen()));
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricTile({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: iconColor, size: 18),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 10, color: AppTheme.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildMilestoneRow(String title, bool isCompleted) {
    return Row(
      children: [
        Icon(
          isCompleted ? Icons.check_circle_rounded : Icons.radio_button_unchecked,
          color: isCompleted ? AppTheme.success : AppTheme.textSecondary,
          size: 18,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: isCompleted ? Colors.white : AppTheme.textSecondary,
              decoration: isCompleted ? TextDecoration.lineThrough : null,
            ),
          ),
        ),
      ],
    );
  }
}
