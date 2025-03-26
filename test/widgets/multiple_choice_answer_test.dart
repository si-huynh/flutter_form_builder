import 'package:flutter/material.dart';
import 'package:flutter_form_builder/widgets/multiple_choice_answer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MultipleChoiceAnswer', () {
    const options = ['Option 1', 'Option 2', 'Option 3'];

    testWidgets('renders options correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MultipleChoiceAnswer(
              options: options,
              hasOther: false,
              value: null,
              onChanged: (_) {},
              onOtherTextChanged: (_) {},
            ),
          ),
        ),
      );

      // Check all options are displayed
      for (final option in options) {
        expect(find.text(option), findsOneWidget);
      }

      // Should not find the 'Other' option
      expect(find.text('Other'), findsNothing);
    });

    testWidgets('selects option when tapped', (tester) async {
      String? selectedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MultipleChoiceAnswer(
              options: options,
              hasOther: false,
              value: null,
              onChanged: (value) {
                selectedValue = value;
              },
              onOtherTextChanged: (_) {},
            ),
          ),
        ),
      );

      // Tap on an option
      await tester.tap(find.text('Option 2'));
      await tester.pump();

      // Verify callback was called with correct values
      expect(selectedValue, 'Option 2');
    });

    testWidgets('renders selected option correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MultipleChoiceAnswer(
              options: options,
              hasOther: false,
              value: 'Option 2',
              onChanged: (_) {},
              onOtherTextChanged: (_) {},
            ),
          ),
        ),
      );

      // Find the selected radio button
      final radioButtons =
          tester.widgetList<Radio<String>>(find.byType(Radio<String>));

      // Verify that 'Option 2' is selected
      var selectedIndex = -1;
      for (var i = 0; i < radioButtons.length; i++) {
        if (radioButtons.elementAt(i).groupValue ==
            radioButtons.elementAt(i).value) {
          selectedIndex = i;
          break;
        }
      }

      // The second option (index 1) should be selected
      expect(selectedIndex, 1);
    });

    testWidgets('renders "Other" option when hasOther is true', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MultipleChoiceAnswer(
              options: options,
              hasOther: true,
              value: null,
              onChanged: (_) {},
              onOtherTextChanged: (_) {},
            ),
          ),
        ),
      );

      // Check 'Other' option is displayed
      expect(find.text('Other'), findsOneWidget);

      // TextField should not be visible yet
      expect(find.byType(TextField), findsNothing);
    });

    testWidgets('shows text field when "Other" option is selected',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MultipleChoiceAnswer(
              options: options,
              hasOther: true,
              value: 'other',
              onChanged: (_) {},
              onOtherTextChanged: (_) {},
            ),
          ),
        ),
      );

      // TextField should be visible
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('calls onOtherTextChanged when text is entered',
        (tester) async {
      String? changedText;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MultipleChoiceAnswer(
              options: options,
              hasOther: true,
              value: 'other',
              onChanged: (_) {},
              onOtherTextChanged: (text) {
                changedText = text;
              },
            ),
          ),
        ),
      );

      // Enter text in the field
      await tester.enterText(find.byType(TextField), 'Custom option');

      // Wait for debounce timer to complete
      await tester.pump(const Duration(milliseconds: 500));

      // Verify callback was called with correct values
      expect(changedText, 'Custom option');
    });

    testWidgets('shows pre-filled other text', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MultipleChoiceAnswer(
              options: options,
              hasOther: true,
              value: 'other',
              otherText: 'Existing text',
              onChanged: (_) {},
              onOtherTextChanged: (_) {},
            ),
          ),
        ),
      );

      // Check the text field has the pre-filled text
      expect(find.text('Existing text'), findsOneWidget);
    });
  });
}
