import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../widgets/neu_widgets.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  bool _isWaitlistJoined = false;
  final TextEditingController _doubtController = TextEditingController();

  @override
  void dispose() {
    _doubtController.dispose();
    super.dispose();
  }

  Future<void> _openLink(BuildContext context, String url, String title) async {
    HapticFeedback.selectionClick();
    final uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        await Clipboard.setData(ClipboardData(text: url));
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('$title link copied to clipboard!'),
              backgroundColor: AppTheme.accentPurple,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      }
    } catch (_) {
      await Clipboard.setData(ClipboardData(text: url));
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$title link copied to clipboard!'),
            backgroundColor: AppTheme.accentPurple,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  void _shareDoubt(BuildContext context) {
    final text = _doubtController.text.trim();
    if (text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your question or doubt first.'),
          backgroundColor: AppTheme.error,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    final buffer = StringBuffer();
    buffer.writeln('❓ *GATE DA/CSIT Doubt*');
    buffer.writeln('');
    buffer.writeln(text);
    buffer.writeln('');
    buffer.writeln('Posted via GateX Community Hub');

    Share.share(buffer.toString());
    HapticFeedback.mediumImpact();
  }

  void _joinWaitlist() {
    HapticFeedback.heavyImpact();
    setState(() => _isWaitlistJoined = true);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle_rounded, color: Colors.white, size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                'You\'re on the In-App Discussion waitlist! Priority invite arriving in Phase 2.',
                style: GoogleFonts.outfit(fontWeight: FontWeight.w600, fontSize: 13),
              ),
            ),
          ],
        ),
        backgroundColor: AppTheme.accentMint,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: context.scaffoldBackground,
        elevation: 0,
        title: Text(
          'Aspirant Community Hub',
          style: GoogleFonts.outfit(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: context.textColor,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, size: 18, color: context.textColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            children: [
              // 1. HERO BANNER
              _buildHeroCard(context),
              const SizedBox(height: 18),

              // 2. ACTIVE ASPIRANT COMMUNITIES
              Text(
                'JOIN ACTIVE ASPIRANT GROUPS',
                style: GoogleFonts.outfit(
                  color: context.textSecondaryColor,
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.1,
                ),
              ),
              const SizedBox(height: 12),
              _buildCommunityCard(
                context,
                title: 'Official Telegram Discussion Group',
                subtitle: 'Active doubt clearing, daily question sprints, Topper PDFs, and study schedules with 6,000+ GATE DA & CS/IT aspirants.',
                icon: Icons.send_rounded,
                iconColor: const Color(0xFF29B6F6),
                badge: 'Active Now',
                badgeColor: AppTheme.accentMint,
                url: 'https://t.me/gate_da_official',
              ),
              const SizedBox(height: 12),
              _buildCommunityCard(
                context,
                title: 'GateX Aspirants Discord Server',
                subtitle: 'Dedicated voice study rooms, #machine-learning, #linear-algebra, #dsa-coding, and weekend timed mock debriefs.',
                icon: Icons.discord_rounded,
                iconColor: const Color(0xFF5865F2),
                badge: 'Voice & Doubts',
                badgeColor: const Color(0xFF5865F2),
                url: 'https://discord.gg/gatex',
              ),
              const SizedBox(height: 12),
              _buildCommunityCard(
                context,
                title: 'WhatsApp Daily Practice Circles',
                subtitle: '5 curated high-yield questions every morning with peer discussion threads and daily solution keys.',
                icon: Icons.chat_rounded,
                iconColor: const Color(0xFF25D366),
                badge: 'Daily Drills',
                badgeColor: const Color(0xFF25D366),
                url: 'https://chat.whatsapp.com/gatex_study_circle',
              ),
              const SizedBox(height: 12),
              _buildCommunityCard(
                context,
                title: 'Open Source GATE DA Repository',
                subtitle: 'Community-maintained LaTeX solutions, errata discussions, and open formula cheat sheets on GitHub.',
                icon: Icons.code_rounded,
                iconColor: context.isDarkMode ? Colors.white : Colors.black,
                badge: 'Open Source',
                badgeColor: AppTheme.accentPurple,
                url: 'https://github.com/aditya21030/GateX',
              ),
              const SizedBox(height: 22),

              // 3. PHASE 2 IN-APP DISCUSSION ARENA
              _buildPhase2Card(context),
              const SizedBox(height: 22),

              // 4. QUICK DOUBT COMPOSER & SHARE
              _buildDoubtComposer(context),
              const SizedBox(height: 22),

              // 5. FREQUENTLY ASKED EXAM STRATEGIES
              Text(
                'OFFICIAL GATE DA/CS STRATEGY FAQs',
                style: GoogleFonts.outfit(
                  color: context.textSecondaryColor,
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.1,
                ),
              ),
              const SizedBox(height: 12),
              _buildFaqList(context),
              const SizedBox(height: 28),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeroCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: context.isDarkMode
              ? [const Color(0xFF1E1435), const Color(0xFF13141F)]
              : [const Color(0xFFF3E8FF), const Color(0xFFEDE9FE)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: AppTheme.accentPurple.withValues(alpha: 0.3),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppTheme.accentPurple, Color(0xFF8B5CF6)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.accentPurple.withValues(alpha: 0.4),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Icon(Icons.groups_rounded, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Learn With 10,000+ Aspirants',
                  style: GoogleFonts.outfit(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: context.textColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Join real peer study groups on Telegram and Discord for instant doubts, formula discussions, and CBT mock debriefs.',
                  style: GoogleFonts.outfit(
                    fontSize: 12,
                    color: context.textSecondaryColor,
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

  Widget _buildCommunityCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
    required String badge,
    required Color badgeColor,
    required String url,
  }) {
    return NeuContainer(
      borderRadius: 18,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.outfit(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: context.textColor,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: badgeColor.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        badge,
                        style: GoogleFonts.outfit(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: badgeColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: GoogleFonts.outfit(
              fontSize: 12,
              color: context.textSecondaryColor,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.accentPurple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    elevation: 0,
                  ),
                  icon: const Icon(Icons.open_in_new_rounded, size: 16),
                  label: Text('Open & Join', style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 12.5)),
                  onPressed: () => _openLink(context, url, title),
                ),
              ),
              const SizedBox(width: 10),
              IconButton.filledTonal(
                icon: const Icon(Icons.copy_rounded, size: 16),
                tooltip: 'Copy Link',
                onPressed: () async {
                  await Clipboard.setData(ClipboardData(text: url));
                  HapticFeedback.lightImpact();
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('$title link copied!'),
                        backgroundColor: AppTheme.accentPurple,
                        behavior: SnackBarBehavior.floating,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPhase2Card(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.isDarkMode ? const Color(0xFF141522) : Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: AppTheme.accentGold.withValues(alpha: 0.35),
          width: 1.2,
        ),
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppTheme.accentGold.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '🚀 IN-APP FORUM • PHASE 2',
                  style: GoogleFonts.outfit(
                    color: AppTheme.accentGold,
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
              const Icon(Icons.lock_clock_rounded, color: AppTheme.accentGold, size: 18),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Real-Time In-App Peer Doubt Clearing Arena',
            style: GoogleFonts.outfit(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: context.textColor,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'We are building a seamless in-app doubt resolution engine featuring LaTeX math formulas, screenshot sharing, and answers verified by AIR < 100 IIT mentors.',
            style: GoogleFonts.outfit(
              fontSize: 12.5,
              color: context.textSecondaryColor,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: _isWaitlistJoined ? AppTheme.accentMint : AppTheme.accentGold,
                foregroundColor: _isWaitlistJoined ? Colors.white : Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                elevation: 0,
              ),
              icon: Icon(_isWaitlistJoined ? Icons.check_circle_rounded : Icons.notifications_active_rounded, size: 18),
              label: Text(
                _isWaitlistJoined ? 'Priority Waitlist Joined ✓' : 'Notify Me When In-App Forum Launches',
                style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              onPressed: _isWaitlistJoined ? null : _joinWaitlist,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDoubtComposer(BuildContext context) {
    return NeuContainer(
      borderRadius: 18,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const NeuIconTile(
                icon: Icons.edit_note_rounded,
                iconColor: AppTheme.accentPurple,
                size: 36,
                iconSize: 20,
              ),
              const SizedBox(width: 10),
              Text(
                'Post a Doubt to Community',
                style: GoogleFonts.outfit(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: context.textColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Type your question, paste equations, and share it directly with fellow aspirants across our active channels.',
            style: GoogleFonts.outfit(
              fontSize: 12,
              color: context.textSecondaryColor,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: context.colorSurfaceElevated,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: context.colorBorder),
            ),
            child: TextField(
              controller: _doubtController,
              maxLines: 3,
              style: TextStyle(color: context.textColor, fontSize: 13),
              decoration: InputDecoration(
                hintText: 'e.g., In Bayes theorem question from 2024 DA, why is P(B|A) different from P(A|B)?',
                hintStyle: TextStyle(color: context.textSecondaryColor, fontSize: 12),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: AppTheme.accentPurple,
                side: BorderSide(color: AppTheme.accentPurple.withValues(alpha: 0.5)),
                padding: const EdgeInsets.symmetric(vertical: 11),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              icon: const Icon(Icons.share_rounded, size: 16),
              label: Text(
                'Format & Share to Groups',
                style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              onPressed: () => _shareDoubt(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFaqList(BuildContext context) {
    final faqs = [
      (
        q: 'Is there negative marking in MSQ and NAT questions?',
        a: 'No! According to official GATE guidelines, MSQ (Multiple Select Questions) and NAT (Numerical Answer Type) have ZERO negative marking. For MCQs, 1-mark questions deduct 1/3 mark, and 2-mark questions deduct 2/3 mark.',
      ),
      (
        q: 'How is the GATE DA score calculated out of 1000?',
        a: 'The official GATE score is calculated based on a normalized formula that maps raw marks using the mean and standard deviation of top 0.1% candidates and all qualifying candidates across the paper.',
      ),
      (
        q: 'What is the recommended time allocation for the 65 CBT questions?',
        a: 'Round 1 (0-75 min): Solve high-confidence 1-mark questions and General Aptitude. Round 2 (75-150 min): Tackle complex 2-mark problems and derivations. Round 3 (150-180 min): Revisit flagged questions and verify NAT rounding.',
      ),
      (
        q: 'Can non-CS students take GATE Data Science & AI (DA)?',
        a: 'Yes! Candidates with a Bachelor\'s degree in any branch of Engineering/Technology or Master\'s in Science/Mathematics/Statistics/Computer Applications are fully eligible.',
      ),
    ];

    return Column(
      children: faqs.map((faq) {
        return NeuContainer(
          margin: const EdgeInsets.only(bottom: 10),
          borderRadius: 16,
          padding: const EdgeInsets.all(14),
          child: ExpansionTile(
            tilePadding: EdgeInsets.zero,
            childrenPadding: const EdgeInsets.only(top: 8),
            title: Text(
              faq.q,
              style: GoogleFonts.outfit(
                fontWeight: FontWeight.w600,
                fontSize: 13,
                color: context.textColor,
              ),
            ),
            children: [
              Text(
                faq.a,
                style: GoogleFonts.outfit(
                  fontSize: 12,
                  color: context.textSecondaryColor,
                  height: 1.45,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
