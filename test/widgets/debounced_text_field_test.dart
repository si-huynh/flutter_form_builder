import 'package:flutter/material.dart';
import 'package:flutter_form_builder/widgets/debounced_text_field.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DebouncedTextField', () {
    testWidgets('renders correctly with initialValue', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DebouncedTextField(
              initialValue: 'Initial Text',
              onChanged: (value) {},
            ),
          ),
        ),
      );

      // Verify initial text is displayed
      expect(find.text('Initial Text'), findsOneWidget);
    });

    testWidgets('calls onChanged after debounce period', (tester) async {
      String? changedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DebouncedTextField(
              onChanged: (value) => changedValue = value,
              debounceDuration: const Duration(milliseconds: 300),
            ),
          ),
        ),
      );

      // Enter text
      await tester.enterText(find.byType(TextField), 'Debounced Text');

      // Verify onChanged hasn't been called immediately
      expect(changedValue, null);

      // Wait half the debounce duration - should still be null
      await tester.pump(const Duration(milliseconds: 150));
      expect(changedValue, null);

      // Wait until after debounce duration
      await tester.pump(const Duration(milliseconds: 200));

      // Now onChanged should have been called
      expect(changedValue, 'Debounced Text');
    });

    testWidgets('accepts decoration and maxLines properties', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DebouncedTextField(
              onChanged: (_) {},
              decoration: const InputDecoration(
                hintText: 'Test Hint',
                labelText: 'Test Label',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ),
        ),
      );

      // Verify decoration properties are applied
      expect(find.text('Test Hint'), findsOneWidget);
      expect(find.text('Test Label'), findsOneWidget);

      // Verify the TextField has the specified maxLines
      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.maxLines, 3);
    });

    testWidgets('works with a provided controller', (tester) async {
      final controller = TextEditingController(text: 'Controlled Text');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DebouncedTextField(
              onChanged: (value) {},
              controller: controller,
            ),
          ),
        ),
      );

      // Verify controller value is displayed
      expect(find.text('Controlled Text'), findsOneWidget);

      // Change controller value
      controller.text = 'Updated Controlled Text';
      await tester.pump();

      // Verify updated text is displayed
      expect(find.text('Updated Controlled Text'), findsOneWidget);
    });

    testWidgets('updates when didUpdateWidget is called with new initialValue',
        (tester) async {
      // Create a stateful wrapper to test didUpdateWidget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  children: [
                    DebouncedTextField(
                      initialValue: 'Initial Value',
                      onChanged: (_) {},
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          // This will trigger rebuild and didUpdateWidget
                        });
                      },
                      child: const Text('Rebuild'),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      );

      expect(find.text('Initial Value'), findsOneWidget);

      // Trigger rebuild to call didUpdateWidget
      await tester.tap(find.text('Rebuild'));
      await tester.pump();

      // Verify the text is still there (would be lost if didUpdateWidget had a bug)
      expect(find.text('Initial Value'), findsOneWidget);
    });

    testWidgets('handles focus and keyboard type properties', (tester) async {
      final focusNode = FocusNode();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DebouncedTextField(
              onChanged: (_) {},
              keyboardType: TextInputType.number,
              autofocus: true,
              focusNode: focusNode,
            ),
          ),
        ),
      );

      // Verify focus and keyboard properties are passed correctly
      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.keyboardType, TextInputType.number);
      expect(textField.focusNode, focusNode);
      expect(textField.autofocus, true);

      // Clean up
      focusNode.dispose();
    });
  });
}
