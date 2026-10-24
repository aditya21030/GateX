import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../services/purchase_service.dart';
import '../theme/app_theme.dart';
import '../widgets/neu_widgets.dart';

class ProUpgradeScreen extends StatefulWidget {
  const ProUpgradeScreen({super.key});

  @override
  State<ProUpgradeScreen> createState() => _ProUpgradeScreenState();
}

class _ProUpgradeScreenState extends State<ProUpgradeScreen> {
  final PurchaseService _purchaseService = PurchaseService();
  bool _isProcessing = false;

  // Track expanded state for FAQ items
  final List<bool> _faqExpanded = [false, false, false, false];

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
          content: Text('🎉 Welcome to GateX Pro! All perks & future features unlocked.'),
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
    final isDark = context.isDarkMode;

    return Scaffold(
      backgroundColor: context.scaffoldBackground,
      appBar: AppBar(
        title: Text(
          'GateX Pro Pass',
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () => Navigator.pop(context),
          tooltip: 'Close',
        ),
        actions: [
          if (!isPro)
            TextButton(
              onPressed: _isProcessing ? null : _handleRestore,
              child: Text(
                'Restore',
                style: GoogleFonts.outfit(
                  color: isDark ? Colors.white70 : const Color(0xFF6E6E78),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          // Scrollable Body Content
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 580),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // 1. HERO BANNER WITH PRICING & EARLY-BIRD BADGE
                      _buildHeroCard(isPro: isPro, isDark: isDark),
                      const SizedBox(height: 18),

                      // 2. ✨ ALL NEW FEATURES INCLUDED VIP CARD
                      _buildAllNewFeaturesCard(isDark: isDark),
                      const SizedBox(height: 22),

                      // 3. WHAT PAID USERS GET (DETAILED PERKS GRID)
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFB300).withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.verified_rounded,
                              size: 16,
                              color: Color(0xFFFFB300),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'WHAT PAID USERS GET',
                            style: GoogleFonts.outfit(
                              color: context.textSecondaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.1,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      _buildPerkCard(
                        context: context,
                        icon: Icons.block_rounded,
                        iconColor: AppTheme.accentMint,
                        badgeText: 'ZERO DISTRACTION',
                        badgeColor: AppTheme.accentMint,
                        title: '100% Ad-Free Learning Experience',
                        description:
                            'Zero banner ads, zero video interruptions, zero countdown pauses during tests. Pure, undisturbed exam focus.',
                      ),
                      const SizedBox(height: 10),

                      _buildPerkCard(
                        context: context,
                        icon: Icons.computer_rounded,
                        iconColor: const Color(0xFF3B82F6),
                        badgeText: 'OFFICIAL REPLICA',
                        badgeColor: const Color(0xFF3B82F6),
                        title: '10 Full-Length TCS iON CBT Mocks',
                        description:
                            'Authentic GATE user interface, official scientific NAT calculator, MSQ multi-select logic, 65 questions, 100 marks distribution with detailed solutions.',
                      ),
                      const SizedBox(height: 10),

                      _buildPerkCard(
                        context: context,
                        icon: Icons.bolt_rounded,
                        iconColor: const Color(0xFFFF5722),
                        badgeText: 'WEAKNESS ELIMINATOR',
                        badgeColor: const Color(0xFFFF5722),
                        title: 'Unlimited AI Weak-Area Error Drills',
                        description:
                            'Personalized 15-question CBT drills dynamically generated from your mistake logbook to systematically fix recurring exam-hall traps.',
                      ),
                      const SizedBox(height: 10),

                      _buildPerkCard(
                        context: context,
                        icon: Icons.menu_book_rounded,
                        iconColor: const Color(0xFF8B5CF6),
                        badgeText: 'AIR-1 DOSSIER',
                        badgeColor: const Color(0xFF8B5CF6),
                        title: 'In-Depth Pro Notes & Mathematical Proofs',
                        description:
                            'Exhaustive derivations, common exam traps, solved numericals with step-by-step monospace solutions, and speed shortcuts across all 14 subjects.',
                      ),
                      const SizedBox(height: 10),

                      _buildPerkCard(
                        context: context,
                        icon: Icons.picture_as_pdf_rounded,
                        iconColor: const Color(0xFFFFB300),
                        badgeText: 'OFFLINE REVISION',
                        badgeColor: const Color(0xFFFFB300),
                        title: 'Printable Formula Sheets & PDF Export',
                        description:
                            'Download beautifully formatted, publication-grade PDFs of notes and cheat sheets with zero missing glyphs for offline revision and printouts.',
                      ),
                      const SizedBox(height: 10),

                      _buildPerkCard(
                        context: context,
                        icon: Icons.cloud_done_rounded,
                        iconColor: const Color(0xFF10B981),
                        badgeText: 'MULTI-DEVICE',
                        badgeColor: const Color(0xFF10B981),
                        title: 'Instant Multi-Device Cloud Sync',
                        description:
                            'Realtime progress sync across your phone, tablet, and PC with automated cloud backups and instant cross-device restore.',
                      ),
                      const SizedBox(height: 24),

                      // 4. PLAN COMPARISON MATRIX
                      Text(
                        'FREE VS PRO COMPARISON',
                        style: GoogleFonts.outfit(
                          color: context.textSecondaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.1,
                        ),
                      ),
                      const SizedBox(height: 12),

                      NeuContainer(
                        borderRadius: 20,
                        padding: EdgeInsets.zero,
                        child: Column(
                          children: [
                            // Header Row
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                              decoration: BoxDecoration(
                                color: context.colorSurfaceElevated,
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Text(
                                      'Feature',
                                      style: GoogleFonts.outfit(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                        color: context.textColor,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Free',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.outfit(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: context.textSecondaryColor,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.star_rounded, size: 14, color: Color(0xFFFFB300)),
                                        const SizedBox(width: 3),
                                        Text(
                                          'Pro Pass',
                                          style: GoogleFonts.outfit(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: const Color(0xFFFFB300),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(height: 1, color: context.colorBorder),

                            // Comparison Rows
                            _buildComparisonRow(
                              context: context,
                              feature: 'Full PYQ Bank (2024–2026)',
                              freeText: 'Yes',
                              proText: 'Yes',
                              freeCheck: true,
                              proCheck: true,
                            ),
                            _buildComparisonRow(
                              context: context,
                              feature: 'Syllabus & Topic Tracker',
                              freeText: 'Yes',
                              proText: 'Yes',
                              freeCheck: true,
                              proCheck: true,
                            ),
                            _buildComparisonRow(
                              context: context,
                              feature: 'Ad-Free Practice',
                              freeText: 'With Ads',
                              proText: 'Zero Ads',
                              freeCheck: false,
                              proCheck: true,
                              highlight: true,
                            ),
                            _buildComparisonRow(
                              context: context,
                              feature: 'TCS iON CBT Full Mocks',
                              freeText: '1 Sample',
                              proText: '10 Full Tests',
                              freeCheck: false,
                              proCheck: true,
                              highlight: true,
                            ),
                            _buildComparisonRow(
                              context: context,
                              feature: 'Weak-Area Error Drills',
                              freeText: 'Locked',
                              proText: 'Unlimited',
                              freeCheck: false,
                              proCheck: true,
                              highlight: true,
                            ),
                            _buildComparisonRow(
                              context: context,
                              feature: 'In-Depth Pro Notes & Proofs',
                              freeText: 'Summary Only',
                              proText: 'Full Dossier',
                              freeCheck: false,
                              proCheck: true,
                              highlight: true,
                            ),
                            _buildComparisonRow(
                              context: context,
                              feature: 'Clean PDF Export & Cheatsheets',
                              freeText: 'Locked',
                              proText: 'Unlimited',
                              freeCheck: false,
                              proCheck: true,
                            ),
                            _buildComparisonRow(
                              context: context,
                              feature: 'All New Features & Future Updates',
                              freeText: 'Limited',
                              proText: 'Lifetime Access',
                              freeCheck: false,
                              proCheck: true,
                              highlight: true,
                              isLast: true,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // 5. FREQUENTLY ASKED QUESTIONS
                      Text(
                        'FREQUENTLY ASKED QUESTIONS',
                        style: GoogleFonts.outfit(
                          color: context.textSecondaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.1,
                        ),
                      ),
                      const SizedBox(height: 12),

                      NeuContainer(
                        borderRadius: 20,
                        padding: EdgeInsets.zero,
                        child: Column(
                          children: [
                            _buildFaqItem(
                              context: context,
                              index: 0,
                              question: 'Is this a recurring subscription?',
                              answer:
                                  'No. GateX Pro is a single one-time payment of ₹199 with zero recurring fees. You will never be charged again.',
                            ),
                            Divider(height: 1, color: context.colorBorder),
                            _buildFaqItem(
                              context: context,
                              index: 1,
                              question: 'Do I get all future features for free?',
                              answer:
                                  'Yes! Every new feature, mock test, AI planner tool, and update released during the GATE 2026 and 2027 seasons will automatically be available to you at zero extra charge.',
                            ),
                            Divider(height: 1, color: context.colorBorder),
                            _buildFaqItem(
                              context: context,
                              index: 2,
                              question: 'Are the mock tests patterned on TCS iON?',
                              answer:
                                  'Yes. Our simulator features the official GATE virtual calculator, standard question palette, MSQ multiple choice rules, and authentic negative marking.',
                            ),
                            Divider(height: 1, color: context.colorBorder),
                            _buildFaqItem(
                              context: context,
                              index: 3,
                              question: 'Can I use Pro Pass on multiple devices?',
                              answer:
                                  'Yes! Simply tap "Restore" on your other Android devices or sign in with your same Google account to access all Pro features anywhere.',
                              isLast: true,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // 6. STUDENT TRUST GUARANTEE
                      NeuContainer(
                        isRecessed: true,
                        borderRadius: 16,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppTheme.secondary.withValues(alpha: 0.15),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.verified_user_rounded, color: AppTheme.secondary, size: 20),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '100% Student-First Software',
                                    style: GoogleFonts.outfit(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: context.textColor,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    'Built by GATE toppers. Zero coaching center promotions, zero spam, zero hidden fees.',
                                    style: GoogleFonts.outfit(
                                      fontSize: 11.5,
                                      color: context.textSecondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // 7. FIXED STICKY BOTTOM CALL-TO-ACTION (CTA) BAR
          _buildBottomCtaBar(isPro: isPro, isDark: isDark),
        ],
      ),
    );
  }

  // Hero Card with Pricing & Visual Highlights
  Widget _buildHeroCard({required bool isPro, required bool isDark}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF2E1A47),
            Color(0xFF1E1335),
            Color(0xFF120B20),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6B38FF).withValues(alpha: 0.25),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
        border: Border.all(
          color: const Color(0xFFFFB300).withValues(alpha: 0.35),
          width: 1.2,
        ),
      ),
      padding: const EdgeInsets.all(22),
      child: Column(
        children: [
          // Early Bird Ribbon
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xFFFFB300).withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFFFB300).withValues(alpha: 0.45)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.workspace_premium_rounded, size: 15, color: Color(0xFFFFB300)),
                const SizedBox(width: 6),
                Text(
                  isPro ? 'GATEX PRO PASS ACTIVE' : '🔥 60% LIMITED EARLY-BIRD OFFER',
                  style: GoogleFonts.outfit(
                    color: const Color(0xFFFFB300),
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.1,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),

          Text(
            isPro ? 'You Have Full GateX Pro Access 🌟' : 'Peak GATE 2026/27 AIR-1 Mastery',
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 8),

          Text(
            isPro
                ? 'All 10 full-length CBT mocks, error drills, Pro notes & future feature releases are completely unlocked for your account.'
                : 'Complete toolkit to conquer GATE: 10 Full CBT Mocks, unlimited AI error drills, comprehensive Pro notes, printable sheets & 100% ad-free.',
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(
              fontSize: 13,
              color: Colors.white.withValues(alpha: 0.85),
              height: 1.4,
            ),
          ),

          if (!isPro) ...[
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  PurchaseService.proPlanOldPrice,
                  style: GoogleFonts.outfit(
                    fontSize: 18,
                    color: Colors.white.withValues(alpha: 0.4),
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  PurchaseService.proPlanPrice,
                  style: GoogleFonts.outfit(
                    fontSize: 38,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFFFFB300),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppTheme.accentMint.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppTheme.accentMint.withValues(alpha: 0.4)),
                  ),
                  child: Text(
                    'SAVE 60%',
                    style: GoogleFonts.outfit(
                      fontSize: 11,
                      color: AppTheme.accentMint,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              'One-time payment • Full GATE 2026/27 access • No auto-renewal',
              style: GoogleFonts.outfit(
                fontSize: 11.5,
                color: Colors.white.withValues(alpha: 0.65),
              ),
            ),
          ],
        ],
      ),
    );
  }

  // ✨ Special "All New Features Included" Card (User Requested Highlight)
  Widget _buildAllNewFeaturesCard({required bool isDark}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: isDark
              ? [
                  const Color(0xFF261942),
                  const Color(0xFF1B1838),
                ]
              : [
                  const Color(0xFFFAF5FF),
                  const Color(0xFFF3E8FF),
                ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(
          color: const Color(0xFF8B5CF6).withValues(alpha: isDark ? 0.4 : 0.3),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF8B5CF6).withValues(alpha: isDark ? 0.15 : 0.08),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF8B5CF6), Color(0xFFD946EF)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.auto_awesome_rounded, size: 14, color: Colors.white),
                    const SizedBox(width: 5),
                    Text(
                      'LIFETIME UPGRADE PROMISE',
                      style: GoogleFonts.outfit(
                        color: Colors.white,
                        fontSize: 10.5,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFF10B981).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '₹0 EXTRA FOREVER',
                  style: GoogleFonts.outfit(
                    color: const Color(0xFF10B981),
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'All New Features Included Automatically',
            style: GoogleFonts.outfit(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: context.textColor,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Upgrade once today, and you are locked in forever. Every single future feature, mock test, question pool addition, and AI tool added to GateX will be automatically unlocked on your account with zero recurring fees.',
            style: GoogleFonts.outfit(
              fontSize: 12.5,
              color: context.textSecondaryColor,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildFeaturePill(icon: Icons.psychology_rounded, label: 'Upcoming AI Roadmap Generator'),
              _buildFeaturePill(icon: Icons.assignment_rounded, label: 'Fresh 2027 Mock Test Series'),
              _buildFeaturePill(icon: Icons.analytics_rounded, label: 'Advanced Percentile Analytics'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturePill({required IconData icon, required String label}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFF8B5CF6).withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF8B5CF6).withValues(alpha: 0.25)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: const Color(0xFF8B5CF6)),
          const SizedBox(width: 5),
          Text(
            label,
            style: GoogleFonts.outfit(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF8B5CF6),
            ),
          ),
        ],
      ),
    );
  }

  // Perk Card
  Widget _buildPerkCard({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String badgeText,
    required Color badgeColor,
    required String title,
    required String description,
  }) {
    final isDark = context.isDarkMode;

    return NeuContainer(
      borderRadius: 18,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: iconColor.withValues(alpha: 0.25)),
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: GoogleFonts.outfit(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: context.textColor,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
                      decoration: BoxDecoration(
                        color: badgeColor.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        badgeText,
                        style: GoogleFonts.outfit(
                          fontSize: 9.5,
                          fontWeight: FontWeight.bold,
                          color: badgeColor,
                          letterSpacing: 0.4,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: GoogleFonts.outfit(
                    fontSize: 12,
                    color: isDark ? Colors.white70 : const Color(0xFF5F5F6E),
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Row in the Comparison Matrix
  Widget _buildComparisonRow({
    required BuildContext context,
    required String feature,
    required String freeText,
    required String proText,
    required bool freeCheck,
    required bool proCheck,
    bool highlight = false,
    bool isLast = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: highlight ? const Color(0xFFFFB300).withValues(alpha: 0.05) : Colors.transparent,
        borderRadius: isLast ? const BorderRadius.vertical(bottom: Radius.circular(18)) : null,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Text(
              feature,
              style: GoogleFonts.outfit(
                fontSize: 12,
                fontWeight: highlight ? FontWeight.bold : FontWeight.w500,
                color: context.textColor,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  freeCheck ? Icons.check_circle_rounded : Icons.cancel_rounded,
                  size: 14,
                  color: freeCheck ? AppTheme.accentMint : Colors.grey.shade500,
                ),
                const SizedBox(width: 4),
                Text(
                  freeText,
                  style: GoogleFonts.outfit(
                    fontSize: 10.5,
                    color: freeCheck ? context.textColor : AppTheme.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_circle_rounded,
                  size: 14,
                  color: Color(0xFFFFB300),
                ),
                const SizedBox(width: 4),
                Text(
                  proText,
                  style: GoogleFonts.outfit(
                    fontSize: 10.5,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFFFB300),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // FAQ Item Accordion
  Widget _buildFaqItem({
    required BuildContext context,
    required int index,
    required String question,
    required String answer,
    bool isLast = false,
  }) {
    final isExpanded = _faqExpanded[index];

    return InkWell(
      onTap: () {
        setState(() {
          _faqExpanded[index] = !_faqExpanded[index];
        });
      },
      borderRadius: isLast ? const BorderRadius.vertical(bottom: Radius.circular(16)) : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    question,
                    style: GoogleFonts.outfit(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: context.textColor,
                    ),
                  ),
                ),
                Icon(
                  isExpanded ? Icons.expand_less_rounded : Icons.expand_more_rounded,
                  color: AppTheme.textSecondary,
                  size: 20,
                ),
              ],
            ),
            if (isExpanded) ...[
              const SizedBox(height: 8),
              Text(
                answer,
                style: GoogleFonts.outfit(
                  fontSize: 12,
                  color: context.textSecondaryColor,
                  height: 1.45,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  // 7. FIXED STICKY BOTTOM CALL-TO-ACTION (CTA) BAR
  Widget _buildBottomCtaBar({required bool isPro, required bool isDark}) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF16151E) : Colors.white,
        border: Border(
          top: BorderSide(
            color: isDark ? Colors.white10 : const Color(0xFFE5E5EA),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.4 : 0.08),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      padding: EdgeInsets.fromLTRB(
        20,
        14,
        20,
        14 + MediaQuery.of(context).padding.bottom,
      ),
      child: SafeArea(
        top: false,
        bottom: false,
        child: isPro
            ? NeuButton(
                isPrimary: false,
                onPressed: () => Navigator.pop(context),
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.verified_rounded, color: AppTheme.accentMint, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'GateX Pro Pass Active — Back to Studies',
                      style: GoogleFonts.outfit(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: AppTheme.accentMint,
                      ),
                    ),
                  ],
                ),
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Main Action Button
                  InkWell(
                    onTap: _isProcessing ? null : _handlePurchase,
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      height: 54,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFFFB300),
                            Color(0xFFF59E0B),
                            Color(0xFFD97706),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFFFB300).withValues(alpha: 0.35),
                            blurRadius: 12,
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
                                  color: Colors.black,
                                ),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.workspace_premium_rounded,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'UPGRADE TO GATEX PRO — ₹199',
                                    style: GoogleFonts.outfit(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      letterSpacing: 0.6,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  const Icon(
                                    Icons.arrow_forward_rounded,
                                    color: Colors.black,
                                    size: 18,
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Trust & Guarantee Micro-copy
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.lock_outline_rounded, size: 12, color: AppTheme.textSecondary),
                      const SizedBox(width: 4),
                      Text(
                        '100% Secure • Single Payment • All Future Updates Included',
                        style: GoogleFonts.outfit(
                          fontSize: 11,
                          color: AppTheme.textSecondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
