import 'dart:async';
import 'package:flutter/material.dart';
import '../models/models.dart';
import '../services/storage_service.dart';
import '../services/cloud_sync_service.dart';
import '../services/notification_service.dart';
import '../services/ad_service.dart';
import '../services/purchase_service.dart';
import '../data/study_plan.dart';
import '../data/csit_study_plan.dart';
import '../data/mock_pyqs.dart';
import '../data/csit_mock_pyqs.dart';

class AppProvider with ChangeNotifier {
  final StorageService _storage = StorageService();
  
  // Navigation
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  // Calendar/Planner
  DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;

  // Database lists
  List<TopicStatus> _topics = [];
  List<TopicStatus> get topics => _topics.where((t) => currentSubjects.contains(t.subjectName)).toList();

  List<PYQ> _pyqs = [];
  List<PYQ> get pyqs => _pyqs.where((p) => _activeExam == 'CSIT' ? (p.id.startsWith('CSIT_') || p.id.startsWith('CS2_')) : p.id.startsWith('pyq_')).toList();

  List<ErrorLogEntry> _errorLog = [];
  List<ErrorLogEntry> get errorLog => _errorLog.where((e) => currentSubjects.contains(e.subject)).toList();

  List<MockTestLog> _mockLogs = [];
  List<MockTestLog> get mockLogs => _mockLogs.where((m) => _activeExam == 'CSIT' ? m.id.contains('csit') : !m.id.contains('csit')).toList();

  List<PYQ> _csitMockQuestions = [];
  List<PYQ> _daMockQuestions = [];
  List<PYQ> get mockQuestions => _activeExam == 'CSIT' 
      ? (_csitMockQuestions.isNotEmpty ? _csitMockQuestions : csitMockQuestions)
      : (_daMockQuestions.isNotEmpty ? _daMockQuestions : daMockQuestions);

  List<RevisionItem> _revisionQueue = [];

  List<RevisionItem> get revisionQueue => _revisionQueue;

  // Study Plan
  List<StudyPlanItem> get currentStudyPlanItems => _activeExam == 'CSIT' ? csitStudyPlanItems : studyPlanItems;

  List<String> get currentSubjects => _activeExam == 'CSIT' 
      ? StorageService.csitSyllabusData.keys.toList() 
      : StorageService.syllabusData.keys.toList();

  // Study Plan Day States (cached from Hive)
  // Maps day number -> { 'isCompleted': bool, 'userNote': String }
  final Map<int, Map<String, dynamic>> _studyPlanDayStates = {};
  Map<int, Map<String, dynamic>> get studyPlanDayStates => _studyPlanDayStates;

  // Streak & Settings
  int _streak = 0;
  int get streak => _streak;
  int get previousStreak => _storage.previousStreak;

  Future<void> restoreStreak() async {
    _streak = await _storage.restoreStreak();
    notifyListeners();
  }
  
  String _notificationTime = '09:00';
  String get notificationTime => _notificationTime;

  bool _notificationsEnabled = true;
  bool get notificationsEnabled => _notificationsEnabled;

  // Theme Selection
  ThemeMode _themeMode = ThemeMode.dark;
  ThemeMode get themeMode => _themeMode;

  Future<void> toggleTheme() async {
    _themeMode = _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    await _storage.prefs.setString('theme_mode', _themeMode.name);
    notifyListeners();
  }

  // Exam Selection
  String? _selectedExam; // e.g. 'DA', 'CSIT', 'BOTH'
  String? get selectedExam => _selectedExam;
  
  String? _activeExam; // e.g. 'DA' or 'CSIT', represents the current view
  String? get activeExam => _activeExam;

  // 90-Day Sprint Mode (Peak 3-Month Exam Prep)
  bool _isSprintMode = true;
  bool get isSprintMode => _isSprintMode;

  Future<void> toggleSprintMode() async {
    _isSprintMode = !_isSprintMode;
    await _storage.prefs.setBool('is_sprint_mode', _isSprintMode);
    notifyListeners();
  }

  // Generate 10 random high-yield questions for 15-Minute Daily Rapid Fire
  List<PYQ> getDailyRapidFireQuestions() {
    final list = List<PYQ>.from(pyqs);
    list.shuffle();
    return list.take(10).toList();
  }

