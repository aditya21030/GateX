class TopicStatus {
  final String topicName;
  final String subjectName;
  final bool isCompleted;
  final String note;
  final String difficulty; // Easy, Medium, Hard
  final bool inRevisionQueue;
  final bool inErrorLog;
  final DateTime? dateAddedToRevision;
  final DateTime? lastRevisedDate;

  final bool conceptWatched;
  final bool pyqSolved;
  final bool revisedOnce;

  TopicStatus({
    required this.topicName,
    required this.subjectName,
    this.isCompleted = false,
    this.conceptWatched = false,
    this.pyqSolved = false,
    this.revisedOnce = false,
    this.note = '',
    this.difficulty = 'Medium',
    this.inRevisionQueue = false,
    this.inErrorLog = false,
    this.dateAddedToRevision,
    this.lastRevisedDate,
  });

  TopicStatus copyWith({
    String? topicName,
    String? subjectName,
    bool? isCompleted,
    bool? conceptWatched,
    bool? pyqSolved,
    bool? revisedOnce,
    String? note,
    String? difficulty,
    bool? inRevisionQueue,
    bool? inErrorLog,
    DateTime? dateAddedToRevision,
    DateTime? lastRevisedDate,
  }) {
    return TopicStatus(
      topicName: topicName ?? this.topicName,
      subjectName: subjectName ?? this.subjectName,
      isCompleted: isCompleted ?? this.isCompleted,
      conceptWatched: conceptWatched ?? this.conceptWatched,
      pyqSolved: pyqSolved ?? this.pyqSolved,
      revisedOnce: revisedOnce ?? this.revisedOnce,
      note: note ?? this.note,
      difficulty: difficulty ?? this.difficulty,
      inRevisionQueue: inRevisionQueue ?? this.inRevisionQueue,
      inErrorLog: inErrorLog ?? this.inErrorLog,
      dateAddedToRevision: dateAddedToRevision ?? this.dateAddedToRevision,
      lastRevisedDate: lastRevisedDate ?? this.lastRevisedDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'topicName': topicName,
      'subjectName': subjectName,
      'isCompleted': isCompleted,
      'conceptWatched': conceptWatched,
      'pyqSolved': pyqSolved,
      'revisedOnce': revisedOnce,
      'note': note,
      'difficulty': difficulty,
      'inRevisionQueue': inRevisionQueue,
      'inErrorLog': inErrorLog,
      'dateAddedToRevision': dateAddedToRevision?.toIso8601String(),
      'lastRevisedDate': lastRevisedDate?.toIso8601String(),
    };
  }

  factory TopicStatus.fromMap(Map<dynamic, dynamic> map) {
    final isDone = map['isCompleted'] ?? false;
    return TopicStatus(
      topicName: map['topicName'] ?? '',
      subjectName: map['subjectName'] ?? '',
      isCompleted: isDone,
      conceptWatched: map['conceptWatched'] ?? isDone,
      pyqSolved: map['pyqSolved'] ?? isDone,
      revisedOnce: map['revisedOnce'] ?? isDone,
      note: map['note'] ?? '',
      difficulty: map['difficulty'] ?? 'Medium',
      inRevisionQueue: map['inRevisionQueue'] ?? false,
      inErrorLog: map['inErrorLog'] ?? false,
      dateAddedToRevision: map['dateAddedToRevision'] != null
          ? DateTime.tryParse(map['dateAddedToRevision'])
          : null,
      lastRevisedDate: map['lastRevisedDate'] != null
          ? DateTime.tryParse(map['lastRevisedDate'])
          : null,
    );
  }
}

class PYQ {
  final String id;
  final String subject;
  final String topic;
  final String questionText;
  final List<String> options; // Empty for NAT
  final String correctAnswer;
  final bool isMCQ; // true = MCQ/MSQ, false = NAT
  final String type; // 'MCQ', 'MSQ', 'NAT'
  final String explanation;
  final int year;
  final int? setNumber; // Optional set number for exams with multiple sets
  final String difficulty; // Easy, Medium, Hard
  final bool isBookmarked;
  final bool isCompleted;
  final bool isFlaggedForRevision;
  final String? userAnswer;
  final bool hasImage;
  final String? imagePath;

  PYQ({
    required this.id,
    required this.subject,
    required this.topic,
    required this.questionText,
    required this.options,
    required this.correctAnswer,
    required this.isMCQ,
    this.type = 'MCQ',
    required this.explanation,
    required this.year,
    this.setNumber,
    required this.difficulty,
    this.isBookmarked = false,
    this.isCompleted = false,
    this.isFlaggedForRevision = false,
    this.userAnswer,
    this.hasImage = false,
    this.imagePath,
  });

