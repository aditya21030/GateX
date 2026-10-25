import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

/// 100% Pure Flutter 3D Architectural IIT Monument & Campus Asset
/// Renders an authentic, grand neoclassical IIT facade (columns, pediment, dome, steps, and ambient lighting)
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
    return AnimatedBuilder(
      animation: _floatAnim,
      builder: (context, child) {
        final float = _floatAnim.value;
        final scale = widget.size / 280.0;

        return SizedBox(
          width: widget.size,
          height: widget.size * 1.05,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              // 1. Top Down Spotlight Glow
              Positioned(
                top: 0,
                child: Container(
                  width: widget.size * 0.9,
                  height: widget.size * 0.9,
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
                  width: widget.size * 0.92,
                  height: widget.size * 0.92,
                  child: CustomPaint(
                    painter: _IITBuildingPainter(),
                  ),
                ),
              ),

              // 3. Floating Target IIT Badge (Bottom) - No floating circle above dome!
              Positioned(
                bottom: 4 + float * -0.5,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: (16 * scale).clamp(10.0, 18.0),
                    vertical: (7 * scale).clamp(4.0, 8.0),
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF12141D),
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: const Color(0xFF8338EC).withValues(alpha: 0.65),
                      width: 1.4,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF8338EC).withValues(alpha: 0.35),
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                      ),
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.6),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: (8 * scale).clamp(5.0, 8.0),
                        height: (8 * scale).clamp(5.0, 8.0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF00E676),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF00E676),
                              blurRadius: 6,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        widget.targetIIT,
                        style: GoogleFonts.outfit(
                          color: Colors.white,
                          fontSize: (12.5 * scale).clamp(9.5, 13.0),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.8,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '• ${widget.airRank}',
                        style: GoogleFonts.outfit(
                          color: const Color(0xFFFFB300),
                          fontSize: (11.5 * scale).clamp(8.5, 12.0),
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

/// Custom Painter that renders an authentic, breathtaking 3D neoclassical IIT Building
class _IITBuildingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final centerX = w / 2;
    final baseY = h * 0.84;

    // 1. Soft Ambient Occlusion Ground Shadow
    final groundShadow = Paint()
      ..color = Colors.black.withValues(alpha: 0.5)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 14);
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(centerX, baseY + 6),
        width: w * 0.86,
        height: 20,
      ),
      groundShadow,
    );

    // 2. Conical Volumetric Light Beam from Apex down to Steps
    final beamPath = Path()
      ..moveTo(centerX, h * 0.12)
      ..lineTo(centerX - w * 0.44, baseY)
      ..lineTo(centerX + w * 0.44, baseY)
      ..close();
    final beamPaint = Paint()
      ..shader = LinearGradient(
        colors: [
          const Color(0xFFFFD54F).withValues(alpha: 0.18),
          const Color(0xFF8338EC).withValues(alpha: 0.05),
          Colors.transparent,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: const [0.0, 0.6, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, w, baseY));
    canvas.drawPath(beamPath, beamPaint);

    // 3. Ambient Academic Sparks / Floating Stardust
    final sparkPaint = Paint()..color = const Color(0xFFFFD54F).withValues(alpha: 0.7);
    final sparkGlow = Paint()
      ..color = const Color(0xFFFFB300).withValues(alpha: 0.35)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);

    final sparks = [
      Offset(w * 0.16, h * 0.32),
      Offset(w * 0.84, h * 0.36),
      Offset(w * 0.22, h * 0.56),
      Offset(w * 0.78, h * 0.52),
    ];
    for (final sp in sparks) {
      canvas.drawCircle(sp, (w * 0.015).clamp(2.0, 4.0), sparkGlow);
      canvas.drawCircle(sp, (w * 0.008).clamp(1.0, 2.0), sparkPaint);
    }

    // 4. Base Steps: 3-Tiered Beveled Marble Stylobate
    const stepH = 8.0;
    final tiers = [
      (w * 0.84, const Color(0xFF1E2230), const Color(0xFF151824)),
      (w * 0.78, const Color(0xFF282D3E), const Color(0xFF1A1D2B)),
      (w * 0.72, const Color(0xFF33394D), const Color(0xFF222636)),
    ];

    for (int i = 0; i < 3; i++) {
      final stepW = tiers[i].$1;
      final stepY = baseY - (3 - i) * stepH;
      final stepRect = Rect.fromCenter(
        center: Offset(centerX, stepY + stepH / 2),
        width: stepW,
        height: stepH,
      );

      // Step riser
      final riserPaint = Paint()
        ..shader = LinearGradient(
          colors: [tiers[i].$2, tiers[i].$3],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ).createShader(stepRect);
      canvas.drawRRect(
        RRect.fromRectAndRadius(stepRect, const Radius.circular(2.5)),
        riserPaint,
      );

      // Top bevel specular line
      final bevelPaint = Paint()
        ..shader = LinearGradient(
          colors: [
            Colors.white.withValues(alpha: 0.1),
            Colors.white.withValues(alpha: 0.55),
            Colors.white.withValues(alpha: 0.1),
          ],
        ).createShader(Rect.fromLTWH(centerX - stepW / 2, stepY, stepW, 1.2));
      canvas.drawRect(
        Rect.fromLTWH(centerX - stepW / 2, stepY, stepW, 1.2),
        bevelPaint,
      );
    }

    final columnBaseY = baseY - (3 * stepH);
    final columnTopY = columnBaseY - (h * 0.33);
    final buildingH = columnBaseY - columnTopY;

    // 5. Side Wings (Symmetrical Academic Wings flanking the main portico)
    final wingW = w * 0.14;
    final wingH = buildingH * 0.92;
    final wingTopY = columnBaseY - wingH;

    for (final isLeft in [true, false]) {
      final wingX = isLeft ? (centerX - w * 0.35) : (centerX + w * 0.35 - wingW);
      final wingRect = Rect.fromLTWH(wingX, wingTopY, wingW, wingH);

      // Wing stone facade
      final wingPaint = Paint()
        ..shader = LinearGradient(
          colors: isLeft
              ? [const Color(0xFF222638), const Color(0xFF161826)]
              : [const Color(0xFF1A1C2C), const Color(0xFF10121D)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(wingRect);
      canvas.drawRRect(RRect.fromRectAndRadius(wingRect, const Radius.circular(3)), wingPaint);

      // Wing Cornice Top
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(wingX - 2, wingTopY - 3, wingW + 4, 4),
          const Radius.circular(1.5),
        ),
        Paint()..color = const Color(0xFF42485E),
      );

      // 2 Symmetrical Arched Windows on each wing with warm amber study light!
      final winW = wingW * 0.42;
      final winH = wingH * 0.38;
      final winY = wingTopY + (wingH - winH) / 2;
      final winX = wingX + (wingW - winW) / 2;

      final winRect = Rect.fromLTWH(winX, winY, winW, winH);
      final winPath = Path()
        ..moveTo(winRect.left, winRect.bottom)
        ..lineTo(winRect.left, winRect.top + winW / 2)
        ..arcToPoint(Offset(winRect.right, winRect.top + winW / 2), radius: Radius.circular(winW / 2))
        ..lineTo(winRect.right, winRect.bottom)
        ..close();

      final winGlow = Paint()
        ..shader = const RadialGradient(
          colors: [Color(0xFFFFD54F), Color(0xFFFF8F00), Color(0xFF2A1502)],
          stops: [0.1, 0.6, 1.0],
          center: Alignment(0.0, 0.2),
        ).createShader(winRect);
      canvas.drawPath(winPath, winGlow);

      // Window stone frame & sill
      canvas.drawPath(
        winPath,
        Paint()
          ..color = const Color(0xFF5A627E)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.0,
      );
      canvas.drawRect(
        Rect.fromCenter(center: Offset(winX + winW / 2, winRect.bottom + 1), width: winW + 4, height: 2),
        Paint()..color = const Color(0xFF8C96B8),
      );
    }

    // 6. Central Portico Back Wall & Grand Arched Portal
    final porticoW = w * 0.56;
    final backWallRect = Rect.fromCenter(
      center: Offset(centerX, (columnBaseY + columnTopY) / 2),
      width: porticoW,
      height: buildingH,
    );
    final backWallPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF1C1E2B), Color(0xFF0F1019)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(backWallRect);
    canvas.drawRect(backWallRect, backWallPaint);

    // Grand Arched Entrance
    final archW = porticoW * 0.28;
    final archH = buildingH * 0.74;
    final archRect = Rect.fromLTWH(centerX - archW / 2, columnBaseY - archH, archW, archH);

    final archPath = Path()
      ..moveTo(archRect.left, archRect.bottom)
      ..lineTo(archRect.left, archRect.top + archW / 2)
      ..arcToPoint(Offset(archRect.right, archRect.top + archW / 2), radius: Radius.circular(archW / 2))
      ..lineTo(archRect.right, archRect.bottom)
      ..close();

    // Warm Interior Golden Radiance (The Light of Knowledge)
    final archGlow = Paint()
      ..shader = RadialGradient(
        colors: const [
          Color(0xFFFFD54F),
          Color(0xFFFF8F00),
          Color(0xFF3E1F00),
          Color(0xFF0A0B10),
        ],
        stops: const [0.0, 0.35, 0.75, 1.0],
        center: const Alignment(0.0, 0.3),
      ).createShader(archRect);
    canvas.drawPath(archPath, archGlow);

    // Beveled stone archivolt trim around the arch
    canvas.drawPath(
      archPath,
      Paint()
        ..color = const Color(0xFF7E88A6)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.6,
    );

    // Golden light shining forward onto steps from entrance
    final lightForward = Path()
      ..moveTo(archRect.left + 2, archRect.bottom)
      ..lineTo(centerX - archW * 0.8, baseY)
      ..lineTo(centerX + archW * 0.8, baseY)
      ..lineTo(archRect.right - 2, archRect.bottom)
      ..close();
    canvas.drawPath(
      lightForward,
      Paint()
        ..shader = LinearGradient(
          colors: [
            const Color(0xFFFFB300).withValues(alpha: 0.35),
            Colors.transparent,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ).createShader(Rect.fromLTWH(0, archRect.bottom, w, baseY - archRect.bottom)),
    );

    // 7. 6 Neoclassical Fluted Columns with Cylindrical 3D Lighting
    const numCols = 6;
    final colWidth = porticoW * 0.088;
    final colSpacing = (porticoW - colWidth * numCols) / (numCols - 1);
    final colStartX = centerX - porticoW / 2 + colWidth / 2;

    for (int i = 0; i < numCols; i++) {
      final colX = colStartX + i * (colWidth + colSpacing);
      final colH = buildingH - 8;
      final colRect = Rect.fromCenter(
        center: Offset(colX, (columnBaseY + columnTopY + 2) / 2),
        width: colWidth,
        height: colH,
      );

      // Cylindrical 3D Specular Highlight Shader (Apple/Material 3D level)
      final colPaint = Paint()
        ..shader = const LinearGradient(
          colors: [
            Color(0xFF8A93A6),
            Color(0xFFFFFFFF),
            Color(0xFFCBD5E1),
            Color(0xFF4B5366),
          ],
          stops: [0.0, 0.32, 0.68, 1.0],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ).createShader(colRect);

      canvas.drawRRect(
        RRect.fromRectAndRadius(colRect, const Radius.circular(2)),
        colPaint,
      );

      // Column Plinth Base (3D square base)
      final baseRect = Rect.fromCenter(
        center: Offset(colX, columnBaseY - 3),
        width: colWidth * 1.45,
        height: 6,
      );
      canvas.drawRRect(
        RRect.fromRectAndRadius(baseRect, const Radius.circular(1.5)),
        Paint()
          ..shader = const LinearGradient(
            colors: [Color(0xFFE2E8F0), Color(0xFF64748B)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ).createShader(baseRect),
      );

      // Column Capital (Classical Ionic/Corinthian head with golden bead)
      final capRect = Rect.fromCenter(
        center: Offset(colX, columnTopY + 4),
        width: colWidth * 1.5,
        height: 6,
      );
      canvas.drawRRect(
        RRect.fromRectAndRadius(capRect, const Radius.circular(1.5)),
        Paint()
          ..shader = const LinearGradient(
            colors: [Color(0xFFFFFFFF), Color(0xFFFFD54F), Color(0xFF94A3B8)],
            stops: [0.0, 0.5, 1.0],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ).createShader(capRect),
      );
    }

    // 8. Entablature (Horizontal Projecting Architrave & Frieze)
    final entH = (h * 0.042).clamp(10.0, 16.0);
    final entY = columnTopY - entH;
    final entW = porticoW * 1.08;
    final entRect = Rect.fromCenter(
      center: Offset(centerX, entY + entH / 2),
      width: entW,
      height: entH,
    );

    // Multi-tier entablature stone
    final entPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFFF1F5F9), Color(0xFFCBD5E1), Color(0xFF475569)],
        stops: [0.0, 0.45, 1.0],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(entRect);
    canvas.drawRRect(RRect.fromRectAndRadius(entRect, const Radius.circular(2.5)), entPaint);

    // Entablature drop shadow onto columns
    final corniceShadow = Paint()
      ..color = Colors.black.withValues(alpha: 0.5)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3);
    canvas.drawRect(
      Rect.fromLTWH(centerX - entW / 2, columnTopY, entW, 4),
      corniceShadow,
    );

    // 9. Classical Central Drum supporting the Dome
    final drumW = porticoW * 0.46;
    final drumH = (h * 0.09).clamp(18.0, 32.0);
    final drumY = entY - drumH;
    final drumRect = Rect.fromCenter(
      center: Offset(centerX, drumY + drumH / 2),
      width: drumW,
      height: drumH,
    );

    final drumPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF33384C), Color(0xFF1E212E), Color(0xFF12141F)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(drumRect);
    canvas.drawRect(drumRect, drumPaint);

    // 3 Clerestory windows on the drum
    for (int k = -1; k <= 1; k++) {
      final dwX = centerX + k * (drumW * 0.28);
      final dwRect = Rect.fromCenter(center: Offset(dwX, drumY + drumH * 0.55), width: drumW * 0.16, height: drumH * 0.55);
      final dwPath = Path()
        ..moveTo(dwRect.left, dwRect.bottom)
        ..lineTo(dwRect.left, dwRect.top + dwRect.width / 2)
        ..arcToPoint(Offset(dwRect.right, dwRect.top + dwRect.width / 2), radius: Radius.circular(dwRect.width / 2))
        ..lineTo(dwRect.right, dwRect.bottom)
        ..close();
      canvas.drawPath(
        dwPath,
        Paint()
          ..shader = const RadialGradient(
            colors: [Color(0xFFFFD54F), Color(0xFFFF8F00), Color(0xFF1A1002)],
            stops: [0.1, 0.7, 1.0],
          ).createShader(dwRect),
      );
    }

    // 10. Grand 3D Heritage Spherical Dome
    final domeRadius = drumW * 0.54;
    final domeCenter = Offset(centerX, drumY + 2);
    final domeRect = Rect.fromCircle(center: domeCenter, radius: domeRadius);

    final domePath = Path()
      ..addArc(domeRect, math.pi, math.pi);

    // Rich 3D Spherical Specular Shader
    final domePaint = Paint()
      ..shader = RadialGradient(
        colors: const [
          Color(0xFFFFF176),
          Color(0xFFFFB300),
          Color(0xFFFF8F00),
          Color(0xFF512DA8),
          Color(0xFF1A0A38),
        ],
        stops: const [0.05, 0.25, 0.55, 0.85, 1.0],
        center: const Alignment(-0.35, -0.45),
        radius: 0.9,
      ).createShader(domeRect);
    canvas.drawPath(domePath, domePaint);

    // 4 Architectural Golden Ribs curving along the dome
    final ribPaint = Paint()
      ..color = const Color(0xFFFFE082).withValues(alpha: 0.65)
      ..style = PaintingStyle.stroke
      ..strokeWidth = (w * 0.007).clamp(1.0, 2.0);
    for (final factor in [-0.65, -0.25, 0.25, 0.65]) {
      final ribPath = Path()
        ..moveTo(centerX, domeCenter.dy - domeRadius)
        ..quadraticBezierTo(
          centerX + domeRadius * factor,
          domeCenter.dy - domeRadius * 0.5,
          centerX + (drumW / 2) * (factor > 0 ? 0.9 : -0.9) * (factor.abs() > 0.4 ? 1.0 : 0.5),
          domeCenter.dy,
        );
      canvas.drawPath(ribPath, ribPaint);
    }

    // 11. Golden Architectural Cupola / Lantern & Apex Needle Spire
    final cupolaW = drumW * 0.22;
    final cupolaH = (h * 0.045).clamp(10.0, 16.0);
    final cupolaTopY = (domeCenter.dy - domeRadius) - cupolaH;
    final cupolaRect = Rect.fromCenter(
      center: Offset(centerX, cupolaTopY + cupolaH / 2),
      width: cupolaW,
      height: cupolaH,
    );

    // Cupola base
    canvas.drawRRect(
      RRect.fromRectAndRadius(cupolaRect, const Radius.circular(2)),
      Paint()
        ..shader = const LinearGradient(
          colors: [Color(0xFFFFF9C4), Color(0xFFFFB300), Color(0xFFE65100)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ).createShader(cupolaRect),
    );

    // Apex Needle Spire with golden top finial
    final spireLength = (h * 0.065).clamp(14.0, 26.0);
    final spirePaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFFFFFFFF), Color(0xFFFFD54F), Color(0xFFFF8F00)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(centerX - 2, cupolaTopY - spireLength, 4, spireLength))
      ..strokeWidth = (w * 0.012).clamp(1.8, 3.0)
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(centerX, cupolaTopY),
      Offset(centerX, cupolaTopY - spireLength),
      spirePaint,
    );

    // Spire golden glow aura at the summit
    canvas.drawCircle(
      Offset(centerX, cupolaTopY - spireLength),
      (w * 0.016).clamp(3.0, 5.0),
      Paint()..color = const Color(0xFFFFD54F),
    );
    canvas.drawCircle(
      Offset(centerX, cupolaTopY - spireLength),
      (w * 0.035).clamp(6.0, 10.0),
      Paint()
        ..color = const Color(0xFFFFB300).withValues(alpha: 0.4)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4),
    );

    // 12. Grand 3D Triangular Pediment
    final pedHeight = (h * 0.13).clamp(28.0, 48.0);
    final pedBottomY = entY;
    final pedTopY = pedBottomY - pedHeight;
    final pedW = entW * 0.98;

    final pedPath = Path()
      ..moveTo(centerX - pedW / 2, pedBottomY)
      ..lineTo(centerX, pedTopY)
      ..lineTo(centerX + pedW / 2, pedBottomY)
      ..close();

    // Pediment Tympanum Stone
    final pedPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFFF8FAFC), Color(0xFFE2E8F0), Color(0xFF94A3B8)],
        stops: [0.0, 0.4, 1.0],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(centerX - pedW / 2, pedTopY, pedW, pedHeight));
    canvas.drawPath(pedPath, pedPaint);

    // Top Beveled Specular Stone Raking Cornice
    final rakePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = (w * 0.012).clamp(2.0, 3.2);
    canvas.drawPath(pedPath, rakePaint);

    // 13. Embossed Golden "IIT" Emblem in Tympanum
    final iitTextPainter = TextPainter(
      text: TextSpan(
        text: 'IIT',
        style: TextStyle(
          color: const Color(0xFF0F172A),
          fontSize: (w * 0.075).clamp(11.0, 20.0),
          fontWeight: FontWeight.w900,
          letterSpacing: (w * 0.016).clamp(2.0, 4.0),
          shadows: [
            Shadow(
              color: const Color(0xFFFFD54F).withValues(alpha: 0.8),
              blurRadius: 6,
              offset: const Offset(0, 1),
            ),
          ],
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    iitTextPainter.paint(
      canvas,
      Offset(
        centerX - iitTextPainter.width / 2,
        pedBottomY - iitTextPainter.height - (pedHeight * 0.18),
      ),
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
    // Distinct 3D assets, badge metadata, and volumetric lighting for each slide
    final (imageAsset, badgeTitle, badgeSubtitle, glowColor, badgeBorderColor) = switch (widget.slideIndex) {
      0 => (
        'assets/images/onboard_syllabus_3d.jpg',
        'GATE SYLLABUS MATRIX',
        '15+ YRS VERIFIED PYQS',
        const Color(0xFF8338EC),
        const Color(0xFFFF8522),
      ),
      1 => (
        'assets/images/onboard_cbt_3d.jpg',
        'OFFICIAL TCS iON SIMULATOR',
        'SCIENTIFIC CALCULATOR HUD',
        const Color(0xFFFF5722),
        const Color(0xFF3A86FF),
      ),
      _ => (
        'assets/images/onboard_radar_3d.jpg',
        'AI MISTAKE NOTEBOOK',
        'AIR < 100 MASTERY DRILLS',
        const Color(0xFF00E676),
        const Color(0xFFFFD54F),
      ),
    };

    return LayoutBuilder(
      builder: (context, constraints) {
        final stageW = constraints.maxWidth;
        final stageH = constraints.maxHeight;
        final assetSize = (stageH * 0.74).clamp(200.0, 310.0);

        return AnimatedBuilder(
          animation: _floatAnim,
          builder: (context, child) {
            final float = _floatAnim.value;

            return SizedBox(
              width: stageW,
              height: stageH,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  // 1. Ambient Volumetric Spotlight
                  Center(
                    child: Container(
                      width: assetSize * 1.25,
                      height: assetSize * 1.25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            glowColor.withValues(alpha: 0.32),
                            glowColor.withValues(alpha: 0.08),
                            Colors.transparent,
                          ],
                          stops: const [0.15, 0.6, 1.0],
                        ),
                      ),
                    ),
                  ),

                  // 2. High-Tech 3D Asset with Floating Levitation
                  Transform.translate(
                    offset: Offset(0, float),
                    child: Container(
                      width: assetSize,
                      height: assetSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(
                            color: glowColor.withValues(alpha: 0.28),
                            blurRadius: 30,
                            spreadRadius: -4,
                            offset: const Offset(0, 12),
                          ),
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.7),
                            blurRadius: 24,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(28),
                        child: Image.asset(
                          imageAsset,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            color: const Color(0xFF13101E),
                            child: Icon(
                              Icons.auto_awesome_rounded,
                              size: 48,
                              color: glowColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // 3. Floating Glassmorphic Status Pill (Anchored at bottom)
                  Positioned(
                    bottom: 12 + float * -0.4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF12111A).withValues(alpha: 0.94),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: badgeBorderColor.withValues(alpha: 0.55),
                          width: 1.2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: badgeBorderColor.withValues(alpha: 0.25),
                            blurRadius: 14,
                            offset: const Offset(0, 4),
                          ),
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.6),
                            blurRadius: 10,
                            offset: const Offset(0, 3),
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
                              color: Color(0xFF00E676),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF00E676),
                                  blurRadius: 6,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            badgeTitle,
                            style: GoogleFonts.outfit(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.6,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '• $badgeSubtitle',
                            style: GoogleFonts.outfit(
                              color: const Color(0xFFFFB300),
                              fontSize: 11,
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
      },
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
  final String imageAsset;

  const AuthPurpleHeaderWithIIT({
    super.key,
    this.action,
    this.targetIIT = 'GATEX AI',
    this.airRank = 'AIR < 100 TARGET',
    this.imageAsset = 'assets/images/auth_gatex_3d.jpg',
  });

  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    final headerHeight = isKeyboardOpen ? 110.0 : 215.0;
    final assetSize = isKeyboardOpen ? 68.0 : 124.0;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: headerHeight,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // Background ambient spotlight glow
          if (!isKeyboardOpen)
            Positioned(
              top: 10,
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFFFF8522).withValues(alpha: 0.22),
                      const Color(0xFF8338EC).withValues(alpha: 0.18),
                      Colors.transparent,
                    ],
                    stops: const [0.1, 0.55, 1.0],
                  ),
                ),
              ),
            ),

          // Central 3D Asset
          Positioned(
            bottom: isKeyboardOpen ? 6 : 14,
            child: Container(
              width: assetSize,
              height: assetSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFF8522).withValues(alpha: 0.25),
                    blurRadius: 18,
                    offset: const Offset(0, 6),
                  ),
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.5),
                    blurRadius: 14,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Image.asset(
                  imageAsset,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: const Color(0xFF13101E),
                    child: const Icon(
                      Icons.auto_awesome_rounded,
                      size: 38,
                      color: Color(0xFFFF8522),
                    ),
                  ),
                ),
              ),
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