  // Generate customized Weak-Area / Mistakes Practice Quiz from Error Log
  List<PYQ> generateMistakesQuiz({String? subjectFilter, int maxQuestions = 15}) {
    final relevantErrors = subjectFilter == null || subjectFilter == 'All'
        ? errorLog
        : errorLog.where((e) => e.subject == subjectFilter).toList();

    if (relevantErrors.isEmpty) return [];

    final List<PYQ> quizList = [];
    final Set<String> addedIds = {};

    for (final err in relevantErrors) {
      if (quizList.length >= maxQuestions) break;
      PYQ? matched = _pyqs.where((p) =>
          p.id == err.id ||
          (p.questionText.isNotEmpty && (p.questionText == err.questionText || p.questionText.contains(err.questionText) || err.questionText.contains(p.questionText)))
      ).firstOrNull;

      matched ??= mockQuestions.where((p) =>
          p.id == err.id ||
          (p.questionText.isNotEmpty && (p.questionText == err.questionText || p.questionText.contains(err.questionText) || err.questionText.contains(p.questionText)))
      ).firstOrNull;

      if (matched != null && !addedIds.contains(matched.id)) {
        quizList.add(matched);
        addedIds.add(matched.id);
      } else if (!addedIds.contains(err.id)) {
        final synthesized = PYQ(
          id: err.id.isNotEmpty ? err.id : 'err_${quizList.length + 1}',
          subject: err.subject,
          topic: err.topic,
          questionText: err.questionText,
          options: const [
            'Concept Mastered (Solved Correctly)',
            'Formula Recalled Correctly',
            'Silly Mistake Corrected',
            'Needs Deep Conceptual Revision',
          ],
          correctAnswer: 'Concept Mastered (Solved Correctly)',
          isMCQ: true,
          type: 'MCQ',
          explanation: err.whyWrong.isNotEmpty
              ? 'Your Recorded Mistake Analysis: ${err.whyWrong}'
              : 'Review this concept thoroughly to avoid repeating the error.',
          year: err.dateAdded.year,
          difficulty: 'Hard',
        );
        quizList.add(synthesized);
        addedIds.add(synthesized.id);
      }
    }

    if (quizList.length < maxQuestions) {
      final weakSubjects = relevantErrors.map((e) => e.subject).toSet();
      final extraQuestions = _pyqs.where((p) => weakSubjects.contains(p.subject) && !addedIds.contains(p.id)).toList();
      extraQuestions.shuffle();
      for (final extra in extraQuestions) {
        if (quizList.length >= maxQuestions) break;
        quizList.add(extra);
        addedIds.add(extra.id);
      }
    }

    return quizList;
  }

  // Score Estimator State
  double _estimatorMockScore = 60.0;
  String _estimatorMockSource = 'GO Classes';
  double get estimatorMockScore => _estimatorMockScore;
  String get estimatorMockSource => _estimatorMockSource;

  // GateX Pro Entitlement
  bool get isPro => PurchaseService().isPro;

  Future<void> init() async {
    await _storage.init();
    await _loadData();
    await PurchaseService().init();
    PurchaseService().addListener(notifyListeners);
    
    // Fetch global data in background (do not await)
    syncGlobalData();
  }

