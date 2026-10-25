/// RevenueCat In-App Purchase and Subscription Configuration
///
/// Setup Instructions:
/// 1. Go to RevenueCat Dashboard (https://app.revenuecat.com)
/// 2. Select Project -> Project Settings -> API Keys
/// 3. Copy the "Public API key" for Google Play (starts with `goog_`)
/// 4. Paste it into [apiKey] below.
class RevenueCatConfig {
  /// Public API Key for Google Play Android (starts with goog_...)
  static const String apiKey = 'goog_gatex_pro_season_pass_key';

  /// RevenueCat Entitlement Identifiers
  /// Create these under Project -> Entitlements in RevenueCat dashboard:
  static const String entitlementPro = 'gatex_pro';
  static const String entitlementDualPro = 'gatex_pro_dual';

  /// Google Play Product IDs / RevenueCat Package IDs
  /// Create these in Google Play Console (In-app products) & attach to Offering:
  static const String productSoloId = 'gatex_pro_solo_2027';
  static const String productDualId = 'gatex_pro_dual_2027';
  static const String productUpgradeDualId = 'gatex_pro_upgrade_dual_2027';

  /// Returns true if a valid production/testing RevenueCat key has been supplied
  static bool get isConfigured =>
      apiKey.isNotEmpty &&
      apiKey.startsWith('goog_') &&
      apiKey != 'goog_gatex_pro_season_pass_key';
}
