import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/app_provider.dart';
import '../theme/app_theme.dart';
import '../data/study_plan.dart';
import '../models/models.dart';
import '../services/storage_service.dart';
import 'pyq_screen.dart';

class PlannerScreen extends StatefulWidget {
  const PlannerScreen({super.key});

  @override
  State<PlannerScreen> createState() => _PlannerScreenState();
}

class _PlannerScreenState extends State<PlannerScreen> {
  late ScrollController _scrollController;
  final TextEditingController _searchController = TextEditingController();

  // Agile Checklist state
  String _checklistSearchQuery = '';
  String _checklistFilter = 'All'; // 'All', 'Unfinished', 'Concept Left', 'PYQ Left', 'Needs Revision'
  final Set<String> _expandedSubjects = {};

  // Dynamic calendar range centered around DateTime.now()
  late final DateTime _calendarStart;
  late final DateTime _calendarEnd;

  static final List<Map<String, dynamic>> daPhasesData = [
    {
      'num': '1',
      'jsonName': 'Probability & Statistics',
      'displayName': 'Probability & Statistics',
      'dates': 'May 1 - May 28',
      'runway': '4 Weeks',
      'days': 28,
      'hours': 77,
      'weightage': '~17–20 Marks',
    },
    {
      'num': '2',
      'jsonName': 'Linear Algebra',
      'displayName': 'Linear Algebra',
      'dates': 'May 29 - Jul 2',
      'runway': '5 Weeks',
      'days': 35,
      'hours': 96,
      'weightage': '~11–14 Marks',
    },
    {
      'num': '3',
      'jsonName': 'Calculus & Optimization',
      'displayName': 'Calculus & Optimization',
      'dates': 'Jul 3 - Jul 22',
      'runway': '3 Weeks',
      'days': 20,
      'hours': 55,
      'weightage': '~9–11 Marks',
    },
    {
      'num': '4',
      'jsonName': 'Machine Learning',
      'displayName': 'Machine Learning',
      'dates': 'Jul 23 - Sep 15',
      'runway': '8 Weeks',
      'days': 55,
      'hours': 151,
      'weightage': '~18–22 Marks',
    },
    {
      'num': '5',
      'jsonName': 'Programming, DSA & Python',
      'displayName': 'DSA & Python',
      'dates': 'Sep 16 - Oct 20',
      'runway': '5 Weeks',
      'days': 35,
      'hours': 96,
      'weightage': '~10–14 Marks',
    },
    {
      'num': '6',
      'jsonName': 'Database Management',
      'displayName': 'DBMS',
      'dates': 'Oct 21 - Nov 11',
      'runway': '3 Weeks',
      'days': 22,
      'hours': 60,
      'weightage': '~7–10 Marks',
    },
    {
      'num': '7',
      'jsonName': 'AI & Logic',
      'displayName': 'AI & Logic',
      'dates': 'Nov 12 - Nov 30',
      'runway': '3 Weeks',
      'days': 19,
      'hours': 52,
      'weightage': '~9–12 Marks',
    },
    {
      'num': '8',
      'jsonName': 'Grand Revision & Mocks',
      'displayName': 'Grand Revision + 7 Mocks',
      'dates': 'Dec 1 - Feb 1',
      'runway': '9 Weeks',
      'days': 62,
      'hours': 151,
      'weightage': 'Exam Simulation',
    },
  ];

