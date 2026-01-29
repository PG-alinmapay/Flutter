# AlinmaPay PG – Flutter Demo App

This repository contains a **Flutter Demo Application** for testing the **AlinmaPay Payment Gateway (PG) SDK**, including **Apple Pay** and **card-based transactions**.

The app is intended for **internal testing, QA validation, and integration reference** when working with the AlinmaPay PG Flutter SDK.

---

## 🔧 SDK & Framework Information

- **Flutter Plugin Version:** `v3.0.3`
- **Framework:** Flutter `v3.29.1`
- **Supported Platforms:** Mobile Only
  - Android
  - iOS

---

## 📱 Platform Details

### Android
- **Current SDK Version Provided:** `36.0.0`
- **Minimum Android Version Supported:** Android API Level **21**
- **Build System:** Gradle

### iOS
- **Current iOS SDK Version Provided:** `12.0`
- **Xcode Version:** `v26.0`
- **Apple Pay Support:** ✅ Yes

---

## 💳 Supported Payment Methods

- Apple Pay
- Card Payments (Debit / Credit)

> Apple Pay functionality requires proper merchant configuration, certificates, and entitlements on iOS.

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK `v3.29.1`
- Dart (bundled with Flutter)
- Android Studio / Android SDK
- Xcode `v26.0` (for iOS)
- Valid AlinmaPay PG credentials

---

### Install Dependencies
- flutter pub get
- cd ios/
- pod install
- flutter Run
  

```bash
flutter pub get
