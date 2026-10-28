import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_10y.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  bool _initialized = false;

  Future<void> init() async {
    if (_initialized) return;

    // Timezone data
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Kolkata')); // For GATE aspirants (IST)

    // Only configure local notifications on Android/iOS
    if (kIsWeb || (!Platform.isAndroid && !Platform.isIOS)) {
      _initialized = true;
      debugPrint("Notifications disabled: not on Android or iOS");
      return;
    }

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/launcher_icon');

    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await _notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        debugPrint("Notification clicked: ${response.payload}");
      },
    );

    _initialized = true;
  }

  Future<void> requestPermissions() async {
    if (kIsWeb || (!Platform.isAndroid && !Platform.isIOS)) return;

    if (Platform.isAndroid) {
      final androidImplementation =
          _notificationsPlugin.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();
      if (androidImplementation != null) {
        await androidImplementation.requestNotificationsPermission();
      }
    }
  }

  // Schedule daily study reminder
  Future<void> scheduleDailyReminder(int hour, int minute, String todaySubject, String todayTopic) async {
    if (kIsWeb || (!Platform.isAndroid && !Platform.isIOS)) return;

    await cancelDailyReminder();

    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    // If the scheduled time is in the past, schedule it for tomorrow
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'daily_study_reminders',
      'Daily Study Reminders',
      channelDescription: 'Reminds you of your daily GATE DA topic plan',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
    );

    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
    );

    await _notificationsPlugin.zonedSchedule(
      100, // ID for daily reminder
      'Time to study! 📐',
      'Today: $todaySubject — $todayTopic',
      scheduledDate,
      platformDetails,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
    debugPrint("Scheduled daily study reminder for $hour:$minute");
  }

  // Schedule streak warning reminder at 9:00 PM
  Future<void> scheduleStreakReminder() async {
    if (kIsWeb || (!Platform.isAndroid && !Platform.isIOS)) return;

    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      21, // 9:00 PM
      0,
    );

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'streak_reminders',
      'Streak Reminders',
      channelDescription: 'Reminds you to keep your study streak alive',
      importance: Importance.high,
      priority: Priority.high,
    );

    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
    );

    await _notificationsPlugin.zonedSchedule(
      101, // ID for streak reminder
      'Keep your streak alive! 🔥',
      'Don\'t forget to complete your GATE DA topics for today!',
      scheduledDate,
      platformDetails,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
    debugPrint("Scheduled daily streak reminder for 21:00");
  }

  Future<void> schedulePomodoroReminder(int seconds, String sessionType) async {
    if (!_initialized || kIsWeb || (!Platform.isAndroid && !Platform.isIOS)) return;
    await cancelPomodoroReminder();

    final scheduledDate = tz.TZDateTime.now(tz.local).add(Duration(seconds: seconds));

    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'pomodoro_channel',
      'Pomodoro Focus Timer',
      channelDescription: 'Alerts when your Pomodoro focus session or break is complete',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      enableVibration: true,
    );

    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
    );

    await _notificationsPlugin.zonedSchedule(
      102,
      '$sessionType Complete! 🎯',
      sessionType == 'Break'
          ? 'Break over! Ready to resume your GATE preparation deep work?'
          : 'Great focus! Take a 5-minute breather to refresh your mind.',
      scheduledDate,
      platformDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> cancelPomodoroReminder() async {
    if (kIsWeb || (!Platform.isAndroid && !Platform.isIOS)) return;
    await _notificationsPlugin.cancel(102);
  }

  Future<void> cancelDailyReminder() async {
    if (kIsWeb || (!Platform.isAndroid && !Platform.isIOS)) return;
    await _notificationsPlugin.cancel(100);
  }

  Future<void> cancelAll() async {
    if (kIsWeb || (!Platform.isAndroid && !Platform.isIOS)) return;
    await _notificationsPlugin.cancelAll();
  }
}
