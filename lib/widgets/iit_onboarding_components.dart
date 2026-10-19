import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

/// Top Minimal Starburst Asterisk Logo (from Onboarding reference screens)
class TopBrandStar extends StatelessWidget {
  const TopBrandStar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 4 crossed pill bars forming an 8-point starburst
          for (int i = 0; i < 4; i++)
            Transform.rotate(
              angle: (i * math.pi / 4),
              child: Container(
                width: 5,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.95),
                  borderRadius: BorderRadius.circular(3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withValues(alpha: 0.4),
                      blurRadius: 8,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
            ),
          // Center micro dot
          Container(
            width: 7,
            height: 7,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

/// 3D Floating IIT Cards Stage (matches reference screens 1, 2, 3)
class FloatingIITCardsStage extends StatefulWidget {
  final int slideIndex;

  const FloatingIITCardsStage({
    super.key,
    required this.slideIndex,
  });

  @override
  State<FloatingIITCardsStage> createState() => _FloatingIITCardsStageState();
}

class _FloatingIITCardsStageState extends State<FloatingIITCardsStage>
    with SingleTickerProviderStateMixin {
  late AnimationController _floatController;
  late Animation<double> _floatAnimation;

  @override
  void initState() {
    super.initState();
    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    _floatAnimation = Tween<double>(begin: -6.0, end: 6.0).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _floatAnimation,
      builder: (context, child) {
        final float = _floatAnimation.value;

        if (widget.slideIndex == 2) {
          // Slide 3 Layout: Two rounded square profile cards with verification checks (like screen 3)
          return _buildSquareCardsLayout(float);
        } else {
          // Slide 1 & 2 Layout: 3 Staggered pill cards with IIT Bombay, IISc Bangalore, IIT Delhi
          return _buildPillCardsLayout(float, widget.slideIndex == 1);
        }
      },
    );
  }

  Widget _buildPillCardsLayout(double float, bool isTiltedMore) {
    return SizedBox(
      height: 310,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background ambient soft glow
          Container(
            width: 260,
            height: 260,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  const Color(0xFF6C38FF).withValues(alpha: 0.18),
                  const Color(0xFFFF4081).withValues(alpha: 0.10),
                  Colors.transparent,
                ],
                stops: const [0.2, 0.6, 1.0],
              ),
            ),
          ),

          // Card 1: IIT Bombay (Golden Amber Gradient)
          Positioned(
            top: 35 + float * 0.8,
            child: Transform.rotate(
              angle: isTiltedMore ? -0.06 : -0.03,
              child: _buildIITPillCard(
                title: 'IIT Bombay',
                subtitle: 'AIR < 100 • CSE & AI',
                actionLabel: 'Dream IIT',
                cardGradient: const [
                  Color(0xFFFFA726),
                  Color(0xFFFF7043),
                ],
                buttonGradient: const [
                  Color(0xFFFF4081),
                  Color(0xFFFF1744),
                ],
                avatarIcon: Icons.account_balance_rounded,
                avatarBgColor: const Color(0xFF5D4037),
              ),
            ),
          ),

          // Card 2: IISc Bangalore (Platinum Slate / Soft Rose Gradient)
          Positioned(
            top: 110 + float * -0.7,
            child: Transform.rotate(
              angle: isTiltedMore ? 0.05 : 0.02,
              child: _buildIITPillCard(
                title: 'IISc Bangalore',
                subtitle: 'AIR < 50 • M.Tech CSA',
                actionLabel: 'AIR 1 Target',
                cardGradient: const [
                  Color(0xFFECEFF1),
                  Color(0xFFCFD8DC),
                ],
                buttonGradient: const [
                  Color(0xFFE91E63),
                  Color(0xFFC2185B),
                ],
                avatarIcon: Icons.school_rounded,
                avatarBgColor: const Color(0xFF37474F),
                isDarkText: true,
              ),
            ),
          ),

          // Card 3: IIT Delhi / Madras (Ocean Cyan Gradient)
          Positioned(
            top: 185 + float * 0.9,
            child: Transform.rotate(
              angle: isTiltedMore ? -0.04 : -0.015,
              child: _buildIITPillCard(
                title: 'IIT Delhi',
                subtitle: 'AIR < 250 • Data & AI',
                actionLabel: 'Target IIT',
                cardGradient: const [
                  Color(0xFF29B6F6),
                  Color(0xFF0288D1),
                ],
                buttonGradient: const [
                  Color(0xFF8E24AA),
                  Color(0xFF5E35B1),
                ],
                avatarIcon: Icons.psychology_rounded,
                avatarBgColor: const Color(0xFF01579B),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIITPillCard({
    required String title,
    required String subtitle,
    required String actionLabel,
    required List<Color> cardGradient,
    required List<Color> buttonGradient,
    required IconData avatarIcon,
    required Color avatarBgColor,
    bool isDarkText = false,
  }) {
    return Container(
      width: 290,
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: cardGradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.55),
            blurRadius: 18,
            offset: const Offset(0, 9),
          ),
          BoxShadow(
            color: cardGradient.first.withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.35),
          width: 1.2,
        ),
      ),
      child: Row(
        children: [
          // 3D Avatar Badge
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: avatarBgColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              avatarIcon,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 10),

          // Name and Rank
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: GoogleFonts.outfit(
                    color: isDarkText ? const Color(0xFF1E2024) : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.5,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.outfit(
                    color: isDarkText
                        ? const Color(0xFF455A64)
                        : Colors.white.withValues(alpha: 0.85),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // Pill Action Button ("Purchase" in reference, "Target" for GATE)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: buttonGradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: buttonGradient.first.withValues(alpha: 0.4),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.stars_rounded,
                  size: 13,
                  color: Colors.white,
                ),
                const SizedBox(width: 4),
                Text(
                  actionLabel,
                  style: GoogleFonts.outfit(
                    color: Colors.white,
                    fontSize: 10.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSquareCardsLayout(double float) {
    return SizedBox(
      height: 310,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Spotlight / Glow behind
          Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  const Color(0xFF6C38FF).withValues(alpha: 0.25),
                  Colors.transparent,
                ],
              ),
            ),
          ),

          // Card 1: IIT Bombay (Top Left, tilted -6 deg)
          Positioned(
            left: 36,
            top: 25 + float * 0.7,
            child: Transform.rotate(
              angle: -0.1,
              child: _buildSquareProfileCard(
                name: 'IIT Bombay',
                role: 'AIR 1 Target',
                icon: Icons.account_balance_rounded,
                accentColor: const Color(0xFFFFA000),
                pillLabel: 'Dream IIT',
                pillColor: const Color(0xFF2979FF),
              ),
            ),
          ),

          // Card 2: IISc Bangalore (Bottom Right, tilted +6 deg)
          Positioned(
            right: 36,
            bottom: 25 + float * -0.7,
            child: Transform.rotate(
              angle: 0.08,
              child: _buildSquareProfileCard(
                name: 'IISc Bangalore',
                role: 'M.Tech AI & CSA',
                icon: Icons.school_rounded,
                accentColor: const Color(0xFFFF4081),
                pillLabel: 'Selected',
                pillColor: const Color(0xFF00E676),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSquareProfileCard({
    required String name,
    required String role,
    required IconData icon,
    required Color accentColor,
    required String pillLabel,
    required Color pillColor,
  }) {
    return Container(
      width: 165,
      height: 180,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1B1C23),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.16),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.6),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Name & Verified Check
          Row(
            children: [
              Expanded(
                child: Text(
                  name,
                  style: GoogleFonts.outfit(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Icon(
                Icons.check_circle_rounded,
                color: Color(0xFF2979FF),
                size: 16,
              ),
            ],
          ),
          const Spacer(),

          // Central 3D Icon Graphic
          Center(
            child: Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                gradient: LinearGradient(
                  colors: [
                    accentColor.withValues(alpha: 0.8),
                    accentColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: accentColor.withValues(alpha: 0.45),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
          const Spacer(),

          // Bottom Floating Pill Button
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: pillColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: pillColor.withValues(alpha: 0.4),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                pillLabel,
                style: GoogleFonts.outfit(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Bottom Sheet Container with Glowing Neon Rim (matches Onboarding screens 1, 2)
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

/// Top Electric Purple / Violet Stage (Matches Screen 4: Half Login Screen)
class AuthPurpleHeader extends StatelessWidget {
  final String? subtitle;

  const AuthPurpleHeader({
    super.key,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF6B38FF),
            Color(0xFF7B2CBF),
            Color(0xFF5A189A),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          // Translucent floating shapes / organic circles
          Positioned(
            left: 20,
            top: 40,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.1),
              ),
            ),
          ),
          Positioned(
            right: 30,
            top: 25,
            child: Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.white.withValues(alpha: 0.08),
              ),
            ),
          ),

          // Starburst in center top
          const Positioned(
            top: 36,
            left: 0,
            right: 0,
            child: Center(
              child: TopBrandStar(),
            ),
          ),

          // Floating 3D IIT/Gate emblem
          Positioned(
            bottom: 25,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.2),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.4),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.school_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Clean Minimalist Input Field (Matches Screen 4)
class CleanAuthInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const CleanAuthInputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
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
          contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}

/// Google Pill Button (Matches Screen 4: `[ G  Google ]`)
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

/// Solid Black Capsule Button (Matches Screen 4: `[ Get Started ]` / `[ Log In ]`)
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
