class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  Future<void> init() async {
    // No-op for Web / Desktop
  }

  Future<void> requestPermissions() async {
    // No-op for Web / Desktop
  }

  Future<void> scheduleDailyReminder(int hour, int minute, String todaySubject, String todayTopic) async {
    // No-op for Web / Desktop
  }

  Future<void> scheduleStreakReminder() async {
    // No-op for Web / Desktop
  }

  Future<void> cancelDailyReminder() async {
    // No-op for Web / Desktop
  }

  Future<void> cancelAll() async {
    // No-op for Web / Desktop
  }
}
