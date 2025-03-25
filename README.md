# Flutter Form Builder

A dynamic form builder application built with Flutter that allows users to create, preview, and collect responses to custom forms.

## Features

- Create custom forms with multiple question types:
  - Multiple choice questions
  - Short answer questions
  - Long answer questions
- Preview forms before publishing
- Collect and view form responses
- Real-time response aggregation
- Beautiful and responsive UI
- Offline support with data persistence

## Getting Started

### Prerequisites

- Flutter SDK (3.1.0 or higher)
- Dart SDK (3.0.0 or higher)
- A code editor (VS Code, Android Studio, etc.)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/sihuynh/flutter_form_builder.git
```

2. Navigate to the project directory:
```bash
cd flutter_form_builder
```

3. Install dependencies:
```bash
flutter pub get
```

4. Run the code generation:
```bash
dart pub run build_runner build --delete-conflicting-outputs
```

5. Run the app:
```bash
flutter run
```

## Architecture

The application follows a clean architecture pattern with BLoC (Business Logic Component) for state management:

- `lib/models/` - Data models and their serialization
- `lib/blocs/` - Business logic and state management
- `lib/screens/` - UI screens and pages
- `lib/widgets/` - Reusable UI components
- `lib/router/` - Navigation and routing
- `lib/utils/` - Utility functions and helpers

### State Management

The app uses the BLoC pattern with the following key components:

- `FormEditorBloc` - Manages form creation and editing
- `PreviewBloc` - Handles form preview and validation
- `ResponsesBloc` - Manages form responses and aggregation

## Testing

### Running Tests

1. Unit Tests:
```bash
flutter test
```

2. Widget Tests:
```bash
flutter test test/screens/
```

3. Integration Tests:
```bash
flutter test integration_test/
```

### Test Coverage

To generate test coverage reports:
```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and development process.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details. 