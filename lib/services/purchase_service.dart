import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import '../config/revenuecat_config.dart';
import 'ad_service.dart';

class PurchaseService with ChangeNotifier {
  static final PurchaseService _instance = PurchaseService._internal();
  factory PurchaseService() => _instance;
  PurchaseService._internal();

  static const String proPrefKey = 'is_gatex_pro_member';
  static const String proPlanTypeKey = 'gatex_pro_plan_type'; // 'SOLO' or 'DUAL'
  static const String proSoloBranchKey = 'gatex_pro_solo_branch'; // 'DA' or 'CSIT'

  // Backwards-compatible aliases referencing RevenueCatConfig
  static const String proEntitlement = RevenueCatConfig.entitlementPro;
  static const String proDualEntitlement = RevenueCatConfig.entitlementDualPro;

  static const String proProductId = RevenueCatConfig.productSoloId;
  static const String proSoloProductId = RevenueCatConfig.productSoloId;
  static const String proDualProductId = RevenueCatConfig.productDualId;
  static const String proUpgradeToDualProductId = RevenueCatConfig.productUpgradeDualId;

  // Static Fallback Prices (when offline or Google Play prices not yet cached)
  static const String proPlanPrice = '₹299';
  static const String proPlanOldPrice = '₹599';
  static const String proSoloPlanPrice = '₹299';
  static const String proSoloPlanOldPrice = '₹599';
  static const String proDualPlanPrice = '₹499';
  static const String proDualPlanOldPrice = '₹899';
  static const String proUpgradeToDualPrice = '₹200';
  static const String proUpgradeToDualOldPrice = '₹400';

  static const String proPlanValidity = 'Valid till 31st March 2027';

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
    final currentSolo = _soloBranch.toUpperCase().contains('CS') ? 'CSIT' : 'DA';
    return currentSolo == targetBranch;
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Offering? _currentOffering;
  Offering? get currentOffering => _currentOffering;

  /// Returns localized price string for Solo Pass from RevenueCat, or fallback
  String getSoloPriceString() {
    final pkg = findPackageForPlan(proSoloProductId);
    return pkg?.storeProduct.priceString ?? proSoloPlanPrice;
  }

  /// Returns localized price string for Dual Prep Pass from RevenueCat, or fallback
  String getDualPriceString() {
    final pkg = findPackageForPlan(proDualProductId);
    return pkg?.storeProduct.priceString ?? proDualPlanPrice;
  }

  /// Returns localized price string for Solo -> Dual Upgrade from RevenueCat, or fallback
  String getUpgradePriceString() {
    final pkg = findPackageForPlan(proUpgradeToDualProductId);
    return pkg?.storeProduct.priceString ?? proUpgradeToDualPrice;
  }

  /// Finds matching package by storeProduct id or package identifier
  Package? findPackageForPlan(String planId) {
    if (_currentOffering == null) return null;

    // 1. Exact match by product identifier or package identifier
    for (final pkg in _currentOffering!.availablePackages) {
      if (pkg.storeProduct.identifier == planId || pkg.identifier == planId) {
        return pkg;
      }
    }

    // 2. Strict type/keyword match - ensure upgrade packages NEVER match full dual or solo
    for (final pkg in _currentOffering!.availablePackages) {
      final id = pkg.identifier.toLowerCase();
      final prodId = pkg.storeProduct.identifier.toLowerCase();
      final isUpgrade = id.contains('upgrade') || prodId.contains('upgrade');

      if (planId == proUpgradeToDualProductId) {
        if (isUpgrade) return pkg;
      } else if (planId == proDualProductId) {
        if (!isUpgrade && (id.contains('dual') || prodId.contains('dual') || pkg.packageType == PackageType.lifetime)) {
          return pkg;
        }
      } else if (planId == proSoloProductId) {
        final isDual = id.contains('dual') || prodId.contains('dual');
        if (!isUpgrade && !isDual && (id.contains('solo') || prodId.contains('solo') || pkg.packageType == PackageType.annual)) {
          return pkg;
        }
      }
    }

    return null;
  }

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