  Future<void> _loadData() async {
    // Settings & User Preferences
    _streak = _storage.prefs.getInt('current_streak') ?? 0;
    _notificationTime = _storage.prefs.getString('notification_time') ?? '09:00';
    _notificationsEnabled = _storage.prefs.getBool('notifications_enabled') ?? true;
    _selectedExam = _storage.prefs.getString('selected_exam');
    _activeExam = _storage.prefs.getString('active_exam') ?? (_selectedExam == 'BOTH' ? 'DA' : _selectedExam);
    _isSprintMode = _storage.prefs.getBool('is_sprint_mode') ?? true;

    final themeName = _storage.prefs.getString('theme_mode');
    if (themeName != null) {
      _themeMode = ThemeMode.values.firstWhere((e) => e.name == themeName, orElse: () => ThemeMode.dark);
    }

    // Request notification permissions in background (do not block startup)
    if (_notificationsEnabled) {
      NotificationService().requestPermissions();
    }

    // Load topics
    _topics = _storage.topicStatusBox.values
        .map((m) => TopicStatus.fromMap(Map<dynamic, dynamic>.from(m)))
        .toList();

    // Load PYQs
    _pyqs = _storage.pyqBox.values
        .map((m) => PYQ.fromMap(Map<dynamic, dynamic>.from(m)))
        .toList();
    _pyqs.sort((a, b) {
      if (a.year != b.year) {
        return b.year.compareTo(a.year);
      }
      final aNum = int.tryParse(a.id.split('_').last) ?? 0;
      final bNum = int.tryParse(b.id.split('_').last) ?? 0;
      return aNum.compareTo(bNum);
    });

    // Load Error Log
    _errorLog = _storage.errorLogBox.values
        .map((m) => ErrorLogEntry.fromMap(Map<dynamic, dynamic>.from(m)))
        .toList();

    // Load Mocks
    _mockLogs = _storage.mockTestBox.values
        .map((m) => MockTestLog.fromMap(Map<dynamic, dynamic>.from(m)))
        .toList();
    _mockLogs.sort((a, b) => a.dateTaken.compareTo(b.dateTaken));

    // Load Revision Queue
    _revisionQueue = _storage.revisionQueueBox.values
        .map((m) => RevisionItem.fromMap(Map<dynamic, dynamic>.from(m)))
        .toList();

    // Load Study Plan states
    _studyPlanDayStates.clear();
    for (var key in _storage.studyPlanBox.keys) {
      if (key is int) {
        final val = _storage.studyPlanBox.get(key);
        if (val != null) {
          _studyPlanDayStates[key] = Map<String, dynamic>.from(val);
        }
      }
    }

    notifyListeners();
    _updateScheduledNotifications();
  }

  bool _isSyncingGlobalData = false;
  bool get isSyncingGlobalData => _isSyncingGlobalData;

  Future<void> syncGlobalData() async {
    _isSyncingGlobalData = true;
    notifyListeners();

    try {
      final globalData = await CloudSyncService().fetchGlobalData();
      final fetchedPyqs = globalData['pyqs'] ?? [];
      final fetchedMocks = globalData['mock_tests'] ?? [];
      
      // Update PYQs in Hive
      if (fetchedPyqs.isNotEmpty) {
        for (var pyqMap in fetchedPyqs) {
          final pyq = PYQ.fromMap(pyqMap);
          if (_storage.pyqBox.containsKey(pyq.id)) {
            final existing = Map<dynamic, dynamic>.from(_storage.pyqBox.get(pyq.id));
            final updatedPyq = pyq.copyWith(
              isCompleted: existing['isCompleted'] ?? false,
              userAnswer: existing['userAnswer'],
              isBookmarked: existing['isBookmarked'] ?? false,
              isFlaggedForRevision: existing['isFlaggedForRevision'] ?? false,
            );
            _storage.pyqBox.put(pyq.id, updatedPyq.toMap());
          } else {
            _storage.pyqBox.put(pyq.id, pyq.toMap());
          }
        }
      }

      // Update mock questions logic - we'll just parse them as PYQs
      List<PYQ> cloudDaMocks = [];
      List<PYQ> cloudCsitMocks = [];
      
      if (fetchedMocks.isNotEmpty) {
        for (var pyqMap in fetchedMocks) {
          final pyq = PYQ.fromMap(pyqMap);
          // Assuming ID conventions differentiate them, e.g., da_mock vs csit_mock
          if (pyq.id.toLowerCase().contains('csit')) {
            cloudCsitMocks.add(pyq);
          } else {
            cloudDaMocks.add(pyq);
          }
        }
      }

      // Re-load pyqs into memory
      _pyqs = _storage.pyqBox.values
          .map((m) => PYQ.fromMap(Map<dynamic, dynamic>.from(m)))
          .toList();
      _pyqs.sort((a, b) {
        if (a.year != b.year) return b.year.compareTo(a.year);
        final aNum = int.tryParse(a.id.split('_').last) ?? 0;
        final bNum = int.tryParse(b.id.split('_').last) ?? 0;
        return aNum.compareTo(bNum);
      });

      if (cloudCsitMocks.isNotEmpty) {
        // Merge cloud mocks with local mocks, avoiding duplicates by ID
        final Map<String, PYQ> mergedCsitMocks = { for (var pyq in csitMockQuestions) pyq.id: pyq };
        for (var pyq in cloudCsitMocks) {
          mergedCsitMocks[pyq.id] = pyq;
        }
        _csitMockQuestions = mergedCsitMocks.values.toList();
      } else {
        _csitMockQuestions = [...csitMockQuestions];
      }

      if (cloudDaMocks.isNotEmpty) {
        final Map<String, PYQ> mergedDaMocks = { for (var pyq in daMockQuestions) pyq.id: pyq };
        for (var pyq in cloudDaMocks) {
          mergedDaMocks[pyq.id] = pyq;
        }
        _daMockQuestions = mergedDaMocks.values.toList();
      } else {
        _daMockQuestions = [...daMockQuestions];
      }
    } catch (e) {
      print('syncGlobalData error: $e');
    } finally {
      _isSyncingGlobalData = false;
      notifyListeners();
    }
  }

