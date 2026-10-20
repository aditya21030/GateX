import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../providers/app_provider.dart';
import '../providers/pomodoro_provider.dart';
import '../providers/auth_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/neu_widgets.dart';
import 'error_log_screen.dart';
import 'pomodoro_screen.dart';
import 'score_estimator_screen.dart';
import 'revision_screen.dart';
import 'weightage_screen.dart';
import 'coap_screen.dart';
import 'profile_screen.dart';
import 'ranking_screen.dart';
import 'resources_screen.dart';
import 'formula_sheet_screen.dart';
import 'pro_upgrade_screen.dart';
import 'community_screen.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);

    return Scaffold(
      backgroundColor: context.scaffoldBackground,
      appBar: AppBar(
        title: Text(
          'GateX Hub',
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: context.textColor,
          ),
        ),
        elevation: 0,
        backgroundColor: context.scaffoldBackground,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            children: [
              // 1. NEUMORPHIC PROFILE CARD
              _buildProfileCard(context, provider),
              const SizedBox(height: 14),

              // 2. PRO UPGRADE TACTILE BANNER
              _buildProBanner(context, provider),
              const SizedBox(height: 22),

              // 3. EXAM PREPARATION TOOLS (Tactile 2-Column Grid)
              Text(
                'PREP TOOLS',
                style: GoogleFonts.outfit(
                  color: context.textSecondaryColor,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.1,
                ),
              ),
              const SizedBox(height: 12),
              _buildToolsGrid(context),
              const SizedBox(height: 22),

              // 4. COMMUNITY & RANKING
              Text(
                'COMMUNITY & STANDING',
                style: GoogleFonts.outfit(
                  color: context.textSecondaryColor,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.1,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildActionTile(
                      context: context,
                      icon: Icons.forum_rounded,
                      iconColor: AppTheme.accentMint,
                      title: 'Peer Doubts',
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CommunityScreen())),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildActionTile(
                      context: context,
                      icon: Icons.emoji_events_rounded,
                      iconColor: AppTheme.accentGold,
                      title: 'Leaderboard',
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RankingScreen())),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),

              // 5. PREFERENCES
              Text(
                'APP PREFERENCES',
                style: GoogleFonts.outfit(
                  color: context.textSecondaryColor,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.1,
                ),
              ),
              const SizedBox(height: 12),
              NeuContainer(
                padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    ListTile(
                      leading: const NeuIconTile(
                        icon: Icons.alarm_rounded,
                        iconColor: AppTheme.accentPurple,
                        size: 34,
                        iconSize: 18,
                      ),
                      title: Text('Study Reminder', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: context.textColor)),
                      subtitle: Text(provider.notificationTime, style: TextStyle(fontSize: 11, color: context.textSecondaryColor)),
                      trailing: TextButton(
                        onPressed: () => _selectNotificationTime(context, provider),
                        child: const Text('Change', style: TextStyle(color: AppTheme.accentPurple, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Divider(height: 1, color: context.colorBorder),
                    SwitchListTile(
                      secondary: const NeuIconTile(
                        icon: Icons.local_fire_department_rounded,
                        iconColor: AppTheme.accentFlame,
                        size: 34,
                        iconSize: 18,
                      ),
                      title: Text('Streak Protection', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: context.textColor)),
                      value: provider.notificationsEnabled,
                      activeColor: AppTheme.secondary,
                      onChanged: (val) => provider.updateNotificationSettings(val, provider.notificationTime),
                    ),
                    Divider(height: 1, color: context.colorBorder),
                    SwitchListTile(
                      secondary: const NeuIconTile(
                        icon: Icons.dark_mode_rounded,
                        iconColor: Colors.blue,
                        size: 34,
                        iconSize: 18,
                      ),
                      title: Text('Dark Mode', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: context.textColor)),
                      value: provider.themeMode == ThemeMode.dark,
                      activeColor: AppTheme.secondary,
                      onChanged: (_) => provider.toggleTheme(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),

              // 6. SUPPORT & DATA
              Text(
                'SUPPORT & DATA',
                style: GoogleFonts.outfit(
                  color: context.textSecondaryColor,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.1,
                ),
              ),
              const SizedBox(height: 12),
              NeuContainer(
                padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    ListTile(
                      leading: const NeuIconTile(icon: Icons.share_rounded, iconColor: Colors.blueAccent, size: 34, iconSize: 18),
                      title: Text('Share GateX', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: context.textColor)),
                      trailing: Icon(Icons.chevron_right_rounded, color: context.textSecondaryColor, size: 18),
                      onTap: () => _shareApp(context),
                    ),
                    Divider(height: 1, color: context.colorBorder),
                    ListTile(
                      leading: const NeuIconTile(icon: Icons.star_rate_rounded, iconColor: AppTheme.accentGold, size: 34, iconSize: 18),
                      title: Text('Rate App', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: context.textColor)),
                      trailing: Icon(Icons.chevron_right_rounded, color: context.textSecondaryColor, size: 18),
                      onTap: () => _rateApp(context),
                    ),
                    Divider(height: 1, color: context.colorBorder),
                    ListTile(
                      leading: const NeuIconTile(icon: Icons.delete_forever_rounded, iconColor: AppTheme.accentCoral, size: 34, iconSize: 18),
                      title: Text('Reset Data', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.accentCoral)),
                      trailing: Icon(Icons.chevron_right_rounded, color: context.textSecondaryColor, size: 18),
                      onTap: () => _showResetConfirmation(context, provider),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Minimal footer
              Center(
                child: Text(
                  'GateX v1.0.0 • For Serious GATE Aspirants',
                  style: TextStyle(color: context.textSecondaryColor, fontSize: 10.5),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Neumorphic Profile Header Card
  Widget _buildProfileCard(BuildContext context, AppProvider provider) {
    final authProvider = Provider.of<AuthProvider>(context);
    final userName = authProvider.isLoggedIn && authProvider.userName.isNotEmpty
        ? authProvider.userName
        : 'Guest Aspirant';
    final userEmail = authProvider.isLoggedIn ? authProvider.userEmail : 'Login to sync your preparation data';

    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
      },
      child: NeuContainer(
        padding: const EdgeInsets.all(16),
        borderRadius: 20,
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppTheme.accentPurple, Color(0xFF8B5CF6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(26),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.accentPurple.withValues(alpha: 0.35),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                userName.isNotEmpty ? userName[0].toUpperCase() : 'G',
                style: GoogleFonts.outfit(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          userName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.bold, color: context.textColor),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppTheme.accentFlame.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppTheme.accentFlame.withValues(alpha: 0.3),
                            width: 0.8,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.local_fire_department_rounded, size: 12, color: AppTheme.accentFlame),
                            const SizedBox(width: 3),
                            Text(
                              '${provider.streak}d',
                              style: GoogleFonts.outfit(color: AppTheme.accentFlame, fontSize: 11, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(
                    userEmail,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.outfit(color: context.textSecondaryColor, fontSize: 12),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded, color: context.textSecondaryColor, size: 20),
          ],
        ),
      ),
    );
  }

  // Neumorphic Pro Banner
  Widget _buildProBanner(BuildContext context, AppProvider provider) {
    final isPro = provider.isPro;
    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        Navigator.push(context, MaterialPageRoute(builder: (_) => const ProUpgradeScreen()));
      },
      child: NeuContainer(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        borderRadius: 20,
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: isPro
                      ? [AppTheme.accentMint, const Color(0xFF10B981)]
                      : [const Color(0xFFFFB300), const Color(0xFFF59E0B)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: (isPro ? AppTheme.accentMint : const Color(0xFFFFB300)).withValues(alpha: 0.35),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Icon(
                isPro ? Icons.verified_rounded : Icons.workspace_premium_rounded,
                color: Colors.white,
                size: 22,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isPro ? 'GateX Pro Active' : 'GateX Pro Season Pass',
                    style: GoogleFonts.outfit(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isPro ? AppTheme.accentMint : const Color(0xFFFFB300),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    isPro ? 'All 10 CBT Mocks Unlocked • Ad-free' : '₹199 One-Time • 10 CBT Mocks & Full Analytics',
                    style: GoogleFonts.outfit(color: context.textSecondaryColor, fontSize: 11.5),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios_rounded, color: context.textSecondaryColor, size: 14),
          ],
        ),
      ),
    );
  }

  // 2-Column Neumorphic Tools Grid
  Widget _buildToolsGrid(BuildContext context) {
    final tools = [
      {'icon': Icons.functions_rounded, 'color': AppTheme.accentCyan, 'title': 'Formulas', 'screen': const FormulaSheetScreen()},
      {'icon': Icons.calculate_outlined, 'color': AppTheme.accentGold, 'title': 'Estimator', 'screen': const ScoreEstimatorScreen()},
      {'icon': Icons.bar_chart_rounded, 'color': AppTheme.accentMint, 'title': 'Weightage', 'screen': const WeightageScreen()},
      {'icon': Icons.timer_outlined, 'color': AppTheme.accentFlame, 'title': 'Pomodoro', 'screen': const PomodoroScreen()},
      {'icon': Icons.repeat_rounded, 'color': AppTheme.accentPurple, 'title': 'Revision', 'screen': const RevisionScreen()},
      {'icon': Icons.error_outline_rounded, 'color': AppTheme.accentCoral, 'title': 'Mistakes', 'screen': const ErrorLogScreen()},
      {'icon': Icons.account_balance_outlined, 'color': Colors.blueAccent, 'title': 'Cutoffs', 'screen': const COAPScreen()},
      {'icon': Icons.library_books_rounded, 'color': Colors.deepPurpleAccent, 'title': 'Notes', 'screen': const ResourcesScreen()},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: tools.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 2.3,
      ),
      itemBuilder: (context, index) {
        final tool = tools[index];
        return _buildActionTile(
          context: context,
          icon: tool['icon'] as IconData,
          iconColor: tool['color'] as Color,
          title: tool['title'] as String,
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => tool['screen'] as Widget)),
        );
      },
    );
  }

  Widget _buildActionTile({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        onTap();
      },
      child: NeuContainer(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        borderRadius: 18,
        child: Row(
          children: [
            NeuIconTile(icon: icon, iconColor: iconColor, size: 36, iconSize: 19),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.outfit(fontSize: 13, fontWeight: FontWeight.w600, color: context.textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Icon(Icons.chevron_right_rounded, color: context.textSecondaryColor.withValues(alpha: 0.6), size: 16),
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
    );

    if (picked != null) {
      final hourStr = picked.hour.toString().padLeft(2, '0');
      final minStr = picked.minute.toString().padLeft(2, '0');
      provider.updateNotificationSettings(provider.notificationsEnabled, '$hourStr:$minStr');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Study reminder set for $hourStr:$minStr!'), backgroundColor: AppTheme.success),
        );
      }
    }
  }

  void _shareApp(BuildContext context) {
    const String shareMessage =
        'Prepare for GATE DA and CSIT with GateX! Syllabus, PYQs, TCS iON CBT mocks, and formula sheets.\n\nDownload: https://play.google.com/store/apps/details?id=com.yousful.gatex';
    Share.share(shareMessage);
  }

  Future<void> _rateApp(BuildContext context) async {
    final Uri url = Uri.parse('https://play.google.com/store/apps/details?id=com.yousful.gatex');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Could not open the Play Store.')));
      }
    }
  }

  void _showResetConfirmation(BuildContext context, AppProvider provider) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: context.colorSurface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        title: const Text('Reset Study Data?', style: TextStyle(color: AppTheme.accentCoral, fontWeight: FontWeight.bold)),
        content: const Text('Wipes all local checklist marks and mock scores.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppTheme.accentCoral),
            onPressed: () {
              provider.resetProgress();
              Provider.of<PomodoroProvider>(context, listen: false).resetTodayStats();
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Data reset.')));
            },
            child: const Text('Wipe', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
