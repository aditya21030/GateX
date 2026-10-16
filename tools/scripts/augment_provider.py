import re

with open('lib/providers/app_provider.dart', 'r', encoding='utf-8') as f:
    content = f.read()

# Add import for CloudSyncService
if 'cloud_sync_service.dart' not in content:
    content = content.replace("import '../services/storage_service.dart';", "import '../services/storage_service.dart';\nimport '../services/cloud_sync_service.dart';")

# Regex to find box puts
put_pattern = re.compile(r'await _storage\.([a-zA-Z]+Box)\.put\(([^,]+),\s*(.+?\.toMap\(\))\);')
def put_replacer(match):
    box_name = match.group(1) # e.g. pyqBox
    key = match.group(2)
    val = match.group(3)
    
    col_name = box_name.replace('Box', 's') if not box_name.endswith('sBox') else box_name.replace('Box', '')
    if box_name == 'topicStatusBox': col_name = "'topicStatus'"
    elif box_name == 'pyqBox': col_name = "'pyqs'"
    elif box_name == 'errorLogBox': col_name = "'errorLog'"
    elif box_name == 'mockTestBox': col_name = "'mockTests'"
    elif box_name == 'revisionQueueBox': col_name = "'revisionQueue'"
    elif box_name == 'studyPlanBox': col_name = "'studyPlan'"
    else: col_name = f"'{box_name.replace('Box', '')}'"

    return f"{match.group(0)}\n      CloudSyncService().pushToCloud({col_name}, {key}.toString(), {val});"

content = put_pattern.sub(put_replacer, content)

# Regex to find box deletes
delete_pattern = re.compile(r'await _storage\.([a-zA-Z]+Box)\.delete\(([^)]+)\);')
def delete_replacer(match):
    box_name = match.group(1)
    key = match.group(2)
    
    if box_name == 'topicStatusBox': col_name = "'topicStatus'"
    elif box_name == 'pyqBox': col_name = "'pyqs'"
    elif box_name == 'errorLogBox': col_name = "'errorLog'"
    elif box_name == 'mockTestBox': col_name = "'mockTests'"
    elif box_name == 'revisionQueueBox': col_name = "'revisionQueue'"
    elif box_name == 'studyPlanBox': col_name = "'studyPlan'"
    else: col_name = f"'{box_name.replace('Box', '')}'"

    return f"{match.group(0)}\n      CloudSyncService().deleteFromCloud({col_name}, {key}.toString());"

content = delete_pattern.sub(delete_replacer, content)

# Add settings push
if "await _storage.prefs.setBool('notifications_enabled', enabled);" in content:
    settings_push = "      CloudSyncService().pushSettings({'notifications_enabled': enabled, 'notification_time': timeStr});"
    content = content.replace(
        "await _storage.prefs.setString('notification_time', timeStr);",
        f"await _storage.prefs.setString('notification_time', timeStr);\n{settings_push}"
    )

with open('lib/providers/app_provider.dart', 'w', encoding='utf-8') as f:
    f.write(content)

print("Augmented AppProvider with CloudSyncService calls.")
