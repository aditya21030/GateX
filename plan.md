# GateX: Master Phase-Wise & Step-Wise Implementation Plan

---

## 1. Executive Summary & Product Architecture

* **Product Name**: GateX (`gateda`)
* **Target Audience**: GATE Aspirants (Starting with **CS/IT** and **DSAI**, expanding to all engineering disciplines next cycle).
* **Current Traction**: **350+ organic users**; traffic surging as the February exam approaches.
* **Core Philosophy**: **100% Independent & Coaching-Free**. Zero third-party coaching partnerships, zero affiliate promotion. Revenue is generated via software utility (**GateX Season Pro Pass** powered by **RevenueCat**) and opt-in rewarded video ads.
* **Key Pillars**:
  1. **Exam Simulation**: Official GATE CBT interface, question palette, and virtual calculator.
  2. **Active Learning**: Personal Error Log with automated weak-spot drills and active recall formula sheets.
  3. **Peer Community**: Structured question-level doubt threads and subject boards (avoiding open chat spam).
  4. **Multi-Branch Extensibility**: Modular branch architecture ready for ECE, EE, ME, and Civil.

---

## 2. Master Implementation Roadmap

```mermaid
graph TD
    subgraph Phase 1: Monetization & RevenueCat
        A1[1.1 purchases_flutter SDK] --> A2[1.2 RevenueCat Initialization]
        A2 --> A3[1.3 PurchaseService & Entitlement Guard]
        A3 --> A4[1.4 Pro Paywall & 1-Tap UPI/Play Billing]
        A4 --> A5[1.5 Offline Entitlement Caching & Restore]
    end

    subgraph Phase 2: Official GATE CBT Simulation
        B1[2.1 5-Color Official Question Palette] --> B2[2.2 Clear Response & Review Markers]
        B2 --> B3[2.3 PiP Virtual Calculator Polish]
        B3 --> B4[2.4 Shareable Telegram/WhatsApp Scorecard]
    end

    subgraph Phase 3: Community & Doubt Solving
        C1[3.1 Question-Level Discussion Drawer] --> C2[3.2 Firestore Thread Schema & Upvotes]
        C2 --> C3[3.3 Categorized Subject Boards]
        C3 --> C4[3.4 Anti-Spam & Pro Ranker Badges]
    end

    subgraph Phase 4: Retention & High-Yield Tools
        D1[4.1 Daily 9:00 AM Question Push] --> D2[4.2 1-Click Printable PDF Exports]
        D2 --> D3[4.3 Agile Checklist vs Rigid Roadmap]
        D3 --> D4[4.4 Remove Pomodoro/COAP Clutter]
    end

    subgraph Phase 5: Multi-Branch Architecture
        E1[5.1 Modular BranchConfig Abstraction] --> E2[5.2 Dynamic JSON Data Loaders]
        E2 --> E3[5.3 Multi-Exam Switcher & ECE/EE Scaling]
    end

    Phase 1 --> Phase 2 --> Phase 3 --> Phase 4 --> Phase 5
```

---

## Phase 1: RevenueCat Billing & Monetization Engine

> **Objective**: Implement robust, enterprise-grade in-app monetization via RevenueCat (`purchases_flutter`). Supports 1-tap Google Play UPI, Card, and NetBanking payments in India, handles receipt validation, cross-device restores, and offline caching without custom backend infrastructure.

