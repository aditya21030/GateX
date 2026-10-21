import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/storage_service.dart';
import '../data/mock_pyqs.dart';
import '../data/csit_mock_pyqs.dart';

class CloudSyncService {
  static final CloudSyncService _instance = CloudSyncService._internal();
  factory CloudSyncService() => _instance;
  CloudSyncService._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? get currentUid => _auth.currentUser?.uid;

  /// Fire-and-forget push of a single document to a collection under the user's document
  Future<void> pushToCloud(String collectionName, String docId, Map<String, dynamic> data) async {
    final uid = currentUid;
    if (uid == null) return; // Only sync if logged in

    try {
      await _firestore
          .collection('users')
          .doc(uid)
          .collection(collectionName)
          .doc(docId)
          .set(data, SetOptions(merge: true));
    } catch (e) {
      print('CloudSyncService push error: $e');
    }
  }

  /// Fire-and-forget deletion of a single document
  Future<void> deleteFromCloud(String collectionName, String docId) async {
    final uid = currentUid;
    if (uid == null) return;

    try {
      await _firestore
          .collection('users')
          .doc(uid)
          .collection(collectionName)
          .doc(docId)
          .delete();
    } catch (e) {
      print('CloudSyncService delete error: $e');
    }
  }

  /// Push settings/preferences
  Future<void> pushSettings(Map<String, dynamic> settingsData) async {
    final uid = currentUid;
    if (uid == null) return;

    try {
      await _firestore
          .collection('users')
          .doc(uid)
          .set({'settings': settingsData}, SetOptions(merge: true));
    } catch (e) {
      print('CloudSyncService push settings error: $e');
    }
  }

  /// Fetch all collections for a user. Returns a Map of collectionName -> Map of docId -> Data
  Future<Map<String, Map<String, dynamic>>> syncFromCloud(String uid) async {
    final Map<String, Map<String, dynamic>> result = {
      'topicStatus': {},
      'pyqs': {},
      'errorLog': {},
      'mockTests': {},
      'revisionQueue': {},
      'studyPlan': {},
      'dailyStats': {},
      'settings': {},
    };

    try {
      // 1. Fetch settings from user doc
      final userDoc = await _firestore.collection('users').doc(uid).get();
      if (userDoc.exists && userDoc.data() != null) {
        final data = userDoc.data()!;
        if (data.containsKey('settings')) {
          result['settings'] = Map<String, dynamic>.from(data['settings']);
        }
      }

      // 2. Helper to fetch a collection
      Future<void> fetchCollection(String name) async {
        final snap = await _firestore.collection('users').doc(uid).collection(name).get();
        for (var doc in snap.docs) {
          result[name]![doc.id] = doc.data();
        }
      }

      // 3. Fetch all collections
      await Future.wait([
        fetchCollection('topicStatus'),
        fetchCollection('pyqs'),
        fetchCollection('errorLog'),
        fetchCollection('mockTests'),
        fetchCollection('revisionQueue'),
        fetchCollection('studyPlan'),
        fetchCollection('dailyStats'),
      ]);
    } catch (e) {
      print('CloudSyncService syncFromCloud error: $e');
    }

    return result;
  }

  /// Fetch all global PYQs and Mock Tests from Firestore
  Future<Map<String, List<Map<String, dynamic>>>> fetchGlobalData() async {
    final Map<String, List<Map<String, dynamic>>> result = {
      'pyqs': [],
      'mock_tests': [],
    };

    try {
      final pyqsSnap = await _firestore.collection('pyqs').get();
      result['pyqs'] = pyqsSnap.docs.map((d) => d.data()).toList();

      final mocksSnap = await _firestore.collection('mock_tests').get();
      result['mock_tests'] = mocksSnap.docs.map((d) => d.data()).toList();
    } catch (e) {
      print('CloudSyncService fetchGlobalData error: $e');
    }

    return result;
  }

  /// Push all hardcoded offline data to Firebase once
  Future<void> migrateAllHardcodedDataToFirebase() async {
    print("Starting migration of hardcoded data to Firebase...");
    try {
      final storage = StorageService();
      final allPyqs = storage.allSamplePYQs;

      int pyqCount = 0;
      var pyqBatch = _firestore.batch();
      for (var pyq in allPyqs) {
        final doc = _firestore.collection('pyqs').doc(pyq.id);
        pyqBatch.set(doc, pyq.toMap(), SetOptions(merge: true));
        pyqCount++;
        if (pyqCount % 400 == 0) {
          await pyqBatch.commit();
          pyqBatch = _firestore.batch();
        }
      }
      if (pyqCount % 400 != 0) {
        await pyqBatch.commit();
      }
      print("Migrated \$pyqCount PYQs to Firebase.");

      // For mocks, import the global hardcoded mock variables
      final allMocks = [...csitMockQuestions, ...daMockQuestions];
      int mockCount = 0;
      var mockBatch = _firestore.batch();
      for (var mock in allMocks) {
        final doc = _firestore.collection('mock_tests').doc(mock.id);
        mockBatch.set(doc, mock.toMap(), SetOptions(merge: true));
        mockCount++;
        if (mockCount % 400 == 0) {
          await mockBatch.commit();
          mockBatch = _firestore.batch();
        }
      }
      if (mockCount % 400 != 0) {
        await mockBatch.commit();
      }
      print("Migrated \$mockCount Mock Questions to Firebase.");
    } catch (e) {
      print("Error during migration: \$e");
    }
  }
}