  static final List<Map<String, dynamic>> csitPhasesData = [
    {
      'num': '1',
      'jsonName': 'Engineering Mathematics',
      'displayName': 'Engineering Mathematics',
      'dates': 'May 1 - Jun 9',
      'runway': '6 Weeks',
      'days': 40,
      'hours': 112,
      'weightage': '~10–13 Marks',
    },
    {
      'num': '2',
      'jsonName': 'Digital Logic',
      'displayName': 'Digital Logic',
      'dates': 'Jun 10 - Jun 19',
      'runway': '1.5 Weeks',
      'days': 10,
      'hours': 28,
      'weightage': '~5–7 Marks',
    },
    {
      'num': '3',
      'jsonName': 'Computer Organization and Architecture',
      'displayName': 'Computer Organization and Architecture',
      'dates': 'Jun 20 - Jul 5',
      'runway': '2.5 Weeks',
      'days': 16,
      'hours': 44,
      'weightage': '~8–11 Marks',
    },
    {
      'num': '4',
      'jsonName': 'Programming and Data Structures',
      'displayName': 'Programming and Data Structures',
      'dates': 'Jul 6 - Jul 20',
      'runway': '2 Weeks',
      'days': 15,
      'hours': 42,
      'weightage': '~10–13 Marks',
    },
    {
      'num': '5',
      'jsonName': 'Algorithms',
      'displayName': 'Algorithms',
      'dates': 'Jul 21 - Aug 7',
      'runway': '2.5 Weeks',
      'days': 18,
      'hours': 50,
      'weightage': '~8–11 Marks',
    },
    {
      'num': '6',
      'jsonName': 'Theory of Computation',
      'displayName': 'Theory of Computation',
      'dates': 'Aug 8 - Aug 25',
      'runway': '2.5 Weeks',
      'days': 18,
      'hours': 50,
      'weightage': '~8–10 Marks',
    },
    {
      'num': '7',
      'jsonName': 'Compiler Design',
      'displayName': 'Compiler Design',
      'dates': 'Aug 26 - Sep 7',
      'runway': '2 Weeks',
      'days': 13,
      'hours': 36,
      'weightage': '~4–6 Marks',
    },
    {
      'num': '8',
      'jsonName': 'Operating System',
      'displayName': 'Operating System',
      'dates': 'Sep 8 - Sep 27',
      'runway': '3 Weeks',
      'days': 20,
      'hours': 56,
      'weightage': '~8–10 Marks',
    },
    {
      'num': '9',
      'jsonName': 'Databases',
      'displayName': 'Databases',
      'dates': 'Sep 28 - Oct 13',
      'runway': '2 Weeks',
      'days': 16,
      'hours': 44,
      'weightage': '~7–9 Marks',
    },
    {
      'num': '10',
      'jsonName': 'Computer Networks',
      'displayName': 'Computer Networks',
      'dates': 'Oct 14 - Oct 31',
      'runway': '2.5 Weeks',
      'days': 18,
      'hours': 50,
      'weightage': '~8–11 Marks',
    },
    {
      'num': '11',
      'jsonName': 'General Aptitude',
      'displayName': 'General Aptitude',
      'dates': 'Nov 1 - Nov 9',
      'runway': '1.5 Weeks',
      'days': 9,
      'hours': 25,
      'weightage': '15 Marks (Fixed)',
    },
    {
      'num': '12',
      'jsonName': 'Revision & Mock Tests',
      'displayName': 'Revision & Mock Tests',
      'dates': 'Nov 10 - Jan 16',
      'runway': '9 Weeks',
      'days': 68,
      'hours': 190,
      'weightage': 'Exam Simulation',
    },
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    // Rolling calendar range: 30 days before today to 120 days after today
    final now = DateTime.now();
    _calendarStart = DateTime(now.year, now.month, now.day).subtract(const Duration(days: 30));
    _calendarEnd = DateTime(now.year, now.month, now.day).add(const Duration(days: 120));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<AppProvider>(context, listen: false);
      final today = DateTime.now();
      provider.setSelectedDate(DateTime(today.year, today.month, today.day));
      _scrollToSelectedDate(immediate: true);
    });
  }

  void _scrollToSelectedDate({bool immediate = false}) {
    if (!_scrollController.hasClients) return;

    final provider = Provider.of<AppProvider>(context, listen: false);
    final selectedDate = provider.selectedDate;
    final diff = selectedDate.difference(_calendarStart).inDays;

    final totalDays = _calendarEnd.difference(_calendarStart).inDays + 1;
    if (diff >= 0 && diff < totalDays) {
      final targetOffset = diff * 68.0 - (MediaQuery.of(context).size.width / 2) + 34.0;
      if (immediate) {
        _scrollController.jumpTo(targetOffset.clamp(0.0, _scrollController.position.maxScrollExtent));
      } else {
        _scrollController.animateTo(
          targetOffset.clamp(0.0, _scrollController.position.maxScrollExtent),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  void _selectDate(DateTime date) {
    final provider = Provider.of<AppProvider>(context, listen: false);
    provider.setSelectedDate(date);
    _scrollToSelectedDate();
  }

  int _getActivePhaseNumber() {
    final provider = Provider.of<AppProvider>(context, listen: false);
    final now = DateTime.now();
    final todayStr = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";

    if (provider.activeExam == 'CSIT') {
      if (todayStr.compareTo('2026-06-09') <= 0) return 1;
      if (todayStr.compareTo('2026-06-19') <= 0) return 2;
      if (todayStr.compareTo('2026-07-05') <= 0) return 3;
      if (todayStr.compareTo('2026-07-20') <= 0) return 4;
      if (todayStr.compareTo('2026-08-07') <= 0) return 5;
      if (todayStr.compareTo('2026-08-25') <= 0) return 6;
      if (todayStr.compareTo('2026-09-07') <= 0) return 7;
      if (todayStr.compareTo('2026-09-27') <= 0) return 8;
      if (todayStr.compareTo('2026-10-13') <= 0) return 9;
      if (todayStr.compareTo('2026-10-31') <= 0) return 10;
      if (todayStr.compareTo('2026-11-09') <= 0) return 11;
      return 12;
    } else {
      if (todayStr.compareTo('2026-05-01') < 0) return 1;
      if (todayStr.compareTo('2026-05-28') <= 0) return 1;
      if (todayStr.compareTo('2026-07-02') <= 0) return 2;
      if (todayStr.compareTo('2026-07-22') <= 0) return 3;
      if (todayStr.compareTo('2026-09-15') <= 0) return 4;
      if (todayStr.compareTo('2026-10-20') <= 0) return 5;
      if (todayStr.compareTo('2026-11-11') <= 0) return 6;
      if (todayStr.compareTo('2026-11-30') <= 0) return 7;
      return 8;
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Syllabus & Planner',
            style: AppTheme.poppinsBold(fontSize: 20),
          ),
          bottom: const TabBar(
            indicatorColor: AppTheme.secondary,
            labelColor: AppTheme.secondary,
            unselectedLabelColor: AppTheme.textSecondary,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(text: 'Agile Checklist'),
              Tab(text: 'Daily Plan'),
              Tab(text: 'Phase Runway'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildAgileChecklistTab(context, provider),
            _buildDailyPlanTab(context, provider),
            _buildPhaseOverviewTab(context, provider),
          ],
        ),
      ),
    );
  }

  // ==========================================
  // TAB 1: AGILE SYLLABUS CHECKLIST
  // ==========================================
  Widget _buildAgileChecklistTab(BuildContext context, AppProvider provider) {
    final isCSIT = provider.activeExam == 'CSIT';
    final syllabus = isCSIT ? StorageService.csitSyllabusData : StorageService.syllabusData;

    // Calculate overall stats
    int totalTopics = 0;
    int masteredTopics = 0;
    syllabus.forEach((subject, topics) {
      totalTopics += topics.length;
      for (final t in topics) {
        if (provider.getTopicStatus(subject, t).isCompleted) {
          masteredTopics++;
        }
      }
    });

    final overallProgress = totalTopics > 0 ? (masteredTopics / totalTopics) : 0.0;

    return Column(
      children: [
        // Summary & Search Header
        Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          decoration: BoxDecoration(
            color: AppTheme.surface,
            border: Border(bottom: BorderSide(color: Colors.white.withValues(alpha: 0.08))),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Overall Progress Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Syllabus Mastery',
                    style: AppTheme.poppinsBold(fontSize: 13, color: Colors.white70),
                  ),
                  Text(
                    '$masteredTopics / $totalTopics Topics (${(overallProgress * 100).toStringAsFixed(0)}%)',
                    style: const TextStyle(
                      color: AppTheme.secondary,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: overallProgress,
                  minHeight: 6,
                  backgroundColor: Colors.white.withValues(alpha: 0.08),
                  valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.secondary),
                ),
              ),
              const SizedBox(height: 12),
              // Search Bar
              TextField(
                controller: _searchController,
                onChanged: (val) {
                  setState(() {
                    _checklistSearchQuery = val.trim();
                  });
                },
                style: const TextStyle(color: Colors.white, fontSize: 13),
                decoration: InputDecoration(
                  hintText: 'Search topics (e.g. Eigenvalues, Bayes, Pipelining)...',
                  hintStyle: const TextStyle(color: AppTheme.textSecondary, fontSize: 13),
                  prefixIcon: const Icon(Icons.search, size: 18, color: AppTheme.textSecondary),
                  suffixIcon: _checklistSearchQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.close, size: 16, color: Colors.white70),
                          onPressed: () {
                            _searchController.clear();
                            setState(() {
                              _checklistSearchQuery = '';
                            });
                          },
                        )
                      : null,
                  filled: true,
                  fillColor: AppTheme.background,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: AppTheme.secondary),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Filter Chips
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildFilterChip('All', 'All'),
                    _buildFilterChip('Unfinished', 'Unfinished'),
                    _buildFilterChip('Concept Left', '🎬 Concept Left'),
                    _buildFilterChip('PYQ Left', '📝 PYQ Left'),
                    _buildFilterChip('Needs Revision', '🔄 Needs Revision'),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Subject Accordions
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            physics: const BouncingScrollPhysics(),
            itemCount: syllabus.keys.length,
            itemBuilder: (context, index) {
              final subject = syllabus.keys.elementAt(index);
              final allTopics = syllabus[subject]!;

              // Filter topics according to search & filter chip
              final filteredTopics = allTopics.where((topic) {
                // Search filter
                if (_checklistSearchQuery.isNotEmpty) {
                  final q = _checklistSearchQuery.toLowerCase();
                  if (!topic.toLowerCase().contains(q) && !subject.toLowerCase().contains(q)) {
                    return false;
                  }
                }

                // Status filter
                final st = provider.getTopicStatus(subject, topic);
                if (_checklistFilter == 'Unfinished' && st.isCompleted) return false;
                if (_checklistFilter == 'Concept Left' && st.conceptWatched) return false;
                if (_checklistFilter == 'PYQ Left' && st.pyqSolved) return false;
                if (_checklistFilter == 'Needs Revision' && st.revisedOnce) return false;

                return true;
              }).toList();

              if (_checklistSearchQuery.isNotEmpty && filteredTopics.isEmpty) {
                return const SizedBox.shrink();
              }

              final progress = provider.getSubjectProgress(subject, allTopics);
              final masteredInSubject = allTopics.where((t) => provider.getTopicStatus(subject, t).isCompleted).length;
              final isExpanded = _expandedSubjects.contains(subject) || (_checklistSearchQuery.isNotEmpty && filteredTopics.isNotEmpty);

              final weightageInfo = _getSubjectWeightageBadge(subject, isCSIT);

              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: progress == 1.0
                        ? AppTheme.secondary.withValues(alpha: 0.3)
                        : Colors.white.withValues(alpha: 0.08),
                  ),
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    initiallyExpanded: isExpanded,
                    onExpansionChanged: (expanded) {
                      setState(() {
                        if (expanded) {
                          _expandedSubjects.add(subject);
                        } else {
                          _expandedSubjects.remove(subject);
                        }
                      });
                    },
                    tilePadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(
                            subject,
                            style: AppTheme.poppinsBold(fontSize: 14),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: weightageInfo['color'].withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: weightageInfo['color'].withValues(alpha: 0.3)),
                          ),
                          child: Text(
                            weightageInfo['label'],
                            style: TextStyle(
                              color: weightageInfo['color'],
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(3),
                              child: LinearProgressIndicator(
                                value: progress,
                                minHeight: 4,
                                backgroundColor: Colors.white.withValues(alpha: 0.06),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  progress == 1.0 ? AppTheme.secondary : AppTheme.primary,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '$masteredInSubject/${allTopics.length} (${(progress * 100).toStringAsFixed(0)}%)',
                            style: TextStyle(
                              color: progress == 1.0 ? AppTheme.secondary : AppTheme.textSecondary,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(14, 0, 14, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Showing ${filteredTopics.length} Topics',
                              style: const TextStyle(color: AppTheme.textSecondary, fontSize: 11),
                            ),
                            TextButton.icon(
                              style: TextButton.styleFrom(
                                foregroundColor: AppTheme.secondary,
                                padding: EdgeInsets.zero,
                                visualDensity: VisualDensity.compact,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PYQScreen(initialSubject: subject),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.quiz_outlined, size: 14),
                              label: const Text('Solve PYQs', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                      const Divider(height: 1, color: Colors.white10),
                      ...filteredTopics.map((topic) {
                        final status = provider.getTopicStatus(subject, topic);
                        return _buildTopicChecklistItem(context, provider, subject, topic, status);
                      }),
                      const SizedBox(height: 6),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFilterChip(String filterKey, String label) {
    final isSelected = _checklistFilter == filterKey;
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: InkWell(
        onTap: () {
          HapticFeedback.selectionClick();
          setState(() {
            _checklistFilter = filterKey;
          });
        },
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.primary : AppTheme.background,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isSelected ? AppTheme.primary : Colors.white.withValues(alpha: 0.12),
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : AppTheme.textSecondary,
              fontSize: 11,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Map<String, dynamic> _getSubjectWeightageBadge(String subject, bool isCSIT) {
    final s = subject.toLowerCase();
    if (s.contains('aptitude')) {
      return {'label': '15M Fixed', 'color': AppTheme.primary};
    }
    if (s.contains('machine learning') || s.contains('probability') || s.contains('engineering math')) {
      return {'label': 'High Yield (~18M)', 'color': const Color(0xFFFF5252)};
    }
    if (s.contains('linear algebra') || s.contains('algorithms') || s.contains('data structures')) {
      return {'label': 'High (~12M)', 'color': const Color(0xFFFF9100)};
    }
    if (s.contains('calculus') || s.contains('theory of comp') || s.contains('operating system') || s.contains('network')) {
      return {'label': 'Medium (~9M)', 'color': const Color(0xFFFFD600)};
    }
    return {'label': 'Core (~6M)', 'color': const Color(0xFF64B5F6)};
  }

  Widget _buildTopicChecklistItem(BuildContext context, AppProvider provider, String subject, String topic, TopicStatus status) {
    final isFullyMastered = status.conceptWatched && status.pyqSolved && status.revisedOnce;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isFullyMastered
            ? AppTheme.secondary.withValues(alpha: 0.05)
            : AppTheme.background.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isFullyMastered
              ? AppTheme.secondary.withValues(alpha: 0.25)
              : Colors.white.withValues(alpha: 0.05),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  topic,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: isFullyMastered ? FontWeight.bold : FontWeight.w500,
                    color: isFullyMastered ? Colors.white : Colors.white.withValues(alpha: 0.85),
                  ),
                ),
              ),
              if (isFullyMastered)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppTheme.secondary.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'MASTERED',
                    style: TextStyle(
                      color: AppTheme.secondary,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          // 3 Checkbox Action Pills
          Row(
            children: [
              _buildMilestonePill(
                label: 'Concept',
                icon: Icons.play_circle_fill_rounded,
                isDone: status.conceptWatched,
                activeColor: const Color(0xFF2962FF),
                onTap: () {
                  HapticFeedback.selectionClick();
                  provider.toggleTopicMilestone(subject, topic, 'concept');
                },
              ),
              const SizedBox(width: 8),
              _buildMilestonePill(
                label: 'PYQ',
                icon: Icons.assignment_turned_in_rounded,
                isDone: status.pyqSolved,
                activeColor: const Color(0xFFFF9100),
                onTap: () {
                  HapticFeedback.selectionClick();
                  provider.toggleTopicMilestone(subject, topic, 'pyq');
                },
              ),
              const SizedBox(width: 8),
              _buildMilestonePill(
                label: 'Revise',
                icon: Icons.sync_rounded,
                isDone: status.revisedOnce,
                activeColor: const Color(0xFF00D4AA),
                onTap: () {
                  HapticFeedback.selectionClick();
                  provider.toggleTopicMilestone(subject, topic, 'revise');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMilestonePill({
    required String label,
    required IconData icon,
    required bool isDone,
    required Color activeColor,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
          decoration: BoxDecoration(
            color: isDone ? activeColor.withValues(alpha: 0.15) : Colors.white.withValues(alpha: 0.03),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isDone ? activeColor : Colors.white.withValues(alpha: 0.12),
              width: isDone ? 1.4 : 1.0,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isDone ? Icons.check_circle_rounded : icon,
                size: 13,
                color: isDone ? activeColor : AppTheme.textSecondary,
              ),
              const SizedBox(width: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: isDone ? FontWeight.bold : FontWeight.w500,
                  color: isDone ? activeColor : AppTheme.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ==========================================
  // TAB 2: DAILY PLAN WITH ROLLING CALENDAR
  // ==========================================
  Widget _buildDailyPlanTab(BuildContext context, AppProvider provider) {
    final selectedDate = provider.selectedDate;
    final dateStr = "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";

    final items = provider.currentStudyPlanItems;
    final itemIndex = items.indexWhere((item) => item.date == dateStr);

    return Column(
      children: [
        _buildCalendarStrip(context, provider),
        const Divider(height: 1, color: Color(0xFF2A2A3C)),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            child: itemIndex == -1
                ? _buildAgileDailyMission(context, provider, selectedDate)
                : _buildDayDetailCard(context, provider, items[itemIndex]),
          ),
        ),
      ],
    );
  }

  Widget _buildCalendarStrip(BuildContext context, AppProvider provider) {
    final totalDays = _calendarEnd.difference(_calendarStart).inDays + 1;

    return Container(
      height: 95,
      color: AppTheme.background,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: totalDays,
        itemBuilder: (context, index) {
          final date = _calendarStart.add(Duration(days: index));
          final isSelected = DateUtils.isSameDay(date, provider.selectedDate);
          final isToday = DateUtils.isSameDay(date, DateTime.now());
          final dateStr = "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";

          final planItems = provider.currentStudyPlanItems;
          final matchedItem = planItems.where((i) => i.date == dateStr).firstOrNull;
          final isCompleted = matchedItem != null && provider.isStudyDayCompleted(matchedItem.day);

          return GestureDetector(
            onTap: () => _selectDate(date),
            child: Container(
              width: 58,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: isSelected ? AppTheme.primary : AppTheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isToday
                      ? AppTheme.secondary
                      : (isSelected ? Colors.transparent : Colors.white10),
                  width: isToday ? 2.0 : 1.0,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isToday ? 'TODAY' : (matchedItem != null ? 'DAY ${matchedItem.day}' : 'DAY'),
                    style: TextStyle(
                      color: isToday ? AppTheme.secondary : (isSelected ? Colors.white70 : AppTheme.textSecondary),
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    DateFormat('d').format(date),
                    style: AppTheme.timerStyle(
                      fontSize: 18,
                      color: isSelected ? Colors.white : Colors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    DateFormat('E').format(date).toUpperCase(),
                    style: TextStyle(
                      color: isSelected ? Colors.white60 : AppTheme.textSecondary,
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (isCompleted) ...[
                    const SizedBox(height: 4),
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: AppTheme.secondary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAgileDailyMission(BuildContext context, AppProvider provider, DateTime selectedDate) {
    final isCSIT = provider.activeExam == 'CSIT';
    final syllabus = isCSIT ? StorageService.csitSyllabusData : StorageService.syllabusData;

    // Pick top uncompleted topic from highest weightage subject
    String? recommendedSubject;
    String? recommendedTopic;

    for (final entry in syllabus.entries) {
      for (final t in entry.value) {
        final st = provider.getTopicStatus(entry.key, t);
        if (!st.isCompleted) {
          recommendedSubject = entry.key;
          recommendedTopic = t;
          break;
        }
      }
      if (recommendedTopic != null) break;
    }

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 800),
      child: Card(
        color: AppTheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: AppTheme.secondary.withValues(alpha: 0.2), width: 1.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.secondary.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'AGILE DAILY TARGET',
                      style: AppTheme.monospaceStyle(
                        fontSize: 11,
                        color: AppTheme.secondary,
                      ).copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    DateFormat('EEEE, MMM d, yyyy').format(selectedDate),
                    style: const TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (recommendedTopic != null) ...[
                Text(
                  recommendedSubject!.toUpperCase(),
                  style: const TextStyle(
                    color: AppTheme.secondary,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  recommendedTopic,
                  style: AppTheme.poppinsBold(fontSize: 20),
                ),
                const SizedBox(height: 10),
                const Text(
                  'This is your next high-priority concept. Track your mastery via the 3 active milestones below:',
                  style: TextStyle(color: AppTheme.textSecondary, fontSize: 13, height: 1.4),
                ),
                const SizedBox(height: 16),
                Builder(
                  builder: (context) {
                    final status = provider.getTopicStatus(recommendedSubject!, recommendedTopic!);
                    return Row(
                      children: [
                        _buildMilestonePill(
                          label: 'Concept',
                          icon: Icons.play_circle_fill_rounded,
                          isDone: status.conceptWatched,
                          activeColor: const Color(0xFF2962FF),
                          onTap: () {
                            HapticFeedback.selectionClick();
                            provider.toggleTopicMilestone(recommendedSubject!, recommendedTopic!, 'concept');
                          },
                        ),
                        const SizedBox(width: 8),
                        _buildMilestonePill(
                          label: 'PYQ',
                          icon: Icons.assignment_turned_in_rounded,
                          isDone: status.pyqSolved,
                          activeColor: const Color(0xFFFF9100),
                          onTap: () {
                            HapticFeedback.selectionClick();
                            provider.toggleTopicMilestone(recommendedSubject!, recommendedTopic!, 'pyq');
                          },
                        ),
                        const SizedBox(width: 8),
                        _buildMilestonePill(
                          label: 'Revise',
                          icon: Icons.sync_rounded,
                          isDone: status.revisedOnce,
                          activeColor: const Color(0xFF00D4AA),
                          onTap: () {
                            HapticFeedback.selectionClick();
                            provider.toggleTopicMilestone(recommendedSubject!, recommendedTopic!, 'revise');
                          },
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primary,
                    minimumSize: const Size(double.infinity, 44),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PYQScreen(initialSubject: recommendedSubject),
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_forward_rounded, size: 16),
                  label: Text('Solve $recommendedSubject PYQs'),
                ),
              ] else ...[
                const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        Icon(Icons.emoji_events_rounded, color: AppTheme.secondary, size: 48),
                        SizedBox(height: 12),
                        Text('All Syllabus Topics Mastered!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(height: 6),
                        Text('Take a full-length mock test to assess your examination readiness.', style: TextStyle(color: AppTheme.textSecondary, fontSize: 13)),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDayDetailCard(BuildContext context, AppProvider provider, StudyPlanItem item) {
    final isCompleted = provider.isStudyDayCompleted(item.day);
    final userNote = provider.getStudyDayUserNote(item.day);

    String diff = 'Medium';
    if (item.type == 'foundation') diff = 'Easy';
    if (item.type == 'revision') diff = 'Easy';
    if (item.type == 'core' || item.type == 'practice') diff = 'Medium';
    if (item.type == 'advanced' || item.type == 'exam') diff = 'Hard';

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 800),
      child: Card(
        color: AppTheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: isCompleted ? AppTheme.secondary.withValues(alpha: 0.3) : Colors.white.withValues(alpha: 0.05),
            width: 1.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.primary.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'DAY ${item.day}',
                      style: AppTheme.monospaceStyle(
                        fontSize: 12,
                        color: AppTheme.primary,
                      ).copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    DateFormat('EEEE, MMMM dd, yyyy').format(DateTime.parse(item.date)),
                    style: const TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                item.subject.toUpperCase(),
                style: const TextStyle(
                  color: AppTheme.secondary,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                item.topic,
                style: AppTheme.poppinsBold(fontSize: 20),
              ),
              const SizedBox(height: 8),
              Text(
                'Phase: ${item.phase}',
                style: const TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildTypeBadge(item.type),
                  _buildDifficultyBadge(diff),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${item.totalHours.toStringAsFixed(1)} HRS',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(color: Colors.white10),
              const SizedBox(height: 16),
              Text(
                'STUDY METRICS',
                style: AppTheme.poppinsBold(fontSize: 12, color: Colors.white70),
              ),
              const SizedBox(height: 12),
              _buildMetricRow(Icons.menu_book, 'Study Hours', '${item.studyHours.toStringAsFixed(1)} hours'),
              const SizedBox(height: 8),
              _buildMetricRow(Icons.timer, 'Aptitude Practice', '${item.aptitudeMinutes} minutes'),
              const SizedBox(height: 8),
              _buildMetricRow(Icons.insights, 'Total Target', '${item.totalHours.toStringAsFixed(1)} hours'),
              const SizedBox(height: 20),
              const Divider(color: Colors.white10),
              const SizedBox(height: 16),
              if (item.notes.trim().isNotEmpty) ...[
                Text(
                  'CURRICULUM TASKS / NOTES',
                  style: AppTheme.poppinsBold(fontSize: 12, color: Colors.white70),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.03),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
                  ),
                  child: Text(
                    item.notes,
                    style: const TextStyle(color: AppTheme.textSecondary, fontSize: 13, height: 1.4),
                  ),
                ),
                const SizedBox(height: 20),
              ],
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'MY PERSONAL STUDY NOTES',
                    style: AppTheme.poppinsBold(fontSize: 12, color: Colors.white70),
                  ),
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      foregroundColor: AppTheme.secondary,
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () => _showPersonalNoteDialog(context, provider, item.day, userNote),
                    icon: const Icon(Icons.edit, size: 14),
                    label: Text(userNote.isNotEmpty ? 'Edit' : 'Add Note', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              if (userNote.isNotEmpty)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withValues(alpha: 0.03),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppTheme.primary.withValues(alpha: 0.15)),
                  ),
                  child: Text(
                    userNote,
                    style: const TextStyle(color: Colors.white, fontSize: 13, height: 1.4, fontStyle: FontStyle.italic),
                  ),
                )
              else
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.02),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.02)),
                  ),
                  child: const Text(
                    'No personal notes added yet. Use notes to track definitions, formulas, or concepts you want to remember.',
                    style: TextStyle(color: AppTheme.textSecondary, fontSize: 12, fontStyle: FontStyle.italic),
                  ),
                ),
              const SizedBox(height: 24),
              InkWell(
                onTap: () {
                  HapticFeedback.selectionClick();
                  provider.toggleStudyDayCompletion(item.day);
                },
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  decoration: BoxDecoration(
                    color: isCompleted ? AppTheme.secondary.withValues(alpha: 0.1) : AppTheme.primary.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isCompleted ? AppTheme.secondary : AppTheme.primary.withValues(alpha: 0.3),
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
                        color: isCompleted ? AppTheme.secondary : AppTheme.primary,
                        size: 20,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        isCompleted ? 'DAY COMPLETED' : 'MARK AS COMPLETED',
                        style: TextStyle(
                          color: isCompleted ? AppTheme.secondary : Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMetricRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppTheme.secondary),
        const SizedBox(width: 10),
        Text(
          label,
          style: const TextStyle(color: AppTheme.textSecondary, fontSize: 13),
        ),
        const Spacer(),
        Text(
          value,
          style: AppTheme.monospaceStyle(fontSize: 13, color: Colors.white).copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  void _showPersonalNoteDialog(BuildContext context, AppProvider provider, int day, String currentNote) {
    final controller = TextEditingController(text: currentNote);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppTheme.surface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text(
            'Personal Note (Day $day)',
            style: AppTheme.poppinsBold(fontSize: 18),
          ),
          content: TextField(
            controller: controller,
            maxLines: 5,
            autofocus: true,
            style: const TextStyle(color: Colors.white, fontSize: 14),
            decoration: InputDecoration(
              hintText: 'Add formulas, definitions, reminders...',
              hintStyle: const TextStyle(color: AppTheme.textSecondary),
              filled: true,
              fillColor: Colors.black.withValues(alpha: 0.2),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: AppTheme.secondary),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel', style: TextStyle(color: AppTheme.textSecondary)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {
                provider.updateStudyDayUserNote(day, controller.text.trim());
                Navigator.pop(context);
              },
              child: const Text('Save Note', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTypeBadge(String type) {
    Color bg;
    Color text;
    switch (type.toLowerCase()) {
      case 'foundation':
        bg = const Color(0xFF1E293B);
        text = const Color(0xFF38BDF8);
        break;
      case 'core':
        bg = const Color(0xFF2D1B00);
        text = const Color(0xFFFBBF24);
        break;
      case 'advanced':
        bg = const Color(0xFF2E1065);
        text = const Color(0xFFC084FC);
        break;
      case 'practice':
        bg = const Color(0xFF022C22);
        text = const Color(0xFF34D399);
        break;
      case 'revision':
        bg = const Color(0xFF172554);
        text = const Color(0xFF60A5FA);
        break;
      case 'exam':
        bg = const Color(0xFF450A0A);
        text = const Color(0xFFF87171);
        break;
      default:
        bg = const Color(0xFF1F2937);
        text = const Color(0xFF9CA3AF);
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        type.toUpperCase(),
        style: TextStyle(
          color: text,
          fontSize: 10,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.1,
        ),
      ),
    );
  }

  Widget _buildDifficultyBadge(String difficulty) {
    Color bg;
    Color text;
    switch (difficulty.toLowerCase()) {
      case 'easy':
        bg = const Color(0xFF064E3B);
        text = const Color(0xFF34D399);
        break;
      case 'medium':
        bg = const Color(0xFF78350F);
        text = const Color(0xFFFBBF24);
        break;
      case 'hard':
        bg = const Color(0xFF7F1D1D);
        text = const Color(0xFFF87171);
        break;
      default:
        bg = const Color(0xFF1F2937);
        text = const Color(0xFF9CA3AF);
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        difficulty.toUpperCase(),
        style: TextStyle(
          color: text,
          fontSize: 10,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.1,
        ),
      ),
    );
  }

  // ==========================================
  // TAB 3: PHASE RUNWAY (OVERVIEW)
  // ==========================================
  Widget _buildPhaseOverviewTab(BuildContext context, AppProvider provider) {
    final activePhaseNum = _getActivePhaseNumber();

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'SYLLABUS PHASES & RUNWAY',
                      style: AppTheme.poppinsBold(fontSize: 16),
                    ),
                    Text(
                      'Active Phase: #$activePhaseNum',
                      style: const TextStyle(
                        color: AppTheme.secondary,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              ...(provider.activeExam == 'CSIT' ? csitPhasesData : daPhasesData).map((phase) {
                final isCurrent = phase['num'] == activePhaseNum.toString();
                final progress = provider.getPhaseProgress(phase['jsonName']);

                return _buildPhaseRow(context, phase, isCurrent, progress);
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhaseRow(BuildContext context, Map<String, dynamic> phase, bool isCurrent, double progress) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: isCurrent ? AppTheme.primary.withValues(alpha: 0.08) : AppTheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isCurrent ? AppTheme.secondary.withValues(alpha: 0.4) : Colors.white.withValues(alpha: 0.06),
          width: isCurrent ? 1.5 : 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isCurrent ? AppTheme.secondary.withValues(alpha: 0.2) : Colors.white.withValues(alpha: 0.06),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    phase['num'],
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: isCurrent ? AppTheme.secondary : Colors.white70,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        phase['displayName'],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: isCurrent ? Colors.white : Colors.white.withValues(alpha: 0.9),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${phase['runway'] ?? ''} • ${phase['hours']} Hours',
                        style: const TextStyle(
                          color: AppTheme.textSecondary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    phase['weightage'] ?? '',
                    style: const TextStyle(
                      color: AppTheme.primary,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: progress,
                      backgroundColor: Colors.white.withValues(alpha: 0.06),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        progress == 1.0
                            ? AppTheme.secondary
                            : (isCurrent ? AppTheme.secondary : AppTheme.primary),
                      ),
                      minHeight: 5,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '${(progress * 100).toStringAsFixed(0)}%',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: progress == 1.0 ? AppTheme.secondary : AppTheme.textSecondary,
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
