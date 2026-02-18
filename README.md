# E-Commerce App 🛍️

A professional, scalable E-Commerce application built with **Flutter**, designed using **Clean Architecture** principles and **BLoC** for state management. This project integrates **Firebase** for backend services with **Google Sign-In**, **Fastlane** for CI/CD, and **GitHub Actions** for automated builds and deployment.
The app also supports **multiple languages**, including Arabic and English,



---

## 🌟 Features

### Core Features

- ✅ **Clean Architecture**: Separation of concerns into Domain, Data, and Presentation layers
- ✅ **State Management**: Predictable state management using **flutter_bloc**
- ✅ **Dependency Injection**: Decoupled dependencies using **get_it**
- ✅ **Routing**: Deep linking and navigation using **go_router**
- ✅ **Functional Programming**: Error handling with **dartz**
- ✅ **Code Generation**: Boilerplate reduction with **freezed** and **json_serializable**
- ✅ **Responsive Design**: UI adaptation using **flutter_screenutil**
- ✅ **Localization**: Multi-language support (English, Arabic, French)
- ✅ **Secure Storage**: flutter_secure_storage for sensitive data

### Authentication

- ✅ **Google Sign-In**: OAuth2 authentication with Google
- ✅ **Firebase Auth**: Email/Password authentication
- ✅ **Session Management**: Secure token storage and validation
- ✅ **Auto-Login**: Resume session on app restart

### DevOps & CI/CD

- ✅ **Fastlane**: Automated build and release process
- ✅ **GitHub Actions**: CI/CD pipeline for testing and deployment with security
- ✅ **Flavors**: Multiple app configurations (dev, prod)

---

## 🚀 Core Use Cases

The application structure is driven by the following core business logic (Use Cases):

### 🔐 Authentication (`domain/auth/usecases`)

- **Sign Up**: Create a new user account
- **Sign In**: Authenticate existing users
- **Google Sign In**: OAuth2 authentication with Google
- **Sign Out**: Securely log out current users
- **Get User**: Retrieve current user profile details
- **Is Logged In**: Check if a user session is active
- **Send Password Reset Email**: Handle forgotten passwords

### 📦 Products (`domain/product/usecase`)

- **Get New In**: Fetch newly added products
- **Get Top Selling**: Retrieve popular/best-selling items
- **Get Products By Category**: Filter products based on selected categories
- **Get Products By Title**: Search for products by name/keyword
- **Is Favorite**: Check if a product is in the user's wishlist
- **Add Or Remove Favorite**: Toggle product favorite status
- **Get Favorite Products**: View the user's wishlist

### 🛒 Cart & Orders (`domain/order/usecase`)

- **Add To Cart**: Add items to the shopping cart
- **Remove Cart Product**: Remove items from the cart
- **Get Cart Product**: Retrieve current items in the cart
- **Order Registration**: Place a new order from the cart
- **Get Orders**: View order history

### 📂 Categories (`domain/category/usecase`)

- **Get Categories**: List all available product categories

---

## 🛠️ Tech Stack

| Technology                | Version | Purpose                |
| ------------------------- | ------- | ---------------------- |
| **Flutter**               | 3.29.0+ | Mobile Framework       |
| **Dart**                  | 3.0.0+  | Programming Language   |
| **firebase_auth**         | ^4.10.0 | Authentication         |
| **google_sign_in**        | ^6.1.4  | Google OAuth2          |
| **cloud_firestore**       | ^4.13.0 | Database               |
| **flutter_bloc**          | ^8.1.0  | State Management       |
| **get_it**                | ^7.6.0  | Dependency Injection   |
| **go_router**             | ^12.0.0 | Navigation             |
| **dartz**                 | ^0.10.1 | Functional Programming |
| **freezed**               | ^2.4.5  | Code Generation        |
| **get_storage**           | ^2.1.1  | Local Storage          |
| **flutter_screenutil**    | ^5.9.0  | Responsive Design      |
| **flutter_native_splash** | ^2.4.7  | Responsive Design      |

