import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/pomodoro_provider.dart';
import '../theme/app_theme.dart';

class PomodoroScreen extends StatelessWidget {
  const PomodoroScreen({super.key});

  String _formatTime(int totalSeconds) {
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PomodoroProvider>(context);

    // Calculate progress percentage
    double progress = provider.timerTotalSeconds > 0
        ? provider.timerSecondsRemaining / provider.timerTotalSeconds
        : 1.0;

    final isStudy = provider.timerSessionType == 'Study Session';
    final themeColor = isStudy ? AppTheme.primary : AppTheme.secondary;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pomodoro Focus Timer'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            children: [
              const SizedBox(height: 12),
              // Session Status Header
              Text(
                provider.timerSessionType.toUpperCase(),
                style: AppTheme.poppinsBold(
                  fontSize: 22,
                  color: themeColor,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Stay focused, keep distractions away.',
                style: TextStyle(color: AppTheme.textSecondary, fontSize: 13),
              ),
              const SizedBox(height: 24),
              // Current Task Input
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white10),
                ),
                child: TextField(
                  controller: TextEditingController(text: provider.currentTaskName)
                    ..selection = TextSelection.collapsed(offset: provider.currentTaskName.length),
                  onChanged: (val) => provider.setCurrentTask(val),
                  style: const TextStyle(color: AppTheme.textPrimary, fontSize: 15),
                  decoration: InputDecoration(
                    hintText: 'What are you focusing on?',
                    hintStyle: TextStyle(color: AppTheme.textSecondary.withOpacity(0.5)),
                    border: InputBorder.none,
                    icon: Icon(Icons.track_changes, color: themeColor),
                  ),
                ),
              ),
              const SizedBox(height: 36),

              // 1. CIRCULAR COUNTDOWN TIMER
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Outer Glow Effect
                    Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: themeColor.withOpacity(0.08),
                            blurRadius: 40,
                            spreadRadius: 5,
                          )
                        ],
                      ),
                    ),
                    // Track Circle (Background)
                    SizedBox(
                      width: 230,
                      height: 230,
                      child: CircularProgressIndicator(
                        value: 1.0,
                        strokeWidth: 10,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppTheme.surface,
                        ),
                      ),
                    ),
                    // Active Timer Progress
                    SizedBox(
                      width: 230,
                      height: 230,
                      child: CircularProgressIndicator(
                        value: progress,
                        strokeWidth: 10,
                        valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                      ),
                    ),
                    // Timer Text Content
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _formatTime(provider.timerSecondsRemaining),
                          style: AppTheme.timerStyle(fontSize: 48, color: themeColor),
                        ),
                        const SizedBox(height: 6),
                        Icon(
                          isStudy ? Icons.local_library_outlined : Icons.coffee_outlined,
                          color: AppTheme.textSecondary,
                          size: 24,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // 2. CONTROLS
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Reset Button
                  IconButton(
                    onPressed: provider.resetTimer,
                    iconSize: 32,
                    color: AppTheme.textSecondary,
                    icon: const Icon(Icons.replay_circle_filled_rounded),
                    tooltip: 'Reset Timer',
                  ),
                  const SizedBox(width: 24),
                  // Play/Pause Button
                  GestureDetector(
                    onTap: () {
                      if (provider.isTimerRunning) {
                        provider.pauseTimer();
                      } else {
                        provider.startTimer();
                      }
                    },
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: themeColor,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: themeColor.withOpacity(0.35),
                            blurRadius: 16,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                      child: Icon(
                        provider.isTimerRunning ? Icons.pause_rounded : Icons.play_arrow_rounded,
                        color: AppTheme.textPrimary,
                        size: 40,
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  // Skip Session
                  IconButton(
                    onPressed: () {
                      // Skip current session type (Toggle study/break)
                      if (isStudy) {
                        provider.configureTimer(5, 'Break');
                      } else {
                        provider.configureTimer(25, 'Study Session');
                      }
                    },
                    iconSize: 32,
                    color: AppTheme.textSecondary,
                    icon: const Icon(Icons.skip_next_rounded),
                    tooltip: 'Skip Session',
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // 3. PRESETS ROW
              Text(
                'Focus Intervals',
                style: AppTheme.poppinsBold(fontSize: 16),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildPresetButton(context, provider, 25, 5, '25/5 min'),
                  const SizedBox(width: 12),
                  _buildPresetButton(context, provider, 50, 10, '50/10 min'),
                  const SizedBox(width: 12),
                  _buildCustomPresetButton(context, provider),
                ],
              ),
              const SizedBox(height: 40),

              // 4. FOCUS STATS
              Container(
                decoration: BoxDecoration(
                  color: AppTheme.surface.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white10),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.textPrimary.withOpacity(0.2),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  child: Row(
                    children: [
                      // Completed Pomodoros
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              'Completed Today',
                              style: TextStyle(color: AppTheme.textSecondary, fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('🍅 ', style: TextStyle(fontSize: 20)),
                                Text(
                                  '${provider.completedPomodorosToday} Sessions',
                                  style: AppTheme.poppinsBold(fontSize: 16, color: AppTheme.textPrimary),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(width: 1, height: 50, color: Colors.white12),
                      // Focus Time
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              'Total Focus Time',
                              style: TextStyle(color: AppTheme.textSecondary, fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.hourglass_bottom, size: 20, color: AppTheme.secondary),
                                const SizedBox(width: 6),
                                Text(
                                  '${provider.totalFocusMinutesToday} mins',
                                  style: AppTheme.poppinsBold(fontSize: 16, color: AppTheme.secondary),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPresetButton(BuildContext context, PomodoroProvider provider, int studyMin, int breakMin, String label) {
    final isSelected = provider.timerTotalSeconds == (studyMin * 60) && provider.timerSessionType == 'Study Session';
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? AppTheme.primary : AppTheme.surface,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: isSelected ? Colors.transparent : AppTheme.textSecondary.withOpacity(0.2),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      onPressed: () {
        provider.configureTimer(studyMin, 'Study Session');
      },
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
      ),
    );
  }

  Widget _buildCustomPresetButton(BuildContext context, PomodoroProvider provider) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.surface,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: AppTheme.textSecondary.withOpacity(0.2),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      onPressed: () => _showCustomTimerDialog(context, provider),
      child: const Text(
        'Custom',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
      ),
    );
  }

  void _showCustomTimerDialog(BuildContext context, PomodoroProvider provider) {
    final customTimeController = TextEditingController(text: '45');
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppTheme.surface,
          title: const Text('Set Custom Timer'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Enter study duration in minutes:'),
              const SizedBox(height: 12),
              TextField(
                controller: customTimeController,
                keyboardType: TextInputType.number,
                autofocus: true,
                style: const TextStyle(color: AppTheme.textPrimary),
                decoration: const InputDecoration(
                  suffixText: 'minutes',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel', style: TextStyle(color: AppTheme.textSecondary)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primary),
              onPressed: () {
                final mins = int.tryParse(customTimeController.text) ?? 45;
                provider.configureTimer(mins, 'Study Session');
                Navigator.pop(context);
              },
              child: const Text('Set Timer', style: TextStyle(color: AppTheme.textPrimary)),
            ),
          ],
        );
      },
    );
  }
}
