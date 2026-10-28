import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateCheckResult {
  final bool isUpdateAvailable;
  final bool isForceUpdate;
  final String currentVersion;
  final int currentBuildNumber;
  final String latestVersion;
  final int minRequiredBuildNumber;
  final String updateTitle;
  final String updateMessage;
  final String storeUrl;

  const UpdateCheckResult({
    required this.isUpdateAvailable,
    required this.isForceUpdate,
    required this.currentVersion,
    required this.currentBuildNumber,
    required this.latestVersion,
    required this.minRequiredBuildNumber,
    required this.updateTitle,
    required this.updateMessage,
    required this.storeUrl,
  });

  factory UpdateCheckResult.noUpdate({
    required String currentVersion,
    required int currentBuildNumber,
  }) {
    return UpdateCheckResult(
      isUpdateAvailable: false,
      isForceUpdate: false,
      currentVersion: currentVersion,
      currentBuildNumber: currentBuildNumber,
      latestVersion: currentVersion,
      minRequiredBuildNumber: currentBuildNumber,
      updateTitle: 'Up to Date',
      updateMessage: 'You are using the latest version of GateX.',
      storeUrl: AppUpdateService.playStoreWebUrl,
    );
  }
}

class AppUpdateService {
  static final AppUpdateService _instance = AppUpdateService._internal();
  factory AppUpdateService() => _instance;
  AppUpdateService._internal();

  static const String playStoreMarketUrl = 'market://details?id=com.yousful.gatex';
  static const String playStoreWebUrl = 'https://play.google.com/store/apps/details?id=com.yousful.gatex';

  PackageInfo? _cachedPackageInfo;

  Future<PackageInfo> getPackageInfo() async {
    if (_cachedPackageInfo != null) return _cachedPackageInfo!;
    try {
      _cachedPackageInfo = await PackageInfo.fromPlatform();
      return _cachedPackageInfo!;
    } catch (e) {
      debugPrint('Error getting PackageInfo: $e');
      // Fallback
      return PackageInfo(
        appName: 'GateX',
        packageName: 'com.yousful.gatex',
        version: '1.0.9',
        buildNumber: '10',
      );
    }
  }

  /// Comprehensive check combining Google Play In-App Update API and Firestore Remote Gate
  Future<UpdateCheckResult> checkUpdate() async {
    final packageInfo = await getPackageInfo();
    final currentVersion = packageInfo.version;
    final currentBuild = int.tryParse(packageInfo.buildNumber) ?? 10;

    bool playUpdateAvailable = false;
    bool immediateAllowed = false;
    int? playVersionCode;

    // 1. Check Google Play In-App Update API on Android
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
      try {
        final updateInfo = await InAppUpdate.checkForUpdate();
        if (updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
          playUpdateAvailable = true;
          immediateAllowed = updateInfo.immediateUpdateAllowed;
          playVersionCode = updateInfo.availableVersionCode;
          debugPrint('Google Play update available: versionCode $playVersionCode, immediate: $immediateAllowed');
        }
      } catch (e) {
        // Can fail if app not installed from Play Store or Play Services unavailable
        debugPrint('Google Play in-app update check notice: $e');
      }
    }

    // 2. Check Firestore Remote Gate (app_config/version)
    int minRequiredBuild = currentBuild;
    int latestBuild = playVersionCode ?? currentBuild;
    String latestVersion = currentVersion;
    bool forceUpdateFlag = false;
    String updateTitle = 'Update Required to Continue';
    String updateMessage = 'A new version of GateX is required to continue. Update now to access latest mock tests, verified PYQs, and official CBT features.';
    String storeUrl = playStoreWebUrl;

    try {
      final doc = await FirebaseFirestore.instance
          .collection('app_config')
          .doc('version')
          .get()
          .timeout(const Duration(seconds: 4));

      if (doc.exists && doc.data() != null) {
        final data = doc.data()!;
        minRequiredBuild = data['minRequiredBuildNumber'] ?? data['minBuild'] ?? minRequiredBuild;
        latestBuild = data['latestBuildNumber'] ?? data['latestBuild'] ?? latestBuild;
        latestVersion = data['latestVersion'] ?? latestVersion;
        forceUpdateFlag = data['forceUpdate'] ?? false;
        if (data['updateTitle'] != null) updateTitle = data['updateTitle'];
        if (data['updateMessage'] != null) updateMessage = data['updateMessage'];
        if (data['storeUrl'] != null) storeUrl = data['storeUrl'];
      }
    } catch (e) {
      debugPrint('Firestore remote version check notice: $e');
    }

    // Determine if update is required
    final bool hasNewerBuild = playUpdateAvailable || currentBuild < latestBuild;
    final bool isForce = (currentBuild < minRequiredBuild) || (forceUpdateFlag && hasNewerBuild) || playUpdateAvailable;

    if (!hasNewerBuild && !isForce) {
      return UpdateCheckResult.noUpdate(
        currentVersion: currentVersion,
        currentBuildNumber: currentBuild,
      );
    }

    return UpdateCheckResult(
      isUpdateAvailable: true,
      isForceUpdate: isForce,
      currentVersion: currentVersion,
      currentBuildNumber: currentBuild,
      latestVersion: latestVersion,
      minRequiredBuildNumber: minRequiredBuild,
      updateTitle: updateTitle,
      updateMessage: updateMessage,
      storeUrl: storeUrl,
    );
  }

  /// Triggers in-app update or falls back to Google Play Store page
  Future<bool> triggerUpdate({BuildContext? context}) async {
    // 1. Try official Google Play in-app immediate update
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
      try {
        final updateInfo = await InAppUpdate.checkForUpdate();
        if (updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
          final result = await InAppUpdate.performImmediateUpdate();
          if (result == AppUpdateResult.success) {
            return true;
          }
        }
      } catch (e) {
        debugPrint('Direct in-app immediate update notice: $e');
      }
    }

    // 2. Fallback to opening Google Play Store app directly, then web url
    try {
      final marketUri = Uri.parse(playStoreMarketUrl);
      if (await canLaunchUrl(marketUri)) {
        await launchUrl(marketUri, mode: LaunchMode.externalApplication);
        return true;
      }
    } catch (e) {
      debugPrint('Market URI launch failed: $e');
    }

    try {
      final webUri = Uri.parse(playStoreWebUrl);
      await launchUrl(webUri, mode: LaunchMode.externalApplication);
      return true;
    } catch (e) {
      debugPrint('Web URI launch failed: $e');
      return false;
    }
  }
}
