import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_theme.dart';

/// Reusable Neumorphic (Soft UI) Components for GateX
/// Provides dual-shadow extrusion, recessed wells, tactile buttons, and minimalist cards.

class NeuContainer extends StatelessWidget {
  final Widget? child;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final bool isRecessed;
  final Color? color;
  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;
  final Border? border;
  final Gradient? gradient;

  const NeuContainer({
    super.key,
    this.child,
    this.borderRadius = 22,
    this.padding = const EdgeInsets.all(16),
    this.margin,
    this.isRecessed = false,
    this.color,
    this.width,
    this.height,
    this.alignment,
    this.border,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final baseColor = color ?? (isDark ? const Color(0xFF1A1828) : const Color(0xFFEFF3F8));

    // Dual-shadow configuration for authentic Neumorphism
    final shadowLight = isDark
        ? const Color(0xFF26233B) // soft highlight on top-left
        : Colors.white;
    final shadowDark = isDark
        ? const Color(0xFF0C0B14) // deep shadow on bottom-right
        : const Color(0xFFCFD8E3);

    return Container(
      width: width,
      height: height,
      margin: margin,
      alignment: alignment,
      padding: padding,
      decoration: BoxDecoration(
        color: gradient == null ? baseColor : null,
        gradient: gradient,
        borderRadius: BorderRadius.circular(borderRadius),
        border: border ??
            Border.all(
              color: isDark
                  ? Colors.white.withValues(alpha: 0.05)
                  : Colors.white.withValues(alpha: 0.6),
              width: 1.0,
            ),
        boxShadow: isRecessed
            ? [
                // Inset / Recessed depth effect
                BoxShadow(
                  color: shadowDark.withValues(alpha: isDark ? 0.7 : 0.4),
                  offset: const Offset(3, 3),
                  blurRadius: 6,
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: shadowLight.withValues(alpha: isDark ? 0.08 : 0.7),
                  offset: const Offset(-3, -3),
                  blurRadius: 6,
                  spreadRadius: 0,
                ),
              ]
            : [
                // Extruded 3D soft lift effect
                BoxShadow(
                  color: shadowDark.withValues(alpha: isDark ? 0.8 : 0.6),
                  offset: const Offset(4, 5),
                  blurRadius: 10,
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: shadowLight.withValues(alpha: isDark ? 0.08 : 0.9),
                  offset: const Offset(-4, -4),
                  blurRadius: 10,
                  spreadRadius: 0,
                ),
              ],
      ),
      child: child,
    );
  }
}

/// Universal 3D Dimensional Icon
/// Renders an icon with volumetric depth, directional shadows, chromatic glow,
/// and rich multi-colored 3D gradient shading.
class Icon3D extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;
  final bool hasGlow;
  final Gradient? gradient;

  const Icon3D(
    this.icon, {
    super.key,
    required this.color,
    this.size = 22,
    this.hasGlow = true,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    final HSLColor hsl = HSLColor.fromColor(color);
    final Color topHighlight = hsl.withLightness((hsl.lightness + 0.18).clamp(0.0, 0.98)).toColor();
    final Color bottomShadow = hsl.withLightness((hsl.lightness - 0.15).clamp(0.0, 1.0)).toColor();

    final effectiveGradient = gradient ??
        LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            topHighlight,
            color,
            bottomShadow,
          ],
          stops: const [0.0, 0.5, 1.0],
        );

    return ShaderMask(
      shaderCallback: (bounds) => effectiveGradient.createShader(bounds),
      child: Icon(
        icon,
        size: size,
        color: Colors.white,
        shadows: [
          Shadow(
            color: Colors.black.withValues(alpha: 0.55),
            offset: Offset(0, (size * 0.08).clamp(1.0, 3.0)),
            blurRadius: (size * 0.12).clamp(1.5, 4.0),
          ),
          if (hasGlow)
            Shadow(
              color: color.withValues(alpha: 0.70),
              offset: Offset(0, (size * 0.10).clamp(1.5, 5.0)),
              blurRadius: (size * 0.28).clamp(3.0, 8.0),
            ),
        ],
      ),
    );
  }
}

