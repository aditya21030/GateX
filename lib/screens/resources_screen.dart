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

    final filteredNotes = allSubjectNotes.where((note) {
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
                    child: const Row(
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
    final isPro = provider.isPro;

    if (!isPro) {
      final shouldProceed = await AdService().promptWatchRewardedAd(
        context: context,
        perkTitle: 'Export Printable Study PDF (Pro)',
        perkDescription:
            'Full-color, printable PDFs with step-by-step derivations and GATE traps are included in GateX Pro Pass (₹199 one-time). Alternatively, watch a short 20s ad to export this subject\'s PDF for free!',
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

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final isPro = provider.isPro;

    return Scaffold(
      backgroundColor: context.scaffoldBackground,
      appBar: AppBar(
        title: Text(
          widget.note.title,
          style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.bold, color: context.textColor),
        ),
        elevation: 0,
        backgroundColor: context.scaffoldBackground,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: _isExporting
                ? const Center(
                    child: SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFFFF8522)),
                    ),
                  )
                : TextButton.icon(
                    onPressed: () => _handlePdfExport(context, provider),
                    icon: const Icon(Icons.picture_as_pdf_rounded, size: 18, color: Color(0xFFFF8522)),
                    label: Text(
                      'Export PDF',
                      style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 12.5, color: const Color(0xFFFF8522)),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFFF8522).withValues(alpha: 0.12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    ),
                  ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: context.isDarkMode ? Colors.white.withValues(alpha: 0.05) : Colors.black.withValues(alpha: 0.04),
              borderRadius: BorderRadius.circular(14),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: const Color(0xFFFF8522),
                borderRadius: BorderRadius.circular(12),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              labelColor: Colors.white,
              unselectedLabelColor: context.textSecondaryColor,
              labelStyle: GoogleFonts.outfit(fontSize: 12.5, fontWeight: FontWeight.bold),
              tabs: const [
                Tab(text: 'Free Notes'),
                Tab(text: 'Pro Notes 👑'),
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
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
      physics: const BouncingScrollPhysics(),
      children: [
        ...widget.note.freeSections.map((sec) {
          return NeuContainer(
            margin: const EdgeInsets.only(bottom: 16),
            borderRadius: 18,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sec.title,
                  style: GoogleFonts.outfit(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFFF8522),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  sec.summary,
                  style: TextStyle(fontSize: 12.5, color: context.textColor, height: 1.4),
                ),
                const SizedBox(height: 12),
                Text(
                  'Key Principles & Rules:',
                  style: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.bold, color: context.textSecondaryColor),
                ),
                const SizedBox(height: 6),
                ...sec.keyPoints.map((kp) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('• ', style: TextStyle(color: Color(0xFFFF8522), fontWeight: FontWeight.bold)),
                        Expanded(
                          child: Text(
                            kp,
                            style: TextStyle(fontSize: 12, color: context.textColor, height: 1.35),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                if (sec.coreFormulas.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: context.isDarkMode ? Colors.black.withValues(alpha: 0.25) : const Color(0xFFF7F8FC),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: context.isDarkMode ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.06),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.functions_rounded, size: 14, color: Color(0xFFFF8522)),
                            const SizedBox(width: 6),
                            Text(
                              'Essential Formulas:',
                              style: GoogleFonts.outfit(fontSize: 11, fontWeight: FontWeight.bold, color: const Color(0xFFFF8522)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        ...sec.coreFormulas.map((cf) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    cf,
                                    style: GoogleFonts.spaceMono(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: context.textColor,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.copy_rounded, size: 14),
                                  color: context.textSecondaryColor,
                                  visualDensity: VisualDensity.compact,
                                  onPressed: () {
                                    Clipboard.setData(ClipboardData(text: cf));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Formula copied to clipboard!'),
                                        duration: Duration(seconds: 1),
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
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: const Color(0xFFFFB300).withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Icon(Icons.workspace_premium_rounded, size: 36, color: Color(0xFFF59E0B)),
            ),
            const SizedBox(height: 16),
            Text(
              'Unlock Pro Notes & PDF',
              style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: context.textColor),
            ),
            const SizedBox(height: 6),
            Text(
              'Pro notes include step-by-step mathematical proofs, critical GATE exam trick traps, solved numerical benchmarks, and printable PDF export.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12.5, color: context.textSecondaryColor, height: 1.4),
            ),
            const SizedBox(height: 22),
            NeuButton(
              isPrimary: true,
              gradient: AppTheme.flameGradient,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ProUpgradeScreen()));
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.bolt_rounded, color: Colors.white, size: 18),
                  SizedBox(width: 8),
                  Text(
                    'Get GateX Pro Pass (₹199)',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13.5),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            TextButton.icon(
              onPressed: () async {
                final success = await AdService().promptWatchRewardedAd(
                  context: context,
                  perkTitle: '${widget.note.title} (Pro Notes)',
                  perkDescription: 'Watch a quick 20s sponsored ad to unlock this subject\'s full Pro notes and PDF export for free!',
                );
                if (success && mounted) {
                  setState(() {
                    // Temporarily unlocked
                  });
                }
              },
              icon: const Icon(Icons.play_circle_outline_rounded, size: 18, color: Color(0xFFFF8522)),
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
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 100),
      physics: const BouncingScrollPhysics(),
      children: [
        ...widget.note.proSections.asMap().entries.map((entry) {
          final index = entry.key;
          final proSec = entry.value;

          return NeuContainer(
            margin: const EdgeInsets.only(bottom: 20),
            borderRadius: 18,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Pro Header with Badge
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3.5),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF8522).withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: const Color(0xFFFF8522).withValues(alpha: 0.4), width: 0.8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.workspace_premium_rounded, size: 12, color: Color(0xFFFF8522)),
                          const SizedBox(width: 4),
                          Text(
                            'PRO SECTION ${index + 1}',
                            style: const TextStyle(
                              fontSize: 9.5,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFF8522),
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        proSec.title,
                        style: GoogleFonts.outfit(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: context.textColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Divider(height: 1, color: context.colorBorder),
                const SizedBox(height: 12),

                // 2. In-Depth Theory & Mathematical Proofs
                Row(
                  children: [
                    const Icon(Icons.auto_stories_rounded, size: 15, color: Color(0xFFFF8522)),
                    const SizedBox(width: 6),
                    Text(
                      'Deep Theory & Proof Intuition',
                      style: GoogleFonts.outfit(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: context.textSecondaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: context.isDarkMode ? Colors.white.withValues(alpha: 0.03) : Colors.black.withValues(alpha: 0.02),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: context.colorBorder),
                  ),
                  child: Text(
                    proSec.inDepthTheory.trim(),
                    style: TextStyle(
                      fontSize: 12.5,
                      color: context.textColor,
                      height: 1.45,
                    ),
                  ),
                ),

                // 3. Exam Traps Box
                if (proSec.examTraps.isNotEmpty) ...[
                  const SizedBox(height: 14),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppTheme.accentCoral.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppTheme.accentCoral.withValues(alpha: 0.3)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.warning_amber_rounded, size: 16, color: AppTheme.accentCoral),
                            SizedBox(width: 6),
                            Text(
                              'COMMON GATE TRAPS TO AVOID',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.accentCoral,
                                letterSpacing: 0.6,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        ...proSec.examTraps.map((trap) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('⚠️ ', style: TextStyle(fontSize: 11)),
                                Expanded(
                                  child: Text(
                                    trap,
                                    style: TextStyle(fontSize: 12, color: context.textColor, height: 1.35),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ],

                // 4. Solved Benchmark Numerical Card
                if (proSec.solvedExample.trim().isNotEmpty) ...[
                  const SizedBox(height: 14),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppTheme.accentMint.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppTheme.accentMint.withValues(alpha: 0.3)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.check_circle_outline_rounded, size: 16, color: AppTheme.accentMint),
                            SizedBox(width: 6),
                            Text(
                              'SOLVED BENCHMARK NUMERICAL',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.accentMint,
                                letterSpacing: 0.6,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: context.isDarkMode ? Colors.black.withValues(alpha: 0.3) : Colors.white.withValues(alpha: 0.7),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            proSec.solvedExample.trim(),
                            style: GoogleFonts.spaceMono(
                              fontSize: 11.5,
                              color: context.textColor,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],

                // 5. AIR-1 Topper Speed Shortcuts
                if (proSec.shortcutTips.isNotEmpty) ...[
                  const SizedBox(height: 14),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF8522).withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFFF8522).withValues(alpha: 0.3)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.bolt_rounded, size: 16, color: Color(0xFFFF8522)),
                            SizedBox(width: 6),
                            Text(
                              'AIR-1 TOPPER SPEED SHORTCUT TRICKS',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFF8522),
                                letterSpacing: 0.6,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        ...proSec.shortcutTips.map((tip) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('⚡ ', style: TextStyle(fontSize: 11)),
                                Expanded(
                                  child: Text(
                                    tip,
                                    style: TextStyle(fontSize: 12, color: context.textColor, height: 1.35),
                                  ),
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
        const SizedBox(height: 24),
      ],
    );
  }
}
