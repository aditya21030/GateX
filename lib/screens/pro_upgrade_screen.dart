import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('GateX Pro'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 580),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 1. HERO HEADER
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF2E1A47), Color(0xFF1A1230), Color(0xFF110D20)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: const Color(0xFFFFB300).withValues(alpha: 0.35),
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFFFB300).withValues(alpha: 0.15),
                        blurRadius: 24,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFB300).withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: const Color(0xFFFFB300).withValues(alpha: 0.5)),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.workspace_premium_rounded, size: 16, color: Color(0xFFFFB300)),
                            SizedBox(width: 6),
                            Text(
                              'GATEX PRO SEASON PASS',
                              style: TextStyle(
                                color: Color(0xFFFFB300),
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        isPro ? 'You are a GateX Pro Member! 🌟' : 'Peak Performance For The Final 90 Days',
                        textAlign: TextAlign.center,
                        style: AppTheme.poppinsBold(fontSize: 22, color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        isPro
                            ? 'Your 2027 Season Pass is fully active. All 10 full-length CBT mocks, error log drills, and printable sheets are unlocked.'
                            : 'Direct-to-student utility. 100% Independent. Zero coaching center promotions.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withValues(alpha: 0.85),
                          height: 1.45,
                        ),
                      ),
                      if (!isPro) ...[
                        const SizedBox(height: 20),
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
                          'Valid for 2027 Exam Season • No recurring fees',
                          style: TextStyle(fontSize: 11, color: Colors.white.withValues(alpha: 0.6)),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // 2. UNLOCKED PERKS LIST
                const Text(
                  'EVERYTHING UNLOCKED IN GATEX PRO',
                  style: TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 12),

                _buildPerkCard(
                  icon: Icons.block_rounded,
                  iconColor: Colors.tealAccent,
                  title: '100% Ad-Free Experience',
                  description: 'Zero banner ads, zero interstitial popups. Pure focus during practice and test taking.',
                ),
                const SizedBox(height: 10),

                _buildPerkCard(
                  icon: Icons.computer_rounded,
                  iconColor: Colors.blueAccent,
                  title: '10 Full-Length All-India CBT Mocks',
                  description: 'Realistic TCS iON GATE exam simulator with high-yield questions and predicted score-to-rank curves.',
                ),
                const SizedBox(height: 10),

                _buildPerkCard(
                  icon: Icons.bolt_rounded,
                  iconColor: Colors.redAccent,
                  title: 'Unlimited Weak-Area Custom Quizzes',
                  description: 'Automatically generate 15-question CBT drills targeted exclusively at your error log mistakes.',
                ),
                const SizedBox(height: 10),

                _buildPerkCard(
                  icon: Icons.picture_as_pdf_rounded,
                  iconColor: Colors.amberAccent,
                  title: 'Printable High-Yield Cheat Sheets',
                  description: 'Download, print, or export comprehensive formula summaries and distribution tables.',
                ),
                const SizedBox(height: 10),

                _buildPerkCard(
                  icon: Icons.cloud_sync_rounded,
                  iconColor: Colors.purpleAccent,
                  title: 'Cross-Device Cloud Sync',
                  description: 'Never lose your streaks, bookmark collection, or solved question history across your devices.',
                ),
                const SizedBox(height: 24),

                // 3. TRUST & INDEPENDENCE BADGE
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppTheme.surface,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.verified_user_rounded, color: AppTheme.secondary, size: 24),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          '100% Student-First Software. We do not sell coaching center courses or promote commercial coaching affiliates.',
                          style: TextStyle(fontSize: 11, color: Colors.white.withValues(alpha: 0.8), height: 1.35),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // 4. CTA BUTTON
                if (!isPro) ...[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFB300),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      elevation: 4,
                    ),
                    onPressed: _isProcessing ? null : _handlePurchase,
                    child: _isProcessing
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(strokeWidth: 2.5, color: Colors.black),
                          )
                        : const Text(
                            'UPGRADE TO GATEX PRO — ₹199',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, letterSpacing: 0.5),
                          ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: _isProcessing ? null : _handleRestore,
                    child: const Text(
                      'Already purchased? Restore Purchases',
                      style: TextStyle(color: AppTheme.textSecondary, fontSize: 13),
                    ),
                  ),
                ] else ...[
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppTheme.success),
                      foregroundColor: AppTheme.success,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                    icon: const Icon(Icons.check_circle_rounded, size: 20),
                    label: const Text('GateX Pro Pass Active', style: TextStyle(fontWeight: FontWeight.bold)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPerkCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(fontSize: 11, color: AppTheme.textSecondary, height: 1.35),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
