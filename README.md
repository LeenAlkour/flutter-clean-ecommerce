# E-Commerce App 🛍️

A professional, scalable E-Commerce application built with **Flutter**, designed using **Clean Architecture** principles and **BLoC** for state management. This project integrates **Firebase** for backend services.

## 🌟 Features

- **Clean Architecture**: Separation of concerns into Domain, Data, and Presentation layers.
- **State Management**: Predictable state management using **flutter_bloc**.
- **Dependency Injection**: Decoupled dependencies using **get_it**.
- **Routing**: deeply linking and navigation using **go_router**.
- **Functional Programming**: Error handling with **dartz**.
- **Code Generation**: Boilerplate reduction with **freezed** and **json_serializable**.
- **Responsive Design**: UI adaptation using **flutter_screenutil**.

## 🚀 Core Use Cases

The application structure is driven by the following core business logic (Use Cases):

### 🔐 Authentication (`domain/auth/usecases`)

- **Sign Up**: Create a new user account.
- **Sign In**: Authenticate existing users.
- **Sign Out**: Securely log out current users.
- **Get User**: Retrieve current user profile details.
- **Get Ages**: Retrieve age options/data (if applicable).
- **Is Logged In**: Check if a user session is active.
- **Send Password Reset Email**: Handle forgotten passwords.

### 📦 Products (`domain/product/usecase`)

- **Get New In**: Fetch newly added products.
- **Get Top Selling**: Retrieve popular/best-selling items.
- **Get Products By Category**: Filter products based on selected categories.
- **Get Products By Title**: Search for products by name/keyword.
- **Is Favorite**: Check if a product is in the user's wishlist.
- **Add Or Remove Favorite**: Toggle product favorite status.
- **Get Favorite Products**: View the user's wishlist.

### 🛒 Cart & Orders (`domain/order/usecase`)

- **Add To Cart**: Add items to the shopping cart.
- **Remove Cart Product**: Remove items from the cart.
- **Get Cart Product**: Retrieve current items in the cart.
- **Order Registration**: Place a new order from the cart.
- **Get Orders**: View order history.

### 📂 Categories (`domain/category/usecase`)

- **Get Categories**: List all available product categories.

## 🛠️ Tech Stack

- **Framework**: Flutter
- **Language**: Dart
- **Backend / Database**: Firebase Auth, Cloud Firestore
- **State Management**: flutter_bloc
- **Dependency Injection**: get_it
- **Navigation**: go_router
- **Networking/Data**: dartz (Either monad), json_serializable
- **UI/UX**: flutter_screenutil, flutter_svg, cached_network_image
- **Utilities**: intl, random_string, flutter_native_splash

## 🏗️ Architecture & Design

This project follows the **Clean Architecture** pattern to ensure scalability, testability, and maintainability.


### Key Components

- **Domain Layer**: The core business logic. It is independent of any external libraries or frameworks (Pure Dart). contains Entities, Use Cases, and Repository Interfaces.
- **Data Layer**: Responsible for data retrieval. It implements the repository interfaces defined in the domain layer.
- **Presentation Layer**: The UI of the application. It interacts with the domain layer through BLoC/Cubit.

## 🧰 Libraries & Tools

| Library                | Purpose                | Justification                                                                                   |
| :--------------------- | :--------------------- | :---------------------------------------------------------------------------------------------- |
| **flutter_bloc**       | State Management       | Provides a predictable state management solution that clearly separates business logic from UI. |
| **get_it**             | Dependency Injection   | A simple Service Locator to decouple interface from implementation, making testing easier.      |
| **go_router**          | Navigation             | Declarative routing package that supports deep linking and nested navigation.                   |
| **dartz**              | Functional Programming | Used for `Either<Left, Right>` to handle errors gracefully without try-catch blocks.            |
| **freezed**            | Code Generation        | Reduces boilerplate for immutable classes and unions. Essential for BLoC states and events.     |
| **flutter_screenutil** | Responsiveness         | Adapts UI to different screen sizes and pixel densities easily.                                 |




## 📱 Screenshots

|             Home Screen              |              Product Details               |                 Cart                 |
| :----------------------------------: | :----------------------------------------: | :----------------------------------: |
| ![Home](assets/screenshots/home.png) | ![Details](assets/screenshots/details.png) | ![Cart](assets/screenshots/cart.png) |



## 📂 Project Structure

```
lib/
├── common/            # 🌐 Shared resources accessible across the app
│   ├── bloc/          # Global application state (e.g., Theme, Auth Status)
│   ├── widgets/       # Reusable UI components (Buttons, Input Fields)
│   └── helper/        # General utility functions
├── core/              # ⚙️ Core application configuration
│   ├── configs/       # Constants, Themes, Assets paths
│   ├── routing/       # Navigation & Routes (GoRouter configs)
│   └── usecase/       # Base UseCase abstract class
├── data/              # 💾 Data Layer (Implementation Details)
│   ├── datasources/   # Remote (Firebase) & Local (DB) data sources
│   ├── models/        # DTOs (Data Transfer Objects) with JSON serialization
│   └── repositories/  # Concrete implementations of Domain repositories
├── domain/            # 🧠 Domain Layer (Pure Business Logic)
│   ├── entities/      # Immutable core business objects
│   ├── repositories/  # Abstract contracts (Interfaces) for data operations
│   └── usecases/      # Application-specific business rules
│       ├── auth/      # Authentication logic
│       ├── product/   # Product management logic
│       └── ...
├── presentation/      # 📱 Presentation Layer (UI & State)
│   ├── auth/          # Sign In / Sign Up screens
│   ├── home/          # Main Dashboard
│   ├── cart/          # Shopping Cart & Checkout
│   ├── setting/       # User Preferences
│   └── ...
├── main.dart          # 🚀 App Entry Point
└── service_locator.dart # 💉 Dependency Injection Setup (GetIt)
```

## 🏁 Getting Started

### Prerequisites

- Flutter SDK installed (Version 3.29.0 or higher recommended)
- Dart SDK
- Firebase Project setup

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/LeenAlkour/flutter-clean-ecommerce.git
   cd flutter-clean-ecommerce
   ```

2. **Install dependencies:**

   ```bash
   flutter pub get
   ```

3. **Code Gen (Build Runner):**
   Run this command to generate code for Freezed and JSON Serializable models:

   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Firebase Setup:**
   - Configure your Firebase project.
   - Add `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) to their respective directories.
   - Or use `flutterfire configure`.

5. **Run the app:**
   ```bash
   flutter run
   ```