    if (RevenueCatConfig.isConfigured) {
      try {
        final user = FirebaseAuth.instance.currentUser;
        final config = PurchasesConfiguration(RevenueCatConfig.apiKey);
        if (user != null) {
          config.appUserID = user.uid;
        }
        await Purchases.configure(config);

        Purchases.addCustomerInfoUpdateListener((customerInfo) {
          _updateProStatusFromCustomerInfo(customerInfo);
        });

        final customerInfo = await Purchases.getCustomerInfo();
        await _updateProStatusFromCustomerInfo(customerInfo);

        await refreshOfferings();
      } catch (e) {
        debugPrint('PurchaseService: RevenueCat init fallback: $e');
        await _verifyWithFirebase();
      }
    } else {
      debugPrint('PurchaseService: RevenueCat key is placeholder. Using local & Firebase sync.');
      await _verifyWithFirebase();
    }
  }

  /// Refresh offerings from RevenueCat
  Future<void> refreshOfferings() async {
    if (!RevenueCatConfig.isConfigured) return;
    try {
      final offerings = await Purchases.getOfferings();
      if (offerings.current != null) {
        _currentOffering = offerings.current;
        notifyListeners();
      }
    } catch (e) {
      debugPrint('PurchaseService: Failed to fetch offerings: $e');
    }
  }

  /// Synchronize logged-in Firebase user with RevenueCat and Cloud Firestore
  Future<void> syncUser(String? userId) async {
    try {
      if (userId != null && userId.isNotEmpty) {
        if (RevenueCatConfig.isConfigured) {
          try {
            final logInResult = await Purchases.logIn(userId);
            await _updateProStatusFromCustomerInfo(logInResult.customerInfo);
          } catch (e) {
            debugPrint('PurchaseService.syncUser RevenueCat error: ');
          }
        }

        // Bidirectional sync:
        // 1. If user already holds Pro locally (e.g. guest purchase), associate it with their newly linked Firebase account
        if (_isPro) {
          await _syncProToFirebase(_isDualPro ? proDualProductId : proSoloProductId, soloBranch: _soloBranch);
        } else {
          // 2. If not Pro locally, restore entitlements attached to their Firebase account
          await _verifyWithFirebase();
        }
      } else {
        if (RevenueCatConfig.isConfigured) {
          try {
            final isAnonymous = await Purchases.isAnonymous;
            if (!isAnonymous) {
              final customerInfo = await Purchases.logOut();
              await _updateProStatusFromCustomerInfo(customerInfo);
            }
          } catch (e) {
            debugPrint('PurchaseService.syncUser logOut error: ');
          }
        }
      }
    } catch (e) {
      debugPrint('PurchaseService.syncUser error: ');
    }
  }

  Future<void> _updateProStatusFromCustomerInfo(CustomerInfo customerInfo) async {
    final isDual = customerInfo.entitlements.all[RevenueCatConfig.entitlementDualPro]?.isActive ?? false;
    final isSolo = customerInfo.entitlements.all[RevenueCatConfig.entitlementPro]?.isActive ?? false;
    final hasActive = isDual || isSolo;

    final prefs = await SharedPreferences.getInstance();
    if (hasActive) {
      _isPro = true;
      _isDualPro = isDual;
      _planType = isDual ? 'DUAL' : 'SOLO';
      await prefs.setBool(proPrefKey, true);
      await prefs.setString(proPlanTypeKey, _planType);
      AdService().setAdSuspended(true);

      // If Solo pass, reconcile specific branch (DA vs CSIT) from Firebase cloud backup
      if (!isDual) {
        await _verifyWithFirebase();
      }
    } else {
      _isPro = false;
      _isDualPro = false;
      await prefs.setBool(proPrefKey, false);
      AdService().setAdSuspended(false);
    }
    notifyListeners();
  }

  Future<void> _verifyWithFirebase() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final doc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
        if (doc.exists && doc.data() != null) {
          final cloudPro = doc.data()!['isPro'] as bool? ?? false;
          final cloudDual = doc.data()!['isDualPro'] as bool? ?? false;
          final cloudPlan = doc.data()!['proPlanType'] as String? ?? 'SOLO';
          final rawBranch = doc.data()!['proSoloBranch'] as String? ?? 'DA';
          final cloudBranch = rawBranch.toUpperCase().contains('CS') ? 'CSIT' : 'DA';

          if (cloudPro != _isPro || cloudDual != _isDualPro || cloudPlan != _planType || cloudBranch != _soloBranch) {
            _isPro = cloudPro;
            _isDualPro = cloudDual;
            _planType = cloudPlan;
            _soloBranch = cloudBranch;
            final prefs = await SharedPreferences.getInstance();
            await prefs.setBool(proPrefKey, _isPro);
            await prefs.setString(proPlanTypeKey, _planType);
            await prefs.setString(proSoloBranchKey, _soloBranch);
            if (_isPro) {
              AdService().setAdSuspended(true);
            }
            notifyListeners();
          }
        }
      }
    } catch (e) {
      debugPrint('PurchaseService: Offline verification fallback active. Error: ');
    }
  }

  /// Purchase Pro Season Pass (Solo ₹299 or Dual ₹499 - Valid till 31st March 2027)
  Future<bool> purchaseProPass({
    String planId = proSoloProductId,
    String targetBranch = 'DA',
  }) async {
    if (_isDualPro) {
      debugPrint('PurchaseService: Dual Pro already active. No purchase needed.');
      return true;
    }

    _isLoading = true;
    notifyListeners();

    final isDual = planId == proDualProductId || planId == proUpgradeToDualProductId;
    final normalizedBranch = targetBranch.toUpperCase().contains('CS') ? 'CSIT' : 'DA';

    try {
      if (RevenueCatConfig.isConfigured) {
        final package = findPackageForPlan(planId);
        if (package == null) {
          debugPrint('PurchaseService: Package not found in current offering for plan: $planId');
          _isLoading = false;
          notifyListeners();
          return false;
        }

        try {
          final purchaseResult = await Purchases.purchasePackage(package);
          final customerInfo = purchaseResult.customerInfo;
          final isDualActive = customerInfo.entitlements.all[RevenueCatConfig.entitlementDualPro]?.isActive ?? false;
          final isSoloActive = customerInfo.entitlements.all[RevenueCatConfig.entitlementPro]?.isActive ?? false;

          // STRICT CHECK: Entitlement MUST be active in RevenueCat
          if (isDualActive || isSoloActive) {
            _isPro = true;
            _isDualPro = isDualActive || isDual;
            _planType = _isDualPro ? 'DUAL' : 'SOLO';
            if (!_isDualPro) {
              _soloBranch = normalizedBranch;
            }
            final prefs = await SharedPreferences.getInstance();
            await prefs.setBool(proPrefKey, true);
            await prefs.setString(proPlanTypeKey, _planType);
            await prefs.setString(proSoloBranchKey, _soloBranch);
            AdService().setAdSuspended(true);
            try {
              await Purchases.setAttributes({
                'pro_solo_branch': _soloBranch,
                'pro_plan_type': _planType,
              });
            } catch (_) {}
            await _syncProToFirebase(planId, soloBranch: _soloBranch);
            _isLoading = false;
            notifyListeners();
            return true;
          } else {
            debugPrint('PurchaseService: Purchase finished but no active entitlement returned from store.');
            _isLoading = false;
            notifyListeners();
            return false;
          }
        } catch (e) {
          debugPrint('Purchases.purchasePackage cancelled or failed: $e');
          _isLoading = false;
          notifyListeners();
          return false;
        }
      }

      // PRODUCTION PROTECTION: Release builds NEVER allow mock/free purchases
      if (!kDebugMode) {
        debugPrint('PurchaseService: Purchase denied in release mode because RevenueCat is unconfigured.');
        _isLoading = false;
        notifyListeners();
        return false;
      }

      // Local Debug simulator ONLY (during local flutter run)
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
      if (RevenueCatConfig.isConfigured) {
        try {
          final customerInfo = await Purchases.restorePurchases();
          final isDual = customerInfo.entitlements.all[RevenueCatConfig.entitlementDualPro]?.isActive ?? false;
          final isSolo = customerInfo.entitlements.all[RevenueCatConfig.entitlementPro]?.isActive ?? false;

          if (isDual || isSolo) {
            _isPro = true;
            _isDualPro = isDual;
            _planType = isDual ? 'DUAL' : 'SOLO';
            final prefs = await SharedPreferences.getInstance();
            await prefs.setBool(proPrefKey, true);
            await prefs.setString(proPlanTypeKey, _planType);
            AdService().setAdSuspended(true);

            // Reconcile branch information with cloud Firebase account if present
            await _verifyWithFirebase();

            _isLoading = false;
            notifyListeners();
            return true;
          }
        } catch (e) {
          debugPrint('RevenueCat restore fallback: $e');
        }
      }

      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final doc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
        if (doc.exists && (doc.data()?['isPro'] == true)) {
          _isPro = true;
          _isDualPro = doc.data()?['isDualPro'] == true;
          _planType = doc.data()?['proPlanType'] ?? 'SOLO';
          _soloBranch = doc.data()?['proSoloBranch'] ?? 'DA';
          final prefs = await SharedPreferences.getInstance();
          await prefs.setBool(proPrefKey, true);
          await prefs.setString(proPlanTypeKey, _planType);
          await prefs.setString(proSoloBranchKey, _soloBranch);
          AdService().setAdSuspended(true);
          _isLoading = false;
          notifyListeners();
          return true;
        }
      }

      // Check local storage fallback
      final prefs = await SharedPreferences.getInstance();
      _isPro = prefs.getBool(proPrefKey) ?? false;
      _planType = prefs.getString(proPlanTypeKey) ?? 'SOLO';
      _isDualPro = _isPro && _planType == 'DUAL';
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
