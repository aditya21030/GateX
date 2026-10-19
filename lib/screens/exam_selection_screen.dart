import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../providers/app_provider.dart';
import '../theme/app_theme.dart';
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
      backgroundColor: AppTheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            final joined = _waitlistJoined.contains(branch.code);
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: branch.accentColor.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(branch.icon, color: branch.accentColor, size: 28),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(branch.title, style: AppTheme.poppinsBold(fontSize: 18)),
                            Text(branch.subtitle, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close_rounded, color: Colors.white70),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppTheme.background,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.rocket_launch_rounded, color: AppTheme.secondary, size: 16),
                            SizedBox(width: 8),
                            Text('Curating for Next Season', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.secondary)),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'We are currently compiling official IIT master question papers, LaTeX formulas, and high-yield mocks for ${branch.title}. Join the priority waitlist to get early beta access!',
                          style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12, height: 1.4),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: joined ? AppTheme.success : AppTheme.primary,
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
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
                                backgroundColor: AppTheme.success,
                              ),
                            );
                            Future.delayed(const Duration(milliseconds: 600), () {
                              if (context.mounted) Navigator.pop(context);
                            });
                          },
                    icon: Icon(joined ? Icons.check_circle_rounded : Icons.notifications_active_rounded, size: 18),
                    label: Text(
                      joined ? 'Waitlist Joined' : 'Join Priority Waitlist',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 12),
              // Header Icon
              Center(
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.school_rounded, size: 52, color: AppTheme.primary),
                ),
              ),
              const SizedBox(height: 20),

              // Title
              Text(
                'Select Your Target Exam',
                style: AppTheme.poppinsBold(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                'Customize your study dashboard, official CBT test runner, and high-yield PYQ syllabus.',
                style: TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 13,
                  height: 1.45,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 28),

              // Live Branches Section
              Row(
                children: [
                  Container(
                    width: 7,
                    height: 7,
                    decoration: const BoxDecoration(color: AppTheme.success, shape: BoxShape.circle),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'ACTIVE BRANCHES (SEASON 2026-2027)',
                    style: TextStyle(
                      color: AppTheme.textSecondary,
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

              const SizedBox(height: 20),

              // Upcoming Branches Section
              Row(
                children: [
                  Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(color: Colors.amber.shade400, shape: BoxShape.circle),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'EXPANDING NEXT YEAR (WAITLIST)',
                    style: TextStyle(
                      color: AppTheme.textSecondary,
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

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBranchCard(BuildContext context, BranchConfig branch) {
    final isLive = branch.isAvailable;
    final isWaitlist = _waitlistJoined.contains(branch.code);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          HapticFeedback.selectionClick();
          if (isLive) {
            _selectActiveBranch(context, branch);
          } else {
            _showWaitlistModal(context, branch);
          }
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isLive ? AppTheme.surface : AppTheme.surface.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isLive ? branch.accentColor.withValues(alpha: 0.35) : Colors.white.withValues(alpha: 0.08),
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: branch.accentColor.withValues(alpha: isLive ? 0.18 : 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(branch.icon, color: isLive ? branch.accentColor : Colors.white60, size: 26),
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
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isLive ? Colors.white : Colors.white70,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: (isLive ? branch.accentColor : Colors.amber).withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            isWaitlist ? 'WAITLISTED' : branch.badgeText,
                            style: TextStyle(
                              color: isWaitlist ? AppTheme.secondary : (isLive ? branch.accentColor : Colors.amber),
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
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                isLive ? Icons.arrow_forward_ios_rounded : Icons.notifications_none_rounded,
                color: isLive ? branch.accentColor : AppTheme.textSecondary,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
