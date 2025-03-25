// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_editor_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormEditorStateInitial _$FormEditorStateInitialFromJson(
        Map<String, dynamic> json) =>
    FormEditorStateInitial(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$FormEditorStateInitialToJson(
        FormEditorStateInitial instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

FormEditorStateLoading _$FormEditorStateLoadingFromJson(
        Map<String, dynamic> json) =>
    FormEditorStateLoading(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$FormEditorStateLoadingToJson(
        FormEditorStateLoading instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

FormEditorStateLoaded _$FormEditorStateLoadedFromJson(
        Map<String, dynamic> json) =>
    FormEditorStateLoaded(
      FormModel.fromJson(json['form'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$FormEditorStateLoadedToJson(
        FormEditorStateLoaded instance) =>
    <String, dynamic>{
      'form': instance.form,
      'runtimeType': instance.$type,
    };

FormEditorStateError _$FormEditorStateErrorFromJson(
        Map<String, dynamic> json) =>
    FormEditorStateError(
      json['message'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$FormEditorStateErrorToJson(
        FormEditorStateError instance) =>
    <String, dynamic>{
      'message': instance.message,
      'runtimeType': instance.$type,
    };