/// Tactile 3D Soft Button with physical extrusion, press depression & haptic feedback
class NeuButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final Color? color;
  final Gradient? gradient;
  final bool isPrimary;
  final double? width;
  final double? height;
  final bool is3D;

  const NeuButton({
    super.key,
    required this.child,
    this.onPressed,
    this.borderRadius = 22,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
    this.color,
    this.gradient,
    this.isPrimary = false,
    this.width,
    this.height,
    this.is3D = true,
  });

  @override
  State<NeuButton> createState() => _NeuButtonState();
}

class _NeuButtonState extends State<NeuButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;

    // 3D physical extrusion height
    final double ledgeHeight = widget.is3D ? (_isPressed ? 1.0 : 4.0) : 0.0;
    final double pressOffset = widget.is3D ? (_isPressed ? 3.0 : 0.0) : 0.0;

    final primaryGradient = widget.gradient ??
        const LinearGradient(
          colors: [Color(0xFF8B5CF6), Color(0xFF6D28D9), Color(0xFF5B21B6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );

    final nonPrimaryColor = widget.color ??
        (isDark ? const Color(0xFF1E1C2E) : const Color(0xFFF1F5F9));

    return GestureDetector(
      onTapDown: (_) {
        if (widget.onPressed != null) {
          HapticFeedback.lightImpact();
          setState(() => _isPressed = true);
        }
      },
      onTapUp: (_) {
        if (widget.onPressed != null) {
          setState(() => _isPressed = false);
          widget.onPressed!();
        }
      },
      onTapCancel: () {
        if (_isPressed) setState(() => _isPressed = false);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 70),
        curve: Curves.easeOut,
        margin: EdgeInsets.only(top: pressOffset, bottom: 4.0 - pressOffset),
        width: widget.width,
        height: widget.height,
        padding: widget.padding,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: widget.isPrimary ? null : nonPrimaryColor,
          gradient: widget.isPrimary ? primaryGradient : null,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: Border.all(
            color: widget.isPrimary
                ? Colors.white.withValues(alpha: 0.25)
                : (isDark ? Colors.white.withValues(alpha: 0.12) : Colors.white.withValues(alpha: 0.8)),
            width: 1.2,
          ),
          boxShadow: [
            // 3D extruded ledge shadow
            if (widget.is3D && ledgeHeight > 0)
              BoxShadow(
                color: widget.isPrimary
                    ? const Color(0xFF4C1D95)
                    : (isDark ? const Color(0xFF0D0C15) : const Color(0xFFCBD5E1)),
                offset: Offset(0, ledgeHeight),
                blurRadius: 0,
              ),
            // Ambient soft colored glow
            if (widget.isPrimary)
              BoxShadow(
                color: AppTheme.accentPurple.withValues(alpha: _isPressed ? 0.20 : 0.38),
                offset: Offset(0, _isPressed ? 2 : 6),
                blurRadius: _isPressed ? 6 : 14,
              )
            else
              BoxShadow(
                color: Colors.black.withValues(alpha: isDark ? 0.35 : 0.08),
                offset: Offset(0, _isPressed ? 1 : 4),
                blurRadius: _isPressed ? 4 : 8,
              ),
            // Top specular glint highlight
            BoxShadow(
              color: Colors.white.withValues(alpha: isDark ? 0.10 : 0.5),
              offset: const Offset(-1, -1),
              blurRadius: 2,
            ),
          ],
        ),
        child: widget.child,
      ),
    );
  }
}