  // Set selected exam
  Future<void> setExams(String selected, String active) async {
    _selectedExam = selected;
    _activeExam = active;
    await _storage.prefs.setString('selected_exam', selected);
    await _storage.prefs.setString('active_exam', active);
    notifyListeners();
  }

  // Toggle active exam context
  Future<void> setActiveExam(String active) async {
    _activeExam = active;
    await _storage.prefs.setString('active_exam', active);
    notifyListeners();
  }

  // Navigation setter
  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  // Planner selected date
  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  // Get planner schedule for a specific date
  List<TopicStatus> getTopicsForDate(DateTime date) {
    final dateStr = "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
    final itemIndex = currentStudyPlanItems.indexWhere((item) => item.date == dateStr);
    if (itemIndex != -1) {
      final item = currentStudyPlanItems[itemIndex];
      // Map item to TopicStatus
      String diff = 'Medium';
      if (item.type == 'foundation') diff = 'Easy';
      if (item.type == 'revision') diff = 'Easy';
      if (item.type == 'core' || item.type == 'practice') diff = 'Medium';
      if (item.type == 'advanced' || item.type == 'exam') diff = 'Hard';

      final userNote = getStudyDayUserNote(item.day);
      final displayNote = userNote.isNotEmpty ? userNote : item.notes;

      return [
        TopicStatus(
          topicName: item.topic,
          subjectName: item.subject,
          isCompleted: isStudyDayCompleted(item.day),
          note: displayNote,
          difficulty: diff,
        )
      ];
    }
    return [];
  }

  // Study Plan Day Helper Getters
  bool isStudyDayCompleted(int day) {
    return _studyPlanDayStates[day]?['isCompleted'] ?? false;
  }

  String getStudyDayUserNote(int day) {
    return _studyPlanDayStates[day]?['userNote'] ?? '';
  }

  // Toggle Study Day Completion
  Future<void> toggleStudyDayCompletion(int day) async {
    final currentState = _studyPlanDayStates[day] ?? {'isCompleted': false, 'userNote': ''};
    final newCompleted = !(currentState['isCompleted'] ?? false);
    final newState = {
      'isCompleted': newCompleted,
      'userNote': currentState['userNote'] ?? '',
    };
    _studyPlanDayStates[day] = newState;
    await _storage.studyPlanBox.put(day, newState);
    notifyListeners();
    _updateScheduledNotifications();
  }

  // Update Study Day User Note
  Future<void> updateStudyDayUserNote(int day, String note) async {
    final currentState = _studyPlanDayStates[day] ?? {'isCompleted': false, 'userNote': ''};
    final newState = {
      'isCompleted': currentState['isCompleted'] ?? false,
      'userNote': note,
    };
    _studyPlanDayStates[day] = newState;
    await _storage.studyPlanBox.put(day, newState);
    notifyListeners();
  }

  // Get progress percentage for a study phase
  double getPhaseProgress(String phaseName) {
    final phaseItems = currentStudyPlanItems.where((item) => item.phase == phaseName).toList();
    if (phaseItems.isEmpty) return 0.0;
    
    int completedCount = 0;
    for (var item in phaseItems) {
      if (isStudyDayCompleted(item.day)) {
        completedCount++;
      }
    }
    return completedCount / phaseItems.length;
  }

