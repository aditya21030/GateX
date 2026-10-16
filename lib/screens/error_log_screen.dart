import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/app_provider.dart';
import '../services/storage_service.dart';
import '../theme/app_theme.dart';
import 'mock_test_runner_screen.dart';

class ErrorLogScreen extends StatefulWidget {
  const ErrorLogScreen({super.key});

  @override
  State<ErrorLogScreen> createState() => _ErrorLogScreenState();
}

class _ErrorLogScreenState extends State<ErrorLogScreen> {
  String _selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final errorEntries = provider.errorLog;

    // Distinct subjects list for filters
    final filterSubjects = ['All', ...StorageService.syllabusData.keys];

    // Filter items
    final filteredEntries = _selectedFilter == 'All'
        ? errorEntries
        : errorEntries.where((e) => e.subject == _selectedFilter).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Error Log'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header titles
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Text(
              'Review Your Mistakes',
              style: AppTheme.poppinsBold(fontSize: 20),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Text(
              'Questions you got wrong — review them regularly to build conceptual clarity.',
              style: TextStyle(color: AppTheme.textSecondary, fontSize: 13),
            ),
          ),

          // Practice Mistakes Action Banner
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: InkWell(
              onTap: () {
                final quizQuestions = provider.generateMistakesQuiz(subjectFilter: _selectedFilter);
                if (quizQuestions.isEmpty) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('No mistake entries found for this filter. Add errors or take mock tests first!'),
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
                      testName: _selectedFilter == 'All' ? 'My Mistakes Drill Test' : '$_selectedFilter Mistakes Drill',
                    ),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(14),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFE53935), Color(0xFFC2185B)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withValues(alpha: 0.25),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.flash_on_rounded, color: Colors.white, size: 20),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Practice My Mistakes (Custom Quiz)',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            filteredEntries.isEmpty
                                ? 'Log errors below to build custom drill tests'
                                : 'Generate CBT test from ${filteredEntries.length} logged mistake${filteredEntries.length > 1 ? "s" : ""}',
                            style: TextStyle(color: Colors.white.withValues(alpha: 0.85), fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 14),
                  ],
                ),
              ),
            ),
          ),

          // Filters row
          const SizedBox(height: 12),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: filterSubjects.length,
              itemBuilder: (context, index) {
                final subj = filterSubjects[index];
                final isSelected = _selectedFilter == subj;
                final count = subj == 'All'
                    ? errorEntries.length
                    : errorEntries.where((e) => e.subject == subj).length;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _selectedFilter = subj;
                      });
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? AppTheme.secondary.withOpacity(0.12) : AppTheme.surface,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected ? AppTheme.secondary : AppTheme.textSecondary.withOpacity(0.2),
                          width: isSelected ? 1.5 : 1.0,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            subj,
                            style: TextStyle(
                              color: isSelected ? AppTheme.secondary : AppTheme.textPrimary,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: isSelected ? AppTheme.secondary : AppTheme.background,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              '$count',
                              style: TextStyle(
                                color: isSelected ? Colors.white : AppTheme.textSecondary,
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
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
          const SizedBox(height: 12),

          // Log List
          Expanded(
            child: filteredEntries.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle_outline_rounded,
                          size: 64,
                          color: AppTheme.secondary.withOpacity(0.5),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _selectedFilter == 'All'
                              ? 'Your error log is clean! 🎉'
                              : 'No error logs for $_selectedFilter!',
                          style: AppTheme.poppinsBold(fontSize: 16, color: AppTheme.textPrimary),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Add items using the + button below.',
                          style: TextStyle(color: AppTheme.textSecondary, fontSize: 13),
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

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: entry.isRevised ? AppTheme.success.withOpacity(0.3) : AppTheme.error.withOpacity(0.3), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: entry.isRevised ? AppTheme.success.withOpacity(0.05) : AppTheme.error.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ExpansionTile(
        collapsedTextColor: AppTheme.textPrimary,
        collapsedIconColor: AppTheme.textSecondary,
        textColor: entry.isRevised ? AppTheme.success : AppTheme.error,
        iconColor: entry.isRevised ? AppTheme.success : AppTheme.error,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.primary.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
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
                ),
                const SizedBox(width: 8),
                Text(
                  formattedDate,
                  style: const TextStyle(color: AppTheme.textSecondary, fontSize: 11),
                ),
                const Spacer(),
                if (entry.isRevised)
                  const Icon(Icons.check_circle, color: AppTheme.success, size: 18)
                else
                  const Icon(Icons.error_outline, color: AppTheme.error, size: 18),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              entry.topic,
              style: AppTheme.poppinsBold(fontSize: 15),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Text(
            entry.questionText,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: AppTheme.textSecondary, fontSize: 13),
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(height: 1, color: Colors.white12),
                const SizedBox(height: 16),
                const Text(
                  'QUESTION:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: AppTheme.textSecondary, letterSpacing: 1.1),
                ),
                const SizedBox(height: 6),
                Text(
                  entry.questionText,
                  style: const TextStyle(fontSize: 14, color: AppTheme.textPrimary, height: 1.4),
                ),
                const SizedBox(height: 20),
                const Text(
                  'WHY I GOT IT WRONG:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: AppTheme.error, letterSpacing: 1.1),
                ),
                const SizedBox(height: 6),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.error.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppTheme.error.withOpacity(0.2)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.lightbulb_outline, color: AppTheme.error, size: 20),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          entry.whyWrong,
                          style: const TextStyle(fontSize: 14, color: AppTheme.textPrimary, fontStyle: FontStyle.italic, height: 1.4),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
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
                        size: 20,
                      ),
                      label: Text(
                        entry.isRevised ? 'Mark Pending' : 'Mark as Revised',
                        style: TextStyle(
                          color: entry.isRevised ? AppTheme.textSecondary : AppTheme.success,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    TextButton.icon(
                      onPressed: () {
                        _showDeleteConfirmDialog(context, provider, entry.id);
                      },
                      icon: const Icon(Icons.delete_outline, color: AppTheme.error, size: 20),
                      label: const Text(
                        'Delete',
                        style: TextStyle(color: AppTheme.error, fontWeight: FontWeight.bold, fontSize: 13),
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
                            color: AppTheme.textSecondary.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Add Error Log Entry',
                        style: AppTheme.poppinsBold(fontSize: 18),
                      ),
                      const SizedBox(height: 16),

                      // Subject Dropdown
                      const Text('Subject', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: AppTheme.surface,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppTheme.textSecondary.withOpacity(0.2)),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedSubject,
                            isExpanded: true,
                            dropdownColor: AppTheme.surface,
                            items: StorageService.syllabusData.keys.map((sub) {
                              return DropdownMenuItem<String>(
                                value: sub,
                                child: Text(sub),
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
                      const Text('Topic', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: topicController,
                        style: const TextStyle(color: AppTheme.textPrimary),
                        decoration: InputDecoration(
                          hintText: 'e.g., Eigenvalues & Eigenvectors',
                          hintStyle: const TextStyle(color: AppTheme.textSecondary),
                          filled: true,
                          fillColor: AppTheme.surface,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (val) => val == null || val.trim().isEmpty ? 'Please enter a topic' : null,
                      ),
                      const SizedBox(height: 12),

                      // Question Text
                      const Text('Question Text', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: questionController,
                        style: const TextStyle(color: AppTheme.textPrimary),
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: 'Paste or write the question here...',
                          hintStyle: const TextStyle(color: AppTheme.textSecondary),
                          filled: true,
                          fillColor: AppTheme.surface,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (val) => val == null || val.trim().isEmpty ? 'Please enter the question' : null,
                      ),
                      const SizedBox(height: 12),

                      // Why Wrong
                      const Text('Why I got it wrong?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.error)),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: whyWrongController,
                        style: const TextStyle(color: AppTheme.textPrimary),
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: 'e.g., Calculation mistake or forgot that the eigenvalues product equals the determinant.',
                          hintStyle: const TextStyle(color: AppTheme.textSecondary),
                          filled: true,
                          fillColor: AppTheme.surface,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (val) => val == null || val.trim().isEmpty ? 'Please explain why you got it wrong' : null,
                      ),
                      const SizedBox(height: 20),

                      // Save Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primary,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.symmetric(vertical: 14),
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
                                  content: Text('Error log entry saved successfully!'),
                                  backgroundColor: AppTheme.success,
                                ),
                              );
                            }
                          },
                          child: const Text('Save Entry', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const SizedBox(height: 20),
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
          title: const Text('Delete Entry'),
          content: const Text('Are you sure you want to delete this error log entry? This action cannot be undone.'),
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
              child: const Text('Delete', style: TextStyle(color: AppTheme.textPrimary)),
            ),
          ],
        );
      },
    );
  }
}
