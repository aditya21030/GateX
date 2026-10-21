import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/neu_widgets.dart';
import 'coap_screen.dart';

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
  String _targetYearTrend = 'Average Trend';

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
    final multiplier = _coachingMultipliers[source] ?? 1.0;
    final double scaledMarks = (marks * multiplier).clamp(0.0, 100.0);

    List<EstimationNode> nodes;
    double cutoff;
    if (yearTrend == 'GATE 2026') {
      nodes = _nodes2026;
      cutoff = 26.4;
    } else if (yearTrend == 'GATE 2025') {
      nodes = _nodes2025;
      cutoff = 29.0;
    } else if (yearTrend == 'GATE 2024') {
      nodes = _nodes2024;
      cutoff = 37.1;
    } else {
      // Average Trend
      cutoff = 30.8;
      final p2026 = _interpolateNode(scaledMarks, _nodes2026);
      final p2025 = _interpolateNode(scaledMarks, _nodes2025);
      final p2024 = _interpolateNode(scaledMarks, _nodes2024);
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

  Map<String, dynamic> _buildResultMap(double score, int minRank, int maxRank, double marks, double cutoff, double multiplier) {
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

  List<_TableRowData> _buildReferenceRows() {
    if (_targetYearTrend == 'GATE 2026') {
      return [
        _TableRowData('80 – 100', 'AIR 1 – 15', 'High', AppTheme.success),
        _TableRowData('65 – 79', 'AIR 16 – 200', 'High', AppTheme.success),
        _TableRowData('50 – 64', 'AIR 201 – 1100', 'Moderate', AppTheme.secondary),
        _TableRowData('26.4 – 49', 'AIR 1101 – 8500', 'Low', Colors.amber),
        _TableRowData('Below 26.4', 'Not Qualified', 'None', AppTheme.error),
      ];
    } else if (_targetYearTrend == 'GATE 2025') {
      return [
        _TableRowData('80 – 100', 'AIR 1 – 100', 'High', AppTheme.success),
        _TableRowData('65 – 79', 'AIR 101 – 1000', 'High', AppTheme.success),
        _TableRowData('50 – 64', 'AIR 1001 – 4500', 'Moderate', AppTheme.secondary),
        _TableRowData('29.0 – 49', 'AIR 4501 – 16000', 'Low', Colors.amber),
        _TableRowData('Below 29.0', 'Not Qualified', 'None', AppTheme.error),
      ];
    } else if (_targetYearTrend == 'GATE 2024') {
      return [
        _TableRowData('80 – 100', 'AIR 1 – 25', 'High', AppTheme.success),
        _TableRowData('65 – 79', 'AIR 26 – 250', 'High', AppTheme.success),
        _TableRowData('50 – 64', 'AIR 251 – 1500', 'Moderate', AppTheme.secondary),
        _TableRowData('37.1 – 49', 'AIR 1501 – 5500', 'Low', Colors.amber),
        _TableRowData('Below 37.1', 'Not Qualified', 'None', AppTheme.error),
      ];
    } else {
      return [
        _TableRowData('80 – 100', 'AIR 1 – 50', 'High', AppTheme.success),
        _TableRowData('65 – 79', 'AIR 51 – 500', 'High', AppTheme.success),
        _TableRowData('50 – 64', 'AIR 501 – 2000', 'Moderate', AppTheme.secondary),
        _TableRowData('30.8 – 49', 'AIR 2001 – 10000', 'Low', Colors.amber),
        _TableRowData('Below 30.8', 'Not Qualified', 'None', AppTheme.error),
      ];
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

    final prediction = _calculatePrediction(score, source, _targetYearTrend);

    return Scaffold(
      backgroundColor: context.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('AIR Score Estimator', style: AppTheme.poppinsBold(fontSize: 16, color: context.textColor)),
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
                    'Calibrated algorithm with difficulty multipliers and previous year curves',
                    style: TextStyle(color: context.textSecondaryColor, fontSize: 12),
                  ),
                  const SizedBox(height: 16),

                  // 1. INPUT CARD
                  NeuContainer(
                    borderRadius: 20,
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildCustomSelectorCard(
                          context: context,
                          label: 'Which Mock Test did you take?',
                          currentValueDisplay: sourceDisplay,
                          onTap: () => _showMockSourceBottomSheet(provider, source),
                        ),
                        const SizedBox(height: 14),

                        _buildCustomSelectorCard(
                          context: context,
                          label: 'Target GATE Year Trend',
                          currentValueDisplay: trendDisplay,
                          onTap: () => _showYearTrendBottomSheet(_targetYearTrend),
                        ),
                        const SizedBox(height: 20),

                        // Marks slider header
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Mock Marks (out of 100)',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: context.textColor),
                            ),
                            NeuContainer(
                              borderRadius: 10,
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              child: Text(
                                score.toStringAsFixed(0),
                                style: AppTheme.timerStyle(fontSize: 16, color: AppTheme.accentPurple),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        // Slider
                        Slider(
                          value: score,
                          min: 0.0,
                          max: 100.0,
                          divisions: 100,
                          activeColor: AppTheme.accentPurple,
                          label: score.toStringAsFixed(0),
                          onChanged: (val) {
                            provider.setScoreEstimatorScore(val);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 2. OUTPUT CARD
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
                                Icon(Icons.auto_awesome, color: prediction['color'], size: 18),
                                const SizedBox(width: 8),
                                Text(
                                  'IIT CHANCE: ${prediction['iitChance'].toUpperCase()}',
                                  style: TextStyle(
                                    color: prediction['color'],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.5,
                                    letterSpacing: 1.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Estimated Score',
                                    style: TextStyle(color: context.textSecondaryColor, fontSize: 11),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "${prediction['gateScore']} / 1000",
                                    style: AppTheme.timerStyle(fontSize: 22, color: context.textColor),
                                  ),
                                ],
                              ),
                            ),
                            Container(width: 1, height: 40, color: context.isDarkMode ? Colors.white12 : Colors.black12),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Predicted Rank (AIR)',
                                    style: TextStyle(color: context.textSecondaryColor, fontSize: 11),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    prediction['predictedAir'],
                                    style: AppTheme.timerStyle(fontSize: 22, color: prediction['color']),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        Divider(height: 1, color: context.isDarkMode ? Colors.white12 : Colors.black12),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'GATE Equivalent Marks:',
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: context.textSecondaryColor),
                            ),
                            Text(
                              "${prediction['scaledMarks'].toStringAsFixed(1)} / 100",
                              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: prediction['color']),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Difficulty scaling: ${prediction['multiplier']}x ($sourceDisplay)",
                          style: TextStyle(fontSize: 10, color: context.textSecondaryColor, fontStyle: FontStyle.italic),
                        ),
                        const SizedBox(height: 12),
                        NeuContainer(
                          isRecessed: true,
                          borderRadius: 12,
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            prediction['message'],
                            style: TextStyle(fontSize: 12.5, height: 1.45, color: context.textColor),
                          ),
                        ),
                        const SizedBox(height: 14),
                        NeuButton(
                          isPrimary: true,
                          borderRadius: 14,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          onPressed: () {
                            HapticFeedback.selectionClick();
                            final estScore = (prediction['gateScore'] as num).toDouble();
                            provider.setEstimatedGateScore(estScore);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => COAPScreen(
                                  initialGateScore: estScore,
                                  showEligibleOnly: true,
                                ),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.account_balance_rounded, size: 18, color: Colors.white),
                              const SizedBox(width: 8),
                              Text(
                                'Check Eligible IITs/IISc for ${prediction['gateScore']} Score →',
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 3. REFERENCE TABLE
                  Text(
                    'Score-to-Rank Benchmark',
                    style: AppTheme.poppinsBold(fontSize: 15, color: context.textColor),
                  ),
                  const SizedBox(height: 10),
                  _buildReferenceTable(context),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReferenceTable(BuildContext context) {
    final rows = _buildReferenceRows();

    return NeuContainer(
      borderRadius: 18,
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Marks Range',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: context.textSecondaryColor),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Predicted AIR',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: context.textSecondaryColor),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Chance at IIT',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: context.textSecondaryColor),
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: context.isDarkMode ? Colors.white12 : Colors.black12, height: 1),
            // Rows
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: rows.length,
              itemBuilder: (context, index) {
                final row = rows[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          row.score,
                          style: AppTheme.timerStyle(fontSize: 14, color: context.textColor),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          row.rank,
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: row.color),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: row.color.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            row.chance,
                            style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: row.color),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      );
  }
}

class _TableRowData {
  final String score;
  final String rank;
  final String chance;
  final Color color;

  _TableRowData(this.score, this.rank, this.chance, this.color);
}
