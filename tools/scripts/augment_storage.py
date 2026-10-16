import re

with open('lib/services/storage_service.dart', 'r', encoding='utf-8') as f:
    content = f.read()

if 'cloud_sync_service.dart' not in content:
    content = content.replace("import '../models/models.dart';", "import '../models/models.dart';\nimport 'cloud_sync_service.dart';")

# In updateStreak, we want to push to cloud if streak changes
streak_pattern = re.compile(r"await _prefs\.setInt\('current_streak', currentStreak\);\n\s*await _prefs\.setString\('last_open_date', todayStr\);")
def streak_replacer(match):
    return f"{match.group(0)}\n    CloudSyncService().pushSettings({{'current_streak': currentStreak, 'last_open_date': todayStr}});"
content = streak_pattern.sub(streak_replacer, content)

# Also add restoreFromCloud method to StorageService
restore_method = """
  Future<void> restoreFromCloud(String uid) async {
    final cloudData = await CloudSyncService().syncFromCloud(uid);
    
    // 1. Settings
    if (cloudData['settings']!.isNotEmpty) {
      final s = cloudData['settings']!;
      if (s.containsKey('current_streak')) await _prefs.setInt('current_streak', s['current_streak']);
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
        await box.clear(); // Clear existing local data for this box
        for (var doc in cloudCol.entries) {
          await box.put(doc.key, doc.value);
        }
      }
    }
  }
"""

if 'restoreFromCloud(String uid)' not in content:
    content = content.replace("Future<void> resetAllData() async {", f"{restore_method}\n\n  Future<void> resetAllData() async {{")

with open('lib/services/storage_service.dart', 'w', encoding='utf-8') as f:
    f.write(content)

print("Augmented StorageService with cloud sync.")
