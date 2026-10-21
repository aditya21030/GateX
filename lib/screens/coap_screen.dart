import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/neu_widgets.dart';

class COAPScreen extends StatefulWidget {
  final double? initialGateScore;
  const COAPScreen({super.key, this.initialGateScore});

  @override
  State<COAPScreen> createState() => _COAPScreenState();
}

class _COAPScreenState extends State<COAPScreen> {
  String _selectedCategory = 'General';
  String _processFilter = 'All'; // 'All', 'Direct Offers', 'Interview / Test'
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  final List<String> _categories = ['General', 'OBC-NCL', 'EWS', 'SC', 'ST'];
  final List<String> _processes = ['All Processes', 'Direct Offers Only', 'Interview / Test'];

  final List<Map<String, dynamic>> _daCutoffs = [
    {
      'institute': 'IISc Bangalore',
      'program': 'M.Tech Artificial Intelligence',
      'genRank': 100,
      'genScore': 800,
      'ctc': '₹32 LPA',
      'process': 'Written Test + Interview',
      'color': Colors.blue,
    },
    {
      'institute': 'IIT Bombay',
      'program': 'M.Tech Data Science (C-MinDS)',
      'genRank': 150,
      'genScore': 750,
      'ctc': '₹28 LPA',
      'process': 'Direct COAP Offer',
      'color': Colors.amber,
    },
    {
      'institute': 'IIT Madras',
      'program': 'M.Tech Data Science & AI',
      'genRank': 200,
      'genScore': 720,
      'ctc': '₹26 LPA',
      'process': 'Direct COAP Offer',
      'color': AppTheme.success,
    },
    {
      'institute': 'IIT Delhi',
      'program': 'M.Tech MINDS',
      'genRank': 250,
      'genScore': 700,
      'ctc': '₹27 LPA',
      'process': 'Online Interview',
      'color': Colors.orange,
    },
    {
      'institute': 'IIT Kanpur',
      'program': 'M.Tech Artificial Intelligence',
      'genRank': 300,
      'genScore': 680,
      'ctc': '₹25 LPA',
      'process': 'Coding Test + Interview',
      'color': Colors.teal,
    },
    {
      'institute': 'IIT Kharagpur',
      'program': 'M.Tech Artificial Intelligence',
      'genRank': 350,
      'genScore': 650,
      'ctc': '₹23 LPA',
      'process': 'Direct COAP Offer',
      'color': Colors.cyan,
    },
    {
      'institute': 'IIT Roorkee',
      'program': 'M.Tech DS & AI',
      'genRank': 400,
      'genScore': 640,
      'ctc': '₹22 LPA',
      'process': 'Direct COAP Offer',
      'color': Colors.purple,
    },
    {
      'institute': 'IIT Guwahati',
      'program': 'M.Tech Data Science',
      'genRank': 450,
      'genScore': 620,
      'ctc': '₹21 LPA',
      'process': 'Direct COAP Offer',
      'color': Colors.indigo,
    },
    {
      'institute': 'IIT Hyderabad',
      'program': 'M.Tech Artificial Intelligence',
      'genRank': 500,
      'genScore': 600,
      'ctc': '₹24 LPA',
      'process': 'Coding Test + Interview',
      'color': Colors.pink,
    },
  ];

