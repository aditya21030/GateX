import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;
import '../providers/app_provider.dart';
import '../models/models.dart';
import '../theme/app_theme.dart';
import '../utils/math_markdown_builder.dart';
import '../services/ad_service.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../widgets/virtual_calculator.dart';
import '../widgets/question_discussion_sheet.dart';
import '../widgets/neu_widgets.dart';
import 'mock_test_runner_screen.dart';
import '../services/storage_service.dart';

class PYQScreen extends StatefulWidget {
  final String? initialSubject;
  const PYQScreen({super.key, this.initialSubject});

  @override
  State<PYQScreen> createState() => _PYQScreenState();
}

class _PYQScreenState extends State<PYQScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();

  // Active filters
  String _searchQuery = '';
  String _selectedSubject = 'All';
  String _selectedYear = 'All';
  String _selectedDifficulty = 'All';
  bool _natOnly = false;

  int get _activeFilterCount {
    int count = 0;
    if (_selectedSubject != 'All') count++;
    if (_selectedYear != 'All') count++;
    if (_selectedDifficulty != 'All') count++;
    if (_natOnly) count++;
    return count;
  }

  Widget _buildActiveFilterTag(String label, VoidCallback onRemove) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFFF8522).withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFFF8522).withValues(alpha: 0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(color: Color(0xFFFF8522), fontSize: 11, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 4),
          InkWell(
            onTap: onRemove,
            child: const Icon(Icons.close_rounded, size: 13, color: Color(0xFFFF8522)),
          ),
        ],
      ),
    );
  }

  String _normalizeSubject(String input, bool isCSIT) {
    final s = input.toLowerCase().trim();
    final keys = isCSIT ? StorageService.csitSyllabusData.keys : StorageService.syllabusData.keys;

    for (final key in keys) {
      if (key.toLowerCase() == s) return key;
    }

    if (!isCSIT) {
      if (s.contains('prob') || s.contains('stat')) return 'Probability and Statistics';
      if (s.contains('linear') || s.contains('algebra')) return 'Linear Algebra';
      if (s.contains('calculus') || s.contains('optimization')) return 'Calculus and Optimization';
      if (s.contains('machine learning') || s == 'ml') return 'Machine Learning';
      if (s.contains('python')) return 'Python (Main Topics Only)';
      if (s.contains('dsa') || s.contains('data struct') || s.contains('algorithm')) return 'DSA (Data Structures and Algorithms)';
      if (s.contains('database') || s.contains('dbms') || s.contains('warehousing')) return 'Database Management and Warehousing';
      if (s.contains('ai') || s.contains('artificial')) return 'AI';
      if (s.contains('aptitude')) return 'General Aptitude';
    } else {
      if (s.contains('math')) return 'Engineering Mathematics';
      if (s.contains('digital') || s.contains('logic')) return 'Digital Logic';
      if (s.contains('co') || s.contains('organization') || s.contains('architecture')) return 'Computer Organization';
      if (s.contains('program') || s.contains('data struct')) return 'Programming & Data Structures';
      if (s.contains('algorithm')) return 'Algorithms';
      if (s.contains('toc') || s.contains('computation')) return 'Theory of Computation';
      if (s.contains('compiler')) return 'Compiler Design';
      if (s.contains('operating') || s.contains('os')) return 'Operating System';
      if (s.contains('database') || s.contains('dbms')) return 'Databases';
      if (s.contains('network') || s.contains('cn')) return 'Computer Networks';
      if (s.contains('aptitude')) return 'General Aptitude';
    }

    for (final key in keys) {
      if (key.toLowerCase().contains(s) || s.contains(key.toLowerCase())) {
        return key;
      }
    }
    return input;
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      if (mounted) setState(() {});
    });
    if (widget.initialSubject != null) {
      final provider = Provider.of<AppProvider>(context, listen: false);
      _selectedSubject = _normalizeSubject(widget.initialSubject!, provider.activeExam == 'CSIT');
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  List<PYQ> _applyFilters(List<PYQ> pyqs) {
    return pyqs.where((p) {
      // 1. Search Query
      final pyqYearStr = p.setNumber != null ? '${p.year} Set ${p.setNumber}' : p.year.toString();
      final q = _searchQuery.toLowerCase().trim();
      final matchesQuery = q.isEmpty ||
          p.questionText.toLowerCase().contains(q) ||
          p.topic.toLowerCase().contains(q) ||
          p.subject.toLowerCase().contains(q) ||
          pyqYearStr.toLowerCase().contains(q) ||
          p.type.toLowerCase() == q ||
          p.id.toLowerCase().contains(q);

      // 2. Subject Filter
      final matchesSubject = _selectedSubject == 'All' || p.subject == _selectedSubject;

      // 3. Year Filter
      final matchesYear = _selectedYear == 'All' || pyqYearStr == _selectedYear;

      // 4. Difficulty Filter
      final matchesDifficulty = _selectedDifficulty == 'All' || p.difficulty == _selectedDifficulty;

      // 5. NAT Drill Filter
      final matchesNat = !_natOnly || p.type == 'NAT';

      return matchesQuery && matchesSubject && matchesYear && matchesDifficulty && matchesNat;
    }).toList();
  }

  void _startInstantDrill(BuildContext context, List<PYQ> questions) {
    HapticFeedback.mediumImpact();
    if (questions.isEmpty) return;
    final drillQuestions = List<PYQ>.from(questions)..shuffle();
    final testQuestions = drillQuestions.take(min(30, drillQuestions.length)).toList();
    final minutes = max(5, (testQuestions.length * 2.5).ceil());
    final drillName = _selectedSubject != 'All'
        ? '$_selectedSubject Drill'
        : (_selectedYear != 'All'
            ? 'GATE $_selectedYear Drill'
            : (_natOnly ? 'NAT Practice Drill' : 'Custom PYQ Drill'));

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MockTestRunnerScreen(
          questions: testQuestions,
          duration: Duration(minutes: minutes),
          testName: drillName,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final allPyqs = provider.pyqs;

    // Filtered lists for each tab
    final pyqListAll = _applyFilters(allPyqs);
    final pyqListBookmarked = _applyFilters(allPyqs.where((p) => p.isBookmarked).toList());
    final pyqListDone = _applyFilters(allPyqs.where((p) => p.isCompleted).toList());
    final pyqListFlagged = _applyFilters(allPyqs.where((p) => p.isFlaggedForRevision).toList());

    final isCSIT = provider.activeExam == 'CSIT';
    final subjectsList = ['All', ...provider.currentSubjects];

    // Keep subject filter aligned when switching branch
    if (_selectedSubject != 'All' && !subjectsList.contains(_selectedSubject)) {
      _selectedSubject = _normalizeSubject(_selectedSubject, isCSIT);
      if (!subjectsList.contains(_selectedSubject)) {
        _selectedSubject = 'All';
      }
    }

    // Dynamic Year & Set list from available questions
    final extractedYears = allPyqs
        .map((p) => p.setNumber != null ? '${p.year} Set ${p.setNumber}' : '${p.year}')
        .toSet()
        .toList()
      ..sort((a, b) => b.compareTo(a));
    final yearsList = ['All', ...extractedYears];
    
    final difficultiesList = ['All', 'Easy', 'Medium', 'Hard'];

    return Scaffold(
      backgroundColor: context.colorBackground,
      appBar: AppBar(
        backgroundColor: context.colorSurface,
        elevation: 0,
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: Icon(Icons.arrow_back_ios_new_rounded, size: 18, color: context.textColor),
                onPressed: () => Navigator.pop(context),
              )
            : null,
        title: Text(
          'PYQ Question Bank',
          style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.bold, color: context.textColor),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.calculate_outlined, size: 21),
            tooltip: 'Virtual Calculator',
            color: context.textColor,
            onPressed: () {
              HapticFeedback.selectionClick();
              VirtualCalculator.show(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              children: [
                // 1. COMPACT SEARCH BAR WITH FILTER BUTTON
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 6),
                  child: Row(
                    children: [
                      Expanded(
                        child: NeuContainer(
                          isRecessed: true,
                          borderRadius: 16,
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                          child: TextField(
                            controller: _searchController,
                            style: TextStyle(color: context.textColor, fontSize: 13),
                            decoration: InputDecoration(
                              hintText: 'Search keyword, topic, or year...',
                              hintStyle: TextStyle(color: context.textSecondaryColor, fontSize: 13),
                              prefixIcon: Icon(Icons.search, color: context.textSecondaryColor, size: 20),
                              suffixIcon: _searchQuery.isNotEmpty
                                  ? IconButton(
                                      icon: Icon(Icons.clear, color: context.textSecondaryColor, size: 18),
                                      onPressed: () {
                                        setState(() {
                                          _searchController.clear();
                                          _searchQuery = '';
                                        });
                                      },
                                    )
                                  : null,
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                            ),
                            onChanged: (val) {
                              setState(() {
                                _searchQuery = val;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Filter Button
                      GestureDetector(
                        onTap: () => _showComprehensiveFilterSheet(subjectsList, yearsList, difficultiesList),
                        child: NeuContainer(
                          height: 46,
                          borderRadius: 16,
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          color: _activeFilterCount > 0 ? const Color(0xFFFF8522).withValues(alpha: 0.15) : null,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.tune_rounded,
                                size: 19,
                                color: _activeFilterCount > 0 ? const Color(0xFFFF8522) : context.textSecondaryColor,
                              ),
                              if (_activeFilterCount > 0) ...[
                                const SizedBox(width: 6),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFFF8522),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    '$_activeFilterCount',
                                    style: const TextStyle(color: Colors.white, fontSize: 10.5, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // 2. ACTIVE FILTER TAGS STRIP
                if (_activeFilterCount > 0)
                  Container(
                    height: 34,
                    margin: const EdgeInsets.only(bottom: 4),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        if (_natOnly)
                          _buildActiveFilterTag('NAT Drills', () => setState(() => _natOnly = false)),
                        if (_selectedSubject != 'All')
                          _buildActiveFilterTag(_selectedSubject, () => setState(() => _selectedSubject = 'All')),
                        if (_selectedYear != 'All')
                          _buildActiveFilterTag(_selectedYear, () => setState(() => _selectedYear = 'All')),
                        if (_selectedDifficulty != 'All')
                          _buildActiveFilterTag(_selectedDifficulty, () => setState(() => _selectedDifficulty = 'All')),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectedSubject = 'All';
                              _selectedYear = 'All';
                              _selectedDifficulty = 'All';
                              _natOnly = false;
                            });
                          },
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: AppTheme.error.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: AppTheme.error.withValues(alpha: 0.3)),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.close_rounded, size: 12, color: AppTheme.error),
                                SizedBox(width: 4),
                                Text('Clear All', style: TextStyle(color: AppTheme.error, fontSize: 11, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  // Quick selection pills when no filters are active
                  SizedBox(
                    height: 34,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        InkWell(
                          onTap: () => setState(() => _natOnly = true),
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFF8522).withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: const Color(0xFFFF8522).withValues(alpha: 0.35),
                              ),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.bolt_rounded, size: 14, color: Color(0xFFFF8522)),
                                SizedBox(width: 4),
                                Text('NAT Drills', style: TextStyle(color: Color(0xFFFF8522), fontSize: 11.5, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        _buildFilterPill(
                          title: 'Subject',
                          items: subjectsList,
                          selectedValue: _selectedSubject,
                          onChanged: (val) => setState(() => _selectedSubject = val),
                        ),
                        const SizedBox(width: 8),
                        _buildFilterPill(
                          title: 'Year',
                          items: yearsList,
                          selectedValue: _selectedYear,
                          onChanged: (val) => setState(() => _selectedYear = val),
                        ),
                        const SizedBox(width: 8),
                        _buildFilterPill(
                          title: 'Difficulty',
                          items: difficultiesList,
                          selectedValue: _selectedDifficulty,
                          onChanged: (val) => setState(() => _selectedDifficulty = val),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 6),

                // 3. TOP TABS
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: context.isDarkMode ? const Color(0xFF14151D) : const Color(0xFFF1F1F5),
                    borderRadius: BorderRadius.circular(22),
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
                      borderRadius: BorderRadius.circular(18),
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
                    labelPadding: const EdgeInsets.symmetric(horizontal: 4),
                    labelStyle: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 12),
                    unselectedLabelStyle: GoogleFonts.outfit(fontWeight: FontWeight.w500, fontSize: 12),
                    tabs: [
                      Tab(
                        height: 38,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.assignment_outlined, size: 14),
                              const SizedBox(width: 4),
                              Text('All (${pyqListAll.length})'),
                            ],
                          ),
                        ),
                      ),
                      Tab(
                        height: 38,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.bookmark_outline_rounded, size: 14),
                              const SizedBox(width: 4),
                              Text('Saved (${pyqListBookmarked.length})'),
                            ],
                          ),
                        ),
                      ),
                      Tab(
                        height: 38,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.done_all_rounded, size: 14),
                              const SizedBox(width: 4),
                              Text('Done (${pyqListDone.length})'),
                            ],
                          ),
                        ),
                      ),
                      Tab(
                        height: 38,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.flag_outlined, size: 14),
                              const SizedBox(width: 4),
                              Text('Flagged (${pyqListFlagged.length})'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // 4. TAB VIEWS WITH LISTS
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildQuestionList(context, provider, pyqListAll),
                      _buildQuestionList(context, provider, pyqListBookmarked),
                      _buildQuestionList(context, provider, pyqListDone),
                      _buildQuestionList(context, provider, pyqListFlagged),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _startInstantDrill(context, pyqListAll),
        backgroundColor: const Color(0xFFFF8522),
        elevation: 4,
        icon: const Icon(Icons.bolt_rounded, color: Colors.white, size: 20),
        label: Text(
          'Start Practice Drill',
          style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 13),
        ),
      ),
    );
  }

  void _showComprehensiveFilterSheet(
    List<String> subjectsList,
    List<String> yearsList,
    List<String> difficultiesList,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.colorSurface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.78,
              padding: const EdgeInsets.fromLTRB(18, 12, 18, 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 36,
                      height: 4,
                      decoration: BoxDecoration(
                        color: context.isDarkMode ? Colors.white24 : Colors.black26,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Filter Questions', style: AppTheme.poppinsBold(fontSize: 16, color: context.textColor)),
                      if (_activeFilterCount > 0)
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _selectedSubject = 'All';
                              _selectedYear = 'All';
                              _selectedDifficulty = 'All';
                              _natOnly = false;
                            });
                            setSheetState(() {});
                          },
                          child: const Text('Reset All', style: TextStyle(color: AppTheme.error, fontSize: 12, fontWeight: FontWeight.bold)),
                        ),
                    ],
                  ),
                  Divider(color: context.colorBorder),
                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        // 1. Quick Toggles
                        Text('QUESTION TYPE', style: TextStyle(color: context.textSecondaryColor, fontSize: 11, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        FilterChip(
                          selected: _natOnly,
                          label: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.bolt_rounded, size: 14, color: AppTheme.secondary),
                              SizedBox(width: 4),
                              Text('NAT Questions Only (Numerical Answer Type)', style: TextStyle(fontSize: 12)),
                            ],
                          ),
                          selectedColor: AppTheme.secondary.withValues(alpha: 0.2),
                          checkmarkColor: AppTheme.secondary,
                          onSelected: (val) {
                            setState(() => _natOnly = val);
                            setSheetState(() {});
                          },
                        ),
                        const SizedBox(height: 16),

                        // 2. Subject Filter
                        Text('SUBJECT', style: TextStyle(color: context.textSecondaryColor, fontSize: 11, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 6,
                          children: subjectsList.map((subj) {
                            final isSel = _selectedSubject == subj;
                            return ChoiceChip(
                              label: Text(subj, style: TextStyle(fontSize: 12, color: isSel ? Colors.white : context.textSecondaryColor)),
                              selected: isSel,
                              selectedColor: AppTheme.accentPurple,
                              backgroundColor: context.colorSurfaceElevated,
                              onSelected: (selected) {
                                if (selected) {
                                  setState(() => _selectedSubject = subj);
                                  setSheetState(() {});
                                }
                              },
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 16),

                        // 3. Year Filter
                        Text('YEAR & SET', style: TextStyle(color: context.textSecondaryColor, fontSize: 11, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 6,
                          children: yearsList.map((yr) {
                            final isSel = _selectedYear == yr;
                            return ChoiceChip(
                              label: Text(yr, style: TextStyle(fontSize: 12, color: isSel ? Colors.white : context.textSecondaryColor)),
                              selected: isSel,
                              selectedColor: AppTheme.accentPurple,
                              backgroundColor: context.colorSurfaceElevated,
                              onSelected: (selected) {
                                if (selected) {
                                  setState(() => _selectedYear = yr);
                                  setSheetState(() {});
                                }
                              },
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 16),

                        // 4. Difficulty
                        Text('DIFFICULTY', style: TextStyle(color: context.textSecondaryColor, fontSize: 11, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Row(
                          children: difficultiesList.map((diff) {
                            final isSel = _selectedDifficulty == diff;
                            return Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 3),
                                child: ChoiceChip(
                                  label: Center(child: Text(diff, style: TextStyle(fontSize: 11.5, color: isSel ? Colors.white : context.textSecondaryColor))),
                                  selected: isSel,
                                  selectedColor: AppTheme.primary,
                                  backgroundColor: context.colorSurfaceElevated,
                                  onSelected: (selected) {
                                    if (selected) {
                                      setState(() => _selectedDifficulty = diff);
                                      setSheetState(() {});
                                    }
                                  },
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 46,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primary,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Apply Filters', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
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

  Widget _buildFilterPill({
    required String title,
    required List<String> items,
    required String selectedValue,
    required ValueChanged<String> onChanged,
  }) {
    final isSelected = selectedValue != 'All';
    return InkWell(
      onTap: () => _showSelectionBottomSheet(title, items, selectedValue, onChanged),
      borderRadius: BorderRadius.circular(20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primary.withValues(alpha: 0.12) : context.colorSurface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppTheme.primary : context.textSecondaryColor.withValues(alpha: 0.25),
            width: isSelected ? 1.5 : 1.0,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isSelected ? "$title: $selectedValue" : title,
              style: TextStyle(
                color: isSelected ? AppTheme.primary : context.textColor,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                fontSize: 12,
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: isSelected ? AppTheme.primary : context.textSecondaryColor,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  void _showSelectionBottomSheet(
    String title,
    List<String> items,
    String currentValue,
    ValueChanged<String> onChanged,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: context.colorSurface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.5,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Select $title',
                      style: AppTheme.poppinsBold(fontSize: 16),
                    ),
                    IconButton(
                      icon: Icon(Icons.close_rounded, color: context.textSecondaryColor),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              Divider(color: context.colorBorder, height: 1),
              // Options List
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    final isSelected = item == currentValue;
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 2),
                      title: Text(
                        item,
                        style: TextStyle(
                          color: isSelected ? AppTheme.primary : context.textColor,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                      trailing: isSelected
                          ? const Icon(Icons.check_circle_rounded, color: AppTheme.primary, size: 20)
                          : null,
                      onTap: () {
                        Navigator.pop(context);
                        Future.delayed(const Duration(milliseconds: 120), () {
                          onChanged(item);
                        });
                      },
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

  Widget _buildQuestionList(BuildContext context, AppProvider provider, List<PYQ> list) {
    if (list.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.help_center_outlined, size: 56, color: context.textSecondaryColor.withValues(alpha: 0.4)),
            const SizedBox(height: 12),
            Text(
              'No questions found matching the criteria.',
              style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 14, color: context.textColor),
            ),
          ],
        ),
      );
    }

    final isPro = provider.isPro;
    // Inject native ad every 10 PYQs only for free tier users
    final int adFrequency = isPro ? 0 : 10;
    final int totalItems = isPro ? list.length : (list.length + (list.length ~/ adFrequency));

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 120),
      physics: const BouncingScrollPhysics(),
      itemCount: totalItems,
      itemBuilder: (context, index) {
        if (!isPro && index > 0 && index % (adFrequency + 1) == adFrequency) {
          return const _NativeAdWrapper();
        }

        final pyqIndex = isPro ? index : (index - (index ~/ (adFrequency + 1)));
        final pyq = list[pyqIndex];
        return _PYQCard(key: ValueKey(pyq.id), pyq: pyq, provider: provider);
      },
    );
  }
}

class _PYQCard extends StatefulWidget {
  final PYQ pyq;
  final AppProvider provider;

  const _PYQCard({super.key, required this.pyq, required this.provider});

  @override
  State<_PYQCard> createState() => _PYQCardState();
}

class _PYQCardState extends State<_PYQCard> {
  bool _showSolution = false;
  final TextEditingController _natController = TextEditingController();
  Set<String> _selectedMsqOptions = {};

  Widget? _cachedQuestionTextWidget;
  Widget? _cachedExplanationWidget;

  static final Map<String, Widget> _questionWidgetCache = {};

  Widget _getQuestionTextWidget() {
    _cachedQuestionTextWidget ??= _buildQuestionText(widget.pyq.questionText);
    return _cachedQuestionTextWidget!;
  }

  Widget _getExplanationWidget() {
    _cachedExplanationWidget ??= _buildQuestionText(widget.pyq.explanation, isExplanation: true);
    return _cachedExplanationWidget!;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cachedQuestionTextWidget = null;
    _cachedExplanationWidget = null;
  }

  @override
  void initState() {
    super.initState();
    if (widget.pyq.userAnswer != null) {
      if (widget.pyq.type == 'MSQ') {
        _selectedMsqOptions = widget.pyq.userAnswer!.split(';').toSet();
      } else {
        _natController.text = widget.pyq.userAnswer!;
      }
    }
  }

  @override
  void didUpdateWidget(covariant _PYQCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.pyq.questionText != oldWidget.pyq.questionText) {
      _cachedQuestionTextWidget = null;
    }
    if (widget.pyq.explanation != oldWidget.pyq.explanation) {
      _cachedExplanationWidget = null;
    }
    if (widget.pyq.userAnswer != oldWidget.pyq.userAnswer) {
      if (widget.pyq.type == 'MSQ') {
        _selectedMsqOptions = widget.pyq.userAnswer != null
            ? widget.pyq.userAnswer!.split(';').toSet()
            : {};
      } else {
        _natController.text = widget.pyq.userAnswer ?? '';
      }
    }
  }

  @override
  void dispose() {
    _natController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pyq = widget.pyq;
    final provider = widget.provider;

    return NeuContainer(
      margin: const EdgeInsets.only(bottom: 14),
      borderRadius: 20,
      padding: const EdgeInsets.all(16.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: badges and bookmarks
            // Header Row 1: Meta badges & buttons
            Row(
              children: [
                // Year Badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3.5),
                  decoration: BoxDecoration(
                    color: AppTheme.accentPurple.withValues(alpha: 0.14),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    provider.activeExam == 'CSIT'
                        ? 'CSIT ${pyq.year}${pyq.setNumber != null ? " Set ${pyq.setNumber}" : ""}'
                        : 'DA ${pyq.year}${pyq.setNumber != null ? " Set ${pyq.setNumber}" : ""}',
                    style: GoogleFonts.outfit(
                      color: AppTheme.accentPurple,
                      fontSize: 10.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                // Question Badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3.5),
                  decoration: BoxDecoration(
                    color: context.isDarkMode
                        ? Colors.white.withValues(alpha: 0.08)
                        : Colors.black.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Q. ${pyq.id.split('_').last}',
                    style: GoogleFonts.outfit(
                      color: context.textColor,
                      fontSize: 10.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                // Type Badge (MCQ, MSQ, NAT)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3.5),
                  decoration: BoxDecoration(
                    color: pyq.type == 'NAT'
                        ? const Color(0xFFFF8522).withValues(alpha: 0.16)
                        : pyq.type == 'MSQ'
                            ? const Color(0xFFFF9100).withValues(alpha: 0.14)
                            : AppTheme.accentPurple.withValues(alpha: 0.14),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    pyq.type,
                    style: GoogleFonts.outfit(
                      color: pyq.type == 'NAT'
                          ? const Color(0xFFFF8522)
                          : pyq.type == 'MSQ'
                              ? const Color(0xFFFF9100)
                              : AppTheme.accentPurple,
                      fontSize: 10.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
                // Virtual Calculator shortcut
                IconButton(
                  icon: const Icon(Icons.calculate_outlined, size: 19),
                  color: context.textSecondaryColor,
                  tooltip: 'Virtual Calculator',
                  visualDensity: VisualDensity.compact,
                  onPressed: () {
                    HapticFeedback.selectionClick();
                    VirtualCalculator.show(context);
                  },
                ),
                // Flag revision
                IconButton(
                  icon: Icon(
                    pyq.isFlaggedForRevision ? Icons.flag_rounded : Icons.flag_outlined,
                    color: pyq.isFlaggedForRevision ? AppTheme.error : context.textSecondaryColor,
                    size: 19,
                  ),
                  onPressed: () {
                    HapticFeedback.selectionClick();
                    provider.togglePYQFlagRevision(pyq.id);
                  },
                  tooltip: 'Flag for revision',
                  visualDensity: VisualDensity.compact,
                ),
                // Bookmark
                IconButton(
                  icon: Icon(
                    pyq.isBookmarked ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                    color: pyq.isBookmarked ? const Color(0xFFFF8522) : context.textSecondaryColor,
                    size: 20,
                  ),
                  onPressed: () {
                    HapticFeedback.selectionClick();
                    provider.togglePYQBookmark(pyq.id);
                  },
                  tooltip: 'Bookmark question',
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Header Row 2: Subject & Topic Tags
            Wrap(
              spacing: 8,
              runSpacing: 6,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                // Subject Tag
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: context.textSecondaryColor.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    pyq.subject,
                    style: TextStyle(
                      color: context.textSecondaryColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Topic Tag
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    pyq.topic,
                    style: const TextStyle(
                      color: AppTheme.primary,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Question Text
            _getQuestionTextWidget(),
            if (pyq.hasImage && pyq.imagePath != null) ...[
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (dialogCtx) => Dialog(
                      backgroundColor: Colors.transparent,
                      insetPadding: const EdgeInsets.all(12),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: context.colorSurface,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: context.colorBorder),
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Pinch to Zoom Diagram',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: context.textSecondaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: InteractiveViewer(
                                    panEnabled: true,
                                    minScale: 0.8,
                                    maxScale: 4.0,
                                    child: pyq.imagePath!.startsWith('http')
                                        ? Image.network(
                                            pyq.imagePath!,
                                            fit: BoxFit.contain,
                                            errorBuilder: (context, error, stackTrace) =>
                                                const Icon(Icons.broken_image, color: Colors.grey, size: 50),
                                          )
                                        : Image.asset(
                                            pyq.imagePath!,
                                            fit: BoxFit.contain,
                                            errorBuilder: (context, error, stackTrace) =>
                                                const Icon(Icons.broken_image, color: Colors.grey, size: 50),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close_rounded, color: Colors.white),
                            onPressed: () => Navigator.pop(dialogCtx),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        color: context.textColor.withOpacity(0.05),
                        padding: const EdgeInsets.all(8),
                        child: pyq.imagePath!.startsWith('http')
                          ? Image.network(
                              pyq.imagePath!,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, color: Colors.grey, size: 50),
                            )
                          : Image.asset(
                              pyq.imagePath!,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: AppTheme.error.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(Icons.broken_image_outlined, color: AppTheme.error),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          'Diagram image not found yet. It will load once added to assets/images/.',
                                          style: TextStyle(color: AppTheme.error, fontSize: 12, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(6),
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.7),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.zoom_in_rounded, size: 12, color: Colors.white),
                          SizedBox(width: 3),
                          Text('Zoom', style: TextStyle(color: Colors.white, fontSize: 9.5, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 16),

            // Options (MCQ) or input field (NAT)
            if (pyq.isMCQ)
              _buildMCQOptions(pyq, provider)
            else
              _buildNATInput(pyq, provider),

            const SizedBox(height: 16),
            Divider(height: 1, color: context.colorBorder),
            const SizedBox(height: 12),

            // Card Footer: Responsive action controls (Mark Solved, Try Again, Discuss, Solution)
            SizedBox(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 6,
                runSpacing: 8,
                children: [
                  // Completed Checkbox & Try Again
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 22,
                        height: 22,
                        child: Checkbox(
                          value: pyq.isCompleted,
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          visualDensity: VisualDensity.compact,
                          onChanged: (val) {
                            if (val != null) {
                              if (val) {
                                provider.solvePYQ(pyq.id, pyq.userAnswer ?? '');
                              } else {
                                provider.unsolvePYQ(pyq.id);
                              }
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Mark Solved',
                        style: TextStyle(fontSize: 11.5, color: context.textSecondaryColor, fontWeight: FontWeight.bold),
                      ),
                      if (pyq.isCompleted) ...[
                        const SizedBox(width: 8),
                        InkWell(
                          onTap: () {
                            HapticFeedback.selectionClick();
                            provider.unsolvePYQ(pyq.id);
                          },
                          borderRadius: BorderRadius.circular(6),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                            decoration: BoxDecoration(
                              color: AppTheme.accentFlame.withValues(alpha: 0.14),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.refresh_rounded, size: 12, color: AppTheme.accentFlame),
                                SizedBox(width: 3),
                                Text(
                                  'Try Again',
                                  style: TextStyle(
                                    color: AppTheme.accentFlame,
                                    fontSize: 10.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Discuss Button
                      TextButton.icon(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          visualDensity: VisualDensity.compact,
                        ),
                        onPressed: () {
                          QuestionDiscussionSheet.show(context, pyq);
                        },
                        icon: const Icon(Icons.forum_outlined, color: AppTheme.primary, size: 15),
                        label: const Text(
                          'Discuss',
                          style: TextStyle(
                            color: AppTheme.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 11.5,
                          ),
                        ),
                      ),
                      const SizedBox(width: 2),

                      // Show Solution toggle
                      TextButton.icon(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          visualDensity: VisualDensity.compact,
                        ),
                        onPressed: () {
                          setState(() {
                            _showSolution = !_showSolution;
                          });
                        },
                        icon: Icon(
                          _showSolution ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                          color: const Color(0xFFFF8522),
                          size: 15,
                        ),
                        label: Text(
                          _showSolution ? 'Hide' : 'Solution',
                          style: const TextStyle(
                            color: Color(0xFFFF8522),
                            fontWeight: FontWeight.bold,
                            fontSize: 11.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Expanded Solution Area
            if (_showSolution) ...[
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppTheme.secondary.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppTheme.secondary.withOpacity(0.2)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.psychology, color: AppTheme.secondary, size: 18),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            'CORRECT ANSWER: ${pyq.correctAnswer}',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.secondary),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    _getExplanationWidget(),
                  ],
                ),
              ),
            ],
          ],
        ),
    );
  }

  Widget _buildMCQOptions(PYQ pyq, AppProvider provider) {
    final alreadySolved = pyq.isCompleted;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(pyq.options.length, (index) {
          final option = pyq.options[index];
          final optionLetter = String.fromCharCode(65 + index); // A, B, C, D
          final isSelected = pyq.type == 'MSQ'
              ? (alreadySolved
                  ? (pyq.userAnswer != null && pyq.userAnswer!.split(';').contains(optionLetter))
                  : _selectedMsqOptions.contains(optionLetter))
              : (alreadySolved && pyq.userAnswer == optionLetter);
          final correctLetters = pyq.correctAnswer.split(';');
          final correctIndex = pyq.options.indexOf(pyq.correctAnswer);
          final isCorrectOption = correctLetters.contains(optionLetter) || (correctIndex != -1 && correctIndex == index);

          Color borderCol = context.isDarkMode
              ? Colors.white.withValues(alpha: 0.10)
              : Colors.black.withValues(alpha: 0.08);
          Color bgCol = context.colorSurface;
          Color textCol = context.textColor;

          if (alreadySolved) {
            if (isCorrectOption) {
              borderCol = AppTheme.accentMint;
              bgCol = AppTheme.accentMint.withValues(alpha: 0.12);
              textCol = AppTheme.accentMint;
            } else if (isSelected) {
              borderCol = AppTheme.error;
              bgCol = AppTheme.error.withValues(alpha: 0.12);
              textCol = AppTheme.error;
            }
          } else if (isSelected) {
            borderCol = AppTheme.accentPurple;
            bgCol = AppTheme.accentPurple.withValues(alpha: 0.12);
            textCol = AppTheme.accentPurple;
          }

          return Padding(
            padding: const EdgeInsets.only(bottom: 9.0),
            child: InkWell(
              onTap: () {
                HapticFeedback.selectionClick();
                if (!alreadySolved) {
                  if (pyq.type == 'MSQ') {
                    setState(() {
                      if (_selectedMsqOptions.contains(optionLetter)) {
                        _selectedMsqOptions.remove(optionLetter);
                      } else {
                        _selectedMsqOptions.add(optionLetter);
                      }
                    });
                  } else {
                    provider.solvePYQ(pyq.id, optionLetter);
                  }
                }
              },
              borderRadius: BorderRadius.circular(14),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(
                  color: bgCol,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: borderCol, width: isSelected || (alreadySolved && isCorrectOption) ? 1.5 : 1.0),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: borderCol.withValues(alpha: 0.18),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected ? borderCol : context.colorBackground,
                        shape: pyq.type == 'MSQ' ? BoxShape.rectangle : BoxShape.circle,
                        borderRadius: pyq.type == 'MSQ' ? BorderRadius.circular(8) : null,
                        border: Border.all(
                          color: isSelected ? Colors.transparent : context.textSecondaryColor.withValues(alpha: 0.25),
                        ),
                      ),
                      child: Text(
                        optionLetter,
                        style: GoogleFonts.outfit(
                          color: isSelected ? Colors.white : context.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        option,
                        style: GoogleFonts.outfit(
                          color: textCol,
                          fontSize: 13.5,
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                          height: 1.35,
                        ),
                      ),
                    ),
                    if (alreadySolved && isCorrectOption)
                      const Icon(Icons.check_circle_rounded, color: AppTheme.accentMint, size: 21)
                    else if (alreadySolved && isSelected)
                      const Icon(Icons.cancel_rounded, color: AppTheme.error, size: 21),
                  ],
                ),
              ),
            ),
          );
        }),
        if (pyq.type == 'MSQ' && !alreadySolved) ...[
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.accentPurple,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                padding: const EdgeInsets.symmetric(vertical: 13),
                elevation: 0,
              ),
              onPressed: () {
                HapticFeedback.selectionClick();
                if (_selectedMsqOptions.isNotEmpty) {
                  final sortedAnswers = _selectedMsqOptions.toList()..sort();
                  provider.solvePYQ(pyq.id, sortedAnswers.join(';'));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please select at least one option.'),
                      backgroundColor: AppTheme.error,
                    ),
                  );
                }
              },
              icon: const Icon(Icons.done_all_rounded, size: 18),
              label: Text(
                'Submit MSQ Answers (${_selectedMsqOptions.length})',
                style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 13.5),
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildNATInput(PYQ pyq, AppProvider provider) {
    final alreadySolved = pyq.isCompleted;
    final isCorrect = pyq.isAnswerCorrect(pyq.userAnswer);

    Color borderCol = context.isDarkMode ? Colors.white.withValues(alpha: 0.12) : Colors.black.withValues(alpha: 0.10);
    if (alreadySolved) {
      borderCol = isCorrect ? AppTheme.success : AppTheme.error;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Enter Numerical Answer:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: context.textSecondaryColor),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _natController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                enabled: !alreadySolved,
                style: TextStyle(color: context.textColor),
                decoration: InputDecoration(
                  hintText: 'e.g., 3.14',
                  hintStyle: TextStyle(color: context.textSecondaryColor),
                  filled: true,
                  fillColor: context.colorSurfaceElevated,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: borderCol, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: alreadySolved ? borderCol : AppTheme.primary, width: 1.5),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: borderCol, width: 1.5),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            if (!alreadySolved)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.secondary,
                  foregroundColor: AppTheme.background,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                ),
                onPressed: () {
                  final ans = _natController.text.trim();
                  if (ans.isNotEmpty) {
                    provider.solvePYQ(pyq.id, ans);
                  }
                },
                child: const Text('Submit', style: TextStyle(fontWeight: FontWeight.bold)),
              )
            else
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(
                  color: borderCol.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(
                      isCorrect ? Icons.check_circle : Icons.cancel,
                      color: isCorrect ? AppTheme.success : AppTheme.error,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      isCorrect ? 'Correct' : 'Incorrect',
                      style: TextStyle(
                        color: isCorrect ? AppTheme.success : AppTheme.error,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildQuestionText(String text, {bool isExplanation = false}) {
    final effectiveTextColor = context.textColor;
    final cacheKey = '${text.hashCode}_${isExplanation}_${context.isDarkMode}';
    if (_questionWidgetCache.containsKey(cacheKey)) {
      return _questionWidgetCache[cacheKey]!;
    }

    final widget = Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: MarkdownBody(
        data: text,
        selectable: true,
        extensionSet: md.ExtensionSet.gitHubWeb,
        builders: {
          'math': MathElementBuilder(color: effectiveTextColor),
          'block_math': BlockMathElementBuilder(color: effectiveTextColor),
        },
        inlineSyntaxes: [InlineMathSyntax()],
        blockSyntaxes: [BlockMathSyntax()],
        styleSheet: MarkdownStyleSheet(
          p: TextStyle(
            fontSize: isExplanation ? 13 : 15,
            fontWeight: isExplanation ? FontWeight.normal : FontWeight.w500,
            color: effectiveTextColor,
            height: 1.4,
          ),
          codeblockDecoration: BoxDecoration(
            color: isExplanation 
                ? AppTheme.secondary.withValues(alpha: 0.08)
                : (context.isDarkMode ? context.colorSurfaceElevated : const Color(0xFFF1F5F9)),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: (isExplanation ? AppTheme.secondary : context.colorBorder).withValues(alpha: 0.2),
            ),
          ),
          code: AppTheme.monospaceStyle(
            fontSize: 11.5,
            color: effectiveTextColor,
          ),
          tableBorder: TableBorder.all(color: context.colorBorder),
          tableCellsPadding: const EdgeInsets.all(8),
        ),
      ),
    );

    _questionWidgetCache[cacheKey] = widget;
    return widget;
  }
}

class _NativeAdWrapper extends StatefulWidget {
  const _NativeAdWrapper();

  @override
  State<_NativeAdWrapper> createState() => _NativeAdWrapperState();
}

class _NativeAdWrapperState extends State<_NativeAdWrapper> {
  NativeAd? _nativeAd;
  bool _isAdLoaded = false;
  bool _isAdFailed = false;

  @override
  void initState() {
    super.initState();
    _nativeAd = AdService().getNativeAd(
      onAdLoaded: () {
        if (mounted) {
          setState(() {
            _isAdLoaded = true;
          });
        }
      },
      onAdFailed: () {
        if (mounted) {
          setState(() {
            _isAdFailed = true;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _nativeAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPro = Provider.of<AppProvider>(context).isPro;
    if (isPro || _nativeAd == null || _isAdFailed) return const SizedBox.shrink();

    return NeuContainer(
      margin: const EdgeInsets.only(bottom: 14),
      borderRadius: 18,
      padding: const EdgeInsets.all(8),
      child: Container(
        constraints: const BoxConstraints(
          minWidth: 320,
          minHeight: 320,
          maxWidth: 400,
          maxHeight: 400,
        ),
        child: _isAdLoaded
            ? AdWidget(ad: _nativeAd!)
            : const Center(
                child: CircularProgressIndicator(color: AppTheme.accentPurple),
              ),
      ),
    );
  }
}