  // Toggle Topic Completion
  Future<void> toggleTopicCompletion(String subject, String topic) async {
    // Check if this matches a study plan day
    final dayItemIndex = currentStudyPlanItems.indexWhere((item) => item.subject == subject && item.topic == topic);
    if (dayItemIndex != -1) {
      final dayItem = currentStudyPlanItems[dayItemIndex];
      await toggleStudyDayCompletion(dayItem.day);
      return;
    }

    final key = '${subject}_$topic';
    final index = _topics.indexWhere((t) => t.subjectName == subject && t.topicName == topic);
    if (index != -1) {
      final currentStatus = _topics[index];
      final newStatus = currentStatus.copyWith(isCompleted: !currentStatus.isCompleted);
      _topics[index] = newStatus;
      await _storage.topicStatusBox.put(key, newStatus.toMap());
      CloudSyncService().pushToCloud('topicStatus', key.toString(), newStatus.toMap());
      notifyListeners();
      _updateScheduledNotifications();
    }
  }

  // Agile Checklist: Get Topic Status
  TopicStatus getTopicStatus(String subject, String topic) {
    final index = _topics.indexWhere((t) => t.subjectName == subject && t.topicName == topic);
    if (index != -1) return _topics[index];
    final key = '${subject}_$topic';
    if (_storage.topicStatusBox.containsKey(key)) {
      final raw = Map<dynamic, dynamic>.from(_storage.topicStatusBox.get(key));
      final parsed = TopicStatus.fromMap(raw);
      _topics.add(parsed);
      return parsed;
    }
    return TopicStatus(topicName: topic, subjectName: subject);
  }

  // Agile Checklist: Toggle specific milestone (concept, pyq, revise)
  Future<void> toggleTopicMilestone(String subject, String topic, String milestone) async {
    final key = '${subject}_$topic';
    final current = getTopicStatus(subject, topic);

    bool concept = current.conceptWatched;
    bool pyq = current.pyqSolved;
    bool revise = current.revisedOnce;

    if (milestone == 'concept') {
      concept = !concept;
    } else if (milestone == 'pyq') {
      pyq = !pyq;
    } else if (milestone == 'revise') {
      revise = !revise;
    }

    final isAllDone = concept && pyq && revise;
    final updated = current.copyWith(
      conceptWatched: concept,
      pyqSolved: pyq,
      revisedOnce: revise,
      isCompleted: isAllDone,
    );

    final idx = _topics.indexWhere((t) => t.subjectName == subject && t.topicName == topic);
    if (idx != -1) {
      _topics[idx] = updated;
    } else {
      _topics.add(updated);
    }

    await _storage.topicStatusBox.put(key, updated.toMap());
    CloudSyncService().pushToCloud('topicStatus', key, updated.toMap());
    notifyListeners();
    _updateScheduledNotifications();
  }

  // Agile Checklist: Subject Completion Progress
  double getSubjectProgress(String subject, List<String> topics) {
    if (topics.isEmpty) return 0.0;
    double totalPoints = 0;
    for (final topic in topics) {
      final st = getTopicStatus(subject, topic);
      double p = 0;
      if (st.conceptWatched) p += 0.333;
      if (st.pyqSolved) p += 0.333;
      if (st.revisedOnce) p += 0.334;
      if (st.isCompleted) p = 1.0;
      totalPoints += p;
    }
    return (totalPoints / topics.length).clamp(0.0, 1.0);
  }

  // Update Topic Note
  Future<void> updateTopicNote(String subject, String topic, String note) async {
    // Check if this matches a study plan day
    final dayItemIndex = currentStudyPlanItems.indexWhere((item) => item.subject == subject && item.topic == topic);
    if (dayItemIndex != -1) {
      final dayItem = currentStudyPlanItems[dayItemIndex];
      await updateStudyDayUserNote(dayItem.day, note);
      return;
    }

    final key = '${subject}_$topic';
    final index = _topics.indexWhere((t) => t.subjectName == subject && t.topicName == topic);
    if (index != -1) {
      final newStatus = _topics[index].copyWith(note: note);
      _topics[index] = newStatus;
      await _storage.topicStatusBox.put(key, newStatus.toMap());
      CloudSyncService().pushToCloud('topicStatus', key.toString(), newStatus.toMap());
      notifyListeners();
    }
  }

