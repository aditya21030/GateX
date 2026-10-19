import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../providers/app_provider.dart';
import '../providers/pomodoro_provider.dart';
import '../providers/auth_provider.dart';
import '../theme/app_theme.dart';
import 'error_log_screen.dart';
import 'pomodoro_screen.dart';
import 'score_estimator_screen.dart';
import 'mock_tracker_screen.dart';
import 'revision_screen.dart';
import 'weightage_screen.dart';
import 'coap_screen.dart';
import 'profile_screen.dart';
import 'ranking_screen.dart';
import 'resources_screen.dart';
import 'formula_sheet_screen.dart';
import 'pro_upgrade_screen.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings & Extra'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            children: [
              // 1. PROFILE CARD
              _buildProfileCard(context, provider),
              const SizedBox(height: 16),

              // 1.5 PRO UPGRADE BANNER
              _buildProBanner(context, provider),
              const SizedBox(height: 20),

              // 2. STUDY TOOLS SECTION
              _buildSectionHeader('Study Tools & Utilities'),
              _buildMenuTile(
                context: context,
                icon: Icons.timer_outlined,
                iconColor: AppTheme.secondary,
                title: 'Pomodoro Focus Timer',
                subtitle: 'Start a focused study session',
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PomodoroScreen())),
              ),
              _buildMenuTile(
                context: context,
                icon: Icons.emoji_events_rounded,
                iconColor: Colors.amber,
                title: 'GateX Ranking & Leaderboard',
                subtitle: 'Compete globally with other aspirants',
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RankingScreen())),
              ),
              _buildMenuTile(
                context: context,
                icon: Icons.calculate_outlined,
                iconColor: Colors.orange,
                title: 'Score & AIR Estimator',
                subtitle: 'Estimate actual ranks from mock tests',
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ScoreEstimatorScreen())),
              ),
              _buildMenuTile(
                context: context,
                icon: Icons.bar_chart_rounded,
                iconColor: Colors.teal,
                title: 'Subject Weightage & Insights',
                subtitle: 'Expected marks and prep priority analysis',
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const WeightageScreen())),
              ),
              _buildMenuTile(
                context: context,
                icon: Icons.functions_rounded,
                iconColor: Colors.blueAccent,
                title: 'Formula & Concept Sheets',
                subtitle: 'High-yield math and core subject cheat sheets',
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const FormulaSheetScreen())),
              ),
              _buildMenuTile(
                context: context,
                icon: Icons.assignment_rounded,
                iconColor: AppTheme.primary,
                title: 'Mock Test',
                subtitle: 'Attempt mock exams and track scores',
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const MockTrackerScreen())),
              ),
              _buildMenuTile(
                context: context,
                icon: Icons.repeat_rounded,
                iconColor: AppTheme.secondary,
                title: 'Revision Queue',
                subtitle: 'Flagged concepts for spaced revision',
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RevisionScreen())),
              ),
              _buildMenuTile(
                context: context,
                icon: Icons.error_outline_rounded,
                iconColor: AppTheme.error,
                title: 'Error Log',
                subtitle: 'Review concepts you got wrong in practice',
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ErrorLogScreen())),
              ),
              _buildMenuTile(
                context: context,
                icon: Icons.library_books_rounded,
                iconColor: Colors.purpleAccent,
                title: 'Resources & Notes',
                subtitle: 'Handwritten notes and formula sheets',
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ResourcesScreen())),
              ),
              const SizedBox(height: 20),

              // 3. SETTINGS SECTION
              _buildSectionHeader('Planner Preferences'),
              // Daily Reminder Time Picker
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: AppTheme.primary.withOpacity(0.12), shape: BoxShape.circle),
                  child: const Icon(Icons.alarm, color: AppTheme.primary, size: 20),
                ),
                title: const Text('Daily Planner Reminder', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                subtitle: Text('Remind you to study at ${provider.notificationTime}', style: const TextStyle(fontSize: 12)),
                trailing: TextButton(
                  onPressed: () => _selectNotificationTime(context, provider),
                  child: const Text('Change Time', style: TextStyle(color: AppTheme.secondary, fontWeight: FontWeight.bold)),
                ),
              ),
              // Streak reminders toggle
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                secondary: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.amber.withOpacity(0.12), shape: BoxShape.circle),
                  child: const Icon(Icons.notifications_active_outlined, color: Colors.amber, size: 20),
                ),
                title: const Text('Streak Reminders', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                subtitle: const Text('Alert at 9 PM if you haven\'t opened the app today', style: TextStyle(fontSize: 12)),
                value: provider.notificationsEnabled,
                activeColor: AppTheme.secondary,
                onChanged: (val) {
                  provider.updateNotificationSettings(val, provider.notificationTime);
                },
              ),
              // Theme toggle
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                secondary: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.blue.withOpacity(0.12), shape: BoxShape.circle),
                  child: Icon(provider.themeMode == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode, color: Colors.blue, size: 20),
                ),
                title: const Text('Dark Mode', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                subtitle: const Text('Toggle between Light and Dark themes', style: TextStyle(fontSize: 12)),
                value: provider.themeMode == ThemeMode.dark,
                activeColor: AppTheme.secondary,
                onChanged: (val) {
                  provider.toggleTheme();
                },
              ),
              // Exam Track Switcher
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.purple.withOpacity(0.12), shape: BoxShape.circle),
                  child: const Icon(Icons.school, color: Colors.purple, size: 20),
                ),
                title: const Text('Current Course Track', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                subtitle: Text('Switch between GATE DA and CSIT. Currently: ${provider.activeExam}', style: const TextStyle(fontSize: 12)),
                trailing: DropdownButton<String>(
                  value: provider.activeExam,
                  underline: const SizedBox(),
                  items: const [
                    DropdownMenuItem(value: 'DA', child: Text('GATE DA')),
                    DropdownMenuItem(value: 'CSIT', child: Text('GATE CSIT')),
                  ],
                  onChanged: (val) {
                    if (val != null) {
                      provider.setActiveExam(val);
                    }
                  },
                ),
              ),
              const SizedBox(height: 20),

              // 4. GENERAL SECTION
              _buildSectionHeader('App Info & Support'),
              _buildMenuTile(
                context: context,
                icon: Icons.share_outlined,
                iconColor: AppTheme.textSecondary,
                title: 'Share GateX',
                subtitle: 'Recommend this app to fellow aspirants',
                onTap: () => _shareApp(context),
              ),
              _buildMenuTile(
                context: context,
                icon: Icons.star_outline_rounded,
                iconColor: AppTheme.textSecondary,
                title: 'Rate on Play Store',
                subtitle: 'Support the developer with a 5-star review',
                onTap: () => _rateApp(context),
              ),
              _buildMenuTile(
                context: context,
                icon: Icons.account_balance_outlined,
                iconColor: Colors.blueAccent,
                title: 'COAP M.Tech Cutoffs (Post-Exam)',
                subtitle: 'Reference admission cutoff ranges for IITs & IISc',
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const COAPScreen())),
              ),
              _buildMenuTile(
                context: context,
                icon: Icons.delete_forever_outlined,
                iconColor: AppTheme.error,
                title: 'Reset Progress',
                subtitle: 'Wipe all checklist marks, logs and custom scores',
                onTap: () => _showResetConfirmation(context, provider),
              ),
              const SizedBox(height: 30),

              // Footer version
              Center(
                child: Column(
                  children: [
                    Text(
                      'GateX v1.0.0',
                      style: TextStyle(color: AppTheme.textSecondary, fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 12.0),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          color: AppTheme.textSecondary,
          fontSize: 10,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildMenuTile({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: onTap,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: iconColor.withOpacity(0.12),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: iconColor, size: 20),
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: context.textColor),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12),
      ),
      trailing: const Icon(Icons.chevron_right, color: AppTheme.textSecondary, size: 20),
    );
  }

  Widget _buildProBanner(BuildContext context, AppProvider provider) {
    final isPro = provider.isPro;
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => const ProUpgradeScreen()));
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isPro
                ? [const Color(0xFF1B2E1E), const Color(0xFF122216)]
                : [const Color(0xFF382005), const Color(0xFF241402)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isPro ? AppTheme.success.withValues(alpha: 0.5) : const Color(0xFFFFB300).withValues(alpha: 0.5),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: (isPro ? AppTheme.success : const Color(0xFFFFB300)).withValues(alpha: 0.15),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: (isPro ? AppTheme.success : const Color(0xFFFFB300)).withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isPro ? Icons.verified_rounded : Icons.workspace_premium_rounded,
                color: isPro ? AppTheme.success : const Color(0xFFFFB300),
                size: 22,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        isPro ? 'GateX Pro Active' : 'GateX Pro Season Pass',
                        style: TextStyle(
                          color: isPro ? AppTheme.success : const Color(0xFFFFB300),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: (isPro ? AppTheme.success : const Color(0xFFFFB300)).withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          isPro ? '2027 UNLOCKED' : '₹199 ONE-TIME',
                          style: TextStyle(
                            color: isPro ? AppTheme.success : const Color(0xFFFFB300),
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(
                    isPro
                        ? '100% Ad-Free • 10 CBT Mocks • Unlimited Error Drills'
                        : 'Ad-Free Practice + 10 CBT Mocks + Error Log Quizzes',
                    style: TextStyle(color: Colors.white.withValues(alpha: 0.8), fontSize: 11),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white70, size: 14),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context, AppProvider provider) {
    final authProvider = Provider.of<AuthProvider>(context);
    final userName = authProvider.isLoggedIn ? authProvider.userName : 'Guest Student';
    final userEmail = authProvider.isLoggedIn ? authProvider.userEmail : 'Login to sync data';
    final targetExamLabel = provider.selectedExam == 'BOTH' 
        ? 'Combo (DA + CSIT)' 
        : 'GATE ${provider.activeExam ?? ''}';

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppTheme.primary.withOpacity(0.8), AppTheme.secondary.withOpacity(0.8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primary.withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: context.colorSurface,
              child: Text(
                userName.isNotEmpty ? userName[0].toUpperCase() : 'G',
                style: AppTheme.poppinsBold(fontSize: 24, color: AppTheme.primary),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: AppTheme.poppinsBold(fontSize: 18, color: context.textColor),
                  ),
                  Text(
                    userEmail,
                    style: TextStyle(color: context.textColor.withOpacity(0.8), fontSize: 13),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: context.textColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Target: $targetExamLabel',
                      style: TextStyle(color: context.textColor, fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.white70),
          ],
        ),
      ),
    );
  }

  Future<void> _selectNotificationTime(BuildContext context, AppProvider provider) async {
    final parts = provider.notificationTime.split(':');
    final currentHour = int.parse(parts[0]);
    final currentMinute = int.parse(parts[1]);

    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: currentHour, minute: currentMinute),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: AppTheme.primary,
              surface: context.colorSurface,
              onSurface: context.textColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      final hourStr = picked.hour.toString().padLeft(2, '0');
      final minStr = picked.minute.toString().padLeft(2, '0');
      provider.updateNotificationSettings(provider.notificationsEnabled, '$hourStr:$minStr');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Daily study reminder rescheduled to $hourStr:$minStr!'),
            backgroundColor: AppTheme.success,
          ),
        );
      }
    }
  }

  void _shareApp(BuildContext context) {
    const String shareMessage = 'Begin your IIT Journey! Unlock your potential with GateX. The ultimate study companion for GATE DA and CSIT.\n\nDownload now: https://play.google.com/store/apps/details?id=com.yousful.gatex';
    Share.share(shareMessage);
  }

  Future<void> _rateApp(BuildContext context) async {
    final Uri url = Uri.parse('https://play.google.com/store/apps/details?id=com.yousful.gatex');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not open the Play Store.'),
            backgroundColor: AppTheme.error,
          ),
        );
      }
    }
  }

  void _showResetConfirmation(BuildContext context, AppProvider provider) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: context.colorSurface,
          title: const Text('Reset All Progress?', style: TextStyle(color: AppTheme.error)),
          content: const Text(
            'This action is irreversible. All checklist marks, note texts, saved error logs, logged mock scores, and streak counters will be permanently deleted.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel', style: TextStyle(color: AppTheme.textSecondary)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppTheme.error),
              onPressed: () {
                provider.resetProgress();
                // Also reset the Pomodoro state
                Provider.of<PomodoroProvider>(context, listen: false).resetTodayStats();
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('All progress has been reset.'),
                    backgroundColor: AppTheme.error,
                  ),
                );
              },
              child: Text('Wipe All Data', style: TextStyle(color: context.textColor)),
            ),
          ],
        );
      },
    );
  }
}
