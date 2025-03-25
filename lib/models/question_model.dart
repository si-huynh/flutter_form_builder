import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_model.freezed.dart';
part 'question_model.g.dart';

@freezed
sealed class QuestionModel with _$QuestionModel {
  const factory QuestionModel.shortAnswer({
    required String id,
    required String text,
    @Default(false) bool required,
  }) = ShortAnswerQuestion;

  const factory QuestionModel.longAnswer({
    required String id,
    required String text,
    @Default(false) bool required,
  }) = LongAnswerQuestion;

  const factory QuestionModel.multipleChoice({
    required String id,
    required String text,
    @Default(false) bool required,
    @Default([]) List<String> options,
    @Default(false) bool other,
  }) = MultipleChoiceQuestion;

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);
}

@freezed
sealed class QuestionType with _$QuestionType {
  const factory QuestionType.multipleChoice() = MultipleChoice;
  const factory QuestionType.paragraph() = Paragraph;

  factory QuestionType.fromJson(Map<String, dynamic> json) =>
      _$QuestionTypeFromJson(json);
}
