import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/neu_widgets.dart';

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
      'rank': 'Under AIR 180',
      'score': '740+',
      'color': Colors.teal,
    },
    {
      'institute': 'IIT Kharagpur',
      'program': 'M.Tech CSE',
      'rank': 'Under AIR 220',
      'score': '720+',
      'color': Colors.cyan,
    },
    {
      'institute': 'IIT Roorkee',
      'program': 'M.Tech CSE',
      'rank': 'Under AIR 280',
      'score': '700+',
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
      backgroundColor: context.scaffoldBackground,
      appBar: AppBar(
        title: Text(
          'COAP Cutoff Matrix (${provider.activeExam})',
          style: AppTheme.poppinsBold(fontSize: 17, color: context.textColor),
        ),
        backgroundColor: context.scaffoldBackground,
        elevation: 0,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        children: [
          _buildHeaderCard(),
          const SizedBox(height: 18),
          Text(
            'Target IIT Placements (General)',
            style: AppTheme.poppinsBold(fontSize: 16, color: context.textColor),
          ),
          const SizedBox(height: 12),
          ...currentCutoffs.map((cutoff) => _buildCutoffCard(cutoff)),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildHeaderCard() {
    return NeuContainer(
      borderRadius: 20,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const NeuIconTile(
            icon: Icons.account_balance_rounded,
            iconColor: AppTheme.primary,
            size: 46,
            iconSize: 24,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'COAP Admission Insights',
                  style: AppTheme.poppinsBold(fontSize: 14, color: context.textColor),
                ),
                const SizedBox(height: 4),
                Text(
                  'Historical admission cutoffs across IISc and top IITs based on candidate ranks & scores.',
                  style: TextStyle(color: context.textSecondaryColor, fontSize: 11.5, height: 1.3),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCutoffCard(Map<String, dynamic> cutoff) {
    final color = cutoff['color'] as Color;
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
                  style: AppTheme.poppinsBold(fontSize: 15, color: context.textColor),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  cutoff['score'],
                  style: TextStyle(
                    color: color,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            cutoff['program'],
            style: TextStyle(color: context.textSecondaryColor, fontSize: 12.5),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.military_tech_outlined, size: 16, color: AppTheme.secondary),
              const SizedBox(width: 6),
              Text(
                'Secured at Rank: ',
                style: TextStyle(color: context.textSecondaryColor, fontSize: 11.5),
              ),
              Text(
                cutoff['rank'],
                style: TextStyle(color: context.textColor, fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
