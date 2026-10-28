import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/neu_widgets.dart';
import '../services/ad_service.dart';

class EstimationNode {
  final double marks;
  final double gateScore;
  final int minRank;
  final int maxRank;

  const EstimationNode({
    required this.marks,
    required this.gateScore,
    required this.minRank,
    required this.maxRank,
  });
}

class ScoreEstimatorScreen extends StatefulWidget {
  const ScoreEstimatorScreen({super.key});

  @override
  State<ScoreEstimatorScreen> createState() => _ScoreEstimatorScreenState();
}

class _ScoreEstimatorScreenState extends State<ScoreEstimatorScreen> {
  late String _selectedBranch; // 'DA' or 'CSIT'
  bool _isRealGateExam = false; // false = Mock Test, true = Real GATE Exam (Response Sheet)
  String _targetYearTrend = 'Average Trend';
  bool _isPredicting = false;
  bool _hasPredicted = false;
  Map<String, dynamic>? _prediction;

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<AppProvider>(context, listen: false);
    _selectedBranch = (provider.activeExam == 'CSIT') ? 'CSIT' : 'DA';
    AdService().loadInterstitialAd();
  }

  static const List<EstimationNode> _csNodes2026 = [
    EstimationNode(marks: 100.0, gateScore: 1000.0, minRank: 1, maxRank: 1),
    EstimationNode(marks: 90.0, gateScore: 980.0, minRank: 2, maxRank: 10),
    EstimationNode(marks: 85.0, gateScore: 940.0, minRank: 11, maxRank: 35),
    EstimationNode(marks: 80.0, gateScore: 890.0, minRank: 36, maxRank: 80),
    EstimationNode(marks: 75.0, gateScore: 840.0, minRank: 81, maxRank: 180),
    EstimationNode(marks: 70.0, gateScore: 790.0, minRank: 181, maxRank: 350),
    EstimationNode(marks: 65.0, gateScore: 740.0, minRank: 351, maxRank: 700),
    EstimationNode(marks: 60.0, gateScore: 680.0, minRank: 701, maxRank: 1300),
    EstimationNode(marks: 55.0, gateScore: 620.0, minRank: 1301, maxRank: 2200),
    EstimationNode(marks: 50.0, gateScore: 560.0, minRank: 2201, maxRank: 3800),
    EstimationNode(marks: 45.0, gateScore: 500.0, minRank: 3801, maxRank: 6000),
    EstimationNode(marks: 40.0, gateScore: 440.0, minRank: 6001, maxRank: 9500),
    EstimationNode(marks: 35.0, gateScore: 390.0, minRank: 9501, maxRank: 14000),
    EstimationNode(marks: 27.0, gateScore: 350.0, minRank: 16000, maxRank: 19000),
    EstimationNode(marks: 0.0, gateScore: 0.0, minRank: 50000, maxRank: 80000),
  ];

  static const List<EstimationNode> _csNodes2025 = [
    EstimationNode(marks: 100.0, gateScore: 1000.0, minRank: 1, maxRank: 1),
    EstimationNode(marks: 88.0, gateScore: 970.0, minRank: 2, maxRank: 12),
    EstimationNode(marks: 82.0, gateScore: 920.0, minRank: 13, maxRank: 45),
    EstimationNode(marks: 76.0, gateScore: 860.0, minRank: 46, maxRank: 120),
    EstimationNode(marks: 70.0, gateScore: 800.0, minRank: 121, maxRank: 300),
    EstimationNode(marks: 64.0, gateScore: 730.0, minRank: 301, maxRank: 750),
    EstimationNode(marks: 58.0, gateScore: 660.0, minRank: 751, maxRank: 1500),
    EstimationNode(marks: 52.0, gateScore: 590.0, minRank: 1501, maxRank: 2800),
    EstimationNode(marks: 46.0, gateScore: 520.0, minRank: 2801, maxRank: 4800),
    EstimationNode(marks: 40.0, gateScore: 450.0, minRank: 4801, maxRank: 8000),
    EstimationNode(marks: 34.0, gateScore: 390.0, minRank: 8001, maxRank: 13000),
    EstimationNode(marks: 26.5, gateScore: 350.0, minRank: 15000, maxRank: 18000),
    EstimationNode(marks: 0.0, gateScore: 0.0, minRank: 60000, maxRank: 90000),
  ];

  static const List<EstimationNode> _csNodes2024 = [
    EstimationNode(marks: 100.0, gateScore: 1000.0, minRank: 1, maxRank: 1),
    EstimationNode(marks: 90.0, gateScore: 990.0, minRank: 2, maxRank: 8),
    EstimationNode(marks: 84.0, gateScore: 930.0, minRank: 9, maxRank: 30),
    EstimationNode(marks: 78.0, gateScore: 870.0, minRank: 31, maxRank: 90),
    EstimationNode(marks: 72.0, gateScore: 810.0, minRank: 91, maxRank: 220),
    EstimationNode(marks: 66.0, gateScore: 750.0, minRank: 221, maxRank: 550),
    EstimationNode(marks: 60.0, gateScore: 680.0, minRank: 551, maxRank: 1200),
    EstimationNode(marks: 54.0, gateScore: 610.0, minRank: 1201, maxRank: 2400),
    EstimationNode(marks: 48.0, gateScore: 540.0, minRank: 2401, maxRank: 4200),
    EstimationNode(marks: 42.0, gateScore: 470.0, minRank: 4201, maxRank: 7200),
    EstimationNode(marks: 36.0, gateScore: 400.0, minRank: 7201, maxRank: 11500),
    EstimationNode(marks: 27.6, gateScore: 350.0, minRank: 16000, maxRank: 19500),
    EstimationNode(marks: 0.0, gateScore: 0.0, minRank: 55000, maxRank: 85000),
  ];

  static const List<EstimationNode> _nodes2026 = [
    EstimationNode(marks: 100.0, gateScore: 1000.0, minRank: 1, maxRank: 1),
    EstimationNode(marks: 90.0, gateScore: 1000.0, minRank: 1, maxRank: 1),
    EstimationNode(marks: 85.0, gateScore: 970.0, minRank: 2, maxRank: 5),
    EstimationNode(marks: 80.0, gateScore: 935.0, minRank: 6, maxRank: 15),
    EstimationNode(marks: 75.0, gateScore: 895.0, minRank: 16, maxRank: 40),
    EstimationNode(marks: 70.0, gateScore: 855.0, minRank: 41, maxRank: 100),
    EstimationNode(marks: 65.0, gateScore: 815.0, minRank: 101, maxRank: 200),
    EstimationNode(marks: 60.0, gateScore: 770.0, minRank: 201, maxRank: 400),
    EstimationNode(marks: 55.0, gateScore: 720.0, minRank: 401, maxRank: 700),
    EstimationNode(marks: 50.0, gateScore: 670.0, minRank: 701, maxRank: 1100),
    EstimationNode(marks: 45.0, gateScore: 620.0, minRank: 1101, maxRank: 1700),
    EstimationNode(marks: 40.0, gateScore: 565.0, minRank: 1701, maxRank: 2600),
    EstimationNode(marks: 35.0, gateScore: 500.0, minRank: 2601, maxRank: 4200),
    EstimationNode(marks: 30.0, gateScore: 430.0, minRank: 4201, maxRank: 6500),
    EstimationNode(marks: 26.4, gateScore: 350.0, minRank: 7500, maxRank: 8500),
    EstimationNode(marks: 0.0, gateScore: 0.0, minRank: 12000, maxRank: 15000),
  ];

  static const List<EstimationNode> _nodes2025 = [
    EstimationNode(marks: 100.0, gateScore: 1000.0, minRank: 1, maxRank: 1),
    EstimationNode(marks: 96.33, gateScore: 1000.0, minRank: 1, maxRank: 1),
    EstimationNode(marks: 90.0, gateScore: 960.0, minRank: 2, maxRank: 8),
    EstimationNode(marks: 85.0, gateScore: 915.0, minRank: 9, maxRank: 30),
    EstimationNode(marks: 80.0, gateScore: 860.0, minRank: 31, maxRank: 100),
    EstimationNode(marks: 75.0, gateScore: 800.0, minRank: 101, maxRank: 250),
    EstimationNode(marks: 70.0, gateScore: 740.0, minRank: 251, maxRank: 500),
    EstimationNode(marks: 65.0, gateScore: 680.0, minRank: 501, maxRank: 1000),
    EstimationNode(marks: 60.0, gateScore: 620.0, minRank: 1001, maxRank: 1800),
    EstimationNode(marks: 55.0, gateScore: 560.0, minRank: 1801, maxRank: 3000),
    EstimationNode(marks: 50.0, gateScore: 500.0, minRank: 3001, maxRank: 4500),
    EstimationNode(marks: 45.0, gateScore: 440.0, minRank: 4501, maxRank: 6500),
    EstimationNode(marks: 40.0, gateScore: 395.0, minRank: 6501, maxRank: 9000),
    EstimationNode(marks: 29.0, gateScore: 350.0, minRank: 14000, maxRank: 16000),
    EstimationNode(marks: 0.0, gateScore: 0.0, minRank: 22000, maxRank: 25000),
  ];

  static const List<EstimationNode> _nodes2024 = [
    EstimationNode(marks: 100.0, gateScore: 1000.0, minRank: 1, maxRank: 1),
    EstimationNode(marks: 90.0, gateScore: 1000.0, minRank: 1, maxRank: 1),
    EstimationNode(marks: 85.0, gateScore: 965.0, minRank: 2, maxRank: 10),
    EstimationNode(marks: 80.0, gateScore: 920.0, minRank: 11, maxRank: 25),
    EstimationNode(marks: 75.0, gateScore: 870.0, minRank: 26, maxRank: 60),
    EstimationNode(marks: 70.0, gateScore: 820.0, minRank: 61, maxRank: 120),
    EstimationNode(marks: 65.0, gateScore: 770.0, minRank: 121, maxRank: 250),
    EstimationNode(marks: 60.0, gateScore: 715.0, minRank: 251, maxRank: 450),
    EstimationNode(marks: 55.0, gateScore: 655.0, minRank: 451, maxRank: 900),
    EstimationNode(marks: 50.0, gateScore: 590.0, minRank: 901, maxRank: 1500),
    EstimationNode(marks: 45.0, gateScore: 520.0, minRank: 1501, maxRank: 2500),
    EstimationNode(marks: 40.0, gateScore: 445.0, minRank: 2501, maxRank: 4000),
    EstimationNode(marks: 37.1, gateScore: 350.0, minRank: 4500, maxRank: 5500),
    EstimationNode(marks: 0.0, gateScore: 0.0, minRank: 8000, maxRank: 10000),
  ];

  static const Map<String, double> _coachingMultipliers = {
    'Self-made': 1.0,
    'GO Classes': 1.03,
    'MADE Easy': 1.01,
    'Gate Wallah': 0.97,
    'Unacademy': 0.96,
    'Ace Engineering': 1.00,
    'Vision Gate': 0.95,
    'The ML Hub': 1.02,
    'Other': 1.0,
  };

  Map<String, dynamic> _calculatePrediction(double marks, String source, String yearTrend) {
    final double multiplier = _isRealGateExam ? 1.0 : (_coachingMultipliers[source] ?? 1.0);
    final double scaledMarks = (marks * multiplier).clamp(0.0, 100.0);

    final bool isCS = _selectedBranch == 'CSIT';
    final nodes26 = isCS ? _csNodes2026 : _nodes2026;
    final nodes25 = isCS ? _csNodes2025 : _nodes2025;
    final nodes24 = isCS ? _csNodes2024 : _nodes2024;
    final cut26 = isCS ? 27.0 : 26.4;
    final cut25 = isCS ? 26.5 : 29.0;
    final cut24 = isCS ? 27.6 : 37.1;
    final avgCut = isCS ? 27.0 : 30.8;

    List<EstimationNode> nodes;
    double cutoff;
    if (yearTrend == 'GATE 2026') {
      nodes = nodes26;
      cutoff = cut26;
    } else if (yearTrend == 'GATE 2025') {
      nodes = nodes25;
      cutoff = cut25;
    } else if (yearTrend == 'GATE 2024') {
      nodes = nodes24;
      cutoff = cut24;
    } else {
      // Average Trend
      cutoff = avgCut;
      final p2026 = _interpolateNode(scaledMarks, nodes26);
      final p2025 = _interpolateNode(scaledMarks, nodes25);
      final p2024 = _interpolateNode(scaledMarks, nodes24);
      final avgScore = (p2026['score']! + p2025['score']! + p2024['score']!) / 3.0;
      final avgMinRank = ((p2026['minRank']! + p2025['minRank']! + p2024['minRank']!) / 3.0).round();
      final avgMaxRank = ((p2026['maxRank']! + p2025['maxRank']! + p2024['maxRank']!) / 3.0).round();
      return _buildResultMap(avgScore, avgMinRank, avgMaxRank, scaledMarks, cutoff, multiplier);
    }

    final p = _interpolateNode(scaledMarks, nodes);
    return _buildResultMap(p['score']!, p['minRank']!.round(), p['maxRank']!.round(), scaledMarks, cutoff, multiplier);
  }

  Map<String, double> _interpolateNode(double targetMarks, List<EstimationNode> nodes) {
    final sorted = List<EstimationNode>.from(nodes)..sort((a, b) => b.marks.compareTo(a.marks));
    if (targetMarks >= sorted.first.marks) {
      return {
        'score': sorted.first.gateScore,
        'minRank': sorted.first.minRank.toDouble(),
        'maxRank': sorted.first.maxRank.toDouble(),
      };
    }
    if (targetMarks <= sorted.last.marks) {
      return {
        'score': sorted.last.gateScore,
        'minRank': sorted.last.minRank.toDouble(),
        'maxRank': sorted.last.maxRank.toDouble(),
      };
    }

    for (int i = 0; i < sorted.length - 1; i++) {
      final upper = sorted[i];
      final lower = sorted[i + 1];
      if (targetMarks <= upper.marks && targetMarks >= lower.marks) {
        final t = (targetMarks - lower.marks) / (upper.marks - lower.marks);
        final score = lower.gateScore + t * (upper.gateScore - lower.gateScore);
        final minRank = lower.minRank + t * (upper.minRank - lower.minRank);
        final maxRank = lower.maxRank + t * (upper.maxRank - lower.maxRank);
        return {
          'score': score.clamp(0.0, 1000.0),
          'minRank': minRank,
          'maxRank': maxRank,
        };
      }
    }
    return {'score': 0.0, 'minRank': 0.0, 'maxRank': 0.0};
  }

  Map<String, dynamic> _buildResultMap(
    double score,
    int minRank,
    int maxRank,
    double marks,
    double cutoff,
    double multiplier,
  ) {
    final bool isQualified = marks >= cutoff;
    String iitChance;
    Color color;
    String message;

    if (!isQualified) {
      iitChance = 'None';
      color = AppTheme.error;
      message = 'Marks are below the general qualifying cutoff ($cutoff). Focus on strengthening fundamentals, revising with Spaced Repetition, and analyzing weak subjects in your Error Log.';
    } else if (score >= 750) {
      iitChance = 'High';
      color = AppTheme.success;
      message = 'Outstanding! You have a very high chance of getting direct admission / interview calls for M.Tech/MS at top IITs (IITB, IITD, IITK, IISc).';
    } else if (score >= 650) {
      iitChance = 'Moderate';
      color = AppTheme.secondary;
      message = 'Great score! Solid chance for mid-tier to top IITs (IIT M, KGP, Roorkee, Guwahati) or top NITs. Keep practicing to secure a Top 100 rank.';
    } else if (score >= 500) {
      iitChance = 'Low';
      color = Colors.amber;
      message = 'Qualified. Reasonable chance for newer IITs, older NITs, or IIITs. Work on weak topics to boost your score above 650.';
    } else {
      iitChance = 'Very Low';
      color = AppTheme.error;
      message = 'Qualified, but admission chances at IITs are very low. Consider applying to other central universities or state engineering colleges, and utilize the Error Log daily to revise.';
    }

    final rankRangeStr = minRank == maxRank ? '$minRank' : '$minRank – $maxRank';

    return {
      'gateScore': score.round(),
      'predictedAir': rankRangeStr,
      'iitChance': iitChance,
      'color': color,
      'message': message,
      'isQualified': isQualified,
      'scaledMarks': marks,
      'multiplier': multiplier,
    };
  }

  Widget _buildCustomSelectorCard({
    required BuildContext context,
    required String label,
    required String currentValueDisplay,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        onTap();
      },
      child: NeuContainer(
        isRecessed: true,
        borderRadius: 14,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(color: context.textSecondaryColor, fontSize: 11),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    currentValueDisplay,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5, color: context.textColor),
                  ),
                ],
              ),
            ),
            Icon(Icons.keyboard_arrow_down_rounded, color: context.textSecondaryColor, size: 20),
          ],
        ),
      ),
    );
  }

  void _showMockSourceBottomSheet(AppProvider provider, String currentValue) {
    final sources = {
      'Self-made': 'Self-made / Custom',
      'GO Classes': 'GO Classes Mock',
      'MADE Easy': 'MADE Easy Mock',
      'Gate Wallah': 'Gate Wallah Mock',
      'Unacademy': 'Unacademy Mock',
      'Ace Engineering': 'Ace Engineering Mock',
      'Vision Gate': 'Vision Gate Mock',
      'The ML Hub': 'The ML Hub Mock',
      'Other': 'Other Test Series',
    };

    showModalBottomSheet(
      context: context,
      backgroundColor: context.scaffoldBackground,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Select Mock Test Source',
                      style: AppTheme.poppinsBold(fontSize: 16, color: context.textColor),
                    ),
                    IconButton(
                      icon: Icon(Icons.close_rounded, color: context.textSecondaryColor),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              Divider(color: context.isDarkMode ? Colors.white12 : Colors.black12, height: 1),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: sources.entries.map((entry) {
                    final isSelected = entry.key == currentValue;
                    final multiplier = _coachingMultipliers[entry.key] ?? 1.0;
                    String difficultyText = "Standard (1.0x)";
                    if (multiplier > 1.0) difficultyText = "Tough (${multiplier}x)";
                    if (multiplier < 1.0) difficultyText = "Moderate (${multiplier}x)";

                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                      title: Text(
                        entry.value,
                        style: TextStyle(
                          color: isSelected ? AppTheme.accentPurple : context.textColor,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                      subtitle: Text(
                        "Difficulty: $difficultyText",
                        style: TextStyle(fontSize: 11, color: context.textSecondaryColor),
                      ),
                      trailing: isSelected
                          ? const Icon(Icons.check_circle_rounded, color: AppTheme.accentPurple, size: 20)
                          : null,
                      onTap: () {
                        provider.setScoreEstimatorSource(entry.key);
                        Navigator.pop(context);
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showYearTrendBottomSheet(String currentValue) {
    final trends = {
      'Average Trend': 'Average Trend (Robust)',
      'GATE 2026': 'GATE 2026 Trend (Tough)',
      'GATE 2025': 'GATE 2025 Trend (Moderate)',
      'GATE 2024': 'GATE 2024 Trend (Easy-to-Moderate)',
    };

    showModalBottomSheet(
      context: context,
      backgroundColor: context.scaffoldBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.4,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Select Target Year Trend',
                      style: AppTheme.poppinsBold(fontSize: 16, color: context.textColor),
                    ),
                    IconButton(
                      icon: Icon(Icons.close_rounded, color: context.textSecondaryColor),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              Divider(color: context.isDarkMode ? Colors.white12 : Colors.black12, height: 1),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: trends.entries.map((entry) {
                    final isSelected = entry.key == currentValue;
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                      title: Text(
                        entry.value,
                        style: TextStyle(
                          color: isSelected ? AppTheme.accentPurple : context.textColor,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                      trailing: isSelected
                          ? const Icon(Icons.check_circle_rounded, color: AppTheme.accentPurple, size: 20)
                          : null,
                      onTap: () {
                        setState(() {
                          _targetYearTrend = entry.key;
                        });
                        Navigator.pop(context);
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showExactMarksDialog(AppProvider provider, double currentScore) {
    final textController = TextEditingController(
      text: currentScore.toStringAsFixed(currentScore.truncateToDouble() == currentScore ? 0 : 2),
    );
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: context.scaffoldBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text('Enter Exact Marks', style: AppTheme.poppinsBold(fontSize: 16, color: context.textColor)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _isRealGateExam
                  ? 'Enter marks calculated from your official GATE response sheet (0.00 – 100.00):'
                  : 'Enter your exact raw marks in mock exam (0.00 – 100.00):',
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
                hintText: 'e.g. 64.33',
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
                provider.setScoreEstimatorScore(val);
                if (_hasPredicted) {
                  setState(() => _hasPredicted = false);
                }
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
    final score = provider.estimatorMockScore;
    final source = _isRealGateExam ? 'Official GATE Exam' : provider.estimatorMockSource;

    setState(() => _isPredicting = true);

    void computeAndShow() {
      final res = _calculatePrediction(score, source, _targetYearTrend);
      final estScore = (res['gateScore'] as num).toDouble();
      provider.setEstimatedGateScore(estScore);

      if (mounted) {
        setState(() {
          _prediction = res;
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

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final score = provider.estimatorMockScore;
    final source = provider.estimatorMockSource;

    final sourcesMap = {
      'Self-made': 'Self-made / Custom',
      'GO Classes': 'GO Classes Mock',
      'MADE Easy': 'MADE Easy Mock',
      'Gate Wallah': 'Gate Wallah Mock',
      'Unacademy': 'Unacademy Mock',
      'Ace Engineering': 'Ace Engineering Mock',
      'Vision Gate': 'Vision Gate Mock',
      'The ML Hub': 'The ML Hub Mock',
      'Other': 'Other Test Series',
    };
    final trendsMap = {
      'Average Trend': 'Average Trend (Robust)',
      'GATE 2026': 'GATE 2026 Trend (Tough)',
      'GATE 2025': 'GATE 2025 Trend (Moderate)',
      'GATE 2024': 'GATE 2024 Trend (Easy-to-Moderate)',
    };
    final sourceDisplay = sourcesMap[source] ?? source;
    final trendDisplay = trendsMap[_targetYearTrend] ?? _targetYearTrend;

    return Scaffold(
      backgroundColor: context.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('AIR Rank Estimator', style: AppTheme.poppinsBold(fontSize: 16, color: context.textColor)),
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Predict Your Rank & IIT Chance',
                    style: AppTheme.poppinsBold(fontSize: 18, color: context.textColor),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _isRealGateExam
                        ? 'Official response sheet evaluation based on normalized GATE curves'
                        : 'Calibrated algorithm with coaching difficulty multipliers and GATE curves',
                    style: TextStyle(color: context.textSecondaryColor, fontSize: 12),
                  ),
                  const SizedBox(height: 16),

                  // Branch Selector: GATE DA vs GATE CS/IT
                  Row(
                    children: [
                      Container(
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                          color: _selectedBranch == 'CSIT' ? const Color(0xFF9C27B0) : const Color(0xFF2962FF),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'SELECT TARGET PAPER',
                        style: TextStyle(
                          color: context.textSecondaryColor,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
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
                                color: _selectedBranch == 'DA' ? const Color(0xFF2962FF) : Colors.transparent,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: _selectedBranch == 'DA'
                                    ? [
                                        BoxShadow(
                                          color: const Color(0xFF2962FF).withValues(alpha: 0.3),
                                          blurRadius: 8,
                                          offset: const Offset(0, 2),
                                        ),
                                      ]
                                    : null,
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.data_object_rounded,
                                    size: 15,
                                    color: _selectedBranch == 'DA' ? Colors.white : context.textSecondaryColor,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    'GATE DA',
                                    style: TextStyle(
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.bold,
                                      color: _selectedBranch == 'DA' ? Colors.white : context.textSecondaryColor,
                                    ),
                                  ),
                                ],
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
                                color: _selectedBranch == 'CSIT' ? const Color(0xFF9C27B0) : Colors.transparent,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: _selectedBranch == 'CSIT'
                                    ? [
                                        BoxShadow(
                                          color: const Color(0xFF9C27B0).withValues(alpha: 0.3),
                                          blurRadius: 8,
                                          offset: const Offset(0, 2),
                                        ),
                                      ]
                                    : null,
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.computer_rounded,
                                    size: 15,
                                    color: _selectedBranch == 'CSIT' ? Colors.white : context.textSecondaryColor,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    'GATE CS/IT',
                                    style: TextStyle(
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.bold,
                                      color: _selectedBranch == 'CSIT' ? Colors.white : context.textSecondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 1. EXAM MODE TOGGLE (Real Exam vs Mock Test)
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
                              if (_isRealGateExam) {
                                HapticFeedback.selectionClick();
                                setState(() {
                                  _isRealGateExam = false;
                                  _hasPredicted = false;
                                });
                              }
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: !_isRealGateExam ? AppTheme.accentPurple : Colors.transparent,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: !_isRealGateExam
                                    ? [
                                        BoxShadow(
                                          color: AppTheme.accentPurple.withValues(alpha: 0.3),
                                          blurRadius: 8,
                                          offset: const Offset(0, 2),
                                        ),
                                      ]
                                    : null,
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.assignment_outlined,
                                    size: 15,
                                    color: !_isRealGateExam ? Colors.white : context.textSecondaryColor,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    'Coaching Mock',
                                    style: TextStyle(
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.bold,
                                      color: !_isRealGateExam ? Colors.white : context.textSecondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (!_isRealGateExam) {
                                HapticFeedback.selectionClick();
                                setState(() {
                                  _isRealGateExam = true;
                                  _hasPredicted = false;
                                });
                              }
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: _isRealGateExam ? AppTheme.accentPurple : Colors.transparent,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: _isRealGateExam
                                    ? [
                                        BoxShadow(
                                          color: AppTheme.accentPurple.withValues(alpha: 0.3),
                                          blurRadius: 8,
                                          offset: const Offset(0, 2),
                                        ),
                                      ]
                                    : null,
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.account_balance_rounded,
                                    size: 15,
                                    color: _isRealGateExam ? Colors.white : context.textSecondaryColor,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    'Real GATE Exam',
                                    style: TextStyle(
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.bold,
                                      color: _isRealGateExam ? Colors.white : context.textSecondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),

                  // 2. INPUT CARD
                  NeuContainer(
                    borderRadius: 20,
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!_isRealGateExam) ...[
                          _buildCustomSelectorCard(
                            context: context,
                            label: 'Which Mock Test did you take?',
                            currentValueDisplay: sourceDisplay,
                            onTap: () => _showMockSourceBottomSheet(provider, source),
                          ),
                          const SizedBox(height: 14),
                        ] else ...[
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppTheme.accentPurple.withValues(alpha: 0.08),
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(color: AppTheme.accentPurple.withValues(alpha: 0.2)),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.verified_rounded, size: 20, color: AppTheme.accentPurple),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    'Direct evaluation for Official GATE response sheets. No difficulty skews applied (1.0x).',
                                    style: TextStyle(fontSize: 11.5, color: context.textColor, height: 1.3),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 14),
                        ],

                        _buildCustomSelectorCard(
                          context: context,
                          label: 'Target GATE Year Trend',
                          currentValueDisplay: trendDisplay,
                          onTap: () => _showYearTrendBottomSheet(_targetYearTrend),
                        ),
                        const SizedBox(height: 20),

                        // Marks slider & text input trigger header
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _isRealGateExam ? 'Real Exam Marks (out of 100)' : 'Mock Marks (out of 100)',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: context.textColor),
                            ),
                            GestureDetector(
                              onTap: () => _showExactMarksDialog(provider, score),
                              child: NeuContainer(
                                borderRadius: 10,
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      score.toStringAsFixed(score.truncateToDouble() == score ? 0 : 2),
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
                          value: score.clamp(0.0, 100.0),
                          min: 0.0,
                          max: 100.0,
                          divisions: 200,
                          activeColor: AppTheme.accentFlame,
                          label: score.toStringAsFixed(1),
                          onChanged: (val) {
                            provider.setScoreEstimatorScore(val);
                            if (_hasPredicted) {
                              setState(() => _hasPredicted = false);
                            }
                          },
                        ),
                        const SizedBox(height: 14),

                        // 1-Tap Predict Action Button (Triggers Interstitial Ad for Free users)
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
                                      'Analyzing Rank Curve & Trends...',
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5, color: Colors.white),
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.auto_awesome, size: 18, color: Colors.white),
                                    const SizedBox(width: 8),
                                    Text(
                                      _isRealGateExam ? 'Predict Real Exam AIR' : 'Predict Mock AIR',
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
                                    ),
                                  ],
                                ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 3. OUTPUT CARD (Revealed only after clicking Predict button)
                  if (_hasPredicted && _prediction != null) ...[
                    NeuContainer(
                      borderRadius: 20,
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.auto_awesome, color: _prediction!['color'], size: 18),
                                  const SizedBox(width: 8),
                                  Text(
                                    'IIT CHANCE: ${_prediction!['iitChance'].toUpperCase()}',
                                    style: TextStyle(
                                      color: _prediction!['color'],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.5,
                                      letterSpacing: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: (_prediction!['color'] as Color).withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: (_prediction!['color'] as Color).withValues(alpha: 0.3)),
                                ),
                                child: Text(
                                  _prediction!['isQualified'] ? 'QUALIFIED' : 'NOT QUALIFIED',
                                  style: TextStyle(
                                    color: _prediction!['color'],
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Predicted Rank (AIR)',
                                    style: TextStyle(
                                      color: context.textSecondaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    _prediction!['predictedAir'],
                                    style: AppTheme.timerStyle(fontSize: 32, color: _prediction!['color']),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                          Divider(height: 1, color: context.isDarkMode ? Colors.white12 : Colors.black12),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _isRealGateExam ? 'Real Exam Marks:' : 'Equivalent GATE Marks:',
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: context.textSecondaryColor),
                              ),
                              Text(
                                "${(_prediction!['scaledMarks'] as double).toStringAsFixed(1)} / 100",
                                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: _prediction!['color']),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _isRealGateExam
                                ? "Mode: Real GATE Exam (Direct 1.0x Response Sheet)"
                                : "Difficulty scaling: ${_prediction!['multiplier']}x ($sourceDisplay)",
                            style: TextStyle(fontSize: 10, color: context.textSecondaryColor, fontStyle: FontStyle.italic),
                          ),
                          const SizedBox(height: 12),
                          NeuContainer(
                            isRecessed: true,
                            borderRadius: 12,
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              _prediction!['message'],
                              style: TextStyle(fontSize: 12.5, height: 1.45, color: context.textColor),
                            ),
                          ),
                          const SizedBox(height: 14),
                          NeuButton(
                            isPrimary: false,
                            borderRadius: 14,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            onPressed: () {
                              HapticFeedback.selectionClick();
                              setState(() {
                                _hasPredicted = false;
                              });
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.refresh_rounded, size: 16),
                                SizedBox(width: 8),
                                Text(
                                  'Adjust Marks & Recalculate',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ] else ...[
                    NeuContainer(
                      borderRadius: 18,
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          const NeuIconTile(
                            icon: Icons.lightbulb_outline_rounded,
                            iconColor: AppTheme.accentGold,
                            size: 44,
                            iconSize: 22,
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ready to Predict Your Rank',
                                  style: AppTheme.poppinsBold(fontSize: 14, color: context.textColor),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  _isRealGateExam
                                      ? 'Enter your raw marks from official GATE response key to calculate rank based on standard bell curves.'
                                      : 'Set your mock marks above and tap "Predict Mock AIR" to calculate your rank with coaching difficulty weights.',
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
      ),
    );
  }
}
