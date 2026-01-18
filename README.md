# Flutter Base App

> A Flutter-based mobile application for managing personal lending and borrowing transactions.

[![Flutter](https://img.shields.io/badge/Flutter-3.0.5+-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?logo=dart)](https://dart.dev)

---

## 🏗️ Architecture

This project follows **Clean Architecture** with clear separation of concerns across multiple layers:

```
flutter_base_app/
├── lib/                          # Main application
│   ├── presentation/             # UI Layer
│   │   ├── {feature}/
│   │   │   ├── {feature}.screen.dart
│   │   │   ├── controller/
│   │   │   │   ├── {feature}.controller.dart
│   │   │   │   └── {feature}.state.dart
│   │   │   └── views/
│   │   └── ...
│   ├── infrastructure/           # App-level infrastructure
│   │   ├── environment/          # Environment configs
│   │   ├── navigation/           # Routing (go_router)
│   │   ├── theme/                # App theming
│   │   ├── enums/                # App-level enums
│   │   └── utils/                # Utilities
│   ├── ui_models/                # UI-specific models
│   ├── firebase_options.dart     # Firebase config
│   ├── initialize_app.dart       # App initialization
│   ├── initialize_socket.dart    # WebSocket setup
│   └── main.dart                 # Entry point
│
└── packages/                     # Modular packages
    ├── domain/                   # Business Logic & Data Models
    │   ├── lib/
    │   │   ├── models/           # Data models
    │   │   │   └── {feature}/    # 
    │   │   │       ├── converter/# Converters of models [entity <-> data] 
    │   │   │       ├── entity/   # Feature entities for object box and UI
    │   │   │       ├── responses/# API response models
    │   │   │       └── payloads/ # API request models
    │   │   ├── repository/       # Data access interfaces
    │   │   ├── use_cases/        # Business logic handlers
    │   │   ├── utils/            # Domain utilities
    │   │   └── objectbox.g.dart  # ObjectBox generated
    │   └── pubspec.yaml
    │
    ├── services/                 # External Services & APIs
    │   ├── lib/
    │   │   ├── data_providers/   # API clients (REST, WebSocket)
    │   │   ├── local_db_service/ # ObjectBox database
    │   │   ├── network_model/    # Network DTOs
    │   │   ├── network_state_manager/  # API response handling
    │   │   ├── extensions/       # Utility extensions
    │   │   └── utils/            # Service utilities
    │   └── pubspec.yaml
    │
    └── graphics/                 # Reusable UI Components
        ├── lib/
        │   ├── widgets/          # Reusable widgets
        │   ├── graphics_consts/  # UI constants (colors, fonts, strings, assets)
        │   ├── enums/            # UI-related enums
        │   └── utils/            # UI utilities
        ├── assets/               # Images, fonts, SVGs, Lottie
        └── pubspec.yaml
```

### Layer Dependencies

```
Presentation → Domain → Services
    ↓            ↓      
 Graphics     Graphics
```

**Rules**:
- ✅ Presentation can use Domain, Services, and Graphics
- ✅ Domain can use Services
- ✅ Graphics has no business logic (pure UI)
- ❌ Domain should NOT import Presentation
- ❌ Services should NOT import Domain or Presentation
- ❌ Graphics should NOT import Domain or Services

---

## 🧩 Technology Stack

### Core
- **Flutter SDK**: `>=3.0.5 <4.0.0`
- **Dart SDK**: `>=3.0.0 <4.0.0`

### State Management
- **[Reactiv](https://pub.dev/packages/reactiv)** `^1.1.0` - Reactive state management
    - Controllers extend `ReactiveController`
    - Private `_State` classes for state management
    - Observable values with `.value` pattern except ReactiveList`/`ReactiveSet`/`ReactiveMap

### Database
- **[ObjectBox](https://pub.dev/packages/objectbox)** `^4.3.0` - High-performance local database
    - Entities with `@Entity()` annotation
    - Type-safe queries
    - Real-time data synchronization

### Networking
- **[Dio](https://pub.dev/packages/dio)** `^5.0.1` - HTTP client
- **[WebSocket Channel](https://pub.dev/packages/web_socket_channel)** `^3.0.3` - Real-time communication

### Code Generation
- **[Freezed](https://pub.dev/packages/freezed)** `^2.4.7` - Immutable data classes
- **[json_serializable](https://pub.dev/packages/json_serializable)** `^6.7.1` - JSON serialization

### UI & Assets
- **[Lottie](https://pub.dev/packages/lottie)** `^2.4.0` - Animations
- **[Flutter SVG](https://pub.dev/packages/flutter_svg)** `^2.0.7` - SVG rendering
- **[cached_network_image](https://pub.dev/packages/cached_network_image)** `^3.3.0` - Image caching

### Navigation
- **[go_router](https://pub.dev/packages/go_router)** `^8.0.5` - Declarative routing

### Firebase
- **[Firebase Core](https://pub.dev/packages/firebase_core)** `^4.2.0`
- **[Firebase Auth](https://pub.dev/packages/firebase_auth)** `^6.1.1`
- **[Cloud Firestore](https://pub.dev/packages/cloud_firestore)** `^6.0.3`

### Contacts
- **[flutter_contacts](https://pub.dev/packages/flutter_contacts)** `^1.1.7+1`
- **[flutter_libphonenumber](https://pub.dev/packages/flutter_libphonenumber)** `^2.5.1`

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK `>=3.0.5`
- Dart SDK `>=3.0.0`
- Android Studio / Xcode (for mobile development)
- VS Code or IntelliJ IDEA (recommended)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd flutter_base_2026
   ```

2. **Install dependencies for all packages**
   ```bash
   flutter clean && \
   cd packages/graphics && flutter clean && flutter pub get && \
   cd ../services && flutter clean && flutter pub get && \
   cd ../domain && flutter clean && flutter pub get && \
   cd ../.. && flutter pub get
   ```

3. **Run code generation** (for Freezed models and ObjectBox)
   ```bash
   cd packages/domain
   flutter pub run build_runner build --delete-conflicting-outputs
   cd ../..
   ```

4. **Configure Firebase**
    - Add your `google-services.json` (Android) to `android/app/`
    - Add your `GoogleService-Info.plist` (iOS) to `ios/Runner/`
    - ⚠️ **IMPORTANT**: These files are gitignored and should NEVER be committed

5. **Run the app**
   ```bash
   flutter run
   ```

---

## 📐 Code Standards & Conventions

### File Naming

Files must use **snake_case**:
```dart
// ✅ Correct
user_profile_screen.dart
create_group_controller.dart

// ❌ Incorrect
UserProfileScreen.dart
createGroupController.dart
```

### Class Naming

Classes must use **UpperCamelCase** and match the filename:

```dart
// File: user_profile_screen.dart
class UserProfileScreen extends StatelessWidget { }

// File: create_group_controller.dart
class CreateGroupController extends ReactiveController { }
```

**Rule**: One file = One class (with matching name)

### Naming Suffixes

| Type | Suffix | Example | Location |
|------|--------|---------|----------|
| **Screens** | `Screen` | `PersonalChatDetailsScreen` | `lib/presentation/` |
| **Controllers** | `Controller` | `PersonalChatDetailsController` | `lib/presentation/{feature}/controller/` |
| **State Classes** | `State` | `_PersonalChatDetailsState` | Same file as controller |
| **Use Cases** | `Handler` | `AuthHandler`, `ChatHandler` | `packages/domain/lib/use_cases/` |
| **Repository** | `Repository` | `AuthRepository`, `ContactRepository` | `packages/domain/lib/repository/` |
| **Responses** | `Response` | `LoginResponse`, `UserProfileResponse` | `packages/domain/lib/models/responses/` |
| **Payloads** | `Payload` | `LoginPayload`, `ChatPayload` | `packages/domain/lib/models/payloads/` |
| **Entities** | `Entity` | `UserEntity`, `ChatEntity` | `packages/domain/lib/models/{feature}/` |
| **Data Classes** | `Data` | `ValidateOtpData` | Within response models |
| **Enums** | `Enum` | `UserTypeEnum`, `MessageStatusEnum` | `lib/infrastructure/enums/`, `packages/graphics/lib/enums/` |

### Enum Conventions

Enums use **lowerCamelCase** values with **Enum** suffix:

```dart
// ✅ Correct
enum UserTypeEnum {
  personalUser,
  businessUser,
}

enum MessageStatusEnum {
  sent,
  delivered,
  read,
}

// ❌ Incorrect
enum UserType {  // Missing Enum suffix
  PersonalUser,  // Should be lowerCamelCase
  BUSINESS_USER, // Should be lowerCamelCase
}
```

### Dart Style Guide

Follow the official [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style) and project-specific lints defined in `analysis_options.yaml`:

**Key Rules**:
- ✅ Line length: **≤110 characters** (see `formatter.page_width` in `analysis_options.yaml`)
- ✅ Always declare return types (`always_declare_return_types`)
- ✅ Use single quotes for strings (`prefer_single_quotes`)
- ✅ Use package imports (`always_use_package_imports`)
- ✅ Prefer `const` constructors (`prefer_const_constructors`)
- ✅ Use `debugPrint()` instead of `print()` (or wrap in `kDebugMode`)
- ✅ No unused imports
- ✅ Null safety enforced everywhere

---

## 🎨 Code Formatting

### Format All Code

```bash
cd packages/graphics && dart format . && \
cd ../domain && dart format . && \
cd ../services && dart format . && \
cd ../.. && dart format .
```

### Check Formatting (without changes)

```bash
dart format --set-exit-if-changed .
```

### Format Single File

```bash
dart format lib/presentation/personal/personal_chat_details/personal_chat_details.screen.dart
```

---

## 🔨 Build & Code Generation

### Freezed Models (JSON Serialization)

When you create or modify models with `@freezed` annotation:

```bash
cd packages/domain
flutter pub run build_runner build --delete-conflicting-outputs
```

**Watch mode** (auto-rebuild on file changes):
```bash
cd packages/domain
flutter pub run build_runner watch --delete-conflicting-outputs
```

### ObjectBox Database Schema

When you modify entity classes with `@Entity()`:

```bash
cd packages/domain
flutter pub run build_runner build --delete-conflicting-outputs
```

This regenerates `objectbox.g.dart` and `objectbox-model.json`.

---

## 🧪 Testing

### Run All Tests

```bash
flutter test
```

### Run Specific Test

```bash
flutter test test/widget_test.dart
```

### Run with Coverage

```bash
flutter test --coverage
```

---

## 🔍 Code Analysis

### Analyze All Code

```bash
flutter analyze
```

### Check for Common Issues

```bash
# Find print statements (should use debugPrint)
grep -r "print(" lib/ packages/ --include="*.dart" | grep -v "debugPrint"

# Find TODO/FIXME comments
grep -r "TODO\|FIXME\|HACK" lib/ packages/ --include="*.dart"

# Check outdated dependencies
flutter pub outdated
```

---

## 🏛️ Architecture Patterns

### Presentation Layer (Reactiv Pattern)

**Controller Structure**:
```dart
// File: lib/presentation/personal/personal_chat_details/controller/personal_chat_details.controller.dart

import 'package:reactiv/reactiv.dart';

part 'personal_chat_details.state.dart';

class PersonalChatDetailsController extends ReactiveController {
  final state = _PersonalChatDetailsState();
  
  @override
  void onInit() {
    super.onInit();
    // Initialize data, listeners
  }
  
  void someMethod() {
    // Business logic using use cases
    state.someValue.value = "new value"; // Triggers reactive update
  }
  
  @override
  void onClose() {
    // Dispose resources
    super.onClose();
  }
}
```

**State Class**:
```dart
// Part of: personal_chat_details.controller.dart

class _PersonalChatDetailsState {
  final someValue = Reactive<String>("");
  final isLoading = Reactive<bool>(false);
  final items = ReactiveList<Item>([]);
}
```

**Screen (View)**:
```dart
// File: lib/presentation/personal/personal_chat_details/personal_chat_details.screen.dart

class PersonalChatDetailsScreen extends ReactiveStateWidget<PersonalChatDetailsController> {
  @override
  PersonalChatDetailsController initController() => PersonalChatDetailsController();
  
  @override
  Widget build(BuildContext context, PersonalChatDetailsController controller) {
    return Scaffold(
      body: Observer(() => // Rebuilds when reactive values change
        Text(controller.state.someValue.value),
      ),
    );
  }
}
```

### Domain Layer (Use Cases)

**Handler Pattern**:
```dart
// File: packages/domain/lib/use_cases/auth/auth_handler.dart

class AuthHandler {
  final AuthRepository _repository;
  
  AuthHandler(this._repository);
  
  Future<ServiceResponse<ValidateOtpResponse>> validateOtp(String otp) async {
    try {
      final response = await _repository.validateOtp(otp);
      return ServiceResponse.success(body: response);
    } catch (e) {
      return ServiceResponse.error(message: e.toString());
    }
  }
}
```

### Repository Layer

**Interface Pattern**:
```dart
// File: packages/domain/lib/repository/auth/auth_repository.dart

abstract class AuthRepository {
  Future<ValidateOtpResponse> validateOtp(String otp);
  Future<void> logout();
}
```

**Implementation** (in services layer):
```dart
// File: packages/services/lib/data_providers/auth_api.dart

class AuthApi implements AuthRepository {
  final Dio _dio;
  
  @override
  Future<ValidateOtpResponse> validateOtp(String otp) async {
    final response = await _dio.post('/api/auth/validate-otp', data: {'otp': otp});
    return ValidateOtpResponse.fromJson(response.data);
  }
}
```

### Freezed Models

**Response Model**:
```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_response.freezed.dart';
part 'user_profile_response.g.dart';

@freezed
class UserProfileResponse with _$UserProfileResponse {
  const factory UserProfileResponse({
    @JsonKey(name: 'UserId') String? userId,
    @JsonKey(name: 'Name') String? name,
    @JsonKey(name: 'Icon') String? icon,
  }) = _UserProfileResponse;

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$UserProfileResponseFromJson(json);
}
```

**Payload Model**:
```dart
@freezed
class ChatPayload with _$ChatPayload implements GenericSinkPayload {
  const factory ChatPayload({
    @JsonKey(name: 'Event') required String event,
    @JsonKey(name: 'Body') ChatPayloadBody? body,
  }) = _ChatPayload;

  factory ChatPayload.fromJson(Map<String, Object?> json) =>
      _$ChatPayloadFromJson(json);
}
```

---

## 🔐 Security Best Practices

### ✅ DO:
- Use environment variables for sensitive configs
- Store tokens securely with `flutter_secure_storage`
- Add sensitive files to `.gitignore`:
  ```gitignore
  android/app/google-services.json
  ios/Runner/GoogleService-Info.plist
  .env
  ```
- Validate all API responses
- Use HTTPS for all network calls

### ❌ DON'T:
- Hardcode API keys, tokens, or secrets
- Commit Firebase config files
- Log sensitive data in production
- Use `print()` statements (use `debugPrint()` or wrap in `kDebugMode`)

---

## 📦 Package Management

### Update Dependencies

```bash
flutter pub upgrade
```

### Audit for Outdated Packages

```bash
flutter pub outdated
```

### Clean Build

```bash
flutter clean && flutter pub get
```

---

## 🐛 Debugging

### Enable Debug Mode

```dart
import 'package:flutter/foundation.dart';

if (kDebugMode) {
  print('Debug info');
}
```

### Run in Profile Mode

```bash
flutter run --profile
```

### Run in Release Mode

```bash
flutter run --release
```

---

## 📚 Additional Resources

### Project Documentation
- [Code Review Guide](code_review/review_my_code_changes.md)
- [Architecture Diagram](docs/architecture.md) _(TODO)_
- [API Documentation](docs/api.md) _(TODO)_

### External References
- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Reactiv Package](https://pub.dev/packages/reactiv)
- [ObjectBox Documentation](https://docs.objectbox.io/flutter)
- [Freezed Package](https://pub.dev/packages/freezed)

---

## 👥 Team

### Development Guidelines
- Follow the coding standards above
- Run `flutter analyze` before committing
- Format code with `dart format`
- Write meaningful commit messages
- Create feature branches from `master`
- Request code reviews before merging

### Commit Message Convention

```
feat: Add new feature
fix: Bug fix
refactor: Code refactoring
docs: Documentation update
style: Code formatting
test: Add tests
chore: Build/dependency updates
```

---

## 📝 License

This project is proprietary and confidential.

---

## 🔄 CI/CD

GitHub Actions workflow is configured in `.github/workflows/flutter_ci.yml` for:
- Code analysis
- Formatting checks
- Build verification

---

## 🙋 Support

For issues or questions, contact the development team or create an issue in the repository.

---

**Happy Coding! 🚀**
