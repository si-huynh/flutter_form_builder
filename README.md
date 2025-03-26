# Flutter Form Builder

A comprehensive form building application built with Flutter that allows users to create, manage, preview, and collect responses to custom forms. The application features persistent state management, a modern dashboard UI, and detailed response analytics.

## Releases

### Version 1.0.0 (Initial Release)
- Complete form creation and management system
- Dashboard for form organization
- Support for multiple question types
- Form preview functionality
- Response collection and analytics
- Persistent storage for forms and responses

[Download APK](https://github.com/yourusername/flutter_form_builder/releases/tag/v1.0.0)

## Features

- **Dashboard Management**:
  - Grid view of all created forms
  - Form creation, editing, and deletion
  - Quick access to form details and actions

- **Dynamic Form Creation**:
  - Multiple choice questions with customizable options
  - "Other" option support for multiple choice questions
  - Paragraph/long-answer questions
  - Required field validation
  - Form reordering and customization

- **Form Preview**:
  - Real-time preview of form appearance
  - Test form interaction and validation
  - Submit test responses directly from preview

- **Response Collection and Analysis**:
  - Collect responses from users
  - View individual responses
  - Automatic response aggregation and statistics
  - Data visualization for multiple choice questions
  - Response filtering and management

- **Architecture Features**:
  - Full state persistence across app restarts
  - Offline support
  - Responsive UI design
  - Form data synchronization

## Technology Stack

- **State Management**: BLoC pattern with HydratedBloc for persistence
- **Navigation**: Auto Route for declarative routing
- **Data Modeling**: Freezed for immutable models with JSON serialization
- **UI**: Material Design 3 with responsive layouts
- **Testing**: Unit, widget, and integration tests
****
## Getting Started

### Prerequisites

- Flutter SDK (3.3.0 or higher)
- Dart SDK (3.0.0 or higher)
- A code editor (VS Code, Android Studio, etc.)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/flutter_form_builder.git
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
flutter pub run build_runner build --delete-conflicting-outputs
```

5. Run the app:
```bash
flutter run
```

## Architecture

The application follows a clean architecture pattern with BLoC (Business Logic Component) for state management:

### Directory Structure

- `lib/models/` - Data models (FormModel, QuestionModel, ResponseModel)
- `lib/blocs/` - Business logic components
  - `forms/` - Manages multiple forms
  - `form_editor_bloc/` - Form creation and editing
  - `preview/` - Form preview and validation
  - `responses/` - Response collection and aggregation
- `lib/screens/` - UI screens
  - `dashboard/` - Form overview and management
  - `form_builder/` - Form creation interface
  - `preview/` - Form preview interface
  - `responses/` - Response visualization
- `lib/widgets/` - Reusable UI components
- `lib/router/` - Navigation and routing
- `lib/utils/` - Utility functions and helpers (ResponseAggregator, etc.)

### State Management

The application uses a robust state management approach:

- **HydratedBloc**: For persisting state between app sessions
- **State Synchronization**: Synchronized state between different blocs
- **Event-Driven Architecture**: Clean separation of events, states, and UI

## Key Features Implementation

### Form Creation
Forms are built using a drag-and-drop interface with multiple question types. Each form has a unique ID and metadata for tracking.

### Response Collection
Responses are collected using a standardized model, allowing for easy aggregation and analysis.

### Data Persistence
All forms and responses are automatically persisted to local storage using HydratedBloc, ensuring that data is never lost.

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
# Run the coverage script
./tool/coverage.sh
```

This script will:
1. Run all tests with coverage instrumentation
2. Automatically exclude generated files (*.g.dart, *.freezed.dart) from coverage metrics
3. Generate an HTML coverage report
4. Display files with coverage below 85%
5. Open the HTML report in your browser (on macOS)

You can also run the steps manually:
```bash
# Run tests with coverage
flutter test --coverage

# Generate HTML report
genhtml coverage/lcov.info -o coverage/html

# Open coverage report (macOS)
open coverage/html/index.html
```

#### Interpreting Coverage Results

- Green: Lines covered by tests
- Red: Lines not covered by tests
- Grey: Lines ignored in coverage (typically non-executable lines)

#### Coverage Goals

The project aims for the following test coverage targets:
- Models: >95% coverage
- BLoC classes: >90% coverage 
- UI/Widgets: >85% coverage
- Utility functions: >90% coverage

## Troubleshooting

If you encounter issues with serialization or state persistence:

1. Ensure all models are properly annotated with `@freezed` and have JSON serialization methods
2. Run `flutter clean` followed by `flutter pub get` and rebuild generated files
3. Check bloc implementation for proper state emissions and event handling

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and development process.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details. 