  // Solve PYQ
  Future<void> solvePYQ(String id, String answer) async {
    final index = _pyqs.indexWhere((p) => p.id == id);
    if (index != -1) {
      final current = _pyqs[index];
      final wasCompleted = current.isCompleted;
      final newPyq = current.copyWith(
        isCompleted: true,
        userAnswer: answer,
      );
      _pyqs[index] = newPyq;
      await _storage.pyqBox.put(id, newPyq.toMap());
      CloudSyncService().pushToCloud('pyqs', id.toString(), newPyq.toMap());

      if (!wasCompleted) {
        final todayStr = DateTime.now().toIso8601String().split('T').first;
        final currentDaily = _storage.prefs.getInt('daily_pyqs_$todayStr') ?? 0;
        await _storage.prefs.setInt('daily_pyqs_$todayStr', currentDaily + 1);
        AdService().incrementPyqCountAndShowAd();
      }
      notifyListeners();
    }
  }

  /// Number of PYQs solved today (resets every midnight)
  int get todayPyqsSolvedCount {
    final todayStr = DateTime.now().toIso8601String().split('T').first;
    return _storage.prefs.getInt('daily_pyqs_$todayStr') ?? 0;
  }

  /// Whether a mock test or drill was taken today
  bool get isMockTakenToday {
    final now = DateTime.now();
    return _mockLogs.any((m) =>
        m.dateTaken.year == now.year &&
        m.dateTaken.month == now.month &&
        m.dateTaken.day == now.day);
  }

  // Mark PYQ as Unsolved / Attempt again
  Future<void> unsolvePYQ(String id) async {
    final index = _pyqs.indexWhere((p) => p.id == id);
    if (index != -1) {
      final current = _pyqs[index];
      final newPyq = current.copyWith(
        isCompleted: false,
        userAnswer: null,
      );
      _pyqs[index] = newPyq;
      await _storage.pyqBox.put(id, newPyq.toMap());
      CloudSyncService().pushToCloud('pyqs', id.toString(), newPyq.toMap());
      notifyListeners();
    }
  }

  // Toggle PYQ Bookmark
  Future<void> togglePYQBookmark(String id) async {
    final index = _pyqs.indexWhere((p) => p.id == id);
    if (index != -1) {
      final newPyq = _pyqs[index].copyWith(isBookmarked: !_pyqs[index].isBookmarked);
      _pyqs[index] = newPyq;
      await _storage.pyqBox.put(id, newPyq.toMap());
      CloudSyncService().pushToCloud('pyqs', id.toString(), newPyq.toMap());
      notifyListeners();
    }
  }

  // Toggle PYQ Revision flag
  Future<void> togglePYQFlagRevision(String id) async {
    final index = _pyqs.indexWhere((p) => p.id == id);
    if (index != -1) {
      final current = _pyqs[index];
      final newStatus = !current.isFlaggedForRevision;
      final newPyq = current.copyWith(isFlaggedForRevision: newStatus);
      _pyqs[index] = newPyq;
      await _storage.pyqBox.put(id, newPyq.toMap());
      CloudSyncService().pushToCloud('pyqs', id.toString(), newPyq.toMap());

      if (newStatus) {
        // Add to revision queue
        final revItem = RevisionItem(
          id: 'rev_pyq_$id',
          topic: current.topic,
          subject: current.subject,
          dateFlagged: DateTime.now(),
        );
        _revisionQueue.add(revItem);
        await _storage.revisionQueueBox.put(revItem.id, revItem.toMap());
      CloudSyncService().pushToCloud('revisionQueue', revItem.id.toString(), revItem.toMap());
      } else {
        // Remove from revision queue
        _revisionQueue.removeWhere((item) => item.id == 'rev_pyq_$id');
        await _storage.revisionQueueBox.delete('rev_pyq_$id');
      CloudSyncService().deleteFromCloud('revisionQueue', 'rev_pyq_$id'.toString());
      }
      notifyListeners();
    }
  }

