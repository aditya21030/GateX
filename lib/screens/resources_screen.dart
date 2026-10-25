import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/note_model.dart';
import '../data/notes_data.dart';
import '../providers/app_provider.dart';
import '../services/ad_service.dart';
import '../services/pdf_generator_service.dart';
import '../theme/app_theme.dart';
import '../widgets/neu_widgets.dart';
import 'pro_upgrade_screen.dart';

class ResourcesScreen extends StatefulWidget {
  const ResourcesScreen({super.key});

  @override
  State<ResourcesScreen> createState() => _ResourcesScreenState();
}

class _ResourcesScreenState extends State<ResourcesScreen> {
  String _selectedFilter = 'ALL'; // 'ALL', 'DA', 'CSIT'
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  IconData _getSubjectIcon(String iconKey) {
    switch (iconKey) {
      case 'functions':
        return Icons.functions_rounded;
      case 'query_stats':
        return Icons.query_stats_rounded;
      case 'calculate':
        return Icons.calculate_rounded;
      case 'psychology':
        return Icons.psychology_rounded;
      case 'memory':
        return Icons.memory_rounded;
      case 'storage':
        return Icons.storage_rounded;
      case 'terminal':
        return Icons.terminal_rounded;
      case 'computer':
        return Icons.computer_rounded;
      case 'hub':
        return Icons.hub_rounded;
      case 'code':
        return Icons.code_rounded;
      default:
        return Icons.menu_book_rounded;
    }
  }

