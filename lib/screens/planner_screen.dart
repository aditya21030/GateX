import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/app_provider.dart';
import '../theme/app_theme.dart';
import '../data/study_plan.dart';
import '../models/models.dart';
import '../services/storage_service.dart';
import 'pyq_screen.dart';
import '../widgets/neu_widgets.dart';

class PlannerScreen extends StatefulWidget {
  const PlannerScreen({super.key});

  @override
  State<PlannerScreen> createState() => _PlannerScreenState();
}

class _PlannerScreenState extends State<PlannerScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
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
    _tabController = TabController(length: 3, vsync: this);
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

  void _jumpToChecklistWithSubject(String subject) {
    HapticFeedback.selectionClick();
    setState(() {
      _expandedSubjects.add(subject);
      _checklistSearchQuery = subject;
      _searchController.text = subject;
      _checklistFilter = 'All';
    });
    _tabController.animateTo(0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);

    return Scaffold(
        backgroundColor: context.colorBackground,
        appBar: AppBar(
          backgroundColor: context.colorSurface,
          elevation: 0,
          title: Text(
            'Syllabus & Planner',
            style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.bold, color: context.textColor),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: Container(
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 10),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: context.isDarkMode ? const Color(0xFF14151D) : const Color(0xFFF1F1F5),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: context.isDarkMode
                      ? Colors.white.withValues(alpha: 0.08)
                      : Colors.black.withValues(alpha: 0.06),
                ),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  color: AppTheme.accentPurple,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.accentPurple.withValues(alpha: 0.35),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                labelColor: Colors.white,
                unselectedLabelColor: context.textSecondaryColor,
                labelStyle: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 13),
                unselectedLabelStyle: GoogleFonts.outfit(fontWeight: FontWeight.w500, fontSize: 13),
                tabs: const [
                  Tab(height: 38, text: 'Agile Checklist'),
                  Tab(height: 38, text: 'Daily Plan'),
                  Tab(height: 38, text: 'Phase Runway'),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildAgileChecklistTab(context, provider),
            _buildDailyPlanTab(context, provider),
            _buildPhaseOverviewTab(context, provider),
          ],
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
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 6),
          child: NeuContainer(
            borderRadius: 22,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Progress Card: Circular Ring + Stat Counters
                Row(
                  children: [
                    // Circular Progress Indicator Ring
                    SizedBox(
                      width: 54,
                      height: 54,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            value: overallProgress,
                            strokeWidth: 5.5,
                            backgroundColor: context.isDarkMode
                                ? Colors.white.withValues(alpha: 0.08)
                                : Colors.black.withValues(alpha: 0.06),
                            valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.accentMint),
                          ),
                          Text(
                            '${(overallProgress * 100).toStringAsFixed(0)}%',
                            style: GoogleFonts.outfit(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: context.textColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 14),
                    // Stats Breakdown
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Syllabus Mastery',
                                style: GoogleFonts.outfit(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: context.textColor,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                                decoration: BoxDecoration(
                                  color: AppTheme.accentMint.withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  overallProgress >= 0.8
                                      ? 'GATE READY'
                                      : (overallProgress >= 0.4 ? 'ON TRACK' : 'IN PROGRESS'),
                                  style: GoogleFonts.outfit(
                                    color: AppTheme.accentMint,
                                    fontSize: 9.5,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 3),
                          Text(
                            '$masteredTopics of $totalTopics Topics Completed',
                            style: GoogleFonts.outfit(
                              color: context.textSecondaryColor,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 6),
                          NeuProgressBar(
                            progress: overallProgress,
                            progressColor: AppTheme.accentMint,
                            height: 6,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                // Search Bar
                NeuContainer(
                  isRecessed: true,
                  borderRadius: 14,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (val) {
                      setState(() {
                        _checklistSearchQuery = val.trim();
                      });
                    },
                    style: GoogleFonts.outfit(color: context.textColor, fontSize: 13.5),
                    decoration: InputDecoration(
                      hintText: 'Search topics (e.g. Eigenvalues, Bayes)...',
                      hintStyle: GoogleFonts.outfit(color: context.textSecondaryColor, fontSize: 13),
                      prefixIcon: Icon(Icons.search_rounded, size: 18, color: context.textSecondaryColor),
                      suffixIcon: _checklistSearchQuery.isNotEmpty
                          ? IconButton(
                              icon: Icon(Icons.close_rounded, size: 16, color: context.textSecondaryColor),
                              onPressed: () {
                                _searchController.clear();
                                setState(() {
                                  _checklistSearchQuery = '';
                                });
                              },
                            )
                          : null,
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                // Filter Chips
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      _buildFilterChip('All', 'All ($totalTopics)'),
                      _buildFilterChip('Unfinished', 'Pending (${totalTopics - masteredTopics})'),
                      _buildFilterChip('Concept Left', '🎬 Concept'),
                      _buildFilterChip('PYQ Left', '📝 PYQs'),
                      _buildFilterChip('Needs Revision', '🔄 Revise'),
                    ],
                  ),
                ),
              ],
            ),
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

              return NeuContainer(
                borderRadius: 18,
                margin: const EdgeInsets.only(bottom: 12),
                padding: EdgeInsets.zero,
                child: Theme(
                  data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    initiallyExpanded: isExpanded,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                    collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
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
                            style: AppTheme.poppinsBold(fontSize: 14, color: context.textColor),
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
                            child: NeuProgressBar(
                              progress: progress,
                              progressColor: progress == 1.0 ? AppTheme.accentMint : AppTheme.accentPurple,
                              height: 6,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '$masteredInSubject/${allTopics.length} (${(progress * 100).toStringAsFixed(0)}%)',
                            style: TextStyle(
                              color: progress == 1.0 ? AppTheme.accentMint : context.textSecondaryColor,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
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
      padding: const EdgeInsets.only(right: 7),
      child: InkWell(
        onTap: () {
          HapticFeedback.selectionClick();
          setState(() {
            _checklistFilter = filterKey;
          });
        },
        borderRadius: BorderRadius.circular(16),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6.5),
          decoration: BoxDecoration(
            color: isSelected
                ? AppTheme.accentPurple
                : (context.isDarkMode ? const Color(0xFF1B1D26) : const Color(0xFFEBEBF0)),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected
                  ? AppTheme.accentPurple
                  : (context.isDarkMode ? Colors.white.withValues(alpha: 0.08) : Colors.black.withValues(alpha: 0.06)),
              width: 1,
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: AppTheme.accentPurple.withValues(alpha: 0.35),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Text(
            label,
            style: GoogleFonts.outfit(
              color: isSelected ? Colors.white : context.textSecondaryColor,
              fontSize: 11.5,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
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

    return NeuContainer(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4.5),
      padding: const EdgeInsets.all(12),
      isRecessed: isFullyMastered,
      borderRadius: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  topic,
                  style: GoogleFonts.outfit(
                    fontSize: 13.5,
                    fontWeight: isFullyMastered ? FontWeight.bold : FontWeight.w600,
                    color: isFullyMastered ? AppTheme.accentMint : context.textColor,
                  ),
                ),
              ),
              if (isFullyMastered)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
                  decoration: BoxDecoration(
                    color: AppTheme.accentMint.withValues(alpha: 0.16),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.check_circle_rounded, size: 10.5, color: AppTheme.accentMint),
                      const SizedBox(width: 3.5),
                      Text(
                        'MASTERED',
                        style: GoogleFonts.outfit(
                          color: AppTheme.accentMint,
                          fontSize: 9.5,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 9),
          // 3 Checkbox Action Pills
          Row(
            children: [
              _buildMilestonePill(
                label: 'Concept',
                icon: Icons.play_circle_fill_rounded,
                isDone: status.conceptWatched,
                activeColor: const Color(0xFF6B38FF),
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
        borderRadius: BorderRadius.circular(10),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(vertical: 6.5, horizontal: 6),
          decoration: BoxDecoration(
            color: isDone
                ? activeColor.withValues(alpha: 0.16)
                : (context.isDarkMode ? Colors.white.withValues(alpha: 0.03) : Colors.black.withValues(alpha: 0.02)),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isDone
                  ? activeColor
                  : (context.isDarkMode ? Colors.white.withValues(alpha: 0.10) : Colors.black.withValues(alpha: 0.08)),
              width: isDone ? 1.3 : 1.0,
            ),
            boxShadow: isDone
                ? [
                    BoxShadow(
                      color: activeColor.withValues(alpha: 0.20),
                      blurRadius: 6,
                      offset: const Offset(0, 1),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isDone ? Icons.check_circle_rounded : icon,
                size: 13,
                color: isDone ? activeColor : context.textSecondaryColor,
              ),
              const SizedBox(width: 4),
              Text(
                label,
                style: GoogleFonts.outfit(
                  fontSize: 11,
                  fontWeight: isDone ? FontWeight.bold : FontWeight.w500,
                  color: isDone ? activeColor : context.textSecondaryColor,
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
        Divider(height: 1, color: context.colorBorder),
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
      color: context.colorBackground,
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
            child: NeuContainer(
              width: 58,
              borderRadius: 14,
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
              padding: const EdgeInsets.symmetric(vertical: 6),
              isRecessed: isSelected,
              color: isSelected ? AppTheme.accentPurple : null,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isToday ? 'TODAY' : (matchedItem != null ? 'DAY ${matchedItem.day}' : 'DAY'),
                    style: TextStyle(
                      color: isSelected ? Colors.white : (isToday ? AppTheme.secondary : context.textSecondaryColor),
                      fontSize: 8.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    DateFormat('d').format(date),
                    style: AppTheme.timerStyle(
                      fontSize: 17,
                      color: isSelected ? Colors.white : context.textColor,
                    ),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    DateFormat('E').format(date).toUpperCase(),
                    style: TextStyle(
                      color: isSelected ? Colors.white70 : context.textSecondaryColor,
                      fontSize: 8.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (isCompleted) ...[
                    const SizedBox(height: 3),
                    Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.white : AppTheme.accentMint,
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

    return NeuContainer(
      width: double.infinity,
      borderRadius: 22,
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
                style: TextStyle(
                  color: context.textSecondaryColor,
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
              style: AppTheme.poppinsBold(fontSize: 20, color: context.textColor),
            ),
            const SizedBox(height: 10),
            Text(
              'Track your concept milestones below:',
              style: TextStyle(color: context.textSecondaryColor, fontSize: 13),
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
            NeuButton(
              isPrimary: true,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PYQScreen(initialSubject: recommendedSubject),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.arrow_forward_rounded, size: 16, color: Colors.white),
                  const SizedBox(width: 8),
                  Text(
                    'Solve $recommendedSubject PYQs',
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            ),
          ] else ...[
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    const Icon(Icons.emoji_events_rounded, color: AppTheme.accentMint, size: 48),
                    const SizedBox(height: 12),
                    Text('All Syllabus Topics Mastered!', style: AppTheme.poppinsBold(fontSize: 16, color: context.textColor)),
                    const SizedBox(height: 6),
                    Text('Take a full-length mock test to assess your examination readiness.', style: TextStyle(color: context.textSecondaryColor, fontSize: 13)),
                  ],
                ),
              ),
            ),
          ],
        ],
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
      child: NeuContainer(
        borderRadius: 22,
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
                    color: AppTheme.accentPurple.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'DAY ${item.day}',
                    style: AppTheme.monospaceStyle(
                      fontSize: 12,
                      color: AppTheme.accentPurple,
                    ).copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  DateFormat('EEEE, MMMM dd, yyyy').format(DateTime.parse(item.date)),
                  style: TextStyle(
                    color: context.textSecondaryColor,
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
              style: AppTheme.poppinsBold(fontSize: 20, color: context.textColor),
            ),
            const SizedBox(height: 8),
            Text(
              'Phase: ${item.phase}',
              style: TextStyle(
                color: context.textSecondaryColor,
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
                    color: context.isDarkMode
                        ? Colors.white.withValues(alpha: 0.08)
                        : Colors.black.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${item.totalHours.toStringAsFixed(1)} HRS',
                    style: TextStyle(
                      color: context.textColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Divider(color: context.colorBorder),
            const SizedBox(height: 16),
            Text(
              'STUDY METRICS',
              style: AppTheme.poppinsBold(fontSize: 12, color: context.textColor),
            ),
            const SizedBox(height: 12),
            _buildMetricRow(context, Icons.menu_book, 'Study Hours', '${item.studyHours.toStringAsFixed(1)} hours'),
            const SizedBox(height: 8),
            _buildMetricRow(context, Icons.timer, 'Aptitude Practice', '${item.aptitudeMinutes} minutes'),
            const SizedBox(height: 8),
            _buildMetricRow(context, Icons.insights, 'Total Target', '${item.totalHours.toStringAsFixed(1)} hours'),
            const SizedBox(height: 20),
            Divider(color: context.colorBorder),
            const SizedBox(height: 16),
            if (item.notes.trim().isNotEmpty) ...[
              Text(
                'CURRICULUM TASKS / NOTES',
                style: AppTheme.poppinsBold(fontSize: 12, color: context.textColor),
              ),
              const SizedBox(height: 8),
              NeuContainer(
                isRecessed: true,
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                borderRadius: 12,
                child: Text(
                  item.notes,
                  style: TextStyle(color: context.textSecondaryColor, fontSize: 13, height: 1.4),
                ),
              ),
              const SizedBox(height: 20),
            ],
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'MY PERSONAL STUDY NOTES',
                  style: AppTheme.poppinsBold(fontSize: 12, color: context.textColor),
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
              NeuContainer(
                isRecessed: true,
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                borderRadius: 12,
                child: Text(
                  userNote,
                  style: TextStyle(color: context.textColor, fontSize: 13, height: 1.4, fontStyle: FontStyle.italic),
                ),
              )
            else
              NeuContainer(
                isRecessed: true,
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                borderRadius: 12,
                child: Text(
                  'No personal notes added yet. Use notes to track definitions, formulas, or concepts you want to remember.',
                  style: TextStyle(color: context.textSecondaryColor, fontSize: 12, fontStyle: FontStyle.italic),
                ),
              ),
            const SizedBox(height: 20),
            // Quick action buttons: Checklist & PYQs
            Row(
              children: [
                Expanded(
                  child: NeuButton(
                    isPrimary: false,
                    borderRadius: 12,
                    padding: const EdgeInsets.symmetric(vertical: 11),
                    onPressed: () => _jumpToChecklistWithSubject(item.subject),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.checklist_rounded, size: 16, color: AppTheme.accentPurple),
                        const SizedBox(width: 6),
                        Text(
                          'In Checklist',
                          style: GoogleFonts.outfit(fontSize: 12.5, fontWeight: FontWeight.bold, color: context.textColor),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: NeuButton(
                    isPrimary: false,
                    borderRadius: 12,
                    padding: const EdgeInsets.symmetric(vertical: 11),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PYQScreen(initialSubject: item.subject),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.quiz_outlined, size: 16, color: AppTheme.accentGold),
                        const SizedBox(width: 6),
                        Text(
                          'Practice PYQs',
                          style: GoogleFonts.outfit(fontSize: 12.5, fontWeight: FontWeight.bold, color: context.textColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Mark Day Completed button
            NeuButton(
              isPrimary: isCompleted,
              borderRadius: 14,
              padding: const EdgeInsets.symmetric(vertical: 14),
              onPressed: () {
                HapticFeedback.selectionClick();
                provider.toggleStudyDayCompletion(item.day);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    isCompleted ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded,
                    color: isCompleted ? Colors.white : AppTheme.accentPurple,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    isCompleted ? 'DAY COMPLETED ✓' : 'MARK DAY AS COMPLETED',
                    style: GoogleFonts.outfit(
                      color: isCompleted ? Colors.white : context.textColor,
                      fontSize: 13.5,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricRow(BuildContext context, IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppTheme.secondary),
        const SizedBox(width: 10),
        Text(
          label,
          style: TextStyle(color: context.textSecondaryColor, fontSize: 13),
        ),
        const Spacer(),
        Text(
          value,
          style: AppTheme.monospaceStyle(fontSize: 13, color: context.textColor).copyWith(fontWeight: FontWeight.w500),
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
          backgroundColor: context.colorSurface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text(
            'Personal Note (Day $day)',
            style: AppTheme.poppinsBold(fontSize: 18, color: context.textColor),
          ),
          content: TextField(
            controller: controller,
            maxLines: 5,
            autofocus: true,
            style: TextStyle(color: context.textColor, fontSize: 14),
            decoration: InputDecoration(
              hintText: 'Add formulas, definitions, reminders...',
              hintStyle: TextStyle(color: context.textSecondaryColor),
              filled: true,
              fillColor: context.colorBackground,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: context.colorBorder),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppTheme.secondary),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel', style: TextStyle(color: context.textSecondaryColor)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                provider.updateStudyDayUserNote(day, controller.text.trim());
                Navigator.pop(context);
              },
              child: const Text('Save Note', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
                      style: AppTheme.poppinsBold(fontSize: 16, color: context.textColor),
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
    return GestureDetector(
      onTap: () => _jumpToChecklistWithSubject(phase['displayName']),
      child: NeuContainer(
        margin: const EdgeInsets.symmetric(vertical: 6),
        borderRadius: 18,
        padding: const EdgeInsets.all(16),
        color: isCurrent ? AppTheme.primary.withValues(alpha: 0.08) : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 34,
                  height: 34,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isCurrent
                        ? AppTheme.secondary.withValues(alpha: 0.2)
                        : (context.isDarkMode ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.05)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    phase['num'],
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: isCurrent ? AppTheme.secondary : context.textColor,
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
                        style: GoogleFonts.outfit(
                          fontSize: 14.5,
                          fontWeight: FontWeight.bold,
                          color: isCurrent ? AppTheme.secondary : context.textColor,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${phase['runway'] ?? ''} • ${phase['hours']} Hours',
                        style: TextStyle(
                          color: context.textSecondaryColor,
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
                    borderRadius: BorderRadius.circular(8),
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
                const SizedBox(width: 6),
                Icon(Icons.arrow_forward_ios_rounded, size: 13, color: context.textSecondaryColor),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: NeuProgressBar(
                    progress: progress,
                    progressColor: progress == 1.0 ? AppTheme.accentMint : AppTheme.accentPurple,
                    height: 5.5,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '${(progress * 100).toStringAsFixed(0)}%',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: progress == 1.0 ? AppTheme.accentMint : context.textSecondaryColor,
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