  // Add Custom Topic to Revision Queue
  Future<void> addTopicToRevision(String subject, String topic) async {
    final index = _topics.indexWhere((t) => t.subjectName == subject && t.topicName == topic);
    if (index != -1 && !_topics[index].inRevisionQueue) {
      // Update topic status
      final newTopic = _topics[index].copyWith(
        inRevisionQueue: true,
        dateAddedToRevision: DateTime.now(),
      );
      _topics[index] = newTopic;
      await _storage.topicStatusBox.put('${subject}_$topic', newTopic.toMap());
      CloudSyncService().pushToCloud('topicStatus', '${subject}_$topic'.toString(), newTopic.toMap());

      // Add to revision list
      final revItem = RevisionItem(
        id: 'rev_topic_${subject}_$topic',
        topic: topic,
        subject: subject,
        dateFlagged: DateTime.now(),
      );
      _revisionQueue.add(revItem);
      await _storage.revisionQueueBox.put(revItem.id, revItem.toMap());
      CloudSyncService().pushToCloud('revisionQueue', revItem.id.toString(), revItem.toMap());
      notifyListeners();
    }
  }

  // Mark Revision Item Complete (Spaced Revision)
  Future<void> markRevisionItemCompleted(String id) async {
    _revisionQueue.removeWhere((item) => item.id == id);
    await _storage.revisionQueueBox.delete(id);
      CloudSyncService().deleteFromCloud('revisionQueue', id.toString());

    // If it was a topic, update the topic status
    if (id.startsWith('rev_topic_')) {
      final key = id.replaceFirst('rev_topic_', '');
      final idx = _topics.indexWhere((t) => '${t.subjectName}_${t.topicName}' == key);
      if (idx != -1) {
        final newTopic = _topics[idx].copyWith(
          inRevisionQueue: false,
          lastRevisedDate: DateTime.now(),
        );
        _topics[idx] = newTopic;
        await _storage.topicStatusBox.put(key, newTopic.toMap());
      CloudSyncService().pushToCloud('topicStatus', key.toString(), newTopic.toMap());
      }
    } else if (id.startsWith('rev_pyq_')) {
      final pyqId = id.replaceFirst('rev_pyq_', '');
      final idx = _pyqs.indexWhere((p) => p.id == pyqId);
      if (idx != -1) {
        final newPyq = _pyqs[idx].copyWith(isFlaggedForRevision: false);
        _pyqs[idx] = newPyq;
        await _storage.pyqBox.put(pyqId, newPyq.toMap());
      CloudSyncService().pushToCloud('pyqs', pyqId.toString(), newPyq.toMap());
      }
    }
    notifyListeners();
  }

  // Error Log: Add entry
  Future<void> addErrorLogEntry(String subject, String topic, String questionText, String whyWrong) async {
    final entry = ErrorLogEntry(
      id: 'err_${DateTime.now().millisecondsSinceEpoch}',
      subject: subject,
      topic: topic,
      questionText: questionText,
      whyWrong: whyWrong,
      dateAdded: DateTime.now(),
    );
    _errorLog.add(entry);
    await _storage.errorLogBox.put(entry.id, entry.toMap());
      CloudSyncService().pushToCloud('errorLog', entry.id.toString(), entry.toMap());

    // Update topic error log flag
    final idx = _topics.indexWhere((t) => t.subjectName == subject && t.topicName == topic);
    if (idx != -1) {
      final newTopic = _topics[idx].copyWith(inErrorLog: true);
      _topics[idx] = newTopic;
      await _storage.topicStatusBox.put('${subject}_$topic', newTopic.toMap());
      CloudSyncService().pushToCloud('topicStatus', '${subject}_$topic'.toString(), newTopic.toMap());
    }

    notifyListeners();
  }

