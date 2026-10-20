import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../providers/app_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/neu_widgets.dart';
import '../models/branch_model.dart';
import '../main.dart';

class ExamSelectionScreen extends StatefulWidget {
  const ExamSelectionScreen({super.key});

  @override
  State<ExamSelectionScreen> createState() => _ExamSelectionScreenState();
}

class _ExamSelectionScreenState extends State<ExamSelectionScreen> {
  final Set<String> _waitlistJoined = {};

  void _showWaitlistModal(BuildContext context, BranchConfig branch) {
    showModalBottomSheet(
      context: context,
      backgroundColor: context.scaffoldBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            final joined = _waitlistJoined.contains(branch.code);
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      NeuIconTile(icon: branch.icon, iconColor: branch.accentColor, size: 44, iconSize: 22),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(branch.title, style: AppTheme.poppinsBold(fontSize: 16, color: context.textColor)),
                            Text(branch.subtitle, style: TextStyle(color: context.textSecondaryColor, fontSize: 12)),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close_rounded, color: context.textSecondaryColor),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  NeuContainer(
                    isRecessed: true,
                    borderRadius: 16,
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.rocket_launch_rounded, color: AppTheme.accentPurple, size: 16),
                            SizedBox(width: 8),
                            Text('Curating for Next Season', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.accentPurple)),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Get notified when official question papers and mocks for ${branch.title} go live.',
                          style: TextStyle(color: context.textSecondaryColor, fontSize: 12, height: 1.4),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  NeuButton(
                    isPrimary: !joined,
                    borderRadius: 14,
                    height: 48,
                    onPressed: joined
                        ? null
                        : () {
                            HapticFeedback.mediumImpact();
                            setState(() {
                              _waitlistJoined.add(branch.code);
                            });
                            setSheetState(() {});
                            ScaffoldMessenger.of(this.context).showSnackBar(
                              SnackBar(
                                content: Text('🎉 Joined the ${branch.title} priority waitlist! We will notify you.'),
                                backgroundColor: AppTheme.accentMint,
                              ),
                            );
                            Future.delayed(const Duration(milliseconds: 600), () {
                              if (context.mounted) Navigator.pop(context);
                            });
                          },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(joined ? Icons.check_circle_rounded : Icons.notifications_active_rounded, size: 18, color: joined ? AppTheme.accentMint : Colors.white),
                        const SizedBox(width: 8),
                        Text(
                          joined ? 'Waitlist Joined' : 'Join Priority Waitlist',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: joined ? AppTheme.accentMint : Colors.white),
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

  Future<void> _selectActiveBranch(BuildContext context, BranchConfig branch) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppTheme.surface,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const CircularProgressIndicator(color: AppTheme.secondary),
        ),
      ),
    );

    try {
      final appProvider = Provider.of<AppProvider>(context, listen: false);
      final examCode = branch.code;
      final activeCode = branch.code == 'BOTH' ? 'DA' : branch.code;

      await appProvider.setExams(examCode, activeCode);

      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        try {
          await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
            'selectedExam': examCode,
            'activeExam': activeCode,
          }, SetOptions(merge: true));
        } catch (_) {}
      }

      if (!context.mounted) return;
      Navigator.of(context).pop();

      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const MainNavigationScaffold(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 500),
        ),
      );
    } catch (e) {
      if (context.mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final branches = BranchRegistry.allBranches;

    return Scaffold(
      backgroundColor: context.scaffoldBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8),
              // Header Icon
              Center(
                child: NeuContainer(
                  borderRadius: 24,
                  padding: const EdgeInsets.all(16),
                  child: const Icon(
                    Icons.school_rounded,
                    size: 40,
                    color: AppTheme.accentPurple,
                  ),
                ),
              ),
              const SizedBox(height: 18),

              // Title
              Text(
                'Target GATE Exam',
                style: AppTheme.poppinsBold(fontSize: 22, color: context.textColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),
              Text(
                'Select your target exam paper',
                style: TextStyle(
                  color: context.textSecondaryColor,
                  fontSize: 13,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              // Live Branches Section Header
              Row(
                children: [
                  Container(
                    width: 7,
                    height: 7,
                    decoration: const BoxDecoration(color: AppTheme.accentMint, shape: BoxShape.circle),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'ACTIVE BRANCHES (2026-2027)',
                    style: TextStyle(
                      color: context.textSecondaryColor,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              ...branches.where((b) => b.isAvailable).map((branch) {
                return _buildBranchCard(context, branch);
              }),

              const SizedBox(height: 18),

              // Upcoming Branches Section Header
              Row(
                children: [
                  Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(color: Colors.amber.shade400, shape: BoxShape.circle),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'WAITLIST (COMING SOON)',
                    style: TextStyle(
                      color: context.textSecondaryColor,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              ...branches.where((b) => !b.isAvailable).map((branch) {
                return _buildBranchCard(context, branch);
              }),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBranchCard(BuildContext context, BranchConfig branch) {
    final isLive = branch.isAvailable;
    final isWaitlist = _waitlistJoined.contains(branch.code);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: () {
          HapticFeedback.selectionClick();
          if (isLive) {
            _selectActiveBranch(context, branch);
          } else {
            _showWaitlistModal(context, branch);
          }
        },
        child: NeuContainer(
          borderRadius: 18,
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              NeuIconTile(
                icon: branch.icon,
                iconColor: branch.accentColor,
                size: 42,
                iconSize: 22,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          branch.title,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: context.textColor,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: (isLive ? branch.accentColor : Colors.amber).withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            isWaitlist ? 'WAITLISTED' : branch.badgeText,
                            style: TextStyle(
                              color: isWaitlist ? AppTheme.accentPurple : (isLive ? branch.accentColor : Colors.amber),
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Text(
                      branch.subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: context.textSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                isLive ? Icons.arrow_forward_ios_rounded : Icons.notifications_none_rounded,
                color: isLive ? branch.accentColor : context.textSecondaryColor,
                size: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
