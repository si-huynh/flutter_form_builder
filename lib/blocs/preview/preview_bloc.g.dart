// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preview_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PreviewStateInitial _$PreviewStateInitialFromJson(Map<String, dynamic> json) =>
    PreviewStateInitial(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$PreviewStateInitialToJson(
        PreviewStateInitial instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

PreviewStateLoading _$PreviewStateLoadingFromJson(Map<String, dynamic> json) =>
    PreviewStateLoading(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$PreviewStateLoadingToJson(
        PreviewStateLoading instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

PreviewStateLoaded _$PreviewStateLoadedFromJson(Map<String, dynamic> json) =>
    PreviewStateLoaded(
      form: FormModel.fromJson(json['form'] as Map<String, dynamic>),
      answers: json['answers'] as Map<String, dynamic>,
      errors: Map<String, String?>.from(json['errors'] as Map),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$PreviewStateLoadedToJson(PreviewStateLoaded instance) =>
    <String, dynamic>{
      'form': instance.form,
      'answers': instance.answers,
      'errors': instance.errors,
      'runtimeType': instance.$type,
    };

PreviewStateError _$PreviewStateErrorFromJson(Map<String, dynamic> json) =>
    PreviewStateError(
      json['message'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$PreviewStateErrorToJson(PreviewStateError instance) =>
    <String, dynamic>{
      'message': instance.message,
      'runtimeType': instance.$type,
    };
