import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/app_provider.dart';
import '../services/storage_service.dart';
import '../theme/app_theme.dart';
import '../main.dart'; // For MainNavigationScaffold
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide AuthProvider;
import 'exam_selection_screen.dart';
import 'forgot_password_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {
  bool _isLogin = true;
  bool _isLoading = false;
  bool _obscurePassword = true;

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _errorMessage;
  String? _errorQuote;

  final List<String> _iitQuotes = [
    "Keep pushing, IIT Bombay is waiting for you!",
    "A wrong answer is just a step closer to IIT Delhi.",
    "Don't give up, IISc Bangalore needs minds like yours.",
    "Stay focused! Your IIT dream is alive.",
    "Every mistake is a lesson for IIT Madras.",
    "IIT Kanpur rewards persistence. Try again!",
    "Success at IIT Roorkee demands resilience."
  ];

  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeOut),
    );
    _fadeController.forward();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  void _setMode(bool isLogin) {
    if (_isLogin == isLogin) return;
    setState(() {
      _isLogin = isLogin;
      _errorMessage = null;
      _errorQuote = null;
    });
    _fadeController.reset();
    _fadeController.forward();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    
    setState(() => _isLoading = true);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    
    try {
      bool isNewUser = false;
      if (_isLogin) {
        isNewUser = await authProvider.login(_emailController.text, _passwordController.text);
      } else {
        isNewUser = await authProvider.signup(_nameController.text, _emailController.text, _passwordController.text);
      }
      await _navigateAfterAuth(isNewUser);
    } catch (e) {
      setState(() {
        _errorMessage = e.toString().replaceAll('Exception: ', '');
        _errorQuote = _iitQuotes[Random().nextInt(_iitQuotes.length)];
      });
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _googleLogin() async {
    setState(() => _isLoading = true);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    try {
      bool isNewUser = await authProvider.loginWithGoogle();
      await _navigateAfterAuth(isNewUser);
    } catch (e) {
      setState(() {
        _errorMessage = e.toString().replaceAll('Exception: ', '');
        _errorQuote = _iitQuotes[Random().nextInt(_iitQuotes.length)];
      });
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _navigateAfterAuth(bool isNewUser) async {
    if (!mounted) return;
    final appProvider = Provider.of<AppProvider>(context, listen: false);
    final user = FirebaseAuth.instance.currentUser;
    
    if (isNewUser) {
      // Force new user to select an exam
      appProvider.setExams('', ''); // Clear local exam temporarily
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const ExamSelectionScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 600),
        ),
      );
    } else {
      // Existing user: check Firestore for their saved exam choice
      if (user != null) {
        try {
          // Restore all data from Firebase to local Hive database first
          await StorageService().restoreFromCloud(user.uid);
          await appProvider.init(); // Reload all local variables

          final doc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
          if (doc.exists && doc.data() != null && doc.data()!.containsKey('selectedExam')) {
            String savedExam = doc.data()!['selectedExam'];
            String activeExam = doc.data()!['activeExam'] ?? (savedExam == 'BOTH' ? 'DA' : savedExam);
            
            await appProvider.setExams(savedExam, activeExam);
            
            if (!mounted) return;
            Navigator.of(context).pushReplacement(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => const MainNavigationScaffold(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
                transitionDuration: const Duration(milliseconds: 600),
              ),
            );
            return;
          }
        } catch (e) {
          // Fallback to Exam Selection if fetching fails
        }
      }
      
      // If we couldn't fetch their exam from Firestore, make them pick again
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const ExamSelectionScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 600),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Deep black base
      body: Stack(
        children: [
          // Background Gradient Orbs
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.primary.withOpacity(0.4),
              ),
            ),
          ),
          Positioned(
            bottom: -150,
            right: -100,
            child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.secondary.withOpacity(0.3),
              ),
            ),
          ),
          // Intense Blur for Glassmorphism base
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 80.0, sigmaY: 80.0),
              child: Container(
                color: Colors.white60, // Dark overlay
              ),
            ),
          ),

          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Header Section
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppTheme.textPrimary.withOpacity(0.05),
                          shape: BoxShape.circle,
                          border: Border.all(color: AppTheme.textPrimary.withOpacity(0.1)),
                        ),
                        child: const Icon(Icons.blur_on_rounded, size: 48, color: AppTheme.textPrimary),
                      ),
                      const SizedBox(height: 24),
                      
                      Text(
                        'Begin Your IIT Journey',
                        style: AppTheme.poppinsBold(fontSize: 28),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Unlock your potential with GateX.',
                        style: TextStyle(color: Colors.white60, fontSize: 14, letterSpacing: 0.5),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),

                      // Custom Segmented Toggle for Login/Signup
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppTheme.textPrimary.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: AppTheme.textPrimary.withOpacity(0.1)),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () => _setMode(true),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: _isLogin ? AppTheme.primary : Colors.transparent,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Log In',
                                    style: TextStyle(
                                      color: _isLogin ? Colors.white : Colors.white54,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () => _setMode(false),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: !_isLogin ? AppTheme.primary : Colors.transparent,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      color: !_isLogin ? Colors.white : Colors.white54,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 40),

                      // Form Section (No box outline)
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            if (!_isLogin) ...[
                              _buildTextField(
                                controller: _nameController,
                                icon: Icons.person_outline_rounded,
                                label: 'Full Name',
                                validator: (val) => val!.isEmpty ? 'Enter your name' : null,
                              ),
                              const SizedBox(height: 20),
                            ],
                            
                            _buildTextField(
                              controller: _emailController,
                              icon: Icons.alternate_email_rounded,
                              label: 'Email Address',
                              keyboardType: TextInputType.emailAddress,
                              validator: (val) => !val!.contains('@') ? 'Enter a valid email' : null,
                            ),
                            const SizedBox(height: 20),
                            
                            _buildTextField(
                              controller: _passwordController,
                              icon: Icons.lock_outline_rounded,
                              label: 'Password',
                              obscureText: _obscurePassword,
                              suffixIcon: IconButton(
                                icon: Icon(_obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: Colors.white54),
                                onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                              ),
                              validator: (val) => val!.length < 6 ? 'Password too short' : null,
                            ),
                            
                            if (_errorMessage != null) ...[
                              const SizedBox(height: 16),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: AppTheme.error.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: AppTheme.error.withOpacity(0.5)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Icon(Icons.error_outline_rounded, color: AppTheme.error, size: 20),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            _errorMessage!,
                                            style: const TextStyle(color: AppTheme.error, fontSize: 13, fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (_errorQuote != null) ...[
                                      const SizedBox(height: 8),
                                      Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: AppTheme.error.withOpacity(0.05),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          _errorQuote!,
                                          style: TextStyle(color: AppTheme.error.withOpacity(0.8), fontSize: 11, fontStyle: FontStyle.italic),
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                            ],
                            
                            if (_isLogin) ...[
                              const SizedBox(height: 12),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => const ForgotPasswordScreen()));
                                  },
                                  child: const Text('Forgot Password?', style: TextStyle(color: AppTheme.secondary, fontWeight: FontWeight.w600)),
                                ),
                              ),
                            ] else ...[
                              const SizedBox(height: 24),
                            ],
                            
                            // Primary Action Button
                            Container(
                              height: 56,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: const LinearGradient(
                                  colors: [AppTheme.primary, AppTheme.secondary],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppTheme.primary.withOpacity(0.3),
                                    blurRadius: 15,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                onPressed: _isLoading ? null : _submit,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                ),
                                child: _isLoading
                                    ? const SizedBox(height: 24, width: 24, child: CircularProgressIndicator(color: AppTheme.textPrimary, strokeWidth: 2))
                                    : Text(_isLogin ? 'Log In' : 'Create Account', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.textPrimary, letterSpacing: 1.0)),
                              ),
                            ),
                            
                            const SizedBox(height: 32),
                            
                            // Divider
                            Row(
                              children: [
                                Expanded(child: Container(height: 1, color: AppTheme.textPrimary.withOpacity(0.1))),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: Text('OR', style: TextStyle(color: AppTheme.textPrimary.withOpacity(0.4), fontSize: 12, fontWeight: FontWeight.bold)),
                                ),
                                Expanded(child: Container(height: 1, color: AppTheme.textPrimary.withOpacity(0.1))),
                              ],
                            ),
                            
                            const SizedBox(height: 32),
                            
                            // Social Login
                            SizedBox(
                              height: 56,
                              child: OutlinedButton.icon(
                                onPressed: _isLoading ? null : _googleLogin,
                                icon: const Icon(Icons.g_mobiledata_rounded, size: 32, color: AppTheme.textPrimary),
                                label: const Text('Continue with Google', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppTheme.textPrimary)),
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: AppTheme.surface.withOpacity(0.05),
                                  side: BorderSide(color: AppTheme.textPrimary.withOpacity(0.1)),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                ),
                              ),
                            ),
                            const SizedBox(height: 32),
                          ],
                        ),
                      ),
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

  Widget _buildTextField({
    required TextEditingController controller,
    required IconData icon,
    required String label,
    bool obscureText = false,
    TextInputType? keyboardType,
    Widget? suffixIcon,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      style: const TextStyle(color: AppTheme.textPrimary, fontSize: 15),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: AppTheme.textPrimary.withOpacity(0.5), fontSize: 14),
        prefixIcon: Icon(icon, color: AppTheme.textPrimary.withOpacity(0.5)),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.black.withOpacity(0.2),
        contentPadding: const EdgeInsets.symmetric(vertical: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppTheme.textPrimary.withOpacity(0.05)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppTheme.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppTheme.error, width: 1.0),
        ),
      ),
    );
  }
}
