import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

/// Signature Chegg/GateX styled Capsule Button
/// Features a vibrant orange gradient, left circular icon badge, bold label, and right chevron trail.
class GateHeroCapsuleButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final IconData leadingIcon;
  final bool showChevrons;

  const GateHeroCapsuleButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.leadingIcon = Icons.arrow_forward_ios_rounded,
    this.showChevrons = true,
  });

  @override
  State<GateHeroCapsuleButton> createState() => _GateHeroCapsuleButtonState();
}

class _GateHeroCapsuleButtonState extends State<GateHeroCapsuleButton> with SingleTickerProviderStateMixin {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: widget.onPressed != null && !widget.isLoading ? (_) => setState(() => _isPressed = true) : null,
      onTapUp: widget.onPressed != null && !widget.isLoading ? (_) => setState(() => _isPressed = false) : null,
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.isLoading ? null : widget.onPressed,
      child: AnimatedScale(
        scale: _isPressed ? 0.97 : 1.0,
        duration: const Duration(milliseconds: 120),
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(34),
            gradient: const LinearGradient(
              colors: [
                Color(0xFFFF5216),
                Color(0xFFFF7A00),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFF5E14).withValues(alpha: 0.38),
                blurRadius: 18,
                spreadRadius: 1,
                offset: const Offset(0, 7),
              ),
            ],
          ),
          child: Row(
            children: [
              // Left circular badge
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: widget.isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : Icon(
                          widget.leadingIcon,
                          color: Colors.white,
                          size: 16,
                        ),
                ),
              ),

              // Center text
              Expanded(
                child: Center(
                  child: Text(
                    widget.label,
                    style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
              ),

              // Right chevron trail
              if (widget.showChevrons)
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.chevron_right_rounded, color: Colors.white.withValues(alpha: 0.45), size: 18),
                      Transform.translate(
                        offset: const Offset(-8, 0),
                        child: Icon(Icons.chevron_right_rounded, color: Colors.white.withValues(alpha: 0.7), size: 18),
                      ),
                      Transform.translate(
                        offset: const Offset(-16, 0),
                        child: const Icon(Icons.chevron_right_rounded, color: Colors.white, size: 18),
                      ),
                    ],
                  ),
                )
              else
                const SizedBox(width: 44),
            ],
          ),
        ),
      ),
    );
  }
}

/// Secondary Capsule Button ("Skip", "Back", etc.)
class GateSecondaryCapsuleButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const GateSecondaryCapsuleButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        height: 52,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF23252E) : const Color(0xFFF3EEE6),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isDark ? Colors.white.withValues(alpha: 0.08) : const Color(0xFFE5DDD1),
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.outfit(
            color: isDark ? Colors.white70 : const Color(0xFF2D2C34),
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

/// Pill shaped text input field with leading circular icon badge
class GatePillTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final IconData prefixIcon;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const GatePillTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.prefixIcon,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14.0, bottom: 6.0),
          child: Text(
            labelText,
            style: GoogleFonts.outfit(
              fontSize: 12.5,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white70 : const Color(0xFF5A5B66),
              letterSpacing: 0.2,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1F2129) : const Color(0xFFF8F5EE),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: isDark ? Colors.white.withValues(alpha: 0.1) : const Color(0xFFE6DFD4),
              width: 1.2,
            ),
          ),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            validator: validator,
            style: GoogleFonts.outfit(
              fontSize: 14.5,
              color: context.textColor,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              isDense: true,
              hintText: hintText,
              hintStyle: GoogleFonts.outfit(
                color: isDark ? Colors.white30 : const Color(0xFFA09FA8),
                fontSize: 13.5,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: isDark
                        ? const Color(0xFFFF5E14).withValues(alpha: 0.15)
                        : const Color(0xFFFFECE0),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    prefixIcon,
                    size: 18,
                    color: const Color(0xFFFF5E14),
                  ),
                ),
              ),
              suffixIcon: suffixIcon,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
          ),
        ),
      ],
    );
  }
}

/// 100% Pure Flutter Procedural 3D-Feel Educational Vector Stage
/// (No external image assets used)
class GateHeroIllustrationStage extends StatefulWidget {
  final int slideIndex;

  const GateHeroIllustrationStage({
    super.key,
    this.slideIndex = 0,
  });

  @override
  State<GateHeroIllustrationStage> createState() => _GateHeroIllustrationStageState();
}

class _GateHeroIllustrationStageState extends State<GateHeroIllustrationStage> with SingleTickerProviderStateMixin {
  late AnimationController _floatController;
  late Animation<double> _floatAnimation;

