import 'package:flutter/material.dart';
import 'package:flutter_form_builder/widgets/debounced_text_field.dart';
import 'package:flutter_form_builder/widgets/paragraph_answer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ParagraphAnswer', () {
    testWidgets('renders correctly with provided value', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ParagraphAnswer(
              value: 'Initial value',
              onChanged: (value) {},
            ),
          ),
        ),
      );

      // Verify DebouncedTextField is rendered
      expect(find.byType(DebouncedTextField), findsOneWidget);

      // Verify initial value is set
      expect(find.text('Initial value'), findsOneWidget);

      // Verify hint text is shown when field is empty
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ParagraphAnswer(
              value: null,
              onChanged: (value) {},
            ),
          ),
        ),
      );

      // Should show hint text with empty field
      expect(find.text('Enter your answer here...'), findsOneWidget);
    });

    testWidgets('calls onChanged when text input changes', (tester) async {
      var capturedValue = '';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ParagraphAnswer(
              value: '',
              onChanged: (value) => capturedValue = value,
            ),
          ),
        ),
      );

      // Find and interact with the text field
      final textField = find.byType(TextField);
      await tester.enterText(textField, 'Updated answer');
      await tester.pump(
        const Duration(milliseconds: 500),
      ); // Allow debounce to complete

      // Verify onChanged was called with the new value
      expect(capturedValue, 'Updated answer');
    });

    testWidgets('renders with correct properties', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ParagraphAnswer(
              value: '',
              onChanged: (_) {},
            ),
          ),
        ),
      );

      // Verify text field properties
      final textField = tester.widget<DebouncedTextField>(
        find.byType(DebouncedTextField),
      );

      expect(textField.maxLines, 3);
      expect(textField.decoration?.border, isA<OutlineInputBorder>());
      expect(textField.decoration?.hintText, 'Enter your answer here...');
    });
  });
}
