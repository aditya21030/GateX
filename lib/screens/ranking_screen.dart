import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../providers/auth_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/neu_widgets.dart';
import 'score_estimator_screen.dart';
import 'mock_tracker_screen.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({super.key});

  @override
  State<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedPeriodIndex = 0; // 0: Weekly, 1: Monthly, 2: All-Time

  final List<String> _periods = ['Weekly', 'Monthly', 'All-Time'];

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

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);

    final pyqs = provider.pyqs;
    final int solvedCount = pyqs.where((p) => p.isCompleted).length;
    final int totalPyqs = pyqs.isNotEmpty ? pyqs.length : 1;

    // Accuracy calculation
    int correctCount = 0;
    for (var p in pyqs.where((p) => p.isCompleted && p.userAnswer != null)) {
      if (p.isAnswerCorrect(p.userAnswer)) correctCount++;
    }
    final double accuracy = solvedCount > 0 ? (correctCount / solvedCount) * 100 : 0.0;

    // Mock logs calculation
    final mockLogs = provider.mockLogs;
    double avgMockScore = 0.0;
    if (mockLogs.isNotEmpty) {
      avgMockScore = mockLogs.map((m) => m.score).reduce((a, b) => a + b) / mockLogs.length;
    }

    final double userPoints = (avgMockScore * 10) + (solvedCount * 2) + (provider.streak * 5);
    final userName = authProvider.isLoggedIn && authProvider.userName.isNotEmpty
        ? authProvider.userName
        : 'You (Aspirant)';
    final userBranch = provider.activeExam ?? 'DA';

    // Percentile Tier
    String tierTitle = 'Foundation Phase';
    String tierBadge = 'AIR 2,000+';
    Color tierColor = AppTheme.accentMint;

    if (mockLogs.isNotEmpty) {
      if (avgMockScore >= 70) {
        tierTitle = 'Top 1% Potential';
        tierBadge = 'Est. AIR 1 – 150';
        tierColor = AppTheme.accentGold;
      } else if (avgMockScore >= 55) {
        tierTitle = 'Top 5% Potential';
        tierBadge = 'Est. AIR 150 – 600';
        tierColor = AppTheme.secondary;
      } else if (avgMockScore >= 40) {
        tierTitle = 'Top 15% Potential';
        tierBadge = 'Est. AIR 600 – 2,000';
        tierColor = AppTheme.accentFlame;
      } else {
        tierTitle = 'Qualifying Range';
        tierBadge = 'Est. AIR 2,000 – 6,000';
        tierColor = AppTheme.accentCoral;
      }
    }

    final peers = _getPeersForPeriod(_selectedPeriodIndex, userPoints, userName, userBranch);
    final int userRank = peers.indexWhere((p) => p.isCurrentUser) + 1;

    return Scaffold(
      backgroundColor: context.scaffoldBackground,
      appBar: AppBar(
        title: const Text('Leaderboard & Standing'),
        elevation: 0,
        backgroundColor: context.scaffoldBackground,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppTheme.primary,
          indicatorWeight: 3,
          labelColor: AppTheme.primary,
          unselectedLabelColor: context.textSecondaryColor,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          tabs: const [
            Tab(icon: Icon(Icons.emoji_events_rounded, size: 20), text: 'Leaderboard'),
            Tab(icon: Icon(Icons.analytics_rounded, size: 20), text: 'AIR Standing'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const BouncingScrollPhysics(),
        children: [
          // TAB 1: ALL-INDIA LEADERBOARD & PODIUM
          _buildLeaderboardTab(context, peers, userRank, userPoints),

          // TAB 2: PERSONAL PERFORMANCE & AIR DIAGNOSTICS
          _buildDiagnosticsTab(
            context: context,
            provider: provider,
            tierTitle: tierTitle,
            tierBadge: tierBadge,
            tierColor: tierColor,
            solvedCount: solvedCount,
            totalPyqs: totalPyqs,
            accuracy: accuracy,
            mockLogs: mockLogs,
            avgMockScore: avgMockScore,
          ),
        ],
      ),
    );
  }

  // ==========================================
  // TAB 1: LEADERBOARD & PODIUM (Neumorphic)
  // ==========================================
  Widget _buildLeaderboardTab(
    BuildContext context,
    List<_LeaderboardPeer> peers,
    int userRank,
    double userPoints,
  ) {
    final top1 = peers.isNotEmpty ? peers[0] : null;
    final top2 = peers.length > 1 ? peers[1] : null;
    final top3 = peers.length > 2 ? peers[2] : null;
    final otherPeers = peers.length > 3 ? peers.sublist(3) : <_LeaderboardPeer>[];

    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 90),
          physics: const BouncingScrollPhysics(),
          children: [
            // Segmented Switcher (Recessed Neumorphic Pill)
            NeuContainer(
              isRecessed: true,
              borderRadius: 24,
              padding: const EdgeInsets.all(4),
              child: Row(
                children: List.generate(_periods.length, (idx) {
                  final isSelected = _selectedPeriodIndex == idx;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedPeriodIndex = idx),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected ? AppTheme.accentPurple : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: AppTheme.accentPurple.withValues(alpha: 0.35),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  )
                                ]
                              : null,
                        ),
                        child: Text(
                          _periods[idx],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Colors.white : context.textSecondaryColor,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 22),

            // Top 3 Podium Pillars
            if (top1 != null && top2 != null && top3 != null) ...[
              SizedBox(
                height: 220,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Rank 2 (Silver)
                    Expanded(
                      child: _buildPodiumPillar(
                        context: context,
                        peer: top2,
                        rank: 2,
                        podiumHeight: 125,
                        medalColor: const Color(0xFFC0C0C0),
                        accentColor: Colors.blueGrey,
                      ),
                    ),
                    const SizedBox(width: 8),

                    // Rank 1 (Gold - Elevated)
                    Expanded(
                      child: _buildPodiumPillar(
                        context: context,
                        peer: top1,
                        rank: 1,
                        podiumHeight: 160,
                        medalColor: const Color(0xFFFFD700),
                        accentColor: AppTheme.accentGold,
                        isFirst: true,
                      ),
                    ),
                    const SizedBox(width: 8),

                    // Rank 3 (Bronze)
                    Expanded(
                      child: _buildPodiumPillar(
                        context: context,
                        peer: top3,
                        rank: 3,
                        podiumHeight: 105,
                        medalColor: const Color(0xFFCD7F32),
                        accentColor: Colors.brown.shade300,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],

            // Ranked List
            ...otherPeers.asMap().entries.map((entry) {
              final rank = entry.key + 4;
              final peer = entry.value;
              return _buildRankTile(context, peer, rank);
            }),
          ],
        ),

        // Sticky "Your Standing" Floating Card
        Positioned(
          left: 16,
          right: 16,
          bottom: 12,
          child: NeuContainer(
            borderRadius: 20,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Row(
              children: [
                NeuContainer(
                  borderRadius: 12,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  color: AppTheme.accentPurple,
                  child: Text(
                    '#$userRank',
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Your Standing',
                        style: AppTheme.poppinsBold(fontSize: 13, color: context.textColor),
                      ),
                      Text(
                        '${userPoints.toStringAsFixed(0)} Pts • GATE 2027',
                        style: TextStyle(color: context.textSecondaryColor, fontSize: 10.5),
                      ),
                    ],
                  ),
                ),
                NeuButton(
                  isPrimary: true,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  borderRadius: 12,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const MockTrackerScreen()));
                  },
                  child: const Text('Climb 🚀', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Neumorphic Podium Pillar
  Widget _buildPodiumPillar({
    required BuildContext context,
    required _LeaderboardPeer peer,
    required int rank,
    required double podiumHeight,
    required Color medalColor,
    required Color accentColor,
    bool isFirst = false,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (isFirst)
          const Padding(
            padding: EdgeInsets.only(bottom: 2),
            child: Icon(Icons.workspace_premium_rounded, color: AppTheme.accentGold, size: 24),
          ),
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            NeuContainer(
              width: isFirst ? 50 : 42,
              height: isFirst ? 50 : 42,
              borderRadius: isFirst ? 25 : 21,
              padding: EdgeInsets.zero,
              alignment: Alignment.center,
              child: Text(
                peer.initials,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: isFirst ? 15 : 12, color: accentColor),
              ),
            ),
            Positioned(
              bottom: -5,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                decoration: BoxDecoration(color: medalColor, borderRadius: BorderRadius.circular(8)),
                child: Text('#$rank', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 9)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          peer.name.split(' ').first,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: isFirst ? 12 : 11, color: context.textColor),
        ),
        const SizedBox(height: 4),

        // Extruded Step Pillar
        NeuContainer(
          height: podiumHeight,
          width: double.infinity,
          borderRadius: 18,
          padding: const EdgeInsets.symmetric(vertical: 8),
          color: isFirst ? AppTheme.accentPurple.withValues(alpha: 0.12) : null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                peer.points.toStringAsFixed(0),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: isFirst ? 16 : 13,
                  color: isFirst ? AppTheme.accentGold : context.textColor,
                ),
              ),
              const Text('PTS', style: TextStyle(fontSize: 8.5, color: AppTheme.textSecondary, fontWeight: FontWeight.bold)),
              if (peer.streak > 0) ...[
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.local_fire_department_rounded, color: AppTheme.accentFlame, size: 10),
                    Text('${peer.streak}d', style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: AppTheme.accentFlame)),
                  ],
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  // Neumorphic Rank Row
  Widget _buildRankTile(BuildContext context, _LeaderboardPeer peer, int rank) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: NeuContainer(
        borderRadius: 16,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Row(
          children: [
            SizedBox(
              width: 24,
              child: Text(
                rank < 10 ? '0$rank' : '$rank',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: peer.isCurrentUser ? AppTheme.primary : context.textSecondaryColor),
              ),
            ),
            NeuContainer(
              width: 32,
              height: 32,
              borderRadius: 16,
              padding: EdgeInsets.zero,
              alignment: Alignment.center,
              child: Text(peer.initials, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: context.textColor)),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          peer.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: context.textColor),
                        ),
                      ),
                      if (peer.isCurrentUser) ...[
                        const SizedBox(width: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                          decoration: BoxDecoration(color: AppTheme.primary, borderRadius: BorderRadius.circular(4)),
                          child: const Text('YOU', style: TextStyle(color: Colors.white, fontSize: 7, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ],
                  ),
                  Text('🔥 ${peer.streak}d  •  ${peer.branch}', style: TextStyle(fontSize: 9.5, color: context.textSecondaryColor)),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${peer.points.toStringAsFixed(0)} pts',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.accentGold),
                ),
                Text(
                  peer.trend >= 0 ? '+${peer.trend}' : '${peer.trend}',
                  style: TextStyle(fontSize: 9.5, fontWeight: FontWeight.bold, color: peer.trend >= 0 ? AppTheme.accentMint : AppTheme.accentCoral),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================
  // TAB 2: AIR STANDING (Concise & Neumorphic)
  // ==========================================
  Widget _buildDiagnosticsTab({
    required BuildContext context,
    required AppProvider provider,
    required String tierTitle,
    required String tierBadge,
    required Color tierColor,
    required int solvedCount,
    required int totalPyqs,
    required double accuracy,
    required List<dynamic> mockLogs,
    required double avgMockScore,
  }) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. NEUMORPHIC TIER HERO
          NeuContainer(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                NeuIconTile(
                  icon: Icons.emoji_events_rounded,
                  iconColor: tierColor,
                  size: 50,
                  iconSize: 26,
                ),
                const SizedBox(height: 12),
                Text(
                  tierTitle,
                  style: AppTheme.poppinsBold(fontSize: 18, color: context.textColor),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                    color: tierColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    tierBadge,
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: tierColor),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // 2. BENCHMARKS GRID (2x2)
          Text(
            'BENCHMARKS',
            style: TextStyle(color: context.textSecondaryColor, fontSize: 10.5, fontWeight: FontWeight.bold, letterSpacing: 1.0),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _buildNeuMetricCard(
                  context: context,
                  icon: Icons.local_fire_department_rounded,
                  iconColor: AppTheme.accentFlame,
                  value: '${provider.streak} Days',
                  label: 'Study Streak',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildNeuMetricCard(
                  context: context,
                  icon: Icons.check_circle_rounded,
                  iconColor: AppTheme.accentMint,
                  value: '$solvedCount / $totalPyqs',
                  label: 'PYQs Solved',
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _buildNeuMetricCard(
                  context: context,
                  icon: Icons.track_changes_rounded,
                  iconColor: tierColor,
                  value: solvedCount > 0 ? '${accuracy.toStringAsFixed(0)}%' : 'N/A',
                  label: 'Accuracy',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildNeuMetricCard(
                  context: context,
                  icon: Icons.bar_chart_rounded,
                  iconColor: AppTheme.accentCyan,
                  value: mockLogs.isNotEmpty ? avgMockScore.toStringAsFixed(1) : 'No Mocks',
                  label: 'Mock Average',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 3. TARGET MILESTONES (Minimal checkmarks)
          NeuContainer(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.stars_rounded, color: AppTheme.accentGold, size: 18),
                    const SizedBox(width: 6),
                    Text('Target Milestones (AIR < 500)', style: AppTheme.poppinsBold(fontSize: 13, color: context.textColor)),
                  ],
                ),
                const SizedBox(height: 12),
                _buildMilestone(context, 'Solve all 2024–2026 PYQs', solvedCount >= 100),
                const SizedBox(height: 8),
                _buildMilestone(context, 'Accuracy > 75% on practice', accuracy >= 75),
                const SizedBox(height: 8),
                _buildMilestone(context, 'Attempt 5+ CBT Mocks', mockLogs.length >= 5),
                const SizedBox(height: 8),
                _buildMilestone(context, 'Clear all Error Log entries', provider.errorLog.isEmpty),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // 4. ACTION BUTTONS
          Row(
            children: [
              Expanded(
                child: NeuButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ScoreEstimatorScreen())),
                  child: const Text('Estimator', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: NeuButton(
                  isPrimary: true,
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MockTrackerScreen())),
                  child: const Text('Take Mock', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNeuMetricCard({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String value,
    required String label,
  }) {
    return NeuContainer(
      padding: const EdgeInsets.all(12),
      borderRadius: 18,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NeuIconTile(icon: icon, iconColor: iconColor, size: 30, iconSize: 16),
          const SizedBox(height: 8),
          Text(value, style: AppTheme.timerStyle(fontSize: 15, color: context.textColor)),
          const SizedBox(height: 1),
          Text(label, style: TextStyle(fontSize: 10.5, color: context.textSecondaryColor, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildMilestone(BuildContext context, String text, bool done) {
    return Row(
      children: [
        Icon(done ? Icons.check_circle_rounded : Icons.radio_button_unchecked, color: done ? AppTheme.accentMint : context.textSecondaryColor, size: 16),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 11.5,
              color: done ? context.textColor : context.textSecondaryColor,
              decoration: done ? TextDecoration.lineThrough : null,
            ),
          ),
        ),
      ],
    );
  }

  List<_LeaderboardPeer> _getPeersForPeriod(
    int periodIndex,
    double userPoints,
    String userName,
    String userBranch,
  ) {
    final double mult = periodIndex == 0 ? 1.0 : (periodIndex == 1 ? 2.8 : 6.5);
    final userAdjPoints = userPoints * mult;

    final basePeers = [
      _LeaderboardPeer(name: 'Ananya Iyer', branch: 'DA', points: 940 * mult, streak: 28, trend: 2),
      _LeaderboardPeer(name: 'Rohit Sharma', branch: 'CSIT', points: 895 * mult, streak: 21, trend: 1),
      _LeaderboardPeer(name: 'Kavita R.', branch: 'DA', points: 850 * mult, streak: 19, trend: -1),
      _LeaderboardPeer(name: 'Devansh Patel', branch: 'DA', points: 790 * mult, streak: 14, trend: 3),
      _LeaderboardPeer(name: 'Sneha Roy', branch: 'CSIT', points: 740 * mult, streak: 12, trend: 0),
      _LeaderboardPeer(name: 'Arjun Verma', branch: 'DA', points: 680 * mult, streak: 10, trend: -2),
      _LeaderboardPeer(name: 'Tanvi Nair', branch: 'CSIT', points: 610 * mult, streak: 8, trend: 1),
      _LeaderboardPeer(name: 'Harsh Gupta', branch: 'DA', points: 550 * mult, streak: 7, trend: 2),
      _LeaderboardPeer(name: 'Pooja Reddy', branch: 'DA', points: 490 * mult, streak: 5, trend: -1),
      _LeaderboardPeer(name: 'Siddharth Sen', branch: 'CSIT', points: 410 * mult, streak: 4, trend: 0),
    ];

    final userPeer = _LeaderboardPeer(
      name: userName,
      branch: userBranch,
      points: userAdjPoints > 0 ? userAdjPoints : 150 * mult,
      streak: 5,
      trend: 1,
      isCurrentUser: true,
    );

    final all = [...basePeers, userPeer];
    all.sort((a, b) => b.points.compareTo(a.points));
    return all;
  }
}

class _LeaderboardPeer {
  final String name;
  final String branch;
  final double points;
  final int streak;
  final int trend;
  final bool isCurrentUser;

  _LeaderboardPeer({
    required this.name,
    required this.branch,
    required this.points,
    required this.streak,
    required this.trend,
    this.isCurrentUser = false,
  });

  String get initials {
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return name.isNotEmpty ? name[0].toUpperCase() : 'A';
  }
}
