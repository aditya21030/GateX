import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/app_provider.dart';
import '../services/storage_service.dart';
import '../theme/app_theme.dart';
import '../widgets/neu_widgets.dart';
import '../widgets/aspirant_avatar.dart';
import 'login_screen.dart';
import 'pro_upgrade_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  bool _isEditing = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    _nameController.text = authProvider.isLoggedIn ? authProvider.userName : 'Guest Aspirant';
    _emailController.text = authProvider.isLoggedIn ? authProvider.userEmail : 'Offline Mode (Local Storage)';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _saveChanges() async {
    HapticFeedback.selectionClick();
    setState(() => _isLoading = true);
    try {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      await authProvider.updateProfile(name: _nameController.text.trim());
      if (mounted) {
        setState(() {
          _isLoading = false;
          _isEditing = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profile updated successfully!'),
            backgroundColor: AppTheme.success,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString().replaceAll('Exception: ', '')),
            backgroundColor: AppTheme.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);

    final targetExamLabel = appProvider.selectedExam == 'BOTH'
        ? 'Combo (DA + CSIT)'
        : 'GATE ${appProvider.activeExam ?? 'DA'}';

    // Statistics calculations
    final completedTopicsCount = appProvider.topics.where((t) => t.isCompleted).length;
    final totalTopicsCount = appProvider.topics.isNotEmpty ? appProvider.topics.length : 1;

    final pyqs = appProvider.pyqs;
    final completedPYQsCount = pyqs.where((p) => p.isCompleted).length;
    final totalPyqsCount = pyqs.isNotEmpty ? pyqs.length : 1;

    int correctCount = 0;
    for (var p in pyqs.where((p) => p.isCompleted && p.userAnswer != null)) {
      if (p.isAnswerCorrect(p.userAnswer)) correctCount++;
    }
    final double accuracy = completedPYQsCount > 0 ? (correctCount / completedPYQsCount) * 100 : 0.0;

    final mockLogs = appProvider.mockLogs;
    double avgMockScore = 0.0;
    if (mockLogs.isNotEmpty) {
      avgMockScore = mockLogs.map((m) => m.score).reduce((a, b) => a + b) / mockLogs.length;
    }

    final isPro = appProvider.isPro;

    // Badges definitions
    final achievements = [
      _Achievement(
        id: 'early_bird',
        title: 'Early Bird',
        desc: 'Solve 10+ questions in practice',
        icon: Icons.wb_sunny_rounded,
        color: AppTheme.accentGold,
        isUnlocked: completedPYQsCount >= 10,
        progress: '${min(completedPYQsCount, 10)}/10',
      ),
      _Achievement(
        id: 'streak_master',
        title: 'Streak Master',
        desc: 'Maintain a 7+ day unbroken study streak',
        icon: Icons.local_fire_department_rounded,
        color: AppTheme.accentFlame,
        isUnlocked: appProvider.streak >= 7,
        progress: '${min(appProvider.streak, 7)}/7d',
      ),
      _Achievement(
        id: 'accuracy_ace',
        title: 'Accuracy Ace',
        desc: 'Achieve >75% accuracy over 20+ solved PYQs',
        icon: Icons.track_changes_rounded,
        color: AppTheme.accentMint,
        isUnlocked: accuracy >= 75 && completedPYQsCount >= 20,
        progress: '${accuracy.toStringAsFixed(0)}% acc',
      ),
      _Achievement(
        id: 'mock_warrior',
        title: 'Mock Warrior',
        desc: 'Complete at least 3 full CBT tests',
        icon: Icons.military_tech_rounded,
        color: AppTheme.accentPurple,
        isUnlocked: mockLogs.length >= 3,
        progress: '${min(mockLogs.length, 3)}/3 mocks',
      ),
      _Achievement(
        id: 'syllabus_hero',
        title: 'Syllabus Hero',
        desc: 'Master 50% or more syllabus topics',
        icon: Icons.auto_stories_rounded,
        color: AppTheme.accentCyan,
        isUnlocked: completedTopicsCount >= (totalTopicsCount / 2).ceil(),
        progress: '$completedTopicsCount/$totalTopicsCount',
      ),
      _Achievement(
        id: 'pro_aspirant',
        title: 'Pro Member',
        desc: 'Active GateX 2027 Season Pro Pass',
        icon: Icons.workspace_premium_rounded,
        color: const Color(0xFFFFB300),
        isUnlocked: isPro,
        progress: isPro ? 'Active' : 'Locked',
      ),
    ];

    final unlockedCount = achievements.where((a) => a.isUnlocked).length;

    return Scaffold(
      backgroundColor: context.scaffoldBackground,
      appBar: AppBar(
        title: const Text('My Profile'),
        elevation: 0,
        backgroundColor: context.scaffoldBackground,
        actions: [
          if (authProvider.isLoggedIn)
            IconButton(
              icon: Icon(
                _isEditing ? Icons.check_circle_rounded : Icons.edit_rounded,
                color: _isEditing ? AppTheme.accentMint : AppTheme.secondary,
              ),
              tooltip: _isEditing ? 'Save Changes' : 'Edit Profile',
              onPressed: () {
                if (_isEditing) {
                  _saveChanges();
                } else {
                  setState(() => _isEditing = true);
                }
              },
            ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              physics: const BouncingScrollPhysics(),
              children: [
                // 1. NEUMORPHIC PROFILE HEADER
                _buildProfileHeader(
                  context: context,
                  targetExamLabel: targetExamLabel,
                  isPro: isPro,
                  streak: appProvider.streak,
                  provider: appProvider,
                ),
                if (!authProvider.isLoggedIn) ...[
                  const SizedBox(height: 14),
                  NeuContainer(
                    borderRadius: 18,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const NeuIconTile(
                              icon: Icons.cloud_sync_rounded,
                              iconColor: AppTheme.accentPurple,
                              size: 38,
                              iconSize: 20,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sync Across Devices',
                                    style: AppTheme.poppinsBold(fontSize: 13.5, color: context.textColor),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    'Sign in to sync your solved PYQs, streak, and CBT mock scores.',
                                    style: TextStyle(color: context.textSecondaryColor, fontSize: 11),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        NeuButton(
                          isPrimary: true,
                          borderRadius: 12,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          onPressed: () {
                            HapticFeedback.selectionClick();
                            Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.login_rounded, size: 16, color: Colors.white),
                              SizedBox(width: 8),
                              Text('Sign In / Register', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 20),

                // 2. "YOUR STATISTICS 📊" 2x3 TACTILE GRID (from Reference Image Screen 13)
                Row(
                  children: [
                    Text(
                      'Your Statistics 📊',
                      style: AppTheme.poppinsBold(fontSize: 15, color: context.textColor),
                    ),
                    const Spacer(),
                    Text(
                      'GATE 2027',
                      style: TextStyle(
                        color: AppTheme.primary,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Row 1
                Row(
                  children: [
                    Expanded(
                      child: _buildNeuStatTile(
                        context: context,
                        icon: Icons.local_fire_department_rounded,
                        iconColor: AppTheme.accentFlame,
                        value: '${appProvider.streak} Days',
                        label: 'Study Streak',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildNeuStatTile(
                        context: context,
                        icon: Icons.task_alt_rounded,
                        iconColor: AppTheme.accentPurple,
                        value: '$completedTopicsCount / $totalTopicsCount',
                        label: 'Topics Covered',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Row 2
                Row(
                  children: [
                    Expanded(
                      child: _buildNeuStatTile(
                        context: context,
                        icon: Icons.check_circle_rounded,
                        iconColor: AppTheme.accentMint,
                        value: '$completedPYQsCount / $totalPyqsCount',
                        label: 'PYQs Solved',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildNeuStatTile(
                        context: context,
                        icon: Icons.track_changes_rounded,
                        iconColor: AppTheme.accentGold,
                        value: completedPYQsCount > 0 ? '${accuracy.toStringAsFixed(0)}%' : 'N/A',
                        label: 'Accuracy Rate',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Row 3
                Row(
                  children: [
                    Expanded(
                      child: _buildNeuStatTile(
                        context: context,
                        icon: Icons.bar_chart_rounded,
                        iconColor: AppTheme.accentCyan,
                        value: '${mockLogs.length} Tests',
                        label: mockLogs.isNotEmpty ? 'Avg: ${avgMockScore.toStringAsFixed(1)}' : 'Mock Arena',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          HapticFeedback.selectionClick();
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const ProUpgradeScreen()));
                        },
                        child: _buildNeuStatTile(
                          context: context,
                          icon: Icons.workspace_premium_rounded,
                          iconColor: const Color(0xFFFFB300),
                          value: isPro ? 'GateX Pro' : 'Free Pass',
                          label: isPro ? 'Active 🌟' : 'Upgrade ⚡',
                          isHighlighted: !isPro,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 22),

                // 3. ACHIEVEMENTS & BADGES
                Row(
                  children: [
                    Text(
                      'Achievements 🏆',
                      style: AppTheme.poppinsBold(fontSize: 15, color: context.textColor),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppTheme.accentGold.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '$unlockedCount / ${achievements.length}',
                        style: const TextStyle(
                          color: AppTheme.accentGold,
                          fontSize: 10.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 105,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: achievements.length,
                    separatorBuilder: (_, index) => const SizedBox(width: 10),
                    itemBuilder: (context, idx) {
                      final ach = achievements[idx];
                      return _buildAchievementSquircle(context, ach);
                    },
                  ),
                ),
                const SizedBox(height: 22),

                // 4. PREPARATION TRACK (Status Overview)
                Text(
                  'Preparation Track',
                  style: TextStyle(
                    color: context.textSecondaryColor,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
                const SizedBox(height: 10),
                NeuContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      const NeuIconTile(
                        icon: Icons.school_rounded,
                        iconColor: AppTheme.accentPurple,
                        size: 38,
                        iconSize: 20,
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Active Focus Track',
                              style: TextStyle(color: context.textSecondaryColor, fontSize: 11),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              targetExamLabel,
                              style: AppTheme.poppinsBold(fontSize: 14.5, color: context.textColor),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppTheme.accentPurple.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppTheme.accentPurple.withValues(alpha: 0.3),
                            width: 0.8,
                          ),
                        ),
                        child: Text(
                          appProvider.selectedExam == 'BOTH' ? 'DUAL PREP' : 'SOLO',
                          style: const TextStyle(
                            color: AppTheme.accentPurple,
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // 5. ACCOUNT & SECURITY
                Text(
                  'Account & Security',
                  style: TextStyle(
                    color: context.textSecondaryColor,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
                const SizedBox(height: 10),
                NeuContainer(
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      if (authProvider.isLoggedIn)
                        ListTile(
                          leading: const NeuIconTile(
                            icon: Icons.lock_outline_rounded,
                            iconColor: AppTheme.secondary,
                            size: 36,
                            iconSize: 18,
                          ),
                          title: Text('Change Password', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: context.textColor)),
                          trailing: Icon(Icons.chevron_right_rounded, color: context.textSecondaryColor, size: 18),
                          onTap: () => _showPasswordSheet(context),
                        )
                      else
                        ListTile(
                          leading: const NeuIconTile(
                            icon: Icons.login_rounded,
                            iconColor: AppTheme.accentPurple,
                            size: 36,
                            iconSize: 18,
                          ),
                          title: Text('Account Login / Register', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: context.textColor)),
                          subtitle: Text('Sync progress to the cloud', style: TextStyle(color: context.textSecondaryColor, fontSize: 11)),
                          trailing: Icon(Icons.chevron_right_rounded, color: context.textSecondaryColor, size: 18),
                          onTap: () {
                            HapticFeedback.selectionClick();
                            Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
                          },
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // 6. LOG OUT / SIGN IN ACTION
                if (authProvider.isLoggedIn)
                  NeuButton(
                    onPressed: () => _handleLogout(context, authProvider, appProvider),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.logout_rounded, color: AppTheme.accentCoral, size: 18),
                        SizedBox(width: 8),
                        Text(
                          'Log Out',
                          style: TextStyle(color: AppTheme.accentCoral, fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ],
                    ),
                  )
                else
                  NeuButton(
                    isPrimary: true,
                    onPressed: () {
                      HapticFeedback.selectionClick();
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
                    },
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.login_rounded, color: Colors.white, size: 18),
                        SizedBox(width: 8),
                        Text(
                          'Sign In / Register',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 30),
              ],
            ),
    );
  }

  // Neumorphic Profile Header
  Widget _buildProfileHeader({
    required BuildContext context,
    required String targetExamLabel,
    required bool isPro,
    required int streak,
    required AppProvider provider,
  }) {
    return NeuContainer(
      padding: const EdgeInsets.all(18),
      child: Row(
        children: [
          // Tactile Automatic Aspirant Avatar
          AspirantAvatar(
            size: 68,
            seedName: _nameController.text,
            avatarId: provider.userAvatarId,
            showProBadge: true,
            isPro: isPro,
            showEditBadge: true,
            onTap: () => showAspirantAvatarPicker(context),
          ),
          const SizedBox(width: 14),

          // Name, Email & Pills
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_isEditing)
                  TextField(
                    controller: _nameController,
                    autofocus: true,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: context.textColor),
                    decoration: const InputDecoration(
                      hintText: 'Your Full Name',
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 2),
                    ),
                  )
                else
                  Text(
                    _nameController.text,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTheme.poppinsBold(fontSize: 16, color: context.textColor),
                  ),
                const SizedBox(height: 2),
                Text(
                  _emailController.text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 11, color: context.textSecondaryColor),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppTheme.accentPurple.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        targetExamLabel,
                        style: const TextStyle(color: AppTheme.accentPurple, fontSize: 9.5, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppTheme.accentFlame.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.local_fire_department_rounded, color: AppTheme.accentFlame, size: 11),
                          const SizedBox(width: 2),
                          Text(
                            '${streak}d',
                            style: const TextStyle(color: AppTheme.accentFlame, fontSize: 9.5, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Neumorphic Stat Tile (Matching Screen 13 of reference)
  Widget _buildNeuStatTile({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String value,
    required String label,
    bool isHighlighted = false,
  }) {
    return NeuContainer(
      padding: const EdgeInsets.all(12),
      borderRadius: 18,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              NeuIconTile(
                icon: icon,
                iconColor: iconColor,
                size: 32,
                iconSize: 16,
              ),
              const Spacer(),
              if (isHighlighted)
                const Icon(Icons.arrow_forward_ios_rounded, color: Color(0xFFFFB300), size: 11),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: AppTheme.timerStyle(fontSize: 15, color: isHighlighted ? const Color(0xFFFFB300) : context.textColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 1),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: isHighlighted ? const Color(0xFFFFB300) : context.textSecondaryColor,
              fontWeight: isHighlighted ? FontWeight.bold : FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  // Achievement Squircle Card
  Widget _buildAchievementSquircle(BuildContext context, _Achievement ach) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: context.colorSurface,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          builder: (_) => Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                NeuIconTile(icon: ach.icon, iconColor: ach.isUnlocked ? ach.color : Colors.grey, size: 54, iconSize: 28),
                const SizedBox(height: 14),
                Text(ach.title, style: AppTheme.poppinsBold(fontSize: 18, color: context.textColor)),
                const SizedBox(height: 6),
                Text(ach.desc, textAlign: TextAlign.center, style: TextStyle(color: context.textSecondaryColor, fontSize: 13)),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: (ach.isUnlocked ? AppTheme.success : AppTheme.accentFlame).withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    ach.isUnlocked ? 'Unlocked 🎉' : 'Progress: ${ach.progress}',
                    style: TextStyle(color: ach.isUnlocked ? AppTheme.success : AppTheme.accentFlame, fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
      child: NeuContainer(
        width: 82,
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
        borderRadius: 18,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(ach.icon, color: ach.isUnlocked ? ach.color : Colors.grey.shade600, size: 22),
            const SizedBox(height: 6),
            Text(
              ach.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: ach.isUnlocked ? context.textColor : context.textSecondaryColor),
            ),
            const SizedBox(height: 2),
            Text(
              ach.progress,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 8.5, color: ach.isUnlocked ? ach.color : context.textSecondaryColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  void _handleLogout(BuildContext context, AuthProvider authProvider, AppProvider appProvider) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: context.colorSurface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        title: Text('Log Out?', style: TextStyle(color: context.textColor, fontWeight: FontWeight.bold)),
        content: const Text(
          'Your local progress is saved on your device.',
          style: TextStyle(fontSize: 13),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppTheme.accentCoral),
            onPressed: () async {
              Navigator.pop(ctx);
              await authProvider.logout();
              await StorageService().resetAllData();
              await appProvider.init();
              if (context.mounted) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                  (route) => false,
                );
              }
            },
            child: const Text('Log Out', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  void _showPasswordSheet(BuildContext context) {
    final currentPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    bool isUpdating = false;
    String? errorMessage;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setSheetState) => Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 24),
              decoration: BoxDecoration(
                color: context.colorSurface,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Change Password', style: AppTheme.poppinsBold(fontSize: 18, color: context.textColor), textAlign: TextAlign.center),
                  const SizedBox(height: 18),
                  _buildNeuTextField(context, 'Current Password', currentPasswordController, Icons.lock_outline, obscureText: true),
                  const SizedBox(height: 12),
                  _buildNeuTextField(context, 'New Password', newPasswordController, Icons.lock_reset, obscureText: true),
                  if (errorMessage != null) ...[
                    const SizedBox(height: 12),
                    Text(errorMessage!, style: const TextStyle(color: AppTheme.error, fontSize: 12), textAlign: TextAlign.center),
                  ],
                  const SizedBox(height: 20),
                  NeuButton(
                    isPrimary: true,
                    onPressed: isUpdating
                        ? null
                        : () async {
                            setSheetState(() => isUpdating = true);
                            try {
                              await Provider.of<AuthProvider>(context, listen: false).changePassword(
                                currentPasswordController.text,
                                newPasswordController.text,
                              );
                              if (context.mounted) {
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Password updated!'), backgroundColor: AppTheme.success));
                              }
                            } catch (e) {
                              setSheetState(() {
                                isUpdating = false;
                                errorMessage = e.toString().replaceAll('Exception: ', '');
                              });
                            }
                          },
                    child: isUpdating
                        ? const SizedBox(height: 18, width: 18, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                        : const Text('Update Password', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNeuTextField(
    BuildContext context,
    String label,
    TextEditingController controller,
    IconData icon, {
    bool obscureText = false,
  }) {
    return NeuContainer(
      isRecessed: true,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
      borderRadius: 14,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(color: context.textColor, fontSize: 13),
        decoration: InputDecoration(
          hintText: label,
          hintStyle: TextStyle(color: context.textSecondaryColor, fontSize: 13),
          icon: Icon(icon, color: context.textSecondaryColor, size: 18),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class _Achievement {
  final String id;
  final String title;
  final String desc;
  final IconData icon;
  final Color color;
  final bool isUnlocked;
  final String progress;

  _Achievement({
    required this.id,
    required this.title,
    required this.desc,
    required this.icon,
    required this.color,
    required this.isUnlocked,
    required this.progress,
  });
}
