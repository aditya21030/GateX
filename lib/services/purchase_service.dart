import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'ad_service.dart';

class PurchaseService with ChangeNotifier {
  static final PurchaseService _instance = PurchaseService._internal();
  factory PurchaseService() => _instance;
  PurchaseService._internal();

  static const String proPrefKey = 'is_gatex_pro_member';
  static const String proProductId = 'gatex_pro_season_pass_2027';
  static const String proPlanPrice = '₹199';
  static const String proPlanOldPrice = '₹499';

  bool _isPro = false;
  bool get isPro => _isPro;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  /// Initialize Pro status from local cache and sync with Firebase if logged in
  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _isPro = prefs.getBool(proPrefKey) ?? false;
    if (_isPro) {
      AdService().setAdSuspended(true);
    }
    notifyListeners();

    // Verify online in background if user is authenticated
    _verifyWithFirebase();
  }

  Future<void> _verifyWithFirebase() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final doc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
        if (doc.exists && doc.data() != null) {
          final cloudPro = doc.data()!['isPro'] as bool? ?? false;
          if (cloudPro != _isPro) {
            _isPro = cloudPro;
            final prefs = await SharedPreferences.getInstance();
            await prefs.setBool(proPrefKey, _isPro);
            if (_isPro) {
              AdService().setAdSuspended(true);
            }
            notifyListeners();
          }
        }
      }
    } catch (e) {
      debugPrint('PurchaseService: Offline verification fallback active. Error: $e');
    }
  }

  /// Purchase Pro Season Pass (₹199 one-time)
  Future<bool> purchaseProPass({String planId = proProductId}) async {
    _isLoading = true;
    notifyListeners();

    try {
      // Simulate/Trigger billing workflow
      await Future.delayed(const Duration(milliseconds: 1200));

      _isPro = true;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(proPrefKey, true);
      AdService().setAdSuspended(true);

      // Sync to Firestore user doc if logged in
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'isPro': true,
          'proPurchasedAt': FieldValue.serverTimestamp(),
          'proPlanId': planId,
        }, SetOptions(merge: true));
      }

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      debugPrint('Purchase failed: $e');
      return false;
    }
  }

  /// Restore purchases across devices
  Future<bool> restorePurchases() async {
    _isLoading = true;
    notifyListeners();

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final doc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
        if (doc.exists && (doc.data()?['isPro'] == true)) {
          _isPro = true;
          final prefs = await SharedPreferences.getInstance();
          await prefs.setBool(proPrefKey, true);
          AdService().setAdSuspended(true);
          _isLoading = false;
          notifyListeners();
          return true;
        }
      }

      // Check local storage fallback
      final prefs = await SharedPreferences.getInstance();
      _isPro = prefs.getBool(proPrefKey) ?? false;
      if (_isPro) {
        AdService().setAdSuspended(true);
      }
      _isLoading = false;
      notifyListeners();
      return _isPro;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  /// For testing/debugging entitlement resets
  Future<void> debugResetPro() async {
    _isPro = false;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(proPrefKey, false);
    AdService().setAdSuspended(false);
    notifyListeners();
  }
}
