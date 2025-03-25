import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'debounced_text_field.dart';

class MultipleChoiceQuestion extends StatelessWidget {

  const MultipleChoiceQuestion({
    required this.options,
    required this.hasOther,
    required this.onOptionsChanged,
    required this.onHasOtherChanged,
    super.key,
  });
  final List<String> options;
  final bool hasOther;
  final ValueChanged<List<String>> onOptionsChanged;
  final ValueChanged<bool> onHasOtherChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildOptionsList(),
        const Gap(8),
        if (options.length < 5) _buildAddOptionButton(),
        const Gap(8),
        _buildOtherOptionToggle(),
      ],
    );
  }

  Widget _buildOptionsList() {
    return Column(
      children: [
        for (var i = 0; i < options.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Radio(
                  value: i,
                  groupValue: -1,
                  onChanged: null,
                ),
                Expanded(
                  child: DebouncedTextField(
                    initialValue: options[i],
                    decoration: const InputDecoration(
                      hintText: 'Option text',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      final newOptions = List<String>.from(options);
                      newOptions[i] = value;
                      onOptionsChanged(newOptions);
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    final newOptions = List<String>.from(options);
                    newOptions.removeAt(i);
                    onOptionsChanged(newOptions);
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildAddOptionButton() {
    return TextButton.icon(
      onPressed: () {
        onOptionsChanged([...options, '']);
      },
      icon: const Icon(Icons.add),
      label: const Text('Add Option'),
    );
  }

  Widget _buildOtherOptionToggle() {
    return Row(
      children: [
        Checkbox(
          value: hasOther,
          onChanged: (value) => onHasOtherChanged(value ?? false),
        ),
        const Text('Allow "Other" option'),
      ],
    );
  }
}
