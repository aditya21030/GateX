import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

/// Premium 3D IIT Asset & Monument Widget
/// Renders authentic high-definition 3D rendered assets with ambient lighting,
/// soft floating animation, ground shadow, and modern frosted glass badge.
class IITMonument3DAsset extends StatefulWidget {
  final double size;
  final String targetIIT;
  final String airRank;
  final String? imageAsset;
  final bool showBadge;

  const IITMonument3DAsset({
    super.key,
    this.size = 280,
    this.targetIIT = 'IIT BOMBAY',
    this.airRank = 'AIR 1 TARGET',
    this.imageAsset,
    this.showBadge = true,
  });

  @override
  State<IITMonument3DAsset> createState() => _IITMonument3DAssetState();
}

class _IITMonument3DAssetState extends State<IITMonument3DAsset>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _floatAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    _floatAnim = Tween<double>(begin: -6.0, end: 6.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final asset = widget.imageAsset ?? 'assets/images/3d/iit_bombay.png';

    return AnimatedBuilder(
      animation: _floatAnim,
      builder: (context, child) {
        final float = _floatAnim.value;
        final scale = widget.size / 280.0;

        return SizedBox(
          width: widget.size,
          height: widget.size * 0.98,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              // 1. Ambient Radial Spotlight Glow
              Positioned(
                top: widget.size * 0.05,
                child: Container(
                  width: widget.size * 0.85,
                  height: widget.size * 0.85,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        const Color(0xFF8338EC).withValues(alpha: 0.38),
                        const Color(0xFF3A86FF).withValues(alpha: 0.18),
                        Colors.transparent,
                      ],
                      stops: const [0.15, 0.55, 1.0],
                    ),
                  ),
                ),
              ),

              // 2. Subtle Ground Elliptical Shadow
              Positioned(
                bottom: widget.size * 0.12 - float * 0.25,
                child: Container(
                  width: widget.size * 0.72,
                  height: widget.size * 0.10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: (0.42 - (float + 6) * 0.012).clamp(0.15, 0.55)),
                        blurRadius: 20 + float.abs() * 1.5,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ),
              ),

              // 3. Floating 3D IIT Asset Image
              Transform.translate(
                offset: Offset(0, float),
                child: SizedBox(
                  width: widget.size * 0.92,
                  height: widget.size * 0.72,
                  child: Image.asset(
                    asset,
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),

              // 4. Sleek Glassmorphic Target IIT Badge (Bottom)
              if (widget.showBadge)
                Positioned(
                  bottom: 2 + float * -0.3,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: (15 * scale).clamp(11.0, 18.0),
                      vertical: (7 * scale).clamp(5.5, 9.5),
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF161822).withValues(alpha: 0.88),
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.22),
                        width: 1.1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF8338EC).withValues(alpha: 0.35),
                          blurRadius: 16,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 7,
                          height: 7,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF00F5D4),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF00F5D4),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 7),
                        Text(
                          widget.targetIIT,
                          style: GoogleFonts.outfit(
                            color: Colors.white,
                            fontSize: (12.5 * scale).clamp(11.0, 13.5),
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.6,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            '•',
                            style: TextStyle(
                              color: Colors.white38,
                              fontSize: (11.5 * scale).clamp(10.0, 13.0),
                            ),
                          ),
                        ),
                        Text(
                          widget.airRank,
                          style: GoogleFonts.outfit(
                            color: const Color(0xFFFFD166),
                            fontSize: (11.5 * scale).clamp(10.0, 13.0),
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

/// Dynamic 3D Illustrated Onboarding Stages
/// Replaces text cards entirely with pure generated 3D assets:
/// - Slide 0: 3D GATE Student studying on books with PYQ books & floating subjects
/// - Slide 1: Interactive 3D Dream IIT Showcase (IIT Bombay, IIT Delhi, IIT Kanpur) with climbing aspirant
/// - Slide 2: 3D Victory Celebration Stage with AIR 1 GATE scorecard, trophy, and graduation cap
class CurvedMinimalIITCardsStage extends StatefulWidget {
  final int slideIndex;

  const CurvedMinimalIITCardsStage({
    super.key,
    required this.slideIndex,
  });

  @override
  State<CurvedMinimalIITCardsStage> createState() => _CurvedMinimalIITCardsStageState();
}

class _CurvedMinimalIITCardsStageState extends State<CurvedMinimalIITCardsStage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  int _selectedCampusIndex = 0;

  static const List<({String name, String asset, String rank, String tag})> _campuses = [
    (
      name: 'IIT BOMBAY',
      asset: 'assets/images/3d/iit_bombay.png',
      rank: 'AIR < 50',
      tag: 'CSE / AI PREFERRED',
    ),
    (
      name: 'IIT DELHI',
      asset: 'assets/images/3d/iit_delhi.png',
      rank: 'AIR < 75',
      tag: 'DATA SCIENCE HUB',
    ),
    (
      name: 'IIT KANPUR',
      asset: 'assets/images/3d/iit_kanpur.png',
      rank: 'AIR < 100',
      tag: 'MATH & COMPUTING',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final stageW = constraints.maxWidth;
        final stageH = constraints.maxHeight;

        switch (widget.slideIndex) {
          case 0:
            return _buildStage0StudyJourney(stageW, stageH);
          case 1:
            return _buildStage1DreamIIT(stageW, stageH);
          case 2:
          default:
            return _buildStage2VictoryMastery(stageW, stageH);
        }
      },
    );
  }

  /// Slide 0: 3D GATE Student Studying + PYQ Book Stack + Floating Subject Icons
  Widget _buildStage0StudyJourney(double stageW, double stageH) {
    return AnimatedBuilder(
      animation: _animController,
      builder: (context, child) {
        final t = _animController.value;
        final float1 = math.sin(t * math.pi * 2) * 6.0;
        final float2 = math.cos(t * math.pi * 2) * 5.0;

        return SizedBox(
          width: stageW,
          height: stageH,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              // Ambient radial glow
              Positioned.fill(
                child: Center(
                  child: Container(
                    width: stageW * 0.9,
                    height: stageH * 0.85,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          const Color(0xFF6B38FF).withValues(alpha: 0.22),
                          const Color(0xFF3A86FF).withValues(alpha: 0.12),
                          Colors.transparent,
                        ],
                        radius: 0.75,
                      ),
                    ),
                  ),
                ),
              ),

              // Ground shadow for student & books
              Positioned(
                bottom: stageH * 0.16,
                child: Container(
                  width: stageW * 0.75,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.55),
                        blurRadius: 28,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                ),
              ),

              // Center-Right: 3D PYQs Book Stack (grounded base)
              Positioned(
                bottom: stageH * 0.16 + float2 * 0.3,
                right: stageW * 0.08,
                child: SizedBox(
                  width: (stageW * 0.44).clamp(140.0, 185.0),
                  height: (stageH * 0.28).clamp(95.0, 130.0),
                  child: Image.asset(
                    'assets/images/3d/pyq_books.png',
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),

              // Center-Left: 3D GATE Student Reading Book on Books
              Positioned(
                bottom: stageH * 0.16 + float1,
                left: stageW * 0.10,
                child: SizedBox(
                  width: (stageW * 0.45).clamp(145.0, 190.0),
                  height: (stageH * 0.48).clamp(165.0, 215.0),
                  child: Image.asset(
                    'assets/images/3d/char_reading.png',
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),

              // Orbiting Micro 3D Asset 1: DSA Books (Top Left)
              Positioned(
                top: stageH * 0.08 - float1 * 0.7,
                left: stageW * 0.06,
                child: _buildFloatingOrb(
                  asset: 'assets/images/3d/subj_dsa.png',
                  size: 58,
                  accentColor: const Color(0xFFFF9E00),
                ),
              ),

              // Orbiting Micro 3D Asset 2: AI Brain (Top Right)
              Positioned(
                top: stageH * 0.06 + float2 * 0.8,
                right: stageW * 0.08,
                child: _buildFloatingOrb(
                  asset: 'assets/images/3d/subj_ai.png',
                  size: 60,
                  accentColor: const Color(0xFFFF5400),
                ),
              ),

              // Orbiting Micro 3D Asset 3: Code Laptop (Bottom Left)
              Positioned(
                bottom: stageH * 0.26 + float2 * 0.6,
                left: stageW * 0.03,
                child: _buildFloatingOrb(
                  asset: 'assets/images/3d/subj_programming.png',
                  size: 54,
                  accentColor: const Color(0xFF3A86FF),
                ),
              ),

              // Orbiting Micro 3D Asset 4: Target Dartboard (Top Center-Right)
              Positioned(
                top: stageH * 0.18 + float1 * 0.5,
                right: stageW * 0.28,
                child: _buildFloatingOrb(
                  asset: 'assets/images/3d/badge_target.png',
                  size: 52,
                  accentColor: const Color(0xFFFF0054),
                ),
              ),

              // Floating Bottom Status Pill
              Positioned(
                bottom: stageH * 0.04,
                child: _buildFrostedStatusPill(
                  icon: Icons.auto_awesome_rounded,
                  iconColor: const Color(0xFF00F5D4),
                  primaryText: '15+ YEARS PYQs',
                  secondaryText: 'DA & CSIT MASTERED',
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Slide 1: Interactive 3D Dream IIT Showcase + Aspirant Climbing Stairs
  Widget _buildStage1DreamIIT(double stageW, double stageH) {
    final campus = _campuses[_selectedCampusIndex];

    return AnimatedBuilder(
      animation: _animController,
      builder: (context, child) {
        final t = _animController.value;
        final float1 = math.sin(t * math.pi * 2) * 5.5;
        final float2 = math.cos(t * math.pi * 2) * 4.5;

        return SizedBox(
          width: stageW,
          height: stageH,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              // Ambient radial glow
              Positioned.fill(
                child: Center(
                  child: Container(
                    width: stageW * 0.95,
                    height: stageH * 0.85,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          const Color(0xFF7209B7).withValues(alpha: 0.24),
                          const Color(0xFF4361EE).withValues(alpha: 0.14),
                          Colors.transparent,
                        ],
                        radius: 0.80,
                      ),
                    ),
                  ),
                ),
              ),

              // Top Interactive Campus Selector Tabs
              Positioned(
                top: stageH * 0.04,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF141620).withValues(alpha: 0.85),
                    borderRadius: BorderRadius.circular(26),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.14),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(_campuses.length, (i) {
                      final isSel = i == _selectedCampusIndex;
                      final c = _campuses[i];
                      return GestureDetector(
                        onTap: () {
                          HapticFeedback.selectionClick();
                          setState(() => _selectedCampusIndex = i);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 240),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                          decoration: BoxDecoration(
                            color: isSel ? const Color(0xFF6B38FF) : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: isSel
                                ? [
                                    BoxShadow(
                                      color: const Color(0xFF6B38FF).withValues(alpha: 0.4),
                                      blurRadius: 10,
                                      offset: const Offset(0, 2),
                                    ),
                                  ]
                                : null,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                c.name.replaceFirst('IIT ', ''),
                                style: GoogleFonts.outfit(
                                  color: isSel ? Colors.white : Colors.white60,
                                  fontSize: 12,
                                  fontWeight: isSel ? FontWeight.bold : FontWeight.w500,
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

              // Ground Shadow
              Positioned(
                bottom: stageH * 0.17,
                child: Container(
                  width: stageW * 0.80,
                  height: 22,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.50),
                        blurRadius: 26,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
              ),

              // Main 3D IIT Landmark with smooth AnimatedSwitcher
              Positioned(
                top: stageH * 0.18 + float1,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 320),
                  transitionBuilder: (child, anim) {
                    return FadeTransition(
                      opacity: anim,
                      child: ScaleTransition(scale: Tween<double>(begin: 0.94, end: 1.0).animate(anim), child: child),
                    );
                  },
                  child: SizedBox(
                    key: ValueKey(campus.name),
                    width: (stageW * 0.76).clamp(240.0, 310.0),
                    height: (stageH * 0.36).clamp(135.0, 175.0),
                    child: Image.asset(
                      campus.asset,
                      fit: BoxFit.contain,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
              ),

              // Left Flank: 3D Aspirant Climbing Steps towards success
              Positioned(
                bottom: stageH * 0.15 + float2,
                left: stageW * 0.04,
                child: SizedBox(
                  width: (stageW * 0.32).clamp(100.0, 130.0),
                  height: (stageH * 0.30).clamp(100.0, 135.0),
                  child: Image.asset(
                    'assets/images/3d/char_stairs.png',
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),

              // Right Flank: 3D Golden Trophy Cup
              Positioned(
                bottom: stageH * 0.22 - float1 * 0.6,
                right: stageW * 0.06,
                child: _buildFloatingOrb(
                  asset: 'assets/images/3d/badge_trophy.png',
                  size: 64,
                  accentColor: const Color(0xFFFFD166),
                ),
              ),

              // Floating Bottom Status Pill
              Positioned(
                bottom: stageH * 0.04,
                child: _buildFrostedStatusPill(
                  icon: Icons.stars_rounded,
                  iconColor: const Color(0xFFFFD166),
                  primaryText: campus.name,
                  secondaryText: '${campus.rank} • ${campus.tag}',
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Slide 2: 3D Victory Celebration Stage (AIR 1 Scorecard, Trophy, Graduation Cap)
  Widget _buildStage2VictoryMastery(double stageW, double stageH) {
    return AnimatedBuilder(
      animation: _animController,
      builder: (context, child) {
        final t = _animController.value;
        final float1 = math.sin(t * math.pi * 2) * 6.0;
        final float2 = math.cos(t * math.pi * 2) * 5.0;

        return SizedBox(
          width: stageW,
          height: stageH,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              // Ambient victory golden-violet radial glow
              Positioned.fill(
                child: Center(
                  child: Container(
                    width: stageW * 0.95,
                    height: stageH * 0.85,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          const Color(0xFFFFB703).withValues(alpha: 0.22),
                          const Color(0xFF8338EC).withValues(alpha: 0.16),
                          Colors.transparent,
                        ],
                        radius: 0.80,
                      ),
                    ),
                  ),
                ),
              ),

              // Ground Shadow
              Positioned(
                bottom: stageH * 0.15,
                child: Container(
                  width: stageW * 0.65,
                  height: 22,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.55),
                        blurRadius: 28,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
              ),

              // Center Hero: 3D Student Celebrating Victory with GATE Scorecard Checkmark
              Positioned(
                bottom: stageH * 0.15 + float1,
                child: SizedBox(
                  width: (stageW * 0.55).clamp(180.0, 230.0),
                  height: (stageH * 0.52).clamp(180.0, 240.0),
                  child: Image.asset(
                    'assets/images/3d/char_celebrating.png',
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),

              // Top Left: 3D Golden Trophy Cup
              Positioned(
                top: stageH * 0.08 - float1 * 0.7,
                left: stageW * 0.06,
                child: _buildFloatingOrb(
                  asset: 'assets/images/3d/badge_trophy.png',
                  size: 66,
                  accentColor: const Color(0xFFFFD166),
                ),
              ),

              // Top Right: 3D Graduation Cap with Diploma
              Positioned(
                top: stageH * 0.08 + float2 * 0.7,
                right: stageW * 0.05,
                child: _buildFloatingOrb(
                  asset: 'assets/images/3d/badge_grad_cap.png',
                  size: 78,
                  accentColor: const Color(0xFF00F5D4),
                ),
              ),

              // Bottom Left: 3D Growth Chart
              Positioned(
                bottom: stageH * 0.24 + float2 * 0.6,
                left: stageW * 0.05,
                child: _buildFloatingOrb(
                  asset: 'assets/images/3d/badge_growth.png',
                  size: 56,
                  accentColor: const Color(0xFF06D6A0),
                ),
              ),

              // Bottom Right: 3D GATE Exam Calendar
              Positioned(
                bottom: stageH * 0.24 - float1 * 0.6,
                right: stageW * 0.07,
                child: _buildFloatingOrb(
                  asset: 'assets/images/3d/badge_calendar.png',
                  size: 56,
                  accentColor: const Color(0xFFFF5400),
                ),
              ),

              // Floating Bottom Status Pill
              Positioned(
                bottom: stageH * 0.04,
                child: _buildFrostedStatusPill(
                  icon: Icons.military_tech_rounded,
                  iconColor: const Color(0xFFFFD166),
                  primaryText: 'AIR 1 CONVERTED',
                  secondaryText: 'WEAK SPOTS MASTERED',
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Floating circular orb housing a 3D icon with subtle glow & glassmorphic base
  Widget _buildFloatingOrb({
    required String asset,
    required double size,
    required Color accentColor,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF141620).withValues(alpha: 0.75),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.16),
          width: 1.1,
        ),
        boxShadow: [
          BoxShadow(
            color: accentColor.withValues(alpha: 0.28),
            blurRadius: 16,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(size * 0.10),
      child: Image.asset(
        asset,
        fit: BoxFit.contain,
        filterQuality: FilterQuality.high,
      ),
    );
  }

  /// Reusable frosted glass status pill
  Widget _buildFrostedStatusPill({
    required IconData icon,
    required Color iconColor,
    required String primaryText,
    required String secondaryText,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.5),
      decoration: BoxDecoration(
        color: const Color(0xFF141620).withValues(alpha: 0.90),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.20),
          width: 1.1,
        ),
        boxShadow: [
          BoxShadow(
            color: iconColor.withValues(alpha: 0.30),
            blurRadius: 16,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: iconColor, size: 15),
          const SizedBox(width: 8),
          Text(
            primaryText,
            style: GoogleFonts.outfit(
              color: Colors.white,
              fontSize: 12.5,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text('•', style: TextStyle(color: Colors.white38, fontSize: 11)),
          ),
          Text(
            secondaryText,
            style: GoogleFonts.outfit(
              color: Colors.white70,
              fontSize: 11.5,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.4,
            ),
          ),
        ],
      ),
    );
  }
}

/// Bottom Sheet Container with Glowing Neon Rim (matches Onboarding screens)
class NeonGlowSheet extends StatelessWidget {
  final Widget child;
  final bool hasGlow;

  const NeonGlowSheet({
    super.key,
    required this.child,
    this.hasGlow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF0D0E12),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(38)),
        boxShadow: [
          if (hasGlow)
            BoxShadow(
              color: const Color(0xFFFF4081).withValues(alpha: 0.35),
              blurRadius: 28,
              spreadRadius: 0,
              offset: const Offset(0, -6),
            ),
        ],
      ),
      child: Stack(
        children: [
          // Neon top glowing curved border stroke
          if (hasGlow)
            Positioned(
              top: 0,
              left: 20,
              right: 20,
              child: Container(
                height: 2.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  gradient: const LinearGradient(
                    colors: [
                      Colors.transparent,
                      Color(0xFFFF4081),
                      Color(0xFFFF80AB),
                      Color(0xFFFF4081),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          child,
        ],
      ),
    );
  }
}

/// Solid Capsule Button (Black or White based on isWhite)
class SleekCapsuleButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isWhite;

  const SleekCapsuleButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isWhite = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        height: 56,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isWhite ? Colors.white : const Color(0xFF1E2028),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isWhite
                ? Colors.transparent
                : Colors.white.withValues(alpha: 0.12),
            width: 1,
          ),
          boxShadow: [
            if (isWhite)
              BoxShadow(
                color: Colors.white.withValues(alpha: 0.25),
                blurRadius: 18,
                offset: const Offset(0, 6),
              )
            else
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.4),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Text(
          label,
          style: GoogleFonts.outfit(
            color: isWhite ? const Color(0xFF0A0A0E) : Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.2,
          ),
        ),
      ),
    );
  }
}

/// Top Electric Purple / Violet Stage with Prestigious 3D IIT Asset
class AuthPurpleHeaderWithIIT extends StatelessWidget {
  final Widget? action;
  final String targetIIT;
  final String airRank;
  final String? imageAsset;
  final double assetHeight;

  const AuthPurpleHeaderWithIIT({
    super.key,
    this.action,
    this.targetIIT = 'IIT BOMBAY',
    this.airRank = 'AIR 1 TARGET',
    this.imageAsset,
    this.assetHeight = 150,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 225,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // Background ambient spotlight glow
          Positioned(
            top: 15,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Colors.white.withValues(alpha: 0.18),
                    const Color(0xFF8338EC).withValues(alpha: 0.26),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Central 3D IIT Monument / Asset
          Positioned(
            bottom: 4,
            child: IITMonument3DAsset(
              size: assetHeight,
              targetIIT: targetIIT,
              airRank: airRank,
              imageAsset: imageAsset ?? 'assets/images/3d/iit_bombay.png',
            ),
          ),

          // Optional Top Action (e.g. Back button)
          if (action != null)
            Positioned(
              left: 16,
              top: 42,
              child: action!,
            ),
        ],
      ),
    );
  }
}

/// Backward compatibility alias
typedef AuthPurpleHeader = AuthPurpleHeaderWithIIT;

/// Clean Minimalist Input Field
class CleanAuthInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const CleanAuthInputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E2028) : const Color(0xFFF3F3F6),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? Colors.white.withValues(alpha: 0.08) : Colors.transparent,
        ),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        style: GoogleFonts.outfit(
          fontSize: 15,
          color: context.textColor,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.outfit(
            color: isDark ? Colors.white38 : const Color(0xFF9E9EA8),
            fontSize: 14.5,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}

/// Google Pill Button
class GoogleAuthPillButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;

  const GoogleAuthPillButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;

    return InkWell(
      onTap: isLoading ? null : onPressed,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E2028) : const Color(0xFFF3F3F6),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isDark
                ? Colors.white.withValues(alpha: 0.1)
                : const Color(0xFFE4E4E8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  'G',
                  style: GoogleFonts.outfit(
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                    color: const Color(0xFFEA4335),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              'Google',
              style: GoogleFonts.outfit(
                color: isDark ? Colors.white : const Color(0xFF1D1D24),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Solid Black Capsule Button (Matches Screen 4)
class SolidBlackPillButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;

  const SolidBlackPillButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;

    return InkWell(
      onTap: isLoading ? null : onPressed,
      borderRadius: BorderRadius.circular(26),
      child: Container(
        height: 54,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isDark ? Colors.white : const Color(0xFF0F1015),
          borderRadius: BorderRadius.circular(26),
          boxShadow: [
            BoxShadow(
              color: (isDark ? Colors.white : Colors.black).withValues(alpha: 0.2),
              blurRadius: 14,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: isLoading
            ? SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2.2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    isDark ? Colors.black : Colors.white,
                  ),
                ),
              )
            : Text(
                label,
                style: GoogleFonts.outfit(
                  color: isDark ? const Color(0xFF0F1015) : Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.3,
                ),
              ),
      ),
    );
  }
}
