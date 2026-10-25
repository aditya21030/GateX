import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/neu_widgets.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({super.key});

  @override
  State<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  bool _isNotified = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorBackground,
      appBar: AppBar(
        backgroundColor: context.colorSurface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: context.textColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'GateX Leaderboard',
          style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 18, color: context.textColor),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            children: [
              // Hero Coming Soon Container
              NeuContainer(
                borderRadius: 24,
                padding: const EdgeInsets.all(22),
                child: Column(
                  children: [
                    // Top Badge: COMING SOON
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(
                        color: AppTheme.accentGold.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppTheme.accentGold.withValues(alpha: 0.35),
                          width: 1.2,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 7,
                            height: 7,
                            decoration: const BoxDecoration(
                              color: AppTheme.accentGold,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'LAUNCHING IN PHASE 2 • COMING SOON',
                            style: GoogleFonts.outfit(
                              color: AppTheme.accentGold,
                              fontSize: 10.5,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.8,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Glowing 3D Trophy Icon Tile
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppTheme.accentGold.withValues(alpha: 0.25),
                            AppTheme.accentPurple.withValues(alpha: 0.15),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.accentGold.withValues(alpha: 0.25),
                            blurRadius: 24,
                            spreadRadius: 2,
                            offset: const Offset(0, 6),
                          ),
                        ],
                        border: Border.all(
                          color: AppTheme.accentGold.withValues(alpha: 0.4),
                          width: 2,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.emoji_events_rounded,
                          size: 46,
                          color: AppTheme.accentGold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),

                    // Title
                    Text(
                      'All-India Live Leaderboard',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.outfit(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: context.textColor,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Subtitle
                    Text(
                      'Real-time national percentile rankings, weekly speed battles, and live IIT cutoff probability will unlock for all GATE DA & CSIT aspirants.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.outfit(
                        fontSize: 13,
                        color: context.textSecondaryColor,
                        height: 1.45,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Notify Me Action Button
                    NeuButton(
                      isPrimary: !_isNotified,
                      onPressed: () {
                        HapticFeedback.heavyImpact();
                        setState(() {
                          _isNotified = true;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Row(
                              children: [
                                const Icon(Icons.celebration_rounded, color: Colors.white, size: 20),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    "You're on the priority waitlist! We'll notify you as soon as Phase 2 goes live 🚀",
                                    style: GoogleFonts.outfit(fontSize: 12.5, fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                            backgroundColor: AppTheme.accentPurple,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            duration: const Duration(seconds: 4),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            _isNotified ? Icons.check_circle_rounded : Icons.notifications_active_rounded,
                            size: 18,
                            color: _isNotified ? AppTheme.accentMint : Colors.white,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            _isNotified ? "You're on the Waitlist ✓" : 'Notify Me When Live 🚀',
                            style: GoogleFonts.outfit(
                              fontWeight: FontWeight.bold,
                              fontSize: 13.5,
                              color: _isNotified ? AppTheme.accentMint : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),

              // Features Preview Section Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  "WHAT'S COMING IN LEADERBOARD",
                  style: GoogleFonts.outfit(
                    fontSize: 11.5,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.1,
                    color: context.textSecondaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Feature 1
              _buildFeaturePreviewCard(
                context: context,
                icon: Icons.public_rounded,
                iconColor: AppTheme.accentPurple,
                title: 'Live All-India AIR Engine',
                subtitle: 'Percentile and projected rank benchmarked across thousands of GATE aspirants nationwide.',
              ),
              const SizedBox(height: 10),

              // Feature 2
              _buildFeaturePreviewCard(
                context: context,
                icon: Icons.bolt_rounded,
                iconColor: AppTheme.accentGold,
                title: 'Weekly Branch Sprint Leagues',
                subtitle: 'Compete in 10-minute Rapid Fire contests with DA and CSIT peers for weekly podium titles.',
              ),
              const SizedBox(height: 10),

              // Feature 3
              _buildFeaturePreviewCard(
                context: context,
                icon: Icons.school_rounded,
                iconColor: AppTheme.accentMint,
                title: 'Direct IIT Call Predictor',
                subtitle: 'Live cutoff matching for Old IITs (Bombay, Delhi, Madras, Kanpur, Kharagpur) and IISc.',
              ),
              const SizedBox(height: 10),

              // Feature 4
              _buildFeaturePreviewCard(
                context: context,
                icon: Icons.local_fire_department_rounded,
                iconColor: AppTheme.accentCoral,
                title: 'Study Streak Hall of Fame',
                subtitle: 'Showcase consistency badges, problem-solving streaks, and revision milestones.',
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturePreviewCard({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
  }) {
    return NeuContainer(
      borderRadius: 18,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NeuIconTile(
            icon: icon,
            iconColor: iconColor,
            size: 40,
            iconSize: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 13.5, color: context.textColor),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: GoogleFonts.outfit(fontSize: 11.5, color: context.textSecondaryColor, height: 1.35),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}
