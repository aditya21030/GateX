import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/models.dart';
import '../services/storage_service.dart';
import '../theme/app_theme.dart';
import 'neu_widgets.dart';

class QuestionReportSheet extends StatefulWidget {
  final PYQ pyq;
  final int questionNumber;
  final String testName;
  final VoidCallback? onReportSubmitted;

  const QuestionReportSheet({
    super.key,
    required this.pyq,
    required this.questionNumber,
    required this.testName,
    this.onReportSubmitted,
  });

  static Future<bool?> show(
    BuildContext context, {
    required PYQ pyq,
    required int questionNumber,
    required String testName,
    VoidCallback? onReportSubmitted,
  }) {
    HapticFeedback.selectionClick();
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => QuestionReportSheet(
        pyq: pyq,
        questionNumber: questionNumber,
        testName: testName,
        onReportSubmitted: onReportSubmitted,
      ),
    );
  }

  @override
  State<QuestionReportSheet> createState() => _QuestionReportSheetState();
}

class _QuestionReportSheetState extends State<QuestionReportSheet> {
  final TextEditingController _detailsController = TextEditingController();
  String _selectedCategory = 'Wrong Answer Key';
  bool _isSubmitting = false;
  late bool _wasPreviouslyReported;

  static const List<Map<String, dynamic>> _issueCategories = [
    {
      'label': 'Wrong Answer Key',
      'icon': Icons.rule_rounded,
      'desc': 'Marked correct option or answer is incorrect',
    },
    {
      'label': 'Typo / Stem Ambiguity',
      'icon': Icons.spellcheck_rounded,
      'desc': 'Spelling, grammatical, or formula symbol error',
    },
    {
      'label': 'Diagram / Image Issue',
      'icon': Icons.broken_image_rounded,
      'desc': 'Diagram missing, cropped, or illegible',
    },
    {
      'label': 'NAT Range / Option Missing',
      'icon': Icons.pin_outlined,
      'desc': 'Acceptable numerical range or key option missing',
    },
    {
      'label': 'Explanation Inaccurate',
      'icon': Icons.menu_book_rounded,
      'desc': 'Step-by-step solution has mistakes or is unclear',
    },
    {
      'label': 'Other Feedback',
      'icon': Icons.help_outline_rounded,
      'desc': 'Any other question discrepancy or feedback',
    },
  ];

  @override
  void initState() {
    super.initState();
    _wasPreviouslyReported = StorageService().isQuestionReported(widget.pyq.id);
  }

  @override
  void dispose() {
    _detailsController.dispose();
    super.dispose();
  }

