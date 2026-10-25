import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/models.dart';
import '../models/note_model.dart';
import 'cloud_sync_service.dart';
import '../data/sample_pyqs.dart';
import '../data/csit_sample_pyqs.dart';
import '../data/csit_set2_pyqs.dart';

class StorageService {
  static final StorageService _instance = StorageService._internal();
  factory StorageService() => _instance;
  StorageService._internal();

  late SharedPreferences _prefs;
  
  // Hive Boxes
  late Box _topicStatusBox;
  late Box _pyqBox;
  late Box _errorLogBox;
  late Box _mockTestBox;
  late Box _revisionQueueBox;
  late Box _studyPlanBox;
  late Box _dynamicMockBox;
  late Box _dynamicNotesBox;

                  // Syllabus mapping
  static final Map<String, List<String>> syllabusData = {
    'General Aptitude': [
      'Basic English grammar',
      'Tenses',
      'Articles',
      'Adjectives',
      'Prepositions',
      'Conjunctions',
      'Verb-noun agreement',
      'Other parts of speech',
      'Basic vocabulary',
      'Words',
      'Idioms',
      'Phrases in context',
      'Reading and comprehension',
      'Narrative sequencing',
      'Data interpretation',
      'Data graphs (bar graphs, pie charts, and other graphs representing data)',
      '2- and 3-dimensional plots',
      'Maps',
      'Tables',
      'Numerical computation and estimation',
      'Ratios',
      'Percentages',
      'Powers',
      'Exponents and logarithms',
      'Permutations and combinations',
      'Series',
      'Mensuration and geometry',
      'Elementary statistics and probability',
      'Logic',
      'Deduction and induction',
      'Analogy',
      'Numerical relations and reasoning',
      'Transformation of shapes',
      'Translation',
      'Rotation',
      'Scaling',
      'Mirroring',
      'Assembling',
      'Grouping',
      'Paper folding',
      'Cutting',
      'Patterns in 2 and 3 dimensions',
    ],
    'Probability and Statistics': [
      'Counting (permutation and combinations)',
      'Probability axioms',
      'Sample space',
      'Events',
      'Independent events',
      'Mutually exclusive events',
      'Marginal',
      'Conditional and joint probability',
      'Bayes Theorem',
      'Conditional expectation and variance',
      'Mean',
      'Median',
      'Mode and standard deviation',
      'Correlation',
      'Covariance',
      'Random variables',
      'Discrete random variables and probability mass functions',
      'Uniform (Discrete)',
      'Bernoulli',
      'Binomial distribution',
      'Continuous random variables and probability distribution function',
      'Uniform (Continuous)',
      'Exponential',
      'Poisson',
      'Normal',
      'Standard normal',
      'T-distribution',
      'Chi-squared distributions',
      'Cumulative distribution function',
      'Conditional PDF',
      'Central limit theorem',
      'Confidence interval',
      'Z-test',
      'T-test',
      'Chi-squared test',
    ],
    'Linear Algebra': [
      'Vector space',
      'Subspaces',
      'Linear dependence and independence of vectors',
      'Matrices',
      'Projection matrix',
      'Orthogonal matrix',
      'Idempotent matrix',
      'Partition matrix and their properties',
      'Quadratic forms',
      'Systems of linear equations and solutions',
      'Gaussian elimination',
      'Eigenvalues and eigenvectors',
      'Determinant',
      'Rank',
      'Nullity',
      'Projections',
      'LU decomposition',
      'Singular value decomposition',
    ],
    'Calculus and Optimization': [
      'Functions of a single variable',
      'Limit',
      'Continuity and differentiability',
      'Taylor series',
      'Maxima and minima',
      'Optimization involving a single variable',
    ],
    'Python (Main Topics Only)': [
      'Variables & data types',
      'Conditionals & loops',
      'Functions',
      'List/dict/set/tuple',
      'File I/O',
      'OOP (classes, inheritance)',
      'Exception handling',
      'List comprehensions',
      'Modules & imports',
      'Basic standard library (math, os, collections, itertools)',
    ],
    'DSA (Data Structures and Algorithms)': [
      'Stacks',
      'Queues',
      'Linked lists',
      'Trees',
      'Hash tables',
      'Linear search',
      'Binary search',
      'Selection sort',
      'Bubble sort',
      'Insertion sort',
      'Mergesort',
      'Quicksort',
      'Introduction to graph theory',
      'Graph traversals and shortest path',
    ],
    'Database Management and Warehousing': [
      'ER-model',
      'Relational model',
      'Relational algebra',
      'Tuple calculus',
      'SQL',
      'Integrity constraints',
      'Normal form',
      'File organization',
      'Indexing',
      'Data types',
      'Data transformation such as normalization',
      'Discretization',
      'Sampling',
      'Compression',
      'Data warehouse modelling',
      'Schema for multidimensional data models',
      'Concept hierarchies',
      'Measures',
      'Categorization and computations',
    ],
    'Machine Learning': [
      'Supervised Learning',
      'Regression and classification problems',
      'Simple linear regression',
      'Multiple linear regression',
      'Ridge regression',
      'Logistic regression',
      'K-nearest neighbour',
      'Naive Bayes classifier',
      'Linear discriminant analysis',
      'Support vector machine',
      'Decision trees',
      'Bias-variance trade-off',
      'Cross-validation methods such as leave-one-out (LOO) cross-validation',
      'K-folds cross-validation',
      'Multi-layer perceptron',
      'Feed-forward neural network',
      'Unsupervised Learning',
      'Clustering algorithms',
      'K-means/k-medoid',
      'Hierarchical clustering',
      'Top-down',
      'Bottom-up',
      'Single-linkage',
      'Multiple-linkage',
      'Dimensionality reduction',
      'Principal component analysis',
    ],
    'AI': [
      'Search',
      'Informed',
      'Uninformed',
      'Adversarial',
      'Logic',
      'Propositional',
      'Predicate',
      'Reasoning under uncertainty',
      'Conditional independence representation',
      'Exact inference through variable elimination',
      'Approximate inference through sampling',
    ],
  };

