import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../theme/app_theme.dart';
import '../data/common_syllabus_data.dart';

class WeightageItem {
  final String subject;
  final String expectedMarks;
  final double percentage; // e.g. 0.21 for 21%
  final String priority; // 'Very High', 'High', 'Medium', 'Fixed'
  final Color priorityColor;

  const WeightageItem({
    required this.subject,
    required this.expectedMarks,
    required this.percentage,
    required this.priority,
    required this.priorityColor,
  });
}

class WeightageScreen extends StatelessWidget {
  const WeightageScreen({super.key});

  static const List<WeightageItem> _daWeightageList = [
    WeightageItem(
      subject: 'Machine Learning',
      expectedMarks: '~18–22 Marks',
      percentage: 0.21,
      priority: 'Very High',
      priorityColor: AppTheme.error,
    ),
    WeightageItem(
      subject: 'Probability and Statistics',
      expectedMarks: '~17–20 Marks',
      percentage: 0.19,
      priority: 'Very High',
      priorityColor: AppTheme.error,
    ),
    WeightageItem(
      subject: 'General Aptitude',
      expectedMarks: '15 Marks (Fixed)',
      percentage: 0.15,
      priority: 'Fixed',
      priorityColor: AppTheme.primary,
    ),
    WeightageItem(
      subject: 'Linear Algebra',
      expectedMarks: '~11–14 Marks',
      percentage: 0.13,
      priority: 'High',
      priorityColor: Colors.orange,
    ),
    WeightageItem(
      subject: 'AI (Artificial Intelligence)',
      expectedMarks: '~9–12 Marks',
      percentage: 0.11,
      priority: 'High',
      priorityColor: Colors.orange,
    ),
    WeightageItem(
      subject: 'Calculus and Optimization',
      expectedMarks: '~9–11 Marks',
      percentage: 0.10,
      priority: 'High',
      priorityColor: Colors.orange,
    ),
    WeightageItem(
      subject: 'DSA (Data Structures and Algorithms)',
      expectedMarks: '~5–7 Marks',
      percentage: 0.06,
      priority: 'High',
      priorityColor: Colors.orange,
    ),
    WeightageItem(
      subject: 'Python (Main Topics Only)',
      expectedMarks: '~3–5 Marks',
      percentage: 0.04,
      priority: 'Medium',
      priorityColor: Colors.amber,
    ),
    WeightageItem(
      subject: 'Database Management and Warehousing',
      expectedMarks: '~7–10 Marks',
      percentage: 0.08,
      priority: 'Medium',
      priorityColor: Colors.amber,
    ),
  ];

