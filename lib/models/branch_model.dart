import 'package:flutter/material.dart';

class BranchConfig {
  final String code; // 'DA', 'CSIT', 'BOTH', 'EC', 'EE', 'ME', 'CE'
  final String title;
  final String subtitle;
  final Color accentColor;
  final IconData icon;
  final bool isAvailable;
  final String badgeText; // 'LIVE', 'COMING NEXT SEASON'
  final List<String> subjects;
  final Map<String, String> weightageMap;

  const BranchConfig({
    required this.code,
    required this.title,
    required this.subtitle,
    required this.accentColor,
    required this.icon,
    this.isAvailable = true,
    this.badgeText = 'LIVE',
    this.subjects = const [],
    this.weightageMap = const {},
  });
}

class BranchRegistry {
  static const List<BranchConfig> allBranches = [
    BranchConfig(
      code: 'DA',
      title: 'GATE DA',
      subtitle: 'Data Science & Artificial Intelligence',
      accentColor: Color(0xFF2962FF),
      icon: Icons.data_object_rounded,
      isAvailable: true,
      badgeText: 'POPULAR',
      subjects: [
        'Probability and Statistics',
        'Linear Algebra',
        'Calculus and Optimization',
        'Machine Learning',
        'AI',
        'Database Management and Warehousing',
        'DSA (Data Structures and Algorithms)',
        'Python (Main Topics Only)',
        'General Aptitude',
      ],
      weightageMap: {
        'Machine Learning': '~18–22 Marks',
        'Probability and Statistics': '~17–20 Marks',
        'General Aptitude': '15 Marks (Fixed)',
        'Linear Algebra': '~11–14 Marks',
        'AI': '~9–12 Marks',
        'Calculus and Optimization': '~9–11 Marks',
        'Database Management and Warehousing': '~7–10 Marks',
        'DSA (Data Structures and Algorithms)': '~5–7 Marks',
        'Python (Main Topics Only)': '~3–5 Marks',
      },
    ),
    BranchConfig(
      code: 'CSIT',
      title: 'GATE CS/IT',
      subtitle: 'Computer Science & Information Technology',
      accentColor: Color(0xFF9C27B0),
      icon: Icons.computer_rounded,
      isAvailable: true,
      badgeText: 'CORE',
      subjects: [
        'Engineering Mathematics',
        'Digital Logic',
        'Computer Organization',
        'Programming & Data Structures',
        'Algorithms',
        'Theory of Computation',
        'Compiler Design',
        'Operating System',
        'Databases',
        'Computer Networks',
        'General Aptitude',
      ],
      weightageMap: {
        'Engineering Mathematics': '~10–13 Marks',
        'Data Structures & Algorithms': '~10–13 Marks',
        'Computer Networks': '~8–11 Marks',
        'Computer Organization': '~8–11 Marks',
        'Theory of Computation': '~8–10 Marks',
        'Operating System': '~8–10 Marks',
        'Databases': '~7–9 Marks',
        'Digital Logic': '~5–7 Marks',
        'Compiler Design': '~4–6 Marks',
        'General Aptitude': '15 Marks (Fixed)',
      },
    ),
    BranchConfig(
      code: 'BOTH',
      title: 'Dual Prep (DA + CSIT)',
      subtitle: 'Combined preparation with overlap mapping',
      accentColor: Color(0xFFFFB300),
      icon: Icons.merge_type_rounded,
      isAvailable: true,
      badgeText: 'DUAL',
      subjects: [],
      weightageMap: {},
    ),
    BranchConfig(
      code: 'EC',
      title: 'GATE ECE',
      subtitle: 'Electronics & Communication Engineering',
      accentColor: Color(0xFF00E676),
      icon: Icons.memory_rounded,
      isAvailable: false,
      badgeText: 'NEXT SEASON',
      subjects: [
        'Engineering Mathematics',
        'Signals and Systems',
        'Electronic Devices',
        'Analog Circuits',
        'Digital Circuits',
        'Control Systems',
        'Communications',
        'Electromagnetics',
        'General Aptitude',
      ],
      weightageMap: {},
    ),
    BranchConfig(
      code: 'EE',
      title: 'GATE EE',
      subtitle: 'Electrical Engineering',
      accentColor: Color(0xFFFF9100),
      icon: Icons.electric_bolt_rounded,
      isAvailable: false,
      badgeText: 'NEXT SEASON',
      subjects: [
        'Engineering Mathematics',
        'Electric Circuits',
        'Electromagnetic Fields',
        'Signals and Systems',
        'Electrical Machines',
        'Power Systems',
        'Control Systems',
        'Electrical and Electronic Measurements',
        'Analog and Digital Electronics',
        'Power Electronics',
        'General Aptitude',
      ],
      weightageMap: {},
    ),
    BranchConfig(
      code: 'ME',
      title: 'GATE ME',
      subtitle: 'Mechanical Engineering',
      accentColor: Color(0xFF00B0FF),
      icon: Icons.precision_manufacturing_rounded,
      isAvailable: false,
      badgeText: 'NEXT SEASON',
      subjects: [
        'Engineering Mathematics',
        'Engineering Mechanics',
        'Mechanics of Materials',
        'Theory of Machines',
        'Vibrations',
        'Machine Design',
        'Fluid Mechanics',
        'Thermodynamics',
        'Heat Transfer',
        'Manufacturing',
        'General Aptitude',
      ],
      weightageMap: {},
    ),
    BranchConfig(
      code: 'CE',
      title: 'GATE CE',
      subtitle: 'Civil Engineering',
      accentColor: Color(0xFF8D6E63),
      icon: Icons.architecture_rounded,
      isAvailable: false,
      badgeText: 'NEXT SEASON',
      subjects: [
        'Engineering Mathematics',
        'Structural Engineering',
        'Geotechnical Engineering',
        'Water Resources Engineering',
        'Environmental Engineering',
        'Transportation Engineering',
        'Geomatics Engineering',
        'General Aptitude',
      ],
      weightageMap: {},
    ),
  ];

  static BranchConfig getBranch(String code) {
    return allBranches.firstWhere(
      (b) => b.code.toUpperCase() == code.toUpperCase(),
      orElse: () => allBranches.first,
    );
  }
}