  static final Map<String, List<String>> csitSyllabusData = {
    'General Aptitude': [
      'Basic English grammar', 'Tenses', 'Articles', 'Adjectives', 'Prepositions', 'Conjunctions', 'Verb-noun agreement', 'Other parts of speech', 'Basic vocabulary', 'Words', 'Idioms', 'Phrases in context', 'Reading and comprehension', 'Narrative sequencing', 'Data interpretation', 'Data graphs (bar graphs, pie charts, and other graphs representing data)', '2- and 3-dimensional plots', 'Maps', 'Tables', 'Numerical computation and estimation', 'Ratios', 'Percentages', 'Powers', 'Exponents and logarithms', 'Permutations and combinations', 'Series', 'Mensuration and geometry', 'Elementary statistics and probability', 'Logic', 'Deduction and induction', 'Analogy', 'Numerical relations and reasoning', 'Transformation of shapes', 'Translation', 'Rotation', 'Scaling', 'Mirroring', 'Assembling', 'Grouping', 'Paper folding', 'Cutting', 'Patterns in 2 and 3 dimensions',
    ],
    'Engineering Mathematics': [
      'Discrete Mathematics: Propositional and first order logic', 'Discrete Mathematics: Sets', 'Discrete Mathematics: relations', 'Discrete Mathematics: functions', 'Discrete Mathematics: partial orders and lattices', 'Discrete Mathematics: Monoids', 'Discrete Mathematics: Groups', 'Discrete Mathematics: Graphs: connectivity', 'Discrete Mathematics: matching', 'Discrete Mathematics: coloring', 'Discrete Mathematics: Combinatorics: counting', 'Discrete Mathematics: recurrence relations', 'Discrete Mathematics: generating functions', 'Linear Algebra: Matrices', 'Linear Algebra: determinants', 'Linear Algebra: system of linear equations', 'Linear Algebra: eigenvalues and eigenvectors', 'Linear Algebra: LU decomposition', 'Calculus: Limits', 'Calculus: continuity and differentiability', 'Calculus: Maxima and minima', 'Calculus: Mean value theorem', 'Calculus: Integration', 'Probability and Statistics: Random variables', 'Probability and Statistics: Uniform', 'Probability and Statistics: normal', 'Probability and Statistics: exponential', 'Probability and Statistics: poisson and binomial distributions', 'Probability and Statistics: Mean', 'Probability and Statistics: median', 'Probability and Statistics: mode and standard deviation', 'Probability and Statistics: Conditional probability and Bayes theorem', 'Math Revision & PYQs'
    ],
    'Digital Logic': [
      'Boolean algebra', 'Combinational and sequential circuits', 'Minimization', 'Number representations and computer arithmetic (fixed and floating point)', 'Digital Logic Revision & PYQs'
    ],
    'Computer Organization': [
      'Machine instructions and addressing modes', 'ALU', 'data-path and control unit', 'Instruction pipelining', 'pipeline hazards', 'Memory hierarchy: cache', 'main memory and secondary storage', 'I/O interface (interrupt and DMA mode)', 'COA Revision & PYQs'
    ],
    'Programming & Data Structures': [
      'Programming in C', 'Recursion', 'Arrays', 'stacks', 'queues', 'linked lists', 'trees', 'binary search trees', 'binary heaps', 'graphs', 'DSA Revision & PYQs'
    ],
    'Algorithms': [
      'Searching', 'sorting', 'hashing', 'Asymptotic worst case time and space complexity', 'Algorithm design techniques: greedy', 'dynamic programming and divide-and-conquer', 'Graph traversals', 'minimum spanning trees', 'shortest paths', 'Algorithms Revision & PYQs'
    ],
    'Theory of Computation': [
      'Regular expressions and finite automata', 'Context-free grammars and push-down automata', 'Regular and contex-free languages', 'pumping lemma', 'Turing machines and undecidability', 'TOC Revision & PYQs'
    ],
    'Compiler Design': [
      'Lexical analysis', 'parsing', 'syntax-directed translation', 'Runtime environments', 'Intermediate code generation', 'Local optimisation', 'Data flow analyses: constant propagation', 'liveness analysis', 'common sub expression elimination', 'Compiler Revision & PYQs'
    ],
    'Operating System': [
      'System calls', 'processes', 'threads', 'inter-process communication', 'concurrency and synchronization', 'Deadlock', 'CPU and I/O scheduling', 'Memory management and virtual memory', 'File systems', 'OS Revision & PYQs'
    ],
    'Databases': [
      'ER-model', 'Relational model: relational algebra', 'tuple calculus', 'SQL', 'Integrity constraints', 'normal forms', 'File organization', 'indexing (e.g. B and B+ trees)', 'Transactions and concurrency control', 'DBMS Revision & PYQs'
    ],
    'Computer Networks': [
      'Concept of layering: OSI and TCP/IP Protocol Stacks', 'Basics of packet', 'circuit and virtual circuit-switching', 'Data link layer: framing', 'error detection', 'Medium Access Control', 'Ethernet bridging', 'Routing protocols: shortest path', 'flooding', 'distance vector and link state routing', 'Fragmentation and IP addressing', 'IPv4', 'CIDR notation', 'Basics of IP support protocols (ARP, DHCP, ICMP)', 'Network Address Translation (NAT)', 'Transport layer: flow control and congestion control', 'UDP', 'TCP', 'sockets', 'Application layer protocols: DNS', 'SMTP', 'HTTP', 'FTP', 'Email', 'Networks Revision & PYQs'
    ]
  };

