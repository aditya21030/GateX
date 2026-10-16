import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../theme/app_theme.dart';

class COAPScreen extends StatefulWidget {
  const COAPScreen({super.key});

  @override
  State<COAPScreen> createState() => _COAPScreenState();
}

class _COAPScreenState extends State<COAPScreen> {
  final List<Map<String, dynamic>> _daCutoffs = [
    {
      'institute': 'IISc Bangalore',
      'program': 'M.Tech Artificial Intelligence',
      'rank': 'Under AIR 100',
      'score': '800+',
      'color': Colors.blue,
    },
    {
      'institute': 'IIT Bombay',
      'program': 'M.Tech Data Science (C-MinDS)',
      'rank': 'Under AIR 150',
      'score': '750+',
      'color': Colors.amber,
    },
    {
      'institute': 'IIT Madras',
      'program': 'M.Tech Data Science & AI',
      'rank': 'Under AIR 200',
      'score': '720+',
      'color': AppTheme.success,
    },
    {
      'institute': 'IIT Delhi',
      'program': 'M.Tech MINDS',
      'rank': 'Under AIR 250',
      'score': '700+',
      'color': Colors.orange,
    },
    {
      'institute': 'IIT Kanpur',
      'program': 'M.Tech Artificial Intelligence',
      'rank': 'Under AIR 300',
      'score': '680+',
      'color': Colors.teal,
    },
    {
      'institute': 'IIT Kharagpur',
      'program': 'M.Tech Artificial Intelligence',
      'rank': 'Under AIR 350',
      'score': '650+',
      'color': Colors.cyan,
    },
    {
      'institute': 'IIT Roorkee',
      'program': 'M.Tech DS & AI',
      'rank': 'Under AIR 400',
      'score': '640+',
      'color': Colors.purple,
    },
    {
      'institute': 'IIT Guwahati',
      'program': 'M.Tech Data Science',
      'rank': 'Under AIR 450',
      'score': '620+',
      'color': Colors.indigo,
    },
    {
      'institute': 'IIT Hyderabad',
      'program': 'M.Tech Artificial Intelligence',
      'rank': 'Under AIR 500',
      'score': '600+',
      'color': Colors.pink,
    },
  ];

  final List<Map<String, dynamic>> _csitCutoffs = [
    {
      'institute': 'IISc Bangalore',
      'program': 'M.Tech CSA',
      'rank': 'Under AIR 50',
      'score': '850+',
      'color': Colors.blue,
    },
    {
      'institute': 'IIT Bombay',
      'program': 'M.Tech CSE',
      'rank': 'Under AIR 70',
      'score': '800+',
      'color': Colors.amber,
    },
    {
      'institute': 'IIT Madras',
      'program': 'M.Tech CSE',
      'rank': 'Under AIR 120',
      'score': '780+',
      'color': AppTheme.success,
    },
    {
      'institute': 'IIT Delhi',
      'program': 'M.Tech CSE',
      'rank': 'Under AIR 150',
      'score': '760+',
      'color': Colors.orange,
    },
    {
      'institute': 'IIT Kanpur',
      'program': 'M.Tech CSE',
      'rank': 'Under AIR 200',
      'score': '730+',
      'color': Colors.teal,
    },
    {
      'institute': 'IIT Kharagpur',
      'program': 'M.Tech CSE',
      'rank': 'Under AIR 250',
      'score': '710+',
      'color': Colors.cyan,
    },
    {
      'institute': 'IIT Roorkee',
      'program': 'M.Tech CSE',
      'rank': 'Under AIR 300',
      'score': '690+',
      'color': Colors.purple,
    },
    {
      'institute': 'IIT Guwahati',
      'program': 'M.Tech CSE',
      'rank': 'Under AIR 350',
      'score': '670+',
      'color': Colors.indigo,
    },
    {
      'institute': 'IIT Hyderabad',
      'program': 'M.Tech CSE',
      'rank': 'Under AIR 400',
      'score': '650+',
      'color': Colors.pink,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final isCSIT = provider.activeExam == 'CSIT';
    final currentCutoffs = isCSIT ? _csitCutoffs : _daCutoffs;

    return Scaffold(
      appBar: AppBar(
        title: Text('COAP 2026 Cutoff Matrix (${provider.activeExam})'),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.background,
              AppTheme.surface.withOpacity(0.5),
            ],
          ),
        ),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeaderCard(),
                    const SizedBox(height: 24),
                    Text(
                      '2026 Student Placements (Gen Category)',
                      style: AppTheme.poppinsBold(fontSize: 18),
                    ),
                    const SizedBox(height: 16),
                    ...currentCutoffs.map((cutoff) => _buildCutoffCard(cutoff)).toList(),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFF1E3A8A), Color(0xFF312E81)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppTheme.textPrimary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.analytics_outlined, color: AppTheme.textPrimary, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'GATE 2026 COAP Results',
                      style: AppTheme.poppinsBold(fontSize: 16, color: AppTheme.textPrimary),
                    ),
                    const Text(
                      'Actual M.Tech Offers for Top Rankers',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'The following records show the actual IIT and M.Tech program secured by students in the 2026 COAP rounds, along with their corresponding ranks and GATE scores.',
            style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.4),
          ),
        ],
      ),
    );
  }

  Widget _buildCutoffCard(Map<String, dynamic> cutoff) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cutoff['color'].withOpacity(0.3), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: cutoff['color'].withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 2,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    cutoff['institute'],
                    style: AppTheme.poppinsBold(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: cutoff['color'].withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    cutoff['score'],
                    style: TextStyle(
                      color: cutoff['color'],
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              cutoff['program'],
              style: const TextStyle(color: AppTheme.textSecondary, fontSize: 13),
            ),
            const SizedBox(height: 16),
            const Divider(color: Colors.white10, height: 1),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.military_tech_outlined, size: 18, color: AppTheme.secondary),
                const SizedBox(width: 8),
                Text(
                  'Secured at Rank: ',
                  style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12),
                ),
                Text(
                  cutoff['rank'],
                  style: const TextStyle(color: AppTheme.textPrimary, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
