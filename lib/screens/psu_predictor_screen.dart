import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/neu_widgets.dart';
import '../services/ad_service.dart';

class PsuOpportunity {
  final String psuName;
  final String designation;
  final String categoryTag; // 'Maharatna', 'Navratna', 'R&D / Defence', 'Premier'
  final String ctcRange;
  final Map<String, int> cutoffs; // Category -> Minimum expected cutoff score
  final String selectionProcess;
  final List<String> branches; // ['DA', 'CSIT']
  final String location;
  final IconData icon;

  const PsuOpportunity({
    required this.psuName,
    required this.designation,
    required this.categoryTag,
    required this.ctcRange,
    required this.cutoffs,
    required this.selectionProcess,
    required this.branches,
    required this.location,
    required this.icon,
  });
}

class PsuPredictorScreen extends StatefulWidget {
  final String? initialBranch;
  final String? initialCategory;
  final double? initialGateScore;

  const PsuPredictorScreen({
    super.key,
    this.initialBranch,
    this.initialCategory,
    this.initialGateScore,
  });

  @override
  State<PsuPredictorScreen> createState() => _PsuPredictorScreenState();
}

class _PsuPredictorScreenState extends State<PsuPredictorScreen> {
  late String _selectedBranch; // 'DA' or 'CSIT'
  String _selectedCategory = 'GEN'; // 'GEN', 'OBC-NCL', 'EWS', 'SC/ST/PwD'
  double _gateScore = 720.0;
  String _selectedFilter = 'ALL'; // 'ALL', 'HIGH', 'TARGET', 'REACH'
  String _searchQuery = '';

  bool _isPredicting = false;
  bool _hasPredicted = false;