  static const List<WeightageItem> _csitWeightageList = [
    WeightageItem(
      subject: 'General Aptitude',
      expectedMarks: '15',
      percentage: 0.15,
      priority: 'Fixed',
      priorityColor: AppTheme.primary,
    ),
    WeightageItem(
      subject: 'Engineering Mathematics',
      expectedMarks: '10–13',
      percentage: 0.115,
      priority: 'Very High',
      priorityColor: AppTheme.error,
    ),
    WeightageItem(
      subject: 'Data Structures & Algorithms',
      expectedMarks: '10–13',
      percentage: 0.115,
      priority: 'Very High',
      priorityColor: AppTheme.error,
    ),
    WeightageItem(
      subject: 'Operating Systems',
      expectedMarks: '8–10',
      percentage: 0.09,
      priority: 'High',
      priorityColor: Colors.orange,
    ),
    WeightageItem(
      subject: 'Computer Organization & Architecture (COA)',
      expectedMarks: '7–10',
      percentage: 0.085,
      priority: 'High',
      priorityColor: Colors.orange,
    ),
    WeightageItem(
      subject: 'Theory of Computation (TOC)',
      expectedMarks: '7–9',
      percentage: 0.08,
      priority: 'High',
      priorityColor: Colors.orange,
    ),
    WeightageItem(
      subject: 'Database Management Systems (DBMS)',
      expectedMarks: '7–9',
      percentage: 0.08,
      priority: 'High',
      priorityColor: Colors.orange,
    ),
    WeightageItem(
      subject: 'Computer Networks',
      expectedMarks: '7–9',
      percentage: 0.08,
      priority: 'Medium',
      priorityColor: Colors.amber,
    ),
    WeightageItem(
      subject: 'Compiler Design',
      expectedMarks: '5–7',
      percentage: 0.06,
      priority: 'Medium',
      priorityColor: Colors.amber,
    ),
    WeightageItem(
      subject: 'Programming & C',
      expectedMarks: '5–6',
      percentage: 0.055,
      priority: 'Medium',
      priorityColor: Colors.amber,
    ),
    WeightageItem(
      subject: 'Digital Logic',
      expectedMarks: '4–6',
      percentage: 0.05,
      priority: 'Medium',
      priorityColor: Colors.amber,
    ),
    WeightageItem(
      subject: 'Software Engineering & Web Technology',
      expectedMarks: '1–2',
      percentage: 0.015,
      priority: 'Low',
      priorityColor: Colors.teal,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final isCSIT = provider.activeExam == 'CSIT';
    final weightageList = isCSIT ? _csitWeightageList : _daWeightageList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Subject Weightage'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            children: [
              Text(
                'Syllabus Weightage Analysis',
                style: AppTheme.poppinsBold(fontSize: 20),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 4.0, bottom: 20.0),
                child: Text(
                  'Understand the expected marks distribution, priority levels, and critical focus areas for the GATE DA exam.',
                  style: TextStyle(color: AppTheme.textSecondary, fontSize: 13),
                ),
              ),

              // 1. KEY INSIGHT CONTAINER (Fire highlighted card)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [
                      AppTheme.secondary.withOpacity(0.12),
                      Colors.orange.withOpacity(0.08),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  border: Border.all(
                    color: AppTheme.secondary.withOpacity(0.3),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.secondary.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.local_fire_department_rounded, color: AppTheme.secondary, size: 22),
                        const SizedBox(width: 8),
                        Text(
                          'KEY INSIGHT',
                          style: AppTheme.poppinsBold(fontSize: 14, color: AppTheme.secondary),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      isCSIT 
                        ? 'DSA + MATH = ~30% OF TOTAL MARKS.'
                        : 'MACHINE LEARNING + PROBABILITY & STATISTICS = ~40% OF TOTAL MARKS.',
                      style: AppTheme.poppinsBold(fontSize: 13, color: AppTheme.textPrimary),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      isCSIT
                        ? 'Mastering Data Structures, Algorithms, and Engineering Mathematics provides a huge baseline. Without these core pillars, advancing in other systems subjects becomes much harder.'
                        : 'These two subjects alone decide your rank. Every other subject helps you — but these two make or break you. Your preparation schedule must allocate at least 40% of total study time here.',
                      style: const TextStyle(
                        fontSize: 13,
                        height: 1.4,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),

              if (provider.selectedExam == 'BOTH') ...[
                // COMMON SYLLABUS BLOCK
                const SizedBox(height: 8),
                Text(
                  'Common Syllabus (CS & DA)',
                  style: AppTheme.poppinsBold(fontSize: 18),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 4.0, bottom: 16.0),
                  child: Text(
                    'These subjects and topics overlap. Mastering them gives you a huge advantage in both exams.',
                    style: TextStyle(color: AppTheme.textSecondary, fontSize: 13),
                  ),
                ),
                ...CommonSyllabusData.data['subjects'].map<Widget>((subject) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: AppTheme.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppTheme.textPrimary.withOpacity(0.05)),
                    ),
                    child: Theme(
                      data: ThemeData(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        collapsedIconColor: AppTheme.primary,
                        iconColor: AppTheme.secondary,
                        title: Row(
                          children: [
                            const Icon(Icons.merge_type_rounded, color: AppTheme.secondary, size: 20),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                subject['title'],
                                style: const TextStyle(color: AppTheme.textPrimary, fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                        childrenPadding: const EdgeInsets.all(16).copyWith(top: 0),
                        children: [
                          const Divider(color: Colors.white12),
                          const SizedBox(height: 12),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('CS Topics', style: TextStyle(color: AppTheme.primary, fontWeight: FontWeight.bold, fontSize: 12)),
                                    const SizedBox(height: 8),
                                    ...((subject['subtopics']['CS'] as List).map((topic) => Padding(
                                      padding: const EdgeInsets.only(bottom: 6.0),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text('• ', style: TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
                                          Expanded(child: Text(topic.toString(), style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12))),
                                        ],
                                      ),
                                    ))),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('DA Topics', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 12)),
                                    const SizedBox(height: 8),
                                    ...((subject['subtopics']['DA'] as List).map((topic) => Padding(
                                      padding: const EdgeInsets.only(bottom: 6.0),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text('• ', style: TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
                                          Expanded(child: Text(topic.toString(), style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12))),
                                        ],
                                      ),
                                    ))),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
                const SizedBox(height: 24),
              ],

              // 2. WEIGHTAGE LIST
              ...weightageList.map((item) => _buildWeightageCard(context, item)),
              
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeightageCard(BuildContext context, WeightageItem item) {
    final pctString = '${(item.percentage * 100).toStringAsFixed(0)}%';

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: item.priorityColor.withOpacity(0.3), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: item.priorityColor.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Subject name & expected marks
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    item.subject,
                    style: AppTheme.poppinsBold(fontSize: 15),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppTheme.background,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    item.expectedMarks,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Progress bar and details row
            Row(
              children: [
                // Weightage Percentage label
                SizedBox(
                  width: 50,
                  child: Text(
                    pctString,
                    style: AppTheme.timerStyle(fontSize: 16, color: item.priorityColor),
                  ),
                ),
                const SizedBox(width: 8),

                // Linear weightage indicator
                Expanded(
                  child: Container(
                    height: 10,
                    decoration: BoxDecoration(
                      color: AppTheme.background,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.textPrimary.withOpacity(0.2),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: item.percentage,
                      child: Container(
                        decoration: BoxDecoration(
                          color: item.priorityColor,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: item.priorityColor.withOpacity(0.6),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),

                // Priority Badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: item.priorityColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    item.priority.toUpperCase(),
                    style: TextStyle(
                      color: item.priorityColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
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
