import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../providers/app_provider.dart';
import '../theme/app_theme.dart';
import '../main.dart'; // To navigate to MainNavigationScaffold

class ExamSelectionScreen extends StatefulWidget {
  const ExamSelectionScreen({super.key});

  @override
  State<ExamSelectionScreen> createState() => _ExamSelectionScreenState();
}

class _ExamSelectionScreenState extends State<ExamSelectionScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppTheme.background,
              const Color(0xFF1E1E2C), // Slightly lighter background
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                // Icon
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppTheme.primary.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.school_outlined, size: 64, color: AppTheme.primary),
                  ),
                ),
                const SizedBox(height: 32),
                
                // Welcome Text
                Text(
                  'Welcome to GateX',
                  style: AppTheme.poppinsBold(fontSize: 28),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Select your target exam to customize your preparation dashboard and study planner.',
                  style: TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 14,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),

                // Selection Cards
                _buildExamCard(
                  context: context,
                  title: 'GATE DA',
                  subtitle: 'Data Science & Artificial Intelligence',
                  examCode: 'DA',
                  activeCode: 'DA',
                  color: Colors.blue,
                  icon: Icons.data_object_rounded,
                ),
                const SizedBox(height: 16),
                _buildExamCard(
                  context: context,
                  title: 'GATE CSIT',
                  subtitle: 'Computer Science & Information Technology',
                  examCode: 'CSIT',
                  activeCode: 'CSIT',
                  color: Colors.purple,
                  icon: Icons.computer_rounded,
                ),
                const SizedBox(height: 16),
                _buildExamCard(
                  context: context,
                  title: 'Both (DA + CSIT)',
                  subtitle: 'Preparing for both branches',
                  examCode: 'BOTH',
                  activeCode: 'DA', // Default to DA view initially
                  color: Colors.amber,
                  icon: Icons.merge_type_rounded,
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExamCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required String examCode,
    required String activeCode,
    required Color color,
    required IconData icon,
  }) {
    return InkWell(
      onTap: () async {
        // Show loading dialog
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
          await appProvider.setExams(examCode, activeCode);
          
          // Save choice to Firestore for persistence across logins
          final user = FirebaseAuth.instance.currentUser;
          if (user != null) {
            try {
              await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
                'selectedExam': examCode,
                'activeExam': activeCode,
              }, SetOptions(merge: true));
            } catch (e) {
              // Silently fail if offline or error, local prefs will still work
            }
          }
          
          if (!context.mounted) return;
          // Pop the loading dialog
          Navigator.of(context).pop();
          
          // Push to main app
          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => const MainNavigationScaffold(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
              transitionDuration: const Duration(milliseconds: 600),
            ),
          );
        } catch (e) {
          if (context.mounted) {
            Navigator.of(context).pop(); // pop loader on error
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: $e')),
            );
          }
        }
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withOpacity(0.3), width: 1.5),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 32),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios_rounded, color: color.withOpacity(0.5), size: 20),
          ],
        ),
      ),
    );
  }
}
