import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../models/question_model.dart';
import 'debounced_text_field.dart';
import 'multiple_choice_answer.dart';

class PreviewQuestionCard extends StatelessWidget {

  const PreviewQuestionCard({
    required this.question,
    required this.currentAnswer,
    required this.error,
    required this.onAnswerChanged,
    super.key,
  });
  final QuestionModel question;
  final dynamic currentAnswer;
  final String? error;
  final ValueChanged<dynamic> onAnswerChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    question.text,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                if (question.required)
                  const Text(
                    '*',
                    style: TextStyle(color: Colors.red),
                  ),
              ],
            ),
            const Gap(16),
            _buildQuestionContent(),
            if (error != null) ...[
              const Gap(8),
              Text(
                error!,
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionContent() {
    return switch (question) {
      MultipleChoiceQuestion(:final options, :final other) =>
        MultipleChoiceAnswer(
          options: options,
          hasOther: other,
          value: currentAnswer is Map ? currentAnswer['value'] : null,
          otherText: currentAnswer is Map ? currentAnswer['otherText'] : null,
          onChanged: (value) {
            if (value == null) {
              onAnswerChanged(null);
            } else {
              final answer = currentAnswer is Map
                  ? Map<String, String?>.from(currentAnswer)
                  : <String, String?>{};
              answer['value'] = value;
              onAnswerChanged(answer);
            }
          },
          onOtherTextChanged: (text) {
            final answer = currentAnswer is Map
                ? Map<String, String?>.from(currentAnswer)
                : <String, String?>{};
            answer['value'] = 'other';
            answer['otherText'] = text;
            onAnswerChanged(answer);
          },
        ),
      LongAnswerQuestion() => DebouncedTextField(
          initialValue: currentAnswer?.toString() ?? '',
          onChanged: onAnswerChanged,
          maxLines: 3,
          decoration: const InputDecoration(
            hintText: 'Enter your answer',
            border: OutlineInputBorder(),
          ),
        ),
      ShortAnswerQuestion() => DebouncedTextField(
          initialValue: currentAnswer?.toString() ?? '',
          onChanged: onAnswerChanged,
          decoration: const InputDecoration(
            hintText: 'Enter your answer',
            border: OutlineInputBorder(),
          ),
        ),
    };
  }
}
