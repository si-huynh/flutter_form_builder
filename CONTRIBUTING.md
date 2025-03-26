# Contributing to Flutter Form Builder

Thank you for your interest in contributing to Flutter Form Builder! This document provides guidelines and instructions for contributing to the project.

## Code Style

We follow the official [Flutter style guide](https://dart.dev/guides/language/effective-dart/style) and use the following conventions:

1. Use `flutter format .` to format your code
2. Enable and fix all lint warnings
3. Write descriptive variable and function names
4. Add comments for complex logic
5. Keep functions small and focused
6. Use meaningful commit messages

## Development Process

1. **Fork and Clone**
   - Fork the repository on GitHub
   - Clone your fork locally
   ```bash
   git clone https://github.com/yourusername/flutter_form_builder.git
   ```

2. **Create a Branch**
   - Create a branch for your feature/fix
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make Changes**
   - Write your code
   - Add tests for new functionality
   - Update documentation as needed

4. **Test Your Changes**
   - Run all tests
   ```bash
   flutter test
   flutter test integration_test/
   ```
   - Fix any failing tests
   - Ensure code coverage remains high

5. **Submit a Pull Request**
   - Push your changes to your fork
   - Create a Pull Request from your branch
   - Describe your changes in detail
   - Reference any related issues

## Testing Requirements

1. **Unit Tests**
   - Write tests for all new functionality
   - Maintain test coverage above 80%
   - Test edge cases and error conditions

2. **Widget Tests**
   - Test UI components in isolation
   - Verify widget behavior and interactions
   - Test different screen sizes and orientations

3. **Integration Tests**
   - Add end-to-end tests for new features
   - Test user flows and interactions
   - Verify data persistence and state management

## Git Workflow

1. **Branches**
   - `main` - stable production code
   - `develop` - development branch
   - `feature/*` - new features
   - `bugfix/*` - bug fixes
   - `release/*` - release preparation

2. **Commits**
   - Write clear commit messages
   - Use present tense ("Add feature" not "Added feature")
   - Reference issue numbers when applicable

3. **Pull Requests**
   - Keep PRs focused and small
   - Update documentation and tests
   - Resolve merge conflicts
   - Respond to review comments

## Release Process

1. **Version Bump**
   - Update version in pubspec.yaml
   - Update CHANGELOG.md
   - Create release notes

2. **Testing**
   - Run full test suite
   - Perform manual testing
   - Check documentation

3. **Release**
   - Create a release branch
   - Tag the release
   - Merge to main
   - Update develop

## Questions and Support

- Open an issue for bugs or feature requests
- Join our Discord channel for discussions
- Check the documentation first
- Be respectful and helpful to others

## Testing

### Writing Tests

All code should have unit tests. We strive for high test coverage to ensure the reliability of the application.

- **Models**: All model classes should have >95% test coverage
- **BLoC Classes**: All business logic should have >90% test coverage
- **UI/Widgets**: UI components should have >85% test coverage
- **Utility Functions**: Helper functions should have >90% test coverage

#### Running Tests

```bash
# Run all tests
flutter test

# Run a specific test file
flutter test test/models/form_model_test.dart

# Run tests with coverage and generate report
./tool/coverage.sh
```

### Code Coverage

When submitting a pull request, make sure your changes maintain or improve the overall test coverage. The CI pipeline will automatically verify coverage metrics.

- Generated files (*.g.dart, *.freezed.dart) are automatically excluded from coverage metrics
- You can run `./tool/coverage.sh` to generate a local coverage report
- Focus on testing business logic and edge cases rather than simple properties

Thank you for contributing to Flutter Form Builder! 