  @override
  void initState() {
    super.initState();
    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    _floatAnimation = Tween<double>(begin: -8.0, end: 8.0).animate(
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
    final isDark = context.isDarkMode;

    return AnimatedBuilder(
      animation: _floatAnimation,
      builder: (context, child) {
        final floatOffset = _floatAnimation.value;

        return SizedBox(
          height: 290,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // 1. Soft Ambient Glowing Rings
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFFFF7A00).withValues(alpha: isDark ? 0.22 : 0.15),
                      const Color(0xFFFF5216).withValues(alpha: isDark ? 0.10 : 0.06),
                      Colors.transparent,
                    ],
                    stops: const [0.2, 0.6, 1.0],
                  ),
                ),
              ),

              // 2. Giant Warm Open Book / Podium Foundation
              Positioned(
                bottom: 30,
                child: Container(
                  width: 210,
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    gradient: LinearGradient(
                      colors: isDark
                          ? [const Color(0xFF2B2D3A), const Color(0xFF1E2028)]
                          : [const Color(0xFFFFE8D6), const Color(0xFFFDE1C7)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFFF5E14).withValues(alpha: isDark ? 0.2 : 0.18),
                        blurRadius: 26,
                        spreadRadius: 2,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Container(
                      width: 170,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        color: isDark ? const Color(0xFF1B1C23) : Colors.white,
                        border: Border.all(
                          color: const Color(0xFFFF8A00).withValues(alpha: 0.25),
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.auto_stories_rounded,
                            color: const Color(0xFFFF6500),
                            size: 26,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'GATE 2026/27',
                            style: GoogleFonts.outfit(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: isDark ? Colors.white : const Color(0xFF26252C),
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // 3. Central Floating Graduation Mortarboard Emblem
              Transform.translate(
                offset: Offset(0, floatOffset),
                child: Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFFF5E14),
                        Color(0xFFFF8E14),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFFF5E14).withValues(alpha: 0.45),
                        blurRadius: 24,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Inner ambient ring
                      Container(
                        width: 112,
                        height: 112,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.35),
                            width: 2,
                          ),
                        ),
                      ),
                      // Core Icon: Graduation Cap
                      const Icon(
                        Icons.school_rounded,
                        size: 64,
                        color: Colors.white,
                      ),
                      // Golden Star Badge
                      Positioned(
                        top: 14,
                        right: 18,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFFFD54F),
                          ),
                          child: const Icon(
                            Icons.star_rounded,
                            size: 14,
                            color: Color(0xFF5D4037),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 4. Floating Badge 1 (Top Left): Math Symbol (\pi^2)
              Positioned(
                top: 24 + (floatOffset * -0.7),
                left: 36,
                child: _buildFloatingBadge(
                  iconText: 'π²',
                  gradientColors: const [Color(0xFFFFB300), Color(0xFFFF8F00)],
                  shadowColor: const Color(0xFFFFB300),
                  isText: true,
                ),
              ),

              // 5. Floating Badge 2 (Top Right): Division / Multiply (÷ ×)
              Positioned(
                top: 36 + (floatOffset * 0.9),
                right: 36,
                child: _buildFloatingBadge(
                  iconText: '÷ ×',
                  gradientColors: const [Color(0xFF00B0FF), Color(0xFF0081CB)],
                  shadowColor: const Color(0xFF00B0FF),
                  isText: true,
                ),
              ),

              // 6. Floating Badge 3 (Middle Right): AI / ML Code Tag
              Positioned(
                bottom: 80 + (floatOffset * -0.5),
                right: 28,
                child: _buildFloatingBadge(
                  iconData: Icons.psychology_rounded,
                  gradientColors: const [Color(0xFF00E676), Color(0xFF00A152)],
                  shadowColor: const Color(0xFF00E676),
                  isText: false,
                ),
              ),

              // 7. Floating Badge 4 (Middle Left): TCS Calculator / CBT
              Positioned(
                bottom: 85 + (floatOffset * 0.6),
                left: 28,
                child: _buildFloatingBadge(
                  iconData: Icons.calculate_rounded,
                  gradientColors: const [Color(0xFFAB47BC), Color(0xFF7B1FA2)],
                  shadowColor: const Color(0xFFAB47BC),
                  isText: false,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFloatingBadge({
    String? iconText,
    IconData? iconData,
    required List<Color> gradientColors,
    required Color shadowColor,
    required bool isText,
  }) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withValues(alpha: 0.35),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.45),
          width: 1.5,
        ),
      ),
      child: Center(
        child: isText
            ? Text(
                iconText ?? '',
                style: GoogleFonts.outfit(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              )
            : Icon(
                iconData,
                color: Colors.white,
                size: 24,
              ),
      ),
    );
  }
}
