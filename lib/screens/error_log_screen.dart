import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import '../providers/app_provider.dart';
import '../services/storage_service.dart';
import '../theme/app_theme.dart';
import 'mock_test_runner_screen.dart';
import '../widgets/neu_widgets.dart';

class ErrorLogScreen extends StatefulWidget {
  const ErrorLogScreen({super.key});

  @override
  State<ErrorLogScreen> createState() => _ErrorLogScreenState();
}

class _ErrorLogScreenState extends State<ErrorLogScreen> {
  String _selectedSubjectFilter = 'All';
  String _selectedTagFilter = 'All';

  static const List<Map<String, String>> taxonomyTags = [
    {'name': 'All', 'label': 'All Mistakes', 'icon': '🎯'},
    {'name': 'Conceptual Gap', 'label': 'Conceptual Gap', 'icon': '🧠'},
    {'name': 'Calculation Error', 'label': 'Calculation Error', 'icon': '📐'},
    {'name': 'Silly Mistake', 'label': 'Silly Mistake', 'icon': '🤦‍♂️'},
    {'name': 'Formula Slip', 'label': 'Formula Slip', 'icon': '📝'},
    {'name': 'Time Pressure', 'label': 'Time Pressure', 'icon': '⏳'},
  ];

  Color _getTagColor(String tag) {
    if (tag.contains('Conceptual')) return AppTheme.primary;
    if (tag.contains('Calculation')) return Colors.orangeAccent;
    if (tag.contains('Silly')) return Colors.amber;
    if (tag.contains('Formula')) return const Color(0xFFBA68C8);
    if (tag.contains('Time')) return AppTheme.error;
    return AppTheme.secondary;
  }