/// Pixel-perfect official 4-color Google "G" logo vector
class GoogleLogoIcon extends StatelessWidget {
  final double size;

  const GoogleLogoIcon({super.key, this.size = 20});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _GoogleLogoPainter(),
      ),
    );
  }
}

class _GoogleLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.save();
    canvas.scale(scale, scale);

    final paint = Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // 1. Blue (#4285F4) - Right horizontal bar and upper right
    paint.color = const Color(0xFF4285F4);
    final bluePath = Path()
      ..moveTo(23.745, 12.27)
      ..cubicTo(23.745, 11.57, 23.685, 10.87, 23.555, 10.2)
      ..lineTo(12.0, 10.2)
      ..lineTo(12.0, 14.71)
      ..lineTo(18.6, 14.71)
      ..cubicTo(18.31, 16.23, 17.46, 17.51, 16.2, 18.36)
      ..lineTo(16.2, 21.39)
      ..lineTo(20.08, 21.39)
      ..cubicTo(22.35, 19.3, 23.745, 16.22, 23.745, 12.27)
      ..close();
    canvas.drawPath(bluePath, paint);

    // 2. Green (#34A853) - Bottom and bottom right
    paint.color = const Color(0xFF34A853);
    final greenPath = Path()
      ..moveTo(12.0, 24.0)
      ..cubicTo(15.24, 24.0, 17.95, 22.92, 19.93, 21.09)
      ..lineTo(16.05, 18.06)
      ..cubicTo(14.97, 18.78, 13.6, 19.22, 12.0, 19.22)
      ..cubicTo(8.88, 19.22, 6.23, 17.12, 5.28, 14.29)
      ..lineTo(1.25, 14.29)
      ..lineTo(1.25, 17.42)
      ..cubicTo(3.26, 21.36, 7.33, 24.0, 12.0, 24.0)
      ..close();
    canvas.drawPath(greenPath, paint);

    // 3. Yellow (#FBBC05) - Left arc
    paint.color = const Color(0xFFFBBC05);
    final yellowPath = Path()
      ..moveTo(5.28, 14.29)
      ..cubicTo(5.03, 13.57, 4.90, 12.80, 4.90, 12.0)
      ..cubicTo(4.90, 11.20, 5.04, 10.43, 5.28, 9.71)
      ..lineTo(5.28, 6.57)
      ..lineTo(1.25, 6.57)
      ..cubicTo(0.45, 8.15, 0.0, 9.92, 0.0, 12.0)
      ..cubicTo(0.0, 14.08, 0.45, 15.85, 1.25, 17.43)
      ..lineTo(5.28, 14.29)
      ..close();
    canvas.drawPath(yellowPath, paint);

    // 4. Red (#EA4335) - Top arc
    paint.color = const Color(0xFFEA4335);
    final redPath = Path()
      ..moveTo(12.0, 4.75)
      ..cubicTo(13.77, 4.75, 15.35, 5.36, 16.60, 6.55)
      ..lineTo(20.02, 3.13)
      ..cubicTo(17.95, 1.19, 15.24, 0.0, 12.0, 0.0)
      ..cubicTo(7.33, 0.0, 3.26, 2.64, 1.25, 6.57)
      ..lineTo(5.28, 9.71)
      ..cubicTo(6.23, 6.88, 8.88, 4.75, 12.0, 4.75)
      ..close();
    canvas.drawPath(redPath, paint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Google Pill Button
class GoogleAuthPillButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;
  final String label;

  const GoogleAuthPillButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
    this.label = 'Continue with Google',
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
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.black.withValues(alpha: 0.25)
                  : Colors.black.withValues(alpha: 0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: isLoading
            ? Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      isDark ? Colors.white70 : const Color(0xFF4285F4),
                    ),
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.08),
                          blurRadius: 4,
                          offset: const Offset(0, 1.5),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: const GoogleLogoIcon(size: 18),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    label,
                    style: GoogleFonts.outfit(
                      color: isDark ? Colors.white : const Color(0xFF1D1D24),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.1,
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
