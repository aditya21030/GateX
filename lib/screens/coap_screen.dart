import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/neu_widgets.dart';

class COAPScreen extends StatefulWidget {
  final double? initialGateScore;
  final bool showEligibleOnly;
  final String? initialCategory;
  const COAPScreen({
    super.key,
    this.initialGateScore,
    this.showEligibleOnly = false,
    this.initialCategory,
  });

  @override
  State<COAPScreen> createState() => _COAPScreenState();
}

class _COAPScreenState extends State<COAPScreen> {
  late String _selectedCategory;
  String _filterMode = 'All Programs'; // 'All Programs', 'Eligible Only', 'Direct Offers', 'Interview / Test'
  String _searchQuery = '';
  double? _customScore;
  final TextEditingController _searchController = TextEditingController();

  final List<String> _categories = ['General', 'OBC-NCL', 'EWS', 'SC', 'ST'];
  final List<String> _filterModes = [
    'All Programs',
    'Eligible Only',
    'Direct Offers',
    'Interview / Test',
  ];

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
    {
      'institute': 'IIT (BHU) Varanasi',
      'program': 'M.Tech AI & Machine Learning',
      'genRank': 550,
      'genScore': 590,
      'ctc': '₹22 LPA',
      'process': 'Direct COAP Offer',
      'color': Colors.deepOrange,
    },
    {
      'institute': 'IIT Gandhinagar',
      'program': 'M.Tech Computer Science & Data',
      'genRank': 600,
      'genScore': 580,
      'ctc': '₹19 LPA',
      'process': 'Written Test + Interview',
      'color': Colors.brown,
    },
    {
      'institute': 'IIT Indore',
      'program': 'M.Tech AI & Data Science',
      'genRank': 650,
      'genScore': 565,
      'ctc': '₹20 LPA',
      'process': 'Direct COAP Offer',
      'color': Colors.blueGrey,
    },
    {
      'institute': 'IIT Jodhpur',
      'program': 'M.Tech AI & Data Engineering',
      'genRank': 750,
      'genScore': 540,
      'ctc': '₹18 LPA',
      'process': 'Direct COAP Offer',
      'color': Colors.lightGreen,
    },
    {
      'institute': 'NIT Trichy',
      'program': 'M.Tech Data Analytics (CCMT)',
      'genRank': 900,
      'genScore': 510,
      'ctc': '₹17 LPA',
      'process': 'Direct CCMT Round',
      'color': Colors.teal,
    },
    {
      'institute': 'NIT Surathkal',
      'program': 'M.Tech Computational & Data Science (CCMT)',
      'genRank': 950,
      'genScore': 500,
      'ctc': '₹18 LPA',
      'process': 'Direct CCMT Round',
      'color': Colors.deepPurple,
    },
    {
      'institute': 'NIT Warangal',
      'program': 'M.Tech Computer Science & Info Security (CCMT)',
      'genRank': 1100,
      'genScore': 480,
      'ctc': '₹16 LPA',
      'process': 'Direct CCMT Round',
      'color': Colors.cyan,
    },
    {
      'institute': 'IIIT Delhi',
      'program': 'M.Tech CSE (Data Engineering)',
      'genRank': 1300,
      'genScore': 460,
      'ctc': '₹20 LPA',
      'process': 'Online Test + Interview',
      'color': Colors.indigo,
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
    {
      'institute': 'IIT (BHU) Varanasi',
      'program': 'M.Tech CSE',
      'genRank': 450,
      'genScore': 640,
      'ctc': '₹24 LPA',
      'process': 'Direct COAP Offer',
      'color': Colors.deepOrange,
    },
    {
      'institute': 'IIT Indore',
      'program': 'M.Tech CSE',
      'genRank': 550,
      'genScore': 610,
      'ctc': '₹22 LPA',
      'process': 'Direct COAP Offer',
      'color': Colors.blueGrey,
    },
    {
      'institute': 'NIT Trichy',
      'program': 'M.Tech Computer Science (CCMT)',
      'genRank': 700,
      'genScore': 580,
      'ctc': '₹21 LPA',
      'process': 'Direct CCMT Round',
      'color': Colors.teal,
    },
    {
      'institute': 'NIT Surathkal',
      'program': 'M.Tech Information Technology (CCMT)',
      'genRank': 800,
      'genScore': 560,
      'ctc': '₹20 LPA',
      'process': 'Direct CCMT Round',
      'color': Colors.deepPurple,
    },
    {
      'institute': 'NIT Warangal',
      'program': 'M.Tech CSE (CCMT)',
      'genRank': 950,
      'genScore': 540,
      'ctc': '₹19 LPA',
      'process': 'Direct CCMT Round',
      'color': Colors.cyan,
    },
    {
      'institute': 'IIIT Hyderabad',
      'program': 'M.Tech CSE',
      'genRank': 1100,
      'genScore': 520,
      'ctc': '₹25 LPA',
      'process': 'PGEE / GATE Direct',
      'color': Colors.lightGreen,
    },
    {
      'institute': 'IIIT Allahabad',
      'program': 'M.Tech IT (CCMT)',
      'genRank': 1300,
      'genScore': 500,
      'ctc': '₹18 LPA',
      'process': 'Direct CCMT Round',
      'color': Colors.indigo,
    },
  ];

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.initialCategory ?? 'General';
    if (widget.showEligibleOnly) {
      _filterMode = 'Eligible Only';
    }
    if (widget.initialGateScore != null && widget.initialGateScore! > 0) {
      _customScore = widget.initialGateScore;
    }
  }

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

  Map<String, dynamic> _getOdds(double userScore, int adjustedScore) {
    if (userScore <= 0) {
      return {'label': 'Target', 'color': AppTheme.accentGold, 'isEligible': true};
    }
    if (userScore >= adjustedScore) {
      return {'label': 'Safe Match ✓', 'color': AppTheme.accentMint, 'isEligible': true};
    } else if (userScore >= adjustedScore - 40) {
      return {'label': 'Competitive', 'color': AppTheme.accentGold, 'isEligible': true};
    } else {
      return {'label': 'Reach', 'color': AppTheme.accentCoral, 'isEligible': false};
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final isCSIT = provider.activeExam == 'CSIT';
    final rawList = isCSIT ? _csitCutoffs : _daCutoffs;

    // Resolve student GATE score
    double userScore = _customScore ?? widget.initialGateScore ?? 0.0;
    if (userScore <= 0.0 && provider.estimatedGateScore > 0.0) {
      userScore = provider.estimatedGateScore;
    }
    if (userScore <= 0.0 && provider.mockLogs.isNotEmpty) {
      final userMockScore = provider.mockLogs.map((m) => m.score).reduce((a, b) => a > b ? a : b);
      userScore = (userMockScore * 9.5 + 150).clamp(200.0, 1000.0);
    }
    if (userScore <= 0.0 && provider.estimatorMockScore > 0.0) {
      userScore = (provider.estimatorMockScore * 9.5 + 150).clamp(200.0, 1000.0);
    }
    final double userEstimatedGateScore = userScore;

    // Calculate eligible counts
    final eligibleCount = rawList.where((item) {
      if (userEstimatedGateScore <= 0) return true;
      final adjScore = _getAdjustedScore(item['genScore'] as int, _selectedCategory);
      return userEstimatedGateScore >= adjScore - 40;
    }).length;

    // Filter by search query, process & eligibility
    final query = _searchQuery.trim().toLowerCase();
    final currentCutoffs = rawList.where((item) {
      final adjScore = _getAdjustedScore(item['genScore'] as int, _selectedCategory);
      final odds = _getOdds(userEstimatedGateScore, adjScore);

      if (query.isNotEmpty) {
        final inst = (item['institute'] as String).toLowerCase();
        final prog = (item['program'] as String).toLowerCase();
        if (!inst.contains(query) && !prog.contains(query)) return false;
      }
      final proc = (item['process'] as String).toLowerCase();
      if (_filterMode == 'Direct Offers') {
        if (!proc.contains('direct')) return false;
      } else if (_filterMode == 'Interview / Test') {
        if (!proc.contains('interview') && !proc.contains('test') && !proc.contains('written')) return false;
      } else if (_filterMode == 'Eligible Only') {
        if (userEstimatedGateScore > 0 && !(odds['isEligible'] as bool)) {
          return false;
        }
      }
      return true;
    }).toList();

    return Scaffold(
      backgroundColor: context.scaffoldBackground,
      appBar: AppBar(
        title: Text(
          'COAP & CCMT Predictor (${provider.activeExam})',
          style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: context.textColor),
        ),
        backgroundColor: context.scaffoldBackground,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, size: 18, color: context.textColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            children: [
              // 1. Hero Insights Header
              _buildHeaderCard(userEstimatedGateScore, eligibleCount, rawList.length),
              const SizedBox(height: 14),

              // 2. Category Filter Pills
              _buildCategorySelector(),
              const SizedBox(height: 10),

              // 2b. Filter Mode Selector
              _buildFilterTabs(eligibleCount, rawList.length),
              const SizedBox(height: 14),

              // 3. Search Bar
              _buildSearchBar(),
              const SizedBox(height: 18),

              // 4. Header title with count
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _filterMode == 'Eligible Only'
                        ? 'Eligible Programs ($_selectedCategory)'
                        : 'Target Cutoffs ($_selectedCategory)',
                    style: GoogleFonts.outfit(fontSize: 15, fontWeight: FontWeight.bold, color: context.textColor),
                  ),
                  Text(
                    '${currentCutoffs.length} Programs',
                    style: GoogleFonts.outfit(fontSize: 12, color: context.textSecondaryColor),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // 5. Cutoff Cards or Empty State
              if (currentCutoffs.isEmpty)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      children: [
                        Icon(Icons.search_off_rounded, size: 44, color: context.textSecondaryColor),
                        const SizedBox(height: 12),
                        Text(
                          _filterMode == 'Eligible Only'
                              ? 'No eligible programs found for score ${userEstimatedGateScore.toStringAsFixed(0)} under $_selectedCategory category'
                              : 'No institutes found matching "$_searchQuery"',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.outfit(color: context.textColor, fontWeight: FontWeight.bold, fontSize: 13.5),
                        ),
                        if (_filterMode == 'Eligible Only') ...[
                          const SizedBox(height: 14),
                          NeuButton(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            onPressed: () {
                              HapticFeedback.selectionClick();
                              setState(() => _filterMode = 'All Programs');
                            },
                            child: const Text('View All Target Cutoffs'),
                          ),
                        ],
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

  Widget _buildFilterTabs(int eligibleCount, int totalCount) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: _filterModes.map((mode) {
          final isSelected = _filterMode == mode;
          String label = mode;
          IconData? icon;
          if (mode == 'All Programs') {
            label = 'All ($totalCount)';
            icon = Icons.apps_rounded;
          } else if (mode == 'Eligible Only') {
            label = '🎯 Eligible ($eligibleCount)';
            icon = Icons.verified_rounded;
          } else if (mode == 'Direct Offers') {
            label = 'Direct Offers';
            icon = Icons.bolt_rounded;
          } else if (mode == 'Interview / Test') {
            label = 'Interview / Test';
            icon = Icons.psychology_rounded;
          }

          final activeColor = mode == 'Eligible Only' ? AppTheme.accentMint : const Color(0xFF06B6D4);

          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                HapticFeedback.selectionClick();
                setState(() => _filterMode = mode);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                decoration: BoxDecoration(
                  color: isSelected
                      ? activeColor
                      : (context.isDarkMode ? Colors.white.withOpacity(0.05) : Colors.black.withOpacity(0.04)),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? activeColor
                        : (context.isDarkMode ? Colors.white10 : Colors.black12),
                  ),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: activeColor.withValues(alpha: 0.3),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (icon != null) ...[
                      Icon(
                        icon,
                        size: 13,
                        color: isSelected ? Colors.white : (mode == 'Eligible Only' ? AppTheme.accentMint : context.textSecondaryColor),
                      ),
                      const SizedBox(width: 5),
                    ],
                    Text(
                      label,
                      style: GoogleFonts.outfit(
                        fontSize: 11.5,
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
                hintText: 'Search IIT Bombay, IISc, Delhi, Madras, NIT...',
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

  Widget _buildHeaderCard(double userScore, int eligibleCount, int totalCount) {
    return NeuContainer(
      borderRadius: 20,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
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
                          'COAP & CCMT Predictor',
                          style: GoogleFonts.outfit(fontSize: 15, fontWeight: FontWeight.bold, color: context.textColor),
                        ),
                        if (userScore > 0)
                          GestureDetector(
                            onTap: () => _showScoreAdjustDialog(userScore),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                              decoration: BoxDecoration(
                                color: AppTheme.accentMint.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: AppTheme.accentMint.withValues(alpha: 0.4)),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Your Score: ${userScore.toStringAsFixed(0)}',
                                    style: GoogleFonts.outfit(fontSize: 11, fontWeight: FontWeight.bold, color: AppTheme.accentMint),
                                  ),
                                  const SizedBox(width: 4),
                                  const Icon(Icons.edit_rounded, size: 11, color: AppTheme.accentMint),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Verified cutoff scores, category reservations, CTC packages, and admission mode for top IITs & NITs.',
                      style: TextStyle(color: context.textSecondaryColor, fontSize: 11.5, height: 1.3),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (userScore > 0) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: _filterMode == 'Eligible Only'
                    ? AppTheme.accentMint.withValues(alpha: 0.12)
                    : (context.isDarkMode ? Colors.white.withOpacity(0.04) : Colors.black.withOpacity(0.03)),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _filterMode == 'Eligible Only'
                      ? AppTheme.accentMint.withValues(alpha: 0.3)
                      : (context.isDarkMode ? Colors.white10 : Colors.black12),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    _filterMode == 'Eligible Only' ? Icons.check_circle_rounded : Icons.info_outline_rounded,
                    size: 16,
                    color: _filterMode == 'Eligible Only' ? AppTheme.accentMint : AppTheme.accentPurple,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _filterMode == 'Eligible Only'
                          ? 'Showing $eligibleCount eligible programs for score ${userScore.toStringAsFixed(0)} ($_selectedCategory)'
                          : 'Eligible for $eligibleCount of $totalCount programs with score ${userScore.toStringAsFixed(0)}',
                      style: GoogleFonts.outfit(
                        fontSize: 11.5,
                        fontWeight: FontWeight.w600,
                        color: _filterMode == 'Eligible Only' ? AppTheme.accentMint : context.textColor,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      HapticFeedback.selectionClick();
                      setState(() {
                        _filterMode = _filterMode == 'Eligible Only' ? 'All Programs' : 'Eligible Only';
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: _filterMode == 'Eligible Only'
                            ? context.colorSurface
                            : AppTheme.accentMint.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        _filterMode == 'Eligible Only' ? 'Show All' : 'Filter Eligible',
                        style: GoogleFonts.outfit(
                          fontSize: 10.5,
                          fontWeight: FontWeight.bold,
                          color: _filterMode == 'Eligible Only' ? context.textColor : AppTheme.accentMint,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _showScoreAdjustDialog(double currentScore) {
    double tempScore = currentScore;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: context.colorSurface,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 40,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: context.textSecondaryColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    Text(
                      'Adjust Your GATE Score',
                      style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.bold, color: context.textColor),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Preview your admission chances at top IITs & NITs with different GATE scores.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: context.textSecondaryColor),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      tempScore.toStringAsFixed(0),
                      style: GoogleFonts.outfit(fontSize: 32, fontWeight: FontWeight.bold, color: AppTheme.accentPurple),
                    ),
                    const SizedBox(height: 10),
                    Slider(
                      value: tempScore,
                      min: 300,
                      max: 1000,
                      divisions: 70,
                      activeColor: AppTheme.accentPurple,
                      label: tempScore.toStringAsFixed(0),
                      onChanged: (v) {
                        setModalState(() => tempScore = v);
                      },
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: NeuButton(
                        isPrimary: true,
                        onPressed: () {
                          Navigator.pop(ctx);
                          setState(() {
                            _customScore = tempScore;
                          });
                          final provider = Provider.of<AppProvider>(context, listen: false);
                          provider.setEstimatedGateScore(tempScore);
                        },
                        child: Text(
                          'Apply Score (${tempScore.toStringAsFixed(0)})',
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
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
    final odds = _getOdds(userScore, adjustedScore);
    final String oddsLabel = odds['label'] as String;
    final Color oddsColor = odds['color'] as Color;

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
          if (_selectedCategory != 'General') ...[
            const SizedBox(height: 3),
            Text(
              '(General: $genScore+ | $_selectedCategory Adjusted: $adjustedScore+)',
              style: GoogleFonts.outfit(fontSize: 10, color: context.textSecondaryColor.withOpacity(0.8), fontStyle: FontStyle.italic),
            ),
          ],
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
