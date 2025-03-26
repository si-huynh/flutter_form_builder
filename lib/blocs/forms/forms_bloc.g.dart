// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forms_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormsStateInitial _$FormsStateInitialFromJson(Map<String, dynamic> json) =>
    FormsStateInitial(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$FormsStateInitialToJson(FormsStateInitial instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

FormsStateLoading _$FormsStateLoadingFromJson(Map<String, dynamic> json) =>
    FormsStateLoading(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$FormsStateLoadingToJson(FormsStateLoading instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

FormsStateLoaded _$FormsStateLoadedFromJson(Map<String, dynamic> json) =>
    FormsStateLoaded(
      forms: (json['forms'] as List<dynamic>)
          .map((e) => FormModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$FormsStateLoadedToJson(FormsStateLoaded instance) =>
    <String, dynamic>{
      'forms': instance.forms,
      'runtimeType': instance.$type,
    };

FormsStateError _$FormsStateErrorFromJson(Map<String, dynamic> json) =>
    FormsStateError(
      json['message'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$FormsStateErrorToJson(FormsStateError instance) =>
    <String, dynamic>{
      'message': instance.message,
      'runtimeType': instance.$type,
    };
