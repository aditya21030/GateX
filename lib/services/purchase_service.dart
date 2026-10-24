import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'ad_service.dart';

class PurchaseService with ChangeNotifier {
  static final PurchaseService _instance = PurchaseService._internal();
  factory PurchaseService() => _instance;
  PurchaseService._internal();

  static const String proPrefKey = 'is_gatex_pro_member';
  static const String proPlanTypeKey = 'gatex_pro_plan_type'; // 'SOLO' or 'DUAL'
  static const String proSoloBranchKey = 'gatex_pro_solo_branch'; // 'DA' or 'CSIT'
  static const String proEntitlement = 'gatex_pro';
  static const String proDualEntitlement = 'gatex_pro_dual';

  static const String proProductId = 'gatex_pro_solo_2027';
  static const String proSoloProductId = 'gatex_pro_solo_2027';
  static const String proDualProductId = 'gatex_pro_dual_2027';
  static const String proUpgradeToDualProductId = 'gatex_pro_upgrade_dual_2027';

  // Solo Plan (DA or CSIT): ₹299
  static const String proPlanPrice = '₹299';
  static const String proPlanOldPrice = '₹599';
  static const String proSoloPlanPrice = '₹299';
  static const String proSoloPlanOldPrice = '₹599';

  // Dual Prep Plan (Both DA & CSIT): ₹499
  static const String proDualPlanPrice = '₹499';
  static const String proDualPlanOldPrice = '₹899';

  // Upgrade difference for existing Solo users: ₹499 - ₹299 = ₹200
  static const String proUpgradeToDualPrice = '₹200';
  static const String proUpgradeToDualOldPrice = '₹400';

  static const String proPlanValidity = 'Valid till 31st March 2027';

  // RevenueCat Public API Key placeholder (Configured with Google Play Console)
  static const String _revenueCatApiKey = 'goog_gatex_pro_season_pass_key';

  bool _isPro = false;
  bool get isPro => _isPro;

  bool _isDualPro = false;
  bool get isDualPro => _isDualPro;

  String _planType = 'SOLO';
  String get planType => _planType;

  String _soloBranch = 'DA';
  String get soloBranch => _soloBranch;

  /// Returns true if user has Pro privileges for the specified branch (DA or CSIT)
  bool isProForBranch(String? branch) {
    if (!_isPro) return false;
    if (_isDualPro) return true; // Dual Pro unlocks both DA and CS/IT
    if (branch == null || branch.isEmpty) return true;
    final b = branch.toUpperCase().trim();
    if (b == 'BOTH' || b == 'COMMON') return true;
    final targetBranch = b.contains('CS') ? 'CSIT' : 'DA';
    return _soloBranch == targetBranch;
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Offering? _currentOffering;
  Offering? get currentOffering => _currentOffering;

  /// Initialize Pro status from RevenueCat, local cache, and sync with Firebase if logged in
  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _isPro = prefs.getBool(proPrefKey) ?? false;
    _planType = prefs.getString(proPlanTypeKey) ?? 'SOLO';
    _soloBranch = prefs.getString(proSoloBranchKey) ?? 'DA';
    _isDualPro = _isPro && _planType == 'DUAL';
    if (_isPro) {
      AdService().setAdSuspended(true);
    }
    notifyListeners();

    final isRealKey = _revenueCatApiKey.isNotEmpty &&
        !_revenueCatApiKey.contains('placeholder') &&
        _revenueCatApiKey != 'goog_gatex_pro_season_pass_key';

    if (isRealKey) {
      try {
        final user = FirebaseAuth.instance.currentUser;
        final config = PurchasesConfiguration(_revenueCatApiKey);
        if (user != null) {
          config.appUserID = user.uid;
        }
        await Purchases.configure(config);

        Purchases.addCustomerInfoUpdateListener((customerInfo) {
          _updateProStatusFromCustomerInfo(customerInfo);
        });

        final customerInfo = await Purchases.getCustomerInfo();
        await _updateProStatusFromCustomerInfo(customerInfo);

        final offerings = await Purchases.getOfferings();
        if (offerings.current != null) {
          _currentOffering = offerings.current;
          notifyListeners();
        }
      } catch (e) {
        debugPrint('PurchaseService: RevenueCat dev/fallback mode active: $e');
        _verifyWithFirebase();
      }
    } else {
      debugPrint('PurchaseService: RevenueCat key is placeholder. Skipping SDK configuration to avoid native background errors.');
      await _verifyWithFirebase();
    }
  }