  List<PYQ> get allSamplePYQs => [...samplePYQs, ...csitSamplePYQs, ...csitSet2PYQs];

  // Getters for boxes
  Box get topicStatusBox => _topicStatusBox;
  Box get pyqBox => _pyqBox;
  Box get errorLogBox => _errorLogBox;
  Box get mockTestBox => _mockTestBox;
  Box get revisionQueueBox => _revisionQueueBox;
  Box get studyPlanBox => _studyPlanBox;
  Box get dynamicMockBox => _dynamicMockBox;
  Box get dynamicNotesBox => _dynamicNotesBox;
  SharedPreferences get prefs => _prefs;

  Future<void> init() async {
    // Initialize Hive
    await Hive.initFlutter();

    // Open boxes
    _topicStatusBox = await Hive.openBox('topic_status_box');
    _pyqBox = await Hive.openBox('pyq_box');
    _errorLogBox = await Hive.openBox('error_log_box');
    _mockTestBox = await Hive.openBox('mock_test_box');
    _revisionQueueBox = await Hive.openBox('revision_queue_box');
    _studyPlanBox = await Hive.openBox('study_plan_box');
    _dynamicMockBox = await Hive.openBox('dynamic_mock_box');
    _dynamicNotesBox = await Hive.openBox('dynamic_notes_box');

    // SharedPreferences
    _prefs = await SharedPreferences.getInstance();

    // Check first launch
    bool isFirstRun = _prefs.getBool('is_first_run') ?? true;
    if (isFirstRun) {
      await _seedInitialData();
    } else {
      // Key renaming map for seamless database migration
                                                      final keyReplacements = {
        // Cleaned up for direct matching. Database will self-seed newly defined topics.
      };

      // Apply key renaming translation map
      keyReplacements.forEach((oldKey, newKey) {
        if (_topicStatusBox.containsKey(oldKey)) {
          final oldVal = _topicStatusBox.get(oldKey);
          if (oldVal != null) {
            final status = TopicStatus.fromMap(Map<dynamic, dynamic>.from(oldVal));
            final parts = newKey.split('_');
            final newSubject = parts[0];
            final newTopic = newKey.substring(newSubject.length + 1);
            final updatedStatus = status.copyWith(
              topicName: newTopic,
              subjectName: newSubject,
            );
            _topicStatusBox.put(newKey, updatedStatus.toMap());
          }
          _topicStatusBox.delete(oldKey);
        }
      });

      // Seeding and Pruning
      final Set<String> validKeys = {};
      final allSyllabusData = {...syllabusData, ...csitSyllabusData};
      allSyllabusData.forEach((subject, topics) {
        for (var topic in topics) {
          final key = '${subject}_$topic';
          validKeys.add(key);
          if (!_topicStatusBox.containsKey(key)) {
            final status = TopicStatus(topicName: topic, subjectName: subject);
            _topicStatusBox.put(key, status.toMap());
          }
        }
      });

      // Clean up obsolete keys
      final keysToDelete = _topicStatusBox.keys
          .where((key) => key is String && !validKeys.contains(key))
          .toList();
      for (var key in keysToDelete) {
        await _topicStatusBox.delete(key);
      }

      // We no longer cleanup old mock questions that are not in samplePYQs
      // because that would delete PYQs fetched dynamically from Firebase.

      // Inject and update sample questions, preserving user progress
      for (var pyq in allSamplePYQs) {
        if (!_pyqBox.containsKey(pyq.id)) {
          _pyqBox.put(pyq.id, pyq.toMap());
        } else {
          final existingMap = Map<dynamic, dynamic>.from(_pyqBox.get(pyq.id));
          final updatedPyq = pyq.copyWith(
            isCompleted: existingMap['isCompleted'] ?? false,
            userAnswer: existingMap['userAnswer'],
            isBookmarked: existingMap['isBookmarked'] ?? false,
            isFlaggedForRevision: existingMap['isFlaggedForRevision'] ?? false,
          );
          _pyqBox.put(pyq.id, updatedPyq.toMap());
        }
      }
    }

    // Update streak on app start
    await updateStreak();
  }

