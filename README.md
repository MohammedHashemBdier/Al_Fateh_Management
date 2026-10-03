# 🌐 Al-Fateh Management System (منظومة الفتح)

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Architecture](https://img.shields.io/badge/Architecture-Clean%20MVVM%20%2B%20Bloc-purple)](#architecture--tech-stack)
[![Platforms](https://img.shields.io/badge/Platforms-Windows%20%7C%20Web%20%7C%20Android%20%7C%20iOS-success)](#platforms)
[![Tests](https://img.shields.io/badge/Tests-34%20Passing%20(100%25)-brightgreen)](#testing--verification)
[![Security](https://img.shields.io/badge/Security-Encrypted%20Cache%20%7C%20Zero--Plaintext-blue)](#security--offline-caching)

A cross-platform enterprise management solution specifically engineered for **Al-Fateh Internet Service Provider (ISP)** operations. The platform unifies technical support ticket workflows, geofenced GPS employee attendance, hierarchical Role-Based Access Control (RBAC), and offline-first data caching powered by a Google Cloud & Apps Script backend.

---

## 📑 Table of Contents

- [Overview](#-overview)
- [Architecture & Tech Stack](#-architecture--tech-stack)
- [Module Status & Feature Matrix](#-module-status--feature-matrix)
- [Role-Based Access Control (RBAC) & Dynamic UI](#-role-based-access-control-rbac--dynamic-ui)
- [Security & Offline Caching](#-security--offline-caching)
- [Project Directory Structure](#-project-directory-structure)
- [Getting Started](#-getting-started)
- [Testing & Quality Assurance](#-testing--quality-assurance)
- [Changelog & Sprint Progress](#-changelog--sprint-progress)

---

## 🌟 Overview

The Al-Fateh ISP Management System is designed to solve critical operational challenges in ISP management:
* **High Availability & Low Latency:** Optimized for environments with fluctuating connectivity, supporting seamless offline caching and instant background synchronization.
* **Granular Role-Based Access Control (RBAC):** Distinct permission hierarchies for System Administrators (`ROLE_ADMIN`), General Management (`ROLE_GM`), Finance (`ROLE_FINANCE`), Support Managers, Sales Managers, Technical Support (`ROLE_SUPPORT`), and Sales (`ROLE_SALES`).
* **Bidirectional Full Localization (Arabic & English):** Native RTL/LTR transitions, tailored typography (*Monadi* for headings, *Alhadari* for body text), and real-time backend response translation.
* **Adaptive Multi-Platform Layout:** Purpose-built for Windows Desktop as primary operational workstation, plus responsive Web, Tablet, and Mobile Android/iOS interfaces.

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
| **Home** | Adaptive Navigation | ✅ Completed | NavigationRail (Desktop/Tablet) & NavigationBar (Mobile). |
| **Home** | Role-Gated Dashboard | ✅ Completed | Metrics, quick actions, and recent activity tailored by role. |
| **Home** | Encrypted Stats Caching | ✅ Completed | Offline access to latest operational dashboard data. |
| **Core** | Reusable Component System | ✅ Completed | `AppButton`, `AppCard`, `AppHover`, `AppConfirmDialog`, `AppTooltip`. |
| **Core** | RBAC Gate Widgets | ✅ Completed | `RoleGate`, `PermissionGate`, `ScopeGate` for granular UI filtering. |
| **Localization** | Arabic (RTL) & English (LTR) | ✅ Completed | Complete bilingual support with instant runtime toggle. |
| **Localization** | Universal Backend Translator | ✅ Completed | Automatically translates API error and status responses. |
| **Tickets** | Support Tickets Management | 🚧 Backend Ready | 9 standard columns for tracking inquiries and repairs. |
| **Attendance** | GPS Geofenced Check-in | 🚧 Backend Ready | HQ geofence validation (Damascus) + Mock GPS prevention. |
| **Employees** | Staff & RBAC Management | 🚧 Backend Ready | Role assignment and user management interface. |
| **Settings** | Application & Account Profile | 🚧 Planned | Personalization, theme preferences, and security settings. |

---

## 👥 Role-Based Access Control (RBAC) & Dynamic UI

The dashboard dynamically morphs based on the authenticated employee's role:

| Role | Hierarchy | Nav Destinations | Key Metric Focus | Quick Actions Available | Data Scope |
| :--- | :---: | :--- | :--- | :--- | :---: |
| **System Admin** (`ROLE_ADMIN`) | Level 1 | Home, Tickets, Attendance, Staff, Settings | Total Tickets, Active Staff, System Health | New Ticket, Manage Staff, System Config | `ALL` |
| **General Manager** (`ROLE_GM`) | Level 1 | Home, Tickets, Attendance, Staff, Settings | Department Overview, Resolved Rates | Approve Actions, Payroll Audit | `ALL` |
| **Finance** (`ROLE_FINANCE`) | Level 2 | Home, Tickets, Attendance, Staff, Settings | Attendance Summary, Payroll Audits | Clock In/Out, Payroll Audit | `ALL` / Finance |
| **Support Manager** (`ROLE_SUPPORT_MANAGER`) | Level 2 | Home, Tickets, Attendance, Staff, Settings | In-Progress Tickets, Team Response Times | New Ticket, Approve Deletions | `DEPARTMENT` |
| **Sales Manager** (`ROLE_SALES_MANAGER`) | Level 2 | Home, Tickets, Attendance, Staff, Settings | Inquiries Count, Active Staff | New Ticket, Team Clock-In | `DEPARTMENT` |
| **Technical Support** (`ROLE_SUPPORT`) | Level 3 | Home, Tickets, Attendance, Settings | Assigned Inquiries, Today's Attendance | New Ticket, Clock In/Out | `SELF` / `TEAM` |
| **Sales Rep** (`ROLE_SALES`) | Level 3 | Home, Tickets, Attendance, Settings | Client Inquiries, Today's Attendance | New Ticket, Clock In/Out | `SELF` / `TEAM` |

### Security Gate Widgets:
* `<RoleGate allowedRoles={[UserRole.admin, UserRole.gm]}>`: Renders UI components only for designated roles.
* `<PermissionGate permissionCode="tickets.delete.approve">`: Evaluates fine-grained permissions.
* `<ScopeGate minimumScope={PermissionScope.department}>`: Enforces data scope hierarchy (`SELF` < `TEAM` < `DEPARTMENT` < `ALL`).

---

## 🔒 Security & Offline Caching

1. **Zero-Plaintext Policy:**
   * Passwords are never transmitted across the wire or stored in plaintext. They are hashed using SHA-256 on the client side before any network request.
   * Google Sheets stores only SHA-256 hashes in the `Users` tab.
2. **Encrypted Local Storage (`AppCrypto`):**
   * Stored user sessions and dashboard statistics in `SharedPreferences` are encrypted using XOR/Base64 cipher keys to prevent reverse-engineering on shared desktop terminals.
3. **Anti-Bypass Offline Verifier:**
   * To prevent unauthorized offline access by typing arbitrary passwords, an offline-salted hash is stored locally (`hashOfflinePassword`). Input credentials are validated even when completely offline.
4. **Time-To-Live (TTL) Enforcement:**
   * Offline sessions expire after **14 days**, enforcing periodic re-authentication against the central directory to verify account status.
5. **Universal Backend Message Translator:**
   * Raw backend error strings are intercepted by `BackendMessageTranslator` and mapped to localized UI strings without exposing server internals.
6. **Git Secret Protection:**
   * `.gitignore` is fortified to prevent accidental leaks of `.env*` or sensitive credential files to public version control.

---

## 📁 Project Directory Structure

```text
lib/
├── core/
│   ├── constants/            # Asset paths, brand dimensions, typography
│   ├── errors/               # AppException & Failure clean architecture classes
│   ├── localization/         # AppLocalizations, LocaleCubit, BackendMessageTranslator
│   ├── network/              # DioClient, ApiEndpoints, error handlers
│   ├── rbac/                 # UserRole, PermissionScope, AppPermissions matrix
│   ├── routing/              # AppRouter (GoRouter configuration & routes)
│   ├── theme/                # Light/Dark MaterialTheme definitions, ThemeCubit
│   ├── utils/                # AppCrypto, ContextExtensions, AppSnackbars
│   └── widgets/              # Reusable design system components
│       ├── app_button.dart
│       ├── app_card.dart
│       ├── app_confirm_dialog.dart
│       ├── app_hover.dart
│       ├── app_skeleton.dart
│       ├── app_tooltip.dart
│       ├── role_gate.dart
│       └── ...
├── features/
│   ├── attendance/           # GPS Attendance Module (Views & Cubits)
│   ├── auth/                 # Authentication & Session Module
│   ├── employees/            # Staff & Permissions Management Module
│   ├── home/                 # Main Shell & Role-Based Dashboard
│   │   ├── data/             # Remote & Local encrypted DataSources, RepositoryImpl
│   │   ├── domain/           # DashboardStatsModel, NavDestinationItem, Repository
│   │   └── presentation/     # HomeView, HomeCubit, HomeState, Widgets
│   ├── settings/             # Settings & Account Profile Module
│   ├── splash/               # Animated Startup & Auto-Login Session Resolver
│   └── tickets/              # Support & Inquiry Tickets Module
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

### Current Test Coverage (34 Tests Passing - 100%):
* `test/home_cubit_test.dart`: Dashboard stats loading, tab selection, data refresh, session error handling, logout.
* `test/role_gate_test.dart`: RoleGate, PermissionGate, and ScopeGate widget rendering and permission checks.
* `test/app_confirm_dialog_test.dart`: Modal confirmation rendering, danger variants, confirm/cancel callbacks.
* `test/auth_repository_test.dart`: Online login, encrypted caching, offline salted verification, session TTL expiry, server rejection handling.
* `test/login_cubit_test.dart`: State emissions, credential validation, role checking, error propagation.
* `test/splash_cubit_test.dart`: Session resolution, auto-login navigation to `/home`, fallback to `/login`.
* `test/backend_message_translator_test.dart`: Bidirectional translation for network and API responses.
* `test/widget_test.dart`: Smoke tests, responsive layout constraints, and overflow prevention tests.

---

## 📝 Changelog & Sprint Progress

### Sprint 2: Main Navigation & Adaptive Dashboard (October 2026)
* [x] Developed adaptive Home view shell (`HomeView`) supporting NavigationRail on Desktop/Tablet and NavigationBar on Mobile.
* [x] Implemented MVVM architecture for Home feature (`HomeCubit`, `HomeState`, `HomeRepositoryImpl`, `HomeLocalDataSource`, `HomeRemoteDataSource`).
* [x] Integrated `AppConfirmDialog` with warning/danger variants, keyboard Esc handling, and localized prompts.
* [x] Engineered `RoleGate`, `PermissionGate`, and `ScopeGate` widgets for granular RBAC interface adaptation.
* [x] Created `HomeStatsGrid` with dynamic metric cards, hover elevation, and custom skeleton loaders.
* [x] Created `HomeQuickActions` filtering action buttons according to user role permissions.
* [x] Created `HomeRecentActivity` showing latest live tickets from Google Sheets.
* [x] Created clean module destination placeholders: Tickets (`/tickets`), Attendance (`/attendance`), Staff (`/employees`), and Settings (`/settings`).
* [x] Expanded bilingual localization dictionaries (`AppLocalizations`) for all navigation items, roles, and dialogs.
* [x] Built unified `AppException` and `Failure` clean architecture hierarchy.
* [x] Reached 34/34 passing unit/widget tests and 0 static analyzer issues.

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
