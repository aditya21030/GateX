import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../theme/app_theme.dart';
import '../data/common_syllabus_data.dart';
import '../widgets/neu_widgets.dart';

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
      expectedMarks: '13',
      percentage: 0.13,
      priority: 'Fixed',
      priorityColor: AppTheme.primary,
    ),
    WeightageItem(
      subject: 'Programming & Data Structures',
      expectedMarks: '10–12',
      percentage: 0.11,
      priority: 'Very High',
      priorityColor: AppTheme.error,
    ),
    WeightageItem(
      subject: 'Algorithms',
      expectedMarks: '8–10',
      percentage: 0.09,
      priority: 'Very High',
      priorityColor: AppTheme.error,
    ),
    WeightageItem(
      subject: 'Operating System',
      expectedMarks: '8–10',
      percentage: 0.09,
      priority: 'High',
      priorityColor: Colors.orange,
    ),
    WeightageItem(
      subject: 'Computer Networks',
      expectedMarks: '8–10',
      percentage: 0.09,
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
      subject: 'Theory of Computation',
      expectedMarks: '7–9',
      percentage: 0.08,
      priority: 'High',
      priorityColor: Colors.orange,
    ),
    WeightageItem(
      subject: 'Computer Organization & Architecture (COA)',
      expectedMarks: '8–10',
      percentage: 0.09,
      priority: 'High',
      priorityColor: Colors.orange,
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
      backgroundColor: context.scaffoldBackground,
      appBar: AppBar(
        title: Text('Subject Weightage', style: AppTheme.poppinsBold(fontSize: 18, color: context.textColor)),
        backgroundColor: context.scaffoldBackground,
        elevation: 0,
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
                onPressed: () => Navigator.pop(context),
              )
            : null,
        actions: const [],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            children: [
              // 1. KEY INSIGHT CONTAINER
              NeuContainer(
                borderRadius: 20,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const NeuIconTile(
                          icon: Icons.local_fire_department_rounded,
                          iconColor: AppTheme.accentFlame,
                          size: 38,
                          iconSize: 20,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'KEY INSIGHT',
                          style: AppTheme.poppinsBold(fontSize: 13, color: AppTheme.accentFlame),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      isCSIT 
                        ? 'DSA + MATH = ~30% OF TOTAL MARKS.'
                        : 'MACHINE LEARNING + PROBABILITY & STATISTICS = ~40% OF TOTAL MARKS.',
                      style: AppTheme.poppinsBold(fontSize: 13, color: context.textColor),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      isCSIT
                        ? 'Mastering Data Structures, Algorithms, and Engineering Mathematics provides a huge baseline. Without these core pillars, advancing in other systems subjects becomes much harder.'
                        : 'These two subjects alone decide your rank. Every other subject helps you — but these two make or break you. Your preparation schedule must allocate at least 40% of total study time here.',
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.4,
                        color: context.textSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ),

              if (provider.selectedExam == 'BOTH') ...[
                // COMMON SYLLABUS BLOCK
                Text(
                  'Common Syllabus (CS & DA)',
                  style: AppTheme.poppinsBold(fontSize: 16, color: context.textColor),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 14.0),
                  child: Text(
                    'These subjects overlap between CS and DA.',
                    style: TextStyle(color: context.textSecondaryColor, fontSize: 12),
                  ),
                ),
                ...CommonSyllabusData.data['subjects'].map<Widget>((subject) {
                  return NeuContainer(
                    margin: const EdgeInsets.only(bottom: 12),
                    borderRadius: 16,
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    child: Theme(
                      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        collapsedIconColor: context.textSecondaryColor,
                        iconColor: AppTheme.secondary,
                        tilePadding: EdgeInsets.zero,
                        title: Row(
                          children: [
                            const Icon(Icons.merge_type_rounded, color: AppTheme.secondary, size: 18),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                subject['title'],
                                style: AppTheme.poppinsBold(fontSize: 14, color: context.textColor),
                              ),
                            ),
                          ],
                        ),
                        childrenPadding: const EdgeInsets.only(bottom: 8),
                        children: [
                          Divider(color: context.isDarkMode ? Colors.white10 : Colors.black12),
                          const SizedBox(height: 8),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('CS Topics', style: TextStyle(color: AppTheme.primary, fontWeight: FontWeight.bold, fontSize: 11)),
                                    const SizedBox(height: 6),
                                    ...((subject['subtopics']['CS'] as List).map((topic) => Padding(
                                      padding: const EdgeInsets.only(bottom: 4.0),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('• ', style: TextStyle(color: context.textSecondaryColor, fontSize: 11)),
                                          Expanded(child: Text(topic.toString(), style: TextStyle(color: context.textSecondaryColor, fontSize: 11))),
                                        ],
                                      ),
                                    ))),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('DA Topics', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 11)),
                                    const SizedBox(height: 6),
                                    ...((subject['subtopics']['DA'] as List).map((topic) => Padding(
                                      padding: const EdgeInsets.only(bottom: 4.0),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('• ', style: TextStyle(color: context.textSecondaryColor, fontSize: 11)),
                                          Expanded(child: Text(topic.toString(), style: TextStyle(color: context.textSecondaryColor, fontSize: 11))),
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
                const SizedBox(height: 16),
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

    return NeuContainer(
      borderRadius: 18,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 12),
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
                  style: AppTheme.poppinsBold(fontSize: 14.5, color: context.textColor),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: item.priorityColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  item.expectedMarks,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                    color: item.priorityColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Progress bar and details row
          Row(
            children: [
              // Weightage Percentage label
              SizedBox(
                width: 44,
                child: Text(
                  pctString,
                  style: AppTheme.poppinsBold(fontSize: 15, color: item.priorityColor),
                ),
              ),
              const SizedBox(width: 6),

              // Linear weightage indicator well
              Expanded(
                child: NeuContainer(
                  isRecessed: true,
                  borderRadius: 6,
                  padding: EdgeInsets.zero,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: SizedBox(
                      height: 8,
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: item.percentage.clamp(0.0, 1.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: item.priorityColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // Priority Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: item.priorityColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  item.priority.toUpperCase(),
                  style: TextStyle(
                    color: item.priorityColor,
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.6,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}