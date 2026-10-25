import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/storage_service.dart';
import '../widgets/iit_onboarding_components.dart';
import 'login_screen.dart';
import 'sign_up_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;

    final List<({String title, String subtitle})> _slides = const [
    (
      title: 'Target Top IITs &\nPremier IISc Research',
      subtitle: 'Aim for IIT Bombay, Delhi, Madras & IISc Bangalore with structured syllabus mastery.',
    ),
    (
      title: 'Prestigious PSU\nCareers & Recruitment',
      subtitle: 'Direct high-paying recruitment in ONGC, IOCL, NTPC, BHEL, ISRO & BARC with top percentile.',
    ),
    (
      title: 'Official TCS iON\nExam Simulation & Drills',
      subtitle: 'Real exam interface with virtual scientific calculator, timer, and AI mistake notebook.',
    ),
  ];

  Future<void> _completeOnboarding({bool toSignUp = false}) async {
    HapticFeedback.selectionClick();
    await StorageService().prefs.setBool('has_seen_onboarding', true);

    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            toSignUp ? const SignUpScreen() : const LoginScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 320),
      ),
    );
  }

  void _onNext() {
    HapticFeedback.lightImpact();
    if (_currentPage < _slides.length - 1) {
      setState(() => _currentPage++);
    } else {
      _completeOnboarding(toSignUp: true);
    }
  }

  void _onPrevious() {
    if (_currentPage > 0) {
      HapticFeedback.lightImpact();
      setState(() => _currentPage--);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentSlide = _slides[_currentPage];
    final isLastSlide = _currentPage == _slides.length - 1;

    return Scaffold(
      backgroundColor: const Color(0xFF070709),
      body: SafeArea(
        child: GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity != null) {
              if (details.primaryVelocity! < -200) {
                _onNext();
              } else if (details.primaryVelocity! > 200) {
                _onPrevious();
              }
            }
          },
          child: Column(
            children: [
              // Top Bar: Clean minimal header (no starburst logo as requested)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'GateX',
                      style: GoogleFonts.outfit(
                        color: Colors.white.withValues(alpha: 0.85),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.8,
                      ),
                    ),
                    TextButton(
                      onPressed: () => _completeOnboarding(toSignUp: false),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white60,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      ),
                      child: Text(
                        'Skip',
                        style: GoogleFonts.outfit(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Middle Visual Area: 3D Floating IIT Cards (Slide 0) or 3D IIT Monument (Slide 1 & 2)
              Expanded(
                flex: 5,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 350),
                  child: CurvedMinimalIITCardsStage(
                    key: ValueKey(_currentPage),
                    slideIndex: _currentPage,
                  ),
                ),
              ),

              // Bottom Area: Neon Glow Sheet matching reference screens
              NeonGlowSheet(
                hasGlow: !isLastSlide,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(28, 26, 28, 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Minimalist Dash Page Indicators (-- - -)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(_slides.length, (i) {
                          final isActive = i == _currentPage;
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 240),
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            width: isActive ? 20 : 6,
                            height: 3.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: isActive
                                  ? Colors.white
                                  : Colors.white.withValues(alpha: 0.25),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 22),

                      // Title
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 280),
                        child: Text(
                          currentSlide.title,
                          key: ValueKey(_currentPage),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.outfit(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.25,
                            letterSpacing: -0.4,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Subtitle
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 280),
                        child: Text(
                          currentSlide.subtitle,
                          key: ValueKey('sub_$_currentPage'),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.outfit(
                            fontSize: 13,
                            color: Colors.white.withValues(alpha: 0.65),
                            height: 1.45,
                          ),
                        ),
                      ),
                      const SizedBox(height: 28),

                      // Primary Action Button (White in slide 3, dark pill in 1 & 2)
                      SleekCapsuleButton(
                        label: isLastSlide ? 'Get Started' : 'Next',
                        isWhite: isLastSlide,
                        onPressed: _onNext,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
