# GateX Monetization Master Plan (MONETIZE.md)
*Official monetization architecture, product pricing, ad placement rules, and edge-case handling.*

---

## 1. Executive Summary: The Dual-Engine Business Model

GateX operates a **Dual-Engine Monetization Strategy** designed for Indian competitive engineering exam aspirants (GATE DA & CS/IT):

```
                               TOTAL INSTALLS
                                     │
                 ┌───────────────────┴───────────────────┐
                 ▼                                       ▼
        15% Upgrade to Pro                     85% Stay on Free Tier
          (Paid Engine)                           (Ad Engine)
                 │                                       │
                 ▼                                       ▼
       ₹299 One-Time Season Pass               Daily AdMob Revenue
       (₹254 Net Cash per User)                (Rewarded, Interstitial, Native)
```

### The Core Ethical Principle
* **Public Information is 100% Free**: All public data available on the internet (official GATE syllabus, 15+ years of official PYQs, formula sheets, IIT/IISc COAP cutoffs) is **never paywalled**. It is monetized 100% via non-intrusive ads.
* **Proprietary Software & Analytics are Paid**: The ₹299 Pro Pass exclusively gates custom-engineered software tools that do **not** exist on Google (Negative Marking Penalty Audit, Time-Trap Detection, Adaptive Mistake Re-Test Engine, Printable PDF Exports, and 100% Offline Ad-Free Mode).

---

## 2. Commercial Pricing & Packaging

### The Pricing Standard: One-Time Season Pass
*GATE is an annual exam held once every February. Monthly subscriptions lead to high churn (students wait until January, pay once, and cancel). A single one-time payment matches UPI spending habits.*

| Plan | Price | Anchor Strike-through | Validity | Target User |
| :--- | :---: | :---: | :---: | :--- |
| **GateX Pro Season Pass** | **₹299** | <del>₹699</del> *(57% OFF)* | **Valid till March 15, 2027** *(GATE Exam + COAP Counseling)* | Serious aspirants preparing for 4–10 months who want peace of mind, deep diagnostics, and zero ads. |
| **Final Month Sprint Pass** *(Optional Flash Sale in Jan)* | **₹199** | <del>₹499</del> *(60% OFF)* | **30 Days** *(Final Exam Month)* | Last-minute panic buyers in January who only have 3 weeks left. |

### Unit Economics (Google Play Store)
Google charges a **15% fee** for developers enrolled in the Google Play 15% tier:

$$\text{Gross Sale} = ₹299 \quad\longrightarrow\quad \text{Google Fee (15%)} = ₹45 \quad\longrightarrow\quad \mathbf{\text{Net Cash to You}} = \mathbf{₹254 \text{ per student}}$$

* **500 Pro Users**: ₹1,27,000 Net
* **1,000 Pro Users**: ₹2,54,000 Net
* **2,500 Pro Users**: ₹6,35,000 Net

---

## 3. Comprehensive Feature Comparison (Free vs. Pro)

| Category | Feature | 🆓 Free Tier (Ad-Supported) | 👑 GateX Pro Pass (₹299) |
| :--- | :--- | :---: | :---: |
| **Public Data & Knowledge** | Official Syllabus & Agile Checklist | ✅ 100% Free | ✅ Included |
| | Official PYQ Bank (15+ Years) | ✅ 100% Free | ✅ Included |
| | Complete Formula Cheatsheet | ✅ 100% Free | ✅ Included |
| | Subject Weightage Blueprint | ✅ 100% Free | ✅ Included |
| **Cutoffs & Admissions** | Score & Rank Estimator | ✅ 100% Free | ✅ Included |
| | COAP & CCMT Admission Predictor | ✅ 100% Free (All 23 IITs & NITs) | ✅ Included |
| | Direct Offer vs. Interview Filter | ✅ 100% Free | ✅ Included |
| **Mock Tests & Exam Engine**| Daily Rapid Fire (5 Qs, 10m) | ✅ Unlimited Free | ✅ Unlimited Free |
| | Subject Practice Tests (10 Qs) | ✅ Unlimited Free (All Subjects) | ✅ Unlimited Free |
| | Mini Mock Tests (15 Qs, 30m) | ✅ Unlimited Free | ✅ Unlimited Free |
| | Full 65Q Mock #1 (Diagnostic) | ✅ Instant 1-Tap Access | 👑 Instant 1-Tap Access |
| | Full 65Q Mocks #2 to #10 | 🎬 **Watch 1 Video Ad per test** | 👑 **Instant Access (All 10)** |
| **Diagnostic Analytics** | Basic Score, AIR & Accuracy | ✅ Included | ✅ Included |
| | **Negative Marking Penalty Audit** | ❌ Locked | 👑 **Full Diagnostic Breakdown** |
| | **Time-Trap Detection (>3.5m errors)**| ❌ Locked | 👑 **Time Discipline Alerts** |
| | **Subject Weakness Radar Matrix** | ❌ Locked | 👑 **Visual Accuracy Radar** |
| **Mistake Mastery & Revision**| Log Missed Questions in Error Book | ✅ Included | ✅ Included |
| | **Adaptive "Mistake Re-Test" Machine** | ❌ Locked | 👑 **Unlimited Adaptive Drills** |
| | **Personal Mistake Workbook (PDF)** | ❌ Locked | 👑 **1-Click Printable PDF** |
| | **Master Formula Cheatsheet (PDF)** | ❌ Locked | 👑 **30-Page Printable PDF** |
| **App Experience** | Advertisements | Interstitials & Banners | 🚫 **100% Ad-Free Forever** |
| | Offline Mock Test Mode | ❌ Online Only | 💾 **Full Offline Mocks** |
| | Pass Duration | Forever Free | **Valid till March 15, 2027** |

