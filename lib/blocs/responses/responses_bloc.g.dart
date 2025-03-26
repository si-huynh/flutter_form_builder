// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponsesStateInitial _$ResponsesStateInitialFromJson(
        Map<String, dynamic> json) =>
    ResponsesStateInitial(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ResponsesStateInitialToJson(
        ResponsesStateInitial instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

ResponsesStateLoading _$ResponsesStateLoadingFromJson(
        Map<String, dynamic> json) =>
    ResponsesStateLoading(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ResponsesStateLoadingToJson(
        ResponsesStateLoading instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

ResponsesStateLoaded _$ResponsesStateLoadedFromJson(
        Map<String, dynamic> json) =>
    ResponsesStateLoaded(
      aggregation: json['aggregation'] as Map<String, dynamic>,
      form: FormModel.fromJson(json['form'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ResponsesStateLoadedToJson(
        ResponsesStateLoaded instance) =>
    <String, dynamic>{
      'aggregation': instance.aggregation,
      'form': instance.form,
      'runtimeType': instance.$type,
    };

ResponsesStateError _$ResponsesStateErrorFromJson(Map<String, dynamic> json) =>
    ResponsesStateError(
      json['message'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ResponsesStateErrorToJson(
        ResponsesStateError instance) =>
    <String, dynamic>{
      'message': instance.message,
      'runtimeType': instance.$type,
    };
