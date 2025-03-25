import 'package:flutter/material.dart';
import 'debounced_text_field.dart';

class ParagraphQuestion extends StatelessWidget {
  const ParagraphQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return DebouncedTextField(
      maxLines: 3,
      decoration: const InputDecoration(
        hintText: 'Enter your answer here...',
        border: OutlineInputBorder(),
      ),
      onChanged: (_) {},
    );
  }
}
