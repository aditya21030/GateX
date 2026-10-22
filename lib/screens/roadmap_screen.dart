import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../theme/app_theme.dart';
import '../models/models.dart';
import '../data/roadmap_data.dart';
import '../widgets/neu_widgets.dart';

class RoadmapScreen extends StatelessWidget {
  const RoadmapScreen({super.key});

  IconData _getSubjectIcon(String subjectName) {
    switch (subjectName) {
      case 'General Aptitude':
        return Icons.lightbulb_outline_rounded;
      case 'Linear Algebra':
        return Icons.grid_on_rounded;
      case 'Probability and Statistics':
        return Icons.analytics_outlined;
      case 'Calculus and Optimization':
        return Icons.trending_up_rounded;
      case 'AI':
        return Icons.psychology_outlined;
      case 'Machine Learning':
        return Icons.memory_rounded;
      case 'Database Management and Warehousing':
        return Icons.storage_rounded;
      case 'DSA (Data Structures and Algorithms)':
        return Icons.account_tree_outlined;
      case 'Python (Main Topics Only)':
        return Icons.code_rounded;
      default:
        return Icons.book_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final allTopics = provider.topics;

    // Calculate overall completion
    final totalTopics = allTopics.length;
    final completedTopics = allTopics.where((t) => t.isCompleted).length;
    final overallPercentage = totalTopics > 0 ? completedTopics / totalTopics : 0.0;

    final subjects = provider.currentSubjects;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: context.scaffoldBackground,
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: NestedScrollView(
              physics: const BouncingScrollPhysics(),
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    expandedHeight: 250.0,
                    floating: false,
                    pinned: true,
                    backgroundColor: context.scaffoldBackground,
                    flexibleSpace: FlexibleSpaceBar(
                      titlePadding: const EdgeInsets.only(left: 24, bottom: 80),
                      title: Text(
                        'GATE ${provider.activeExam} Roadmap',
                        style: AppTheme.poppinsBold(fontSize: 18, color: context.textColor),
                      ),
                      background: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [AppTheme.primary.withOpacity(0.15), context.scaffoldBackground],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Stack(
                          children: [
                            // Decorative elements
                            Positioned(
                              top: -50,
                              right: -50,
                              child: Container(
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppTheme.secondary.withOpacity(0.1),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 24.0, top: 60.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  // Overall progress ring
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: context.colorSurface.withOpacity(0.8),
                                      boxShadow: [
                                        BoxShadow(color: AppTheme.secondary.withOpacity(0.2), blurRadius: 10, spreadRadius: 2),
                                      ],
                                    ),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        SizedBox(
                                          width: 80,
                                          height: 80,
                                          child: CircularProgressIndicator(
                                            value: overallPercentage,
                                            strokeWidth: 8,
                                            backgroundColor: AppTheme.background,
                                            valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.secondary),
                                          ),
                                        ),
                                        Text(
                                          '${(overallPercentage * 100).toStringAsFixed(0)}%',
                                          style: AppTheme.timerStyle(fontSize: 18, color: AppTheme.secondary),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(60),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: context.colorSurface,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: context.textColor.withOpacity(0.05)),
                        ),
                        child: TabBar(
                          indicator: BoxDecoration(
                            color: AppTheme.primary,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(color: AppTheme.primary.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 2)),
                            ],
                          ),
                          indicatorSize: TabBarIndicatorSize.tab,
                          dividerColor: Colors.transparent,
                          labelColor: Colors.white,
                          unselectedLabelColor: AppTheme.textSecondary,
                          labelStyle: AppTheme.poppinsBold(fontSize: 13),
                          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                          tabs: const [
                            Tab(text: 'Full Plan'),
                            Tab(text: '6 Months'),
                            Tab(text: '3 Months'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: TabBarView(
                children: [
                  _buildFullRoadmap(subjects, allTopics, provider),
                  _buildRealRoadmap(context, provider.activeExam == 'CSIT' ? RoadmapData.cs6MonthRoadmap : RoadmapData.da6MonthRoadmap),
                  _buildRealRoadmap(context, provider.activeExam == 'CSIT' ? RoadmapData.cs3MonthRoadmap : RoadmapData.da3MonthRoadmap),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFullRoadmap(List<String> subjects, List<TopicStatus> allTopics, AppProvider provider) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      physics: const BouncingScrollPhysics(),
      itemCount: subjects.length,
      itemBuilder: (context, index) {
        final subject = subjects[index];
        final subTopics = allTopics.where((t) => t.subjectName == subject).toList();
        final completedCount = subTopics.where((t) => t.isCompleted).length;
        final totalCount = subTopics.length;
        final progress = totalCount > 0 ? completedCount / totalCount : 0.0;

        String statusText = 'Not Started';
        Color statusColor = AppTheme.textSecondary;
        if (completedCount == totalCount && totalCount > 0) {
          statusText = 'Completed';
          statusColor = AppTheme.success;
        } else if (completedCount > 0) {
          statusText = 'In Progress';
          statusColor = AppTheme.primary;
        }

        return _SubjectExpansionCard(
          subjectName: subject,
          icon: _getSubjectIcon(subject),
          progress: progress,
          completedCount: completedCount,
          totalCount: totalCount,
          statusText: statusText,
          statusColor: statusColor,
          topics: subTopics,
          provider: provider,
        );
      },
    );
  }



  Widget _buildRealRoadmap(BuildContext context, Map<String, dynamic> data) {
    final meta = data['meta'];
    final phases = data['phases'] as List;

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      physics: const BouncingScrollPhysics(),
      children: [
        // Meta Info
        NeuContainer(
          borderRadius: 18,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${meta['exam']} - ${meta['roadmap_type']} Roadmap', style: AppTheme.poppinsBold(fontSize: 16, color: AppTheme.primary)),
              const SizedBox(height: 8),
              Text('Target: ${meta['target']}', style: TextStyle(color: context.textColor, fontSize: 13)),
              const SizedBox(height: 4),
              Text('Duration: ${meta['start_date']} to ${meta['end_date']} (${meta['total_weeks']} weeks)', style: TextStyle(color: context.textSecondaryColor, fontSize: 11.5)),
              if (meta['note'] != null) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(meta['note'], style: const TextStyle(color: Colors.orange, fontSize: 11, fontStyle: FontStyle.italic)),
                ),
              ],
            ],
          ),
        ),
        const SizedBox(height: 24),
        ...phases.map((phase) => _buildPhaseSection(context, phase)).toList(),
      ],
    );
  }

  Widget _buildPhaseSection(BuildContext context, dynamic phase) {
    final weeklyPlan = phase['weekly_plan'] as List;
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Phase ${phase['phase']}: ${phase['title']}', style: AppTheme.poppinsBold(fontSize: 18, color: AppTheme.secondary)),
          const SizedBox(height: 4),
          Text('Weeks ${phase['weeks']} (${phase['dates']})', style: TextStyle(color: context.textSecondaryColor, fontSize: 12)),
          const SizedBox(height: 14),
          ...weeklyPlan.map((week) => _buildWeekTile(context, week)).toList(),
          if (phase['phase_end_milestone'] != null) ...[
            const SizedBox(height: 14),
            NeuContainer(
              isRecessed: true,
              borderRadius: 12,
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  const Icon(Icons.flag_rounded, color: AppTheme.success, size: 20),
                  const SizedBox(width: 10),
                  Expanded(child: Text(phase['phase_end_milestone'], style: TextStyle(color: context.textColor, fontSize: 12.5))),
                ],
              ),
            ),
          ]
        ],
      ),
    );
  }

  Widget _buildWeekTile(BuildContext context, dynamic week) {
    final dailyTargets = week['daily_targets'] as Map<String, dynamic>;
    return NeuContainer(
      borderRadius: 16,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: EdgeInsets.zero,
          collapsedIconColor: context.textSecondaryColor,
          iconColor: AppTheme.secondary,
          title: Text('Week ${week['week']}: ${week['subject'] ?? week['title'] ?? 'Week Plan'}', style: TextStyle(color: context.textColor, fontWeight: FontWeight.bold, fontSize: 14)),
          subtitle: week['topics'] != null 
            ? Text((week['topics'] as List).join(', '), style: TextStyle(color: context.textSecondaryColor, fontSize: 11), maxLines: 1, overflow: TextOverflow.ellipsis)
            : null,
          childrenPadding: const EdgeInsets.all(12).copyWith(top: 0),
            children: [
              const Divider(color: Colors.white12),
              const SizedBox(height: 8),
              ...dailyTargets.entries.map((entry) => Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 45,
                      child: Text(entry.key, style: const TextStyle(color: AppTheme.primary, fontWeight: FontWeight.bold, fontSize: 13)),
                    ),
                    Expanded(
                      child: Text(entry.value.toString(), style: TextStyle(color: context.textColor, fontSize: 13)),
                    ),
                  ],
                ),
              )).toList(),
            ],
          ),
        ),
      );
  }
}