  Future<void> _seedInitialData() async {
    // 1. Seed Topic Statuses
    final allSyllabusData = {...syllabusData, ...csitSyllabusData};
    allSyllabusData.forEach((subject, topics) {
      for (var topic in topics) {
        final key = '${subject}_$topic';
        final status = TopicStatus(topicName: topic, subjectName: subject);
        _topicStatusBox.put(key, status.toMap());
      }
    });

    // 2. Seed PYQs
    for (var pyq in allSamplePYQs) {
      _pyqBox.put(pyq.id, pyq.toMap());
    }

    // 3. Set flags
    await _prefs.setBool('is_first_run', false);
    await _prefs.setString('planner_start_date', DateTime.now().toIso8601String().substring(0, 10)); // YYYY-MM-DD
    await _prefs.setInt('current_streak', 0);
    await _prefs.setString('last_open_date', '');
    await _prefs.setString('notification_time', '09:00'); // 9:00 AM daily
    await _prefs.setBool('notifications_enabled', true);
  }

  // Streak update logic
  Future<void> updateStreak() async {
    final todayStr = DateTime.now().toIso8601String().substring(0, 10); // YYYY-MM-DD
    final lastOpenStr = _prefs.getString('last_open_date') ?? '';
    int currentStreak = _prefs.getInt('current_streak') ?? 0;

    if (lastOpenStr.isEmpty) {
      // First open ever
      currentStreak = 1;
      await _prefs.setInt('current_streak', currentStreak);
      await _prefs.setString('last_open_date', todayStr);
      await CloudSyncService().pushSettings({'current_streak': currentStreak, 'last_open_date': todayStr});
      return;
    }

    if (lastOpenStr == todayStr) {
      // Already opened today, do nothing
      return;
    }

    // Truncate to midnight for accurate day difference
    final today = DateTime.parse(todayStr);
    final lastOpen = DateTime.parse(lastOpenStr);
    final diff = today.difference(lastOpen).inDays;

    if (diff == 1) {
      // Opened consecutive day
      currentStreak += 1;
    } else if (diff > 1) {
      // Streak broken, save it so we can restore it via ads
      await _prefs.setInt('previous_streak', currentStreak);
      await CloudSyncService().pushSettings({'previous_streak': currentStreak});
      currentStreak = 1;
    }

    await _prefs.setInt('current_streak', currentStreak);
    await _prefs.setString('last_open_date', todayStr);
    await CloudSyncService().pushSettings({'current_streak': currentStreak, 'last_open_date': todayStr});
  }

