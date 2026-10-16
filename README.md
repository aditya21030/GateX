# GateX 🚀
### Complete GATE Data Science & AI (DA) and Computer Science & IT (CS/IT) Preparation App

GateX is an all-in-one, highly optimized, and distraction-free mobile preparation app built with Flutter for aspirants preparing for GATE Data Science & Artificial Intelligence (DA) and Computer Science & Information Technology (CS/IT).

---

## 🌟 Key Features

### 1. ⚡ 90-Day Crunch Sprint Mode
- **Sprint Mode Toggle**: Condenses the entire dashboard to high-yield actions during the final 90 days before the GATE examination.
- **Rapid Fire Quizzes**: Quick 5-question high-yield concept checks for daily momentum.
- **NAT Drills**: Instant filter for Numerical Answer Type questions across all subjects to practice exact numerical entry without multiple-choice cues.

### 2. 🧮 Exam-Day Floating Virtual Calculator
- Full PiP (Picture-in-Picture) draggable floating calculator replicated directly from the official GATE TCS-iON interface.
- Trigonometric, logarithmic, exponential, square root, reciprocal, memory functions, and backspace.
- Movable anywhere on the screen during mock tests so it never obstructs question text or options.

### 3. 🧠 Active Recall & Quick Revision
- **3D Interactive Flashcards**: Flip cards across Probability & Statistics, Machine Learning, AI, DBMS, Linear Algebra, and Calculus with "Review" vs. "Mastered" progress tracking.
- **Comprehensive Cheat Sheets**: 5 curated high-density formula and theorem sheets with instant sharing and export capabilities.
- **⚡ Practice My Mistakes**: Custom targeted quiz generator that instantly extracts incorrect questions from your Error Log into focused practice sessions.

### 4. 📊 Test Series & Advanced Analytics
- **Full & Subject-wise Mock Tests**: Timed GATE-standard mock tests with official marking schemes (+1, -0.33, +2, -0.66, 0 for NAT).
- **Exam Test Runner**: Question palette with status indicators (Answered, Marked for Review, Unanswered), instant clear response, and haptic feedback.
- **Mock Tracker & Score Predictor**: Track score trends, accuracy percentages, subject-wise strengths, and GATE score projections.

### 5. 👑 GateX Pro
- Lifetime / season pass unlocking unlimited custom mistake tests, offline cheat sheets, detailed step-by-step solutions, and ad-free study sessions.
- 100% independent platform built by and for GATE aspirants.

---

## 🛠️ Tech Stack & Architecture

- **Framework**: [Flutter 3.x](https://flutter.dev) (Dart 3.x)
- **State Management**: [Provider](https://pub.dev/packages/provider)
- **Backend & Cloud**: Firebase Core, Firebase Auth, Cloud Firestore
- **Local Storage & Persistence**: Shared Preferences & Offline Caching
- **Math Rendering**: LaTeX / TeX rendering via `flutter_math_fork`
- **Charts & Visualization**: `fl_chart`
- **Audio & Haptics**: `audioplayers`, `flutter/services` HapticFeedback

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (`^3.41.0` or later)
- Dart SDK (`^3.11.0` or later)
- Android Studio / Xcode / VS Code with Flutter extension

### Installation
```bash
# Clone the repository
git clone https://github.com/aditya21030/GateX.git
cd GateX

# Install dependencies
flutter pub get

# Run the test suite
flutter test

# Run on an emulator or physical device
flutter run
```

---

## 🧪 Testing

GateX features comprehensive unit and widget test suites covering state management, Sprint mode, calculator arithmetic, score calculations, and custom mistake drill generations:

```bash
flutter test
```

---

## 📄 License
This project is licensed under the MIT License - see the LICENSE file for details.