  Color _getSubjectColor(String id) {
    if (id.contains('linear')) {
      return const Color(0xFF6C5CE7);
    } else if (id.contains('prob')) {
      return const Color(0xFFFFB300);
    } else if (id.contains('calc')) {
      return const Color(0xFF00CEC9);
    } else if (id.contains('machine')) {
      return const Color(0xFF10B981);
    } else if (id.contains('ai') || id.contains('deep')) {
      return const Color(0xFF8B5CF6);
    } else if (id.contains('dbms') || id.contains('warehousing') || id.contains('database')) {
      return const Color(0xFFFF8522);
    } else if (id.contains('python') || id.contains('data_structures')) {
      return const Color(0xFF0984E3);
    } else if (id.contains('operating') || id.contains('os')) {
      return const Color(0xFFE17055);
    } else if (id.contains('network')) {
      return const Color(0xFF2980B9);
    } else if (id.contains('theory') || id.contains('computation')) {
      return const Color(0xFF9B59B6);
    } else if (id.contains('compiler')) {
      return const Color(0xFF27AE60);
    } else if (id.contains('digital') || id.contains('logic')) {
      return const Color(0xFFF39C12);
    } else if (id.contains('discrete')) {
      return const Color(0xFFE84393);
    }
    return const Color(0xFFFF8522);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final isPro = provider.isPro;

    final resolvedNotes = allSubjectNotes.map(provider.getResolvedNote).toList();
    final filteredNotes = resolvedNotes.where((note) {
      final matchesBranch = _selectedFilter == 'ALL' || note.branch == _selectedFilter;
      final q = _searchQuery.trim().toLowerCase();
      if (q.isEmpty) return matchesBranch;

      final matchesQuery = note.title.toLowerCase().contains(q) ||
          note.subtitle.toLowerCase().contains(q) ||
          note.freeSections.any((s) =>
              s.title.toLowerCase().contains(q) ||
              s.keyPoints.any((kp) => kp.toLowerCase().contains(q))) ||
          note.proSections.any((s) =>
              s.title.toLowerCase().contains(q) ||
              s.examTraps.any((t) => t.toLowerCase().contains(q)));

      return matchesBranch && matchesQuery;
    }).toList();

    return Scaffold(
      backgroundColor: context.scaffoldBackground,
      appBar: AppBar(
        title: Text(
          'Notes',
          style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: context.textColor),
        ),
        elevation: 0,
        backgroundColor: context.scaffoldBackground,
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
                onPressed: () => Navigator.pop(context),
              )
            : null,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 100.0),
            physics: const BouncingScrollPhysics(),
            children: [
              // 1. SEARCH BAR
              NeuContainer(
                isRecessed: true,
                borderRadius: 14,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                child: TextField(
                  controller: _searchController,
                  style: GoogleFonts.outfit(fontSize: 13.5, color: context.textColor),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search topics, formulas, traps (e.g. SVD, Bayes, B+ Tree)...',
                    hintStyle: TextStyle(color: context.textSecondaryColor, fontSize: 12),
                    icon: Icon(Icons.search_rounded, color: context.textSecondaryColor, size: 20),
                    suffixIcon: _searchQuery.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear_rounded, size: 18),
                            onPressed: () {
                              setState(() {
                                _searchController.clear();
                                _searchQuery = '';
                              });
                            },
                          )
                        : null,
                  ),
                  onChanged: (val) {
                    setState(() {
                      _searchQuery = val;
                    });
                  },
                ),
              ),
              const SizedBox(height: 12),

              // 2. STREAM FILTER CHIPS
              Row(
                children: [
                  _buildFilterChip('ALL', 'All Subjects'),
                  const SizedBox(width: 8),
                  _buildFilterChip('DA', 'GATE DA'),
                  const SizedBox(width: 8),
                  _buildFilterChip('CSIT', 'GATE CS/IT'),
                ],
              ),
              const SizedBox(height: 14),

              // 4. NOTES LIST
              if (filteredNotes.isEmpty)
                Container(
                  padding: const EdgeInsets.all(32),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Icon(Icons.search_off_rounded, size: 40, color: context.textSecondaryColor),
                      const SizedBox(height: 8),
                      Text(
                        'No matching notes found',
                        style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.bold, color: context.textColor),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Try searching for another formula, theorem or subject name.',
                        style: TextStyle(fontSize: 12, color: context.textSecondaryColor),
                      ),
                    ],
                  ),
                )
              else
                ...filteredNotes.map((note) => _buildNoteCard(context, note, isPro)),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChip(String key, String label) {
    final isSelected = _selectedFilter == key;
    return InkWell(
      onTap: () {
        HapticFeedback.selectionClick();
        setState(() {
          _selectedFilter = key;
        });
      },
      borderRadius: BorderRadius.circular(10),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFFF8522)
              : (context.isDarkMode ? Colors.white.withValues(alpha: 0.05) : Colors.black.withValues(alpha: 0.04)),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected
                ? const Color(0xFFFF8522)
                : (context.isDarkMode ? Colors.white.withValues(alpha: 0.08) : Colors.black.withValues(alpha: 0.08)),
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.outfit(
            fontSize: 11.5,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : context.textSecondaryColor,
          ),
        ),
      ),
    );
  }

  Widget _buildNoteCard(BuildContext context, SubjectNote note, bool isPro) {
    final color = _getSubjectColor(note.id);
    final icon = _getSubjectIcon(note.iconKey);

    return NeuContainer(
      margin: const EdgeInsets.only(bottom: 12),
      borderRadius: 18,
      padding: const EdgeInsets.all(16),
      child: InkWell(
        onTap: () {
          HapticFeedback.selectionClick();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => NoteDetailScreen(note: note),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NeuIconTile(
                  icon: icon,
                  iconColor: color,
                  size: 42,
                  iconSize: 20,
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
                              note.title,
                              style: GoogleFonts.outfit(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: context.textColor,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: color.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              note.branch == 'CSIT' ? 'GATE CS/IT' : 'GATE DA',
                              style: TextStyle(
                                fontSize: 9.5,
                                fontWeight: FontWeight.bold,
                                color: color,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 3),
                      Text(
                        note.subtitle,
                        style: TextStyle(
                          fontSize: 11.5,
                          color: context.textSecondaryColor,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Divider(height: 1, color: context.colorBorder),
            const SizedBox(height: 10),
            Row(
              children: [
                if (isPro)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3.5),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF8522).withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: const Color(0xFFFF8522).withValues(alpha: 0.4),
                        width: 0.8,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.workspace_premium_rounded, size: 12, color: Color(0xFFFF8522)),
                        SizedBox(width: 4),
                        Text(
                          'Pro Notes',
                          style: TextStyle(
                            color: Color(0xFFFF8522),
                            fontSize: 10.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3.5),
                    decoration: BoxDecoration(
                      color: context.isDarkMode
                          ? Colors.white.withValues(alpha: 0.08)
                          : Colors.black.withValues(alpha: 0.06),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.menu_book_rounded, size: 12, color: context.textSecondaryColor),
                        const SizedBox(width: 4),
                        Text(
                          'Free Notes',
                          style: TextStyle(
                            color: context.textSecondaryColor,
                            fontSize: 10.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                const Spacer(),
                Text(
                  'Read Notes',
                  style: GoogleFonts.outfit(
                    fontSize: 11.5,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFFF8522),
                  ),
                ),
                const SizedBox(width: 2),
                const Icon(Icons.arrow_forward_ios_rounded, size: 11, color: Color(0xFFFF8522)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NoteDetailScreen extends StatefulWidget {
  final SubjectNote note;
  const NoteDetailScreen({super.key, required this.note});

  @override
  State<NoteDetailScreen> createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isExporting = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _handlePdfExport(BuildContext context, AppProvider provider) async {
    HapticFeedback.selectionClick();
    final messenger = ScaffoldMessenger.of(context);
    final isPro = provider.isProForBranch(widget.note.branch);

    if (!isPro) {
      final shouldProceed = await AdService().promptWatchRewardedAd(
        context: context,
        perkTitle: 'Export Printable Study PDF (Pro)',
        perkDescription:
            'Full-color, printable PDFs with step-by-step derivations and GATE traps are included in GateX Pro Pass (₹299 one-time - Valid till 31st March 2027). Alternatively, watch a short 20s ad to export this subject\'s PDF for free!',
      );
      if (!shouldProceed) return;
    }

    if (!mounted) return;

    setState(() {
      _isExporting = true;
    });

    final success = await PdfGeneratorService().generateAndSharePdf(
      note: widget.note,
      isProUser: isPro,
    );

    if (mounted) {
      setState(() {
        _isExporting = false;
      });
      if (!success) {
        messenger.showSnackBar(
          const SnackBar(
            content: Text('Failed to generate PDF. Please try again.'),
            backgroundColor: AppTheme.error,
          ),
        );
      }
    }
  }

  String _formatMathSymbols(String input) {
    return input
        .replaceAll('^2', '²')
        .replaceAll('^3', '³')
        .replaceAll('^n', 'ⁿ')
        .replaceAll('^T', 'ᵀ')
        .replaceAll('^c', 'ᶜ')
        .replaceAll('!=', ' ≠ ')
        .replaceAll('~=', ' ≈ ')
        .replaceAll('<=', ' ≤ ')
        .replaceAll('>=', ' ≥ ')
        .replaceAll('->', ' → ')
        .replaceAll('=>', ' ⇒ ')
        .replaceAll('lambda', 'λ')
        .replaceAll('sigma', 'σ')
        .replaceAll('mu', 'μ')
        .replaceAll('alpha', 'α')
        .replaceAll('beta', 'β')
        .replaceAll('theta', 'θ')
        .replaceAll('epsilon', 'ε');
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final isPro = provider.isProForBranch(widget.note.branch);

    return Scaffold(
      backgroundColor: context.scaffoldBackground,
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: context.scaffoldBackground,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.note.title,
              style: GoogleFonts.outfit(
                fontSize: 15.5,
                fontWeight: FontWeight.bold,
                color: context.textColor,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 1),
            Text(
              '${widget.note.branch.toUpperCase()} Quick Revision Dossier',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 10.5,
                fontWeight: FontWeight.w600,
                color: context.textSecondaryColor,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: _isExporting
                ? const SizedBox(
                    width: 32,
                    height: 32,
                    child: Center(
                      child: SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFFFF8522)),
                      ),
                    ),
                  )
                : Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => _handlePdfExport(context, provider),
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF8522).withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color(0xFFFF8522).withValues(alpha: 0.35),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.picture_as_pdf_rounded, size: 16, color: Color(0xFFFF8522)),
                            const SizedBox(width: 4),
                            Text(
                              'PDF',
                              style: GoogleFonts.outfit(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: const Color(0xFFFF8522),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(52),
          child: Container(
            width: double.infinity,
            color: context.scaffoldBackground,
            padding: const EdgeInsets.fromLTRB(16, 2, 16, 8),
            decoration: BoxDecoration(
              color: context.scaffoldBackground,
              border: Border(
                bottom: BorderSide(
                  color: context.isDarkMode
                      ? Colors.white.withValues(alpha: 0.08)
                      : Colors.black.withValues(alpha: 0.08),
                  width: 1,
                ),
              ),
            ),
            child: Container(
              height: 42,
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: context.isDarkMode
                    ? Colors.white.withValues(alpha: 0.06)
                    : Colors.black.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  color: const Color(0xFFFF8522),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFFF8522).withValues(alpha: 0.35),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                labelColor: Colors.white,
                unselectedLabelColor: context.textSecondaryColor,
                labelStyle: GoogleFonts.outfit(fontSize: 13, fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(text: 'Free Notes'),
                  Tab(text: 'Pro Notes 👑'),
                ],
              ),
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
              _buildFreeTab(context),
              _buildProTab(context, provider, isPro),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFreeTab(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 120),
      physics: const BouncingScrollPhysics(),
      children: [
        ...widget.note.freeSections.map((sec) {
          return Container(
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: context.isDarkMode ? const Color(0xFF14131C) : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: context.isDarkMode
                    ? Colors.white.withValues(alpha: 0.08)
                    : Colors.black.withValues(alpha: 0.08),
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: context.isDarkMode ? 0.3 : 0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sec.title,
                  style: GoogleFonts.outfit(
                    fontSize: 16.5,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFFF8522),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _formatMathSymbols(sec.summary),
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    color: context.textColor,
                    height: 1.55,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    const Icon(Icons.check_circle_outline_rounded, size: 15, color: Color(0xFFFF8522)),
                    const SizedBox(width: 6),
                    Text(
                      'Key Principles & Core Rules',
                      style: GoogleFonts.outfit(
                        fontSize: 12.5,
                        fontWeight: FontWeight.bold,
                        color: context.textSecondaryColor,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ...sec.keyPoints.map((kp) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 7, right: 10),
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFF8522),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            _formatMathSymbols(kp),
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 13.5,
                              color: context.textColor,
                              height: 1.55,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                if (sec.coreFormulas.isNotEmpty) ...[
                  const SizedBox(height: 14),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: context.isDarkMode ? const Color(0xFF100F17) : const Color(0xFFF6F8FC),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: context.isDarkMode ? Colors.white.withValues(alpha: 0.08) : Colors.black.withValues(alpha: 0.07),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.functions_rounded, size: 16, color: Color(0xFFFF8522)),
                            const SizedBox(width: 6),
                            Text(
                              'Essential GATE Formulas',
                              style: GoogleFonts.outfit(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFFF8522),
                                letterSpacing: 0.4,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        ...sec.coreFormulas.map((cf) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: context.isDarkMode ? Colors.black.withValues(alpha: 0.35) : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: context.isDarkMode ? Colors.white10 : Colors.black12,
                                width: 0.8,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: SelectableText(
                                    _formatMathSymbols(cf),
                                    style: GoogleFonts.jetBrainsMono(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: context.textColor,
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.copy_rounded, size: 15),
                                  color: context.textSecondaryColor,
                                  visualDensity: VisualDensity.compact,
                                  tooltip: 'Copy formula',
                                  onPressed: () {
                                    HapticFeedback.selectionClick();
                                    Clipboard.setData(ClipboardData(text: cf));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Formula copied to clipboard!'),
                                        duration: Duration(seconds: 1),
                                        behavior: SnackBarBehavior.floating,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildProTab(BuildContext context, AppProvider provider, bool isPro) {
    if (!isPro) {
      return Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: const Color(0xFFFFB300).withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: const Color(0xFFFFB300).withValues(alpha: 0.3), width: 1.2),
              ),
              child: const Icon(Icons.workspace_premium_rounded, size: 38, color: Color(0xFFF59E0B)),
            ),
            const SizedBox(height: 18),
            Text(
              'Unlock Pro Notes & PDF Export',
              style: GoogleFonts.outfit(fontSize: 19, fontWeight: FontWeight.bold, color: context.textColor),
            ),
            const SizedBox(height: 8),
            Text(
              'Pro notes include in-depth theory proofs, critical GATE exam traps, solved numerical benchmarks, and printable PDF export.',
              textAlign: TextAlign.center,
              style: GoogleFonts.plusJakartaSans(fontSize: 13.5, color: context.textSecondaryColor, height: 1.5),
            ),
            const SizedBox(height: 24),
            NeuButton(
              isPrimary: true,
              gradient: AppTheme.flameGradient,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ProUpgradeScreen()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.bolt_rounded, color: Colors.white, size: 18),
                  const SizedBox(width: 8),
                  Text(
                    provider.isPro ? 'Upgrade to Dual Prep Pass (₹200)' : 'Get GateX Pro Pass (₹299)',
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            TextButton.icon(
              onPressed: () async {
                final success = await AdService().promptWatchRewardedAd(
                  context: context,
                  perkTitle: '${widget.note.title} (Pro Notes)',
                  perkDescription:
                      "Watch a quick 20s sponsored ad to unlock this subject's full Pro notes and PDF export for free!",
                );
                if (success && mounted) {
                  setState(() {
                    // Temporarily unlocked
                  });
                }
              },
              icon: const Icon3D(Icons.play_circle_outline_rounded, size: 18, color: Color(0xFFFF8522)),
              label: const Text(
                'Watch 20s Ad to Unlock for Free 🎁',
                style: TextStyle(color: Color(0xFFFF8522), fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ),
          ],
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 120),
      physics: const BouncingScrollPhysics(),
      children: [
        ...widget.note.proSections.asMap().entries.map((entry) {
          final index = entry.key;
          final proSec = entry.value;

          return Container(
            margin: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              color: context.isDarkMode ? const Color(0xFF14131C) : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: context.isDarkMode
                    ? Colors.white.withValues(alpha: 0.08)
                    : Colors.black.withValues(alpha: 0.08),
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: context.isDarkMode ? 0.3 : 0.04),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Pro Header with Glowing Badge
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFF8522), Color(0xFFFF5722)],
                        ),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFFF8522).withValues(alpha: 0.3),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.workspace_premium_rounded, size: 13, color: Colors.white),
                          const SizedBox(width: 4),
                          Text(
                            'PRO MODULE ${index + 1}',
                            style: GoogleFonts.outfit(
                              fontSize: 10.5,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              letterSpacing: 0.7,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        proSec.title,
                        style: GoogleFonts.outfit(
                          fontSize: 16.5,
                          fontWeight: FontWeight.bold,
                          color: context.textColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Divider(height: 1, color: context.colorBorder.withValues(alpha: 0.6)),
                const SizedBox(height: 16),

                // 2. In-Depth Theory & Mathematical Proofs
                _buildInDepthTheoryCard(context, proSec.inDepthTheory),

                // 3. Common Exam Traps
                if (proSec.examTraps.isNotEmpty) ...[
                  const SizedBox(height: 20),
                  _buildExamTrapsCard(context, proSec.examTraps),
                ],

                // 4. Solved Benchmark Numerical
                if (proSec.solvedExample.trim().isNotEmpty) ...[
                  const SizedBox(height: 20),
                  _buildSolvedExampleCard(context, proSec.solvedExample),
                ],

                // 5. AIR-1 Topper Speed Shortcuts
                if (proSec.shortcutTips.isNotEmpty) ...[
                  const SizedBox(height: 20),
                  _buildShortcutTipsCard(context, proSec.shortcutTips),
                ],
              ],
            ),
          );
        }),
      ],
    );
  }

  /// High-readability In-Depth Theory renderer with formula chips, alerts & clean typography
  Widget _buildInDepthTheoryCard(BuildContext context, String rawTheory) {
    final cleaned = rawTheory.trim();
    final paragraphs = cleaned.split(RegExp(r'\n\s*\n'));

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.isDarkMode ? const Color(0xFF161520) : const Color(0xFFF8F9FD),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: context.isDarkMode ? Colors.white.withValues(alpha: 0.08) : Colors.black.withValues(alpha: 0.06),
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF8522).withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.auto_stories_rounded, size: 16, color: Color(0xFFFF8522)),
              ),
              const SizedBox(width: 10),
              Text(
                'Deep Theory & Mathematical Proofs',
                style: GoogleFonts.outfit(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: context.textColor,
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ...paragraphs.map((para) {
            final trimmedPara = para.trim();
            final lines = trimmedPara.split('\n');

            // Detect if this paragraph is a trap alert or key rule
            final isTrapAlert = trimmedPara.toLowerCase().contains('traps students') ||
                trimmedPara.toLowerCase().contains('crucial distinction:');

            if (isTrapAlert) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFB300).withValues(alpha: context.isDarkMode ? 0.12 : 0.08),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFFFFB300).withValues(alpha: 0.35),
                    width: 1,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: Icon(Icons.lightbulb_rounded, size: 17, color: Color(0xFFFFB300)),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        _formatMathSymbols(trimmedPara),
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 13.5,
                          height: 1.6,
                          color: context.textColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: lines.map((line) {
                  final trimmed = line.trim();
                  if (trimmed.isEmpty) return const SizedBox.shrink();

                  // Numbered list item
                  final isNumbered = RegExp(r'^\d+\.\s').hasMatch(trimmed);
                  if (isNumbered) {
                    final dotIndex = trimmed.indexOf('.');
                    final numStr = trimmed.substring(0, dotIndex);
                    final rest = trimmed.substring(dotIndex + 1).trim();

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 2, right: 10),
                            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFF8522).withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: const Color(0xFFFF8522).withValues(alpha: 0.35),
                                width: 0.8,
                              ),
                            ),
                            child: Text(
                              numStr,
                              style: GoogleFonts.outfit(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFFF8522),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              _formatMathSymbols(rest),
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 13.5,
                                height: 1.62,
                                color: context.textColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  // Formula line (e.g. Var(Y) = E[Var(Y|X)] + Var(E[Y|X]))
                  final isFormulaLine = trimmed.length < 90 &&
                      (trimmed.contains('=') || trimmed.contains('~')) &&
                      (trimmed.contains('Var(') || trimmed.contains('E[') || trimmed.contains('P('));

                  if (isFormulaLine) {
                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        color: context.isDarkMode ? const Color(0xFF0F0E17) : const Color(0xFFF1F3FA),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(0xFFFF8522).withValues(alpha: 0.3),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: SelectableText(
                              _formatMathSymbols(trimmed),
                              style: GoogleFonts.jetBrainsMono(
                                fontSize: 13.5,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFFF8522),
                                height: 1.4,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.copy_rounded, size: 15),
                            color: context.textSecondaryColor,
                            visualDensity: VisualDensity.compact,
                            tooltip: 'Copy formula',
                            onPressed: () {
                              HapticFeedback.selectionClick();
                              Clipboard.setData(ClipboardData(text: trimmed));
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Formula copied!'),
                                  duration: Duration(seconds: 1),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  }

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      _formatMathSymbols(trimmed),
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        height: 1.62,
                        color: context.textColor,
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          }),
        ],
      ),
    );
  }

  /// High-contrast Exam Traps cards with full-width reading and math formatting
  Widget _buildExamTrapsCard(BuildContext context, List<String> traps) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.isDarkMode ? const Color(0xFF1B1417) : const Color(0xFFFFF7F7),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.accentCoral.withValues(alpha: 0.35),
          width: 1.2,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppTheme.accentCoral.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.warning_amber_rounded, size: 17, color: AppTheme.accentCoral),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'COMMON GATE EXAM TRAPS TO AVOID',
                      style: GoogleFonts.outfit(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w800,
                        color: AppTheme.accentCoral,
                        letterSpacing: 0.6,
                      ),
                    ),
                    Text(
                      'Common misconceptions where students lose marks',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 11,
                        color: context.textSecondaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ...traps.asMap().entries.map((entry) {
            final idx = entry.key;
            String trapContent = entry.value.trim();
            if (trapContent.startsWith('TRAP:')) {
              trapContent = trapContent.replaceFirst('TRAP:', '').trim();
            }

            // Split into misconception headline and explanation/counterexample
            String headline = trapContent;
            String details = '';

            if (trapContent.contains('Counterexample:')) {
              final cIndex = trapContent.indexOf('Counterexample:');
              headline = trapContent.substring(0, cIndex).trim();
              details = trapContent.substring(cIndex).trim();
            } else {
              // Split at first sentence
              final match = RegExp(r'^(.*?[.!?])\s+(.*)$').firstMatch(trapContent);
              if (match != null) {
                headline = match.group(1) ?? trapContent;
                details = match.group(2) ?? '';
              }
            }

            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: context.isDarkMode ? const Color(0xFF130E11) : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppTheme.accentCoral.withValues(alpha: 0.22),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                        decoration: BoxDecoration(
                          color: AppTheme.accentCoral.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: AppTheme.accentCoral.withValues(alpha: 0.4),
                            width: 0.8,
                          ),
                        ),
                        child: Text(
                          'TRAP ${idx + 1}',
                          style: GoogleFonts.outfit(
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            color: AppTheme.accentCoral,
                            letterSpacing: 0.4,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          _formatMathSymbols(headline),
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 13.5,
                            fontWeight: FontWeight.w700,
                            color: context.textColor,
                            height: 1.45,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (details.isNotEmpty) ...[
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: context.isDarkMode ? const Color(0xFF0C080A) : const Color(0xFFF9F6F7),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: context.isDarkMode ? Colors.white12 : Colors.black12,
                          width: 0.8,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.psychology_alt_rounded, size: 14, color: Color(0xFFFFB300)),
                              const SizedBox(width: 5),
                              Text(
                                details.startsWith('Counterexample:') ? 'Counterexample / Proof' : 'Detailed Analysis',
                                style: GoogleFonts.outfit(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFFFFB300),
                                  letterSpacing: 0.4,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          SelectableText(
                            _formatMathSymbols(details.replaceFirst('Counterexample:', '').trim()),
                            style: GoogleFonts.jetBrainsMono(
                              fontSize: 12.5,
                              color: context.textColor,
                              height: 1.55,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  /// Structural Solved Example parser & renderer (Problem, Steps, Final Answer)
  Widget _buildSolvedExampleCard(BuildContext context, String exampleText) {
    final cleaned = exampleText.trim();
    String? problem;
    String? solution;
    String? answer;

    if (cleaned.contains('[Problem]') && cleaned.contains('[Step-by-Step Solution]')) {
      final pIndex = cleaned.indexOf('[Problem]');
      final sIndex = cleaned.indexOf('[Step-by-Step Solution]');
      final aIndex = cleaned.indexOf('[Final Answer]');

      problem = cleaned.substring(pIndex + '[Problem]'.length, sIndex).trim();
      if (aIndex != -1) {
        solution = cleaned.substring(sIndex + '[Step-by-Step Solution]'.length, aIndex).trim();
        answer = cleaned.substring(aIndex + '[Final Answer]'.length).trim();
      } else {
        solution = cleaned.substring(sIndex + '[Step-by-Step Solution]'.length).trim();
      }
    }

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.accentMint.withValues(alpha: context.isDarkMode ? 0.08 : 0.06),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.accentMint.withValues(alpha: 0.35),
          width: 1.2,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppTheme.accentMint.withValues(alpha: 0.18),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check_circle_outline_rounded, size: 17, color: AppTheme.accentMint),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SOLVED BENCHMARK NUMERICAL',
                      style: GoogleFonts.outfit(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w800,
                        color: AppTheme.accentMint,
                        letterSpacing: 0.6,
                      ),
                    ),
                    Text(
                      'High-probability numerical model with step derivation',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 11,
                        color: context.textSecondaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          if (problem != null) ...[
            // Problem Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: context.isDarkMode ? const Color(0xFF131D1B) : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppTheme.accentMint.withValues(alpha: 0.25),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                        decoration: BoxDecoration(
                          color: AppTheme.accentMint.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          'PROBLEM STATEMENT',
                          style: GoogleFonts.outfit(
                            fontSize: 9.5,
                            fontWeight: FontWeight.w800,
                            color: AppTheme.accentMint,
                            letterSpacing: 0.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _formatMathSymbols(problem),
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: context.textColor,
                      height: 1.55,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Solution Steps
            if (solution != null) ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: context.isDarkMode ? const Color(0xFF0F1715) : const Color(0xFFF6FAF8),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppTheme.accentMint.withValues(alpha: 0.2),
                    width: 0.8,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'STEP-BY-STEP DERIVATION',
                      style: GoogleFonts.outfit(
                        fontSize: 10.5,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.accentMint,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SelectableText(
                      _formatMathSymbols(solution),
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 12.5,
                        color: context.textColor,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
            ],

            // Final Answer
            if (answer != null) ...[
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(
                  color: AppTheme.accentMint.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppTheme.accentMint.withValues(alpha: 0.6),
                    width: 1.2,
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.task_alt_rounded, size: 20, color: AppTheme.accentMint),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        _formatMathSymbols(answer),
                        style: GoogleFonts.outfit(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.accentMint,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.copy_rounded, size: 16),
                      color: AppTheme.accentMint,
                      tooltip: 'Copy answer',
                      visualDensity: VisualDensity.compact,
                      onPressed: () {
                        HapticFeedback.selectionClick();
                        Clipboard.setData(ClipboardData(text: answer!));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Answer copied to clipboard!'),
                            duration: Duration(seconds: 1),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ] else ...[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: context.isDarkMode ? Colors.black.withValues(alpha: 0.35) : Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: SelectableText(
                _formatMathSymbols(cleaned),
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 12.5,
                  color: context.textColor,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  /// High-impact Topper Speed Shortcut cards
  Widget _buildShortcutTipsCard(BuildContext context, List<String> shortcuts) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFFF8522).withValues(alpha: context.isDarkMode ? 0.08 : 0.06),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFFF8522).withValues(alpha: 0.35),
          width: 1.2,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF8522).withValues(alpha: 0.18),
                  shape: BoxShape.circle,
                ),
                child: const Icon3D(Icons.bolt_rounded, size: 17, color: Color(0xFFFF8522)),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'AIR-1 TOPPER SPEED SHORTCUT TRICKS',
                      style: GoogleFonts.outfit(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFFFF8522),
                        letterSpacing: 0.6,
                      ),
                    ),
                    Text(
                      'High-speed exam tricks to solve NAT questions in seconds',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 11,
                        color: context.textSecondaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ...shortcuts.asMap().entries.map((entry) {
            final idx = entry.key;
            final tip = entry.value;

            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: context.isDarkMode ? const Color(0xFF1B140E) : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFFFF8522).withValues(alpha: 0.22),
                  width: 1,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF8522).withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      '⚡ #${idx + 1}',
                      style: GoogleFonts.outfit(
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFFFF8522),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      _formatMathSymbols(tip),
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 13.5,
                        color: context.textColor,
                        height: 1.55,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
