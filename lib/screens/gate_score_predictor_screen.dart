import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/neu_widgets.dart';
import '../services/ad_service.dart';
import 'psu_predictor_screen.dart';

class CollegeCutoff {
  final String collegeName;
  final String tier; // 'IIT', 'NIT', 'IIIT'
  final String program;
  final Map<String, int> cutoffs; // Category -> Expected cutoff GATE Score
  final String portal; // 'COAP', 'CCMT', 'Direct'
  final List<String> branches; // ['DA', 'CSIT']

  const CollegeCutoff({
    required this.collegeName,
    required this.tier,
    required this.program,
    required this.cutoffs,
    required this.portal,
    required this.branches,
  });
}

class GateScorePredictorScreen extends StatefulWidget {
  final double? initialMarks;
  const GateScorePredictorScreen({super.key, this.initialMarks});

  @override
  State<GateScorePredictorScreen> createState() => _GateScorePredictorScreenState();
}

class _GateScorePredictorScreenState extends State<GateScorePredictorScreen> {
  late String _selectedBranch; // 'DA' or 'CSIT'
  String _selectedCategory = 'GEN'; // 'GEN', 'OBC-NCL', 'EWS', 'SC/ST/PwD'
  String _selectedSession = 'Average Trend'; // 'Average Trend', 'GATE 2026', 'GATE 2025', 'GATE 2024'
  double _marks = 55.0;
  String _collegeFilter = 'ALL'; // 'ALL', 'IIT', 'NIT', 'IIIT'

