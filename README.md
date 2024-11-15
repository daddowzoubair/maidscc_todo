# Maids.cc Todo Task

Maids.cc Todo Task is a Flutter application designed as a task from **Maids.cc** company. It supports creating, updating, and deleting tasks, and is built with a clean architecture using Flutter and BLoC state management. The app is tested on both iOS (iPhone 16 Pro) and Android (Pixel 9 Pro XL API VanillaIceCream).

Designed by : `Zoubair Daddow`


## Steps to Run the Application

1. **Clone the repository:**
   ```bash
   git clone https://github.com/daddowzoubair/maidscc_todo.git

2. **Navigate to the project directory:**
  `cd maidscc_todo`

3. **Install dependencies:**
  Run the following command to install all the necessary dependencies:
   `flutter pub get`

4. **Run the application:**
  To run the app on a connected device or emulator, use the following command:
   `flutter run`

5. **Build for iOS or Android:**
  - For iOS:
   `flutter build ios`
   - For Android:
   `flutter build apk`

## Project Details

- **Flutter Version**: 3.24.4
- **Tested on Devices**:
  - *iPhone 16 Pro* (iOS)
  - *Pixel 9 Pro XL API VanillaIceCream* (Android)

### Flutter Environment
 [✓] Flutter (Channel stable, 3.24.4, on macOS 15.1 24B83 darwin-arm64, locale en-AE)
 [✓] Android toolchain - develop for Android devices (Android SDK version 34.0.0)
 [✓] Xcode - develop for iOS and macOS (Xcode 16.1)
 [✓] Chrome - develop for the web
 [✓] Android Studio (version 2024.2)
 [✓] VS Code (version 1.95.2)
 [✓] Connected device (4 available)
 [✓] Network resources

## Libraries Used

- `shared_preferences`: ^2.3.3 - Store and retrieve simple data locally.
- `dio`: ^5.7.0 - A powerful HTTP client for network requests.
- `freezed`: ^2.5.7 - Generate immutable classes and union types.
- `freezed_annotation`: ^2.4.4 - Annotation library for Freezed, used for code generation.
- `json_annotation`: ^4.9.0 - JSON serialization and deserialization support.
- `retrofit`: ^4.4.1 - Generate REST API clients with Retrofit-like syntax.
- `retrofit_generator`: ^9.1.4 - Code generator for Retrofit API clients.
- `build_runner`: ^2.4.13 - Tool to generate code based on annotations.
- `json_serializable`: ^6.8.0 - Auto-generate JSON serialization/deserialization logic.
- `provider`: ^6.1.2 - State management with dependency injection.
- `flutter_svg`: ^2.0.14 - Render SVG images in Flutter.
- `cached_network_image`: ^3.4.1 - Efficiently load and cache network images.
- `injectable`: ^2.5.0 - Dependency injection framework with code generation.
- `get_it`: ^8.0.2 - Service locator for dependency injection.
- `injectable_generator`: ^2.6.2 - Code generator for Injectable.
- `icons_launcher`: ^3.0.0 - Generate app icons for various platforms.
- `equatable`: ^2.0.5 - Simplify object comparison.
- `flutter_bloc`: ^8.1.6 - State management with BLoC pattern.
- `mockito`: ^5.4.4 - Mocking library for unit tests.

## Architecture

The project follows **Feature-First Architecture**, which provides the following advantages:
- **Modularity**: Allows for easy maintenance and scalability by organizing code based on features, rather than technical layers.
- **Separation of Concerns**: Ensures that each feature has its own structure, making it easier to understand and develop independently.

### Project Structure

The directory structure is as follows:
lib
├── constants
│   └── (Contains all application constants like AppStrings, AppDimensions, AppThemes, etc.)
├── core
│   ├── enum
│   │   └── (Contains all enums used in the project)
│   ├── models
│   │   └── (Contains all general models)
│   ├── network
│   │   ├── clients
│   │   │   └── (API clients)
│   │   └── interceptors
│   │       └── (Dio interceptors)
│   ├── service_locator
│   │   └── (GetIt registered classes)
│   ├── utils
│   │   └── (Utility functions used in the project)
│   └── widgets
│       └── (Shared widgets used across the app)
├── features
│   ├── authentication
│   │   ├── data
│   │   │   ├── data_sources
│   │   │   ├── entities
│   │   │   └── repositories
│   │   ├── presentation
│   │   │   ├── controller
│   │   │   ├── screens
│   │   │   └── widgets
│   └── todos
│       ├── data
│       │   ├── data_sources
│       │   ├── entities
│       │   └── repositories
│       ├── presentation
│       │   ├── controller
│       │   ├── screens
│       │   └── widgets

