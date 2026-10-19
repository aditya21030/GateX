import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart' hide AuthProvider;
import 'package:cloud_firestore/cloud_firestore.dart';
import '../providers/auth_provider.dart';
import '../providers/app_provider.dart';
import '../services/storage_service.dart';
import '../theme/app_theme.dart';
import '../widgets/iit_onboarding_components.dart';
import '../main.dart'; // For MainNavigationScaffold
import 'exam_selection_screen.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  String? _errorMessage;
  String _selectedBranch = 'DA'; // 'DA', 'CSIT', 'BOTH'

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      setState(() => _errorMessage = 'Please fill in all fields');
      return;
    }

    if (password != confirmPassword) {
      setState(() => _errorMessage = 'Passwords do not match');
      return;
    }

    if (password.length < 6) {
      setState(() => _errorMessage = 'Password must be at least 6 characters');
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    try {
      final isNewUser = await authProvider.signup(name, email, password);
      await _navigateAfterAuth(isNewUser);
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = e.toString().replaceAll('Exception: ', '');
        });
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _googleLogin() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    try {
      final isNewUser = await authProvider.loginWithGoogle();
      await _navigateAfterAuth(isNewUser);
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = e.toString().replaceAll('Exception: ', '');
        });
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _navigateAfterAuth(bool isNewUser) async {
    if (!mounted) return;
    final appProvider = Provider.of<AppProvider>(context, listen: false);
    final user = FirebaseAuth.instance.currentUser;

    if (isNewUser) {
      await appProvider.setExams(
        _selectedBranch,
        _selectedBranch == 'BOTH' ? 'DA' : _selectedBranch,
      );
      if (user != null) {
        try {
          await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
            'selectedExam': _selectedBranch,
            'activeExam': _selectedBranch == 'BOTH' ? 'DA' : _selectedBranch,
            'email': user.email,
            'displayName': _nameController.text.trim(),
            'createdAt': FieldValue.serverTimestamp(),
          }, SetOptions(merge: true));
        } catch (_) {}
      }

      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const MainNavigationScaffold()),
      );
    } else {
      if (user != null) {
        try {
          await StorageService().restoreFromCloud(user.uid);
          await appProvider.init();

          final doc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
          if (doc.exists && doc.data() != null && doc.data()!.containsKey('selectedExam')) {
            String savedExam = doc.data()!['selectedExam'];
            String activeExam = doc.data()!['activeExam'] ?? (savedExam == 'BOTH' ? 'DA' : savedExam);

            await appProvider.setExams(savedExam, activeExam);

            if (!mounted) return;
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const MainNavigationScaffold()),
            );
            return;
          }
        } catch (_) {}
      }

      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const ExamSelectionScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;

    return Scaffold(
      backgroundColor: const Color(0xFF6B38FF),
      body: Column(
        children: [
          // Top Electric Purple Stage (Matches Screen 4)
          const AuthPurpleHeader(),

          // Bottom White Sheet (Matches Screen 4: Get Started)
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF14151B) : Colors.white,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(36)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: isDark ? 0.4 : 0.08),
                    blurRadius: 26,
                    offset: const Offset(0, -6),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(26, 26, 26, 24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Sparkle Icon + Title "Get Started" (Exactly as Screen 4)
                      Row(
                        children: [
                          Icon(
                            Icons.auto_awesome_rounded,
                            size: 24,
                            color: isDark ? const Color(0xFF9D65FF) : const Color(0xFF6B38FF),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Get Started',
                            style: GoogleFonts.outfit(
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                              color: isDark ? Colors.white : const Color(0xFF121214),
                              letterSpacing: -0.5,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),

                      // Google Sign Up Pill Button
                      GoogleAuthPillButton(
                        onPressed: _isLoading ? null : _googleLogin,
                        isLoading: _isLoading,
                      ),
                      const SizedBox(height: 16),

                      // Error message if any
                      if (_errorMessage != null) ...[
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                          decoration: BoxDecoration(
                            color: AppTheme.error.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: AppTheme.error.withValues(alpha: 0.25)),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.error_outline_rounded, color: AppTheme.error, size: 18),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  _errorMessage!,
                                  style: GoogleFonts.outfit(color: AppTheme.error, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 14),
                      ],

                      // Username / Full Name
                      CleanAuthInputField(
                        controller: _nameController,
                        hintText: 'Username',
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: 12),

                      // Enter your email
                      CleanAuthInputField(
                        controller: _emailController,
                        hintText: 'Enter your email',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 12),

                      // Target Branch Selector Pills
                      Row(
                        children: [
                          _buildBranchPill('DA (Data Science)', 'DA', isDark),
                          const SizedBox(width: 8),
                          _buildBranchPill('CS / IT', 'CSIT', isDark),
                          const SizedBox(width: 8),
                          _buildBranchPill('Both', 'BOTH', isDark),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Password
                      CleanAuthInputField(
                        controller: _passwordController,
                        hintText: 'Password',
                        obscureText: !_isPasswordVisible,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                            size: 19,
                            color: isDark ? Colors.white38 : const Color(0xFF888894),
                          ),
                          onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Confirm Password
                      CleanAuthInputField(
                        controller: _confirmPasswordController,
                        hintText: 'Confirm password',
                        obscureText: !_isConfirmPasswordVisible,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isConfirmPasswordVisible ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                            size: 19,
                            color: isDark ? Colors.white38 : const Color(0xFF888894),
                          ),
                          onPressed: () => setState(() => _isConfirmPasswordVisible = !_isConfirmPasswordVisible),
                        ),
                      ),
                      const SizedBox(height: 22),

                      // Solid Black Pill Button: [ Get Started ] (Matches Screen 4)
                      SolidBlackPillButton(
                        label: 'Get Started',
                        isLoading: _isLoading,
                        onPressed: _signUp,
                      ),
                      const SizedBox(height: 16),

                      // Footer: Already have an account? Log In
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style: GoogleFonts.outfit(
                              fontSize: 13.5,
                              color: isDark ? Colors.white60 : const Color(0xFF6E6E78),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (_) => const LoginScreen()),
                              );
                            },
                            child: Text(
                              'Log In',
                              style: GoogleFonts.outfit(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: isDark ? const Color(0xFFB185FF) : const Color(0xFF6B38FF),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBranchPill(String label, String value, bool isDark) {
    final isSelected = _selectedBranch == value;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedBranch = value),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          height: 38,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: isSelected
                ? (isDark ? Colors.white : const Color(0xFF0F1015))
                : (isDark ? const Color(0xFF1E2028) : const Color(0xFFF3F3F6)),
            border: Border.all(
              color: isSelected
                  ? Colors.transparent
                  : (isDark ? Colors.white.withValues(alpha: 0.08) : Colors.transparent),
            ),
          ),
          child: Text(
            label,
            style: GoogleFonts.outfit(
              fontSize: 11.5,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color: isSelected
                  ? (isDark ? const Color(0xFF0F1015) : Colors.white)
                  : (isDark ? Colors.white70 : const Color(0xFF5A5A66)),
            ),
          ),
        ),
      ),
    );
  }
}
