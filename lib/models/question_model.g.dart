// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShortAnswerQuestion _$ShortAnswerQuestionFromJson(Map<String, dynamic> json) =>
    ShortAnswerQuestion(
      id: json['id'] as String,
      text: json['text'] as String,
      required: json['required'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ShortAnswerQuestionToJson(
        ShortAnswerQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'required': instance.required,
      'runtimeType': instance.$type,
    };

LongAnswerQuestion _$LongAnswerQuestionFromJson(Map<String, dynamic> json) =>
    LongAnswerQuestion(
      id: json['id'] as String,
      text: json['text'] as String,
      required: json['required'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$LongAnswerQuestionToJson(LongAnswerQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'required': instance.required,
      'runtimeType': instance.$type,
    };

MultipleChoiceQuestion _$MultipleChoiceQuestionFromJson(
        Map<String, dynamic> json) =>
    MultipleChoiceQuestion(
      id: json['id'] as String,
      text: json['text'] as String,
      required: json['required'] as bool? ?? false,
      options: (json['options'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      other: json['other'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$MultipleChoiceQuestionToJson(
        MultipleChoiceQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'required': instance.required,
      'options': instance.options,
      'other': instance.other,
      'runtimeType': instance.$type,
    };

MultipleChoice _$MultipleChoiceFromJson(Map<String, dynamic> json) =>
    MultipleChoice(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$MultipleChoiceToJson(MultipleChoice instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

Paragraph _$ParagraphFromJson(Map<String, dynamic> json) => Paragraph(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ParagraphToJson(Paragraph instance) => <String, dynamic>{
      'runtimeType': instance.$type,
    };
