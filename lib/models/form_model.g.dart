// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FormModel _$FormModelFromJson(Map<String, dynamic> json) => _FormModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      questions: (json['questions'] as List<dynamic>?)
              ?.map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      responses: (json['responses'] as List<dynamic>?)
              ?.map((e) => ResponseModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$FormModelToJson(_FormModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'questions': instance.questions,
      'responses': instance.responses,
    };
