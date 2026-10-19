import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../providers/pomodoro_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/neu_widgets.dart';

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
    final themeColor = isStudy ? AppTheme.accentPurple : AppTheme.accentMint;

    return Scaffold(
      backgroundColor: context.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Focus Timer', style: AppTheme.poppinsBold(fontSize: 16, color: context.textColor)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, size: 18, color: context.textColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: Column(
            children: [
              // Session Status Pill
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: themeColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isStudy ? Icons.local_fire_department_rounded : Icons.coffee_rounded,
                      size: 16,
                      color: themeColor,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      provider.timerSessionType.toUpperCase(),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: themeColor,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),

              // Current Task Input in Recessed Well
              NeuContainer(
                isRecessed: true,
                borderRadius: 16,
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
                child: TextField(
                  controller: TextEditingController(text: provider.currentTaskName)
                    ..selection = TextSelection.collapsed(offset: provider.currentTaskName.length),
                  onChanged: (val) => provider.setCurrentTask(val),
                  style: TextStyle(color: context.textColor, fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'What topic are you studying? (e.g. Linear Algebra)',
                    hintStyle: TextStyle(color: context.textSecondaryColor, fontSize: 13),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    icon: Icon(Icons.track_changes_rounded, color: themeColor, size: 20),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // 1. NEUMORPHIC CIRCULAR COUNTDOWN DIAL
              Center(
                child: SizedBox(
                  width: 240,
                  height: 240,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Recessed Outer Well
                      NeuContainer(
                        isRecessed: true,
                        borderRadius: 120,
                        padding: const EdgeInsets.all(12),
                        child: const SizedBox.expand(),
                      ),
                      // Progress Ring
                      SizedBox(
                        width: 216,
                        height: 216,
                        child: CircularProgressIndicator(
                          value: progress,
                          strokeWidth: 8,
                          backgroundColor: Colors.transparent,
                          valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                        ),
                      ),
                      // Extruded Center Dial
                      NeuContainer(
                        borderRadius: 90,
                        padding: const EdgeInsets.all(28),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _formatTime(provider.timerSecondsRemaining),
                              style: AppTheme.timerStyle(fontSize: 38, color: context.textColor),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              isStudy ? 'STUDY' : 'REST',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: themeColor,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 36),

              // 2. CONTROLS (Reset, Play/Pause, Skip)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Reset Button
                  GestureDetector(
                    onTap: () {
                      HapticFeedback.mediumImpact();
                      provider.resetTimer();
                    },
                    child: NeuContainer(
                      borderRadius: 16,
                      padding: const EdgeInsets.all(14),
                      child: Icon(Icons.replay_rounded, size: 22, color: context.textSecondaryColor),
                    ),
                  ),
                  const SizedBox(width: 20),

                  // Main Play/Pause Button
                  GestureDetector(
                    onTap: () {
                      HapticFeedback.mediumImpact();
                      if (provider.isTimerRunning) {
                        provider.pauseTimer();
                      } else {
                        provider.startTimer();
                      }
                    },
                    child: NeuContainer(
                      borderRadius: 34,
                      padding: const EdgeInsets.all(18),
                      child: Icon(
                        provider.isTimerRunning ? Icons.pause_rounded : Icons.play_arrow_rounded,
                        color: themeColor,
                        size: 34,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),

                  // Skip Session Button
                  GestureDetector(
                    onTap: () {
                      HapticFeedback.mediumImpact();
                      if (isStudy) {
                        provider.configureTimer(5, 'Break');
                      } else {
                        provider.configureTimer(25, 'Study Session');
                      }
                    },
                    child: NeuContainer(
                      borderRadius: 16,
                      padding: const EdgeInsets.all(14),
                      child: Icon(Icons.skip_next_rounded, size: 22, color: context.textSecondaryColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // 3. PRESETS ROW
              Text(
                'Focus Intervals',
                style: AppTheme.poppinsBold(fontSize: 14, color: context.textColor),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildPresetButton(context, provider, 25, 5, '25/5 min'),
                  const SizedBox(width: 10),
                  _buildPresetButton(context, provider, 50, 10, '50/10 min'),
                  const SizedBox(width: 10),
                  _buildCustomPresetButton(context, provider),
                ],
              ),
              const SizedBox(height: 28),

              // 4. FOCUS STATS IN NEUCONTAINER
              NeuContainer(
                borderRadius: 20,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  children: [
                    // Completed Pomodoros
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'COMPLETED TODAY',
                            style: TextStyle(color: context.textSecondaryColor, fontSize: 10.5, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('🍅 ', style: TextStyle(fontSize: 16)),
                              Text(
                                '${provider.completedPomodorosToday}',
                                style: AppTheme.poppinsBold(fontSize: 18, color: context.textColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(width: 1, height: 40, color: context.isDarkMode ? Colors.white12 : Colors.black12),
                    // Focus Time
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'TOTAL FOCUS TIME',
                            style: TextStyle(color: context.textSecondaryColor, fontSize: 10.5, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.timer_outlined, size: 16, color: AppTheme.accentPurple),
                              const SizedBox(width: 4),
                              Text(
                                '${provider.totalFocusMinutesToday}m',
                                style: AppTheme.poppinsBold(fontSize: 18, color: AppTheme.accentPurple),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPresetButton(BuildContext context, PomodoroProvider provider, int studyMin, int breakMin, String label) {
    final isSelected = provider.timerTotalSeconds == (studyMin * 60) && provider.timerSessionType == 'Study Session';

    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        provider.configureTimer(studyMin, 'Study Session');
      },
      child: NeuContainer(
        isRecessed: isSelected,
        borderRadius: 14,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12.5,
            color: isSelected ? AppTheme.accentPurple : context.textColor,
          ),
        ),
      ),
    );
  }

  Widget _buildCustomPresetButton(BuildContext context, PomodoroProvider provider) {
    return GestureDetector(
      onTap: () => _showCustomTimerDialog(context, provider),
      child: NeuContainer(
        borderRadius: 14,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Text(
          'Custom',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12.5,
            color: context.textColor,
          ),
        ),
      ),
    );
  }

  void _showCustomTimerDialog(BuildContext context, PomodoroProvider provider) {
    final customTimeController = TextEditingController(text: '45');
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: context.scaffoldBackground,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text('Custom Study Duration', style: AppTheme.poppinsBold(fontSize: 16, color: context.textColor)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Enter study duration in minutes:', style: TextStyle(color: context.textSecondaryColor, fontSize: 13)),
              const SizedBox(height: 14),
              NeuContainer(
                isRecessed: true,
                borderRadius: 14,
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
                child: TextField(
                  controller: customTimeController,
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  style: TextStyle(color: context.textColor, fontSize: 15),
                  decoration: InputDecoration(
                    suffixText: 'mins',
                    suffixStyle: TextStyle(color: context.textSecondaryColor, fontSize: 13),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel', style: TextStyle(color: context.textSecondaryColor)),
            ),
            NeuButton(
              isPrimary: true,
              borderRadius: 12,
              height: 38,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              onPressed: () {
                final mins = int.tryParse(customTimeController.text) ?? 45;
                provider.configureTimer(mins, 'Study Session');
                Navigator.pop(context);
              },
              child: const Text('Set Timer', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
            ),
          ],
        );
      },
    );
  }
}
