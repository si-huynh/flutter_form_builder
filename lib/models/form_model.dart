import 'package:freezed_annotation/freezed_annotation.dart';
import 'question_model.dart';

part 'form_model.freezed.dart';
part 'form_model.g.dart';

@freezed
sealed class FormModel with _$FormModel {
  const factory FormModel({
    required String id,
    required String title,
    @Default('') String description,
    @Default([]) List<QuestionModel> questions,
  }) = _FormModel;

  factory FormModel.fromJson(Map<String, dynamic> json) =>
      _$FormModelFromJson(json);
}
