import 'package:flutter/material.dart';
import 'login_screen.dart';

// Re-export LoginScreen as AuthScreen for backwards compatibility
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginScreen();
  }
}