/// 3D Colorful Claymorphic Dimensional Icon Tile
/// Renders an extruded 3D squircle with rich saturated gradients, directional lighting,
/// glossy top specular sheen, solid physical 3D ledge, and chromatic ambient glow.
class NeuIconTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final double size;
  final double iconSize;
  final bool is3D;
  final Gradient? gradient;

  const NeuIconTile({
    super.key,
    required this.icon,
    required this.iconColor,
    this.size = 46,
    this.iconSize = 22,
    this.is3D = true,
    this.gradient,
  });

  Gradient _resolve3DGradient(Color baseColor, bool isDark) {
    if (gradient != null) return gradient!;

    final HSLColor hsl = HSLColor.fromColor(baseColor);
    final Color topHighlight = hsl.withLightness((hsl.lightness + 0.16).clamp(0.0, 0.95)).toColor();
    final Color middleColor = baseColor;
    final Color bottomShadow = hsl.withLightness((hsl.lightness - 0.18).clamp(0.0, 1.0)).toColor();

    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        topHighlight,
        middleColor,
        bottomShadow,
      ],
      stops: const [0.0, 0.45, 1.0],
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final radius = size * 0.32;

    if (!is3D) {
      return NeuContainer(
        width: size,
        height: size,
        borderRadius: radius,
        padding: EdgeInsets.zero,
        alignment: Alignment.center,
        child: Icon(icon, color: iconColor, size: iconSize),
      );
    }

    final HSLColor hsl = HSLColor.fromColor(iconColor);
    final Color ledgeColor = hsl.withLightness((hsl.lightness - 0.28).clamp(0.0, 1.0)).toColor();
    final double ledgeHeight = (size * 0.08).clamp(2.0, 3.5);

    // 3D Colorful Volumetric Claymorphic Tile
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        gradient: _resolve3DGradient(iconColor, isDark),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.40),
          width: 1.2,
        ),
        boxShadow: [
          // 1. Solid physical 3D extrusion ledge
          BoxShadow(
            color: ledgeColor,
            offset: Offset(0, ledgeHeight),
            blurRadius: 0,
          ),
          // 2. High-energy colorful ambient glow radiating outwards
          BoxShadow(
            color: iconColor.withValues(alpha: isDark ? 0.45 : 0.36),
            offset: Offset(0, size * 0.14),
            blurRadius: size * 0.28,
            spreadRadius: -1,
          ),
          // 3. Contact shadow on surface
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.45 : 0.16),
            offset: Offset(0, size * 0.12),
            blurRadius: size * 0.18,
          ),
          // 4. Specular top rim reflection
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.65),
            offset: const Offset(-1.5, -1.5),
            blurRadius: 2.5,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Top curved glossy glass sheen (ultra-slick 3D reflection)
          Positioned(
            top: 1.5,
            left: 2.5,
            right: 2.5,
            height: size * 0.42,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(radius - 2)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withValues(alpha: 0.55),
                    Colors.white.withValues(alpha: 0.0),
                  ],
                ),
              ),
            ),
          ),
          // Crisp 3D Illuminated Icon Glyph
          Icon(
            icon,
            size: iconSize,
            color: Colors.white,
            shadows: [
              // Sharp bottom contact shadow
              Shadow(
                color: Colors.black.withValues(alpha: 0.55),
                offset: const Offset(0, 2.0),
                blurRadius: 2.5,
              ),
              // Soft ambient internal glow
              Shadow(
                color: Colors.white.withValues(alpha: 0.70),
                offset: const Offset(0, 0),
                blurRadius: 5.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Neumorphic recessed progress bar
class NeuProgressBar extends StatelessWidget {
  final double progress; // 0.0 to 1.0
  final Color progressColor;
  final double height;

  const NeuProgressBar({
    super.key,
    required this.progress,
    this.progressColor = AppTheme.accentPurple,
    this.height = 10,
  });

  @override
  Widget build(BuildContext context) {
    final clamped = progress.clamp(0.0, 1.0);
    final isDark = context.isDarkMode;

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF111019) : const Color(0xFFE2E8F0),
        borderRadius: BorderRadius.circular(height),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.5 : 0.15),
            offset: const Offset(1, 1),
            blurRadius: 2,
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 350),
                width: constraints.maxWidth * clamped,
                height: height,
                decoration: BoxDecoration(
                  color: progressColor,
                  borderRadius: BorderRadius.circular(height),
                  boxShadow: [
                    BoxShadow(
                      color: progressColor.withValues(alpha: 0.45),
                      blurRadius: 4,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
