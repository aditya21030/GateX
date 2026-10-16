import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/app_provider.dart';
import '../services/storage_service.dart';
import '../theme/app_theme.dart';
import '../models/models.dart';
import '../data/study_plan.dart';

class PlannerScreen extends StatefulWidget {
  const PlannerScreen({super.key});

  @override
  State<PlannerScreen> createState() => _PlannerScreenState();
}

class _PlannerScreenState extends State<PlannerScreen> {
  late ScrollController _scrollController;

  static final List<Map<String, dynamic>> daPhasesData = [
    {
      'num': '1',
      'jsonName': 'Probability & Statistics',
      'displayName': 'Probability & Statistics',
      'dates': 'May 1 - May 28',
      'days': 28,
      'hours': 77,
    },
    {
      'num': '2',
      'jsonName': 'Linear Algebra',
      'displayName': 'Linear Algebra',
      'dates': 'May 29 - Jul 2',
      'days': 35,
      'hours': 96,
    },
    {
      'num': '3',
      'jsonName': 'Calculus & Optimization',
      'displayName': 'Calculus & Optimization',
      'dates': 'Jul 3 - Jul 22',
      'days': 20,
      'hours': 55,
    },
    {
      'num': '4',
      'jsonName': 'Machine Learning',
      'displayName': 'Machine Learning',
      'dates': 'Jul 23 - Sep 15',
      'days': 55,
      'hours': 151,
    },
    {
      'num': '5',
      'jsonName': 'Programming, DSA & Python',
      'displayName': 'DSA & Python',
      'dates': 'Sep 16 - Oct 20',
      'days': 35,
      'hours': 96,
    },
    {
      'num': '6',
      'jsonName': 'Database Management',
      'displayName': 'DBMS',
      'dates': 'Oct 21 - Nov 11',
      'days': 22,
      'hours': 60,
    },
    {
      'num': '7',
      'jsonName': 'AI & Logic',
      'displayName': 'AI & Logic',
      'dates': 'Nov 12 - Nov 30',
      'days': 19,
      'hours': 52,
    },
    {
      'num': '8',
      'jsonName': 'Grand Revision & Mocks',
      'displayName': 'Grand Revision + 7 Mocks',
      'dates': 'Dec 1 - Feb 1',
      'days': 62,
      'hours': 151,
    },
  ];