  bool isAnswerCorrect(String? uAns) {
    if (uAns == null || uAns.trim().isEmpty) return false;
    final cleanUser = uAns.trim().toLowerCase();
    final cleanCorrect = correctAnswer.trim().toLowerCase();

    if (type == 'NAT') {
      // If correct answer contains " to "
      if (cleanCorrect.contains(' to ')) {
        final parts = cleanCorrect.split(' to ');
        if (parts.length == 2) {
          final double? lower = double.tryParse(parts[0].trim());
          final double? upper = double.tryParse(parts[1].trim());
          final double? userVal = double.tryParse(cleanUser);
          if (lower != null && upper != null && userVal != null) {
            return userVal >= lower && userVal <= upper;
          }
        }
      }
      final double? userNum = double.tryParse(cleanUser);
      final double? correctNum = double.tryParse(cleanCorrect);
      if (userNum != null && correctNum != null) {
        return (userNum - correctNum).abs() < 0.05;
      }
      return cleanUser == cleanCorrect;
    } else if (type == 'MSQ') {
      final uSet = cleanUser.split(';').map((s) => s.trim()).toSet();
      final cSet = cleanCorrect.split(';').map((s) => s.trim()).toSet();
      return uSet.length == cSet.length && uSet.containsAll(cSet);
    } else {
      // MCQ
      return cleanUser.toUpperCase() == cleanCorrect.toUpperCase();
    }
  }

  PYQ copyWith({
    String? id,
    String? subject,
    String? topic,
    String? questionText,
    List<String>? options,
    String? correctAnswer,
    bool? isMCQ,
    String? type,
    String? explanation,
    int? year,
    String? difficulty,
    bool? isBookmarked,
    bool? isCompleted,
    bool? isFlaggedForRevision,
    String? userAnswer,
    bool clearUserAnswer = false,
    bool? hasImage,
    String? imagePath,
    int? setNumber,
  }) {
    return PYQ(
      id: id ?? this.id,
      subject: subject ?? this.subject,
      topic: topic ?? this.topic,
      questionText: questionText ?? this.questionText,
      options: options ?? this.options,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      isMCQ: isMCQ ?? this.isMCQ,
      type: type ?? this.type,
      explanation: explanation ?? this.explanation,
      year: year ?? this.year,
      setNumber: setNumber ?? this.setNumber,
      difficulty: difficulty ?? this.difficulty,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      isCompleted: isCompleted ?? this.isCompleted,
      isFlaggedForRevision: isFlaggedForRevision ?? this.isFlaggedForRevision,
      userAnswer: clearUserAnswer ? null : (userAnswer ?? this.userAnswer),
      hasImage: hasImage ?? this.hasImage,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'subject': subject,
      'topic': topic,
      'questionText': questionText,
      'options': options,
      'correctAnswer': correctAnswer,
      'isMCQ': isMCQ,
      'type': type,
      'explanation': explanation,
      'year': year,
      'setNumber': setNumber,
      'difficulty': difficulty,
      'isBookmarked': isBookmarked,
      'isCompleted': isCompleted,
      'isFlaggedForRevision': isFlaggedForRevision,
      'userAnswer': userAnswer,
      'hasImage': hasImage,
      'imagePath': imagePath,
    };
  }

  factory PYQ.fromMap(Map<dynamic, dynamic> map) {
    final isMcqVal = map['isMCQ'] ?? true;
    return PYQ(
      id: map['id'] ?? '',
      subject: map['subject'] ?? '',
      topic: map['topic'] ?? '',
      questionText: map['questionText'] ?? '',
      options: List<String>.from(map['options'] ?? []),
      correctAnswer: map['correctAnswer'] ?? '',
      isMCQ: isMcqVal,
      type: map['type'] ?? (isMcqVal ? 'MCQ' : 'NAT'),
      explanation: map['explanation'] ?? '',
      year: map['year'] ?? 2024,
      setNumber: map['setNumber'],
      difficulty: map['difficulty'] ?? 'Medium',
      isBookmarked: map['isBookmarked'] ?? false,
      isCompleted: map['isCompleted'] ?? false,
      isFlaggedForRevision: map['isFlaggedForRevision'] ?? false,
      userAnswer: map['userAnswer'],
      hasImage: map['hasImage'] ?? false,
      imagePath: map['imagePath'],
    );
  }
}

class ErrorLogEntry {
  final String id;
  final String subject;
  final String topic;
  final String questionText;
  final String whyWrong;
  final DateTime dateAdded;
  final bool isRevised;
  final String? userAnswer;
  final String? correctAnswer;
  final String? explanation;

  ErrorLogEntry({
    required this.id,
    required this.subject,
    required this.topic,
    required this.questionText,
    required this.whyWrong,
    required this.dateAdded,
    this.isRevised = false,
    this.userAnswer,
    this.correctAnswer,
    this.explanation,
  });

