class SubjectNote {
  final String id;
  final String title;
  final String branch; // 'DA', 'CSIT', or 'BOTH'
  final String subtitle;
  final String iconKey;
  final List<NoteSection> freeSections;
  final List<ProNoteSection> proSections;

  const SubjectNote({
    required this.id,
    required this.title,
    required this.branch,
    required this.subtitle,
    required this.iconKey,
    required this.freeSections,
    required this.proSections,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'branch': branch,
      'subtitle': subtitle,
      'iconKey': iconKey,
      'freeSections': freeSections.map((s) => s.toMap()).toList(),
      'proSections': proSections.map((s) => s.toMap()).toList(),
    };
  }

  factory SubjectNote.fromMap(Map<String, dynamic> map) {
    return SubjectNote(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      branch: map['branch'] ?? 'DA',
      subtitle: map['subtitle'] ?? '',
      iconKey: map['iconKey'] ?? 'functions',
      freeSections: (map['freeSections'] as List? ?? [])
          .map((s) => NoteSection.fromMap(Map<String, dynamic>.from(s as Map)))
          .toList(),
      proSections: (map['proSections'] as List? ?? [])
          .map((s) => ProNoteSection.fromMap(Map<String, dynamic>.from(s as Map)))
          .toList(),
    );
  }
}

class NoteSection {
  final String title;
  final String summary;
  final List<String> keyPoints;
  final List<String> coreFormulas;

  const NoteSection({
    required this.title,
    required this.summary,
    required this.keyPoints,
    required this.coreFormulas,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'summary': summary,
      'keyPoints': keyPoints,
      'coreFormulas': coreFormulas,
    };
  }

  factory NoteSection.fromMap(Map<String, dynamic> map) {
    return NoteSection(
      title: map['title'] ?? '',
      summary: map['summary'] ?? '',
      keyPoints: List<String>.from(map['keyPoints'] ?? []),
      coreFormulas: List<String>.from(map['coreFormulas'] ?? []),
    );
  }
}

class ProNoteSection {
  final String title;
  final String inDepthTheory;
  final List<String> examTraps;
  final String solvedExample;
  final List<String> shortcutTips;

  const ProNoteSection({
    required this.title,
    required this.inDepthTheory,
    required this.examTraps,
    required this.solvedExample,
    required this.shortcutTips,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'inDepthTheory': inDepthTheory,
      'examTraps': examTraps,
      'solvedExample': solvedExample,
      'shortcutTips': shortcutTips,
    };
  }

  factory ProNoteSection.fromMap(Map<String, dynamic> map) {
    return ProNoteSection(
      title: map['title'] ?? '',
      inDepthTheory: map['inDepthTheory'] ?? '',
      examTraps: List<String>.from(map['examTraps'] ?? []),
      solvedExample: map['solvedExample'] ?? '',
      shortcutTips: List<String>.from(map['shortcutTips'] ?? []),
    );
  }
}
