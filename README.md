# 🌐 Al-Fateh Management System (منظومة الفتح)

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Architecture](https://img.shields.io/badge/Architecture-Clean%20MVVM%20%2B%20Bloc-purple)](#architecture--tech-stack)
[![Platforms](https://img.shields.io/badge/Platforms-Windows%20%7C%20Web%20%7C%20Android%20%7C%20iOS-success)](#platforms)
[![Tests](https://img.shields.io/badge/Tests-24%20Passing%20(100%25)-brightgreen)](#testing--verification)
[![Security](https://img.shields.io/badge/Security-Encrypted%20Cache%20%7C%20Zero--Plaintext-blue)](#security--offline-caching)

A cross-platform enterprise management solution specifically engineered for **Al-Fateh Internet Service Provider (ISP)** operations. The platform unifies technical support ticket workflows, geofenced GPS employee attendance, hierarchical Role-Based Access Control (RBAC), and offline-first data caching powered by a Google Cloud & Apps Script backend.

---

## 📑 Table of Contents

- [Overview](#-overview)
- [Architecture & Tech Stack](#-architecture--tech-stack)
- [Module Status & Feature Matrix](#-module-status--feature-matrix)
- [Security & Offline Caching](#-security--offline-caching)
- [Project Directory Structure](#-project-directory-structure)
- [Getting Started](#-getting-started)
- [Testing & Quality Assurance](#-testing--quality-assurance)
- [Changelog & Sprint Progress](#-changelog--sprint-progress)

---

## 🌟 Overview

The Al-Fateh ISP Management System is designed to solve critical operational challenges in ISP management:
* **High Availability & Low Latency:** Optimized for environments with fluctuating connectivity, supporting seamless offline caching and instant background synchronization.
* **Granular Role-Based Access Control (RBAC):** Distinct permission hierarchies for System Administrators (`ROLE_ADMIN`), General Management (`ROLE_GM`), Finance (`ROLE_FINANCE`), Technical Support (`ROLE_SUPPORT`), and Sales (`ROLE_SALES`).
* **Bidirectional Full Localization (Arabic & English):** Native RTL/LTR transitions, tailored typography (*Monadi* for headings, *Alhadari* for body text), and real-time backend response translation.

---

## 🏗️ Architecture & Tech Stack

The application follows **Clean Architecture** with a feature-first **MVVM (Model-View-ViewModel)** pattern powered by BLoC/Cubit:

```
┌────────────────────────────────────────────────────────┐
│                      Presentation                      │
│     Views / Widgets (Responsive UI)  ◄──►  Cubits      │
└───────────────────────────▲────────────────────────────┘
                            │
┌───────────────────────────▼────────────────────────────┐
│                         Domain                         │
│     Models (Entities)   ◄──►   Repository Interfaces   │
└───────────────────────────▲────────────────────────────┘
                            │
┌───────────────────────────▼────────────────────────────┐
│                          Data                          │
│     Repository Implementations                         │
│     ├─ Remote DataSource (Dio Client ◄─► GAS API)      │
│     └─ Local DataSource (Encrypted SharedPreferences)  │
└────────────────────────────────────────────────────────┘
```

* **Framework:** Flutter (Channel stable, Material Design 3)
* **State Management:** `flutter_bloc` (v8.1.6)
* **Routing:** `go_router` (v14.8.1) with declarative route guards & custom transitions
* **Network & HTTP:** `dio` (v5.8.0+1) with request pooling, timeouts, and redirect handling
* **Cryptography:** `crypto` (v3.0.6) for SHA-256 password hashing and salted verification
* **Storage:** `shared_preferences` (v2.5.3) with symmetric XOR/Base64 payload encryption
* **Integrations:** `url_launcher` (v6.3.1) for WhatsApp instant technical support

---

## 📊 Module Status & Feature Matrix

| Module | Feature | Status | Description |
| :--- | :--- | :---: | :--- |
| **Auth** | User Login | ✅ Completed | Authenticates against cloud backend with zero plaintext. |
| **Auth** | Auto-Login & Remember Me | ✅ Completed | Restores active sessions via Splash screen within 14-day TTL. |
| **Auth** | Offline Authentication | ✅ Completed | Local salted verifier allows offline access safely. |
| **Auth** | Session Encryption | ✅ Completed | Device storage encrypted; no plain JSON stored. |
| **Localization** | Arabic (RTL) & English (LTR) | ✅ Completed | Complete bilingual support with instant runtime toggle. |
| **Localization** | Universal Backend Translator | ✅ Completed | Automatically translates API error and status responses. |
| **UI/UX** | Responsive Layouts | ✅ Completed | Zero overflow on small mobiles, tablets, and wide screens. |
| **Tickets** | Support Tickets Management | 🚧 Backend Ready | 9 standard columns for tracking inquiries and repairs. |
| **Attendance** | GPS Geofenced Check-in | 🚧 Backend Ready | HQ geofence validation (Damascus) + Mock GPS prevention. |
| **Audit** | Audit Logs Subsystem | 🚧 Backend Ready | Immutable action logs for every administrative mutation. |

---

## 🔒 Security & Offline Caching

1. **Zero-Plaintext Policy:**
   * Passwords are never sent across the wire or stored in plaintext. They are hashed using SHA-256 on the client side before any network transmission.
   * Google Sheets stores only SHA-256 hashes in the `Users` tab.
2. **Encrypted Local Storage (`AppCrypto`):**
   * Stored user sessions in `SharedPreferences` are encrypted to prevent reverse-engineering or memory scraping on shared desktop terminals.
3. **Anti-Bypass Offline Verifier:**
   * To prevent unauthorized offline access by typing arbitrary passwords, an offline-salted hash is stored locally (`hashOfflinePassword`). Input credentials are validated even when completely offline.
4. **Time-To-Live (TTL) Enforcement:**
   * Offline sessions expire after **14 days**, enforcing periodic re-authentication against the central directory to verify account status.
5. **Git Secret Protection:**
   * `.gitignore` is fortified to prevent accidental leaks of `.env*` or sensitive credential files to public version control.

---

## 📁 Project Directory Structure

```text
lib/
├── core/
│   ├── constants/            # Asset paths, brand dimensions, colors
│   ├── localization/         # AppLocalizations, LocaleCubit, BackendMessageTranslator
│   ├── network/              # DioClient, ApiEndpoints, error handlers
│   ├── routing/              # AppRouter (GoRouter configuration)
│   ├── theme/                # Light/Dark MaterialTheme definitions, ThemeCubit
│   ├── utils/                # AppCrypto, ContextExtensions, AppSnackbars
│   └── widgets/              # Reusable design system components (Buttons, Inputs, etc.)
├── features/
│   ├── auth/                 # Authentication Feature
│   │   ├── data/             # Remote & Local DataSources, RepositoryImpl
│   │   ├── domain/           # UserModel, AuthSession, AuthRepository
│   │   └── presentation/     # LoginView, LoginCubit, LoginState, Widgets
│   ├── home/                 # Main Dashboard & Service Portal
│   └── splash/               # Animated Startup & Auto-Login Session Resolver
└── main.dart                 # Application Bootstrap & MultiBlocProvider
```

---

## 🚀 Getting Started

### Prerequisites
* Flutter SDK (3.24.0 or higher recommended)
* Dart SDK (3.5.0 or higher)
* Git

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/MohammedHashemBdier/al_fateh_management.git
   cd al_fateh_management
   ```

2. **Install project dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the application:**
   * **Windows Desktop:**
     ```bash
     flutter run -d windows
     ```
   * **Web Browser (Chrome):**
     ```bash
     flutter run -d chrome
     ```
   * **Android / Mobile:**
     ```bash
     flutter run -d android
     ```

---

## 🧪 Testing & Quality Assurance

The codebase maintains rigorous quality standards with comprehensive unit, cubit, and responsive widget tests:

```bash
# Run all test suites
flutter test

# Run static analysis
flutter analyze
```

### Current Test Coverage:
* `test/auth_repository_test.dart`: Online login, encrypted caching, offline salted verification, session TTL expiry, server rejection handling.
* `test/login_cubit_test.dart`: State emissions, credential validation, role checking, error propagation.
* `test/splash_cubit_test.dart`: Session resolution, auto-login navigation to `/home`, fallback to `/login`.
* `test/backend_message_translator_test.dart`: Bidirectional translation for network and API responses.
* `test/widget_test.dart`: Smoke tests, responsive layout constraints, and overflow prevention tests.

---

## 📝 Changelog & Sprint Progress

### Sprint 1: Enterprise Authentication & Foundation (October 2026)
* [x] Engineered MVVM Clean Architecture for Authentication.
* [x] Integrated live Google Apps Script Web App API (`AKfycbwW...`).
* [x] Built encrypted local cache mechanism with `AppCrypto`.
* [x] Added salted offline verifier and 14-day session expiration check.
* [x] Implemented auto-login from Splash screen when "Remember Me" is checked.
* [x] Created universal bilingual `BackendMessageTranslator` for API errors.
* [x] Fixed all layout overflow issues on narrow screens and mobile viewports.
* [x] Added direct WhatsApp admin support integration via `url_launcher`.
* [x] Reached 24/24 passing unit/widget tests and 0 analysis warnings.
