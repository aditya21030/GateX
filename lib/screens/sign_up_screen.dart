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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF6B38FF),
              Color(0xFF7B2CBF),
              Color(0xFF5A189A),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            // Top Electric Purple Stage with 3D IIT Asset and back button
            AuthPurpleHeaderWithIIT(
              action: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.18),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.25),
                    width: 1,
                  ),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                    size: 18,
                  ),
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      );
                    }
                  },
                ),
              ),
              imageAsset: 'assets/images/3d/iit_delhi.png',
              targetIIT: 'IIT DELHI GATE',
              airRank: 'NEW ASPIRANT',
            ),

            // Bottom Sheet with Sleek, Refined Top Curve
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF14151B) : Colors.white,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: isDark ? 0.35 : 0.08),
                      blurRadius: 20,
                      offset: const Offset(0, -4),
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
                      // Header Badge + Title
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: (isDark ? const Color(0xFF9D65FF) : const Color(0xFF6B38FF)).withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.auto_awesome_rounded,
                              size: 19,
                              color: isDark ? const Color(0xFF9D65FF) : const Color(0xFF6B38FF),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Get Started',
                            style: GoogleFonts.outfit(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: isDark ? Colors.white : const Color(0xFF121214),
                              letterSpacing: -0.4,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Create an account to start your structured GATE journey',
                        style: GoogleFonts.outfit(
                          fontSize: 13,
                          color: isDark ? Colors.white60 : const Color(0xFF6E6E78),
                        ),
                      ),
                      const SizedBox(height: 18),

                      // Google Sign Up Pill Button
                      GoogleAuthPillButton(
                        onPressed: _isLoading ? null : _googleLogin,
                        isLoading: _isLoading,
                      ),
                      const SizedBox(height: 16),

                      // Clean subtle divider
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: isDark ? Colors.white12 : const Color(0xFFE5E5EA),
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: Text(
                              'or sign up with email',
                              style: GoogleFonts.outfit(
                                fontSize: 12,
                                color: isDark ? Colors.white38 : const Color(0xFF8E8E98),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: isDark ? Colors.white12 : const Color(0xFFE5E5EA),
                              thickness: 1,
                            ),
                          ),
                        ],
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
                        hintText: 'Full Name',
                        prefixIcon: Icon(
                          Icons.person_outline_rounded,
                          size: 19,
                          color: isDark ? Colors.white38 : const Color(0xFF888894),
                        ),
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: 12),

                      // Enter your email
                      CleanAuthInputField(
                        controller: _emailController,
                        hintText: 'Enter your email',
                        prefixIcon: Icon(
                          Icons.mail_outline_rounded,
                          size: 19,
                          color: isDark ? Colors.white38 : const Color(0xFF888894),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 14),

                      // Target Branch Section
                      Padding(
                        padding: const EdgeInsets.only(left: 4, bottom: 8),
                        child: Text(
                          'TARGET EXAM STREAM',
                          style: GoogleFonts.outfit(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white54 : const Color(0xFF6E6E78),
                            letterSpacing: 0.8,
                          ),
                        ),
                      ),

                      // Target Branch Selector Pills (No overflow, clean 2-line cards)
                      Row(
                        children: [
                          _buildBranchPill('GATE DA', 'Data & AI', 'DA', isDark),
                          const SizedBox(width: 8),
                          _buildBranchPill('GATE CS', 'Comp Sci', 'CSIT', isDark),
                          const SizedBox(width: 8),
                          _buildBranchPill('DA + CS', 'Dual Target', 'BOTH', isDark),
                        ],
                      ),
                      const SizedBox(height: 14),

                      // Password
                      CleanAuthInputField(
                        controller: _passwordController,
                        hintText: 'Password (min 6 chars)',
                        obscureText: !_isPasswordVisible,
                        prefixIcon: Icon(
                          Icons.lock_outline_rounded,
                          size: 19,
                          color: isDark ? Colors.white38 : const Color(0xFF888894),
                        ),
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
                        prefixIcon: Icon(
                          Icons.lock_outline_rounded,
                          size: 19,
                          color: isDark ? Colors.white38 : const Color(0xFF888894),
                        ),
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

                      // Solid Black Pill Button: [ Get Started ]
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
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
  }

  Widget _buildBranchPill(String title, String subtitle, String value, bool isDark) {
    final isSelected = _selectedBranch == value;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedBranch = value),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: isSelected
                ? (isDark ? Colors.white : const Color(0xFF0F1015))
                : (isDark ? const Color(0xFF1E2028) : const Color(0xFFF3F3F6)),
            border: Border.all(
              color: isSelected
                  ? Colors.transparent
                  : (isDark ? Colors.white.withValues(alpha: 0.08) : const Color(0xFFE8E8EE)),
              width: 1,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.outfit(
                  fontSize: 12.5,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                  color: isSelected
                      ? (isDark ? const Color(0xFF0F1015) : Colors.white)
                      : (isDark ? Colors.white : const Color(0xFF202028)),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.outfit(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: isSelected
                      ? (isDark ? const Color(0xFF5A5A66) : const Color(0xFFB0B0C0))
                      : (isDark ? Colors.white38 : const Color(0xFF888894)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
