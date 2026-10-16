import 'dart:math';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class UIUtils {
  static final List<String> _iitQuotes = [
    "Keep pushing, IIT Bombay is waiting for you!",
    "A wrong answer is just a step closer to IIT Delhi.",
    "Don't give up, IISc Bangalore needs minds like yours.",
    "Stay focused! Your IIT dream is alive.",
    "Every mistake is a lesson for IIT Madras.",
    "IIT Kanpur rewards persistence. Try again!",
    "Success at IIT Roorkee demands resilience."
  ];

  static void showTopError(BuildContext context, String message) {
    final random = Random();
    final quote = _iitQuotes[random.nextInt(_iitQuotes.length)];
    
    // Calculate the top margin dynamically based on screen height
    final screenHeight = MediaQuery.of(context).size.height;
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: screenHeight - 160 > 0 ? screenHeight - 160 : 0, 
          left: 16,
          right: 16,
        ),
        content: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppTheme.error.withOpacity(0.95),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppTheme.error.withOpacity(0.4),
                blurRadius: 20,
                spreadRadius: 2,
              )
            ],
            border: Border.all(color: Colors.redAccent.shade100, width: 1.5),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.error_outline_rounded, color: Colors.white, size: 24),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      message.replaceAll('Exception: ', ''),
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  quote,
                  style: const TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        duration: const Duration(seconds: 4),
      ),
    );
  }
}
