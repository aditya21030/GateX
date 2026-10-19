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

/// Tactile Soft Button with press animation & haptic feedback
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
  });

  @override
  State<NeuButton> createState() => _NeuButtonState();
}

class _NeuButtonState extends State<NeuButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    Widget content = AnimatedScale(
      scale: _isPressed ? 0.97 : 1.0,
      duration: const Duration(milliseconds: 100),
      child: widget.isPrimary
          ? Container(
              width: widget.width,
              height: widget.height,
              padding: widget.padding,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: widget.gradient ??
                    const LinearGradient(
                      colors: [Color(0xFF7C3AED), Color(0xFF6D28D9)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.accentPurple.withValues(alpha: _isPressed ? 0.2 : 0.4),
                    offset: _isPressed ? const Offset(0, 2) : const Offset(0, 6),
                    blurRadius: _isPressed ? 6 : 14,
                  ),
                ],
              ),
              child: widget.child,
            )
          : NeuContainer(
              width: widget.width,
              height: widget.height,
              isRecessed: _isPressed,
              borderRadius: widget.borderRadius,
              padding: widget.padding,
              color: widget.color,
              child: Center(child: widget.child),
            ),
    );

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
      child: content,
    );
  }
}

/// Embossed Icon Tile (Soft squircle molded into the surface)
class NeuIconTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final double size;
  final double iconSize;

  const NeuIconTile({
    super.key,
    required this.icon,
    required this.iconColor,
    this.size = 46,
    this.iconSize = 22,
  });

  @override
  Widget build(BuildContext context) {
    return NeuContainer(
      width: size,
      height: size,
      borderRadius: size * 0.35,
      padding: EdgeInsets.zero,
      alignment: Alignment.center,
      child: Icon(icon, color: iconColor, size: iconSize),
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
