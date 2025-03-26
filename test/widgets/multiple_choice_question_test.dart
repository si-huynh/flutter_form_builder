import 'package:flutter/material.dart';
import 'package:flutter_form_builder/widgets/debounced_text_field.dart';
import 'package:flutter_form_builder/widgets/multiple_choice_answer.dart';
import 'package:flutter_form_builder/widgets/multiple_choice_question.dart'
    as widgets;
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MultipleChoiceQuestion Editor UI', () {
    testWidgets('renders all options correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: widgets.MultipleChoiceQuestion(
              options: const ['Option 1', 'Option 2'],
              hasOther: false,
              onOptionsChanged: (_) {},
              onHasOtherChanged: (_) {},
            ),
          ),
        ),
      );

      // Should render all options with text fields
      expect(find.byType(DebouncedTextField), findsNWidgets(2));
      expect(find.text('Option 1'), findsOneWidget);
      expect(find.text('Option 2'), findsOneWidget);

      // Should render radio buttons for each option
      expect(find.byType(Radio<int>), findsNWidgets(2));

      // Should render delete buttons for each option
      expect(find.byIcon(Icons.delete), findsNWidgets(2));
    });

    testWidgets('adds option when add button is pressed', (tester) async {
      var capturedOptions = <String>[];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: widgets.MultipleChoiceQuestion(
              options: const ['Option 1', 'Option 2'],
              hasOther: false,
              onOptionsChanged: (options) => capturedOptions = options,
              onHasOtherChanged: (_) {},
            ),
          ),
        ),
      );

      // Find and tap the add option button
      final addButton = find.text('Add Option');
      expect(addButton, findsOneWidget);

      await tester.tap(addButton);
      await tester.pump();

      // Should call onOptionsChanged with original options plus empty new option
      expect(capturedOptions.length, 3);
      expect(capturedOptions, ['Option 1', 'Option 2', '']);
    });

    testWidgets('shows add option button only when options are fewer than 5',
        (tester) async {
      // Test with fewer than 5 options
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: widgets.MultipleChoiceQuestion(
              options: const ['Option 1', 'Option 2'],
              hasOther: false,
              onOptionsChanged: (_) {},
              onHasOtherChanged: (_) {},
            ),
          ),
        ),
      );

      expect(find.text('Add Option'), findsOneWidget);

      // Test with 5 options
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: widgets.MultipleChoiceQuestion(
              options: const [
                'Option 1',
                'Option 2',
                'Option 3',
                'Option 4',
                'Option 5',
              ],
              hasOther: false,
              onOptionsChanged: (_) {},
              onHasOtherChanged: (_) {},
            ),
          ),
        ),
      );

      expect(find.text('Add Option'), findsNothing);
    });

    testWidgets('deletes option when delete button is pressed', (tester) async {
      var capturedOptions = <String>[];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: widgets.MultipleChoiceQuestion(
              options: const ['Option 1', 'Option 2'],
              hasOther: false,
              onOptionsChanged: (options) => capturedOptions = options,
              onHasOtherChanged: (_) {},
            ),
          ),
        ),
      );

      // Find and tap the first delete button
      final deleteButtons = find.byIcon(Icons.delete);
      await tester.tap(deleteButtons.first);
      await tester.pump();

      // Should call onOptionsChanged with the remaining option
      expect(capturedOptions.length, 1);
      expect(capturedOptions, ['Option 2']);
    });

    testWidgets('updates option text when changed', (tester) async {
      var capturedOptions = <String>[];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: widgets.MultipleChoiceQuestion(
              options: const ['Option 1', 'Option 2'],
              hasOther: false,
              onOptionsChanged: (options) => capturedOptions = options,
              onHasOtherChanged: (_) {},
            ),
          ),
        ),
      );

      // Find the first option's text field and update it
      final textFields = find.byType(TextField);
      await tester.enterText(textFields.first, 'Updated Option');
      await tester.pump(
        const Duration(milliseconds: 500),
      ); // Allow debounce to complete

      // Should call onOptionsChanged with updated options
      expect(capturedOptions.length, 2);
      expect(capturedOptions, ['Updated Option', 'Option 2']);
    });

    testWidgets('toggles "other" option when checkbox is clicked',
        (tester) async {
      bool? capturedHasOther;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: widgets.MultipleChoiceQuestion(
              options: const ['Option 1', 'Option 2'],
              hasOther: false,
              onOptionsChanged: (_) {},
              onHasOtherChanged: (value) => capturedHasOther = value,
            ),
          ),
        ),
      );

      // Verify other option checkbox is present
      final checkbox = find.byType(Checkbox);
      expect(checkbox, findsOneWidget);
      expect(find.text('Allow "Other" option'), findsOneWidget);

      // Toggle the checkbox
      await tester.tap(checkbox);
      await tester.pump();

      // Should call onHasOtherChanged with true
      expect(capturedHasOther, true);
    });
  });

  group('MultipleChoiceAnswer Display UI', () {
    testWidgets('renders options correctly', (tester) async {
      String? selectedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MultipleChoiceAnswer(
              options: const ['Red', 'Green', 'Blue'],
              hasOther: true,
              value: 'Red',
              onChanged: (value) => selectedValue = value,
              onOtherTextChanged: (_) {},
            ),
          ),
        ),
      );

      // Verify all options are displayed
      expect(find.text('Red'), findsOneWidget);
      expect(find.text('Green'), findsOneWidget);
      expect(find.text('Blue'), findsOneWidget);
      expect(find.text('Other'), findsOneWidget);

      // Verify the first option is selected
      expect(
        tester
            .widget<RadioListTile<String>>(
              find.widgetWithText(RadioListTile<String>, 'Red'),
            )
            .groupValue,
        'Red',
      );

      // Select another option
      await tester.tap(find.text('Green'));
      await tester.pump();

      // Check that the onChanged callback was called with the new value
      expect(selectedValue, 'Green');
    });

    testWidgets('handles "other" option correctly', (tester) async {
      String? otherText;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MultipleChoiceAnswer(
              options: const ['Red', 'Green', 'Blue'],
              hasOther: true,
              value: 'other',
              otherText: 'Custom Color',
              onChanged: (_) {},
              onOtherTextChanged: (value) => otherText = value,
            ),
          ),
        ),
      );

      // Verify the "other" option is selected
      expect(
        tester
            .widget<RadioListTile<String>>(
              find.byType(RadioListTile<String>).last,
            )
            .groupValue,
        'other',
      );

      // Verify the text field is displayed
      expect(find.byType(DebouncedTextField), findsOneWidget);
      expect(find.text('Custom Color'), findsOneWidget);

      // Enter new text in the "other" field
      await tester.enterText(find.byType(TextField), 'Purple');
      await tester.pump(
        const Duration(milliseconds: 500),
      ); // Allow debounce to complete

      // Verify onOtherTextChanged was called with the new value
      expect(otherText, 'Purple');
    });
  });
}
