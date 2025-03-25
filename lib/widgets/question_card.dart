import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../models/question_model.dart';
import 'debounced_text_field.dart';
import 'multiple_choice_question.dart' as mcq;

class QuestionCard extends StatelessWidget {

  const QuestionCard({
    required this.question,
    required this.onDelete,
    required this.onTextChanged,
    required this.onRequiredChanged,
    required this.onOptionsChanged,
    required this.onOtherOptionChanged,
    super.key,
  });
  final QuestionModel question;
  final VoidCallback onDelete;
  final ValueChanged<String> onTextChanged;
  final ValueChanged<bool> onRequiredChanged;
  final ValueChanged<List<String>> onOptionsChanged;
  final ValueChanged<bool> onOtherOptionChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildQuestionHeader(),
            const Gap(16),
            _buildQuestionContent(),
            const Gap(16),
            _buildQuestionFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionHeader() {
    return Row(
      children: [
        Expanded(
          child: DebouncedTextField(
            initialValue: question.text,
            decoration: const InputDecoration(
              hintText: 'Question text',
              border: OutlineInputBorder(),
            ),
            onChanged: onTextChanged,
          ),
        ),
        IconButton(
          onPressed: onDelete,
          icon: const Icon(Icons.delete),
        ),
      ],
    );
  }

  Widget _buildQuestionContent() {
    return switch (question) {
      MultipleChoiceQuestion(:final options, :final other) =>
        mcq.MultipleChoiceQuestion(
          options: options,
          hasOther: other,
          onOptionsChanged: onOptionsChanged,
          onHasOtherChanged: onOtherOptionChanged,
        ),
      LongAnswerQuestion() => const TextField(
          enabled: false,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: 'Long answer text',
            border: OutlineInputBorder(),
          ),
        ),
      ShortAnswerQuestion() => const TextField(
          enabled: false,
          decoration: InputDecoration(
            hintText: 'Short answer text',
            border: OutlineInputBorder(),
          ),
        ),
    };
  }

  Widget _buildQuestionFooter() {
    return Row(
      children: [
        Row(
          children: [
            Checkbox(
              value: question.required,
              onChanged: (value) => onRequiredChanged(value ?? false),
            ),
            const Text('Required'),
          ],
        ),
      ],
    );
  }
}
