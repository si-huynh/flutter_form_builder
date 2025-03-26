import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_model.freezed.dart';
part 'response_model.g.dart';

@freezed
sealed class ResponseModel with _$ResponseModel {
  const factory ResponseModel({
    required String id,
    required Map<String, dynamic> answers,
    required DateTime submittedAt,
  }) = _ResponseModel;

  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);
}
