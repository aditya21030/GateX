import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../theme/app_theme.dart';

class AdService {
  static final AdService _instance = AdService._internal();
  factory AdService() => _instance;
  AdService._internal();

  bool _initialized = false;
  InterstitialAd? _interstitialAd;
  RewardedAd? _rewardedAd;
  bool _isShowingAd = false;
  bool get isShowingAd => _isShowingAd;
  int _pyqSolvedCount = 0;
  DateTime? _lastAdShownTime;
  DateTime? get lastAdShownTime => _lastAdShownTime;
  bool _isAdSuspended = false;
  bool get isAdSuspended => _isAdSuspended;

  void setAdSuspended(bool suspended) {
    _isAdSuspended = suspended;
    if (suspended) {
      _interstitialAd?.dispose();
      _interstitialAd = null;
      _rewardedAd?.dispose();
      _rewardedAd = null;
      debugPrint("AdService: All ads suspended and preloaded instances disposed.");
    }
  }

  // --- AD UNIT IDs (Auto-switches to official test IDs in debug mode to prevent policy strikes) ---
  
  static String get appOpenAdUnitId {
    if (!Platform.isAndroid) return '';
    return kDebugMode ? 'ca-app-pub-3940256099942544/9257395921' : '';
  }

  static String get interstitialAdUnitId {
    if (!Platform.isAndroid) return '';
    return kDebugMode
        ? 'ca-app-pub-3940256099942544/1033173712' // Google Official Test ID
        : 'ca-app-pub-8510502760785545/9044635553'; // Production Unit ID
  }

  static String get rewardedAdUnitId {
    if (!Platform.isAndroid) return '';
    return kDebugMode
        ? 'ca-app-pub-3940256099942544/5224354917' // Google Official Test ID
        : 'ca-app-pub-8510502760785545/5954413688'; // Production Unit ID
  }

  static String get nativeAdUnitId {
    if (!Platform.isAndroid) return '';
    return kDebugMode
        ? 'ca-app-pub-3940256099942544/2247696110' // Google Official Test ID
        : 'ca-app-pub-8510502760785545/6098115426'; // Production Unit ID
  }

  Future<void> init({List<String>? additionalTestDevices}) async {
    if (_initialized) return;
    if (kIsWeb || (!Platform.isAndroid && !Platform.isIOS)) {
      _initialized = true;
      debugPrint("AdMob disabled: not on Android or iOS");
      return;
    }

    try {
      await MobileAds.instance.initialize();
      
      // Configure test device identifiers to protect against invalid traffic violations
      final testDevices = <String>['EMULATOR'];
      if (additionalTestDevices != null) {
        testDevices.addAll(additionalTestDevices);
      }
      final requestConfig = RequestConfiguration(testDeviceIds: testDevices);
      await MobileAds.instance.updateRequestConfiguration(requestConfig);

      _initialized = true;
      if (!_isAdSuspended) {
        loadInterstitialAd();
        loadRewardedAd();
      }
    } catch (e) {
      debugPrint("Error initializing MobileAds: $e");
    }
  }

  // --- INTERSTITIAL AD ---

