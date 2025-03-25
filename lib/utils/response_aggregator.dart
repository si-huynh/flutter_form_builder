import '../models/form_model.dart';
import '../models/question_model.dart';
import '../models/response_model.dart';

class ResponseAggregator {
  static Map<String, dynamic> aggregateResponses(
    List<ResponseModel> responses,
    FormModel form,
  ) {
    final aggregation = <String, dynamic>{};

    for (final question in form.questions) {
      aggregation[question.id] = switch (question) {
        MultipleChoiceQuestion(:final options) => _aggregateMultipleChoice(
            responses,
            question.id,
            options,
          ),
        _ => _aggregateParagraph(
            responses,
            question.id,
          ),
      };
    }

    return aggregation;
  }

  static Map<String, int> _aggregateMultipleChoice(
    List<ResponseModel> responses,
    String questionId,
    List<String> options,
  ) {
    final counts = <String, int>{};
    for (final option in options) {
      counts[option] = 0;
    }
    counts['other'] = 0;

    for (final response in responses) {
      final answer = response.answers[questionId];

      // Handle different types of answers
      if (answer is String && options.contains(answer)) {
        counts[answer] = (counts[answer] ?? 0) + 1;
      }
      // Handle the "other" option, which can be just 'other' or a Map with value and otherText
      else if (answer is String && answer == 'other') {
        counts['other'] = (counts['other'] ?? 0) + 1;
      }
      // Handle the case where answer is a Map for "Other" with text
      else if (answer is Map) {
        final value = answer['value'] as String?;
        if (value == 'other') {
          counts['other'] = (counts['other'] ?? 0) + 1;
        } else if (value != null && options.contains(value)) {
          counts[value] = (counts[value] ?? 0) + 1;
        }
      }
    }

    return counts;
  }

  static List<String> _aggregateParagraph(
    List<ResponseModel> responses,
    String questionId,
  ) {
    return responses
        .map((r) {
          final answer = r.answers[questionId];
          if (answer is String) {
            return answer;
          } else if (answer is Map && answer['value'] != null) {
            // Handle case where answer might be a Map (shouldn't normally happen for paragraphs)
            return answer['value'] as String;
          }
          return null;
        })
        .where((answer) => answer != null && answer.isNotEmpty)
        .cast<String>()
        .toList();
  }
}