  static const List<PsuOpportunity> _allOpportunities = [
    // 1. ONGC
    PsuOpportunity(
      psuName: 'ONGC',
      designation: 'AEE (Programming & Data Analytics)',
      categoryTag: 'Maharatna',
      ctcRange: '₹22 – 24 LPA',
      cutoffs: {'GEN': 730, 'OBC-NCL': 680, 'EWS': 690, 'SC/ST/PwD': 510},
      selectionProcess: 'GATE Score (60%) + Interview (25%) + Academic Qualification (15%)',
      branches: ['DA'],
      location: 'Dehradun / Delhi / Pan-India',
      icon: Icons.local_gas_station_rounded,
    ),
    PsuOpportunity(
      psuName: 'ONGC',
      designation: 'AEE (Programming / Computer Science)',
      categoryTag: 'Maharatna',
      ctcRange: '₹22 – 24 LPA',
      cutoffs: {'GEN': 760, 'OBC-NCL': 710, 'EWS': 720, 'SC/ST/PwD': 540},
      selectionProcess: 'GATE Score (60%) + Interview (25%) + Academic Qualification (15%)',
      branches: ['CSIT'],
      location: 'Dehradun / Delhi / Pan-India',
      icon: Icons.local_gas_station_rounded,
    ),

    // 2. IOCL
    PsuOpportunity(
      psuName: 'IOCL',
      designation: 'Research Officer (AI & Analytics)',
      categoryTag: 'Maharatna',
      ctcRange: '₹18 – 21 LPA',
      cutoffs: {'GEN': 710, 'OBC-NCL': 660, 'EWS': 670, 'SC/ST/PwD': 490},
      selectionProcess: 'GATE Score Shortlist (1:5) + Group Discussion + Personal Interview',
      branches: ['DA'],
      location: 'Faridabad R&D / New Delhi',
      icon: Icons.oil_barrel_rounded,
    ),
    PsuOpportunity(
      psuName: 'IOCL',
      designation: 'Officers / Engineers (Information Systems)',
      categoryTag: 'Maharatna',
      ctcRange: '₹17 – 20 LPA',
      cutoffs: {'GEN': 740, 'OBC-NCL': 690, 'EWS': 700, 'SC/ST/PwD': 520},
      selectionProcess: 'GATE Score Shortlist (1:5) + Group Discussion + Personal Interview',
      branches: ['CSIT'],
      location: 'Pan-India Refineries & Head Office',
      icon: Icons.oil_barrel_rounded,
    ),

    // 3. BARC
    PsuOpportunity(
      psuName: 'BARC',
      designation: 'Scientific Officer (AI & High-Performance Computing)',
      categoryTag: 'R&D / Premier',
      ctcRange: '₹18 – 21 LPA',
      cutoffs: {'GEN': 700, 'OBC-NCL': 650, 'EWS': 660, 'SC/ST/PwD': 480},
      selectionProcess: 'Direct GATE Shortlist -> Rigorous Technical Interview (100% on Interview)',
      branches: ['DA'],
      location: 'Trombay, Mumbai',
      icon: Icons.science_rounded,
    ),
    PsuOpportunity(
      psuName: 'BARC',
      designation: 'Scientific Officer (OCES/DGFS - Computer Science)',
      categoryTag: 'R&D / Premier',
      ctcRange: '₹18 – 21 LPA',
      cutoffs: {'GEN': 725, 'OBC-NCL': 675, 'EWS': 685, 'SC/ST/PwD': 490},
      selectionProcess: 'Direct GATE Shortlist -> Rigorous Technical Interview (100% on Interview)',
      branches: ['CSIT'],
      location: 'Trombay, Mumbai',
      icon: Icons.science_rounded,
    ),

    // 4. DRDO
    PsuOpportunity(
      psuName: 'DRDO',
      designation: "Scientist 'B' (Artificial Intelligence & ML - CAIR)",
      categoryTag: 'Defence / R&D',
      ctcRange: '₹16 – 19 LPA',
      cutoffs: {'GEN': 715, 'OBC-NCL': 665, 'EWS': 675, 'SC/ST/PwD': 495},
      selectionProcess: 'GATE Score Shortlist (1:10) + Personal Interview (Min 70% in PI for General)',
      branches: ['DA'],
      location: 'Bengaluru / Delhi / Hyderabad',
      icon: Icons.shield_rounded,
    ),
    PsuOpportunity(
      psuName: 'DRDO',
      designation: "Scientist 'B' (Computer Science & Cyber Security)",
      categoryTag: 'Defence / R&D',
      ctcRange: '₹16 – 19 LPA',
      cutoffs: {'GEN': 730, 'OBC-NCL': 680, 'EWS': 690, 'SC/ST/PwD': 500},
      selectionProcess: 'GATE Score Shortlist (1:10) + Personal Interview (Min 70% in PI for General)',
      branches: ['CSIT'],
      location: 'Bengaluru / Delhi / Hyderabad',
      icon: Icons.shield_rounded,
    ),

    // 5. GAIL
    PsuOpportunity(
      psuName: 'GAIL',
      designation: 'Executive Trainee (Data Analytics & Operations)',
      categoryTag: 'Maharatna',
      ctcRange: '₹18 – 21 LPA',
      cutoffs: {'GEN': 695, 'OBC-NCL': 645, 'EWS': 655, 'SC/ST/PwD': 475},
      selectionProcess: 'GATE Score (85%) + Group Discussion (5%) + Personal Interview (10%)',
      branches: ['DA'],
      location: 'New Delhi / Noida',
      icon: Icons.factory_rounded,
    ),
    PsuOpportunity(
      psuName: 'GAIL',
      designation: 'Executive Trainee (BIS / IT)',
      categoryTag: 'Maharatna',
      ctcRange: '₹18 – 21 LPA',
      cutoffs: {'GEN': 715, 'OBC-NCL': 665, 'EWS': 675, 'SC/ST/PwD': 485},
      selectionProcess: 'GATE Score (85%) + Group Discussion (5%) + Personal Interview (10%)',
      branches: ['CSIT'],
      location: 'New Delhi / Noida',
      icon: Icons.factory_rounded,
    ),

    // 6. NTPC
    PsuOpportunity(
      psuName: 'NTPC',
      designation: 'Executive Trainee (Big Data & Predictive Maintenance)',
      categoryTag: 'Maharatna',
      ctcRange: '₹16 – 18 LPA',
      cutoffs: {'GEN': 685, 'OBC-NCL': 635, 'EWS': 645, 'SC/ST/PwD': 465},
      selectionProcess: 'GATE Score (85%) + Group Discussion (5%) + Personal Interview (10%)',
      branches: ['DA'],
      location: 'New Delhi / Power Plants',
      icon: Icons.bolt_rounded,
    ),
    PsuOpportunity(
      psuName: 'NTPC',
      designation: 'Executive Trainee (IT / Enterprise Systems)',
      categoryTag: 'Maharatna',
      ctcRange: '₹16 – 18 LPA',
      cutoffs: {'GEN': 710, 'OBC-NCL': 660, 'EWS': 670, 'SC/ST/PwD': 480},
      selectionProcess: 'GATE Score (85%) + Group Discussion (5%) + Personal Interview (10%)',
      branches: ['CSIT'],
      location: 'New Delhi / Power Plants',
      icon: Icons.bolt_rounded,
    ),

    // 7. PowerGrid
    PsuOpportunity(
      psuName: 'PowerGrid',
      designation: 'Executive Trainee (Smart Grid Analytics / DS)',
      categoryTag: 'Maharatna',
      ctcRange: '₹18 – 21 LPA',
      cutoffs: {'GEN': 690, 'OBC-NCL': 640, 'EWS': 650, 'SC/ST/PwD': 470},
      selectionProcess: 'GATE Score (85%) + Group Discussion (3%) + Personal Interview (12%)',
      branches: ['DA'],
      location: 'Gurugram / Regional HQs',
      icon: Icons.electric_bolt_rounded,
    ),
    PsuOpportunity(
      psuName: 'PowerGrid',
      designation: 'Executive Trainee (Computer Science)',
      categoryTag: 'Maharatna',
      ctcRange: '₹18 – 21 LPA',
      cutoffs: {'GEN': 720, 'OBC-NCL': 670, 'EWS': 680, 'SC/ST/PwD': 490},
      selectionProcess: 'GATE Score (85%) + Group Discussion (3%) + Personal Interview (12%)',
      branches: ['CSIT'],
      location: 'Gurugram / Regional HQs',
      icon: Icons.electric_bolt_rounded,
    ),

    // 8. BIS
    PsuOpportunity(
      psuName: 'BIS',
      designation: "Scientist 'B' (Data Analytics & Standardization)",
      categoryTag: 'Central Govt',
      ctcRange: '₹15 – 18 LPA',
      cutoffs: {'GEN': 675, 'OBC-NCL': 625, 'EWS': 635, 'SC/ST/PwD': 450},
      selectionProcess: 'GATE Score (85%) + Personal Interview (15%)',
      branches: ['DA'],
      location: 'New Delhi / Regional Labs',
      icon: Icons.verified_user_rounded,
    ),
    PsuOpportunity(
      psuName: 'BIS',
      designation: "Scientist 'B' (Computer Engineering)",
      categoryTag: 'Central Govt',
      ctcRange: '₹15 – 18 LPA',
      cutoffs: {'GEN': 690, 'OBC-NCL': 640, 'EWS': 650, 'SC/ST/PwD': 460},
      selectionProcess: 'GATE Score (85%) + Personal Interview (15%)',
      branches: ['CSIT'],
      location: 'New Delhi / Regional Labs',
      icon: Icons.verified_user_rounded,
    ),

    // 9. BEL
    PsuOpportunity(
      psuName: 'BEL',
      designation: 'Probationary Engineer (AI & Computer Vision)',
      categoryTag: 'Navratna',
      ctcRange: '₹12 – 15 LPA',
      cutoffs: {'GEN': 650, 'OBC-NCL': 600, 'EWS': 610, 'SC/ST/PwD': 430},
      selectionProcess: 'GATE Score (85%) + Personal Interview (15%)',
      branches: ['DA'],
      location: 'Bengaluru / Ghaziabad / Hyderabad',
      icon: Icons.memory_rounded,
    ),
    PsuOpportunity(
      psuName: 'BEL',
      designation: 'Probationary Engineer (Computer Science)',
      categoryTag: 'Navratna',
      ctcRange: '₹12 – 15 LPA',
      cutoffs: {'GEN': 660, 'OBC-NCL': 610, 'EWS': 620, 'SC/ST/PwD': 440},
      selectionProcess: 'GATE Score (85%) + Personal Interview (15%)',
      branches: ['CSIT'],
      location: 'Bengaluru / Ghaziabad / Hyderabad',
      icon: Icons.memory_rounded,
    ),

    // 10. CRIS
    PsuOpportunity(
      psuName: 'CRIS / Railways',
      designation: 'Assistant Software / Data Engineer',
      categoryTag: 'Autonomous Govt',
      ctcRange: '₹15 – 18 LPA',
      cutoffs: {'GEN': 660, 'OBC-NCL': 610, 'EWS': 620, 'SC/ST/PwD': 440},
      selectionProcess: '100% Direct GATE Score Merit Selection',
      branches: ['DA'],
      location: 'Chanakyapuri, New Delhi',
      icon: Icons.train_rounded,
    ),
    PsuOpportunity(
      psuName: 'CRIS / Railways',
      designation: 'Assistant Software Engineer (IT)',
      categoryTag: 'Autonomous Govt',
      ctcRange: '₹15 – 18 LPA',
      cutoffs: {'GEN': 680, 'OBC-NCL': 630, 'EWS': 640, 'SC/ST/PwD': 450},
      selectionProcess: '100% Direct GATE Score Merit Selection',
      branches: ['CSIT'],
      location: 'Chanakyapuri, New Delhi',
      icon: Icons.train_rounded,
    ),

    // 11. POSOCO (CSIT Only)
    PsuOpportunity(
      psuName: 'Grid-India (POSOCO)',
      designation: 'Assistant Manager (IT & Cyber Security)',
      categoryTag: 'Miniratna',
      ctcRange: '₹17 – 19 LPA',
      cutoffs: {'GEN': 705, 'OBC-NCL': 655, 'EWS': 665, 'SC/ST/PwD': 470},
      selectionProcess: 'GATE Score (85%) + GD (3%) + Personal Interview (12%)',
      branches: ['CSIT'],
      location: 'New Delhi / Regional Load Despatch Centres',
      icon: Icons.hub_rounded,
    ),

    // 12. NIC (CSIT Only)
    PsuOpportunity(
      psuName: 'NIC',
      designation: "Scientist 'B' (Information Technology)",
      categoryTag: 'Premier Govt',
      ctcRange: '₹14 – 17 LPA',
      cutoffs: {'GEN': 670, 'OBC-NCL': 620, 'EWS': 630, 'SC/ST/PwD': 450},
      selectionProcess: 'GATE Score Shortlist + Personal Interview',
      branches: ['CSIT'],
      location: 'New Delhi & State Centers',
      icon: Icons.cloud_done_rounded,
    ),

    // 13. NPCIL (CSIT Only)
    PsuOpportunity(
      psuName: 'NPCIL',
      designation: 'Executive Trainee (Computer Engineering)',
      categoryTag: 'Premier PSU',
      ctcRange: '₹17 – 20 LPA',
      cutoffs: {'GEN': 700, 'OBC-NCL': 650, 'EWS': 660, 'SC/ST/PwD': 470},
      selectionProcess: 'GATE Score Shortlist (1:12) + Rigorous Interview (100% on Interview)',
      branches: ['CSIT'],
      location: 'Mumbai / Nuclear Station Sites',
      icon: Icons.circle_notifications_rounded,
    ),
  ];

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<AppProvider>(context, listen: false);
    _selectedBranch = widget.initialBranch ?? ((provider.activeExam == 'CSIT') ? 'CSIT' : 'DA');
    if (widget.initialCategory != null) {
      _selectedCategory = widget.initialCategory!;
    }
    if (widget.initialGateScore != null) {
      _gateScore = widget.initialGateScore!;
      _hasPredicted = true;
    } else if (provider.estimatedGateScore > 0) {
      _gateScore = provider.estimatedGateScore;
    }
  }

  String _getChance(int cutoff) {
    if (_gateScore >= cutoff + 15) return 'HIGH';
    if (_gateScore >= cutoff - 15) return 'TARGET';
    return 'REACH';
  }

  void _showScoreDialog() {
    final textController = TextEditingController(text: _gateScore.round().toString());
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: context.scaffoldBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text('Enter GATE Score', style: AppTheme.poppinsBold(fontSize: 16, color: context.textColor)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your official or predicted GATE score (0 – 1000):',
              style: TextStyle(fontSize: 12, color: context.textSecondaryColor),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: textController,
              keyboardType: TextInputType.number,
              autofocus: true,
              style: AppTheme.timerStyle(fontSize: 24, color: AppTheme.accentPurple),
              decoration: InputDecoration(
                labelText: 'Score (out of 1000)',
                hintText: 'e.g. 740',
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
              if (val != null && val >= 0.0 && val <= 1000.0) {
                setState(() {
                  _gateScore = val;
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

    void finish() {
      if (mounted) {
        setState(() {
          _hasPredicted = true;
          _isPredicting = false;
        });
        HapticFeedback.heavyImpact();
      }
    }

    if (!provider.isPro) {
      AdService().showInterstitialAd(
        onDismissed: () {
          finish();
        },
      );
    } else {
      Future.delayed(const Duration(milliseconds: 300), () {
        finish();
      });
    }
  }

  void _showPsuDetailsSheet(PsuOpportunity psu, int cutoff, String chance) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.scaffoldBackground,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(22))),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppTheme.accentPurple.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(psu.icon, color: AppTheme.accentPurple, size: 28),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        psu.psuName,
                        style: AppTheme.poppinsBold(fontSize: 18, color: context.textColor),
                      ),
                      Text(
                        psu.categoryTag,
                        style: TextStyle(color: context.textSecondaryColor, fontSize: 11.5, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close_rounded, color: context.textSecondaryColor),
                  onPressed: () => Navigator.pop(ctx),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Divider(color: context.isDarkMode ? Colors.white12 : Colors.black12, height: 1),
            const SizedBox(height: 14),

            _buildDetailRow(context, 'Role / Post:', psu.designation),
            _buildDetailRow(context, 'Annual CTC:', psu.ctcRange),
            _buildDetailRow(context, 'Base Location:', psu.location),
            _buildDetailRow(context, '$_selectedCategory Cutoff:', '$cutoff Score'),
            _buildDetailRow(context, 'Shortlist Status:', chance == 'HIGH' ? '🟢 High Chance' : (chance == 'TARGET' ? '🟡 Target / Interview Call' : '🔴 Reach')),
            const SizedBox(height: 12),
            Text(
              'Selection Process',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.5, color: context.textColor),
            ),
            const SizedBox(height: 4),
            Text(
              psu.selectionProcess,
              style: TextStyle(fontSize: 12, height: 1.4, color: context.textSecondaryColor),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 12, color: context.textSecondaryColor)),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold, color: context.textColor),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Filter opportunities by branch and category
    final branchOpportunities = _allOpportunities.where((psu) => psu.branches.contains(_selectedBranch)).toList();

    // Counts
    int highCount = 0;
    int targetCount = 0;
    int reachCount = 0;

    for (final psu in branchOpportunities) {
      final cutoff = psu.cutoffs[_selectedCategory] ?? psu.cutoffs['GEN'] ?? 700;
      final ch = _getChance(cutoff);
      if (ch == 'HIGH') highCount++;
      if (ch == 'TARGET') targetCount++;
      if (ch == 'REACH') reachCount++;
    }

    final filteredList = branchOpportunities.where((psu) {
      final cutoff = psu.cutoffs[_selectedCategory] ?? psu.cutoffs['GEN'] ?? 700;
      final ch = _getChance(cutoff);

      if (_selectedFilter == 'HIGH' && ch != 'HIGH') return false;
      if (_selectedFilter == 'TARGET' && ch != 'TARGET') return false;
      if (_selectedFilter == 'REACH' && ch != 'REACH') return false;

      if (_searchQuery.isNotEmpty) {
        final q = _searchQuery.toLowerCase();
        final matchesName = psu.psuName.toLowerCase().contains(q);
        final matchesRole = psu.designation.toLowerCase().contains(q);
        final matchesTag = psu.categoryTag.toLowerCase().contains(q);
        if (!matchesName && !matchesRole && !matchesTag) return false;
      }
      return true;
    }).toList();

    return Scaffold(
      backgroundColor: context.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('PSU Eligibility Predictor', style: AppTheme.poppinsBold(fontSize: 16, color: context.textColor)),
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
                  'Predict PSU Recruitment Calls',
                  style: AppTheme.poppinsBold(fontSize: 18, color: context.textColor),
                ),
                const SizedBox(height: 4),
                Text(
                  'Cutoffs, CTC, and shortlisting chances for GATE $_selectedBranch recruitment',
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

                // 2. INPUT CARD (Category & GATE Score)
                NeuContainer(
                  borderRadius: 20,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Category Selector
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
                                  color: isSelected ? AppTheme.accentPurple : context.colorSurfaceElevated,
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

                      // Score Header & Input
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Your GATE Score (0 – 1000)',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: context.textColor),
                          ),
                          GestureDetector(
                            onTap: _showScoreDialog,
                            child: NeuContainer(
                              borderRadius: 10,
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '${_gateScore.round()}',
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
                        value: _gateScore.clamp(0.0, 1000.0),
                        min: 0.0,
                        max: 1000.0,
                        divisions: 200,
                        activeColor: AppTheme.accentPurple,
                        label: '${_gateScore.round()}',
                        onChanged: (val) {
                          setState(() {
                            _gateScore = val;
                            if (_hasPredicted) _hasPredicted = false;
                          });
                        },
                      ),
                      const SizedBox(height: 16),

                      // Predict Button
                      NeuButton(
                        isPrimary: true,
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
                                    'Filtering PSU Cutoffs...',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5, color: Colors.white),
                                  ),
                                ],
                              )
                            : const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.corporate_fare_rounded, size: 18, color: Colors.white),
                                  SizedBox(width: 8),
                                  Text(
                                    'Predict Eligible PSUs',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
                                  ),
                                ],
                              ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // 3. PSU PREDICTION RESULTS
                if (_hasPredicted) ...[
                  // Summary Banner
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppTheme.accentPurple.withValues(alpha: 0.15),
                          const Color(0xFF06B6D4).withValues(alpha: 0.12),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppTheme.accentPurple.withValues(alpha: 0.25)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppTheme.accentPurple,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.analytics_rounded, color: Colors.white, size: 20),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Gate Score: ${_gateScore.round()} • $_selectedCategory',
                                style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 13.5, color: context.textColor),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                '$highCount High Chance • $targetCount Target Interview • $reachCount Reach',
                                style: TextStyle(color: context.textSecondaryColor, fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Search Bar
                  TextField(
                    onChanged: (val) => setState(() => _searchQuery = val.trim()),
                    decoration: InputDecoration(
                      hintText: 'Search PSU by name or role...',
                      hintStyle: TextStyle(fontSize: 12.5, color: context.textSecondaryColor),
                      prefixIcon: Icon(Icons.search_rounded, size: 20, color: context.textSecondaryColor),
                      filled: true,
                      fillColor: context.colorSurfaceElevated,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: context.colorBorder),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: context.colorBorder),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Filter Pills (ALL, HIGH, TARGET, REACH)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: [
                        _buildFilterPill('ALL', 'All (${branchOpportunities.length})'),
                        _buildFilterPill('HIGH', 'High Chance ($highCount)'),
                        _buildFilterPill('TARGET', 'Target ($targetCount)'),
                        _buildFilterPill('REACH', 'Reach ($reachCount)'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),

                  // PSU Cards List
                  if (filteredList.isEmpty) ...[
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Text(
                          'No PSUs match this filter.',
                          style: TextStyle(color: context.textSecondaryColor, fontSize: 13),
                        ),
                      ),
                    ),
                  ] else ...[
                    ...filteredList.map((psu) {
                      final cutoff = psu.cutoffs[_selectedCategory] ?? psu.cutoffs['GEN'] ?? 700;
                      final chance = _getChance(cutoff);

                      Color tagColor;
                      String chanceLabel;
                      if (chance == 'HIGH') {
                        tagColor = AppTheme.success;
                        chanceLabel = 'High Chance';
                      } else if (chance == 'TARGET') {
                        tagColor = Colors.amber;
                        chanceLabel = 'Target Call';
                      } else {
                        tagColor = AppTheme.error;
                        chanceLabel = 'Reach';
                      }

                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: GestureDetector(
                          onTap: () {
                            HapticFeedback.selectionClick();
                            _showPsuDetailsSheet(psu, cutoff, chance);
                          },
                          child: NeuContainer(
                            borderRadius: 18,
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 44,
                                      height: 44,
                                      decoration: BoxDecoration(
                                        color: AppTheme.accentPurple.withValues(alpha: 0.10),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Icon(psu.icon, color: AppTheme.accentPurple, size: 24),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                psu.psuName,
                                                style: AppTheme.poppinsBold(fontSize: 15, color: context.textColor),
                                              ),
                                              Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                                decoration: BoxDecoration(
                                                  color: tagColor.withValues(alpha: 0.15),
                                                  borderRadius: BorderRadius.circular(8),
                                                  border: Border.all(color: tagColor.withValues(alpha: 0.3)),
                                                ),
                                                child: Text(
                                                  chanceLabel,
                                                  style: TextStyle(
                                                    color: tagColor,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            psu.designation,
                                            style: TextStyle(
                                              color: context.textColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Divider(color: context.isDarkMode ? Colors.white12 : Colors.black12, height: 1),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.currency_rupee_rounded, size: 14, color: context.textSecondaryColor),
                                        Text(
                                          psu.ctcRange,
                                          style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold, color: context.textColor),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Cutoff: ',
                                          style: TextStyle(fontSize: 11, color: context.textSecondaryColor),
                                        ),
                                        Text(
                                          '$cutoff',
                                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: tagColor),
                                        ),
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
                                        psu.categoryTag,
                                        style: TextStyle(fontSize: 9.5, color: context.textSecondaryColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ] else ...[
                  NeuContainer(
                    borderRadius: 18,
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const NeuIconTile(
                          icon: Icons.corporate_fare_rounded,
                          iconColor: AppTheme.accentMint,
                          size: 44,
                          iconSize: 22,
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'PSU Calls for $_selectedBranch Candidates',
                                style: AppTheme.poppinsBold(fontSize: 14, color: context.textColor),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                'Set your GATE score above and tap "Predict Eligible PSUs" to view cutoffs and shortlisting opportunities across top Maharatnas and Navratnas.',
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

  Widget _buildFilterPill(String key, String label) {
    final isSelected = _selectedFilter == key;
    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        setState(() => _selectedFilter = key);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.accentPurple : context.colorSurfaceElevated,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: isSelected ? AppTheme.accentPurple : context.colorBorder),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 11.5,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            color: isSelected ? Colors.white : context.textColor,
          ),
        ),
      ),
    );
  }
}