  Future<int> restoreStreak() async {
    int prev = _prefs.getInt('previous_streak') ?? 0;
    if (prev > 0) {
      await _prefs.setInt('current_streak', prev);
      await CloudSyncService().pushSettings({'current_streak': prev});
      // Clear previous streak so it can't be restored again until broken again
      await _prefs.setInt('previous_streak', 0);
      await CloudSyncService().pushSettings({'previous_streak': 0});
    }
    return prev;
  }

  int get previousStreak => _prefs.getInt('previous_streak') ?? 0;

  // Get total topics completed
  int getCompletedTopicsCount() {
    int count = 0;
    for (var key in _topicStatusBox.keys) {
      final map = _topicStatusBox.get(key);
      if (map != null) {
        final status = TopicStatus.fromMap(map);
        if (status.isCompleted) count++;
      }
    }
    return count;
  }

  // Get total PYQs completed
  int getCompletedPYQsCount() {
    int count = 0;
    for (var key in _pyqBox.keys) {
      final map = _pyqBox.get(key);
      if (map != null) {
        final pyq = PYQ.fromMap(map);
        if (pyq.isCompleted) count++;
      }
    }
    return count;
  }

  // Reset all user data
  
  Future<void> restoreFromCloud(String uid) async {
    final cloudData = await CloudSyncService().syncFromCloud(uid);
    
    // 1. Settings
    if (cloudData['settings']!.isNotEmpty) {
      final s = cloudData['settings']!;
      if (s.containsKey('current_streak')) await _prefs.setInt('current_streak', s['current_streak']);
      if (s.containsKey('previous_streak')) await _prefs.setInt('previous_streak', s['previous_streak']);
      if (s.containsKey('last_open_date')) await _prefs.setString('last_open_date', s['last_open_date']);
      if (s.containsKey('notifications_enabled')) await _prefs.setBool('notifications_enabled', s['notifications_enabled']);
      if (s.containsKey('notification_time')) await _prefs.setString('notification_time', s['notification_time']);
    }

    // 2. Boxes
    final boxesToRestore = {
      'topicStatus': _topicStatusBox,
      'pyqs': _pyqBox,
      'errorLog': _errorLogBox,
      'mockTests': _mockTestBox,
      'revisionQueue': _revisionQueueBox,
      'studyPlan': _studyPlanBox,
    };

    for (var entry in boxesToRestore.entries) {
      final colName = entry.key;
      final box = entry.value;
      
      final cloudCol = cloudData[colName]!;
      if (cloudCol.isNotEmpty) {
        // Merge cloud data without wiping local offline progress
        for (var doc in cloudCol.entries) {
          if (colName == 'studyPlan') {
            final intKey = int.tryParse(doc.key);
            if (intKey != null) {
              await box.put(intKey, doc.value);
            }
          }
          await box.put(doc.key, doc.value);
        }
      }
    }

    // 3. Daily Stats (PYQs solved today, etc.)
    if (cloudData.containsKey('dailyStats')) {
      final dailyCol = cloudData['dailyStats']!;
      for (var entry in dailyCol.entries) {
        final dateKey = entry.key;
        final data = entry.value;
        if (data is Map) {
          final count = data['daily_pyqs'];
          if (count is int) {
            await _prefs.setInt('daily_pyqs_$dateKey', count);
          }
        }
      }
    }
  }

