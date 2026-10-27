import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../services/purchase_service.dart';
import '../theme/app_theme.dart';

class ProUpgradeScreen extends StatefulWidget {
  final bool? initialIsDual;
  const ProUpgradeScreen({super.key, this.initialIsDual});

  @override
  State<ProUpgradeScreen> createState() => _ProUpgradeScreenState();
}

class _ProUpgradeScreenState extends State<ProUpgradeScreen> {
  final PurchaseService _purchaseService = PurchaseService();
  bool _isProcessing = false;
  bool _isDualSelected = false;
  String _selectedSoloBranch = 'DA';
  bool _initializedSelection = false;

  @override
  void initState() {
    super.initState();
    _purchaseService.refreshOfferings().then((_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initializedSelection) {
      final provider = Provider.of<AppProvider>(context, listen: false);
      _isDualSelected = widget.initialIsDual ?? false;
      _selectedSoloBranch = (provider.activeExam ?? 'DA').toUpperCase().contains('CS') ? 'CSIT' : 'DA';
      _initializedSelection = true;
    }
  }

  Future<void> _handlePurchase() async {
    HapticFeedback.mediumImpact();
    setState(() => _isProcessing = true);

    final provider = Provider.of<AppProvider>(context, listen: false);
    final isExistingSolo = provider.isPro && !provider.isDualPro;

    final String planId;
    if (isExistingSolo) {
      planId = PurchaseService.proUpgradeToDualProductId;
    } else if (_isDualSelected) {
      planId = PurchaseService.proDualProductId;
    } else {
      planId = PurchaseService.proSoloProductId;
    }

    final success = await _purchaseService.purchaseProPass(
      planId: planId,
      targetBranch: _selectedSoloBranch,
    );

    if (!mounted) return;
    setState(() => _isProcessing = false);

    if (success) {
      HapticFeedback.selectionClick();
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isExistingSolo || _isDualSelected
                ? '🎉 Welcome to GateX Dual Pro! DA & CS/IT unlocked till 31st March 2027.'
                : '🎉 Welcome to GateX Solo Pro ($_selectedSoloBranch)! Unlocked till 31st March 2027.',
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
    final soloBranch = provider.soloBranch;

    // Check if user is a Solo pass holder who can upgrade to Dual
    final isSoloUpgradeCandidate = isPro && !isDualPro;

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
                      if (!isDualPro)
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
                            _buildTopMedallion(isPro: isPro, isDual: isDualPro),
                            const SizedBox(height: 16),

                            // Title
                            Text(
                              isDualPro
                                  ? 'GateX Dual Pro Member'
                                  : (isSoloUpgradeCandidate
                                      ? 'Upgrade to Dual Prep Pass'
                                      : 'GateX Pro'),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.outfit(
                                fontSize: 26,
                                fontWeight: FontWeight.w800,
                                color: const Color(0xFFFFF8EC),
                                letterSpacing: -0.5,
                              ),
                            ),
                            const SizedBox(height: 6),

                            // Subtitle
                            Text(
                              isDualPro
                                  ? 'Your Dual Pass is active and unlocks all 20 CBT mocks and study materials across both GATE DA and CS/IT.'
                                  : (isSoloUpgradeCandidate
                                      ? 'You have Solo Pass (GATE $soloBranch). Upgrade for just the difference (₹200) to unlock both DA + CS/IT!'
                                      : 'Aspirants have so much more fun & score\nhigher with GateX Pro!'),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.outfit(
                                fontSize: 13.5,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFFA89F91),
                                height: 1.35,
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Plan Switcher (For Free users only)
                            if (!isPro) ...[
                              _buildPlanSelector(),
                              const SizedBox(height: 20),
                            ] else if (isSoloUpgradeCandidate) ...[
                              _buildUpgradeComparisonCard(soloBranch: soloBranch),
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
                              title: (_isDualSelected || isDualPro || isSoloUpgradeCandidate)
                                  ? '20 Full-Length CBT Mocks'
                                  : '10 Full-Length CBT Mocks',
                              subtitle: (_isDualSelected || isDualPro || isSoloUpgradeCandidate)
                                  ? '10 GATE DA + 10 CS/IT authentic TCS iON simulator mocks.'
                                  : '10 full-length mocks for GATE $_selectedSoloBranch.',
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
                              title: (_isDualSelected || isDualPro || isSoloUpgradeCandidate)
                                  ? 'All 14 Subject Pro Notes'
                                  : 'In-Depth Pro Notes',
                              subtitle: (_isDualSelected || isDualPro || isSoloUpgradeCandidate)
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

                // Sticky Bottom CTA Area
                _buildStickyBottom(
                  isPro: isPro,
                  isDualPro: isDualPro,
                  isSoloUpgradeCandidate: isSoloUpgradeCandidate,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Top 3D Golden Medallion
  Widget _buildTopMedallion({required bool isPro, required bool isDual}) {
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

  /// Upgrade Comparison Card for existing Solo users
  Widget _buildUpgradeComparisonCard({required String soloBranch}) {
    final otherBranch = soloBranch == 'CSIT' ? 'GATE DA' : 'GATE CS/IT';

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1710),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFFFB800).withValues(alpha: 0.6),
          width: 1.2,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppTheme.accentMint.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'CURRENT: SOLO ($soloBranch)',
                  style: GoogleFonts.outfit(
                    color: AppTheme.accentMint,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFF38290A),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'UPGRADE: ${_purchaseService.getUpgradePriceString()} ONLY',
                  style: GoogleFonts.outfit(
                    color: const Color(0xFFFFB800),
                    fontSize: 10.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Add full access to $otherBranch with 10 extra mocks and complete pro notes across all subjects.',
            style: GoogleFonts.outfit(
              fontSize: 12,
              color: const Color(0xFFD6C8B4),
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }

  /// Plan Selector: Solo Pass (₹299) vs Dual Prep Pass (₹499)
  Widget _buildPlanSelector() {
    return Column(
      children: [
        Container(
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
                  subtitle: '$_selectedSoloBranch • 10 Mocks',
                  price: _purchaseService.getSoloPriceString(),
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
                  price: _purchaseService.getDualPriceString(),
                  badgeText: 'BEST VALUE 🔥',
                  onTap: () {
                    HapticFeedback.selectionClick();
                    setState(() => _isDualSelected = true);
                  },
                ),
              ),
            ],
          ),
        ),

        // If Solo is selected: let them pick which stream they are buying Solo for!
        if (!_isDualSelected) ...[
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1612),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white10),
            ),
            child: Row(
              children: [
                Text(
                  'Solo Paper Focus:',
                  style: GoogleFonts.outfit(fontSize: 11.5, color: const Color(0xFFA89F91)),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    HapticFeedback.selectionClick();
                    setState(() => _selectedSoloBranch = 'DA');
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: _selectedSoloBranch == 'DA' ? const Color(0xFFFFB800) : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'GATE DA',
                      style: GoogleFonts.outfit(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: _selectedSoloBranch == 'DA' ? Colors.black : const Color(0xFFA89F91),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                GestureDetector(
                  onTap: () {
                    HapticFeedback.selectionClick();
                    setState(() => _selectedSoloBranch = 'CSIT');
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: _selectedSoloBranch == 'CSIT' ? const Color(0xFFFFB800) : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'GATE CS/IT',
                      style: GoogleFonts.outfit(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: _selectedSoloBranch == 'CSIT' ? Colors.black : const Color(0xFFA89F91),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
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
    required bool isSoloUpgradeCandidate,
  }) {
    final String soloPrice = _purchaseService.getSoloPriceString();
    final String dualPrice = _purchaseService.getDualPriceString();
    final String upgradePrice = _purchaseService.getUpgradePriceString();

    final String ctaText;
    if (isDualPro) {
      ctaText = 'GateX Dual Pro Active — Back to Studies';
    } else if (isSoloUpgradeCandidate) {
      ctaText = 'Upgrade to Dual Pass — $upgradePrice 🔒';
    } else if (_isDualSelected) {
      ctaText = 'Get Dual Prep Pass — $dualPrice 🔒';
    } else {
      ctaText = 'Get Solo Pass ($_selectedSoloBranch) — $soloPrice 🔒';
    }

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
              if (isDualPro) ...[
                // Dual Pro Member Active Button
                InkWell(
                  onTap: () => Navigator.pop(context),
                  borderRadius: BorderRadius.circular(32),
                  child: Container(
                    height: 52,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
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
                            size: 19,
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'Dual Pro Active • Back to Studies 🚀',
                                style: GoogleFonts.outfit(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFFFB800),
                                ),
                              ),
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
                          : Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 14),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  ctaText,
                                  style: GoogleFonts.outfit(
                                    fontSize: 15.5,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF161005),
                                    letterSpacing: 0.2,
                                  ),
                                ),
                              ),
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
                    isSoloUpgradeCandidate ? 'Keep Solo Pass' : 'No thanks!',
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
