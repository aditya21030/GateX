import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final List<bool> _faqExpanded = [false, false, false];

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
          content: Text('🎉 Welcome to GateX Pro! All perks unlocked.'),
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
      backgroundColor: context.scaffoldBackground,
      appBar: AppBar(
        title: const Text('GateX Pro'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 580),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 1. HERO HEADER WITH NEUMORPHIC GLOW & PRICING
                NeuContainer(
                  borderRadius: 24,
                  padding: const EdgeInsets.all(22),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2E1A47), Color(0xFF1E1335), Color(0xFF130B22)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFB300).withValues(alpha: 0.18),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: const Color(0xFFFFB300).withValues(alpha: 0.4)),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.workspace_premium_rounded, size: 15, color: Color(0xFFFFB300)),
                            SizedBox(width: 6),
                            Text(
                              'GATEX PRO SEASON PASS',
                              style: TextStyle(
                                color: Color(0xFFFFB300),
                                fontSize: 10.5,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        isPro ? 'GateX Pro Active 🌟' : 'Peak GATE 2027 Mastery',
                        textAlign: TextAlign.center,
                        style: AppTheme.poppinsBold(fontSize: 22, color: Colors.white),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        isPro
                            ? 'All 10 full-length CBT mocks, error drills & printable sheets unlocked.'
                            : '100% Ad-Free • 10 CBT Mocks • Unlimited Error Drills',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withValues(alpha: 0.8),
                          height: 1.35,
                        ),
                      ),
                      if (!isPro) ...[
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              PurchaseService.proPlanOldPrice,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white.withValues(alpha: 0.4),
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              PurchaseService.proPlanPrice,
                              style: const TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFFB300),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'one-time',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white.withValues(alpha: 0.7),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Valid for entire GATE 2027 • Zero recurring fees',
                          style: TextStyle(fontSize: 11, color: Colors.white.withValues(alpha: 0.6)),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 22),

                // 2. FREE VS PRO COMPARISON MATRIX
                Text(
                  'PLAN COMPARISON',
                  style: TextStyle(
                    color: context.textSecondaryColor,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 10),

                NeuContainer(
                  borderRadius: 20,
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      // Header Row
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: context.colorSurfaceElevated,
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Text(
                                'Features',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: context.textColor,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Free',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: context.textSecondaryColor,
                                ),
                              ),
                            ),
                            const Expanded(
                              flex: 2,
                              child: Text(
                                'Pro Pass',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Color(0xFFFFB300),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(height: 1, color: context.colorBorder),

                      // Feature Rows
                      _buildComparisonRow(
                        context: context,
                        feature: 'Syllabus & Daily Planner',
                        freeText: 'Yes',
                        proText: 'Yes',
                        freeCheck: true,
                        proCheck: true,
                      ),
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
                        feature: '100% Ad-Free Practice',
                        freeText: 'Ads',
                        proText: 'Zero Ads',
                        freeCheck: false,
                        proCheck: true,
                        highlight: true,
                      ),
                      _buildComparisonRow(
                        context: context,
                        feature: 'TCS iON CBT Full Mocks',
                        freeText: '1 Mock',
                        proText: '10 Mocks',
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
                        feature: 'Printable Formula Sheets',
                        freeText: 'Locked',
                        proText: 'Full Export',
                        freeCheck: false,
                        proCheck: true,
                      ),
                      _buildComparisonRow(
                        context: context,
                        feature: 'Cloud Sync Across Devices',
                        freeText: 'Basic',
                        proText: 'Realtime',
                        freeCheck: true,
                        proCheck: true,
                        isLast: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 22),

                // 3. UNLOCKED PERKS
                Text(
                  'EVERYTHING UNLOCKED IN GATEX PRO',
                  style: TextStyle(
                    color: context.textSecondaryColor,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 10),

                _buildPerkCard(
                  context: context,
                  icon: Icons.block_rounded,
                  iconColor: AppTheme.accentMint,
                  title: '100% Ad-Free Experience',
                  description: 'Zero banner ads, zero video interruptions.',
                ),
                const SizedBox(height: 10),

                _buildPerkCard(
                  context: context,
                  icon: Icons.computer_rounded,
                  iconColor: Colors.blueAccent,
                  title: '10 Full-Length CBT Mocks',
                  description: 'Official TCS iON engine with NAT scientific calculator.',
                ),
                const SizedBox(height: 10),

                _buildPerkCard(
                  context: context,
                  icon: Icons.bolt_rounded,
                  iconColor: AppTheme.accentFlame,
                  title: 'Weak-Area Error Drills',
                  description: '15-question CBT drills targeted at your mistake log.',
                ),
                const SizedBox(height: 10),

                _buildPerkCard(
                  context: context,
                  icon: Icons.picture_as_pdf_rounded,
                  iconColor: AppTheme.accentGold,
                  title: 'Printable Formula Sheets',
                  description: 'High-yield revision cheat sheets and topic tables.',
                ),
                const SizedBox(height: 22),

                // 4. FAQ ACCORDION
                Text(
                  'FREQUENTLY ASKED QUESTIONS',
                  style: TextStyle(
                    color: context.textSecondaryColor,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 10),

                NeuContainer(
                  borderRadius: 20,
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      _buildFaqItem(
                        context: context,
                        index: 0,
                        question: 'Is this a recurring subscription?',
                        answer: 'No. GateX Pro is a single one-time payment of ₹199 with zero recurring fees.',
                      ),
                      Divider(height: 1, color: context.colorBorder),
                      _buildFaqItem(
                        context: context,
                        index: 1,
                        question: 'Are the mock tests patterned on TCS iON?',
                        answer: 'Yes. Features the official GATE CBT calculator, question palette, MSQ, and marking scheme.',
                      ),
                      Divider(height: 1, color: context.colorBorder),
                      _buildFaqItem(
                        context: context,
                        index: 2,
                        question: 'Can I use Pro Pass on multiple devices?',
                        answer: 'Yes! Simply tap "Restore Purchases" or sign in with your email on any Android device.',
                        isLast: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // 5. TRUST BADGE
                NeuContainer(
                  isRecessed: true,
                  borderRadius: 16,
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  child: Row(
                    children: [
                      const Icon(Icons.verified_user_rounded, color: AppTheme.secondary, size: 22),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          '100% Student-First Software. Zero coaching center promotions.',
                          style: TextStyle(fontSize: 11.5, color: context.textColor, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // 6. ACTION BUTTONS
                if (!isPro) ...[
                  NeuButton(
                    isPrimary: true,
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFFB300), Color(0xFFF59E0B)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    onPressed: _isProcessing ? null : _handlePurchase,
                    child: _isProcessing
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(strokeWidth: 2.5, color: Colors.black),
                          )
                        : const Text(
                            'UPGRADE TO GATEX PRO — ₹199',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, letterSpacing: 0.5, color: Colors.black),
                          ),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: _isProcessing ? null : _handleRestore,
                    child: Text(
                      'Already purchased? Restore Purchases',
                      style: TextStyle(color: context.textSecondaryColor, fontSize: 13),
                    ),
                  ),
                ] else ...[
                  NeuButton(
                    isPrimary: false,
                    onPressed: () => Navigator.pop(context),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check_circle_rounded, color: AppTheme.accentMint, size: 20),
                        SizedBox(width: 8),
                        Text(
                          'GateX Pro Pass Active',
                          style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.accentMint),
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
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
        color: highlight ? AppTheme.accentPurple.withValues(alpha: 0.06) : Colors.transparent,
        borderRadius: isLast ? const BorderRadius.vertical(bottom: Radius.circular(18)) : null,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Text(
              feature,
              style: TextStyle(
                fontSize: 12,
                fontWeight: highlight ? FontWeight.bold : FontWeight.normal,
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
                  color: freeCheck ? AppTheme.accentMint : Colors.grey.shade600,
                ),
                const SizedBox(width: 4),
                Text(
                  freeText,
                  style: TextStyle(fontSize: 10, color: freeCheck ? context.textColor : AppTheme.textSecondary),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
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
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFB300),
                  ),
                ),
              ],
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
    required String title,
    required String description,
  }) {
    return NeuContainer(
      borderRadius: 18,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        children: [
          NeuIconTile(icon: icon, iconColor: iconColor, size: 40, iconSize: 20),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5, color: context.textColor),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: TextStyle(fontSize: 11, color: context.textSecondaryColor),
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    question,
                    style: TextStyle(
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
                style: const TextStyle(
                  fontSize: 12,
                  color: AppTheme.textSecondary,
                  height: 1.4,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