  ErrorLogEntry copyWith({
    String? id,
    String? subject,
    String? topic,
    String? questionText,
    String? whyWrong,
    DateTime? dateAdded,
    bool? isRevised,
    String? userAnswer,
    String? correctAnswer,
    String? explanation,
  }) {
    return ErrorLogEntry(
      id: id ?? this.id,
      subject: subject ?? this.subject,
      topic: topic ?? this.topic,
      questionText: questionText ?? this.questionText,
      whyWrong: whyWrong ?? this.whyWrong,
      dateAdded: dateAdded ?? this.dateAdded,
      isRevised: isRevised ?? this.isRevised,
      userAnswer: userAnswer ?? this.userAnswer,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      explanation: explanation ?? this.explanation,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'subject': subject,
      'topic': topic,
      'questionText': questionText,
      'whyWrong': whyWrong,
      'dateAdded': dateAdded.toIso8601String(),
      'isRevised': isRevised,
      if (userAnswer != null) 'userAnswer': userAnswer,
      if (correctAnswer != null) 'correctAnswer': correctAnswer,
      if (explanation != null) 'explanation': explanation,
    };
  }

  factory ErrorLogEntry.fromMap(Map<dynamic, dynamic> map) {
    return ErrorLogEntry(
      id: map['id'] ?? '',
      subject: map['subject'] ?? '',
      topic: map['topic'] ?? '',
      questionText: map['questionText'] ?? '',
      whyWrong: map['whyWrong'] ?? '',
      dateAdded: map['dateAdded'] != null
          ? DateTime.parse(map['dateAdded'])
          : DateTime.now(),
      isRevised: map['isRevised'] ?? false,
      userAnswer: map['userAnswer'],
      correctAnswer: map['correctAnswer'],
      explanation: map['explanation'],
    );
  }
}

class MockTestLog {
  final String id;
  final String name;
  final DateTime dateTaken;
  final double score;
  final List<String> weakSubjects;
  final String notes;

  MockTestLog({
    required this.id,
    required this.name,
    required this.dateTaken,
    required this.score,
    required this.weakSubjects,
    required this.notes,
  });

  MockTestLog copyWith({
    String? id,
    String? name,
    DateTime? dateTaken,
    double? score,
    List<String>? weakSubjects,
    String? notes,
  }) {
    return MockTestLog(
      id: id ?? this.id,
      name: name ?? this.name,
      dateTaken: dateTaken ?? this.dateTaken,
      score: score ?? this.score,
      weakSubjects: weakSubjects ?? this.weakSubjects,
      notes: notes ?? this.notes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'dateTaken': dateTaken.toIso8601String(),
      'score': score,
      'weakSubjects': weakSubjects,
      'notes': notes,
    };
  }

  factory MockTestLog.fromMap(Map<dynamic, dynamic> map) {
    return MockTestLog(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      dateTaken: map['dateTaken'] != null
          ? DateTime.parse(map['dateTaken'])
          : DateTime.now(),
      score: (map['score'] as num?)?.toDouble() ?? 0.0,
      weakSubjects: List<String>.from(map['weakSubjects'] ?? []),
      notes: map['notes'] ?? '',
    );
  }
}

class RevisionItem {
  final String id;
  final String topic;
  final String subject;
  final DateTime dateFlagged;
  final DateTime? lastRevised;

  RevisionItem({
    required this.id,
    required this.topic,
    required this.subject,
    required this.dateFlagged,
    this.lastRevised,
  });

  // Dynamically calculate priority based on days since flagged or last revised
  String get priority {
    final referenceDate = lastRevised ?? dateFlagged;
    final daysElapsed = DateTime.now().difference(referenceDate).inDays;
    if (daysElapsed >= 7) return 'High';
    if (daysElapsed >= 3) return 'Medium';
    return 'Low';
  }

  RevisionItem copyWith({
    String? id,
    String? topic,
    String? subject,
    DateTime? dateFlagged,
    DateTime? lastRevised,
  }) {
    return RevisionItem(
      id: id ?? this.id,
      topic: topic ?? this.topic,
      subject: subject ?? this.subject,
      dateFlagged: dateFlagged ?? this.dateFlagged,
      lastRevised: lastRevised ?? this.lastRevised,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'topic': topic,
      'subject': subject,
      'dateFlagged': dateFlagged.toIso8601String(),
      'lastRevised': lastRevised?.toIso8601String(),
    };
  }

  factory RevisionItem.fromMap(Map<dynamic, dynamic> map) {
    return RevisionItem(
      id: map['id'] ?? '',
      topic: map['topic'] ?? '',
      subject: map['subject'] ?? '',
      dateFlagged: map['dateFlagged'] != null
          ? DateTime.parse(map['dateFlagged'])
          : DateTime.now(),
      lastRevised: map['lastRevised'] != null
          ? DateTime.parse(map['lastRevised'])
          : null,
    );
  }
}