  String? _detectTagInText(String text) {
    for (var tag in taxonomyTags) {
      if (tag['name'] != 'All' && text.toLowerCase().contains(tag['name']!.toLowerCase())) {
        return tag['name'];
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final errorEntries = provider.errorLog;

    // Distinct subjects list for filters
    final filterSubjects = ['All', ...StorageService.syllabusData.keys];

    // Filter items by Subject and Taxonomy Tag
    final filteredEntries = errorEntries.where((e) {
      final matchesSubject = _selectedSubjectFilter == 'All' || e.subject == _selectedSubjectFilter;
      final matchesTag = _selectedTagFilter == 'All' ||
          e.whyWrong.toLowerCase().contains(_selectedTagFilter.toLowerCase());
      return matchesSubject && matchesTag;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mistake Notebook'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_rounded, size: 20),
            tooltip: 'Export Mistake Notebook',
            onPressed: () {
              if (errorEntries.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('No mistakes recorded to export yet.')),
                );
                return;
              }
              final buffer = StringBuffer();
              buffer.writeln('# GateX Personal Mistake Notebook');
              buffer.writeln('Generated: ${DateFormat('yyyy-MM-dd').format(DateTime.now())}');
              buffer.writeln('Total Recorded Mistakes: ${errorEntries.length}\n');
              for (int i = 0; i < errorEntries.length; i++) {
                final e = errorEntries[i];
                buffer.writeln('## ${i + 1}. [${e.subject}] ${e.topic}');
                buffer.writeln('**Question:** ${e.questionText}');
                if (e.whyWrong.isNotEmpty) {
                  buffer.writeln('**Root Cause:** ${e.whyWrong}');
                }
                buffer.writeln('---\n');
              }
              Share.share(buffer.toString(), subject: 'GateX Mistake Notebook');
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Practice Mistakes Action Banner
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: NeuContainer(
              borderRadius: 20,
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  const NeuIconTile(
                    icon: Icons.bolt_rounded,
                    iconColor: AppTheme.accentFlame,
                    size: 42,
                    iconSize: 22,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mistakes CBT Drill',
                          style: AppTheme.poppinsBold(fontSize: 14, color: context.textColor),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          filteredEntries.isEmpty
                              ? 'Log mistakes to generate drills'
                              : '${filteredEntries.length} logged mistake${filteredEntries.length > 1 ? "s" : ""} ready',
                          style: TextStyle(color: context.textSecondaryColor, fontSize: 11.5),
                        ),
                      ],
                    ),
                  ),
                  NeuButton(
                    isPrimary: true,
                    borderRadius: 14,
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    onPressed: () {
                      final quizQuestions = provider.generateMistakesQuiz(
                        subjectFilter: _selectedSubjectFilter,
                      );
                      if (quizQuestions.isEmpty) {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('No mistake entries found for this filter.'),
                            backgroundColor: AppTheme.warning,
                            duration: Duration(seconds: 2),
                          ),
                        );
                        return;
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MockTestRunnerScreen(
                            questions: quizQuestions,
                            duration: Duration(minutes: quizQuestions.length * 3),
                            testName: _selectedSubjectFilter == 'All'
                                ? 'Mistakes Drill'
                                : '$_selectedSubjectFilter Mistakes',
                          ),
                        ),
                      );
                    },
                    child: const Text('Start ⚡', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                  ),
                ],
              ),
            ),
          ),

          // 1. Taxonomy Tag Filter Strip
          Container(
            height: 36,
            margin: const EdgeInsets.only(top: 4, bottom: 4),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 14),
              itemCount: taxonomyTags.length,
              itemBuilder: (context, index) {
                final tag = taxonomyTags[index];
                final isSelected = _selectedTagFilter == tag['name'];
                final icon = tag['icon']!;
                final label = tag['label']!;
                final tagColor = _getTagColor(tag['name']!);

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _selectedTagFilter = tag['name']!;
                      });
                    },
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: isSelected ? tagColor.withValues(alpha: 0.2) : context.surfaceColor,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: isSelected ? tagColor : Colors.white.withValues(alpha: 0.08),
                          width: isSelected ? 1.5 : 1.0,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(icon, style: const TextStyle(fontSize: 12)),
                          const SizedBox(width: 5),
                          Text(
                            label,
                            style: TextStyle(
                              color: isSelected ? Colors.white : AppTheme.textSecondary,
                              fontSize: 11,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // 2. Subject Filter Strip
          SizedBox(
            height: 32,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 14),
              itemCount: filterSubjects.length,
              itemBuilder: (context, index) {
                final subj = filterSubjects[index];
                final isSelected = _selectedSubjectFilter == subj;
                final count = subj == 'All'
                    ? errorEntries.length
                    : errorEntries.where((e) => e.subject == subj).length;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _selectedSubjectFilter = subj;
                      });
                    },
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: isSelected ? AppTheme.secondary.withValues(alpha: 0.15) : AppTheme.background,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: isSelected ? AppTheme.secondary : Colors.white.withValues(alpha: 0.06),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            subj,
                            style: TextStyle(
                              color: isSelected ? AppTheme.secondary : AppTheme.textSecondary,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              fontSize: 11,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '($count)',
                            style: TextStyle(
                              color: isSelected ? AppTheme.secondary : AppTheme.textSecondary.withValues(alpha: 0.6),
                              fontSize: 9.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),

          // Log List
          Expanded(
            child: filteredEntries.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle_outline_rounded,
                          size: 56,
                          color: AppTheme.secondary.withValues(alpha: 0.4),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          _selectedSubjectFilter == 'All' && _selectedTagFilter == 'All'
                              ? 'Your error log is clean! 🎉'
                              : 'No matching mistakes found',
                          style: AppTheme.poppinsBold(fontSize: 15, color: AppTheme.textPrimary),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          'Mistakes logged during PYQs and Mock Tests will appear here.',
                          style: TextStyle(color: AppTheme.textSecondary, fontSize: 12),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    physics: const BouncingScrollPhysics(),
                    itemCount: filteredEntries.length,
                    itemBuilder: (context, index) {
                      final entry = filteredEntries[index];
                      return _buildErrorCard(context, provider, entry);
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddEntrySheet(context, provider),
        tooltip: 'Add Error Entry',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildErrorCard(BuildContext context, AppProvider provider, dynamic entry) {
    final formattedDate = DateFormat('MMM dd, yyyy').format(entry.dateAdded);
    final detectedTag = _detectTagInText(entry.whyWrong);
    final tagColor = detectedTag != null ? _getTagColor(detectedTag) : null;

    return NeuContainer(
      margin: const EdgeInsets.only(bottom: 12),
      borderRadius: 18,
      padding: EdgeInsets.zero,
      isRecessed: entry.isRevised,
      child: ExpansionTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        collapsedTextColor: context.textColor,
        collapsedIconColor: context.textSecondaryColor,
        textColor: entry.isRevised ? AppTheme.accentMint : AppTheme.accentCoral,
        iconColor: entry.isRevised ? AppTheme.accentMint : AppTheme.accentCoral,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Subject Tag
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    entry.subject,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppTheme.primary,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (detectedTag != null) ...[
                  const SizedBox(width: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                    decoration: BoxDecoration(
                      color: tagColor!.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: tagColor.withValues(alpha: 0.3)),
                    ),
                    child: Text(
                      detectedTag,
                      style: TextStyle(
                        color: tagColor,
                        fontSize: 9.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
                const Spacer(),
                Text(
                  formattedDate,
                  style: const TextStyle(color: AppTheme.textSecondary, fontSize: 10.5),
                ),
                const SizedBox(width: 6),
                if (entry.isRevised)
                  const Icon(Icons.check_circle, color: AppTheme.success, size: 16)
                else
                  const Icon(Icons.error_outline, color: AppTheme.error, size: 16),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              entry.topic,
              style: AppTheme.poppinsBold(fontSize: 14),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            entry.questionText,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12),
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(height: 1, color: Colors.white12),
                const SizedBox(height: 14),
                const Text(
                  'QUESTION:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: AppTheme.textSecondary, letterSpacing: 1.1),
                ),
                const SizedBox(height: 6),
                Text(
                  entry.questionText,
                  style: const TextStyle(fontSize: 13.5, color: AppTheme.textPrimary, height: 1.4),
                ),
                const SizedBox(height: 16),
                const Text(
                  'ROOT CAUSE / WHY I GOT IT WRONG:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: AppTheme.error, letterSpacing: 1.1),
                ),
                const SizedBox(height: 6),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppTheme.error.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppTheme.error.withValues(alpha: 0.2)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.lightbulb_outline, color: AppTheme.error, size: 18),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          entry.whyWrong,
                          style: const TextStyle(fontSize: 13, color: AppTheme.textPrimary, fontStyle: FontStyle.italic, height: 1.4),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        provider.markErrorLogEntryRevised(entry.id, !entry.isRevised);
                      },
                      icon: Icon(
                        entry.isRevised ? Icons.undo : Icons.check_circle_outline,
                        color: entry.isRevised ? AppTheme.textSecondary : AppTheme.success,
                        size: 18,
                      ),
                      label: Text(
                        entry.isRevised ? 'Mark Pending' : 'Mark as Revised',
                        style: TextStyle(
                          color: entry.isRevised ? AppTheme.textSecondary : AppTheme.success,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    TextButton.icon(
                      onPressed: () {
                        _showDeleteConfirmDialog(context, provider, entry.id);
                      },
                      icon: const Icon(Icons.delete_outline, color: AppTheme.error, size: 18),
                      label: const Text(
                        'Delete',
                        style: TextStyle(color: AppTheme.error, fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _showAddEntrySheet(BuildContext context, AppProvider provider) {
    String selectedSubject = StorageService.syllabusData.keys.first;
    final topicController = TextEditingController();
    final questionController = TextEditingController();
    final whyWrongController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppTheme.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 16,
                right: 16,
                top: 16,
              ),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 40,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        'Log a Mistake to Journal',
                        style: AppTheme.poppinsBold(fontSize: 16),
                      ),
                      const SizedBox(height: 14),

                      // Subject Dropdown
                      const Text('Subject', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: AppTheme.surface,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedSubject,
                            isExpanded: true,
                            dropdownColor: AppTheme.surface,
                            items: StorageService.syllabusData.keys.map((sub) {
                              return DropdownMenuItem<String>(
                                value: sub,
                                child: Text(sub, style: const TextStyle(fontSize: 13)),
                              );
                            }).toList(),
                            onChanged: (val) {
                              if (val != null) {
                                setModalState(() {
                                  selectedSubject = val;
                                });
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Topic
                      const Text('Topic', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: topicController,
                        style: const TextStyle(color: AppTheme.textPrimary, fontSize: 13),
                        decoration: InputDecoration(
                          hintText: 'e.g., Eigenvalues / Bayes Theorem',
                          hintStyle: const TextStyle(color: AppTheme.textSecondary, fontSize: 12),
                          filled: true,
                          fillColor: AppTheme.surface,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                        ),
                        validator: (val) => val == null || val.trim().isEmpty ? 'Please enter a topic' : null,
                      ),
                      const SizedBox(height: 12),

                      // Question Text
                      const Text('Question Text', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: questionController,
                        style: const TextStyle(color: AppTheme.textPrimary, fontSize: 13),
                        maxLines: 2,
                        decoration: InputDecoration(
                          hintText: 'Paste or summarize the question...',
                          hintStyle: const TextStyle(color: AppTheme.textSecondary, fontSize: 12),
                          filled: true,
                          fillColor: AppTheme.surface,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                        ),
                        validator: (val) => val == null || val.trim().isEmpty ? 'Please enter question details' : null,
                      ),
                      const SizedBox(height: 12),

                      // Quick Taxonomy Tag Chips
                      const Text('Why did you get it wrong? (Select error type):', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.error)),
                      const SizedBox(height: 6),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: [
                          '🧠 Conceptual Gap',
                          '📐 Calculation Error',
                          '🤦‍♂️ Silly Mistake',
                          '📝 Formula Slip',
                          '⏳ Time Pressure',
                        ].map((tag) {
                          return ActionChip(
                            label: Text(tag, style: const TextStyle(fontSize: 11)),
                            backgroundColor: AppTheme.surface,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                              side: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
                            ),
                            onPressed: () {
                              setModalState(() {
                                final cleanTag = tag.split(' ').sublist(1).join(' ');
                                if (!whyWrongController.text.contains(cleanTag)) {
                                  whyWrongController.text = '[$cleanTag]: ${whyWrongController.text}'.trim();
                                }
                              });
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: whyWrongController,
                        style: const TextStyle(color: AppTheme.textPrimary, fontSize: 13),
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: 'e.g., [Conceptual Gap]: Forgot that eigenvectors of distinct eigenvalues are linearly independent.',
                          hintStyle: const TextStyle(color: AppTheme.textSecondary, fontSize: 12),
                          filled: true,
                          fillColor: AppTheme.surface,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                        ),
                        validator: (val) => val == null || val.trim().isEmpty ? 'Please describe why you got it wrong' : null,
                      ),
                      const SizedBox(height: 18),

                      // Save Button
                      SizedBox(
                        width: double.infinity,
                        height: 46,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primary,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              provider.addErrorLogEntry(
                                selectedSubject,
                                topicController.text.trim(),
                                questionController.text.trim(),
                                whyWrongController.text.trim(),
                              );
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Mistake added to notebook!'),
                                  backgroundColor: AppTheme.success,
                                ),
                              );
                            }
                          },
                          child: const Text('Save to Mistake Journal', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showDeleteConfirmDialog(BuildContext context, AppProvider provider, String id) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppTheme.surface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text('Delete Entry?'),
          content: const Text('Are you sure you want to remove this mistake from your notebook?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel', style: TextStyle(color: AppTheme.textSecondary)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppTheme.error),
              onPressed: () {
                provider.deleteErrorLogEntry(id);
                Navigator.pop(context);
              },
              child: const Text('Delete', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }
}
