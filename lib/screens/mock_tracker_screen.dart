import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';
import '../providers/app_provider.dart';
import '../theme/app_theme.dart';
import '../services/storage_service.dart';
import '../models/models.dart';
import '../data/sample_pyqs.dart';
import '../data/da_full_mock_pyqs.dart';
import '../data/cs_full_mock_pyqs.dart';
import '../data/da_subjectwise_mock_data.dart';
import '../data/csit_subjectwise_mock_data.dart';
import '../data/minimock_data.dart';
import 'mock_test_runner_screen.dart';
import 'pro_upgrade_screen.dart';
import '../services/ad_service.dart';

class MockTrackerScreen extends StatefulWidget {
  const MockTrackerScreen({super.key});

  @override
  State<MockTrackerScreen> createState() => _MockTrackerScreenState();
}

class _MockTrackerScreenState extends State<MockTrackerScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? _selectedSubject;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // Rebuild to toggle FAB based on index
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<AppProvider>(context, listen: false);
      final subjects = provider.currentSubjects;
      if (subjects.isNotEmpty) {
        setState(() {
          _selectedSubject = subjects[0];
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Color _getScoreColor(double score) {
    if (score >= 75) return AppTheme.success;
    if (score >= 50) return Colors.amber;
    return AppTheme.error;
  }

  List<PYQ> _generateMiniMock(AppProvider provider) {
    if (provider.activeExam == 'DA') {
      final List<PYQ> pool = List.from(daMiniMockQuestions);
      pool.shuffle();
      return pool;
    } else {
      final List<PYQ> pool = List.from(csitMiniMockQuestions);
      pool.shuffle();
      return pool;
    }
  }

  List<PYQ> _generateFullMock(AppProvider provider, String difficulty) {
    if (provider.activeExam == 'DA') {
      final List<PYQ> pool = List.from(daFullMockQuestionsEasy);
      if (difficulty == 'Easy') return pool;
      pool.shuffle();
      return pool;
    } else {
      final List<PYQ> pool = List.from(csFullMockQuestionsEasy);
      if (difficulty == 'Easy') return pool;
      pool.shuffle();
      return pool;
    }
  }

  List<PYQ> _generateSubjectMock(String subject, AppProvider provider) {
    if (provider.activeExam == 'DA' && daSubjectWiseMockQuestions.containsKey(subject)) {
      final List<PYQ> pool = List.from(daSubjectWiseMockQuestions[subject]!);
      pool.shuffle();
      return pool.take(min(10, pool.length)).toList();
    } else if (provider.activeExam != 'DA' && csitSubjectWiseMockQuestions.containsKey(subject)) {
      final List<PYQ> pool = List.from(csitSubjectWiseMockQuestions[subject]!);
      pool.shuffle();
      return pool.take(min(10, pool.length)).toList();
    }

    final List<PYQ> pool = provider.mockQuestions
        .where((q) => q.subject == subject)
        .toList();
    pool.shuffle();
    return pool.take(min(10, pool.length)).toList();
  }

  void _startTest(List<PYQ> questions, Duration duration, String name) {
    if (questions.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No questions available in the question bank for this criteria.'),
          backgroundColor: AppTheme.error,
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MockTestRunnerScreen(
          questions: questions,
          duration: duration,
          testName: name,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final mocks = provider.mockLogs;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mock Test'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppTheme.secondary,
          labelColor: AppTheme.secondary,
          unselectedLabelColor: AppTheme.textSecondary,
          tabs: const [
            Tab(text: 'Take Test'),
            Tab(text: 'Analytics & Logs'),
          ],
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildTakeTestTab(context),
              _buildAnalyticsTab(context, provider, mocks),
            ],
          ),
        ),
      ),
      floatingActionButton: _tabController.index == 1
          ? FloatingActionButton(
              onPressed: () => _showAddMockSheet(context, provider),
              tooltip: 'Log External Test',
              child: const Icon(Icons.add),
            )
          : null,
    );
  }

  Widget _buildTakeTestTab(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final subjects = provider.currentSubjects;

    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16),
      children: [
        // Top Banner / Rules
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.info_outline, color: AppTheme.secondary, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'Exam Practice Instructions',
                      style: AppTheme.poppinsBold(fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  '• Questions are pulled directly from the official GATE DA question bank.\n'
                  '• Marking Scheme: +1.0 for correct answers.\n'
                  '• Negative Marking: -0.33 for wrong MCQ answers; 0.0 for MSQ and NAT.\n'
                  '• Results will be auto-saved and traced on your Performance Analytics chart.',
                  style: TextStyle(fontSize: 12, height: 1.5, color: AppTheme.textSecondary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // 1. MINI MOCK TEST
        _buildTestOptionCard(
          title: 'Mini Mock Test',
          duration: '30 Minutes',
          questionsCount: '15 Questions',
          badgeText: 'RECOMMENDED',
          badgeColor: AppTheme.primary,
          description: 'A balanced practice test covering all subjects. Excellent for quick revisions.',
          icon: Icons.checklist_rtl_rounded,
          iconColor: AppTheme.primary,
          onTap: () {
            final questions = _generateMiniMock(provider);
            _startTest(questions, const Duration(minutes: 30), 'App Mini Mock');
          },
        ),
        const SizedBox(height: 16),

        // 2. SUBJECT-WISE PRACTICE TEST
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.amber.withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.topic_outlined, color: Colors.amber, size: 24),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Subject Practice Test', style: AppTheme.poppinsBold(fontSize: 16)),
                          const SizedBox(height: 4),
                          const Text('10 Questions · 20 Minutes', style: TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text('Choose Subject to Test:', style: TextStyle(fontSize: 12, color: AppTheme.textSecondary, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  initialValue: _selectedSubject,
                  isExpanded: true,
                  dropdownColor: AppTheme.surface,
                  style: const TextStyle(color: AppTheme.textPrimary, fontSize: 13),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppTheme.background,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                  ),
                  items: subjects.map((sub) {
                    return DropdownMenuItem(value: sub, child: Text(sub));
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      _selectedSubject = val;
                    });
                  },
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: AppTheme.background,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {
                      if (_selectedSubject != null) {
                        final questions = _generateSubjectMock(_selectedSubject!, provider);
                        _startTest(questions, const Duration(minutes: 20), '$_selectedSubject Practice');
                      }
                    },
                    child: const Text('Start Subject Test', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // 3. FULL LENGTH MOCK TEST
        _buildTestOptionCard(
          title: 'Full-Length Mock Test',
          duration: '180 Minutes',
          questionsCount: '65 Questions',
          badgeText: 'GATE REAL REPLICA',
          badgeColor: AppTheme.success,
          description: 'Attempt a complete, 65-question practice paper simulating the actual GATE exam layout.',
          icon: Icons.quiz_rounded,
          iconColor: AppTheme.success,
          onTap: () {
            _showMockDifficultySheet(context, provider);
          },
        ),
      ],
    );
  }

  void _showMockDifficultySheet(BuildContext context, AppProvider provider) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Difficulty',
                style: AppTheme.poppinsBold(fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Text(
                'Choose the difficulty level for the Full-Length Mock Test.',
                style: TextStyle(color: AppTheme.textSecondary, fontSize: 13),
              ),
              const SizedBox(height: 24),
              _buildDifficultyOption(context, provider, 'Easy', Colors.green),
              const SizedBox(height: 12),
              _buildDifficultyOption(context, provider, 'Medium', Colors.amber),
              const SizedBox(height: 12),
              _buildDifficultyOption(context, provider, 'Hard', Colors.red),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDifficultyOption(BuildContext context, AppProvider provider, String difficulty, Color color) {
    final isLocked = difficulty != 'Easy' && !provider.isPro;

    return InkWell(
      onTap: () async {
        Navigator.pop(context);
        if (isLocked) {
          final shouldProceed = await AdService().promptWatchRewardedAd(
            context: context,
            perkTitle: '$difficulty Mock Test (Pro)',
            perkDescription:
                'Full-length $difficulty CBT Mocks are unlocked with GateX Pro Pass (₹199 one-time). Alternatively, watch a short 20s ad to unlock this mock attempt for free!',
          );
          if (!shouldProceed) return;
        }

        final questions = _generateFullMock(provider, difficulty);
        if (questions.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('$difficulty mock questions are loading!'),
              backgroundColor: AppTheme.primary,
            ),
          );
          return;
        }
        _startTest(questions, const Duration(minutes: 180), 'App Full Mock - $difficulty');
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: color.withValues(alpha: 0.3)),
          borderRadius: BorderRadius.circular(12),
          color: color.withValues(alpha: 0.05),
        ),
        child: Row(
          children: [
            Icon(Icons.bar_chart_rounded, color: color),
            const SizedBox(width: 16),
            Text(
              difficulty,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: color),
            ),
            if (isLocked) ...[
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFB300).withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.lock_outline_rounded, size: 11, color: AppTheme.secondary),
                    const SizedBox(width: 3),
                    const Text(
                      'PRO',
                      style: TextStyle(color: AppTheme.secondary, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
            const Spacer(),
            const Icon(Icons.chevron_right, color: AppTheme.textSecondary),
          ],
        ),
      ),
    );
  }

  Widget _buildTestOptionCard({
    required String title,
    required String duration,
    required String questionsCount,
    required String description,
    required String badgeText,
    required Color badgeColor,
    required IconData icon,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: iconColor.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: iconColor, size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(child: Text(title, style: AppTheme.poppinsBold(fontSize: 16))),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: badgeColor.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              badgeText,
                              style: TextStyle(color: badgeColor, fontSize: 8, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text('$questionsCount · $duration', style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(description, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12, height: 1.4)),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: iconColor,
                  foregroundColor: iconColor == AppTheme.success ? Colors.white : AppTheme.background,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: onTap,
                child: const Text('Start Practice Exam', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnalyticsTab(BuildContext context, AppProvider provider, List<MockTestLog> mocks) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Performance graph
        if (mocks.isNotEmpty) ...[
          const SizedBox(height: 16),
          Container(
            height: 180,
            padding: const EdgeInsets.fromLTRB(16, 12, 24, 8),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppTheme.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppTheme.textSecondary.withValues(alpha: 0.1)),
            ),
            child: LineChart(
              LineChartData(
                minY: 0,
                maxY: 100,
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: AppTheme.textSecondary.withValues(alpha: 0.1),
                      strokeWidth: 1,
                    );
                  },
                ),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 22,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        final idx = value.toInt();
                        if (idx >= 0 && idx < mocks.length) {
                          return Text(
                            DateFormat('MM/dd').format(mocks[idx].dateTaken),
                            style: const TextStyle(color: AppTheme.textSecondary, fontSize: 8, fontWeight: FontWeight.bold),
                          );
                        }
                        return const Text('');
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 28,
                      interval: 25,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: const TextStyle(color: AppTheme.textSecondary, fontSize: 8, fontWeight: FontWeight.bold),
                        );
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: List.generate(mocks.length, (index) {
                      return FlSpot(index.toDouble(), mocks[index].score);
                    }),
                    isCurved: true,
                    color: AppTheme.secondary,
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
                        radius: 4,
                        color: AppTheme.secondary,
                        strokeWidth: 1.5,
                        strokeColor: AppTheme.background,
                      ),
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      color: AppTheme.secondary.withValues(alpha: 0.1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ] else
          Container(
            height: 120,
            width: double.infinity,
            alignment: Alignment.center,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.surface,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.show_chart, color: AppTheme.textSecondary, size: 32),
                SizedBox(height: 8),
                Text(
                  'No mock test logs yet.',
                  style: TextStyle(color: AppTheme.textSecondary, fontSize: 13),
                ),
              ],
            ),
          ),

        const SizedBox(height: 16),
        // History Title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Test History & Logs (${mocks.length})',
            style: AppTheme.poppinsBold(fontSize: 16),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: mocks.isEmpty
              ? Center(
                  child: Text(
                    'Your exam history will show up here.',
                    style: TextStyle(color: AppTheme.textSecondary, fontSize: 13),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  physics: const BouncingScrollPhysics(),
                  itemCount: mocks.length,
                  itemBuilder: (context, index) {
                    final mock = mocks[index];
                    return _buildMockHistoryCard(context, provider, mock);
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildMockHistoryCard(BuildContext context, AppProvider provider, MockTestLog mock) {
    final formattedDate = DateFormat('MMM dd, yyyy').format(mock.dateTaken);
    final scoreCol = _getScoreColor(mock.score);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ExpansionTile(
        collapsedTextColor: AppTheme.textPrimary,
        collapsedIconColor: AppTheme.textSecondary,
        textColor: AppTheme.secondary,
        iconColor: AppTheme.secondary,
        leading: Container(
          width: 44,
          height: 44,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: scoreCol.withValues(alpha: 0.12),
            shape: BoxShape.circle,
          ),
          child: Text(
            mock.score.toStringAsFixed(0),
            style: AppTheme.timerStyle(fontSize: 16, color: scoreCol),
          ),
        ),
        title: Text(
          mock.name,
          style: AppTheme.poppinsBold(fontSize: 13),
        ),
        subtitle: Text(
          formattedDate,
          style: const TextStyle(color: AppTheme.textSecondary, fontSize: 11),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(height: 1, color: AppTheme.textSecondary),
                const SizedBox(height: 12),

                // Weak subjects
                if (mock.weakSubjects.isNotEmpty) ...[
                  const Text(
                    'WEAK AREAS IDENTIFIED:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: AppTheme.error),
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 8,
                    runSpacing: 6,
                    children: mock.weakSubjects.map((sub) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppTheme.error.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          sub,
                          style: const TextStyle(color: AppTheme.error, fontSize: 9, fontWeight: FontWeight.bold),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                ],

                // Analysis notes
                if (mock.notes.isNotEmpty) ...[
                  const Text(
                    'ANALYSIS & RETROSPECTIVE:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: AppTheme.textSecondary),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppTheme.background,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      mock.notes,
                      style: const TextStyle(fontSize: 12, color: AppTheme.textPrimary, height: 1.4),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],

                // Delete Action
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton.icon(
                    style: TextButton.styleFrom(foregroundColor: AppTheme.error),
                    onPressed: () {
                      provider.deleteMockTest(mock.id);
                    },
                    icon: const Icon(Icons.delete_outline, size: 18),
                    label: const Text('Delete Log', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _showAddMockSheet(BuildContext context, AppProvider provider) {
    final nameController = TextEditingController();
    final scoreController = TextEditingController();
    final notesController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    final List<String> subjects = provider.currentSubjects;
    final List<String> selectedWeakSubjects = [];

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
                            color: AppTheme.textSecondary.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Log External Mock Result',
                        style: AppTheme.poppinsBold(fontSize: 18),
                      ),
                      const SizedBox(height: 16),

                      const Text('Mock Test Name / Source', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: nameController,
                        style: const TextStyle(color: AppTheme.textPrimary),
                        decoration: InputDecoration(
                          hintText: 'e.g., GO Classes Full Mock 3',
                          hintStyle: const TextStyle(color: AppTheme.textSecondary),
                          filled: true,
                          fillColor: AppTheme.surface,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (val) => val == null || val.trim().isEmpty ? 'Please enter source' : null,
                      ),
                      const SizedBox(height: 12),

                      const Text('Score (0 - 100)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: scoreController,
                        style: const TextStyle(color: AppTheme.textPrimary),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          hintText: 'e.g., 68.5',
                          hintStyle: const TextStyle(color: AppTheme.textSecondary),
                          filled: true,
                          fillColor: AppTheme.surface,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (val) {
                          if (val == null || val.trim().isEmpty) {
                            return 'Please enter score';
                          }
                          final s = double.tryParse(val);
                          if (s == null || s < 0 || s > 100) {
                            return 'Enter score between 0 and 100';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),

                      const Text('Mark Weak Subjects', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.error)),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 4,
                        children: subjects.map((sub) {
                          final isSelected = selectedWeakSubjects.contains(sub);
                          return FilterChip(
                            selected: isSelected,
                            label: Text(sub, style: const TextStyle(fontSize: 10)),
                            labelStyle: TextStyle(
                              color: isSelected ? Colors.white : AppTheme.textPrimary,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            ),
                            selectedColor: AppTheme.error,
                            backgroundColor: AppTheme.surface,
                            onSelected: (selected) {
                              setModalState(() {
                                if (selected) {
                                  selectedWeakSubjects.add(sub);
                                } else {
                                  selectedWeakSubjects.remove(sub);
                                }
                              });
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 12),

                      const Text('Analysis Notes', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: notesController,
                        maxLines: 3,
                        style: const TextStyle(color: AppTheme.textPrimary),
                        decoration: InputDecoration(
                          hintText: 'Notes on errors, time management, etc.',
                          hintStyle: const TextStyle(color: AppTheme.textSecondary),
                          filled: true,
                          fillColor: AppTheme.surface,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

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
                              final score = double.parse(scoreController.text);
                              provider.addMockTest(
                                nameController.text.trim(),
                                DateTime.now(),
                                score,
                                selectedWeakSubjects,
                                notesController.text.trim(),
                              );
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Mock test logged!'),
                                  backgroundColor: AppTheme.success,
                                ),
                              );
                            }
                          },
                          child: const Text('Save Log', style: TextStyle(fontWeight: FontWeight.bold)),
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
}

PYQ transformToMockQuestion(PYQ q) {
  String newText = q.questionText;
  String newExplanation = q.explanation;
  List<String> newOptions = List.from(q.options);
  
  final Map<String, String> replacements = {
    'Box-1': 'Urn-A',
    'Box-2': 'Urn-B',
    'Box-3': 'Urn-C',
    'Box 1': 'Urn A',
    'Box 2': 'Urn B',
    'Box 3': 'Urn C',
    'Box': 'Urn',
    'boxes': 'urns',
    'Person 1': 'Investor A',
    'Person 2': 'Investor B',
    'Person 1\'s': 'Investor A\'s',
    'Person 2\'s': 'Investor B\'s',
    'Raider': 'Attacker',
    'Team': 'Squad',
    'Jaipur': 'Mumbai',
    'Patna': 'Delhi',
    'Hyderabad': 'Bengaluru',
    'Arjun': 'Amit',
    'Ankush': 'Anil',
    'Sunil': 'Sanjay',
    'Reza': 'Rohan',
    'Pratham': 'Pankaj',
    'Gopal': 'Girish',
    'Car': 'Vehicle',
    'Make': 'Manufacturer',
    'Own': 'Possess',
    'Car ': 'Vehicle ',
    'Make ': 'Manufacturer ',
    'Own ': 'Possess ',
    'aadhaar': 'national_id',
    'Person relation': 'Citizen relation',
    'Person': 'Citizen',
    'ABC': 'XYZ',
    'ABC ': 'XYZ ',
  };

  replacements.forEach((key, val) {
    newText = newText.replaceAll(key, val);
    newExplanation = newExplanation.replaceAll(key, val);
    for (int i = 0; i < newOptions.length; i++) {
      newOptions[i] = newOptions[i].replaceAll(key, val);
    }
  });

  if (q.id == 'pyq_2024_35') {
    newText = newText.replaceAll('M =', 'K =').replaceAll('(M²', '(K²').replaceAll('12M)', '12K)');
  }
  
  if (q.id == 'pyq_2024_13') {
    newText = newText.replaceAll('M =', 'A =');
  }

  String newCorrectAnswer = q.correctAnswer;

  if (q.isMCQ && q.options.isNotEmpty) {
    final List<String> originalCorrectOptionsText = [];
    if (q.type == 'MSQ') {
      final correctLetters = q.correctAnswer.split(';');
      for (final letter in correctLetters) {
        final idx = letter.codeUnitAt(0) - 65;
        if (idx >= 0 && idx < q.options.length) {
          originalCorrectOptionsText.add(q.options[idx]);
        }
      }
    } else {
      final idx = q.correctAnswer.codeUnitAt(0) - 65;
      if (idx >= 0 && idx < q.options.length) {
        originalCorrectOptionsText.add(q.options[idx]);
      }
    }

    final List<MapEntry<int, String>> indexedOptions = newOptions.asMap().entries.toList();
    indexedOptions.shuffle();
    newOptions = indexedOptions.map((e) => e.value).toList();

    final List<String> newCorrectLetters = [];
    for (int i = 0; i < newOptions.length; i++) {
      if (originalCorrectOptionsText.contains(newOptions[i])) {
        newCorrectLetters.add(String.fromCharCode(65 + i));
      }
    }
    newCorrectLetters.sort();
    newCorrectAnswer = newCorrectLetters.isEmpty ? q.correctAnswer : newCorrectLetters.join(';');
  }

  return PYQ(
    id: 'mock_${q.id}',
    subject: q.subject,
    topic: q.topic,
    questionText: newText,
    options: newOptions,
    correctAnswer: newCorrectAnswer,
    isMCQ: q.isMCQ,
    type: q.type,
    explanation: 'This is a mock concept-variation of past question ${q.id}. $newExplanation',
    year: q.year,
    difficulty: q.difficulty,
    hasImage: q.hasImage,
    imagePath: q.imagePath,
  );
}