  /// Retrieve an OTA dynamic mock test cached from Firestore
  List<PYQ>? getDynamicMock(String exam, int mockNumber) {
    try {
      final key = '${exam.toLowerCase()}_full_mock_$mockNumber';
      if (_dynamicMockBox.containsKey(key)) {
        final raw = _dynamicMockBox.get(key);
        if (raw is Map && raw.containsKey('questions')) {
          final list = raw['questions'] as List;
          return list
              .map((m) => PYQ.fromMap(Map<String, dynamic>.from(m as Map)))
              .toList();
        }
      }
    } catch (e) {
      print('getDynamicMock error: $e');
    }
    return null;
  }

  /// Retrieve a hotfixed question patch by question ID
  PYQ? getDynamicQuestionPatch(String questionId) {
    try {
      final patchKey = 'patch_$questionId';
      if (_dynamicMockBox.containsKey(patchKey)) {
        final raw = _dynamicMockBox.get(patchKey);
        if (raw is Map) {
          return PYQ.fromMap(Map<String, dynamic>.from(raw));
        }
      }
    } catch (e) {
      print('getDynamicQuestionPatch error: $e');
    }
    return null;
  }

  /// Save an OTA mock test to local Hive cache
  Future<void> saveDynamicMock(String key, List<PYQ> questions) async {
    try {
      await _dynamicMockBox.put(key, {
        'id': key,
        'updated_at': DateTime.now().toIso8601String(),
        'questions': questions.map((q) => q.toMap()).toList(),
      });
    } catch (e) {
      print('saveDynamicMock error: $e');
    }
  }

  /// Retrieve dynamic subject note/formula sheet cached from cloud
  SubjectNote? getDynamicNote(String noteId) {
    try {
      if (_dynamicNotesBox.containsKey(noteId)) {
        final raw = _dynamicNotesBox.get(noteId);
        if (raw is Map) {
          return SubjectNote.fromMap(Map<String, dynamic>.from(raw));
        }
      }
    } catch (e) {
      print('getDynamicNote error: $e');
    }
    return null;
  }

  /// Save dynamic subject note to Hive cache
  Future<void> saveDynamicNote(SubjectNote note) async {
    try {
      await _dynamicNotesBox.put(note.id, note.toMap());
    } catch (e) {
      print('saveDynamicNote error: $e');
    }
  }

  Future<void> resetAllData() async {
    await _topicStatusBox.clear();
    await _pyqBox.clear();
    await _errorLogBox.clear();
    await _mockTestBox.clear();
    await _revisionQueueBox.clear();
    await _studyPlanBox.clear();
    await _dynamicMockBox.clear();
    await _dynamicNotesBox.clear();
    await _prefs.clear();
    await _seedInitialData();
    await updateStreak();
  }
}