class _SubjectExpansionCard extends StatelessWidget {
  final String subjectName;
  final IconData icon;
  final double progress;
  final int completedCount;
  final int totalCount;
  final String statusText;
  final Color statusColor;
  final List<TopicStatus> topics;
  final AppProvider provider;

  const _SubjectExpansionCard({
    required this.subjectName,
    required this.icon,
    required this.progress,
    required this.completedCount,
    required this.totalCount,
    required this.statusText,
    required this.statusColor,
    required this.topics,
    required this.provider,
  });

  String get _weightageText {
    final isCSIT = provider.activeExam == 'CSIT';
    if (isCSIT) {
      switch (subjectName) {
        case 'General Aptitude':
          return '15 Marks';
        case 'Engineering Mathematics':
        case 'Programming & Data Structures':
        case 'Data Structures & Algorithms':
        case 'Algorithms':
          return '10-13 Marks';
        case 'Operating System':
        case 'Operating Systems':
        case 'Computer Networks':
        case 'Computer Organization':
        case 'Computer Organization & Architecture (COA)':
          return '8-10 Marks';
        case 'Theory of Computation':
        case 'Databases':
        case 'Database Management Systems (DBMS)':
          return '7-9 Marks';
        case 'Compiler Design':
        case 'Programming & C':
          return '5-7 Marks';
        case 'Digital Logic':
          return '4-6 Marks';
        default:
          return 'N/A';
      }
    } else {
      switch (subjectName) {
        case 'General Aptitude':
          return '15%';
        case 'Probability and Statistics':
          return '~19%';
        case 'Linear Algebra':
          return '~13%';
        case 'Calculus and Optimization':
          return '~10%';
        case 'Python (Main Topics Only)':
        case 'DSA (Data Structures and Algorithms)':
          return '~10% (combined)';
        case 'Database Management and Warehousing':
          return '~8%';
        case 'Machine Learning':
          return '~21%';
        case 'AI':
          return '~11%';
        default:
          return 'N/A';
      }
    }
  }

