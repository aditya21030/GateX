import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

/// 100% Pure Flutter 3D Architectural IIT Monument & Campus Asset
/// Renders a grand neoclassical IIT facade (columns, pediment, dome, steps, and ambient lighting)
class IITMonument3DAsset extends StatefulWidget {
  final double size;
  final String targetIIT;
  final String airRank;

  const IITMonument3DAsset({
    super.key,
    this.size = 280,
    this.targetIIT = 'IIT BOMBAY',
    this.airRank = 'AIR 1 TARGET',
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
    return AnimatedBuilder(
      animation: _floatAnim,
      builder: (context, child) {
        final float = _floatAnim.value;

        return SizedBox(
          width: widget.size,
          height: widget.size * 1.05,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // 1. Top Down Spotlight Glow
              Positioned(
                top: 0,
                child: Container(
                  width: widget.size * 0.85,
                  height: widget.size * 0.85,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        const Color(0xFF8338EC).withValues(alpha: 0.35),
                        const Color(0xFF3A86FF).withValues(alpha: 0.15),
                        Colors.transparent,
                      ],
                      stops: const [0.15, 0.55, 1.0],
                    ),
                  ),
                ),
              ),

              // 2. Floating 3D IIT Building Structure
              Transform.translate(
                offset: Offset(0, float),
                child: SizedBox(
                  width: widget.size * 0.9,
                  height: widget.size * 0.9,
                  child: CustomPaint(
                    painter: _IITBuildingPainter(),
                  ),
                ),
              ),

              // 3. Floating 3D Graduation Cap above the dome
              Positioned(
                top: 8 + float * 1.3,
                child: Container(
                  padding: EdgeInsets.all((10 * (widget.size / 280.0)).clamp(6.0, 12.0)),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFF9100), Color(0xFFFF3D00)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFFF6D00).withValues(alpha: 0.5),
                        blurRadius: (18 * (widget.size / 280.0)).clamp(8.0, 18.0),
                        offset: Offset(0, (6 * (widget.size / 280.0)).clamp(2.0, 6.0)),
                      ),
                    ],
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.5),
                      width: 1.5,
                    ),
                  ),
                  child: Icon(
                    Icons.school_rounded,
                    color: Colors.white,
                    size: (26 * (widget.size / 280.0)).clamp(16.0, 28.0),
                  ),
                ),
              ),

              // 4. Floating Target IIT Badge (Bottom)
              Positioned(
                bottom: 8 + float * -0.5,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: (16 * (widget.size / 280.0)).clamp(10.0, 18.0),
                    vertical: (7 * (widget.size / 280.0)).clamp(4.0, 8.0),
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF14151D),
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: const Color(0xFF8338EC).withValues(alpha: 0.6),
                      width: 1.4,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF8338EC).withValues(alpha: 0.35),
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: (8 * (widget.size / 280.0)).clamp(5.0, 8.0),
                        height: (8 * (widget.size / 280.0)).clamp(5.0, 8.0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF00E676),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        widget.targetIIT,
                        style: GoogleFonts.outfit(
                          color: Colors.white,
                          fontSize: (12.5 * (widget.size / 280.0)).clamp(9.5, 13.0),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.8,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '• ${widget.airRank}',
                        style: GoogleFonts.outfit(
                          color: const Color(0xFFFFB300),
                          fontSize: (11.5 * (widget.size / 280.0)).clamp(8.5, 12.0),
                          fontWeight: FontWeight.w600,
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

/// Custom Painter that renders neoclassical 3D IIT Building with columns, pediment and dome
class _IITBuildingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final centerX = w / 2;
    final baseY = h * 0.82;

    // 1. Shadow beneath building
    final shadowPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.6)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 16);
    canvas.drawOval(
      Rect.fromCenter(center: Offset(centerX, baseY + 10), width: w * 0.85, height: 26),
      shadowPaint,
    );

    // 2. Base Steps (3-tiered marble stylobate)
    final stepColors = [
      const Color(0xFF333544),
      const Color(0xFF282A36),
      const Color(0xFF1E202B),
    ];
    for (int i = 0; i < 3; i++) {
      final stepW = w * (0.84 - i * 0.04);
      final stepH = 8.0;
      final stepY = baseY - (3 - i) * stepH;
      final stepRect = RRect.fromRectAndRadius(
        Rect.fromCenter(center: Offset(centerX, stepY + stepH / 2), width: stepW, height: stepH),
        const Radius.circular(3),
      );
      final paint = Paint()
        ..shader = LinearGradient(
          colors: [stepColors[i].withValues(alpha: 0.9), stepColors[i]],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ).createShader(stepRect.outerRect);
      canvas.drawRRect(stepRect, paint);
    }

    final columnBaseY = baseY - 24;
    final columnTopY = columnBaseY - (h * 0.32);

    // 3. Central Doorway & Back Wall
    final wallRect = Rect.fromCenter(
      center: Offset(centerX, (columnBaseY + columnTopY) / 2),
      width: w * 0.66,
      height: columnBaseY - columnTopY,
    );
    final wallPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF20222D), Color(0xFF14151F)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(wallRect);
    canvas.drawRect(wallRect, wallPaint);

    // Arch Entrance
    final doorW = w * 0.18;
    final doorH = (columnBaseY - columnTopY) * 0.72;
    final doorRect = Rect.fromLTWH(centerX - doorW / 2, columnBaseY - doorH, doorW, doorH);
    final doorPath = Path()
      ..moveTo(doorRect.left, doorRect.bottom)
      ..lineTo(doorRect.left, doorRect.top + doorW / 2)
      ..arcToPoint(
        Offset(doorRect.right, doorRect.top + doorW / 2),
        radius: Radius.circular(doorW / 2),
      )
      ..lineTo(doorRect.right, doorRect.bottom)
      ..close();
    final doorPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0xFFFFB300).withValues(alpha: 0.5),
          const Color(0xFF0F1018),
        ],
        center: Alignment.bottomCenter,
        radius: 0.8,
      ).createShader(doorRect);
    canvas.drawPath(doorPath, doorPaint);

    // 4. Neoclassical Fluted Columns (6 columns with 3D cylindrical lighting)
    const numColumns = 6;
    final columnWidth = w * 0.052;
    final columnSpacing = (w * 0.68 - columnWidth * numColumns) / (numColumns - 1);
    final startX = centerX - (w * 0.68) / 2 + columnWidth / 2;

    for (int i = 0; i < numColumns; i++) {
      final colX = startX + i * (columnWidth + columnSpacing);
      final colRect = Rect.fromCenter(
        center: Offset(colX, (columnBaseY + columnTopY) / 2),
        width: columnWidth,
        height: columnBaseY - columnTopY,
      );

      // 3D cylindrical gradient highlight
      final colPaint = Paint()
        ..shader = const LinearGradient(
          colors: [
            Color(0xFF888B9E),
            Color(0xFFE4E7F2),
            Color(0xFFC0C4D6),
            Color(0xFF5A5D6E),
          ],
          stops: [0.0, 0.35, 0.7, 1.0],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ).createShader(colRect);
      canvas.drawRRect(RRect.fromRectAndRadius(colRect, const Radius.circular(2)), colPaint);

      // Capital & Base capitals
      final capPaint = Paint()..color = const Color(0xFFF0F2FA);
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(center: Offset(colX, columnTopY + 2), width: columnWidth * 1.35, height: 4),
          const Radius.circular(1),
        ),
        capPaint,
      );
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(center: Offset(colX, columnBaseY - 2), width: columnWidth * 1.35, height: 4),
          const Radius.circular(1),
        ),
        capPaint,
      );
    }

    // 5. Entablature (Horizontal Beam above columns)
    final entRect = Rect.fromCenter(
      center: Offset(centerX, columnTopY - 6),
      width: w * 0.76,
      height: 12,
    );
    final entPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFFD6DAE8), Color(0xFF8C90A2)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(entRect);
    canvas.drawRRect(RRect.fromRectAndRadius(entRect, const Radius.circular(2)), entPaint);

    // 6. Triangular Pediment (with golden "IIT" engraved)
    final pedimentHeight = h * 0.14;
    final pedimentBottom = columnTopY - 12;
    final pedimentTop = pedimentBottom - pedimentHeight;

    final pedimentPath = Path()
      ..moveTo(centerX - (w * 0.76) / 2, pedimentBottom)
      ..lineTo(centerX, pedimentTop)
      ..lineTo(centerX + (w * 0.76) / 2, pedimentBottom)
      ..close();

    final pedimentPaint = Paint()
      ..shader = LinearGradient(
        colors: const [Color(0xFFF0F3FA), Color(0xFF9EA3B8)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(centerX - w / 2, pedimentTop, w, pedimentHeight));
    canvas.drawPath(pedimentPath, pedimentPaint);

    // Pediment Border
    final borderPaint = Paint()
      ..color = const Color(0xFFFFFFFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;
    canvas.drawPath(pedimentPath, borderPaint);

    // 7. Central Dome behind Pediment
    final domeRadius = w * 0.17;
    final domeCenter = Offset(centerX, pedimentTop + 8);
    final domeRect = Rect.fromCircle(center: domeCenter, radius: domeRadius);

    final domePath = Path()
      ..addArc(domeRect, math.pi, math.pi);
    final domePaint = Paint()
      ..shader = RadialGradient(
        colors: const [
          Color(0xFFFFB300),
          Color(0xFFFF8F00),
          Color(0xFF4527A0),
          Color(0xFF1E1438),
        ],
        stops: const [0.1, 0.35, 0.75, 1.0],
        center: const Alignment(-0.2, -0.4),
      ).createShader(domeRect);
    canvas.drawPath(domePath, domePaint);

    // Dome Spire
    final spireLength = (w * 0.06).clamp(8.0, 18.0);
    final spirePaint = Paint()
      ..color = const Color(0xFFFFD54F)
      ..strokeWidth = (w * 0.012).clamp(1.5, 3.0);
    canvas.drawLine(
      Offset(centerX, domeCenter.dy - domeRadius),
      Offset(centerX, domeCenter.dy - domeRadius - spireLength),
      spirePaint,
    );

    // Golden "IIT" Letters inside Pediment
    final textPainter = TextPainter(
      text: TextSpan(
        text: 'IIT',
        style: TextStyle(
          color: const Color(0xFF263238),
          fontSize: (w * 0.065).clamp(8.0, 16.0),
          fontWeight: FontWeight.w900,
          letterSpacing: (w * 0.012).clamp(1.0, 3.0),
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    textPainter.paint(
      canvas,
      Offset(centerX - textPainter.width / 2, pedimentBottom - textPainter.height - 4),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Curved, Minimal Floating IIT Cards (Matches User's Request: Heavily Curved & Clean)
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
  late AnimationController _controller;
  late Animation<double> _floatAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    _floatAnim = Tween<double>(begin: -5.0, end: 5.0).animate(
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
    if (widget.slideIndex >= 1) {
      // Slides 2 & 3: Render the majestic 3D IIT Monument Asset as requested!
      return Center(
        child: IITMonument3DAsset(
          targetIIT: widget.slideIndex == 1 ? 'IISC BANGALORE' : 'IIT BOMBAY',
          airRank: widget.slideIndex == 1 ? 'AIR < 50' : 'AIR 1 TARGET',
        ),
      );
    }

    // Slide 1: Heavily curved, minimal floating cards with LESS components
    return AnimatedBuilder(
      animation: _floatAnim,
      builder: (context, child) {
        final float = _floatAnim.value;

        return SizedBox(
          height: 300,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Ambient soft glow
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFFFF5722).withValues(alpha: 0.22),
                      const Color(0xFF673AB7).withValues(alpha: 0.12),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),

              // Card 1: IIT Bombay (Golden Coral Stadium Pill)
              Positioned(
                top: 36 + float * 0.8,
                child: Transform.rotate(
                  angle: -0.04,
                  child: _buildCurvedPill(
                    title: 'IIT Bombay',
                    subtitle: 'AIR < 100 • CSE & AI',
                    tag: 'Dream IIT',
                    gradient: const [Color(0xFFFF9800), Color(0xFFFF5722)],
                    tagColor: const Color(0xFFFF1744),
                    icon: Icons.account_balance_rounded,
                  ),
                ),
              ),

              // Card 2: IISc Bangalore (Platinum Pearl Stadium Pill)
              Positioned(
                top: 115 + float * -0.7,
                child: Transform.rotate(
                  angle: 0.035,
                  child: _buildCurvedPill(
                    title: 'IISc Bangalore',
                    subtitle: 'AIR < 50 • M.Tech CSA',
                    tag: 'AIR 1',
                    gradient: const [Color(0xFFECEFF1), Color(0xFFCFD8DC)],
                    tagColor: const Color(0xFFD81B60),
                    icon: Icons.school_rounded,
                    isDarkText: true,
                  ),
                ),
              ),

              // Card 3: IIT Delhi (Azure Cyan Stadium Pill)
              Positioned(
                top: 195 + float * 0.9,
                child: Transform.rotate(
                  angle: -0.02,
                  child: _buildCurvedPill(
                    title: 'IIT Delhi',
                    subtitle: 'AIR < 250 • Data Science',
                    tag: 'Target IIT',
                    gradient: const [Color(0xFF29B6F6), Color(0xFF0288D1)],
                    tagColor: const Color(0xFF7B1FA2),
                    icon: Icons.psychology_rounded,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCurvedPill({
    required String title,
    required String subtitle,
    required String tag,
    required List<Color> gradient,
    required Color tagColor,
    required IconData icon,
    bool isDarkText = false,
  }) {
    return Container(
      width: 275,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32), // Heavily curved stadium pill
        gradient: LinearGradient(
          colors: gradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.55),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: gradient.first.withValues(alpha: 0.28),
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
          // Icon emblem in circle
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isDarkText ? const Color(0xFF37474F) : Colors.black.withValues(alpha: 0.25),
            ),
            child: Icon(icon, color: Colors.white, size: 22),
          ),
          const SizedBox(width: 12),

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
                    fontSize: 14,
                  ),
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
                ),
              ],
            ),
          ),

          // Minimal Pill Tag
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: tagColor,
              boxShadow: [
                BoxShadow(
                  color: tagColor.withValues(alpha: 0.4),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              tag,
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontSize: 10.5,
                fontWeight: FontWeight.bold,
              ),
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

/// Top Electric Purple / Violet Stage with Prestigious 3D IIT Building Asset (No starburst)
class AuthPurpleHeaderWithIIT extends StatelessWidget {
  final Widget? action;
  final String targetIIT;
  final String airRank;

  const AuthPurpleHeaderWithIIT({
    super.key,
    this.action,
    this.targetIIT = 'IIT BOMBAY',
    this.airRank = 'AIR 1 TARGET',
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
        alignment: Alignment.center,
        children: [
          // Background ambient spotlight glow
          Positioned(
            top: 15,
            child: Container(
              width: 170,
              height: 170,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Colors.white.withValues(alpha: 0.16),
                    const Color(0xFF8338EC).withValues(alpha: 0.22),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Central 3D IIT Monument Asset
          Positioned(
            bottom: 8,
            child: IITMonument3DAsset(
              size: 140,
              targetIIT: targetIIT,
              airRank: airRank,
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
