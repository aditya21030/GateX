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
}
