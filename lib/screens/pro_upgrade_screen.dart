import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../services/purchase_service.dart';
import '../theme/app_theme.dart';

class ProUpgradeScreen extends StatefulWidget {
  const ProUpgradeScreen({super.key});

  @override
  State<ProUpgradeScreen> createState() => _ProUpgradeScreenState();
}

class _ProUpgradeScreenState extends State<ProUpgradeScreen> {
  final PurchaseService _purchaseService = PurchaseService();
  bool _isProcessing = false;

  Future<void> _handlePurchase() async {
    HapticFeedback.mediumImpact();
    setState(() => _isProcessing = true);

    final success = await _purchaseService.purchaseProPass();

    if (!mounted) return;
    setState(() => _isProcessing = false);

    if (success) {
      HapticFeedback.selectionClick();
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('🎉 Welcome to GateX Pro! All perks unlocked till 31st March 2027.'),
          backgroundColor: AppTheme.success,
          duration: Duration(seconds: 3),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Purchase could not be completed. Please try again.'),
          backgroundColor: AppTheme.error,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> _handleRestore() async {
    HapticFeedback.lightImpact();
    setState(() => _isProcessing = true);

    final restored = await _purchaseService.restorePurchases();

    if (!mounted) return;
    setState(() => _isProcessing = false);

    ScaffoldMessenger.of(context).clearSnackBars();
    if (restored) {
      HapticFeedback.selectionClick();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('✅ GateX Pro membership restored!'),
          backgroundColor: AppTheme.success,
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No previous Pro purchases found for this account.'),
          backgroundColor: AppTheme.textSecondary,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final isPro = provider.isPro;

    return Scaffold(
      backgroundColor: const Color(0xFF0C0A07),
      body: Stack(
        children: [
          // 1. Ambient Warm Golden Spotlight Halo
          Positioned(
            top: -60,
            left: 0,
            right: 0,
            child: IgnorePointer(
              child: Container(
                height: 380,
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment(0, -0.4),
                    radius: 0.75,
                    colors: [
                      Color(0x38FFA000),
                      Color(0x18FF8F00),
                      Color(0x06FFA000),
                      Colors.transparent,
                    ],
                    stops: [0.0, 0.45, 0.75, 1.0],
                  ),
                ),
              ),
            ),
          ),

          // 2. Ambient Bottom Glow
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: IgnorePointer(
              child: Container(
                height: 200,
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment(0, 1.0),
                    radius: 0.8,
                    colors: [
                      Color(0x1CFFA000),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ),

          // 3. Main Screen Content
          SafeArea(
            child: Column(
              children: [
                // Top App Bar: Close (X) & Restore
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close_rounded, color: Color(0xFFA89F91), size: 24),
                        tooltip: 'Close',
                        splashRadius: 20,
                      ),
                      if (!isPro)
                        TextButton(
                          onPressed: _isProcessing ? null : _handleRestore,
                          child: Text(
                            'Restore',
                            style: GoogleFonts.outfit(
                              color: const Color(0xFFA89F91),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),

                // Scrollable Content
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 520),
                        child: Column(
                          children: [
                            const SizedBox(height: 8),

                            // Top Golden Medallion
                            _buildTopMedallion(isPro: isPro),
                            const SizedBox(height: 18),

                            // Title: GateX Pro
                            Text(
                              isPro ? 'You\'re on GateX Pro' : 'GateX Pro',
                              style: GoogleFonts.outfit(
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                                color: const Color(0xFFFFF8EC),
                                letterSpacing: -0.5,
                              ),
                            ),
                            const SizedBox(height: 8),

                            // Subtitle
                            Text(
                              isPro
                                  ? 'Your membership is active and valid till 31st March 2027.\nEnjoy unlimited ad-free mocks and AI drills!'
                                  : 'Aspirants have so much more fun & score\nhigher with GateX Pro!',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.outfit(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFFA89F91),
                                height: 1.35,
                              ),
                            ),
                            const SizedBox(height: 24),

                            // Feature List Cards (Locket Gold Style)
                            _buildFeatureCard(
                              iconEmoji: '🚫',
                              iconBg: const Color(0xFFEF4444),
                              title: 'Remove ads',
                              subtitle: 'Never see an ad during tests or practice!',
                            ),
                            const SizedBox(height: 10),

                            _buildFeatureCard(
                              iconEmoji: '💻',
                              iconBg: const Color(0xFF3B82F6),
                              title: '10 Full-Length CBT Mocks',
                              subtitle: 'Authentic TCS iON simulator & NAT calculator!',
                            ),
                            const SizedBox(height: 10),

                            _buildFeatureCard(
                              iconEmoji: '⚡',
                              iconBg: const Color(0xFFF59E0B),
                              title: 'AI Error Drills',
                              subtitle: 'Targeted 15-question drills from your mistake log!',
                            ),
                            const SizedBox(height: 10),

                            _buildFeatureCard(
                              iconEmoji: '📚',
                              iconBg: const Color(0xFF8B5CF6),
                              title: 'In-Depth Pro Notes',
                              subtitle: 'Full mathematical proofs, exam traps & shortcuts!',
                            ),
                            const SizedBox(height: 10),

                            _buildFeatureCard(
                              iconEmoji: '📄',
                              iconBg: const Color(0xFF10B981),
                              title: 'Clean PDF Export',
                              subtitle: 'Export & print beautiful formula sheets!',
                            ),
                            const SizedBox(height: 10),

                            _buildFeatureCard(
                              iconEmoji: '👑',
                              iconBg: const Color(0xFFFFB300),
                              title: 'All New Features Included',
                              subtitle: 'Valid till 31st March 2027 • Zero monthly renewals!',
                              badgeText: 'GATE 2027',
                            ),
                            const SizedBox(height: 28),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // Sticky Bottom CTA Area
                _buildStickyBottom(isPro: isPro),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Top 3D Golden Medallion
  Widget _buildTopMedallion({required bool isPro}) {
    return Container(
      width: 78,
      height: 78,
      decoration: BoxDecoration(
        color: const Color(0xFF1E1912),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          color: const Color(0xFFFFB800).withValues(alpha: 0.5),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFFB800).withValues(alpha: 0.35),
            blurRadius: 30,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
          const BoxShadow(
            color: Color(0xFF0C0A07),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [
              Color(0xFFFFF8D6),
              Color(0xFFFFCA28),
              Color(0xFFFFA000),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ).createShader(bounds),
          child: Icon(
            isPro ? Icons.workspace_premium_rounded : Icons.star_rounded,
            size: 46,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  /// Feature Card matching Locket Gold styling
  Widget _buildFeatureCard({
    required String iconEmoji,
    required Color iconBg,
    required String title,
    required String subtitle,
    String? badgeText,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF181511),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.07),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Left Icon Squircle
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: iconBg.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: iconBg.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: Center(
              child: Text(
                iconEmoji,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
          const SizedBox(width: 14),

          // Title & Subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        title,
                        style: GoogleFonts.outfit(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (badgeText != null) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFF38290A),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color(0xFFFFB800).withValues(alpha: 0.6),
                            width: 0.8,
                          ),
                        ),
                        child: Text(
                          badgeText,
                          style: GoogleFonts.outfit(
                            color: const Color(0xFFFFB800),
                            fontSize: 9.5,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.4,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: GoogleFonts.outfit(
                    fontSize: 12.5,
                    color: const Color(0xFF9E9589),
                    height: 1.25,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Sticky Bottom Section with Gold Pill CTA & Dismiss link
  Widget _buildStickyBottom({required bool isPro}) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        20,
        12,
        20,
        12 + MediaQuery.of(context).padding.bottom,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF0C0A07).withValues(alpha: 0.95),
        border: Border(
          top: BorderSide(
            color: Colors.white.withValues(alpha: 0.05),
            width: 1,
          ),
        ),
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 520),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isPro) ...[
                // Pro Member Active Button
                InkWell(
                  onTap: () => Navigator.pop(context),
                  borderRadius: BorderRadius.circular(32),
                  child: Container(
                    height: 54,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1B1711),
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(
                        color: const Color(0xFFFFB800).withValues(alpha: 0.5),
                        width: 1.2,
                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.check_circle_rounded,
                            color: Color(0xFFFFB800),
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'GateX Pro Active — Back to Studies',
                            style: GoogleFonts.outfit(
                              fontSize: 15.5,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFFFB800),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Valid till 31st March 2027 (GATE 2027)',
                  style: GoogleFonts.outfit(
                    fontSize: 12,
                    color: const Color(0xFF8A8275),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ] else ...[
                // Main CTA Button: Upgrade to GateX Pro — ₹299 🔒
                InkWell(
                  onTap: _isProcessing ? null : _handlePurchase,
                  borderRadius: BorderRadius.circular(32),
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFFFFB800),
                          Color(0xFFFFA000),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFFFB800).withValues(alpha: 0.40),
                          blurRadius: 18,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: _isProcessing
                          ? const SizedBox(
                              width: 22,
                              height: 22,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.5,
                                color: Color(0xFF161005),
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Upgrade to GateX Pro — ₹299',
                                  style: GoogleFonts.outfit(
                                    fontSize: 16.5,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF161005),
                                    letterSpacing: 0.2,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                const Icon(
                                  Icons.lock_rounded,
                                  size: 17,
                                  color: Color(0xFF161005),
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // Validity Micro-copy
                Text(
                  'Valid till 31st March 2027 (GATE 2027) • Single payment',
                  style: GoogleFonts.outfit(
                    fontSize: 12,
                    color: const Color(0xFF8A8275),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),

                // No thanks! dismiss link
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                    foregroundColor: const Color(0xFFA89F91),
                  ),
                  child: Text(
                    'No thanks!',
                    style: GoogleFonts.outfit(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFA89F91),
                    ),
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
