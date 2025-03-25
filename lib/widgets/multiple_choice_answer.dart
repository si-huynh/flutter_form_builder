import 'package:flutter/material.dart';
import 'debounced_text_field.dart';

class MultipleChoiceAnswer extends StatelessWidget {
  final List<String> options;
  final bool hasOther;
  final String? value;
  final String? otherText;
  final ValueChanged<String?> onChanged;
  final ValueChanged<String> onOtherTextChanged;

  const MultipleChoiceAnswer({
    required this.options,
    required this.hasOther,
    required this.value,
    required this.onChanged,
    required this.onOtherTextChanged,
    this.otherText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...options.map(
          (option) => RadioListTile<String>(
            title: Text(option),
            value: option,
            groupValue: value,
            onChanged: onChanged,
          ),
        ),
        if (hasOther) ...[
          RadioListTile<String>(
            title: value == 'other'
                ? DebouncedTextField(
                    initialValue: otherText ?? '',
                    decoration: const InputDecoration(
                      hintText: 'Enter other option',
                      isDense: true,
                    ),
                    onChanged: onOtherTextChanged,
                  )
                : const Text('Other'),
            value: 'other',
            groupValue: value,
            onChanged: onChanged,
          ),
        ],
      ],
    );
  }
}
