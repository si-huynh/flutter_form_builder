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
      final answer = response.answers[questionId] as String?;
      if (answer != null) {
        if (options.contains(answer)) {
          counts[answer] = (counts[answer] ?? 0) + 1;
        } else {
          counts['other'] = (counts['other'] ?? 0) + 1;
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
        .map((r) => r.answers[questionId] as String?)
        .where((answer) => answer != null && answer.isNotEmpty)
        .cast<String>()
        .toList();
  }
}