  static final List<Map<String, dynamic>> csitPhasesData = [
    {
      'num': '1',
      'jsonName': 'Engineering Mathematics',
      'displayName': 'Engineering Mathematics',
      'dates': 'May 1 - Jun 9',
      'days': 40,
      'hours': 112,
    },
    {
      'num': '2',
      'jsonName': 'Digital Logic',
      'displayName': 'Digital Logic',
      'dates': 'Jun 10 - Jun 19',
      'days': 10,
      'hours': 28,
    },
    {
      'num': '3',
      'jsonName': 'Computer Organization and Architecture',
      'displayName': 'Computer Organization and Architecture',
      'dates': 'Jun 20 - Jul 5',
      'days': 16,
      'hours': 44,
    },
    {
      'num': '4',
      'jsonName': 'Programming and Data Structures',
      'displayName': 'Programming and Data Structures',
      'dates': 'Jul 6 - Jul 20',
      'days': 15,
      'hours': 42,
    },
    {
      'num': '5',
      'jsonName': 'Algorithms',
      'displayName': 'Algorithms',
      'dates': 'Jul 21 - Aug 7',
      'days': 18,
      'hours': 50,
    },
    {
      'num': '6',
      'jsonName': 'Theory of Computation',
      'displayName': 'Theory of Computation',
      'dates': 'Aug 8 - Aug 25',
      'days': 18,
      'hours': 50,
    },
    {
      'num': '7',
      'jsonName': 'Compiler Design',
      'displayName': 'Compiler Design',
      'dates': 'Aug 26 - Sep 7',
      'days': 13,
      'hours': 36,
    },
    {
      'num': '8',
      'jsonName': 'Operating System',
      'displayName': 'Operating System',
      'dates': 'Sep 8 - Sep 27',
      'days': 20,
      'hours': 56,
    },
    {
      'num': '9',
      'jsonName': 'Databases',
      'displayName': 'Databases',
      'dates': 'Sep 28 - Oct 13',
      'days': 16,
      'hours': 44,
    },
    {
      'num': '10',
      'jsonName': 'Computer Networks',
      'displayName': 'Computer Networks',
      'dates': 'Oct 14 - Oct 31',
      'days': 18,
      'hours': 50,
    },
    {
      'num': '11',
      'jsonName': 'General Aptitude',
      'displayName': 'General Aptitude',
      'dates': 'Nov 1 - Nov 9',
      'days': 9,
      'hours': 25,
    },
    {
      'num': '12',
      'jsonName': 'Revision & Mock Tests',
      'displayName': 'Revision & Mock Tests',
      'dates': 'Nov 10 - Jan 16',
      'days': 68,
      'hours': 190,
    },
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    // Center calendar on selection or load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<AppProvider>(context, listen: false);
      final today = DateTime.now();
      final planStart = DateTime.parse('2026-05-01');
      final planEnd = DateTime.parse('2027-01-31');

      DateTime targetDate = today;
      if (today.isBefore(planStart)) {
        targetDate = planStart;
      } else if (today.isAfter(planEnd)) {
        targetDate = planEnd;
      }

      provider.setSelectedDate(targetDate);
      _scrollToSelectedDate(immediate: true);
    });
  }

  void _scrollToSelectedDate({bool immediate = false}) {
    if (!_scrollController.hasClients) return;

    final planStart = DateTime.parse('2026-05-01');
    final provider = Provider.of<AppProvider>(context, listen: false);
    final selectedDate = provider.selectedDate;
    final diff = selectedDate.difference(planStart).inDays;

    if (diff >= 0 && diff < 276) {
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Study Planner',
            style: AppTheme.poppinsBold(fontSize: 22),
          ),
          bottom: const TabBar(
            indicatorColor: AppTheme.secondary,
            labelColor: AppTheme.secondary,
            unselectedLabelColor: AppTheme.textSecondary,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(text: 'Daily Plan'),
              Tab(text: 'Phase Overview'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildDailyPlanTab(context, provider),
            _buildPhaseOverviewTab(context, provider),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyPlanTab(BuildContext context, AppProvider provider) {
    final planStart = DateTime.parse('2026-05-01');
    final planEnd = DateTime.parse('2027-01-31');

    final selectedDate = provider.selectedDate;
    final dateStr = "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";

    final items = provider.currentStudyPlanItems;
    final itemIndex = items.indexWhere((item) => item.date == dateStr);

    return Column(
      children: [
        _buildCalendarStrip(context, provider, planStart, planEnd),
        const Divider(height: 1, color: Color(0xFF2A2A3C)),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            child: itemIndex == -1
                ? _buildEmptyState(selectedDate)
                : _buildDayDetailCard(context, provider, items[itemIndex]),
          ),
        ),
      ],
    );
  }

  Widget _buildCalendarStrip(BuildContext context, AppProvider provider, DateTime planStart, DateTime planEnd) {
    final totalDays = planEnd.difference(planStart).inDays + 1;

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
          final date = planStart.add(Duration(days: index));
          final isSelected = DateUtils.isSameDay(date, provider.selectedDate);
          final isToday = DateUtils.isSameDay(date, DateTime.now());
          final dayNum = index + 1;

          final isCompleted = provider.isStudyDayCompleted(dayNum);

          return GestureDetector(
            onTap: () => _selectDate(date),
            child: Container(
              width: 58,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: isSelected ? AppTheme.primary : context.colorSurface,
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
                    'DAY $dayNum',
                    style: TextStyle(
                      color: isSelected ? Colors.white70 : AppTheme.textSecondary,
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    DateFormat('d').format(date),
                    style: AppTheme.timerStyle(
                      fontSize: 18,
                      color: isSelected ? Colors.white : context.textColor,
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
                    )
                  ],
                ],
              ),
            ),
          );
        },
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
        color: context.colorSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: isCompleted ? AppTheme.secondary.withOpacity(0.3) : Colors.white.withOpacity(0.05),
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
                      color: AppTheme.primary.withOpacity(0.15),
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
                      color: context.textColor.withOpacity(0.05),
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
                    color: context.textColor.withOpacity(0.03),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: context.textColor.withOpacity(0.05)),
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
                    color: AppTheme.primary.withOpacity(0.03),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppTheme.primary.withOpacity(0.15)),
                  ),
                  child: Text(
                    userNote,
                    style: TextStyle(color: context.textColor, fontSize: 13, height: 1.4, fontStyle: FontStyle.italic),
                  ),
                )
              else
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: context.textColor.withOpacity(0.02),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: context.textColor.withOpacity(0.02)),
                  ),
                  child: const Text(
                    'No personal notes added yet. Use notes to track definitions, formulas, or concepts you want to remember.',
                    style: TextStyle(color: AppTheme.textSecondary, fontSize: 12, fontStyle: FontStyle.italic),
                  ),
                ),
              const SizedBox(height: 24),
              InkWell(
                onTap: () => provider.toggleStudyDayCompletion(item.day),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  decoration: BoxDecoration(
                    color: isCompleted ? AppTheme.secondary.withOpacity(0.1) : AppTheme.primary.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isCompleted ? AppTheme.secondary : AppTheme.primary.withOpacity(0.3),
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
                          color: isCompleted ? AppTheme.secondary : context.textColor,
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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text(
            'Personal Note (Day $day)',
            style: AppTheme.poppinsBold(fontSize: 18),
          ),
          content: TextField(
            controller: controller,
            maxLines: 5,
            autofocus: true,
            style: TextStyle(color: context.textColor, fontSize: 14),
            decoration: InputDecoration(
              hintText: 'Add formulas, definitions, reminders...',
              hintStyle: const TextStyle(color: AppTheme.textSecondary),
              filled: true,
              fillColor: Colors.black.withOpacity(0.2),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: context.textColor.withOpacity(0.1)),
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
              child: Text('Save Note', style: TextStyle(color: context.textColor)),
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

  Widget _buildEmptyState(DateTime date) {
    return Card(
      color: context.colorSurface,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            children: [
              Icon(Icons.event_busy, size: 48, color: AppTheme.textSecondary.withOpacity(0.5)),
              const SizedBox(height: 16),
              const Text(
                'No study topics scheduled for this date.',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const SizedBox(height: 8),
              const Text(
                'Our study plan runs from May 01, 2026 to January 31, 2027. Please select a date within this range to view and track your goals!',
                style: TextStyle(color: AppTheme.textSecondary, fontSize: 13, height: 1.4),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

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
                child: Text(
                  'SYLLABUS PHASES',
                  style: AppTheme.poppinsBold(fontSize: 16),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.white24, width: 1.5),
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 45,
                      child: Text(
                        'Phase',
                        style: AppTheme.poppinsBold(fontSize: 12, color: AppTheme.textSecondary),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        'Subject',
                        style: AppTheme.poppinsBold(fontSize: 12, color: AppTheme.textSecondary),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        'Dates',
                        style: AppTheme.poppinsBold(fontSize: 12, color: AppTheme.textSecondary),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      child: Text(
                        'Days',
                        textAlign: TextAlign.end,
                        style: AppTheme.poppinsBold(fontSize: 12, color: AppTheme.textSecondary),
                      ),
                    ),
                    SizedBox(
                      width: 55,
                      child: Text(
                        'Hours',
                        textAlign: TextAlign.end,
                        style: AppTheme.poppinsBold(fontSize: 12, color: AppTheme.textSecondary),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
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

  String _getShortSubjectName(String fullName) {
    switch (fullName) {
      case 'Engineering Mathematics':
        return 'Eng Math';
      case 'Computer Organization and Architecture':
        return 'COA';
      case 'Data Structures and Algorithms':
        return 'DSA';
      case 'Database Management Systems':
        return 'DBMS';
      case 'Theory of Computation':
        return 'TOC';
      case 'Compiler Design':
        return 'CD';
      case 'Operating Systems':
        return 'OS';
      case 'Computer Networks':
        return 'CN';
      case 'Machine Learning':
        return 'ML';
      case 'Artificial Intelligence':
        return 'AI';
      case 'Discrete Mathematics':
        return 'Discrete Math';
      default:
        return fullName;
    }
  }

  Widget _buildPhaseRow(BuildContext context, Map<String, dynamic> phase, bool isCurrent, double progress) {
    final shortName = _getShortSubjectName(phase['displayName']);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: isCurrent ? AppTheme.primary.withOpacity(0.05) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isCurrent ? AppTheme.primary.withOpacity(0.3) : Colors.transparent,
          width: 1.5,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
            child: Row(
              children: [
                SizedBox(
                  width: 45,
                  child: Text(
                    phase['num'],
                    style: AppTheme.monospaceStyle(
                      fontSize: 14,
                      color: isCurrent ? AppTheme.secondary : Colors.white70,
                    ).copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      if (isCurrent) ...[
                        const Icon(Icons.stars, color: AppTheme.secondary, size: 14),
                        const SizedBox(width: 4),
                      ],
                      Expanded(
                        child: Text(
                          shortName,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: isCurrent ? FontWeight.bold : FontWeight.w500,
                            color: isCurrent ? Colors.white : Colors.white70,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    phase['dates'],
                    style: TextStyle(
                      fontSize: 13,
                      color: isCurrent ? Colors.white70 : AppTheme.textSecondary,
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: Text(
                    phase['days'].toString(),
                    textAlign: TextAlign.end,
                    style: AppTheme.monospaceStyle(
                      fontSize: 13,
                      color: isCurrent ? Colors.white : Colors.white70,
                    ),
                  ),
                ),
                SizedBox(
                  width: 55,
                  child: Text(
                    phase['hours'].toString(),
                    textAlign: TextAlign.end,
                    style: AppTheme.monospaceStyle(
                      fontSize: 13,
                      color: isCurrent ? Colors.white : Colors.white70,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: progress,
                      backgroundColor: context.colorSurface.withOpacity(0.05),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        progress == 1.0
                            ? AppTheme.success
                            : (isCurrent ? AppTheme.secondary : AppTheme.primary),
                      ),
                      minHeight: 4,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                SizedBox(
                  width: 40,
                  child: Text(
                    '${(progress * 100).toStringAsFixed(0)}%',
                    textAlign: TextAlign.end,
                    style: AppTheme.monospaceStyle(
                      fontSize: 11,
                      color: progress == 1.0
                          ? AppTheme.success
                          : (isCurrent ? AppTheme.secondary : AppTheme.textSecondary),
                    ).copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
