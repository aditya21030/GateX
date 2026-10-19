import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Brand & Accent Color Palette
  static const Color background = Color(0xFF12111A);
  static const Color surface = Color(0xFF1A1828);
  static const Color surfaceElevated = Color(0xFF221F33);
  static const Color primary = Color(0xFF7C3AED); // Vibrant Purple Brand (as reference)
  static const Color primaryLight = Color(0xFF9061F9);
  static const Color secondary = Color(0xFF00D4AA); // Mint Teal
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color error = Color(0xFFFF5252);
  static const Color warning = Color(0xFFFFB74D);
  static const Color success = Color(0xFF00D4AA);

  // Gamification & Accent Tokens (from UI Reference)
  static const Color accentPurple = Color(0xFF7C3AED); // Vibrant Purple
  static const Color accentFlame = Color(0xFFFF7A00); // Streak Orange
  static const Color accentGold = Color(0xFFFFB300); // XP / Trophy Gold
  static const Color accentCoral = Color(0xFFFF4757); // Target Coral
  static const Color accentCyan = Color(0xFF00B4D8); // Diamonds Azure
  static const Color accentMint = Color(0xFF10B981); // Emerald Mint

  // Border & Divider Tokens
  static const Color borderDark = Color(0x18FFFFFF);
  static const Color borderLight = Color(0x0F000000);

  // Light Theme configuration
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFEFF3F8),
      primaryColor: primary,
      colorScheme: const ColorScheme.light(
        primary: primary,
        secondary: secondary,
        surface: Color(0xFFEFF3F8),
        error: error,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Color(0xFF1E293B),
      ),
      cardTheme: const CardThemeData(
        color: Color(0xFFEFF3F8),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(22)),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFEFF3F8),
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: Color(0xFF1E293B)),
        titleTextStyle: TextStyle(
          color: Color(0xFF1E293B),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: primary,
        unselectedItemColor: Color(0xFF9090A0),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.selected)) {
            return primary;
          }
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(Colors.white),
        side: const BorderSide(color: Color(0xFF9090A0), width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      sliderTheme: const SliderThemeData(
        activeTrackColor: primary,
        inactiveTrackColor: Color(0xFFE0E0E0),
        thumbColor: secondary,
        overlayColor: Color(0x2900D4AA),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme).copyWith(
        displayLarge: GoogleFonts.poppins(
          color: const Color(0xFF1A1A24),
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: GoogleFonts.poppins(
          color: const Color(0xFF1A1A24),
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: GoogleFonts.poppins(
          color: const Color(0xFF1A1A24),
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: GoogleFonts.poppins(
          color: const Color(0xFF1A1A24),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: GoogleFonts.inter(
          color: const Color(0xFF1A1A24),
          fontSize: 16,
        ),
        bodyMedium: GoogleFonts.inter(
          color: const Color(0xFF4A4A5A),
          fontSize: 14,
        ),
      ),
    );
  }

  // Dark Theme configuration
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      primaryColor: primary,
      colorScheme: const ColorScheme.dark(
        primary: primary,
        secondary: secondary,
        surface: surface,
        error: error,
        onPrimary: Colors.white,
        onSecondary: background,
        onSurface: textPrimary,
      ),
      cardTheme: const CardThemeData(
        color: surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          side: BorderSide(color: Color(0x18FFFFFF), width: 1),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: background,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: textPrimary),
        titleTextStyle: TextStyle(
          color: textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: surface,
        selectedItemColor: primary,
        unselectedItemColor: textSecondary,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.selected)) {
            return secondary;
          }
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(background),
        side: const BorderSide(color: textSecondary, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      sliderTheme: const SliderThemeData(
        activeTrackColor: primary,
        inactiveTrackColor: surface,
        thumbColor: secondary,
        overlayColor: Color(0x2900D4AA),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme).copyWith(
        displayLarge: GoogleFonts.poppins(
          color: textPrimary,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: GoogleFonts.poppins(
          color: textPrimary,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: GoogleFonts.poppins(
          color: textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: GoogleFonts.poppins(
          color: textPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: GoogleFonts.inter(
          color: textPrimary,
          fontSize: 16,
          height: 1.4,
        ),
        bodyMedium: GoogleFonts.inter(
          color: textSecondary,
          fontSize: 14,
          height: 1.4,
        ),
        labelLarge: GoogleFonts.rajdhani(
          color: textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Rajdhani Font Styles for Timer/Countdown
  static TextStyle timerStyle({required double fontSize, Color color = textPrimary}) {
    return GoogleFonts.rajdhani(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color,
      letterSpacing: 1.5,
    );
  }

  static TextStyle poppinsBold({required double fontSize, Color color = textPrimary}) {
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  static TextStyle monospaceStyle({
    double fontSize = 11.0,
    Color color = textPrimary,
    double height = 1.35,
  }) {
    return GoogleFonts.robotoMono(
      fontSize: fontSize,
      color: color,
      height: height,
    );
  }
}

// Extension to easily access dynamic theme colors anywhere in the app
extension ThemeContextExtension on BuildContext {
  Color get colorBackground => Theme.of(this).scaffoldBackgroundColor;
  Color get scaffoldBackground => colorBackground;
  Color get colorSurface => Theme.of(this).colorScheme.surface;
  Color get surfaceColor => colorSurface;
  Color get colorSurfaceElevated => isDarkMode ? AppTheme.surfaceElevated : const Color(0xFFF0F2F6);
  Color get colorPrimary => Theme.of(this).colorScheme.primary;
  Color get colorSecondary => Theme.of(this).colorScheme.secondary;
  Color get colorBorder => isDarkMode ? AppTheme.borderDark : AppTheme.borderLight;
  Color get textColor => Theme.of(this).brightness == Brightness.dark ? AppTheme.textPrimary : const Color(0xFF1A1A24);
  Color get textSecondaryColor => Theme.of(this).brightness == Brightness.dark ? AppTheme.textSecondary : const Color(0xFF6A6A7A);
  
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