  String get _priorityText {
    final isCSIT = provider.activeExam == 'CSIT';
    if (isCSIT) {
      switch (subjectName) {
        case 'General Aptitude':
        case 'Engineering Mathematics':
          return 'Fixed';
        case 'Programming & Data Structures':
        case 'Data Structures & Algorithms':
        case 'Algorithms':
          return 'Very High';
        case 'Operating System':
        case 'Operating Systems':
        case 'Computer Networks':
        case 'Computer Organization':
        case 'Computer Organization & Architecture (COA)':
        case 'Theory of Computation':
        case 'Databases':
        case 'Database Management Systems (DBMS)':
          return 'High';
        case 'Compiler Design':
        case 'Programming & C':
        case 'Digital Logic':
          return 'Medium';
        default:
          return 'Low';
      }
    } else {
      switch (subjectName) {
        case 'General Aptitude':
          return 'Fixed';
        case 'Probability and Statistics':
        case 'Machine Learning':
          return 'Very High';
        case 'Linear Algebra':
        case 'Calculus and Optimization':
        case 'Python (Main Topics Only)':
        case 'DSA (Data Structures and Algorithms)':
        case 'AI':
          return 'High';
        case 'Database Management and Warehousing':
          return 'Medium';
        default:
          return 'Low';
      }
    }
  }

