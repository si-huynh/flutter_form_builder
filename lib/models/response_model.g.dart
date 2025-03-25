// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResponseModel _$ResponseModelFromJson(Map<String, dynamic> json) =>
    _ResponseModel(
      id: json['id'] as String,
      formId: json['formId'] as String,
      answers: json['answers'] as Map<String, dynamic>,
      submittedAt: DateTime.parse(json['submittedAt'] as String),
    );

Map<String, dynamic> _$ResponseModelToJson(_ResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'formId': instance.formId,
      'answers': instance.answers,
      'submittedAt': instance.submittedAt.toIso8601String(),
    };