  void loadInterstitialAd() {
    if (_isAdSuspended || kIsWeb || (!Platform.isAndroid && !Platform.isIOS)) return;

    InterstitialAd.load(
      adUnitId: interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          debugPrint("InterstitialAd loaded successfully.");
        },
        onAdFailedToLoad: (error) {
          debugPrint('InterstitialAd failed to load: $error');
        },
      ),
    );
  }

  void incrementPyqCountAndShowAd() {
    _pyqSolvedCount++;
    if (_isAdSuspended) return;

    final now = DateTime.now();
    final bool cooldownOver = _lastAdShownTime == null ||
        now.difference(_lastAdShownTime!).inMinutes >= 8;

    // Trigger only every 10 questions solved AND after 8+ minutes since last interstitial
    if (_pyqSolvedCount % 10 == 0 && cooldownOver) {
      showInterstitialAd();
    }
  }

  void showInterstitialAd({VoidCallback? onDismissed, bool enforceCooldown = false}) {
    if (_isAdSuspended) {
      onDismissed?.call();
      return;
    }
    if (enforceCooldown && _lastAdShownTime != null) {
      final diff = DateTime.now().difference(_lastAdShownTime!).inMinutes;
      if (diff < 5) {
        onDismissed?.call();
        return;
      }
    }
    if (_interstitialAd == null) {
      loadInterstitialAd();
      onDismissed?.call();
      return;
    }

    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        _isShowingAd = true;
        _lastAdShownTime = DateTime.now();
      },
      onAdDismissedFullScreenContent: (ad) {
        _isShowingAd = false;
        ad.dispose();
        _interstitialAd = null;
        loadInterstitialAd();
        onDismissed?.call();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        _isShowingAd = false;
        ad.dispose();
        _interstitialAd = null;
        loadInterstitialAd();
        onDismissed?.call();
      },
    );
    _interstitialAd!.show();
  }

  // --- REWARDED AD ---

  void loadRewardedAd() {
    if (_isAdSuspended || kIsWeb || (!Platform.isAndroid && !Platform.isIOS)) return;

    RewardedAd.load(
      adUnitId: rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd = ad;
          debugPrint("RewardedAd loaded successfully.");
        },
        onAdFailedToLoad: (error) {
          debugPrint('RewardedAd failed to load: $error');
        },
      ),
    );
  }

  void showRewardedAd({required Function onUserEarnedReward}) {
    if (_rewardedAd == null) {
      loadRewardedAd();
      return;
    }

    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) { _isShowingAd = true; },
      onAdDismissedFullScreenContent: (ad) {
        _isShowingAd = false;
        ad.dispose();
        _rewardedAd = null;
        loadRewardedAd();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        _isShowingAd = false;
        ad.dispose();
        _rewardedAd = null;
        loadRewardedAd();
      },
    );

    _rewardedAd!.show(onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
      onUserEarnedReward();
    });
  }

  /// Prompts user with an opt-in dialog to watch a 20s rewarded ad to unlock perks
  Future<bool> promptWatchRewardedAd({
    required BuildContext context,
    required String perkTitle,
    required String perkDescription,
  }) async {
    final shouldWatch = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppTheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        title: Row(
          children: [
            const Icon(Icons.play_circle_fill_rounded, color: AppTheme.secondary, size: 24),
            const SizedBox(width: 10),
            Expanded(child: Text(perkTitle, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
          ],
        ),
        content: Text(
          perkDescription,
          style: const TextStyle(color: AppTheme.textSecondary, fontSize: 13, height: 1.4),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel', style: TextStyle(color: AppTheme.textSecondary)),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.secondary,
              foregroundColor: AppTheme.background,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            icon: const Icon(Icons.ondemand_video_rounded, size: 16),
            label: const Text('Watch Short Ad (20s)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            onPressed: () => Navigator.pop(ctx, true),
          ),
        ],
      ),
    );

    if (shouldWatch != true) return false;

    final completer = Completer<bool>();
    if (_rewardedAd != null) {
      showRewardedAd(onUserEarnedReward: () {
        completer.complete(true);
      });
    } else {
      // Graceful offline fallback or simulator mode for testing
      completer.complete(true);
    }
    return completer.future;
  }

  // --- NATIVE AD ---

  NativeAd? getNativeAd({required VoidCallback onAdLoaded, VoidCallback? onAdFailed}) {
    if (_isAdSuspended || kIsWeb || (!Platform.isAndroid && !Platform.isIOS)) return null;

    final nativeAd = NativeAd(
      adUnitId: nativeAdUnitId,
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (Ad ad) {
          debugPrint('NativeAd loaded.');
          onAdLoaded();
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          debugPrint('NativeAd failed to load: $error');
          ad.dispose();
          if (onAdFailed != null) onAdFailed();
        },
      ),
      nativeTemplateStyle: NativeTemplateStyle(
        templateType: TemplateType.medium,
        mainBackgroundColor: AppTheme.surface,
        callToActionTextStyle: NativeTemplateTextStyle(
          textColor: Colors.white,
          backgroundColor: AppTheme.primary,
          style: NativeTemplateFontStyle.bold,
          size: 16.0,
        ),
        primaryTextStyle: NativeTemplateTextStyle(
          textColor: Colors.white,
          backgroundColor: Colors.transparent,
          style: NativeTemplateFontStyle.bold,
          size: 16.0,
        ),
        secondaryTextStyle: NativeTemplateTextStyle(
          textColor: AppTheme.textSecondary,
          backgroundColor: Colors.transparent,
          style: NativeTemplateFontStyle.normal,
          size: 14.0,
        ),
        tertiaryTextStyle: NativeTemplateTextStyle(
          textColor: AppTheme.textSecondary,
          backgroundColor: Colors.transparent,
          style: NativeTemplateFontStyle.normal,
          size: 14.0,
        ),
      ),
    );

    nativeAd.load();
    return nativeAd;
  }
}
