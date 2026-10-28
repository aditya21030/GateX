import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/models.dart';
import '../theme/app_theme.dart';
import '../widgets/neu_widgets.dart';
import 'mock_test_runner_screen.dart';

class MockInstructionsScreen extends StatefulWidget {
  final List<PYQ> questions;
  final Duration duration;
  final String testName;
  final bool isMidExamReview;

  const MockInstructionsScreen({
    super.key,
    required this.questions,
    required this.duration,
    required this.testName,
    this.isMidExamReview = false,
  });

  @override
  State<MockInstructionsScreen> createState() => _MockInstructionsScreenState();
}

class _MockInstructionsScreenState extends State<MockInstructionsScreen> {
  bool _agreedToDeclaration = true;

  bool get _isFullMock => widget.questions.length >= 65;

  int get _totalMarks {
    if (_isFullMock) return 100;
    return widget.questions.length;
  }

  void _startExam() {
    HapticFeedback.mediumImpact();
    if (widget.isMidExamReview) {
      Navigator.pop(context);
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MockTestRunnerScreen(
          questions: widget.questions,
          duration: widget.duration,
          testName: widget.testName,
        ),
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.isMidExamReview ? 'Exam Instructions' : 'CBT Test Guidelines',
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: context.textColor,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 14, top: 12, bottom: 12),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            decoration: BoxDecoration(
              color: AppTheme.accentPurple.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppTheme.accentPurple.withValues(alpha: 0.3)),
            ),
            child: Center(
              child: Text(
                _isFullMock ? 'FULL CBT' : 'PRACTICE',
                style: GoogleFonts.outfit(
                  color: AppTheme.accentPurple,
                  fontSize: 10.5,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            children: [
              // Scrollable Guidelines Content
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
                  children: [
                    // 1. Hero Test Header Card
                    _buildHeroHeader(context),
                    const SizedBox(height: 16),

                    // 2. Sectional Structure (if full mock)
                    if (_isFullMock) ...[
                      _buildSectionalBreakdown(context),
                      const SizedBox(height: 16),
                    ],

                    // 3. Question Types & Scoring Rules
                    _buildScoringRules(context),
                    const SizedBox(height: 16),

                    // 4. TCS iON Question Palette Legend
                    _buildPaletteLegend(context),
                    const SizedBox(height: 16),

                    // 5. Key CBT Exam Regulations
                    _buildExamRegulations(context),
                    const SizedBox(height: 16),

                    // 6. Candidate Declaration Checkbox (only on pre-test)
                    if (!widget.isMidExamReview) ...[
                      _buildCandidateDeclaration(context),
                      const SizedBox(height: 12),
                    ],
                  ],
                ),
              ),

              // Sticky Bottom Action Bar
              _buildBottomBar(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeroHeader(BuildContext context) {
    return NeuContainer(
      padding: const EdgeInsets.all(16),
      borderRadius: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF8522), Color(0xFFFF5722)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFFF8522).withValues(alpha: 0.35),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: const Icon(Icons.school_rounded, color: Colors.white, size: 22),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.testName,
                      style: GoogleFonts.outfit(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: context.textColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Official GATE Standard Simulation • TCS iON CBT Mode',
                      style: TextStyle(
                        fontSize: 11.5,
                        color: context.textSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 4 Metric Badges
          Row(
            children: [
              Expanded(
                child: _buildMetricTile(
                  context,
                  icon: Icons.timer_outlined,
                  color: AppTheme.accentPurple,
                  title: '${widget.duration.inMinutes} Mins',
                  label: 'Duration',
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildMetricTile(
                  context,
                  icon: Icons.help_outline_rounded,
                  color: AppTheme.accentMint,
                  title: '${widget.questions.length} Qs',
                  label: 'Questions',
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildMetricTile(
                  context,
                  icon: Icons.emoji_events_outlined,
                  color: AppTheme.accentGold,
                  title: '$_totalMarks M',
                  label: 'Max Marks',
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildMetricTile(
                  context,
                  icon: Icons.cancel_outlined,
                  color: AppTheme.accentCoral,
                  title: '-1/3 MCQ',
                  label: 'Negative',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricTile(
    BuildContext context, {
    required IconData icon,
    required Color color,
    required String title,
    required String label,
  }) {
    final isDark = context.isDarkMode;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withValues(alpha: 0.04) : Colors.black.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withValues(alpha: 0.2),
          width: 0.8,
        ),
      ),
      child: Column(
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(height: 4),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              title,
              style: GoogleFonts.outfit(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: context.textColor,
              ),
              maxLines: 1,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: context.textSecondaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionalBreakdown(BuildContext context) {
    return NeuContainer(
      padding: const EdgeInsets.all(16),
      borderRadius: 18,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.dashboard_outlined, size: 18, color: AppTheme.accentPurple),
              const SizedBox(width: 8),
              Text(
                'Sectional Paper Structure',
                style: GoogleFonts.outfit(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: context.textColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildSectionRow(
            context,
            sectionNum: '1',
            title: 'General Aptitude (GA)',
            range: 'Q. 1 to 10',
            marks: '15 Marks',
            breakdown: '5 Qs × 1 Mark  •  5 Qs × 2 Marks',
            color: const Color(0xFF3B82F6),
          ),
          const SizedBox(height: 10),
          _buildSectionRow(
            context,
            sectionNum: '2',
            title: 'Core Discipline / Technical',
            range: 'Q. 11 to 65',
            marks: '85 Marks',
            breakdown: '25 Qs × 1 Mark  •  30 Qs × 2 Marks',
            color: const Color(0xFF10B981),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionRow(
    BuildContext context, {
    required String sectionNum,
    required String title,
    required String range,
    required String marks,
    required String breakdown,
    required Color color,
  }) {
    final isDark = context.isDarkMode;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withValues(alpha: 0.03) : Colors.black.withValues(alpha: 0.02),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'Sec $sectionNum',
                  style: GoogleFonts.outfit(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.outfit(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: context.textColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: color.withValues(alpha: 0.3)),
                ),
                child: Text(
                  marks,
                  style: GoogleFonts.outfit(
                    fontSize: 11.5,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 4,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  range,
                  style: GoogleFonts.outfit(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: context.textColor,
                  ),
                ),
              ),
              Text(
                breakdown,
                style: TextStyle(
                  fontSize: 11,
                  color: context.textSecondaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildScoringRules(BuildContext context) {
    return NeuContainer(
      padding: const EdgeInsets.all(16),
      borderRadius: 18,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.rule_rounded, size: 18, color: AppTheme.accentGold),
              const SizedBox(width: 8),
              Text(
                'Question Types & Marking Rules',
                style: GoogleFonts.outfit(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: context.textColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildRuleItem(
            context,
            badge: 'MCQ',
            badgeColor: AppTheme.accentGold,
            title: 'Multiple Choice Questions (Single Option Correct)',
            description: '4 choices provided. Exactly 1 choice is correct.\n'
                '• 1-Mark Qs: +1 for correct, -1/3 (-0.33) for wrong.\n'
                '• 2-Mark Qs: +2 for correct, -2/3 (-0.67) for wrong.\n'
                '• Unattempted: 0 marks.',
          ),
          const SizedBox(height: 10),
          _buildRuleItem(
            context,
            badge: 'MSQ',
            badgeColor: AppTheme.accentCoral,
            title: 'Multiple Select Questions (One or More Correct)',
            description: '1, 2, 3, or all 4 choices may be correct.\n'
                '• Full marks only if ALL correct choices are chosen and NO wrong choices.\n'
                '• Zero partial marks.\n'
                '• NO NEGATIVE MARKING (0 deduction for incorrect choices).',
          ),
          const SizedBox(height: 10),
          _buildRuleItem(
            context,
            badge: 'NAT',
            badgeColor: AppTheme.accentMint,
            title: 'Numerical Answer Type (Keypad Input)',
            description: 'Enter real numerical answer using on-screen virtual keypad.\n'
                '• Evaluated within official tolerance range.\n'
                '• NO NEGATIVE MARKING (0 deduction for incorrect answers).',
          ),
        ],
      ),
    );
  }

  Widget _buildRuleItem(
    BuildContext context, {
    required String badge,
    required Color badgeColor,
    required String title,
    required String description,
  }) {
    final isDark = context.isDarkMode;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withValues(alpha: 0.03) : Colors.black.withValues(alpha: 0.02),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.06),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
                decoration: BoxDecoration(
                  color: badgeColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  badge,
                  style: GoogleFonts.outfit(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: badgeColor,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.outfit(
                    fontSize: 12.5,
                    fontWeight: FontWeight.bold,
                    color: context.textColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            description,
            style: TextStyle(
              fontSize: 11.5,
              color: context.textSecondaryColor,
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaletteLegend(BuildContext context) {
    return NeuContainer(
      padding: const EdgeInsets.all(16),
      borderRadius: 18,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.palette_outlined, size: 18, color: Color(0xFFAB47BC)),
              const SizedBox(width: 8),
              Text(
                'TCS iON CBT Question Palette',
                style: GoogleFonts.outfit(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: context.textColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildPaletteRow(
            color: AppTheme.accentMint,
            shape: 'square',
            label: 'Answered',
            detail: 'You have answered the question. Evaluated for marks.',
          ),
          const SizedBox(height: 8),
          _buildPaletteRow(
            color: AppTheme.accentCoral,
            shape: 'square',
            label: 'Not Answered',
            detail: 'You have visited the question but have not answered it yet.',
          ),
          const SizedBox(height: 8),
          _buildPaletteRow(
            color: const Color(0xFFAB47BC),
            shape: 'circle',
            label: 'Marked for Review',
            detail: 'Flagged for review. Will NOT be evaluated unless answered.',
          ),
          const SizedBox(height: 8),
          _buildPaletteRow(
            color: const Color(0xFFAB47BC),
            shape: 'circle_green_dot',
            label: 'Ans & Marked for Review',
            detail: 'CRITICAL: Evaluated for grading even if unvisited again.',
          ),
          const SizedBox(height: 8),
          _buildPaletteRow(
            color: context.colorSurface,
            shape: 'border_square',
            label: 'Not Visited',
            detail: 'You have not yet navigated to this question.',
          ),
        ],
      ),
    );
  }

  Widget _buildPaletteRow({
    required Color color,
    required String shape,
    required String label,
    required String detail,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: _renderPaletteSymbol(color, shape),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.outfit(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: context.textColor,
                ),
              ),
              Text(
                detail,
                style: TextStyle(
                  fontSize: 11,
                  color: context.textSecondaryColor,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _renderPaletteSymbol(Color color, String shape) {
    if (shape == 'circle') {
      return Container(
        width: 18,
        height: 18,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      );
    }
    if (shape == 'circle_green_dot') {
      return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 7,
              height: 7,
              decoration: BoxDecoration(
                color: AppTheme.accentMint,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1),
              ),
            ),
          ),
        ],
      );
    }
    if (shape == 'border_square') {
      return Container(
        width: 18,
        height: 18,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: context.isDarkMode ? Colors.white24 : Colors.black26, width: 1.2),
        ),
      );
    }
    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget _buildExamRegulations(BuildContext context) {
    return NeuContainer(
      padding: const EdgeInsets.all(16),
      borderRadius: 18,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.info_outline_rounded, size: 18, color: Color(0xFF00B4D8)),
              const SizedBox(width: 8),
              Text(
                'Essential Exam Regulations & Tools',
                style: GoogleFonts.outfit(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: context.textColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildTipLine(
            context,
            icon: Icons.calculate_outlined,
            title: 'Virtual Calculator',
            body: 'Access the built-in GATE Scientific Calculator anytime from the top bar.',
          ),
          const SizedBox(height: 8),
          _buildTipLine(
            context,
            icon: Icons.flag_outlined,
            title: 'Question Reporting',
            body: 'Encounter a typo or dispute? Tap the flag icon on any question to report it to academic moderators.',
          ),
          const SizedBox(height: 8),
          _buildTipLine(
            context,
            icon: Icons.save_outlined,
            title: 'Auto-Save & Wall-Clock Timer',
            body: 'All answers are saved locally immediately. Timer auto-submits when 00:00 is reached.',
          ),
          const SizedBox(height: 8),
          _buildTipLine(
            context,
            icon: Icons.do_not_disturb_on_outlined,
            title: 'Distraction-Free Mode',
            body: 'Turn on Do Not Disturb (DND) on your device for uninterrupted 3-hour focus.',
          ),
        ],
      ),
    );
  }

  Widget _buildTipLine(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String body,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: context.textSecondaryColor),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 11.5, color: context.textColor, height: 1.35),
              children: [
                TextSpan(text: '$title: ', style: const TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: body, style: TextStyle(color: context.textSecondaryColor)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCandidateDeclaration(BuildContext context) {
    return NeuContainer(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      borderRadius: 14,
      child: CheckboxListTile(
        contentPadding: EdgeInsets.zero,
        value: _agreedToDeclaration,
        activeColor: AppTheme.accentPurple,
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (val) {
          HapticFeedback.selectionClick();
          setState(() => _agreedToDeclaration = val ?? false);
        },
        title: Text(
          'I have read and understood all the guidelines above. I declare that I am ready to begin the examination under strict CBT conditions.',
          style: GoogleFonts.outfit(
            fontSize: 11.5,
            fontWeight: FontWeight.w500,
            color: context.textColor,
            height: 1.3,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      decoration: BoxDecoration(
        color: context.colorSurface,
        border: Border(
          top: BorderSide(
            color: context.isDarkMode ? Colors.white.withValues(alpha: 0.08) : Colors.black.withValues(alpha: 0.08),
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: context.textSecondaryColor,
                side: BorderSide(
                  color: context.isDarkMode ? Colors.white24 : Colors.black26,
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: GoogleFonts.outfit(fontSize: 13, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 4,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.accentPurple,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                padding: const EdgeInsets.symmetric(vertical: 14),
                disabledBackgroundColor: context.isDarkMode ? Colors.white12 : Colors.black12,
              ),
              onPressed: (!widget.isMidExamReview && !_agreedToDeclaration) ? null : _startExam,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    widget.isMidExamReview ? Icons.play_arrow_rounded : Icons.bolt_rounded,
                    size: 18,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    widget.isMidExamReview ? 'Resume Examination' : 'Begin Mock Examination',
                    style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