---

## 4. Google AdMob Architecture (Free Users Only)

### Ad Units & IDs Configuration
```dart
// AdMob Unit IDs defined in lib/services/ad_service.dart
InterstitialAd:  'ca-app-pub-8510502760785545/9044635553'
RewardedAd:      'ca-app-pub-8510502760785545/5954413688'
NativeAd:        'ca-app-pub-8510502760785545/6098115426'
```

### The 3 Strategic Placements

#### 1. Rewarded Video Ads (High eCPM: ₹180 – ₹350 per 1,000 views)
* **Trigger**: When a free user taps Full Mock #2 through #10.
* **Prompt**:
  > *"Unlock this 3-Hour Pro Mock for free by watching a 20s short ad, or upgrade to GateX Pro for ₹299."*
* **User Value**: 20 seconds of attention in exchange for a full 3-hour exam paper. High completion rate, zero drop-off.

#### 2. Interstitial Ads (Mid eCPM: ₹70 – ₹150 per 1,000 views)
* **Trigger 1**: Immediately upon submitting a Mock Test or Rapid Fire drill (before the final scorecard renders).
* **Trigger 2**: On the Estimator screen when tapping `[ Predict IIT Admissions (COAP) → ]`.
* **Frequency Cap**: Hard cooldown of **8 minutes** between any two interstitials. Max **3 per 30 minutes**.

#### 3. Native & Sticky Banner Ads (eCPM: ₹15 – ₹40 per 1,000 impressions)
* **Trigger 1**: Sticky 50px bottom banner in Formula Sheet screen.
* **Trigger 2**: In-feed native card between IIT #2 and #3 on the COAP screen.
* **Trigger 3**: Native sponsored card every 10 questions in the PYQ Bank.

### Projected Monthly Ad Revenue (Indian Education eCPM)
| Daily Active Free Students | Daily Ad Impressions | Estimated Monthly Ad Revenue |
| :---: | :---: | :---: |
| **1,000 Students** | ~8,000 | **₹18,000 – ₹28,000** |
| **3,000 Students** | ~24,000 | **₹55,000 – ₹85,000** |
| **5,000 Students** | ~40,000 | **₹95,000 – ₹1,45,000** |
| **10,000 Students** | ~80,000 | **₹1,90,000 – ₹2,90,000** |

---

## 5. Strict Advertising Golden Rules (App Store & Rating Protection)

1. **🚫 NEVER show an ad during an active test**: The timer and question screen must remain 100% ad-free (`AdService().setAdSuspended(true)` is strictly called during tests).
2. **🚫 NEVER show an ad inside the Virtual Calculator**.
3. **🚫 NEVER show a full-screen ad on cold app launch**: Avoid splash popups; let students enter their dashboard instantly.

---

## 6. Resilience & Edge-Case Engineering

### Edge Case 1: Payment Debited, Network Drops Before Firestore Write
* **Solution**: Google Play stores the signed purchase token locally on device. `purchases_flutter` auto-detects it on next launch. Also provide a visible `[ Restore Purchase ]` button in Hub and Paywall that queries Google Play in 1 tap without charging again.

### Edge Case 2: Free User Wants to Unlock Mock, but Ad Fails to Load (No Fill)
* **Solution**: Graceful fallback. If AdMob returns `onAdFailedToLoad` (Error Code 3), auto-unlock the mock attempt for free with a toast: *"Ad service unavailable right now. Enjoy this mock test on us!"*. Never block a student because AdMob had no inventory.

### Edge Case 3: Battery Dies or App Closes Mid-Mock
* **Solution**: Local SQLite/SharedPreferences autosaves test state (`secondsRemaining`, `userAnswers`, `markedForReview`) every 30 seconds. On app restart, prompt: *"Active test found: Full Mock 2 (1h 14m left). [Resume Test]"*. Mock remains unlocked.

