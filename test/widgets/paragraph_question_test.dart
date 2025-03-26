import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_form_builder/widgets/paragraph_question.dart';
import 'package:flutter_form_builder/widgets/debounced_text_field.dart';

void main() {
  group('ParagraphQuestion', () {
    testWidgets('renders correctly with proper UI elements', (tester) async {
      // Build the widget
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ParagraphQuestion(),
          ),
        ),
      );

      // Verify DebouncedTextField is rendered
      expect(find.byType(DebouncedTextField), findsOneWidget);

      // Verify hint text is shown
      expect(find.text('Enter your answer here...'), findsOneWidget);

      // Verify it has multiple lines
      final textField = tester.widget<DebouncedTextField>(
        find.byType(DebouncedTextField),
      );
      expect(textField.maxLines, 3);

      // Verify it has an outline border
      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is DebouncedTextField &&
              widget.decoration?.border is OutlineInputBorder,
        ),
        findsOneWidget,
      );
    });

    // Directly test the onChanged callback
    testWidgets('handles text changes without errors', (tester) async {
      // Create a key to find the widget easily
      final key = GlobalKey();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ParagraphQuestion(key: key),
          ),
        ),
      );

      // Find the TextField
      final textField = find.descendant(
        of: find.byKey(key),
        matching: find.byType(TextField),
      );

      // Enter text
      await tester.enterText(textField, 'Test input');
      await tester.pump(const Duration(milliseconds: 500)); // Wait for debounce

      // Verify the text was entered successfully (no errors means onChanged worked)
      expect(find.text('Test input'), findsOneWidget);
    });
  });
}