---

## 🏗️ Architecture & Design

This project follows the **Clean Architecture** pattern with:

```
┌─────────────────────────────────┐
│   Presentation Layer (UI)       │
│   ├── Pages & Widgets           │
│   ├── Cubits                    │
└────────────────┬────────────────┘
                 │
┌────────────────▼────────────────┐
│   Domain Layer (Business Logic) │
│   ├── Entities                  │
│   ├── Repositories (Interfaces) │
│   └── Use Cases                 │
└────────────────┬────────────────┘
                 │
┌────────────────▼────────────────┐
│   Data Layer (Implementation)   │
│   ├── Models                    │
│   ├── Data Sources              │
│   └── Repositories (Impl)       │
└─────────────────────────────────┘
```

### Key Components

- **Domain Layer**: Pure business logic, independent of frameworks
- **Data Layer**: Implements repository interfaces, handles data retrieval
- **Presentation Layer**: UI components, user interactions, state management

---

## 📂 Project Structure


```
assets/                          #Icons, Images, Vectros ,Screenshots ,I18n files
lib/
├── common/                      # Shared Resources
│   ├── bloc/                    # Global Application State
│   ├── widgets/                 # Reusable UI Components
│   ├── helper/                  # Utility Functions ( Validators, Formatters)
│   ├── model/                   # Utility Models
│   └── widgets/                 # Utility Widgets
│
├── core/                        # Core Configuration
│   ├── configs/                 # Constants, Themes, Assets
│   │   ├── assets
│   │   └── theme
│   ├── localization/            # Multi-Language Support
│   │   ├── app_localizations.dart
│   │   ├── extension.dart
│   │   └── language.dart
│   ├── storage/                 # Local Storage Service
│   │   └── get_storage.dart
│   ├── di/                      # Dependency Injection
│   │   └── service_locator.dart
│   ├── extensions/              # Extension Methods
│   ├── routing/                 # Navigation Configuration
│   │   ├── app_router.dart
│   │   └── routes.dart
│   └── usecase/                 # Base UseCase Class
│
├── data/                        # Data Layer
│   ├── datasources/
│   │   └── local/               # Firebase Data Sources
│   ├── models/
│   └── repositories/            # Repository Implementations
│
├── domain/                      # Domain Layer
│   ├── entities/
│   ├── repositories/            # Repository Interfaces
│   └── usecases/                # Business Logic
│
├── presentation/                #  Presentation Layer
│   ├── pages/
│   ├── cubits/
│   └── widgets/
│
├── main_development.dart         # 🚀 App Entry Point for development mode
├── main_production.dart         # 🚀 App Entry Point for Production mode
```

## 🏁 Getting Started

### Prerequisites

- Flutter SDK 3.29.0 or higher
- Dart SDK 3.0.0 or higher
- Firebase Project
- Android SDK (for Android)
- Ruby 2.6+ (for Fastlane)

### Installation

#### 1. Clone the Repository

```bash
git clone https://github.com/LeenAlkour/flutter-clean-ecommerce.git
cd flutter-clean-ecommerce
```

#### 2. Install Dependencies

```bash
flutter pub get
```

#### 3. Generate Code

```bash
dart run build_runner build --delete-conflicting-outputs
```

#### 4. Firebase Setup

```bash
# Install FlutterFire CLI
dart pub global activate flutterfire_cli

# Configure Firebase
flutterfire configure
```

#### 5. Configure Google Sign-In

 Update `android/app/build.gradle` with your credentials

#### 6. Setup Fastlane

```bash
# Android
cd android
fastlane init
cd ..
```

#### 7. Setup GitHub Secrets

Add the following secrets to your GitHub repository:

- `FIREBASE_CLI_TOKEN`: firebase cli token


#### 8. Run the App

```bash
# Production flavor
flutter run -t lib/main_production.dart --flavor production

# Development flavor
flutter run -t lib/main_development.dart --flavor development

```

**Built with ❤️ using Flutter**
