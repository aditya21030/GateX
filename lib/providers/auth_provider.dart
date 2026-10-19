import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:flutter/services.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  User? _user;

  bool get isLoggedIn => _user != null;
  String get userName => _user?.displayName ?? _user?.email?.split('@')[0] ?? 'Guest Student';
  String get userEmail => _user?.email ?? '';

  Future<void> init() async {
    // Initialize GoogleSignIn (v7 requirement)
    await GoogleSignIn.instance.initialize();

    // Listen to authentication state changes
    _auth.authStateChanges().listen((User? user) {
      _user = user;
      notifyListeners();
    });
  }

  String _getFriendlyErrorMessage(dynamic e) {
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'user-not-found':
        case 'wrong-password':
        case 'invalid-credential':
          return 'Incorrect email or password. Please try again.';
        case 'email-already-in-use':
          return 'An account already exists for that email.';
        case 'weak-password':
          return 'Your password is too weak. Please use at least 6 characters.';
        case 'invalid-email':
          return 'The email address is invalid.';
        case 'user-disabled':
          return 'This user account has been disabled.';
        case 'too-many-requests':
          return 'Too many login attempts. Please try again later.';
        default:
          return e.message ?? 'Authentication failed. Please try again.';
      }
    } else if (e is PlatformException) {
      if (e.code == 'sign_in_canceled') {
        return 'Google Sign-In was canceled. Note: If it cancelled instantly, ensure you have added your PC\'s SHA-1 key to the Firebase Console.';
      } else if (e.code == 'network_error') {
        return 'Network error. Please check your internet connection.';
      }
    } else if (e.toString().contains('network')) {
      return 'Network error. Please check your internet connection.';
    }
    return 'An unexpected error occurred. Please try again.';
  }

  Future<bool> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return false; // Not a new user
    } catch (e) {
      throw _getFriendlyErrorMessage(e);
    }
  }

  Future<bool> signup(String name, String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );
      await userCredential.user?.updateDisplayName(name);
      await userCredential.user?.reload();
      _user = _auth.currentUser;
      notifyListeners();
      return true; // Is a new user
    } catch (e) {
      throw _getFriendlyErrorMessage(e);
    }
  }
  
  Future<bool> loginWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await GoogleSignIn.instance.authenticate();
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      return userCredential.additionalUserInfo?.isNewUser ?? false;
    } catch (e) {
      throw _getFriendlyErrorMessage(e);
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    await GoogleSignIn.instance.signOut();
  }

  Future<void> changePassword(String currentPassword, String newPassword) async {
    try {
      final user = _auth.currentUser;
      if (user == null || user.email == null) throw 'User not logged in';
      
      AuthCredential credential = EmailAuthProvider.credential(
        email: user.email!, 
        password: currentPassword
      );
      
      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(newPassword);
    } catch (e) {
      throw _getFriendlyErrorMessage(e);
    }
  }
  
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw _getFriendlyErrorMessage(e);
    }
  }
  
  Future<void> updateProfile({required String name}) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        await user.updateDisplayName(name);
        await user.reload();
        _user = _auth.currentUser;
        notifyListeners();
      }
    } catch (e) {
      throw _getFriendlyErrorMessage(e);
    }
  }
}
