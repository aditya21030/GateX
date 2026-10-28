import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../services/storage_service.dart';
import '../services/notification_service.dart';

class PomodoroProvider with ChangeNotifier, WidgetsBindingObserver {
  final StorageService _storage = StorageService();

  // Pomodoro Timer State
  bool _isTimerRunning = false;
  int _timerSecondsRemaining = 25 * 60;
  int _timerTotalSeconds = 25 * 60;
  String _timerSessionType = 'Study Session'; // Study Session, Break
  int _completedPomodorosToday = 0;
  int _totalFocusMinutesToday = 0;
  String _currentTaskName = '';
  Timer? _ticker;
  final AudioPlayer _audioPlayer = AudioPlayer();
  DateTime? _backgroundTimestamp;

  bool get isTimerRunning => _isTimerRunning;
  int get timerSecondsRemaining => _timerSecondsRemaining;
  int get timerTotalSeconds => _timerTotalSeconds;
  String get timerSessionType => _timerSessionType;
  int get completedPomodorosToday => _completedPomodorosToday;
  int get totalFocusMinutesToday => _totalFocusMinutesToday;
  String get currentTaskName => _currentTaskName;

  void setCurrentTask(String task) {
    _currentTaskName = task;
    notifyListeners();
  }

  Future<void> _playAlarm() async {
    try {
      await _audioPlayer.play(AssetSource('audio/beep.wav'));
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  void init() {
    WidgetsBinding.instance.addObserver(this);
    _initPomodoroStats();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      if (_isTimerRunning) {
        _backgroundTimestamp = DateTime.now();
      }
    } else if (state == AppLifecycleState.resumed) {
      if (_isTimerRunning && _backgroundTimestamp != null) {
        final elapsed = DateTime.now().difference(_backgroundTimestamp!).inSeconds;
        _timerSecondsRemaining -= elapsed;
        _backgroundTimestamp = null;
        if (_timerSecondsRemaining <= 0) {
          _timerSecondsRemaining = 0;
          _completePomodoroSession();
        }
        notifyListeners();
      }
    }
  }

  void _initPomodoroStats() {
    final todayStr = DateTime.now().toIso8601String().substring(0, 10);
    final savedDate = _storage.prefs.getString('pomodoro_date') ?? '';
    
    if (savedDate != todayStr) {
      _storage.prefs.setString('pomodoro_date', todayStr);
      _storage.prefs.setInt('completed_pomodoros_today', 0);
      _storage.prefs.setInt('total_focus_minutes_today', 0);
      _completedPomodorosToday = 0;
      _totalFocusMinutesToday = 0;
    } else {
      _completedPomodorosToday = _storage.prefs.getInt('completed_pomodoros_today') ?? 0;
      _totalFocusMinutesToday = _storage.prefs.getInt('total_focus_minutes_today') ?? 0;
    }
    notifyListeners();
  }

  // Pomodoro Actions
  void startTimer() {
    if (_isTimerRunning) return;
    _isTimerRunning = true;
    NotificationService().schedulePomodoroReminder(_timerSecondsRemaining, _timerSessionType);
    _ticker = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timerSecondsRemaining > 0) {
        _timerSecondsRemaining--;
        notifyListeners();
      } else {
        _completePomodoroSession();
      }
    });
    notifyListeners();
  }

  void pauseTimer() {
    _isTimerRunning = false;
    _ticker?.cancel();
    NotificationService().cancelPomodoroReminder();
    notifyListeners();
  }

  void resetTimer() {
    pauseTimer();
    _timerSecondsRemaining = _timerTotalSeconds;
    notifyListeners();
  }

  void configureTimer(int minutes, String sessionType) {
    pauseTimer();
    _timerTotalSeconds = minutes * 60;
    _timerSecondsRemaining = _timerTotalSeconds;
    _timerSessionType = sessionType;
    notifyListeners();
  }

  void _completePomodoroSession() {
    pauseTimer();
    _playAlarm();
    
    if (_timerSessionType == 'Study Session') {
      final sessionMinutes = _timerTotalSeconds ~/ 60;
      _totalFocusMinutesToday += sessionMinutes;
      _completedPomodorosToday += 1;
      
      _storage.prefs.setInt('completed_pomodoros_today', _completedPomodorosToday);
      _storage.prefs.setInt('total_focus_minutes_today', _totalFocusMinutesToday);

      // Auto switch to break
      configureTimer(5, 'Break');
    } else {
      // Break is complete, auto switch back to study
      configureTimer(25, 'Study Session');
    }
    notifyListeners();
  }

  void resetTodayStats() {
    pauseTimer();
    _completedPomodorosToday = 0;
    _totalFocusMinutesToday = 0;
    _storage.prefs.setInt('completed_pomodoros_today', 0);
    _storage.prefs.setInt('total_focus_minutes_today', 0);
    _timerTotalSeconds = 25 * 60;
    _timerSecondsRemaining = 25 * 60;
    _timerSessionType = 'Study Session';
    notifyListeners();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _ticker?.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }
}