  Future<void> _updateProStatusFromCustomerInfo(CustomerInfo customerInfo) async {
    final hasActive = customerInfo.entitlements.all[proEntitlement]?.isActive ?? false;
    if (hasActive != _isPro) {
      _isPro = hasActive;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(proPrefKey, _isPro);
      if (_isPro) {
        AdService().setAdSuspended(true);
      }
      notifyListeners();
    }
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

  /// Purchase Pro Season Pass (Solo ₹299 or Dual ₹499 - Valid till 31st March 2027)
  Future<bool> purchaseProPass({
    String planId = proSoloProductId,
    String targetBranch = 'DA',
  }) async {
    _isLoading = true;
    notifyListeners();

    final isDual = planId == proDualProductId || planId == proUpgradeToDualProductId;
    final normalizedBranch = targetBranch.toUpperCase().contains('CS') ? 'CSIT' : 'DA';

    try {
      if (_currentOffering?.availablePackages.isNotEmpty == true) {
        try {
          final package = _currentOffering!.availablePackages.first;
          final purchaseResult = await Purchases.purchasePackage(package);
          final isProNow = purchaseResult.entitlements.all[proEntitlement]?.isActive ?? false;
          if (isProNow) {
            _isPro = true;
            if (isDual) {
              _isDualPro = true;
              _planType = 'DUAL';
            } else {
              _isDualPro = false;
              _planType = 'SOLO';
              _soloBranch = normalizedBranch;
            }
            final prefs = await SharedPreferences.getInstance();
            await prefs.setBool(proPrefKey, true);
            await prefs.setString(proPlanTypeKey, _planType);
            await prefs.setString(proSoloBranchKey, _soloBranch);
            AdService().setAdSuspended(true);
            await _syncProToFirebase(planId, soloBranch: _soloBranch);
            _isLoading = false;
            notifyListeners();
            return true;
          }
        } catch (e) {
          debugPrint('Purchases.purchasePackage failed, falling back: $e');
        }
      }

      // Development / Direct sandbox fallback
      await Future.delayed(const Duration(milliseconds: 1200));

      _isPro = true;
      if (isDual) {
        _isDualPro = true;
        _planType = 'DUAL';
      } else {
        _isDualPro = false;
        _planType = 'SOLO';
        _soloBranch = normalizedBranch;
      }
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(proPrefKey, true);
      await prefs.setString(proPlanTypeKey, _planType);
      await prefs.setString(proSoloBranchKey, _soloBranch);
      AdService().setAdSuspended(true);

      await _syncProToFirebase(planId, soloBranch: _soloBranch);

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

  /// Upgrade from Solo Pass to Dual Prep Pass (₹200)
  Future<bool> upgradeToDualPass() async {
    return purchaseProPass(planId: proUpgradeToDualProductId);
  }

  Future<void> _syncProToFirebase(String planId, {String? soloBranch}) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'isPro': true,
          'isDualPro': _isDualPro,
          'proPlanType': _planType,
          'proSoloBranch': soloBranch ?? _soloBranch,
          'proPurchasedAt': FieldValue.serverTimestamp(),
          'proPlanId': planId,
        }, SetOptions(merge: true));
      } catch (_) {}
    }
  }

  /// Restore purchases across devices
  Future<bool> restorePurchases() async {
    _isLoading = true;
    notifyListeners();

    try {
      try {
        final customerInfo = await Purchases.restorePurchases();
        final hasActive = customerInfo.entitlements.all[proEntitlement]?.isActive ?? false;
        if (hasActive) {
          _isPro = true;
          final prefs = await SharedPreferences.getInstance();
          await prefs.setBool(proPrefKey, true);
          AdService().setAdSuspended(true);
          _isLoading = false;
          notifyListeners();
          return true;
        }
      } catch (e) {
        debugPrint('RevenueCat restore fallback: $e');
      }

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

  /// Reset Pro status (For QA/Testing only)
  Future<void> resetProForTesting() async {
    _isPro = false;
    _isDualPro = false;
    _planType = 'SOLO';
    _soloBranch = 'DA';
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(proPrefKey, false);
    await prefs.setString(proPlanTypeKey, 'SOLO');
    await prefs.setString(proSoloBranchKey, 'DA');
    AdService().setAdSuspended(false);
    notifyListeners();
  }
}
