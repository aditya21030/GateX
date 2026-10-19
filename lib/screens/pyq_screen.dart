import 'package:flutter/material.dart';
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

class PYQScreen extends StatefulWidget {
  const PYQScreen({super.key});

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
        color: AppTheme.primary.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.primary.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(color: AppTheme.primary, fontSize: 11, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 4),
          InkWell(
            onTap: onRemove,
            child: const Icon(Icons.close_rounded, size: 13, color: AppTheme.primary),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
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
      final matchesQuery = _searchQuery.isEmpty ||
          p.questionText.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          p.topic.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          p.subject.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          pyqYearStr.toLowerCase().contains(_searchQuery.toLowerCase());

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

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final allPyqs = provider.pyqs;

    // Filtered lists for each tab
    final pyqListAll = _applyFilters(allPyqs);
    final pyqListBookmarked = _applyFilters(allPyqs.where((p) => p.isBookmarked).toList());
    final pyqListDone = _applyFilters(allPyqs.where((p) => p.isCompleted).toList());
    final pyqListFlagged = _applyFilters(allPyqs.where((p) => p.isFlaggedForRevision).toList());

    final subjectsList = ['All', ...provider.currentSubjects];
    
    List<String> yearsList = ['All'];
    if (provider.activeExam == 'CSIT') {
      for (int y = 2026; y >= 1991; y--) {
        if (y == 2026 || y == 2025 || y == 2024 || y == 2021 || y == 2017 || y == 2016) {
          yearsList.add('$y Set 1');
          yearsList.add('$y Set 2');
        } else if (y == 2015 || y == 2014) {
          yearsList.add('$y Set 1');
          yearsList.add('$y Set 2');
          yearsList.add('$y Set 3');
        } else {
          yearsList.add('$y');
        }
      }
    } else {
      yearsList.addAll(['2026', '2025', '2024']);
    }
    
    final difficultiesList = ['All', 'Easy', 'Medium', 'Hard'];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          VirtualCalculator.show(context);
        },
        child: const Icon(Icons.calculate),
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
                        child: TextField(
                          controller: _searchController,
                          style: TextStyle(color: context.textColor),
                          decoration: InputDecoration(
                            hintText: 'Search by keyword, topic, or year...',
                            hintStyle: const TextStyle(color: AppTheme.textSecondary, fontSize: 13),
                            prefixIcon: const Icon(Icons.search, color: AppTheme.textSecondary, size: 20),
                            suffixIcon: _searchQuery.isNotEmpty
                                ? IconButton(
                                    icon: const Icon(Icons.clear, color: AppTheme.textSecondary, size: 18),
                                    onPressed: () {
                                      setState(() {
                                        _searchController.clear();
                                        _searchQuery = '';
                                      });
                                    },
                                  )
                                : null,
                            filled: true,
                            fillColor: context.colorSurface,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onChanged: (val) {
                            setState(() {
                              _searchQuery = val;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Filter Button with Badge
                      InkWell(
                        onTap: () => _showComprehensiveFilterSheet(subjectsList, yearsList, difficultiesList),
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          height: 48,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: _activeFilterCount > 0
                                ? AppTheme.primary.withValues(alpha: 0.15)
                                : context.colorSurface,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: _activeFilterCount > 0
                                  ? AppTheme.primary
                                  : Colors.white.withValues(alpha: 0.08),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.tune_rounded,
                                size: 20,
                                color: _activeFilterCount > 0 ? AppTheme.primary : AppTheme.textSecondary,
                              ),
                              if (_activeFilterCount > 0) ...[
                                const SizedBox(width: 6),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  decoration: const BoxDecoration(
                                    color: AppTheme.primary,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    '$_activeFilterCount',
                                    style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
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
                              color: context.colorSurface,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.bolt_rounded, size: 14, color: AppTheme.secondary),
                                SizedBox(width: 4),
                                Text('NAT Drills', style: TextStyle(color: AppTheme.secondary, fontSize: 11.5, fontWeight: FontWeight.bold)),
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
                      ],
                    ),
                  ),
                const SizedBox(height: 6),

                // 3. TOP TABS
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: context.colorSurface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppTheme.textSecondary.withValues(alpha: 0.1)),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    indicator: BoxDecoration(
                      color: AppTheme.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    labelColor: Colors.white,
                    unselectedLabelColor: AppTheme.textSecondary,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 4),
                    labelStyle: AppTheme.poppinsBold(fontSize: 12),
                    unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                    tabs: const [
                      Tab(
                        height: 38,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.assignment_outlined, size: 14),
                              SizedBox(width: 4),
                              Text('All'),
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
                              Icon(Icons.bookmark_outline_rounded, size: 14),
                              SizedBox(width: 4),
                              Text('Saved'),
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
                              Icon(Icons.done_all_rounded, size: 14),
                              SizedBox(width: 4),
                              Text('Done'),
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
                              Icon(Icons.flag_outlined, size: 14),
                              SizedBox(width: 4),
                              Text('Flagged'),
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
      backgroundColor: AppTheme.surface,
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
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Filter Questions', style: AppTheme.poppinsBold(fontSize: 16)),
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
                  const Divider(color: Colors.white12),
                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        // 1. Quick Toggles
                        const Text('QUESTION TYPE', style: TextStyle(color: AppTheme.textSecondary, fontSize: 11, fontWeight: FontWeight.bold)),
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
                        const Text('SUBJECT', style: TextStyle(color: AppTheme.textSecondary, fontSize: 11, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 6,
                          children: subjectsList.map((subj) {
                            final isSel = _selectedSubject == subj;
                            return ChoiceChip(
                              label: Text(subj, style: TextStyle(fontSize: 12, color: isSel ? Colors.white : AppTheme.textSecondary)),
                              selected: isSel,
                              selectedColor: AppTheme.primary,
                              backgroundColor: AppTheme.background,
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
                        const Text('YEAR & SET', style: TextStyle(color: AppTheme.textSecondary, fontSize: 11, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 6,
                          children: yearsList.take(12).map((yr) {
                            final isSel = _selectedYear == yr;
                            return ChoiceChip(
                              label: Text(yr, style: TextStyle(fontSize: 12, color: isSel ? Colors.white : AppTheme.textSecondary)),
                              selected: isSel,
                              selectedColor: AppTheme.primary,
                              backgroundColor: AppTheme.background,
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
                        const Text('DIFFICULTY', style: TextStyle(color: AppTheme.textSecondary, fontSize: 11, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Row(
                          children: difficultiesList.map((diff) {
                            final isSel = _selectedDifficulty == diff;
                            return Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 3),
                                child: ChoiceChip(
                                  label: Center(child: Text(diff, style: TextStyle(fontSize: 11.5, color: isSel ? Colors.white : AppTheme.textSecondary))),
                                  selected: isSel,
                                  selectedColor: AppTheme.primary,
                                  backgroundColor: AppTheme.background,
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
            color: isSelected ? AppTheme.primary : AppTheme.textSecondary.withValues(alpha: 0.2),
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
              color: isSelected ? AppTheme.primary : AppTheme.textSecondary,
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
      backgroundColor: AppTheme.background,
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
                      icon: const Icon(Icons.close_rounded, color: AppTheme.textSecondary),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              Divider(color: context.colorSurface, height: 1),
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
            Icon(Icons.help_center_outlined, size: 56, color: AppTheme.textSecondary.withOpacity(0.4)),
            const SizedBox(height: 12),
            const Text(
              'No questions found matching the criteria.',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ],
        ),
      );
    }

    // We will inject an Ad every 10 PYQs
    // So if list has 25 items, we inject at index 10, 20.
    // Total items = list.length + (list.length ~/ 10)
    final int adFrequency = 10;
    final int totalItems = list.length + (list.length ~/ adFrequency);

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      physics: const BouncingScrollPhysics(),
      itemCount: totalItems,
      itemBuilder: (context, index) {
        if (index > 0 && index % (adFrequency + 1) == adFrequency) {
          return const _NativeAdWrapper();
        }

        final pyqIndex = index - (index ~/ (adFrequency + 1));
        final pyq = list[pyqIndex];
        return _PYQCard(pyq: pyq, provider: provider);
      },
    );
  }
}

class _PYQCard extends StatefulWidget {
  final PYQ pyq;
  final AppProvider provider;

  const _PYQCard({required this.pyq, required this.provider});

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

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
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
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppTheme.secondary.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    provider.activeExam == 'CSIT' ? 'CSIT ${pyq.year}${pyq.setNumber != null ? " Set ${pyq.setNumber}" : ""}' : 'DA ${pyq.year}${pyq.setNumber != null ? " Set ${pyq.setNumber}" : ""}',
                    style: const TextStyle(
                      color: AppTheme.secondary,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                // Question Badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'Q. ${pyq.id.split('_').last}',
                    style: const TextStyle(
                      color: AppTheme.primary,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                // Type Badge (MCQ, MSQ, NAT)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: pyq.type == 'MSQ'
                        ? AppTheme.error.withOpacity(0.12)
                        : pyq.type == 'NAT'
                            ? AppTheme.success.withOpacity(0.12)
                            : AppTheme.primary.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    pyq.type,
                    style: TextStyle(
                      color: pyq.type == 'MSQ'
                          ? AppTheme.error
                          : pyq.type == 'NAT'
                              ? AppTheme.success
                              : AppTheme.primary,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
                // Flag revision
                IconButton(
                  icon: Icon(
                    pyq.isFlaggedForRevision ? Icons.flag_rounded : Icons.flag_outlined,
                    color: pyq.isFlaggedForRevision ? AppTheme.error : AppTheme.textSecondary,
                    size: 20,
                  ),
                  onPressed: () => provider.togglePYQFlagRevision(pyq.id),
                  tooltip: 'Flag for revision',
                ),
                // Bookmark
                IconButton(
                  icon: Icon(
                    pyq.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                    color: pyq.isBookmarked ? Colors.amber : AppTheme.textSecondary,
                    size: 20,
                  ),
                  onPressed: () => provider.togglePYQBookmark(pyq.id),
                  tooltip: 'Bookmark question',
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
                    color: AppTheme.textSecondary.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    pyq.subject,
                    style: const TextStyle(
                      color: AppTheme.textSecondary,
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
                            child: Row(
                              children: [
                                const Icon(Icons.broken_image_outlined, color: AppTheme.error),
                                const SizedBox(width: 8),
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
            ],
            const SizedBox(height: 16),

            // Options (MCQ) or input field (NAT)
            if (pyq.isMCQ)
              _buildMCQOptions(pyq, provider)
            else
              _buildNATInput(pyq, provider),

            const SizedBox(height: 16),
            const Divider(height: 1, color: AppTheme.textSecondary),
            const SizedBox(height: 12),

            // Card Footer: Done checkbox, Discuss button, and show solution toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Completed Checkbox
                Row(
                  children: [
                    Checkbox(
                      value: pyq.isCompleted,
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
                    const Text(
                      'Mark Solved',
                      style: TextStyle(fontSize: 11.5, color: AppTheme.textSecondary, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                Row(
                  children: [
                    // Discuss Button
                    TextButton.icon(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        visualDensity: VisualDensity.compact,
                      ),
                      onPressed: () {
                        QuestionDiscussionSheet.show(context, pyq);
                      },
                      icon: const Icon(Icons.forum_outlined, color: AppTheme.primary, size: 16),
                      label: const Text(
                        'Discuss',
                        style: TextStyle(
                          color: AppTheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 11.5,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),

                    // Show Solution toggle
                    TextButton.icon(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        visualDensity: VisualDensity.compact,
                      ),
                      onPressed: () {
                        setState(() {
                          _showSolution = !_showSolution;
                        });
                      },
                      icon: Icon(
                        _showSolution ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                        color: AppTheme.secondary,
                        size: 16,
                      ),
                      label: Text(
                        _showSolution ? 'Hide Solution' : 'Solution',
                        style: const TextStyle(
                          color: AppTheme.secondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 11.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
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
              : pyq.userAnswer == optionLetter;
          final correctLetters = pyq.correctAnswer.split(';');
          final correctIndex = pyq.options.indexOf(pyq.correctAnswer);
          final isCorrectOption = correctLetters.contains(optionLetter) || (correctIndex != -1 && correctIndex == index);

          Color borderCol = AppTheme.textSecondary.withOpacity(0.2);
          Color bgCol = context.colorSurface;
          Color textCol = context.textColor;

          if (alreadySolved) {
            if (isCorrectOption) {
              borderCol = AppTheme.success;
              bgCol = AppTheme.success.withOpacity(0.08);
              textCol = AppTheme.success;
            } else if (isSelected) {
              borderCol = AppTheme.error;
              bgCol = AppTheme.error.withOpacity(0.08);
              textCol = AppTheme.error;
            }
          } else if (isSelected) {
            borderCol = AppTheme.primary;
            bgCol = AppTheme.primary.withOpacity(0.08);
            textCol = AppTheme.primary;
          }

          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: InkWell(
              onTap: () {
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
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(
                  color: bgCol,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: borderCol, width: 1.5),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected ? borderCol : AppTheme.background,
                        shape: pyq.type == 'MSQ' ? BoxShape.rectangle : BoxShape.circle,
                        borderRadius: pyq.type == 'MSQ' ? BorderRadius.circular(6) : null,
                        border: Border.all(
                          color: isSelected ? Colors.transparent : AppTheme.textSecondary.withOpacity(0.3),
                        ),
                      ),
                      child: Text(
                        optionLetter,
                        style: TextStyle(
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
                        style: TextStyle(
                          color: textCol,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    if (alreadySolved && isCorrectOption)
                      const Icon(Icons.check_circle, color: AppTheme.success, size: 20)
                    else if (alreadySolved && isSelected)
                      const Icon(Icons.cancel, color: AppTheme.error, size: 20),
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
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.secondary,
                foregroundColor: AppTheme.background,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: () {
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
              child: const Text('Submit Answers', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildNATInput(PYQ pyq, AppProvider provider) {
    final alreadySolved = pyq.isCompleted;
    final isCorrect = pyq.isAnswerCorrect(pyq.userAnswer);

    Color borderCol = AppTheme.textSecondary.withOpacity(0.2);
    if (alreadySolved) {
      borderCol = isCorrect ? AppTheme.success : AppTheme.error;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Enter Numerical Answer:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.textSecondary),
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
                  hintStyle: const TextStyle(color: AppTheme.textSecondary),
                  filled: true,
                  fillColor: context.colorSurface,
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
    final cacheKey = '${text.hashCode}_$isExplanation';
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
          'math': MathElementBuilder(),
          'block_math': BlockMathElementBuilder(),
        },
        inlineSyntaxes: [InlineMathSyntax()],
        blockSyntaxes: [BlockMathSyntax()],
        styleSheet: MarkdownStyleSheet(
          p: TextStyle(
            fontSize: isExplanation ? 13 : 15,
            fontWeight: isExplanation ? FontWeight.normal : FontWeight.w500,
            color: context.textColor,
            height: 1.4,
          ),
          codeblockDecoration: BoxDecoration(
            color: isExplanation 
                ? AppTheme.secondary.withOpacity(0.04)
                : AppTheme.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: (isExplanation ? AppTheme.secondary : AppTheme.textSecondary).withOpacity(0.1),
            ),
          ),
          code: AppTheme.monospaceStyle(
            fontSize: 11.5,
            color: context.textColor,
          ),
          tableBorder: TableBorder.all(color: AppTheme.textSecondary.withOpacity(0.2)),
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
    if (_nativeAd == null || _isAdFailed) return const SizedBox.shrink();

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(8),
        constraints: const BoxConstraints(
          minWidth: 320, // minimum recommended width
          minHeight: 320, // minimum recommended height
          maxWidth: 400,
          maxHeight: 400,
        ),
        child: _isAdLoaded
            ? AdWidget(ad: _nativeAd!)
            : const Center(
                child: CircularProgressIndicator(color: AppTheme.primary),
              ),
      ),
    );
  }
}