  Future<void> _submitReport() async {
    HapticFeedback.mediumImpact();
    setState(() => _isSubmitting = true);

    try {
      await StorageService().saveQuestionReport(
        questionId: widget.pyq.id,
        questionText: widget.pyq.questionText,
        testName: widget.testName,
        issueType: _selectedCategory,
        details: _detailsController.text.trim(),
      );

      widget.onReportSubmitted?.call();

      if (mounted) {
        Navigator.pop(context, true);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.check_circle_rounded, color: Colors.white, size: 20),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Thank you! Issue for Question ${widget.questionNumber} submitted for academic review.',
                    style: GoogleFonts.outfit(fontSize: 12.5),
                  ),
                ),
              ],
            ),
            backgroundColor: AppTheme.accentMint,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isSubmitting = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to submit report: $e'),
            backgroundColor: AppTheme.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      decoration: BoxDecoration(
        color: context.colorSurface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      padding: EdgeInsets.fromLTRB(18, 12, 18, 18 + bottomInset),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Drag Handle
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: isDark ? Colors.white24 : Colors.black26,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 14),

            // Header Row
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppTheme.accentCoral.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppTheme.accentCoral.withValues(alpha: 0.25),
                    ),
                  ),
                  child: const Icon(Icons.flag_rounded, color: AppTheme.accentCoral, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Report Question Issue',
                        style: GoogleFonts.outfit(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: context.textColor,
                        ),
                      ),
                      Text(
                        'Question ${widget.questionNumber} • ${widget.pyq.subject} > ${widget.pyq.topic}',
                        style: TextStyle(fontSize: 11.5, color: context.textSecondaryColor),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close_rounded, color: context.textSecondaryColor),
                  onPressed: () => Navigator.pop(context),
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Previously Reported Banner
            if (_wasPreviouslyReported) ...[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFF59E0B).withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFF59E0B).withValues(alpha: 0.3)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.info_outline_rounded, size: 16, color: Color(0xFFF59E0B)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'You have previously reported this question. You can add extra notes below.',
                        style: GoogleFonts.outfit(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFF59E0B),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],

            // Question Snippet Preview Card
            NeuContainer(
              padding: const EdgeInsets.all(12),
              borderRadius: 14,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppTheme.accentPurple.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          widget.pyq.type,
                          style: GoogleFonts.outfit(
                            fontSize: 10.5,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.accentPurple,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        widget.testName,
                        style: TextStyle(
                          fontSize: 11,
                          color: context.textSecondaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.pyq.questionText.trim().replaceAll('\n', ' '),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      color: context.textColor,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // Category Selection Header
            Text(
              'SELECT ISSUE TYPE',
              style: GoogleFonts.outfit(
                color: context.textSecondaryColor,
                fontSize: 10.5,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.1,
              ),
            ),
            const SizedBox(height: 8),

            // Issue Categories Chips
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _issueCategories.map((cat) {
                final label = cat['label'] as String;
                final icon = cat['icon'] as IconData;
                final isSelected = _selectedCategory == label;

                return InkWell(
                  onTap: () {
                    HapticFeedback.selectionClick();
                    setState(() => _selectedCategory = label);
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppTheme.accentCoral
                          : (isDark ? Colors.white.withValues(alpha: 0.05) : Colors.black.withValues(alpha: 0.04)),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isSelected
                            ? AppTheme.accentCoral
                            : (isDark ? Colors.white12 : Colors.black12),
                      ),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: AppTheme.accentCoral.withValues(alpha: 0.35),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ]
                          : null,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          icon,
                          size: 14,
                          color: isSelected ? Colors.white : context.textSecondaryColor,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          label,
                          style: GoogleFonts.outfit(
                            fontSize: 11.5,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                            color: isSelected ? Colors.white : context.textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),

            // Additional Details Input
            Text(
              'ADDITIONAL DETAILS (OPTIONAL)',
              style: GoogleFonts.outfit(
                color: context.textSecondaryColor,
                fontSize: 10.5,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.1,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _detailsController,
              maxLines: 3,
              style: TextStyle(fontSize: 12.5, color: context.textColor),
              decoration: InputDecoration(
                hintText: 'e.g. Correct answer should be option C because...',
                hintStyle: TextStyle(fontSize: 12, color: context.textSecondaryColor.withValues(alpha: 0.6)),
                filled: true,
                fillColor: isDark ? const Color(0xFF14151D) : const Color(0xFFF8F9FA),
                contentPadding: const EdgeInsets.all(12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: context.colorBorder),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: isDark ? Colors.white12 : Colors.black12,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppTheme.accentCoral),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Academic Review Footnote
            Row(
              children: [
                Icon(Icons.shield_outlined, size: 14, color: context.textSecondaryColor),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    'Reports are reviewed by academic moderators to maintain GATE syllabus accuracy.',
                    style: TextStyle(
                      fontSize: 10.5,
                      color: context.textSecondaryColor,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Action Buttons Row
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: context.textSecondaryColor,
                      side: BorderSide(color: isDark ? Colors.white24 : Colors.black26),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancel', style: GoogleFonts.outfit(fontWeight: FontWeight.w600)),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.accentCoral,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: _isSubmitting ? null : _submitReport,
                    child: _isSubmitting
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.send_rounded, size: 15),
                              const SizedBox(width: 6),
                              Text(
                                'Submit Report',
                                style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 13),
                              ),
                            ],
                          ),
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