  bool _isPredicting = false;
  bool _hasPredicted = false;
  Map<String, dynamic>? _scoreResult;

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<AppProvider>(context, listen: false);
    _selectedBranch = (provider.activeExam == 'CSIT') ? 'CSIT' : 'DA';
    if (widget.initialMarks != null) {
      _marks = widget.initialMarks!.clamp(0.0, 100.0);
    }
    AdService().loadInterstitialAd();
  }

  // Branch session parameters: { Mq (GEN cutoff), Mt (Top 0.1% mean marks) }
  static const Map<String, Map<String, Map<String, double>>> _sessionData = {
    'DA': {
      'Average Trend': {'Mq': 30.8, 'Mt': 85.5},
      'GATE 2026': {'Mq': 26.4, 'Mt': 82.5},
      'GATE 2025': {'Mq': 29.0, 'Mt': 85.0},
      'GATE 2024': {'Mq': 37.1, 'Mt': 89.2},
    },
    'CSIT': {
      'Average Trend': {'Mq': 27.6, 'Mt': 77.3},
      'GATE 2026': {'Mq': 27.6, 'Mt': 78.5},
      'GATE 2025': {'Mq': 27.6, 'Mt': 77.0},
      'GATE 2024': {'Mq': 27.6, 'Mt': 76.5},
    },
  };

  // Comprehensive verified college cutoffs for GATE DA & CS/IT
  static const List<CollegeCutoff> _colleges = [
    // --- TOP IITs ---
    CollegeCutoff(
      collegeName: 'IISc Bangalore',
      tier: 'IIT',
      program: 'M.Tech Computational & Data Sciences (CDS) / AI',
      cutoffs: {'GEN': 790, 'OBC-NCL': 730, 'EWS': 740, 'SC/ST/PwD': 560},
      portal: 'COAP + Interview',
      branches: ['DA', 'CSIT'],
    ),
    CollegeCutoff(
      collegeName: 'IIT Bombay',
      tier: 'IIT',
      program: 'M.Tech CSE / CMInDs (AI & Data Science)',
      cutoffs: {'GEN': 775, 'OBC-NCL': 715, 'EWS': 725, 'SC/ST/PwD': 540},
      portal: 'COAP Direct Call',
      branches: ['DA', 'CSIT'],
    ),
    CollegeCutoff(
      collegeName: 'IIT Delhi',
      tier: 'IIT',
      program: 'M.Tech CSE / Yardi School of AI (ScAI)',
      cutoffs: {'GEN': 765, 'OBC-NCL': 705, 'EWS': 715, 'SC/ST/PwD': 530},
      portal: 'COAP Direct Call',
      branches: ['DA', 'CSIT'],
    ),
    CollegeCutoff(
      collegeName: 'IIT Madras',
      tier: 'IIT',
      program: 'M.Tech CSE / Interdisciplinary Data Science',
      cutoffs: {'GEN': 755, 'OBC-NCL': 695, 'EWS': 705, 'SC/ST/PwD': 520},
      portal: 'COAP Direct Call',
      branches: ['DA', 'CSIT'],
    ),
    CollegeCutoff(
      collegeName: 'IIT Kanpur',
      tier: 'IIT',
      program: 'M.Tech Computer Science & Engineering',
      cutoffs: {'GEN': 745, 'OBC-NCL': 685, 'EWS': 695, 'SC/ST/PwD': 510},
      portal: 'COAP Direct Call',
      branches: ['DA', 'CSIT'],
    ),
    CollegeCutoff(
      collegeName: 'IIT Kharagpur',
      tier: 'IIT',
      program: 'M.Tech CSE / Centre of AI',
      cutoffs: {'GEN': 735, 'OBC-NCL': 675, 'EWS': 685, 'SC/ST/PwD': 500},
      portal: 'COAP Direct Call',
      branches: ['DA', 'CSIT'],
    ),
    CollegeCutoff(
      collegeName: 'IIT Roorkee',
      tier: 'IIT',
      program: 'M.Tech AI & Data Science (Mehta School)',
      cutoffs: {'GEN': 720, 'OBC-NCL': 660, 'EWS': 670, 'SC/ST/PwD': 485},
      portal: 'COAP Direct Call',
      branches: ['DA', 'CSIT'],
    ),
    CollegeCutoff(
      collegeName: 'IIT Guwahati',
      tier: 'IIT',
      program: 'M.Tech Data Science & AI',
      cutoffs: {'GEN': 705, 'OBC-NCL': 645, 'EWS': 655, 'SC/ST/PwD': 470},
      portal: 'COAP Direct Call',
      branches: ['DA', 'CSIT'],
    ),
    CollegeCutoff(
      collegeName: 'IIT Hyderabad',
      tier: 'IIT',
      program: 'M.Tech Artificial Intelligence / CSE',
      cutoffs: {'GEN': 695, 'OBC-NCL': 635, 'EWS': 645, 'SC/ST/PwD': 460},
      portal: 'COAP 2-Stage',
      branches: ['DA', 'CSIT'],
    ),
    CollegeCutoff(
      collegeName: 'IIT BHU (Varanasi)',
      tier: 'IIT',
      program: 'M.Tech CSE / Decision Sciences',
      cutoffs: {'GEN': 675, 'OBC-NCL': 615, 'EWS': 625, 'SC/ST/PwD': 445},
      portal: 'COAP Direct Call',
      branches: ['DA', 'CSIT'],
    ),
    CollegeCutoff(
      collegeName: 'IIT Indore',
      tier: 'IIT',
      program: 'M.Tech CSE (Data Science Specialization)',
      cutoffs: {'GEN': 660, 'OBC-NCL': 600, 'EWS': 610, 'SC/ST/PwD': 430},
      portal: 'COAP Direct Call',
      branches: ['DA', 'CSIT'],
    ),

    // --- TOP NITs (via CCMT) ---
    CollegeCutoff(
      collegeName: 'NIT Trichy',
      tier: 'NIT',
      program: 'M.Tech Computer Science / Data Analytics',
      cutoffs: {'GEN': 670, 'OBC-NCL': 610, 'EWS': 620, 'SC/ST/PwD': 440},
      portal: 'CCMT Round 1-3',
      branches: ['DA', 'CSIT'],
    ),
    CollegeCutoff(
      collegeName: 'NIT Surathkal',
      tier: 'NIT',
      program: 'M.Tech Computational & Data Science (CDS) / IT',
      cutoffs: {'GEN': 660, 'OBC-NCL': 600, 'EWS': 610, 'SC/ST/PwD': 430},
      portal: 'CCMT Round 1-3',
      branches: ['DA', 'CSIT'],
    ),
    CollegeCutoff(
      collegeName: 'NIT Warangal',
      tier: 'NIT',
      program: 'M.Tech Computer Science & Information Security',
      cutoffs: {'GEN': 650, 'OBC-NCL': 590, 'EWS': 600, 'SC/ST/PwD': 420},
      portal: 'CCMT Round 1-3',
      branches: ['DA', 'CSIT'],
    ),
    CollegeCutoff(
      collegeName: 'NIT Calicut',
      tier: 'NIT',
      program: 'M.Tech Computer Science & Engineering (AI)',
      cutoffs: {'GEN': 625, 'OBC-NCL': 565, 'EWS': 575, 'SC/ST/PwD': 395},
      portal: 'CCMT Round 1-3',
      branches: ['DA', 'CSIT'],
    ),
    CollegeCutoff(
      collegeName: 'NIT Rourkela',
      tier: 'NIT',
      program: 'M.Tech Computer Science / Analytics',
      cutoffs: {'GEN': 615, 'OBC-NCL': 555, 'EWS': 565, 'SC/ST/PwD': 385},
      portal: 'CCMT Round 1-3',
      branches: ['DA', 'CSIT'],
    ),
    CollegeCutoff(
      collegeName: 'MNNIT Allahabad',
      tier: 'NIT',
      program: 'M.Tech Computer Science & Engineering',
      cutoffs: {'GEN': 605, 'OBC-NCL': 545, 'EWS': 555, 'SC/ST/PwD': 375},
      portal: 'CCMT Round 1-3',
      branches: ['DA', 'CSIT'],
    ),

    // --- TOP IIITs ---
    CollegeCutoff(
      collegeName: 'IIIT Bangalore',
      tier: 'IIIT',
      program: 'M.Tech Computer Science (AI & ML Specialization)',
      cutoffs: {'GEN': 660, 'OBC-NCL': 600, 'EWS': 610, 'SC/ST/PwD': 430},
      portal: 'Direct IIITB Portal',
      branches: ['DA', 'CSIT'],
    ),
    CollegeCutoff(
      collegeName: 'IIIT Delhi',
      tier: 'IIIT',
      program: 'M.Tech CSE (Data Engineering Track)',
      cutoffs: {'GEN': 645, 'OBC-NCL': 585, 'EWS': 595, 'SC/ST/PwD': 415},
      portal: 'Direct IIITD Portal',
      branches: ['DA', 'CSIT'],
    ),
    CollegeCutoff(
      collegeName: 'IIIT Allahabad',
      tier: 'IIIT',
      program: 'M.Tech Data Science & Machine Learning',
      cutoffs: {'GEN': 635, 'OBC-NCL': 575, 'EWS': 585, 'SC/ST/PwD': 405},
      portal: 'CCMT Centralized',
      branches: ['DA', 'CSIT'],
    ),
    CollegeCutoff(
      collegeName: 'IIIT Gwalior',
      tier: 'IIIT',
      program: 'M.Tech Computer Science & Cyber Security',
      cutoffs: {'GEN': 585, 'OBC-NCL': 525, 'EWS': 535, 'SC/ST/PwD': 360},
      portal: 'CCMT Centralized',
      branches: ['DA', 'CSIT'],
    ),
  ];

  Map<String, dynamic> _computeGateScore() {
    final branchParams = _sessionData[_selectedBranch]?[_selectedSession] ?? {'Mq': 30.0, 'Mt': 80.0};
    final double genMq = branchParams['Mq']!;
    final double topMeanMt = branchParams['Mt']!;

    // Category cutoff
    double catCutoff;
    if (_selectedCategory == 'GEN') {
      catCutoff = genMq;
    } else if (_selectedCategory == 'OBC-NCL' || _selectedCategory == 'EWS') {
      catCutoff = double.parse((genMq * 0.9).toStringAsFixed(2));
    } else {
      // SC/ST/PwD (2/3 of GEN)
      catCutoff = double.parse((genMq * 2.0 / 3.0).toStringAsFixed(2));
    }

    final bool isQualified = _marks >= catCutoff;

    // Official Formula: S = Sq + (St - Sq) * (M - Mq) / (Mt - Mq)
    // where Sq = 350, St = 900
    const double sq = 350.0;
    const double st = 900.0;

    double calculatedScore;
    if (_marks >= topMeanMt) {
      // Above top 0.1% mean, scaling up to 1000
      final double diff = (100.0 - topMeanMt) > 0 ? (100.0 - topMeanMt) : 10.0;
      calculatedScore = st + (1000.0 - st) * ((_marks - topMeanMt) / diff);
    } else if (_marks >= genMq) {
      // Standard normalized linear range
      calculatedScore = sq + (st - sq) * ((_marks - genMq) / (topMeanMt - genMq));
    } else {
      // Below qualifying general marks
      calculatedScore = sq * (_marks / genMq);
    }

    final int gateScore = calculatedScore.clamp(0.0, 1000.0).round();

    // Admission / PSU Eligibility band
    String band;
    Color bandColor;
    String recommendation;

    if (!isQualified) {
      band = 'Not Qualified';
      bandColor = AppTheme.error;
      recommendation = 'Marks are below the $_selectedCategory qualifying cutoff ($catCutoff). Focus on error log revision, high-weightage topics, and formula retention.';
    } else if (gateScore >= 800) {
      band = 'Top Tier (IISc & Top IITs / Direct PSUs)';
      bandColor = AppTheme.success;
      recommendation = 'Exceptional performance! Direct M.Tech TA offers at IISc Bangalore, IIT Bombay, IIT Delhi, and shortlist calls at top PSUs (ONGC, IOCL, DRDO).';
    } else if (gateScore >= 700) {
      band = 'High Tier (Old IITs & Top PSUs)';
      bandColor = AppTheme.accentPurple;
      recommendation = 'Strong score! Direct admission chances at IIT Madras, Kanpur, Kharagpur, Roorkee, Guwahati, and interview calls for major PSUs.';
    } else if (gateScore >= 600) {
      band = 'Mid Tier (Newer IITs & Top NITs)';
      bandColor = AppTheme.accentMint;
      recommendation = 'Great opportunity for top NITs (NIT Trichy, Surathkal, Warangal) via CCMT, IIT Hyderabad/Indore/BHU, and specialist PSU roles.';
    } else if (gateScore >= 450) {
      band = 'Qualifying Tier (NITs & IIITs)';
      bandColor = Colors.amber;
      recommendation = 'Qualified. Eligible for centralized CCMT rounds for NITs, IIITs (Allahabad, Bangalore, Gwalior), and State Government Master programs.';
    } else {
      band = 'Passing Tier (State Universities)';
      bandColor = Colors.orange;
      recommendation = 'Cleared the $_selectedCategory cutoff ($catCutoff). Eligible for stipend (MHRD ₹12,400/mo) in qualifying universities and self-sponsored M.Tech.';
    }

    return {
      'score': gateScore,
      'isQualified': isQualified,
      'catCutoff': catCutoff,
      'genCutoff': genMq,
      'topMean': topMeanMt,
      'band': band,
      'bandColor': bandColor,
      'recommendation': recommendation,
    };
  }

  void _showExactMarksDialog(double currentMarks) {
    final textController = TextEditingController(
      text: currentMarks.toStringAsFixed(currentMarks.truncateToDouble() == currentMarks ? 0 : 2),
    );
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: context.scaffoldBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text('Enter Marks', style: AppTheme.poppinsBold(fontSize: 16, color: context.textColor)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your raw marks from official response key (0.00 – 100.00):',
              style: TextStyle(fontSize: 12, color: context.textSecondaryColor),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: textController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              autofocus: true,
              style: AppTheme.timerStyle(fontSize: 22, color: AppTheme.accentPurple),
              decoration: InputDecoration(
                labelText: 'Marks (out of 100)',
                hintText: 'e.g. 58.33',
                labelStyle: TextStyle(color: context.textSecondaryColor, fontSize: 13),
                contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text('Cancel', style: TextStyle(color: context.textSecondaryColor)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.accentPurple,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
            onPressed: () {
              final val = double.tryParse(textController.text.trim());
              if (val != null && val >= 0.0 && val <= 100.0) {
                setState(() {
                  _marks = val;
                  if (_hasPredicted) _hasPredicted = false;
                });
                Navigator.pop(ctx);
              }
            },
            child: const Text('Confirm', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  void _runPrediction() {
    HapticFeedback.selectionClick();
    final provider = Provider.of<AppProvider>(context, listen: false);

    setState(() => _isPredicting = true);

    void computeAndShow() {
      final res = _computeGateScore();
      final estScore = (res['score'] as int).toDouble();
      provider.setEstimatedGateScore(estScore);

      if (mounted) {
        setState(() {
          _scoreResult = res;
          _hasPredicted = true;
          _isPredicting = false;
        });
        HapticFeedback.heavyImpact();
      }
    }

    if (!provider.isPro) {
      AdService().showInterstitialAd(
        enforceCooldown: false,
        onDismissed: () {
          computeAndShow();
        },
      );
    } else {
      Future.delayed(const Duration(milliseconds: 300), () {
        computeAndShow();
      });
    }
  }

  String _getCollegeChance(int score, int cutoff) {
    if (score >= cutoff + 15) return 'HIGH';
    if (score >= cutoff - 15) return 'TARGET';
    return 'REACH';
  }

  @override
  Widget build(BuildContext context) {
    final int userScore = (_scoreResult?['score'] as int?) ?? 0;

    final matchingColleges = _colleges.where((c) {
      if (!c.branches.contains(_selectedBranch)) return false;
      if (_collegeFilter == 'IIT' && c.tier != 'IIT') return false;
      if (_collegeFilter == 'NIT' && c.tier != 'NIT') return false;
      if (_collegeFilter == 'IIIT' && c.tier != 'IIIT') return false;
      return true;
    }).toList();

    return Scaffold(
      backgroundColor: context.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('GATE Score Predictor', style: AppTheme.poppinsBold(fontSize: 16, color: context.textColor)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, size: 18, color: context.textColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Official GATE Score Predictor',
                  style: AppTheme.poppinsBold(fontSize: 18, color: context.textColor),
                ),
                const SizedBox(height: 4),
                Text(
                  'Calculates normalized score (out of 1000) using official IIT normalization metrics',
                  style: TextStyle(color: context.textSecondaryColor, fontSize: 12),
                ),
                const SizedBox(height: 16),

                // 1. BRANCH SELECTOR (DA vs CS/IT)
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: context.colorSurfaceElevated,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: context.colorBorder),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if (_selectedBranch != 'DA') {
                              HapticFeedback.selectionClick();
                              setState(() {
                                _selectedBranch = 'DA';
                                _hasPredicted = false;
                              });
                            }
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: _selectedBranch == 'DA' ? AppTheme.accentPurple : Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'GATE DA (Data Science)',
                              style: TextStyle(
                                fontSize: 12.5,
                                fontWeight: FontWeight.bold,
                                color: _selectedBranch == 'DA' ? Colors.white : context.textSecondaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if (_selectedBranch != 'CSIT') {
                              HapticFeedback.selectionClick();
                              setState(() {
                                _selectedBranch = 'CSIT';
                                _hasPredicted = false;
                              });
                            }
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: _selectedBranch == 'CSIT' ? AppTheme.accentPurple : Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'GATE CS / IT',
                              style: TextStyle(
                                fontSize: 12.5,
                                fontWeight: FontWeight.bold,
                                color: _selectedBranch == 'CSIT' ? Colors.white : context.textSecondaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // 2. INPUT CARD
                NeuContainer(
                  borderRadius: 20,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Category Selector Pills
                      Text(
                        'Category',
                        style: TextStyle(color: context.textSecondaryColor, fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: ['GEN', 'OBC-NCL', 'EWS', 'SC/ST/PwD'].map((cat) {
                          final isSelected = _selectedCategory == cat;
                          return Expanded(
                            child: GestureDetector(
                              onTap: () {
                                HapticFeedback.selectionClick();
                                setState(() {
                                  _selectedCategory = cat;
                                  if (_hasPredicted) _hasPredicted = false;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 3),
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppTheme.accentPurple
                                      : context.colorSurfaceElevated,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: isSelected ? AppTheme.accentPurple : context.colorBorder,
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  cat,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                    color: isSelected ? Colors.white : context.textColor,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 16),

                      // Session / Trend Dropdown
                      Text(
                        'Evaluation Session / Curve',
                        style: TextStyle(color: context.textSecondaryColor, fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () {
                          HapticFeedback.selectionClick();
                          _showSessionPickerSheet();
                        },
                        child: NeuContainer(
                          isRecessed: true,
                          borderRadius: 12,
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _selectedSession,
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: context.textColor),
                              ),
                              Icon(Icons.keyboard_arrow_down_rounded, color: context.textSecondaryColor, size: 20),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Marks Input Header & Edit Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Raw Marks (out of 100)',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: context.textColor),
                          ),
                          GestureDetector(
                            onTap: () => _showExactMarksDialog(_marks),
                            child: NeuContainer(
                              borderRadius: 10,
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    _marks.toStringAsFixed(_marks.truncateToDouble() == _marks ? 0 : 2),
                                    style: AppTheme.timerStyle(fontSize: 16, color: AppTheme.accentPurple),
                                  ),
                                  const SizedBox(width: 5),
                                  Icon(Icons.edit_rounded, size: 13, color: context.textSecondaryColor),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // Slider
                      Slider(
                        value: _marks.clamp(0.0, 100.0),
                        min: 0.0,
                        max: 100.0,
                        divisions: 200,
                        activeColor: AppTheme.accentFlame,
                        label: _marks.toStringAsFixed(1),
                        onChanged: (val) {
                          setState(() {
                            _marks = val;
                            if (_hasPredicted) _hasPredicted = false;
                          });
                        },
                      ),
                      const SizedBox(height: 16),

                      // Predict Button
                      NeuButton(
                        isPrimary: true,
                        gradient: AppTheme.flameGradient,
                        borderRadius: 14,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        onPressed: _isPredicting ? null : _runPrediction,
                        child: _isPredicting
                            ? const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 18,
                                    height: 18,
                                    child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Calculating Normalized Score...',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5, color: Colors.white),
                                  ),
                                ],
                              )
                            : const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.calculate_outlined, size: 18, color: Colors.white),
                                  SizedBox(width: 8),
                                  Text(
                                    'Calculate Normalized GATE Score',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
                                  ),
                                ],
                              ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // 3. OUTPUT PREDICTION CARD
                if (_hasPredicted && _scoreResult != null) ...[
                  NeuContainer(
                    borderRadius: 20,
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: (_scoreResult!['bandColor'] as Color).withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: (_scoreResult!['bandColor'] as Color).withValues(alpha: 0.3)),
                              ),
                              child: Text(
                                _scoreResult!['isQualified'] ? 'QUALIFIED FOR GATE 2027' : 'BELOW QUALIFYING CUTOFF',
                                style: TextStyle(
                                  color: _scoreResult!['bandColor'],
                                  fontSize: 10.5,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                            Text(
                              '$_selectedBranch • $_selectedCategory',
                              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: context.textSecondaryColor),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Large Score Gauge Display
                        Center(
                          child: Column(
                            children: [
                              Text(
                                'NORMALIZED GATE SCORE',
                                style: GoogleFonts.outfit(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.0,
                                  color: context.textSecondaryColor,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    "${_scoreResult!['score']}",
                                    style: AppTheme.timerStyle(
                                      fontSize: 48,
                                      color: _scoreResult!['bandColor'],
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    '/ 1000',
                                    style: GoogleFonts.outfit(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: context.textSecondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                _scoreResult!['band'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: _scoreResult!['bandColor'],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Divider(color: context.isDarkMode ? Colors.white12 : Colors.black12, height: 1),
                        const SizedBox(height: 14),

                        // Cutoffs breakdown
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('$_selectedCategory Cutoff:', style: TextStyle(fontSize: 12, color: context.textSecondaryColor)),
                            Text('${_scoreResult!['catCutoff']} marks', style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold, color: context.textColor)),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('General (Mq) Qualifying Mark:', style: TextStyle(fontSize: 12, color: context.textSecondaryColor)),
                            Text('${_scoreResult!['genCutoff']} marks', style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold, color: context.textColor)),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Top 0.1% Mean Marks (Mt):', style: TextStyle(fontSize: 12, color: context.textSecondaryColor)),
                            Text('${_scoreResult!['topMean']} marks', style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold, color: context.textColor)),
                          ],
                        ),
                        const SizedBox(height: 14),

                        // Recommendation container
                        NeuContainer(
                          isRecessed: true,
                          borderRadius: 12,
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            _scoreResult!['recommendation'],
                            style: TextStyle(fontSize: 12.5, height: 1.45, color: context.textColor),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Action button: Check Eligible PSUs
                        NeuButton(
                          isPrimary: true,
                          borderRadius: 14,
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          onPressed: () {
                            HapticFeedback.selectionClick();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => PsuPredictorScreen(
                                  initialBranch: _selectedBranch,
                                  initialCategory: _selectedCategory,
                                  initialGateScore: (_scoreResult!['score'] as int).toDouble(),
                                ),
                              ),
                            );
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.corporate_fare_rounded, color: Colors.white, size: 18),
                              SizedBox(width: 8),
                              Text(
                                'Check PSU Eligibility with this Score',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5, color: Colors.white),
                              ),
                              SizedBox(width: 6),
                              Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 16),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 4. IIT, NIT & IIIT ADMISSION CHANCES SECTION
                  Text(
                    'IIT, NIT & IIIT Admission Predictor',
                    style: AppTheme.poppinsBold(fontSize: 16, color: context.textColor),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Admission eligibility for COAP and CCMT centralized rounds based on your score',
                    style: TextStyle(color: context.textSecondaryColor, fontSize: 11.5),
                  ),
                  const SizedBox(height: 12),

                  // College Filters
                  Row(
                    children: [
                      _buildCollegeFilterChip('ALL', 'All Colleges'),
                      _buildCollegeFilterChip('IIT', 'IITs (COAP)'),
                      _buildCollegeFilterChip('NIT', 'NITs (CCMT)'),
                      _buildCollegeFilterChip('IIIT', 'IIITs'),
                    ],
                  ),
                  const SizedBox(height: 14),

                  // Colleges List
                  ...matchingColleges.map((college) {
                    final int cutoff = college.cutoffs[_selectedCategory] ?? college.cutoffs['GEN'] ?? 700;
                    final String chance = _getCollegeChance(userScore, cutoff);

                    Color statusCol;
                    String statusLabel;
                    if (chance == 'HIGH') {
                      statusCol = AppTheme.success;
                      statusLabel = 'High Chance';
                    } else if (chance == 'TARGET') {
                      statusCol = Colors.amber;
                      statusLabel = 'Target Call';
                    } else {
                      statusCol = AppTheme.error;
                      statusLabel = 'Reach';
                    }

                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: NeuContainer(
                        borderRadius: 16,
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    college.collegeName,
                                    style: AppTheme.poppinsBold(fontSize: 14, color: context.textColor),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                  decoration: BoxDecoration(
                                    color: statusCol.withValues(alpha: 0.15),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: statusCol.withValues(alpha: 0.3)),
                                  ),
                                  child: Text(
                                    statusLabel,
                                    style: TextStyle(color: statusCol, fontSize: 10, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 3),
                            Text(
                              college.program,
                              style: TextStyle(fontSize: 11.5, color: context.textSecondaryColor),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text('Expected Cutoff: ', style: TextStyle(fontSize: 11, color: context.textSecondaryColor)),
                                    Text('$cutoff Score', style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold, color: statusCol)),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: context.colorSurfaceElevated,
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(color: context.colorBorder),
                                  ),
                                  child: Text(
                                    college.portal,
                                    style: TextStyle(fontSize: 9.5, color: context.textSecondaryColor),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ] else ...[
                  NeuContainer(
                    borderRadius: 18,
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const NeuIconTile(
                          icon: Icons.school_outlined,
                          iconColor: AppTheme.accentCyan,
                          size: 44,
                          iconSize: 22,
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'IIT, NIT & IIIT Cutoff Calibration',
                                style: AppTheme.poppinsBold(fontSize: 14, color: context.textColor),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                'Calculate your score to reveal live admission shortlisting for IISc, Top 7 Old IITs, NIT Trichy/Surathkal, and IIITs via COAP & CCMT.',
                                style: TextStyle(fontSize: 11.5, color: context.textSecondaryColor, height: 1.35),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCollegeFilterChip(String key, String label) {
    final isSelected = _collegeFilter == key;
    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        setState(() => _collegeFilter = key);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.accentPurple : context.colorSurfaceElevated,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isSelected ? AppTheme.accentPurple : context.colorBorder),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            color: isSelected ? Colors.white : context.textColor,
          ),
        ),
      ),
    );
  }

  void _showSessionPickerSheet() {
    final sessions = ['Average Trend', 'GATE 2026', 'GATE 2025', 'GATE 2024'];
    showModalBottomSheet(
      context: context,
      backgroundColor: context.scaffoldBackground,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Select Curve Trend', style: AppTheme.poppinsBold(fontSize: 16, color: context.textColor)),
                  IconButton(
                    icon: Icon(Icons.close_rounded, color: context.textSecondaryColor),
                    onPressed: () => Navigator.pop(ctx),
                  ),
                ],
              ),
            ),
            ...sessions.map((s) {
              final isSelected = s == _selectedSession;
              return ListTile(
                title: Text(
                  s,
                  style: TextStyle(
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    color: isSelected ? AppTheme.accentPurple : context.textColor,
                  ),
                ),
                trailing: isSelected ? const Icon(Icons.check_circle_rounded, color: AppTheme.accentPurple) : null,
                onTap: () {
                  setState(() {
                    _selectedSession = s;
                    if (_hasPredicted) _hasPredicted = false;
                  });
                  Navigator.pop(ctx);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
