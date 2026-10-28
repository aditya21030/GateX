import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'providers/app_provider.dart';
import 'providers/pomodoro_provider.dart';
import 'providers/auth_provider.dart';
import 'services/notification_service.dart';
import 'services/ad_service.dart';
import 'services/storage_service.dart';
import 'theme/app_theme.dart';
import 'widgets/neu_widgets.dart';
import 'screens/home_screen.dart';
import 'screens/planner_screen.dart';
import 'screens/pyq_screen.dart';
import 'screens/mock_tracker_screen.dart';
import 'screens/more_screen.dart';
import 'screens/exam_selection_screen.dart';
import 'screens/auth_screen.dart';
import 'screens/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    debugPrint("Global FlutterError caught: ${details.exception}");
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    debugPrint("Global PlatformDispatcher error caught: $error");
    return true; // Prevents app termination on uncaught async errors
  };

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final authProvider = AuthProvider();
  await authProvider.init();

  // Initialize notifications first so timezone is ready
  await NotificationService().init();

  final appProvider = AppProvider();
  await appProvider.init();

  // Initialize Ads in the background
  await AdService().init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>.value(value: authProvider),
        ChangeNotifierProvider<AppProvider>.value(value: appProvider),
        ChangeNotifierProvider<PomodoroProvider>(
          create: (_) => PomodoroProvider()..init(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    return MaterialApp(
      title: 'GATE DA Prep',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: provider.themeMode,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

// 1. SPLASH SCREEN (2.5 second duration with staggered premium animations)
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _textFadeAnimation;
  late Animation<Offset> _textSlideAnimation;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final appProvider = Provider.of<AppProvider>(context, listen: false);
    final bool isReturningUser = authProvider.isLoggedIn && appProvider.selectedExam != null;
    final int delayMs = isReturningUser ? 600 : 1200;

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: delayMs),
    );

    _scaleAnimation = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOutBack),
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.4, curve: Curves.easeIn),
      ),
    );

    _textFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.8, curve: Curves.easeIn),
      ),
    );

    _textSlideAnimation = Tween<Offset>(begin: const Offset(0.0, 0.3), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.8, curve: Curves.easeOutCubic),
      ),
    );

    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.95, curve: Curves.easeInOutSine),
      ),
    );

    _controller.forward();

    // Navigate smoothly after animation completes
    Future.delayed(Duration(milliseconds: delayMs), () {
      if (mounted) {
        final authProvider = Provider.of<AuthProvider>(context, listen: false);
        final appProvider = Provider.of<AppProvider>(context, listen: false);
        
        final bool isLoggedIn = authProvider.isLoggedIn;
        final bool hasSelectedExam = appProvider.selectedExam != null && appProvider.selectedExam!.isNotEmpty;
        final bool isGuestMode = StorageService().prefs.getBool('is_guest_mode') ?? false;

        Widget nextScreen;
        if (isLoggedIn || (isGuestMode && hasSelectedExam)) {
          nextScreen = hasSelectedExam ? const MainNavigationScaffold() : const ExamSelectionScreen();
        } else {
          final hasSeenOnboarding = StorageService().prefs.getBool('has_seen_onboarding') ?? false;
          nextScreen = hasSeenOnboarding ? const AuthScreen() : const OnboardingScreen();
        }

        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => nextScreen,
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
            transitionDuration: const Duration(milliseconds: 600),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Solid Black Background for seamless logo blending
          Container(
            color: const Color(0xFF000000),
          ),
          
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Glowing Backlight + Clean Floating Logo
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _fadeAnimation.value,
                      child: Transform.scale(
                        scale: _scaleAnimation.value,
                        child: child,
                      ),
                    );
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Soft Violet Backdrop Glow
                      Container(
                        width: 260,
                        height: 260,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              AppTheme.primary.withOpacity(0.15),
                              AppTheme.primary.withOpacity(0.0),
                            ],
                          ),
                        ),
                      ),
                      // Floating GateX App Icon
                      SizedBox(
                        width: 170,
                        height: 170,
                        child: Image.asset(
                          'assets/icon/app_icon.jpg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Premium Spaced Slogan
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _textFadeAnimation.value,
                      child: FractionalTranslation(
                        translation: _textSlideAnimation.value,
                        child: child,
                      ),
                    );
                  },
                  child: const Text(
                    'TURNING ASPIRATIONS INTO AIRs',
                    style: TextStyle(
                      color: Color(0xFFD1D5DB), // Sleek light gray
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Thin premium loading indicator at bottom
          Positioned(
            bottom: 60,
            left: 60,
            right: 60,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _textFadeAnimation.value,
                  child: Container(
                    height: 2,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: FractionallySizedBox(
                        widthFactor: _progressAnimation.value,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF8B5CF6),
                                Color(0xFF06B6D4),
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF8B5CF6).withOpacity(0.3),
                                blurRadius: 6,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// 2. CORE NAVIGATION SCAFFOLD (5 Exam-Priority Tabs)
class MainNavigationScaffold extends StatelessWidget {
  const MainNavigationScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = context.select<AppProvider, int>((p) => p.selectedIndex);

    final List<Widget> screens = [
      const HomeScreen(),
      const PlannerScreen(),
      const PYQScreen(),
      const MockTrackerScreen(),
      const MoreScreen(),
    ];

    final navItems = [
      const _NavItem(
        icon: Icons.home_outlined,
        activeIcon: Icons.home_rounded,
        label: 'Home',
        activeColor: Color(0xFF7C3AED), // Vibrant Royal Violet
      ),
      const _NavItem(
        icon: Icons.checklist_rtl_rounded,
        activeIcon: Icons.checklist_rtl_rounded,
        label: 'Checklist',
        activeColor: Color(0xFF10B981), // Emerald Mint
      ),
      const _NavItem(
        icon: Icons.menu_book_outlined,
        activeIcon: Icons.menu_book_rounded,
        label: 'PYQ Bank',
        activeColor: Color(0xFFFF7A00), // Flame Sunset Orange
      ),
      const _NavItem(
        icon: Icons.sports_score_outlined,
        activeIcon: Icons.sports_score_rounded,
        label: 'Mock Arena',
        activeColor: Color(0xFF6366F1), // Royal Indigo
      ),
      const _NavItem(
        icon: Icons.grid_view_outlined,
        activeIcon: Icons.grid_view_rounded,
        label: 'Hub',
        activeColor: Color(0xFF00B4D8), // Electric Cyan
      ),
    ];

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        if (selectedIndex != 0) {
          Provider.of<AppProvider>(context, listen: false).setSelectedIndex(0);
          return;
        }
        _showExitBreakDialog(context);
      },
      child: Scaffold(
        body: IndexedStack(
          index: selectedIndex,
          children: screens,
        ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          margin: const EdgeInsets.fromLTRB(14, 0, 14, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: context.isDarkMode ? 0.45 : 0.12),
                blurRadius: 26,
                offset: const Offset(0, 8),
              ),
              if (context.isDarkMode)
                BoxShadow(
                  color: AppTheme.accentPurple.withValues(alpha: 0.18),
                  blurRadius: 22,
                  offset: const Offset(0, 2),
                ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
              child: Container(
                height: 64,
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                decoration: BoxDecoration(
                  color: context.isDarkMode
                      ? const Color(0xFF13141C).withValues(alpha: 0.90)
                      : Colors.white.withValues(alpha: 0.92),
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(
                    color: context.isDarkMode
                        ? Colors.white.withValues(alpha: 0.14)
                        : Colors.black.withValues(alpha: 0.08),
                    width: 1.2,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(navItems.length, (index) {
                    final isSelected = selectedIndex == index;
                    final item = navItems[index];
                    return _NavBarItem(
                      item: item,
                      isSelected: isSelected,
                      onTap: () {
                        HapticFeedback.selectionClick();
                        Provider.of<AppProvider>(context, listen: false).setSelectedIndex(index);
                      },
                    );
                  }),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
  }

  void _showExitBreakDialog(BuildContext context) {
    HapticFeedback.lightImpact();
    showDialog<void>(
      context: context,
      builder: (ctx) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          insetPadding: const EdgeInsets.symmetric(horizontal: 24),
          child: NeuContainer(
            borderRadius: 24,
            padding: const EdgeInsets.all(22),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 68,
                  height: 68,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFF9F43), Color(0xFFFF5252)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFFF9F43).withValues(alpha: 0.35),
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text('☕', style: TextStyle(fontSize: 34)),
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  'Take a Break? Cup of Tea ☕',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: context.textColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "You've put in great prep today! Step back, refresh your mind with a warm cup of tea, and come back stronger.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.5,
                    height: 1.45,
                    color: context.textSecondaryColor,
                  ),
                ),
                const SizedBox(height: 22),
                Row(
                  children: [
                    Expanded(
                      child: NeuButton(
                        isPrimary: false,
                        borderRadius: 14,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        onPressed: () {
                          HapticFeedback.selectionClick();
                          Navigator.of(ctx).pop();
                        },
                        child: Text(
                          'Keep Studying',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: context.textColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: NeuButton(
                        isPrimary: true,
                        borderRadius: 14,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        onPressed: () {
                          HapticFeedback.mediumImpact();
                          Navigator.of(ctx).pop();
                          SystemNavigator.pop();
                        },
                        child: const Text(
                          'Take a Break',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final _NavItem item;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      borderRadius: BorderRadius.circular(24),
      child: AnimatedScale(
        scale: isSelected ? 1.03 : 1.0,
        duration: const Duration(milliseconds: 240),
        curve: Curves.easeOutBack,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 260),
          curve: Curves.easeOutCubic,
          padding: EdgeInsets.symmetric(
            horizontal: isSelected ? 13 : 9,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            gradient: isSelected
                ? LinearGradient(
                    colors: [
                      HSLColor.fromColor(item.activeColor).withLightness((HSLColor.fromColor(item.activeColor).lightness + 0.16).clamp(0.0, 0.95)).toColor(),
                      item.activeColor,
                      HSLColor.fromColor(item.activeColor).withLightness((HSLColor.fromColor(item.activeColor).lightness - 0.20).clamp(0.0, 1.0)).toColor(),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
            borderRadius: BorderRadius.circular(24),
            border: isSelected
                ? Border.all(color: Colors.white.withValues(alpha: 0.40), width: 1.2)
                : null,
            boxShadow: isSelected
                ? [
                    // 3D physical ledge shadow
                    BoxShadow(
                      color: HSLColor.fromColor(item.activeColor).withLightness((HSLColor.fromColor(item.activeColor).lightness - 0.30).clamp(0.0, 1.0)).toColor(),
                      offset: const Offset(0, 2.5),
                      blurRadius: 0,
                    ),
                    // Clean contact shadow (no hazy ambient light)
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.25),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isSelected ? item.activeIcon : item.icon,
                color: isSelected ? Colors.white : context.textSecondaryColor,
                size: 20,
                shadows: isSelected
                    ? const [
                        Shadow(color: Colors.black38, offset: Offset(0, 1.2), blurRadius: 1.5),
                      ]
                    : [
                        Shadow(color: Colors.black.withValues(alpha: 0.25), offset: const Offset(0, 1), blurRadius: 1.5),
                      ],
              ),
              if (isSelected) ...[
                const SizedBox(width: 5),
                Text(
                  item.label,
                  style: GoogleFonts.outfit(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final Color activeColor;
  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    this.activeColor = AppTheme.accentPurple,
  });
}
