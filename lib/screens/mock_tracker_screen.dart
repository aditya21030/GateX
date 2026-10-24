import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';
import '../providers/app_provider.dart';
import '../theme/app_theme.dart';
import '../models/models.dart';
import '../data/da_full_mock_pyqs.dart';
import '../data/cs_full_mock_pyqs.dart';
import '../data/da_subjectwise_mock_data.dart';
import '../data/csit_subjectwise_mock_data.dart';
import '../data/minimock_data.dart';
import 'mock_test_runner_screen.dart';
import '../services/ad_service.dart';
import '../widgets/neu_widgets.dart';

class MockTrackerScreen extends StatefulWidget {
  final int initialTabIndex;
  const MockTrackerScreen({super.key, this.initialTabIndex = 0});

  @override
  State<MockTrackerScreen> createState() => _MockTrackerScreenState();
}

class _MockTrackerScreenState extends State<MockTrackerScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? _selectedSubject;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.initialTabIndex.clamp(0, 1),
    );
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
    if (score >= 75) return AppTheme.accentMint;
    if (score >= 50) return AppTheme.accentGold;
    return AppTheme.accentCoral;
  }

  List<PYQ> _generateRapidFire(AppProvider provider) {
    List<PYQ> pool = [];
    if (provider.activeExam == 'DA') {
      if (daMiniMockQuestions.isNotEmpty) {
        pool = List.from(daMiniMockQuestions);
      } else {
        pool = List.from(provider.pyqs);
      }
    } else {
      if (csitMiniMockQuestions.isNotEmpty) {
        pool = List.from(csitMiniMockQuestions);
      } else {
        pool = List.from(provider.pyqs);
      }
    }
    pool.shuffle();
    return pool.take(min(5, pool.length)).toList();
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

  List<PYQ> _generateFullMock(AppProvider provider, {int mockNumber = 1, String difficulty = 'Standard'}) {
    final List<PYQ> base = provider.activeExam == 'DA'
        ? List.from(daFullMockQuestionsEasy)
        : List.from(csFullMockQuestionsEasy);

    if (base.length != 65) return base;

    // Preserve GATE Section structure:
    // Q1-5: GA 1-mark (indices 0..4)
    // Q6-10: GA 2-mark (indices 5..9)
    // Q11-35: Core 1-mark (indices 10..34)
    // Q36-65: Core 2-mark (indices 35..64)
    final rand = Random(mockNumber * 49287 + 1337);

    final ga1 = List<PYQ>.from(base.sublist(0, 5))..shuffle(rand);
    final ga2 = List<PYQ>.from(base.sublist(5, 10))..shuffle(rand);
    final core1 = List<PYQ>.from(base.sublist(10, 35))..shuffle(rand);
    final core2 = List<PYQ>.from(base.sublist(35, 65))..shuffle(rand);

    if (mockNumber >= 5 || difficulty == 'Hard') {
      // For higher-numbered mocks, apply conceptual variations to core questions
      final transformedCore1 = core1.map(transformToMockQuestion).toList();
      final transformedCore2 = core2.map(transformToMockQuestion).toList();
      return [...ga1, ...ga2, ...transformedCore1, ...transformedCore2];
    }

    return [...ga1, ...ga2, ...core1, ...core2];
  }

  String _mapSubjectToMockKey(String subject, bool isCSIT) {
    final trimmed = subject.trim();
    if (isCSIT) {
      const csitMapping = {
        'Computer Organization': 'Computer Organization and Architecture',
        'Programming & Data Structures': 'Programming and Data Structures',
        'Operating System': 'Operating Systems',
        'Databases': 'Database Management Systems',
      };
      if (csitMapping.containsKey(trimmed)) return csitMapping[trimmed]!;
      if (csitSubjectWiseMockQuestions.containsKey(trimmed)) return trimmed;

      for (final key in csitSubjectWiseMockQuestions.keys) {
        if (key.toLowerCase() == trimmed.toLowerCase() ||
            key.toLowerCase().contains(trimmed.toLowerCase()) ||
            trimmed.toLowerCase().contains(key.toLowerCase())) {
          return key;
        }
      }
      return trimmed;
    } else {
      const daMapping = {
        'Probability and Statistics': 'Probability & Statistics',
        'Calculus and Optimization': 'Calculus & Optimization',
        'Python (Main Topics Only)': 'Programming, Data Structures & Algorithms',
        'DSA (Data Structures and Algorithms)': 'Programming, Data Structures & Algorithms',
        'Database Management and Warehousing': 'Database Management & Warehousing',
        'AI': 'Artificial Intelligence',
      };
      if (daMapping.containsKey(trimmed)) return daMapping[trimmed]!;
      if (daSubjectWiseMockQuestions.containsKey(trimmed)) return trimmed;

      for (final key in daSubjectWiseMockQuestions.keys) {
        if (key.toLowerCase() == trimmed.toLowerCase() ||
            key.toLowerCase().contains(trimmed.toLowerCase()) ||
            trimmed.toLowerCase().contains(key.toLowerCase())) {
          return key;
        }
      }
      return trimmed;
    }
  }

  List<PYQ> _generateSubjectMock(String subject, AppProvider provider) {
    final isCSIT = provider.activeExam != 'DA';
    final mockKey = _mapSubjectToMockKey(subject, isCSIT);

    if (!isCSIT && daSubjectWiseMockQuestions.containsKey(mockKey)) {
      final List<PYQ> pool = List.from(daSubjectWiseMockQuestions[mockKey]!);
      pool.shuffle();
      return pool.take(min(10, pool.length)).toList();
    } else if (isCSIT && csitSubjectWiseMockQuestions.containsKey(mockKey)) {
      final List<PYQ> pool = List.from(csitSubjectWiseMockQuestions[mockKey]!);
      pool.shuffle();
      return pool.take(min(10, pool.length)).toList();
    }

    final List<PYQ> pool = provider.mockQuestions
        .where((q) =>
            q.subject.toLowerCase() == subject.toLowerCase() ||
            q.subject.toLowerCase() == mockKey.toLowerCase())
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
    final subjects = provider.currentSubjects;

    // Guard against invalid subject value when switching between DA and CS/IT
    if (_selectedSubject == null || !subjects.contains(_selectedSubject)) {
      _selectedSubject = subjects.isNotEmpty ? subjects.first : null;
    }

    return Scaffold(
      backgroundColor: context.colorBackground,
      appBar: AppBar(
        backgroundColor: context.colorSurface,
        elevation: 0,
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
                onPressed: () => Navigator.pop(context),
              )
            : null,
        title: Text(
          'Mock Arena',
          style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.bold, color: context.textColor),
        ),
        actions: const [],
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
                Tab(height: 38, text: 'Test Arena', icon: Icon(Icons.sports_score_rounded, size: 18)),
                Tab(height: 38, text: 'Analytics', icon: Icon(Icons.analytics_rounded, size: 18)),
              ],
            ),
          ),
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
              backgroundColor: AppTheme.accentPurple,
              foregroundColor: Colors.white,
              onPressed: () => _showAddMockSheet(context, provider),
              tooltip: 'Log External Test',
              child: const Icon(Icons.add),
            )
          : null,
    );
  }

  IconData _getSubjectIcon(String subject) {
    final s = subject.toLowerCase();
    if (s.contains('math') || s.contains('algebra') || s.contains('calculus')) {
      return Icons.functions_rounded;
    } else if (s.contains('prob') || s.contains('stat')) {
      return Icons.query_stats_rounded;
    } else if (s.contains('machine') || s.contains('ml') || s.contains('ai') || s.contains('intelligence')) {
      return Icons.psychology_rounded;
    } else if (s.contains('dbms') || s.contains('data') || s.contains('sql')) {
      return Icons.storage_rounded;
    } else if (s.contains('prog') || s.contains('c') || s.contains('python') || s.contains('dsa') || s.contains('algo')) {
      return Icons.terminal_rounded;
    } else if (s.contains('os') || s.contains('operating')) {
      return Icons.computer_rounded;
    } else if (s.contains('network') || s.contains('cn')) {
      return Icons.hub_rounded;
    } else if (s.contains('toc') || s.contains('compiler')) {
      return Icons.account_tree_rounded;
    }
    return Icons.menu_book_rounded;
  }

  void _showSubjectPickerModal(BuildContext context, AppProvider provider) {
    final subjects = provider.currentSubjects;
    showModalBottomSheet(
      context: context,
      backgroundColor: context.colorSurface,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return DraggableScrollableSheet(
          initialChildSize: 0.65,
          minChildSize: 0.4,
          maxChildSize: 0.88,
          expand: false,
          builder: (context, scrollController) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: context.textSecondaryColor.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF8522).withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.topic_rounded, color: Color(0xFFFF8522), size: 22),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Select Subject',
                              style: GoogleFonts.outfit(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: context.textColor,
                              ),
                            ),
                            Text(
                              'Targeted 10-question sprint for ${provider.activeExam == 'CSIT' ? 'GATE CS/IT' : 'GATE DA'}',
                              style: TextStyle(
                                fontSize: 12,
                                color: context.textSecondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.separated(
                      controller: scrollController,
                      physics: const BouncingScrollPhysics(),
                      itemCount: subjects.length,
                      separatorBuilder: (_, index) => const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        final subject = subjects[index];
                        final isSelected = _selectedSubject == subject;
                        return InkWell(
                          onTap: () {
                            HapticFeedback.selectionClick();
                            setState(() {
                              _selectedSubject = subject;
                            });
                            Navigator.pop(ctx);
                          },
                          borderRadius: BorderRadius.circular(16),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFFFF8522).withValues(alpha: 0.12)
                                  : (context.isDarkMode
                                      ? Colors.white.withValues(alpha: 0.04)
                                      : Colors.black.withValues(alpha: 0.03)),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: isSelected
                                    ? const Color(0xFFFF8522).withValues(alpha: 0.5)
                                    : (context.isDarkMode
                                        ? Colors.white.withValues(alpha: 0.06)
                                        : Colors.black.withValues(alpha: 0.06)),
                                width: isSelected ? 1.5 : 1.0,
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 38,
                                  height: 38,
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? const Color(0xFFFF8522).withValues(alpha: 0.2)
                                        : (context.isDarkMode
                                            ? Colors.white.withValues(alpha: 0.06)
                                            : Colors.black.withValues(alpha: 0.05)),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    _getSubjectIcon(subject),
                                    size: 19,
                                    color: isSelected ? const Color(0xFFFF8522) : context.textSecondaryColor,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        subject,
                                        style: GoogleFonts.outfit(
                                          fontSize: 14,
                                          fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                                          color: isSelected ? const Color(0xFFFF8522) : context.textColor,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        '10 Questions • 20 Mins',
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: context.textSecondaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (isSelected)
                                  const Icon(
                                    Icons.check_circle_rounded,
                                    color: Color(0xFFFF8522),
                                    size: 22,
                                  )
                                else
                                  Icon(
                                    Icons.radio_button_unchecked_rounded,
                                    color: context.textSecondaryColor.withValues(alpha: 0.4),
                                    size: 20,
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildTakeTestTab(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);

    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
      children: [
        // Minimal CBT Exam Rule Strip
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
          decoration: BoxDecoration(
            color: context.isDarkMode
                ? Colors.white.withValues(alpha: 0.04)
                : Colors.black.withValues(alpha: 0.03),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: context.isDarkMode
                  ? Colors.white.withValues(alpha: 0.08)
                  : Colors.black.withValues(alpha: 0.06),
            ),
          ),
          child: Row(
            children: [
              const Icon3D(Icons.info_outline_rounded, size: 18, color: Color(0xFFFF8522)),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'MCQ: +1/+2 (-⅓ neg) • MSQ & NAT: No negative marking',
                  style: GoogleFonts.outfit(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: context.textSecondaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),

        // 0. 10-MINUTE RAPID FIRE
        _buildTestOptionCard(
          title: 'Daily Rapid Fire',
          duration: '10 Mins',
          questionsCount: '5 Questions',
          icon: Icons.bolt_rounded,
          iconColor: const Color(0xFFFF8522),
          isPrimary: true,
          gradient: AppTheme.flameGradient,
          buttonText: 'Start 10m Sprint ⚡',
          onTap: () {
            final questions = _generateRapidFire(provider);
            _startTest(questions, const Duration(minutes: 10), 'Daily Rapid Fire');
          },
        ),
        const SizedBox(height: 14),

        // 1. MINI MOCK TEST
        _buildTestOptionCard(
          title: 'Mini Mock Test',
          duration: '30 Mins',
          questionsCount: '15 Questions',
          icon: Icons.checklist_rtl_rounded,
          iconColor: const Color(0xFFFF8522),
          isPrimary: true,
          gradient: AppTheme.flameGradient,
          buttonText: 'Start 30m Test 🎯',
          onTap: () {
            final questions = _generateMiniMock(provider);
            _startTest(questions, const Duration(minutes: 30), 'App Mini Mock');
          },
        ),
        const SizedBox(height: 14),

        // 2. SUBJECT-WISE PRACTICE TEST
        NeuContainer(
          borderRadius: 20,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const NeuIconTile(
                    icon: Icons.topic_outlined,
                    iconColor: Color(0xFFFF8522),
                    size: 46,
                    iconSize: 22,
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Subject Practice Test',
                          style: GoogleFonts.outfit(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: context.textColor,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.quiz_outlined, size: 13, color: context.textSecondaryColor),
                            const SizedBox(width: 4),
                            Text(
                              '10 Questions',
                              style: GoogleFonts.outfit(
                                color: context.textSecondaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Icon(Icons.timer_outlined, size: 13, color: context.textSecondaryColor),
                            const SizedBox(width: 4),
                            Text(
                              '20 Minutes',
                              style: GoogleFonts.outfit(
                                color: context.textSecondaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              NeuContainer(
                isRecessed: true,
                borderRadius: 14,
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                child: InkWell(
                  onTap: () => _showSubjectPickerModal(context, provider),
                  child: Row(
                    children: [
                      Icon(
                        _getSubjectIcon(_selectedSubject ?? ''),
                        size: 20,
                        color: const Color(0xFFFF8522),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'TARGET SUBJECT',
                              style: GoogleFonts.outfit(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: context.textSecondaryColor,
                                letterSpacing: 0.8,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              _selectedSubject ?? 'Select Subject',
                              style: GoogleFonts.outfit(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: context.textColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF8522).withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Change',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFF8522),
                              ),
                            ),
                            SizedBox(width: 2),
                            Icon(Icons.keyboard_arrow_down_rounded, size: 16, color: Color(0xFFFF8522)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 14),
              NeuButton(
                isPrimary: true,
                gradient: AppTheme.flameGradient,
                onPressed: () {
                  HapticFeedback.selectionClick();
                  if (_selectedSubject != null) {
                    final questions = _generateSubjectMock(_selectedSubject!, provider);
                    _startTest(questions, const Duration(minutes: 20), '$_selectedSubject Practice');
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon3D(Icons.play_arrow_rounded, color: Colors.white, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Start Subject Test',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),

        // 3. FULL LENGTH MOCK TEST
        _buildTestOptionCard(
          title: '10 Full CBT Mocks',
          duration: '180 Mins',
          questionsCount: '65 Questions',
          icon: Icons.quiz_rounded,
          iconColor: AppTheme.accentMint,
          isPrimary: true,
          gradient: const LinearGradient(colors: [Color(0xFF059669), Color(0xFF10B981)]),
          buttonText: 'Launch 65-Q CBT Mock 🏆',
          onTap: () {
            _showMockDifficultySheet(context, provider);
          },
        ),
      ],
    );
  }

  void _showMockDifficultySheet(BuildContext context, AppProvider provider) {
    const mockConfigs = [
      {'title': 'Mock 01: Official Diagnostic Mock', 'desc': 'Official syllabus baseline • Balanced GATE exam pattern', 'isFree': true, 'tier': 'Standard'},
      {'title': 'Mock 02: High-Yield Core Concept Mock', 'desc': 'Core engineering topics • Fundamental derivations', 'isFree': false, 'tier': 'Standard'},
      {'title': 'Mock 03: Multi-Topic Integration Mock', 'desc': 'Cross-subject interlinked problems & applications', 'isFree': false, 'tier': 'Standard'},
      {'title': 'Mock 04: Advanced Analytics & NAT Focus', 'desc': 'Calculation-heavy NAT questions & precision math', 'isFree': false, 'tier': 'Standard'},
      {'title': 'Mock 05: Speed & Time-Management Drill', 'desc': '180-min exam endurance • Fast elimination tactics', 'isFree': false, 'tier': 'Advanced'},
      {'title': 'Mock 06: Tricky MSQ Special Simulator', 'desc': 'Multi-select MSQ challenge with zero negative marking', 'isFree': false, 'tier': 'Advanced'},
      {'title': 'Mock 07: AIR-100 Benchmark Mock', 'desc': 'Challenging high-rank differentiator questions', 'isFree': false, 'tier': 'Advanced'},
      {'title': 'Mock 08: Deep Conceptual Traps Mock', 'desc': 'Common exam-hall pitfalls and distractors tested', 'isFree': false, 'tier': 'Hard'},
      {'title': 'Mock 09: Previous Year Trend Predictor', 'desc': 'Curated questions based on recent 2024–2026 trends', 'isFree': false, 'tier': 'Hard'},
      {'title': 'Mock 10: Final Grand Full CBT Simulation', 'desc': 'Full dress-rehearsal CBT mock before real exam', 'isFree': false, 'tier': 'Hard'},
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.colorSurface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (bottomSheetContext) {
        return Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.82,
          ),
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Drag Handle
              Center(
                child: Container(
                  width: 44,
                  height: 4.5,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: context.textSecondaryColor.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppTheme.accentMint.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.quiz_rounded, size: 20, color: AppTheme.accentMint),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '10 Full-Length CBT Mocks',
                          style: GoogleFonts.outfit(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: context.textColor,
                          ),
                        ),
                        Text(
                          '65 Questions • 100 Marks • 180 Mins • TCS iON Engine',
                          style: GoogleFonts.outfit(
                            fontSize: 11.5,
                            color: context.textSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: mockConfigs.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 10),
                  itemBuilder: (ctx, index) {
                    final cfg = mockConfigs[index];
                    final isFree = cfg['isFree'] as bool;
                    final isUnlocked = isFree || provider.isPro;
                    final mockNumber = index + 1;

                    return _buildMockItemCard(
                      context: context,
                      provider: provider,
                      mockNumber: mockNumber,
                      title: cfg['title'] as String,
                      subtitle: cfg['desc'] as String,
                      isUnlocked: isUnlocked,
                      isFree: isFree,
                      tier: cfg['tier'] as String,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMockItemCard({
    required BuildContext context,
    required AppProvider provider,
    required int mockNumber,
    required String title,
    required String subtitle,
    required bool isUnlocked,
    required bool isFree,
    required String tier,
  }) {
    final isDark = context.isDarkMode;

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () async {
        HapticFeedback.selectionClick();
        final messenger = ScaffoldMessenger.of(this.context);
        Navigator.pop(context);

        if (!isUnlocked) {
          final shouldProceed = await AdService().promptWatchRewardedAd(
            context: this.context,
            perkTitle: 'Mock $mockNumber (GateX Pro)',
            perkDescription:
                'Full-length CBT Mock $mockNumber is unlocked with GateX Pro Pass (₹199 one-time). Alternatively, watch a 20s ad to unlock this mock attempt for free!',
          );
          if (!shouldProceed) return;
        }

        if (!mounted) return;

        final questions = _generateFullMock(provider, mockNumber: mockNumber);
        if (questions.isEmpty) {
          messenger.showSnackBar(
            const SnackBar(
              content: Text('Mock questions are loading!'),
              backgroundColor: AppTheme.primary,
            ),
          );
          return;
        }
        _startTest(questions, const Duration(minutes: 180), 'Full CBT Mock $mockNumber - $title');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: context.colorSurfaceElevated,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isFree
                ? AppTheme.accentMint.withValues(alpha: 0.3)
                : (isUnlocked
                    ? const Color(0xFFFFB300).withValues(alpha: 0.25)
                    : (isDark ? Colors.white10 : const Color(0xFFE5E5EA))),
          ),
        ),
        child: Row(
          children: [
            // Number Circle
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: isFree
                    ? AppTheme.accentMint.withValues(alpha: 0.15)
                    : (isUnlocked
                        ? const Color(0xFFFFB300).withValues(alpha: 0.15)
                        : Colors.grey.withValues(alpha: 0.1)),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  mockNumber.toString().padLeft(2, '0'),
                  style: GoogleFonts.outfit(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: isFree
                        ? AppTheme.accentMint
                        : (isUnlocked ? const Color(0xFFFFB300) : Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: GoogleFonts.outfit(
                            fontWeight: FontWeight.bold,
                            fontSize: 13.5,
                            color: context.textColor,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 6),
                      if (isFree)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppTheme.accentMint.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            'FREE',
                            style: GoogleFonts.outfit(
                              color: AppTheme.accentMint,
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      else if (!provider.isPro)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFB300).withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.lock_rounded, size: 10, color: Color(0xFFFFB300)),
                              SizedBox(width: 3),
                              Text(
                                'PRO',
                                style: TextStyle(
                                  color: Color(0xFFFFB300),
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: GoogleFonts.outfit(
                      fontSize: 11,
                      color: context.textSecondaryColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),

            Icon(
              Icons.chevron_right_rounded,
              color: context.textSecondaryColor,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTestOptionCard({
    required String title,
    required String duration,
    required String questionsCount,
    required IconData icon,
    required Color iconColor,
    required VoidCallback onTap,
    bool isPrimary = false,
    String? buttonText,
    Gradient? gradient,
  }) {
    return NeuContainer(
      borderRadius: 20,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              NeuIconTile(
                icon: icon,
                iconColor: iconColor,
                size: 46,
                iconSize: 22,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.outfit(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: context.textColor,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.quiz_outlined, size: 13, color: context.textSecondaryColor),
                        const SizedBox(width: 4),
                        Text(
                          questionsCount,
                          style: GoogleFonts.outfit(
                            color: context.textSecondaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Icon(Icons.timer_outlined, size: 13, color: context.textSecondaryColor),
                        const SizedBox(width: 4),
                        Text(
                          duration,
                          style: GoogleFonts.outfit(
                            color: context.textSecondaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          NeuButton(
            isPrimary: isPrimary,
            gradient: gradient,
            onPressed: () {
              HapticFeedback.selectionClick();
              onTap();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isPrimary ? Icons.play_arrow_rounded : Icons.arrow_forward_rounded,
                  color: isPrimary ? Colors.white : AppTheme.accentPurple,
                  size: 18,
                ),
                const SizedBox(width: 8),
                Text(
                  buttonText ?? 'Start Practice Exam',
                  style: GoogleFonts.outfit(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.5,
                    color: isPrimary ? Colors.white : context.textColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnalyticsTab(BuildContext context, AppProvider provider, List<MockTestLog> mocks) {
    final double avgScore = mocks.isNotEmpty ? mocks.map((m) => m.score).reduce((a, b) => a + b) / mocks.length : 0.0;
    final double bestScore = mocks.isNotEmpty ? mocks.map((m) => m.score).reduce(max) : 0.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Summary Benchmark Strip
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
          child: Row(
            children: [
              Expanded(
                child: _buildMetricTile(
                  context: context,
                  label: 'Tests Taken',
                  value: '${mocks.length}',
                  icon: Icons.assignment_turned_in_rounded,
                  iconColor: AppTheme.accentPurple,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildMetricTile(
                  context: context,
                  label: 'Mock Average',
                  value: mocks.isNotEmpty ? avgScore.toStringAsFixed(1) : 'N/A',
                  icon: Icons.speed_rounded,
                  iconColor: const Color(0xFFFF8522),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildMetricTile(
                  context: context,
                  label: 'Peak Score',
                  value: mocks.isNotEmpty ? bestScore.toStringAsFixed(1) : 'N/A',
                  icon: Icons.emoji_events_rounded,
                  iconColor: AppTheme.accentMint,
                ),
              ),
            ],
          ),
        ),

        // Performance graph
        if (mocks.length >= 2) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 12, 18, 8),
            child: Row(
              children: [
                const Icon3D(Icons.trending_up_rounded, size: 20, color: Color(0xFFFF8522)),
                const SizedBox(width: 8),
                Text(
                  'Score Trajectory & Growth',
                  style: GoogleFonts.outfit(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: context.textColor,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF8522).withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xFFFF8522).withValues(alpha: 0.25),
                      width: 0.8,
                    ),
                  ),
                  child: Text(
                    '${mocks.length} Attempts',
                    style: GoogleFonts.outfit(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFFF8522),
                    ),
                  ),
                ),
              ],
            ),
          ),
          NeuContainer(
            height: 195,
            padding: const EdgeInsets.fromLTRB(16, 14, 24, 10),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            borderRadius: 20,
            child: LineChart(
              LineChartData(
                minY: 0,
                maxY: 100,
                lineTouchData: LineTouchData(
                  enabled: true,
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipColor: (_) => context.isDarkMode ? const Color(0xFF1E202C) : Colors.white,
                    tooltipPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    getTooltipItems: (touchedSpots) {
                      return touchedSpots.map((spot) {
                        final idx = spot.x.toInt();
                        final name = (idx >= 0 && idx < mocks.length) ? mocks[idx].name : 'Mock';
                        return LineTooltipItem(
                          '$name\nScore: ${spot.y.toStringAsFixed(1)}/100',
                          GoogleFonts.outfit(
                            color: const Color(0xFFFF8522),
                            fontWeight: FontWeight.bold,
                            fontSize: 11.5,
                          ),
                        );
                      }).toList();
                    },
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: context.colorBorder.withValues(alpha: 0.6),
                      strokeWidth: 1,
                      dashArray: [4, 4],
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
                            style: TextStyle(color: context.textSecondaryColor, fontSize: 8.5, fontWeight: FontWeight.bold),
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
                          style: TextStyle(color: context.textSecondaryColor, fontSize: 8.5, fontWeight: FontWeight.bold),
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
                    gradient: const LinearGradient(
                      colors: [Color(0xFF8B5CF6), Color(0xFFFF8522)],
                    ),
                    barWidth: 3.5,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
                        radius: 4.5,
                        color: const Color(0xFFFF8522),
                        strokeWidth: 2,
                        strokeColor: context.colorSurface,
                      ),
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFFFF8522).withValues(alpha: 0.28),
                          const Color(0xFF8B5CF6).withValues(alpha: 0.08),
                          Colors.transparent,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ] else
          NeuContainer(
            isRecessed: true,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            borderRadius: 18,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppTheme.accentPurple.withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon3D(Icons.auto_graph_rounded, color: AppTheme.accentPurple, size: 24),
                ),
                const SizedBox(height: 8),
                Text(
                  mocks.isEmpty ? 'Your AIR Score Trajectory Curve' : '1 Attempt Logged — Need 1 More for Curve',
                  style: GoogleFonts.outfit(fontSize: 13.5, fontWeight: FontWeight.bold, color: context.textColor),
                ),
                const SizedBox(height: 4),
                Text(
                  'Complete 2 or more CBT mocks to unlock your AIR score trajectory curve and subject accuracy trends!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(color: context.textSecondaryColor, fontSize: 11.5, height: 1.35),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    HapticFeedback.selectionClick();
                    _tabController.animateTo(0);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.accentPurple,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    visualDensity: VisualDensity.compact,
                  ),
                  icon: const Icon(Icons.play_arrow_rounded, size: 16),
                  label: Text(
                    'Start Diagnostic Mock 01',
                    style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 11.5),
                  ),
                ),
              ],
            ),
          ),

        const SizedBox(height: 14),
        // History Title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Test History & Scores (${mocks.length})',
            style: AppTheme.poppinsBold(fontSize: 15, color: context.textColor),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: mocks.isEmpty
              ? Center(
                  child: Text(
                    'Your exam history will show up here.',
                    style: TextStyle(color: context.textSecondaryColor, fontSize: 13),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
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

  Widget _buildMetricTile({
    required BuildContext context,
    required String label,
    required String value,
    required IconData icon,
    required Color iconColor,
  }) {
    return NeuContainer(
      borderRadius: 16,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              NeuIconTile(icon: icon, iconColor: iconColor, size: 26, iconSize: 14),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  label,
                  style: GoogleFonts.outfit(
                    color: context.textSecondaryColor,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: GoogleFonts.outfit(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: context.textColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMockHistoryCard(BuildContext context, AppProvider provider, MockTestLog mock) {
    final formattedDate = DateFormat('MMM dd, yyyy').format(mock.dateTaken);
    final scoreCol = _getScoreColor(mock.score);

    return NeuContainer(
      borderRadius: 18,
      margin: const EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.zero,
      child: ExpansionTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        collapsedTextColor: context.textColor,
        collapsedIconColor: context.textSecondaryColor,
        textColor: AppTheme.accentPurple,
        iconColor: AppTheme.accentPurple,
        leading: Container(
          width: 44,
          height: 44,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: scoreCol.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: scoreCol.withValues(alpha: 0.25)),
          ),
          child: Text(
            mock.score.toStringAsFixed(0),
            style: GoogleFonts.outfit(fontSize: 17, fontWeight: FontWeight.bold, color: scoreCol),
          ),
        ),
        title: Text(
          mock.name,
          style: GoogleFonts.outfit(fontSize: 14.5, fontWeight: FontWeight.bold, color: context.textColor),
        ),
        subtitle: Text(
          formattedDate,
          style: GoogleFonts.outfit(color: context.textSecondaryColor, fontSize: 11.5),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(height: 1, color: context.colorBorder),
                const SizedBox(height: 10),

                // Weak subjects
                if (mock.weakSubjects.isNotEmpty) ...[
                  const Text(
                    'WEAK AREAS IDENTIFIED:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: AppTheme.accentCoral),
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 6,
                    runSpacing: 4,
                    children: mock.weakSubjects.map((sub) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: AppTheme.accentCoral.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          sub,
                          style: const TextStyle(color: AppTheme.accentCoral, fontSize: 9.5, fontWeight: FontWeight.bold),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 12),
                ],

                // Analysis notes
                if (mock.notes.isNotEmpty) ...[
                  Text(
                    'ANALYSIS & RETROSPECTIVE:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: context.textSecondaryColor),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: context.colorSurfaceElevated,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      mock.notes,
                      style: TextStyle(fontSize: 12, color: context.textColor, height: 1.4),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],

                // Delete Action
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton.icon(
                    style: TextButton.styleFrom(foregroundColor: AppTheme.error),
                    onPressed: () {
                      provider.deleteMockTest(mock.id);
                    },
                    icon: const Icon(Icons.delete_outline, size: 16),
                    label: const Text('Delete Log', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                  ),
                ),
              ],
            ),
          ),
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
      backgroundColor: context.colorSurface,
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
                            color: context.textSecondaryColor.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Log External Mock Result',
                        style: AppTheme.poppinsBold(fontSize: 18, color: context.textColor),
                      ),
                      const SizedBox(height: 16),

                      Text('Mock Test Name / Source', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: context.textColor)),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: nameController,
                        style: TextStyle(color: context.textColor),
                        decoration: InputDecoration(
                          hintText: 'e.g., GO Classes Full Mock 3',
                          hintStyle: TextStyle(color: context.textSecondaryColor),
                          filled: true,
                          fillColor: context.colorSurfaceElevated,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (val) => val == null || val.trim().isEmpty ? 'Please enter source' : null,
                      ),
                      const SizedBox(height: 12),

                      Text('Score (0 - 100)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: context.textColor)),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: scoreController,
                        style: TextStyle(color: context.textColor),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          hintText: 'e.g., 68.5',
                          hintStyle: TextStyle(color: context.textSecondaryColor),
                          filled: true,
                          fillColor: context.colorSurfaceElevated,
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
                              color: isSelected ? Colors.white : context.textColor,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            ),
                            selectedColor: AppTheme.accentCoral,
                            backgroundColor: context.colorSurfaceElevated,
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

                      Text('Analysis Notes', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: context.textColor)),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: notesController,
                        maxLines: 3,
                        style: TextStyle(color: context.textColor),
                        decoration: InputDecoration(
                          hintText: 'Notes on errors, time management, etc.',
                          hintStyle: TextStyle(color: context.textSecondaryColor),
                          filled: true,
                          fillColor: context.colorSurfaceElevated,
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
                            backgroundColor: AppTheme.accentPurple,
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