### Step 1.1: Package Installation & Configuration
* **Target File**: [`pubspec.yaml`](file:///d:/Flutter/Gate%20DA/pubspec.yaml)
* **Action**:
  * Add `purchases_flutter: ^8.6.0` to dependencies.
  * Run `flutter pub get`.
* **Verification**: Verify package compiles cleanly across Android targets.

### Step 1.2: RevenueCat SDK Initialization with Firebase UID
* **Target Files**: [`lib/main.dart`](file:///d:/Flutter/Gate%20DA/lib/main.dart), [`lib/services/purchase_service.dart`](file:///d:/Flutter/Gate%20DA/lib/services/purchase_service.dart)
* **Action**:
  * Initialize RevenueCat using `Purchases.configure(PurchasesConfiguration(apiKey)..appUserID = firebaseUser?.uid)`.
  * Pass Firebase Auth UID so entitlements sync across devices, reinstalls, and platforms.
  * Listen to `Purchases.addCustomerInfoUpdateListener` to dynamically update user state.

### Step 1.3: Refactor `PurchaseService` for Entitlement Checking
* **Target File**: [`lib/services/purchase_service.dart`](file:///d:/Flutter/Gate%20DA/lib/services/purchase_service.dart)
* **Action**:
  * Entitlement Identifier: `gatex_pro`
  * Product Identifier: `gatex_pro_season_2027` (₹199 / ₹249 one-time non-renewing purchase).
  * Method `checkProStatus()`: Checks `customerInfo.entitlements.active['gatex_pro'] != null`.
  * Method `purchaseProPass()`: Calls `Purchases.purchasePackage(package)`.
  * Method `restorePurchases()`: Calls `Purchases.restorePurchases()`.
  * Automatic ad suspension: When `isPro == true`, trigger `AdService().setAdSuspended(true)`.

### Step 1.4: Paywall UI & Conversion Flow
* **Target File**: [`lib/screens/pro_upgrade_screen.dart`](file:///d:/Flutter/Gate%20DA/lib/screens/pro_upgrade_screen.dart)
* **Action**:
  * Display real localized price from RevenueCat `Package.storeProduct.priceString` (e.g. `₹199.00`).
  * Feature Breakdown:
    * 10 Full-Length Exam Hall Mocks with live ranking.
    * 100% Ad-Free experience.
    * Unlimited Error Log Drills (custom quizzes generated from personal mistakes).
    * Printable PDF Downloads (Formula sheets & Error notebook).
    * Pro Ranker Community badge.
  * One-tap purchase button with instant feedback and haptics.
  * "Restore Purchases" button prominently placed for Play Store compliance.

### Step 1.5: Non-Intrusive Rewarded Ads for Free Tier
* **Target File**: [`lib/services/ad_service.dart`](file:///d:/Flutter/Gate%20DA/lib/services/ad_service.dart)
* **Action**:
  * Free users can unlock extra mock tests or restore a broken streak by watching an opt-in Rewarded Video Ad (`showRewardedAd`).
  * Strict guardrail: Zero popups during active tests or study sessions.

---

## Phase 2: Official GATE CBT Simulation (Examination Engine)

> **Objective**: Replicate the exact visual and operational behavior of the official GATE computer-based test interface (TCS iON platform) so students experience zero unfamiliarity in the actual exam hall.

### Step 2.1: Official 5-State Question Palette
* **Target File**: [`lib/screens/mock_test_runner_screen.dart`](file:///d:/Flutter/Gate%20DA/lib/screens/mock_test_runner_screen.dart)
* **Action**:
  * Implement the official 5-color question palette:
    1. 🟢 **Answered**: Marked with green polygon/pill.
    2. 🔴 **Not Answered**: Marked with red pill (visited, but left blank).
    3. 🟣 **Marked for Review**: Marked with purple circle (not answered).
    4. 🟣🟢 **Answered & Marked for Review**: Purple circle with a green internal status dot (evaluated in final score).
    5. ⚪ **Not Visited**: Neutral grey card.
  * Display quick summary counters at the top of the question drawer: `Answered: 32`, `Not Answered: 18`, `Marked for Review: 5`.

### Step 2.2: Exam Controls & Real Marking Scheme
* **Target File**: [`lib/screens/mock_test_runner_screen.dart`](file:///d:/Flutter/Gate%20DA/lib/screens/mock_test_runner_screen.dart)
* **Action**:
  * Add **"Clear Response"** button: Unchecks current choice and reverts question state to "Not Answered".
  * Add **"Mark for Review & Next"** button.
  * Enforce strict GATE marking logic:
    * 1-mark MCQ: `+1` correct, `-0.33` wrong.
    * 2-mark MCQ: `+2` correct, `-0.66` wrong.
    * MSQ (Multiple Select): Full marks only if all correct choices selected; `0` negative marking.
    * NAT (Numerical Answer Type): Evaluated with standard tolerance range; `0` negative marking.

### Step 2.3: PiP Floating Virtual Calculator
* **Target File**: [`lib/widgets/virtual_calculator.dart`](file:///d:/Flutter/Gate%20DA/lib/widgets/virtual_calculator.dart)
* **Action**:
  * Ensure keypad layout matches the official GATE desktop virtual calculator keys (trig, log, ln, powers, factorial).
  * Draggable floating window with minimize button (48px pill) so students can calculate while reading question text.

### Step 2.4: Shareable Telegram & WhatsApp Scorecard
* **Target File**: [`lib/screens/mock_tracker_screen.dart`](file:///d:/Flutter/Gate%20DA/lib/screens/mock_tracker_screen.dart)
* **Action**:
  * Render an exportable graphic scorecard (Score, Rank Percentile, Accuracy, Subject Breakdown).
  * Direct share button to WhatsApp, Telegram study groups, and LinkedIn.

---

## Phase 3: In-App Community & Doubt Solving Engine

> **Objective**: Create high-retention, distraction-free peer learning. Avoid noisy open chat rooms by structuring discussion around specific questions and organized subject channels.

### Step 3.1: Question-Level Discussion Threads
* **Target Files**: [`lib/screens/pyq_screen.dart`](file:///d:/Flutter/Gate%20DA/lib/screens/pyq_screen.dart), [`lib/screens/mock_test_runner_screen.dart`](file:///d:/Flutter/Gate%20DA/lib/screens/mock_test_runner_screen.dart)
* **Action**:
  * Under every question and solution explanation, add a **"💬 Discuss (X)"** button.
  * Tapping opens a bottom sheet with peer discussion, alternate shortcuts, and LaTeX math solutions.

### Step 3.2: Firestore Discussion Schema
* **Target File**: [`lib/services/cloud_sync_service.dart`](file:///d:/Flutter/Gate%20DA/lib/services/cloud_sync_service.dart)
* **Schema**:
  * Collection: `/questions/{questionId}/discussions`
    * `authorId`: UID
    * `authorName`: String
    * `isPro`: Boolean (grants Gold Badge)
    * `content`: Text (supports LaTeX syntax `$ ... $`)
    * `upvotes`: Number
    * `createdAt`: Timestamp
* **Action**:
  * Add upvote button so the best shortcuts rise to the top.
  * Cache discussions locally in Hive so repeat views consume 0 Firebase reads.

### Step 3.3: Categorized Subject Boards
* **Target File**: Create `lib/screens/community_screen.dart`
* **Channels**:
  * 📌 `#Machine-Learning-AI`
  * 📌 `#Linear-Algebra-Calculus`
  * 📌 `#General-Aptitude`
  * 📌 `#Mock-Test-Strategy`
* **Anti-Spam Guardrails**:
  * Rate-limit posting: Max 1 post per 2 minutes per user.
  * Automated filter: Block Telegram links, promotional spam, and phone numbers.

---

## Phase 4: Student Retention & High-Yield Daily Habits

> **Objective**: Maximize daily active usage (DAU) and provide high-yield revision value during the final 90 days.

### Step 4.1: Automated 9:00 AM "Question of the Day" Push
* **Target File**: [`lib/services/notification_service.dart`](file:///d:/Flutter/Gate%20DA/lib/services/notification_service.dart)
* **Action**:
  * Schedule daily local notification at 9:00 AM with 1 high-yield conceptual question.
  * Tapping opens the question directly with instant explanation feedback.
  * Increases daily app launches by 40–60%.

### Step 4.2: 1-Click Printable PDF Exports
* **Target Files**: [`lib/screens/formula_sheet_screen.dart`](file:///d:/Flutter/Gate%20DA/lib/screens/formula_sheet_screen.dart), [`lib/screens/error_log_screen.dart`](file:///d:/Flutter/Gate%20DA/lib/screens/error_log_screen.dart)
* **Action**:
  * Allow Pro users to export their customized Error Log and Formula Cheatsheets as print-ready PDF files using `pdf` / `printing` or markdown converter.
  * High perceived value for final week revision.

### Step 4.3: Agile Syllabus Checklist (Replacing Rigid May-Start Plans)
* **Target File**: [`lib/screens/planner_screen.dart`](file:///d:/Flutter/Gate%20DA/lib/screens/planner_screen.dart)
* **Action**:
  * Replace the static May-dated timeline with an **Agile Subject Checklist**:
    * Subjects grouped by high-weightage topics.
    * Checkboxes for: *Concept Watched*, *PYQ Solved*, *Revised Once*.
    * Realistic for late-joining students who start in October or November.

### Step 4.4: De-Clutter Secondary Utilities
* **Target File**: [`lib/screens/more_screen.dart`](file:///d:/Flutter/Gate%20DA/lib/screens/more_screen.dart)
* **Action**:
  * Move Pomodoro timer into secondary tools.
  * Move COAP / Counseling into "Post-Exam" sub-menu (hidden from home until March results).

---

## Phase 5: Multi-Branch Scalable Architecture

> **Objective**: Prepare the codebase to expand from CS/IT + DSAI to ECE, EE, Mechanical, and Civil engineering next year with zero structural rewrites.

### Step 5.1: Modular `BranchConfig` Data Abstraction
* **Target File**: Create `lib/models/branch_model.dart`
* **Model**:
  ```dart
  class BranchConfig {
    final String code; // 'DA', 'CSIT', 'EC', 'EE', 'ME', 'CE'
    final String displayName;
    final List<String> subjects;
    final Map<String, int> weightageMap;
    final String formulaAssetPath;
    final String pyqDataFile;
  }
  ```

### Step 5.2: Dynamic Data Loaders
* **Action**:
  * Remove hardcoded `if (activeExam == 'DA') ... else ...` branches across screens.
  * Inject `BranchConfig` via `AppProvider.activeBranch`.
  * Adding a new branch next cycle requires adding only 1 configuration file and question bank JSON.

---

## 3. Edge Cases, Bugs & Guardrails Matrix

| Area | Edge Case / Potential Bug | Architectural Defense & Guardrail |
| :--- | :--- | :--- |
| **Billing** | User purchases Pro, but app crashes before verification completes | RevenueCat handles transaction state restoration automatically; call `Purchases.restorePurchases()` on app start and listen to customer info stream. |
| **Billing** | User switches phones or uninstalls and reinstalls app | RevenueCat links entitlement to Firebase UID. Calling `Purchases.logIn(user.uid)` immediately restores Pro status without user intervention. |
| **Billing** | Offline device with no internet tries to check Pro status | RevenueCat SDK caches entitlement status locally on disk. Pro status remains active offline. |
| **CBT Mock** | NAT questions with floating point rounding issues (e.g. `2.50` vs `2.5`) | Numerical answers parsed as doubles; validated against official GATE acceptance range `[lowerBound, upperBound]` or tolerance `abs(user - target) < 0.05`. |
| **CBT Mock** | MSQ questions where student picks 2 of 3 correct options | MSQ evaluation strictly compares set equality `userAnswers.toSet() == correctAnswers.toSet()`. Partial answers yield `0` marks (official GATE rule). |
| **Community**| Spamming links, abuse, or flood attacks in discussion threads | Firestore Security Rules limit writes; client enforces a 2-minute cooldown; regex blocks external URLs (`t.me/`, `wa.me/`, `http`). |
| **Cloud Sync**| Offline edits to Error Log / Notes conflict with Cloud Firestore | Timestamp-based Last-Write-Wins (LWW) merge policy in `StorageService.restoreFromCloud()`. |
| **Notifications** | Android 13+ fails to trigger 9:00 AM Question alert | Check `Permission.notification.request()` explicitly and use `AndroidScheduleMode.exactAllowWhileIdle` with timezone initialization. |

---

## 4. Verification & Testing Protocol

Every step will be validated against this quality gate:

1. **Static Analysis**: `flutter analyze` must produce **0 compilation errors**.
2. **Logic Tests**: `flutter test` must pass **100% of test cases** (scoring algorithms, NAT tolerances, streak resets, RevenueCat entitlement mocks).
3. **Ergonomic Verification**: Physical release build test on small and large mobile screens (360dp to 440dp width) to guarantee zero UI clipping or keyboard overflow.
4. **Offline Capability**: Turn on Airplane mode and verify that PYQ viewing, Mock testing, and Formula Sheets work with zero internet connectivity.