  // Delete Error Log
  Future<void> deleteErrorLogEntry(String id) async {
    final idx = _errorLog.indexWhere((e) => e.id == id);
    if (idx != -1) {
      final entry = _errorLog[idx];
      _errorLog.removeAt(idx);
      await _storage.errorLogBox.delete(id);
      CloudSyncService().deleteFromCloud('errorLog', id.toString());

      // Check if there are other errors for the same topic
      bool hasMore = _errorLog.any((e) => e.subject == entry.subject && e.topic == entry.topic);
      if (!hasMore) {
        final topicIdx = _topics.indexWhere((t) => t.subjectName == entry.subject && t.topicName == entry.topic);
        if (topicIdx != -1) {
          final newTopic = _topics[topicIdx].copyWith(inErrorLog: false);
          _topics[topicIdx] = newTopic;
          await _storage.topicStatusBox.put('${entry.subject}_${entry.topic}', newTopic.toMap());
      CloudSyncService().pushToCloud('topicStatus', '${entry.subject}_${entry.topic}'.toString(), newTopic.toMap());
        }
      }
      notifyListeners();
    }
  }

  // Mark Error Log Revised
  Future<void> markErrorLogEntryRevised(String id, bool revised) async {
    final idx = _errorLog.indexWhere((e) => e.id == id);
    if (idx != -1) {
      final updated = _errorLog[idx].copyWith(isRevised: revised);
      _errorLog[idx] = updated;
      await _storage.errorLogBox.put(id, updated.toMap());
      CloudSyncService().pushToCloud('errorLog', id.toString(), updated.toMap());
      notifyListeners();
    }
  }

  // Mock Tests: Add entry
  Future<void> addMockTest(String name, DateTime date, double score, List<String> weakSubjects, String notes) async {
    final mock = MockTestLog(
      id: 'mock_${(_activeExam ?? 'DA').toLowerCase()}_${DateTime.now().millisecondsSinceEpoch}',
      name: name,
      dateTaken: date,
      score: score,
      weakSubjects: weakSubjects,
      notes: notes,
    );
    _mockLogs.add(mock);
    _mockLogs.sort((a, b) => a.dateTaken.compareTo(b.dateTaken));
    await _storage.mockTestBox.put(mock.id, mock.toMap());
      CloudSyncService().pushToCloud('mockTests', mock.id.toString(), mock.toMap());
    notifyListeners();
  }

  // Mock Tests: Delete entry
  Future<void> deleteMockTest(String id) async {
    _mockLogs.removeWhere((m) => m.id == id);
    await _storage.mockTestBox.delete(id);
      CloudSyncService().deleteFromCloud('mockTests', id.toString());
    notifyListeners();
  }

  // Score Estimator setters
  Future<void> setScoreEstimatorScore(double score) async {
    _estimatorMockScore = score;
    notifyListeners();
  }

  Future<void> setScoreEstimatorSource(String source) async {
    _estimatorMockSource = source;
    notifyListeners();
  }

  // Settings Setters
  Future<void> updateNotificationSettings(bool enabled, String timeStr) async {
    _notificationsEnabled = enabled;
    _notificationTime = timeStr;
    await _storage.prefs.setBool('notifications_enabled', enabled);
    await _storage.prefs.setString('notification_time', timeStr);
      CloudSyncService().pushSettings({'notifications_enabled': enabled, 'notification_time': timeStr});
    if (enabled) {
      await NotificationService().requestPermissions();
    }
    notifyListeners();
    _updateScheduledNotifications();
  }

  void _updateScheduledNotifications() {
    if (!_notificationsEnabled) {
      NotificationService().cancelDailyReminder();
      return;
    }

    try {
      final parts = _notificationTime.split(':');
      final hour = int.parse(parts[0]);
      final minute = int.parse(parts[1]);

      // Find today's plan
      final todayTopics = getTopicsForDate(DateTime.now());
      if (todayTopics.isNotEmpty) {
        NotificationService().scheduleDailyReminder(
          hour,
          minute,
          todayTopics[0].subjectName,
          todayTopics[0].topicName,
        );
      } else {
        NotificationService().scheduleDailyReminder(
          hour,
          minute,
          'Syllabus Complete',
          'Review error log & do revision!',
        );
      }
      // Schedule streak alarm
      NotificationService().scheduleStreakReminder();
    } catch (e) {
      debugPrint("Error parsing notification time: $e");
    }
  }

  // Reset Progress
  Future<void> resetProgress() async {
    await _storage.resetAllData();
    await _loadData();
  }
}