### Edge Case 4: Exam Concludes (Season Expiration)
* **Solution**: Keep Pro access active until **March 15, 2027**. Students need the Score Estimator and COAP Predictor in late February/early March when official answer keys and scores are released. On March 16, 2027, the app prompts: *"GATE 2027 Concluded. Switch to GATE 2028?"*.

### Edge Case 5: 100% Offline Testing
* **Solution**: All 65 questions, options, formulas, and diagrams for the 10 Full Mocks are bundled in local offline assets. Pro users can take full 3-hour tests with airplane mode on. Results sync to Firestore when internet reconnects.

---

## 7. In-App Purchase Architecture: RevenueCat + Google Play Billing

### Why RevenueCat is the Industry Gold Standard for GateX
A common misconception is choosing *either* RevenueCat *or* Google Play Billing. In reality:
* **Google Play Policy Mandate**: Google strictly requires that all digital goods on Android apps downloaded from the Play Store must process payments via **Google Play Billing** (allowing students to pay securely using UPI, GPay, PhonePe, Paytm, Net Banking, or Cards).
* **The Problem with Raw Google Play Billing**: Using direct Google Play Billing APIs requires building, hosting, and maintaining a custom backend server (Node.js/Python), managing Google Cloud Service Accounts, parsing base64 cryptographic purchase tokens, setting up Real-Time Developer Notifications (RTDN via Google Cloud Pub/Sub), and handling device restore edge cases manually.
* **The RevenueCat Advantage**: **RevenueCat sits on top of Google Play Billing as an orchestration and receipt-validation layer.** It replaces the entire backend infrastructure, manages entitlements, provides cross-device synchronization, and detects fraud.
* **Cost**: RevenueCat is **100% free** up to **$2,500/month** (~₹2,10,000+ monthly revenue), which means ₹0 backend overhead for GateX.

### Architecture Flow Diagram

```
[ GateX Flutter App ]
        │  1. User taps "Unlock Pro Pass (₹299)"
        ▼
[ purchases_flutter SDK ]
        │  2. Calls Purchases.purchasePackage(package)
        ▼
[ Google Play Billing Engine ]
        │  3. Displays native Google Play UPI / GPay / Card bottom sheet
        │  4. User approves payment (₹299 debited)
        ▼
[ RevenueCat Cloud Validation ]
        │  5. Google Play sends cryptographic purchase token to RevenueCat
        │  6. RevenueCat validates receipt directly with Google Play Developer API
        ▼
[ GateX App & Cloud Firestore ]
        │  7. Entitlement 'gatex_pro' marked active
        │  8. AdService.setAdSuspended(true) disables all ads instantly
        │  9. Cloud Firestore synced with 'isPro: true' linked to FirebaseAuth UID
```

### Key Integration Parameters (`purchase_service.dart`)
* **Flutter Package**: `purchases_flutter` (already integrated in [`lib/services/purchase_service.dart`](file:///d:/Flutter/Gate%20DA/lib/services/purchase_service.dart))
* **Entitlement ID**: `gatex_pro` (guards all pro analytics, PDF exports, and mistake machine)
* **Google Play Product ID**: `gatex_pro_season_pass_2027` (Non-consumable one-time in-app product, ₹299 INR)
* **User Identity Sync**: `PurchasesConfiguration.appUserID = FirebaseAuth.instance.currentUser?.uid` (seamlessly restores entitlement whenever the user logs into a new device with their Google account)

---

## 8. Final Stage Implementation Checklist

When ready to integrate (as per final roadmap stage):
- [ ] **Step 1**: Register GateX app on the [RevenueCat Dashboard](https://app.revenuecat.com) and obtain the Android Public SDK key (`goog_...`).
- [ ] **Step 2**: Link RevenueCat to Google Play Console via Google Cloud Service Account (grants receipt validation permissions).
- [ ] **Step 3**: Create In-App Product `gatex_pro_season_pass_2027` (Price: ₹299) in Google Play Console & attach it to the `gatex_pro` entitlement in RevenueCat Offerings.
- [ ] **Step 4**: Update `lib/services/purchase_service.dart` with the live RevenueCat API key and set `proPlanPrice = '₹299'`.
- [ ] **Step 5**: Update `ProUpgradeScreen` copy to reflect **₹299 Season Pass** (valid till March 2027) with the 5 proprietary perks.
- [ ] **Step 6**: Add `AdService().showInterstitialAd()` on the Estimator &rarr; COAP transition button.
- [ ] **Step 7**: Verify `promptWatchRewardedAd()` fallback on Full Mocks #2 to #10 in `mock_tracker_screen.dart`.
- [ ] **Step 8**: Implement the Negative Marking Penalty & Time-Trap calculation on the Mock Test result screen (`mock_test_runner_screen.dart`).
