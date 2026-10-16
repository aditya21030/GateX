import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'providers/app_provider.dart';
import 'providers/pomodoro_provider.dart';
import 'providers/auth_provider.dart';
import 'services/notification_service.dart';
import 'services/ad_service.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';
import 'screens/planner_screen.dart';
import 'screens/pyq_screen.dart';
import 'screens/roadmap_screen.dart';
import 'screens/more_screen.dart';
import 'screens/exam_selection_screen.dart';
import 'screens/auth_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
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
    final int delayMs = isReturningUser ? 800 : 2000;

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
        final bool hasSelectedExam = appProvider.selectedExam != null;

        Widget nextScreen;
        if (!isLoggedIn) {
          nextScreen = const AuthScreen();
        } else if (hasSelectedExam) {
          nextScreen = const MainNavigationScaffold();
        } else {
          nextScreen = const ExamSelectionScreen();
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

// 2. CORE NAVIGATION SCAFFOLD (5 main tabs)
class MainNavigationScaffold extends StatelessWidget {
  const MainNavigationScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = context.select<AppProvider, int>((p) => p.selectedIndex);

    final List<Widget> screens = [
      const HomeScreen(),
      const PlannerScreen(),
      const PYQScreen(),
      const RoadmapScreen(),
      const MoreScreen(),
    ];

    const navItems = [
      _NavItem(
        icon: Icons.home_outlined,
        activeIcon: Icons.home_rounded,
        label: 'Home',
      ),
      _NavItem(
        icon: Icons.calendar_month_outlined,
        activeIcon: Icons.calendar_month_rounded,
        label: 'Planner',
      ),
      _NavItem(
        icon: Icons.book_outlined,
        activeIcon: Icons.book_rounded,
        label: 'PYQs',
      ),
      _NavItem(
        icon: Icons.map_outlined,
        activeIcon: Icons.map_rounded,
        label: 'Roadmap',
      ),
      _NavItem(
        icon: Icons.grid_view_outlined,
        activeIcon: Icons.grid_view_rounded,
        label: 'More',
      ),
    ];

    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
        color: AppTheme.background,
        padding: EdgeInsets.fromLTRB(
          16,
          4,
          16,
          MediaQuery.of(context).padding.bottom > 0
              ? MediaQuery.of(context).padding.bottom + 4
              : 16,
        ),
        child: Container(
          height: 66,
          decoration: BoxDecoration(
            color: AppTheme.surface.withOpacity(0.95),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white.withOpacity(0.06),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(navItems.length, (index) {
              final isSelected = selectedIndex == index;
              final item = navItems[index];
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    Provider.of<AppProvider>(context, listen: false).setSelectedIndex(index);
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Active indicator dot on top
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: isSelected ? 4 : 0,
                        height: isSelected ? 4 : 0,
                        decoration: const BoxDecoration(
                          color: AppTheme.secondary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(height: 4),
                      // Scaling icon
                      AnimatedScale(
                        scale: isSelected ? 1.15 : 1.0,
                        duration: const Duration(milliseconds: 200),
                        child: Icon(
                          isSelected ? item.activeIcon : item.icon,
                          color: isSelected ? AppTheme.secondary : AppTheme.textSecondary,
                          size: 24,
                        ),
                      ),
                      const SizedBox(height: 3),
                      // Text label
                      Text(
                        item.label,
                        style: TextStyle(
                          color: isSelected ? Colors.white : AppTheme.textSecondary,
                          fontSize: 10,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
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
  const _NavItem({required this.icon, required this.activeIcon, required this.label});
}