  Color get _priorityColor {
    switch (_priorityText) {
      case 'Fixed':
        return AppTheme.primary;
      case 'Very High':
        return AppTheme.error;
      case 'High':
        return AppTheme.accentFlame;
      case 'Medium':
        return Colors.amber;
      default:
        return AppTheme.textSecondary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return NeuContainer(
      borderRadius: 18,
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: EdgeInsets.zero,
          collapsedIconColor: context.textSecondaryColor,
          iconColor: AppTheme.secondary,
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: statusColor, size: 22),
          ),
          title: Text(
            subjectName,
            style: AppTheme.poppinsBold(fontSize: 15),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 10,
                  runSpacing: 4,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.analytics_outlined, size: 12, color: AppTheme.textSecondary),
                        const SizedBox(width: 4),
                        Text(
                          'Weightage: $_weightageText',
                          style: const TextStyle(color: AppTheme.textSecondary, fontSize: 11, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: _priorityColor.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: _priorityColor.withOpacity(0.3),
                          width: 0.5,
                        ),
                      ),
                      child: Text(
                        '${_priorityText.toUpperCase()} PRIORITY',
                        style: TextStyle(
                          color: _priorityColor,
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$completedCount/$totalCount completed',
                      style: const TextStyle(color: AppTheme.textSecondary, fontSize: 11),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        statusText,
                        style: TextStyle(color: statusColor, fontSize: 9, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: AppTheme.background,
                    valueColor: AlwaysStoppedAnimation<Color>(statusColor),
                    minHeight: 4,
                  ),
                ),
              ],
            ),
          ),
          children: [
            const Divider(color: AppTheme.background, height: 1),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: topics.length,
                itemBuilder: (context, index) {
                  final topic = topics[index];
                  return _TopicRoadmapItem(topic: topic, provider: provider);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopicRoadmapItem extends StatelessWidget {
  final TopicStatus topic;
  final AppProvider provider;

  const _TopicRoadmapItem({required this.topic, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppTheme.background.withOpacity(0.5)),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Checkbox
          Checkbox(
            value: topic.isCompleted,
            onChanged: (val) {
              provider.toggleTopicCompletion(topic.subjectName, topic.topicName);
            },
          ),
          const SizedBox(width: 8),

          // Topic details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  topic.topicName,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: topic.isCompleted ? AppTheme.textSecondary : context.textColor,
                    decoration: topic.isCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    // Difficulty tag
                    Text(
                      topic.difficulty,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: topic.difficulty == 'Easy'
                            ? AppTheme.success
                            : (topic.difficulty == 'Medium' ? Colors.amber : AppTheme.error),
                      ),
                    ),
                    const SizedBox(width: 8),
                    if (topic.note.isNotEmpty)
                      const Icon(Icons.note_alt, size: 12, color: AppTheme.secondary),
                  ],
                ),
              ],
            ),
          ),

          // Action buttons
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Add to revision queue
              IconButton(
                icon: Icon(
                  topic.inRevisionQueue ? Icons.repeat_one_on_rounded : Icons.repeat_rounded,
                  color: topic.inRevisionQueue ? AppTheme.secondary : AppTheme.textSecondary,
                  size: 20,
                ),
                onPressed: () {
                  if (!topic.inRevisionQueue) {
                    provider.addTopicToRevision(topic.subjectName, topic.topicName);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Added "${topic.topicName}" to Revision Queue!'),
                        backgroundColor: AppTheme.secondary,
                      ),
                    );
                  }
                },
                tooltip: topic.inRevisionQueue ? 'In Revision Queue' : 'Add to Revision Queue',
              ),
              // Add to error log
              IconButton(
                icon: Icon(
                  topic.inErrorLog ? Icons.error : Icons.error_outline_rounded,
                  color: topic.inErrorLog ? AppTheme.error : AppTheme.textSecondary,
                  size: 20,
                ),
                onPressed: () {
                  _showQuickErrorSheet(context, topic.subjectName, topic.topicName);
                },
                tooltip: 'Add to Error Log',
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showQuickErrorSheet(BuildContext context, String subject, String topicName) {
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
                    'Add to Error Log: $topicName',
                    style: AppTheme.poppinsBold(fontSize: 16),
                  ),
                  const SizedBox(height: 16),

                  // Question Text
                  const Text('Question Text', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: questionController,
                    style: TextStyle(color: context.textColor),
                    maxLines: 2,
                    decoration: InputDecoration(
                      hintText: 'Paste or write the question...',
                      hintStyle: const TextStyle(color: AppTheme.textSecondary),
                      filled: true,
                      fillColor: context.colorSurface,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (val) => val == null || val.trim().isEmpty ? 'Please enter the question' : null,
                  ),
                  const SizedBox(height: 12),

                  // Why Wrong
                  const Text('Why did you get it wrong?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.error)),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: whyWrongController,
                    style: TextStyle(color: context.textColor),
                    maxLines: 2,
                    decoration: InputDecoration(
                      hintText: 'Explain the mistake briefly...',
                      hintStyle: const TextStyle(color: AppTheme.textSecondary),
                      filled: true,
                      fillColor: context.colorSurface,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (val) => val == null || val.trim().isEmpty ? 'Please explain the mistake' : null,
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
                            subject,
                            topicName,
                            questionController.text.trim(),
                            whyWrongController.text.trim(),
                          );
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Saved to Error Log!'),
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
  }
}
