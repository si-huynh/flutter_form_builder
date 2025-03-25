import 'package:flutter/material.dart';
import 'debounced_text_field.dart';

class ParagraphAnswer extends StatelessWidget {
  final String? value;
  final ValueChanged<String> onChanged;

  const ParagraphAnswer({
    required this.value,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DebouncedTextField(
      initialValue: value ?? '',
      maxLines: 3,
      decoration: const InputDecoration(
        hintText: 'Enter your answer here...',
        border: OutlineInputBorder(),
      ),
      onChanged: onChanged,
    );
  }
}