  final List<Map<String, dynamic>> _csitCutoffs = [
    {
      'institute': 'IISc Bangalore',
      'program': 'M.Tech CSA (Computer Science)',
      'genRank': 50,
      'genScore': 850,
      'ctc': '₹35 LPA',
      'process': 'Direct / Interview',
      'color': Colors.blue,
    },
    {
      'institute': 'IIT Bombay',
      'program': 'M.Tech Computer Science & Engg',
      'genRank': 70,
      'genScore': 800,
      'ctc': '₹30 LPA',
      'process': 'Direct COAP Offer',
      'color': Colors.amber,
    },
    {
      'institute': 'IIT Madras',
      'program': 'M.Tech Computer Science',
      'genRank': 120,
      'genScore': 780,
      'ctc': '₹28 LPA',
      'process': 'Direct COAP Offer',
      'color': AppTheme.success,
    },
    {
      'institute': 'IIT Delhi',
      'program': 'M.Tech CSE',
      'genRank': 150,
      'genScore': 760,
      'ctc': '₹29 LPA',
      'process': 'Direct COAP Offer',
      'color': Colors.orange,
    },
    {
      'institute': 'IIT Kanpur',
      'program': 'M.Tech CSE',
      'genRank': 180,
      'genScore': 740,
      'ctc': '₹27 LPA',
      'process': 'Direct COAP Offer',
      'color': Colors.teal,
    },
    {
      'institute': 'IIT Kharagpur',
      'program': 'M.Tech CSE',
      'genRank': 220,
      'genScore': 720,
      'ctc': '₹25 LPA',
      'process': 'Direct COAP Offer',
      'color': Colors.cyan,
    },
    {
      'institute': 'IIT Roorkee',
      'program': 'M.Tech CSE',
      'genRank': 280,
      'genScore': 700,
      'ctc': '₹24 LPA',
      'process': 'Direct COAP Offer',
      'color': Colors.purple,
    },
    {
      'institute': 'IIT Guwahati',
      'program': 'M.Tech CSE',
      'genRank': 350,
      'genScore': 670,
      'ctc': '₹23 LPA',
      'process': 'Direct COAP Offer',
      'color': Colors.indigo,
    },
    {
      'institute': 'IIT Hyderabad',
      'program': 'M.Tech CSE',
      'genRank': 400,
      'genScore': 650,
      'ctc': '₹25 LPA',
      'process': 'Written + Interview',
      'color': Colors.pink,
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  int _getAdjustedRank(int genRank, String category) {
    switch (category) {
      case 'OBC-NCL':
        return (genRank * 1.8).round();
      case 'EWS':
        return (genRank * 1.5).round();
      case 'SC':
        return (genRank * 4.2).round();
      case 'ST':
        return (genRank * 6.5).round();
      default:
        return genRank;
    }
  }

  int _getAdjustedScore(int genScore, String category) {
    switch (category) {
      case 'OBC-NCL':
        return (genScore * 0.90).round();
      case 'EWS':
        return (genScore * 0.92).round();
      case 'SC':
        return (genScore * 0.68).round();
      case 'ST':
        return (genScore * 0.58).round();
      default:
        return genScore;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final isCSIT = provider.activeExam == 'CSIT';
    final rawList = isCSIT ? _csitCutoffs : _daCutoffs;

    // Filter by search query & admission process (Direct Offer vs Interview)
    final query = _searchQuery.trim().toLowerCase();
    final currentCutoffs = rawList.where((item) {
      if (query.isNotEmpty) {
        final inst = (item['institute'] as String).toLowerCase();
        final prog = (item['program'] as String).toLowerCase();
        if (!inst.contains(query) && !prog.contains(query)) return false;
      }
      if (_processFilter == 'Direct Offers Only') {
        final proc = (item['process'] as String).toLowerCase();
        if (!proc.contains('direct')) return false;
      } else if (_processFilter == 'Interview / Test') {
        final proc = (item['process'] as String).toLowerCase();
        if (!proc.contains('interview') && !proc.contains('test') && !proc.contains('written')) return false;
      }
      return true;
    }).toList();

    // Student gate score estimate (from Estimator route, mock tests, or calibrated profile)
    double userScore = widget.initialGateScore ?? 0.0;
    if (userScore <= 0.0 && provider.mockLogs.isNotEmpty) {
      final userMockScore = provider.mockLogs.map((m) => m.score).reduce((a, b) => a > b ? a : b);
      userScore = (userMockScore * 10.0).clamp(200.0, 1000.0);
    }
    if (userScore <= 0.0 && provider.estimatorMockScore > 0.0) {
      userScore = (provider.estimatorMockScore * 10.0).clamp(200.0, 1000.0);
    }
    final double userEstimatedGateScore = userScore;

    return Scaffold(
      backgroundColor: context.scaffoldBackground,
      appBar: AppBar(
        title: Text(
          'COAP & CCMT Predictor (${provider.activeExam})',
          style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: context.textColor),
        ),
        backgroundColor: context.scaffoldBackground,
        elevation: 0,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            children: [
              // 1. Hero Insights Container
              _buildHeaderCard(userEstimatedGateScore),
              const SizedBox(height: 14),

              // 2. Category Filter Pills
              _buildCategorySelector(),
              const SizedBox(height: 10),

              // 2b. Direct Offer vs Interview Process Filter Pills
              _buildProcessSelector(),
              const SizedBox(height: 14),

              // 3. Search Bar
              _buildSearchBar(),
              const SizedBox(height: 18),

              // 4. Header title with count
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Target M.Tech Cutoffs ($_selectedCategory)',
                    style: GoogleFonts.outfit(fontSize: 15, fontWeight: FontWeight.bold, color: context.textColor),
                  ),
                  Text(
                    '${currentCutoffs.length} Institutes',
                    style: GoogleFonts.outfit(fontSize: 12, color: context.textSecondaryColor),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // 5. Cutoff Cards
              if (currentCutoffs.isEmpty)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      children: [
                        Icon(Icons.search_off_rounded, size: 44, color: context.textSecondaryColor),
                        const SizedBox(height: 10),
                        Text('No institutes found matching "$_searchQuery"',
                            style: GoogleFonts.outfit(color: context.textColor, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                )
              else
                ...currentCutoffs.map((cutoff) {
                  return _buildCutoffCard(cutoff, userEstimatedGateScore);
                }),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategorySelector() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: _categories.map((cat) {
          final isSelected = _selectedCategory == cat;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                HapticFeedback.selectionClick();
                setState(() => _selectedCategory = cat);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? AppTheme.accentPurple : context.colorSurface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isSelected
                        ? AppTheme.accentPurple
                        : (context.isDarkMode ? Colors.white12 : Colors.black12),
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
                  cat,
                  style: GoogleFonts.outfit(
                    fontSize: 12,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    color: isSelected ? Colors.white : context.textColor,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildProcessSelector() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: _processes.map((proc) {
          final isSelected = _processFilter == proc;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                HapticFeedback.selectionClick();
                setState(() => _processFilter = proc);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF06B6D4)
                      : (context.isDarkMode ? Colors.white.withOpacity(0.05) : Colors.black.withOpacity(0.04)),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? const Color(0xFF06B6D4)
                        : (context.isDarkMode ? Colors.white10 : Colors.black12),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (proc.contains('Direct'))
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: Icon(Icons.bolt_rounded, size: 13, color: isSelected ? Colors.white : const Color(0xFF06B6D4)),
                      )
                    else if (proc.contains('Interview'))
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: Icon(Icons.psychology_rounded, size: 13, color: isSelected ? Colors.white : Colors.amber),
                      ),
                    Text(
                      proc,
                      style: GoogleFonts.outfit(
                        fontSize: 11,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                        color: isSelected ? Colors.white : context.textSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSearchBar() {
    return NeuContainer(
      isRecessed: true,
      borderRadius: 14,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: Row(
        children: [
          Icon(Icons.search_rounded, size: 18, color: context.textSecondaryColor),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _searchController,
              onChanged: (val) => setState(() => _searchQuery = val),
              style: GoogleFonts.outfit(fontSize: 13, color: context.textColor),
              decoration: InputDecoration(
                hintText: 'Search IIT Bombay, IISc, Delhi, Madras...',
                hintStyle: GoogleFonts.outfit(fontSize: 12, color: context.textSecondaryColor.withValues(alpha: 0.7)),
                border: InputBorder.none,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
              ),
            ),
          ),
          if (_searchQuery.isNotEmpty)
            GestureDetector(
              onTap: () {
                _searchController.clear();
                setState(() => _searchQuery = '');
              },
              child: Icon(Icons.close_rounded, size: 16, color: context.textSecondaryColor),
            ),
        ],
      ),
    );
  }

  Widget _buildHeaderCard(double userScore) {
    return NeuContainer(
      borderRadius: 20,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const NeuIconTile(
            icon: Icons.account_balance_rounded,
            iconColor: AppTheme.accentPurple,
            size: 46,
            iconSize: 22,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'COAP Admission Insights',
                      style: GoogleFonts.outfit(fontSize: 14.5, fontWeight: FontWeight.bold, color: context.textColor),
                    ),
                    if (userScore > 0)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppTheme.accentMint.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppTheme.accentMint.withValues(alpha: 0.3)),
                        ),
                        child: Text(
                          'Your Best: ${userScore.toStringAsFixed(0)}',
                          style: GoogleFonts.outfit(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.accentMint),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'Verified cutoff ranks, GATE score brackets, average CTC packages, and interview rounds for top IITs.',
                  style: TextStyle(color: context.textSecondaryColor, fontSize: 11.5, height: 1.3),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCutoffCard(Map<String, dynamic> cutoff, double userScore) {
    final color = cutoff['color'] as Color;
    final int genRank = cutoff['genRank'] as int;
    final int genScore = cutoff['genScore'] as int;
    final String ctc = cutoff['ctc'] as String;
    final String process = cutoff['process'] as String;

    final adjustedRank = _getAdjustedRank(genRank, _selectedCategory);
    final adjustedScore = _getAdjustedScore(genScore, _selectedCategory);

    // Probability badge
    String oddsLabel = 'Target';
    Color oddsColor = AppTheme.accentGold;
    if (userScore > 0) {
      if (userScore >= adjustedScore) {
        oddsLabel = 'Safe Match ✓';
        oddsColor = AppTheme.accentMint;
      } else if (userScore >= adjustedScore - 40) {
        oddsLabel = 'Competitive';
        oddsColor = AppTheme.accentGold;
      } else {
        oddsLabel = 'Reach';
        oddsColor = AppTheme.accentCoral;
      }
    }

    return NeuContainer(
      borderRadius: 18,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  cutoff['institute'],
                  style: GoogleFonts.outfit(fontSize: 15.5, fontWeight: FontWeight.bold, color: context.textColor),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (userScore > 0) ...[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                      margin: const EdgeInsets.only(right: 6),
                      decoration: BoxDecoration(
                        color: oddsColor.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: oddsColor.withValues(alpha: 0.25)),
                      ),
                      child: Text(
                        oddsLabel,
                        style: GoogleFonts.outfit(color: oddsColor, fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: color.withValues(alpha: 0.3)),
                    ),
                    child: Text(
                      '$adjustedScore+ Score',
                      style: GoogleFonts.outfit(
                        color: color,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            cutoff['program'],
            style: GoogleFonts.outfit(color: context.textSecondaryColor, fontSize: 12.5),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 6,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.military_tech_outlined, size: 15, color: AppTheme.accentPurple),
                  const SizedBox(width: 4),
                  Text(
                    'Rank: Under AIR $adjustedRank',
                    style: GoogleFonts.outfit(color: context.textColor, fontSize: 11.5, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.payments_outlined, size: 15, color: AppTheme.accentMint),
                  const SizedBox(width: 4),
                  Text(
                    'Avg CTC: $ctc',
                    style: GoogleFonts.outfit(color: AppTheme.accentMint, fontSize: 11.5, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.how_to_reg_outlined, size: 15, color: context.textSecondaryColor),
                  const SizedBox(width: 4),
                  Text(
                    process,
                    style: GoogleFonts.outfit(color: context.textSecondaryColor, fontSize: 11.5),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
