# Flutter Forms Builder

A Flutter application for creating, previewing, and collecting responses to custom forms, inspired by Google Forms. Built with Material Design.

## Features

- **Form Creation**: Create forms with multiple question types
  - Multiple choice questions (with "Other" option)
  - Paragraph questions
- **Form Validation**: Mark questions as required and validate user input
- **Form Preview**: Preview and test your forms before sharing
- **Response Collection**: View and analyze form responses

## Project Structure

The project follows a structured architecture with the following components:

```
lib/
├── main.dart              # App entry point
├── models/                # Data models
├── screens/               # App screens
├── widgets/               # Reusable UI components
├── blocs/                 # BLoC state management
└── utils/                 # Utilities
```

## Documentation

Detailed documentation is available in the `docs/` directory:

- [Project Plan](docs/project_plan.md) - Overview of project structure, data models, and implementation phases
- [UI Mockups](docs/ui_mockups.md) - Detailed UI/UX design specifications
- [Implementation Plan](docs/implementation_plan.md) - Technical details and implementation timeline

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Android Studio or VS Code with Flutter plugins
- An emulator or physical device for testing

### Installation

1. Clone the repository
   ```bash
   git clone https://github.com/yourusername/flutter_form_builder.git
   ```

2. Navigate to the project directory
   ```bash
   cd flutter_form_builder
   ```

3. Get dependencies
   ```bash
   flutter pub get
   ```

4. Run the app
   ```bash
   flutter run
   ```

## Development Roadmap

- [x] Project planning and documentation
- [ ] Basic app structure and navigation
- [ ] Form builder implementation
- [ ] Form preview and validation
- [ ] Response collection and display
- [ ] UI polish and testing

## License

This project is licensed under the MIT License - see the LICENSE file for details. 