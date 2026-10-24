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
  bool _isDualSelected = false;
  bool _initializedSelection = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initializedSelection) {
      final provider = Provider.of<AppProvider>(context, listen: false);
      _isDualSelected = provider.selectedExam == 'BOTH';
      _initializedSelection = true;
    }
  }

  Future<void> _handlePurchase() async {
    HapticFeedback.mediumImpact();
    setState(() => _isProcessing = true);

    final planId = _isDualSelected
        ? PurchaseService.proDualProductId
        : PurchaseService.proSoloProductId;

    final success = await _purchaseService.purchaseProPass(planId: planId);

    if (!mounted) return;
    setState(() => _isProcessing = false);

    if (success) {
      HapticFeedback.selectionClick();
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _isDualSelected
                ? '🎉 Welcome to GateX Dual Pro! DA & CS/IT unlocked till 31st March 2027.'
                : '🎉 Welcome to GateX Pro! All perks unlocked till 31st March 2027.',
          ),
          backgroundColor: AppTheme.success,
          duration: const Duration(seconds: 3),
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
    final isDualPro = provider.isDualPro;

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

          // 2. Main Screen Content
          SafeArea(
            child: Column(
              children: [
                // Top App Bar: Close (X) & Restore (No borders or dividers)
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
                            const SizedBox(height: 6),

                            // Top Golden Medallion
                            _buildTopMedallion(isPro: isPro),
                            const SizedBox(height: 16),

                            // Title: GateX Pro
                            Text(
                              isPro
                                  ? (isDualPro ? 'GateX Dual Pro Member' : 'GateX Pro Member')
                                  : 'GateX Pro',
                              style: GoogleFonts.outfit(
                                fontSize: 28,
                                fontWeight: FontWeight.w800,
                                color: const Color(0xFFFFF8EC),
                                letterSpacing: -0.5,
                              ),
                            ),
                            const SizedBox(height: 6),

                            // Subtitle
                            Text(
                              isPro
                                  ? 'Your pass is active and valid till 31st March 2027.\nEnjoy unlimited ad-free mocks and AI drills!'
                                  : 'Aspirants have so much more fun & score\nhigher with GateX Pro!',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.outfit(
                                fontSize: 13.5,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFFA89F91),
                                height: 1.35,
                              ),
                            ),
                            const SizedBox(height: 20),

                            // 2-Option Tier Selector: Solo (₹299) vs Dual Prep (₹499)
                            if (!isPro) ...[
                              _buildPlanSelector(),
                              const SizedBox(height: 20),
                            ],

                            // Feature List Cards (Locket Gold Style with full wrap text)
                            _buildFeatureCard(
                              iconEmoji: '🚫',
                              iconBg: const Color(0xFFEF4444),
                              title: 'Remove ads',
                              subtitle: '100% ad-free during tests, drills, and practice sessions.',
                            ),
                            const SizedBox(height: 10),

                            _buildFeatureCard(
                              iconEmoji: '💻',
                              iconBg: const Color(0xFF3B82F6),
                              title: _isDualSelected
                                  ? '20 Full-Length CBT Mocks'
                                  : '10 Full-Length CBT Mocks',
                              subtitle: _isDualSelected
                                  ? '10 GATE DA + 10 CS/IT authentic TCS iON simulator mocks.'
                                  : 'Authentic TCS iON simulator with official NAT calculator.',
                            ),
                            const SizedBox(height: 10),

                            _buildFeatureCard(
                              iconEmoji: '⚡',
                              iconBg: const Color(0xFFF59E0B),
                              title: 'AI Error Drills',
                              subtitle: 'Targeted 15-question drills generated from your mistake log.',
                            ),
                            const SizedBox(height: 10),

                            _buildFeatureCard(
                              iconEmoji: '📚',
                              iconBg: const Color(0xFF8B5CF6),
                              title: _isDualSelected
                                  ? 'All 14 Subject Pro Notes'
                                  : 'In-Depth Pro Notes',
                              subtitle: _isDualSelected
                                  ? 'Complete proofs, derivations & exam traps across DA & CS/IT.'
                                  : 'Full mathematical proofs, exam traps & speed shortcuts.',
                            ),
                            const SizedBox(height: 10),

                            _buildFeatureCard(
                              iconEmoji: '📄',
                              iconBg: const Color(0xFF10B981),
                              title: 'Clean PDF Export',
                              subtitle: 'Download & print publication-grade formula cheat sheets.',
                            ),
                            const SizedBox(height: 10),

                            _buildFeatureCard(
                              iconEmoji: '👑',
                              iconBg: const Color(0xFFFFB300),
                              title: 'All New Features Included',
                              subtitle: 'Valid till 31st March 2027 • Zero monthly renewals.',
                              badgeText: 'GATE 2027',
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // Sticky Bottom CTA Area (Seamless blend, no harsh horizontal cut line)
                _buildStickyBottom(isPro: isPro, isDualPro: isDualPro),
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
      width: 76,
      height: 76,
      decoration: BoxDecoration(
        color: const Color(0xFF1E1912),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFFFFB800).withValues(alpha: 0.5),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFFB800).withValues(alpha: 0.35),
            blurRadius: 28,
            spreadRadius: 2,
            offset: const Offset(0, 4),
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
            size: 44,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  /// Plan Selector: Solo Pass (₹299) vs Dual Prep Pass (₹499)
  Widget _buildPlanSelector() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFF161410),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.08),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // 1. Solo Pass (₹299)
          Expanded(
            child: _buildPlanOptionTile(
              isSelected: !_isDualSelected,
              title: 'Solo Pass',
              subtitle: 'DA or CS/IT • 10 Mocks',
              price: '₹299',
              onTap: () {
                HapticFeedback.selectionClick();
                setState(() => _isDualSelected = false);
              },
            ),
          ),
          const SizedBox(width: 4),

          // 2. Dual Prep Pass (₹499)
          Expanded(
            child: _buildPlanOptionTile(
              isSelected: _isDualSelected,
              title: 'Dual Prep',
              subtitle: 'Both Papers • 20 Mocks',
              price: '₹499',
              badgeText: 'BEST VALUE 🔥',
              onTap: () {
                HapticFeedback.selectionClick();
                setState(() => _isDualSelected = true);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlanOptionTile({
    required bool isSelected,
    required String title,
    required String subtitle,
    required String price,
    String? badgeText,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF262016) : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
          border: isSelected
              ? Border.all(
                  color: const Color(0xFFFFB800).withValues(alpha: 0.7),
                  width: 1.4,
                )
              : null,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xFFFFB800).withValues(alpha: 0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Column(
          children: [
            if (badgeText != null)
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFF38290A),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: const Color(0xFFFFB800).withValues(alpha: 0.6),
                    width: 0.8,
                  ),
                ),
                child: Text(
                  badgeText,
                  style: GoogleFonts.outfit(
                    color: const Color(0xFFFFB800),
                    fontSize: 8.5,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.3,
                  ),
                ),
              )
            else
              const SizedBox(height: 17),
            Text(
              title,
              style: GoogleFonts.outfit(
                fontSize: 13.5,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : const Color(0xFFA89F91),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              price,
              style: GoogleFonts.outfit(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: isSelected ? const Color(0xFFFFB800) : Colors.white70,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                fontSize: 10,
                color: const Color(0xFF8A8275),
                height: 1.2,
              ),
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }

  /// Feature Card matching Locket Gold styling with natural text wrapping
  Widget _buildFeatureCard({
    required String iconEmoji,
    required Color iconBg,
    required String title,
    required String subtitle,
    String? badgeText,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      decoration: BoxDecoration(
        color: const Color(0xFF181511),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.07),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left Icon Squircle
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconBg.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: iconBg.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              iconEmoji,
              style: const TextStyle(fontSize: 19),
            ),
          ),
          const SizedBox(width: 14),

          // Title & Subtitle with full wrapping (never cut down)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        title,
                        style: GoogleFonts.outfit(
                          fontSize: 14.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    if (badgeText != null) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFF38290A),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: const Color(0xFFFFB800).withValues(alpha: 0.6),
                            width: 0.8,
                          ),
                        ),
                        child: Text(
                          badgeText,
                          style: GoogleFonts.outfit(
                            color: const Color(0xFFFFB800),
                            fontSize: 9,
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
                    fontSize: 12,
                    color: const Color(0xFF9E9589),
                    height: 1.3,
                  ),
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Sticky Bottom Section with Soft Fade (No harsh cut-line)
  Widget _buildStickyBottom({
    required bool isPro,
    required bool isDualPro,
  }) {
    final priceLabel = _isDualSelected ? '₹499' : '₹299';
    final planLabel = _isDualSelected ? 'Dual Pass' : 'Solo Pass';

    return Container(
      padding: EdgeInsets.fromLTRB(
        20,
        14,
        20,
        12 + MediaQuery.of(context).padding.bottom,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF0C0A07),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0C0A07).withValues(alpha: 0.95),
            offset: const Offset(0, -14),
            blurRadius: 18,
            spreadRadius: 6,
          ),
        ],
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
                            isDualPro
                                ? 'GateX Dual Pro Active — Back to Studies'
                                : 'GateX Pro Active — Back to Studies',
                            style: GoogleFonts.outfit(
                              fontSize: 15,
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
                // Main CTA Button
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
                                  'Upgrade $planLabel — $priceLabel',
                                  style: GoogleFonts.outfit(
                                    fontSize: 16,
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
