import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gateda/theme/app_theme.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('AppTheme Dark Theme Loading Test', () {
    final theme = AppTheme.darkTheme;
    expect(theme.brightness, Brightness.dark);
    expect(theme.scaffoldBackgroundColor, AppTheme.background);
    expect(theme.primaryColor, AppTheme.primary);
  });
}
