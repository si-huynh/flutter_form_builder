// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'responses_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResponsesEvent implements DiagnosticableTreeMixin {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'ResponsesEvent'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ResponsesEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResponsesEvent()';
  }
}

/// @nodoc
class $ResponsesEventCopyWith<$Res> {
  $ResponsesEventCopyWith(ResponsesEvent _, $Res Function(ResponsesEvent) __);
}

/// @nodoc

class LoadResponsesEvent
    with DiagnosticableTreeMixin
    implements ResponsesEvent {
  const LoadResponsesEvent(this.form);

  final FormModel form;

  /// Create a copy of ResponsesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadResponsesEventCopyWith<LoadResponsesEvent> get copyWith =>
      _$LoadResponsesEventCopyWithImpl<LoadResponsesEvent>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ResponsesEvent.loadResponses'))
      ..add(DiagnosticsProperty('form', form));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadResponsesEvent &&
            (identical(other.form, form) || other.form == form));
  }

  @override
  int get hashCode => Object.hash(runtimeType, form);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResponsesEvent.loadResponses(form: $form)';
  }
}

/// @nodoc
abstract mixin class $LoadResponsesEventCopyWith<$Res>
    implements $ResponsesEventCopyWith<$Res> {
  factory $LoadResponsesEventCopyWith(
          LoadResponsesEvent value, $Res Function(LoadResponsesEvent) _then) =
      _$LoadResponsesEventCopyWithImpl;
  @useResult
  $Res call({FormModel form});

  $FormModelCopyWith<$Res> get form;
}

/// @nodoc
class _$LoadResponsesEventCopyWithImpl<$Res>
    implements $LoadResponsesEventCopyWith<$Res> {
  _$LoadResponsesEventCopyWithImpl(this._self, this._then);

  final LoadResponsesEvent _self;
  final $Res Function(LoadResponsesEvent) _then;

  /// Create a copy of ResponsesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? form = null,
  }) {
    return _then(LoadResponsesEvent(
      null == form
          ? _self.form
          : form // ignore: cast_nullable_to_non_nullable
              as FormModel,
    ));
  }

  /// Create a copy of ResponsesEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FormModelCopyWith<$Res> get form {
    return $FormModelCopyWith<$Res>(_self.form, (value) {
      return _then(_self.copyWith(form: value));
    });
  }
}

/// @nodoc

class AddResponseEvent with DiagnosticableTreeMixin implements ResponsesEvent {
  const AddResponseEvent(this.response, this.form);

  final ResponseModel response;
  final FormModel form;

  /// Create a copy of ResponsesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddResponseEventCopyWith<AddResponseEvent> get copyWith =>
      _$AddResponseEventCopyWithImpl<AddResponseEvent>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ResponsesEvent.addResponse'))
      ..add(DiagnosticsProperty('response', response))
      ..add(DiagnosticsProperty('form', form));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddResponseEvent &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.form, form) || other.form == form));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response, form);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResponsesEvent.addResponse(response: $response, form: $form)';
  }
}

/// @nodoc
abstract mixin class $AddResponseEventCopyWith<$Res>
    implements $ResponsesEventCopyWith<$Res> {
  factory $AddResponseEventCopyWith(
          AddResponseEvent value, $Res Function(AddResponseEvent) _then) =
      _$AddResponseEventCopyWithImpl;
  @useResult
  $Res call({ResponseModel response, FormModel form});

  $ResponseModelCopyWith<$Res> get response;
  $FormModelCopyWith<$Res> get form;
}

/// @nodoc
class _$AddResponseEventCopyWithImpl<$Res>
    implements $AddResponseEventCopyWith<$Res> {
  _$AddResponseEventCopyWithImpl(this._self, this._then);

  final AddResponseEvent _self;
  final $Res Function(AddResponseEvent) _then;

  /// Create a copy of ResponsesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? response = null,
    Object? form = null,
  }) {
    return _then(AddResponseEvent(
      null == response
          ? _self.response
          : response // ignore: cast_nullable_to_non_nullable
              as ResponseModel,
      null == form
          ? _self.form
          : form // ignore: cast_nullable_to_non_nullable
              as FormModel,
    ));
  }

  /// Create a copy of ResponsesEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResponseModelCopyWith<$Res> get response {
    return $ResponseModelCopyWith<$Res>(_self.response, (value) {
      return _then(_self.copyWith(response: value));
    });
  }

  /// Create a copy of ResponsesEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FormModelCopyWith<$Res> get form {
    return $FormModelCopyWith<$Res>(_self.form, (value) {
      return _then(_self.copyWith(form: value));
    });
  }
}

/// @nodoc

class DeleteResponseEvent
    with DiagnosticableTreeMixin
    implements ResponsesEvent {
  const DeleteResponseEvent(this.responseId, this.form, this.onSuccess);

  final String responseId;
  final FormModel form;
  final void Function(FormModel) onSuccess;

  /// Create a copy of ResponsesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteResponseEventCopyWith<DeleteResponseEvent> get copyWith =>
      _$DeleteResponseEventCopyWithImpl<DeleteResponseEvent>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ResponsesEvent.deleteResponse'))
      ..add(DiagnosticsProperty('responseId', responseId))
      ..add(DiagnosticsProperty('form', form))
      ..add(DiagnosticsProperty('onSuccess', onSuccess));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteResponseEvent &&
            (identical(other.responseId, responseId) ||
                other.responseId == responseId) &&
            (identical(other.form, form) || other.form == form) &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, responseId, form, onSuccess);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResponsesEvent.deleteResponse(responseId: $responseId, form: $form, onSuccess: $onSuccess)';
  }
}

/// @nodoc
abstract mixin class $DeleteResponseEventCopyWith<$Res>
    implements $ResponsesEventCopyWith<$Res> {
  factory $DeleteResponseEventCopyWith(
          DeleteResponseEvent value, $Res Function(DeleteResponseEvent) _then) =
      _$DeleteResponseEventCopyWithImpl;
  @useResult
  $Res call(
      {String responseId, FormModel form, void Function(FormModel) onSuccess});

  $FormModelCopyWith<$Res> get form;
}

/// @nodoc
class _$DeleteResponseEventCopyWithImpl<$Res>
    implements $DeleteResponseEventCopyWith<$Res> {
  _$DeleteResponseEventCopyWithImpl(this._self, this._then);

  final DeleteResponseEvent _self;
  final $Res Function(DeleteResponseEvent) _then;

  /// Create a copy of ResponsesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? responseId = null,
    Object? form = null,
    Object? onSuccess = null,
  }) {
    return _then(DeleteResponseEvent(
      null == responseId
          ? _self.responseId
          : responseId // ignore: cast_nullable_to_non_nullable
              as String,
      null == form
          ? _self.form
          : form // ignore: cast_nullable_to_non_nullable
              as FormModel,
      null == onSuccess
          ? _self.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as void Function(FormModel),
    ));
  }

  /// Create a copy of ResponsesEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FormModelCopyWith<$Res> get form {
    return $FormModelCopyWith<$Res>(_self.form, (value) {
      return _then(_self.copyWith(form: value));
    });
  }
}

/// @nodoc

class DeleteResponsesEvent
    with DiagnosticableTreeMixin
    implements ResponsesEvent {
  const DeleteResponsesEvent(this.formId);

  final String formId;

  /// Create a copy of ResponsesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteResponsesEventCopyWith<DeleteResponsesEvent> get copyWith =>
      _$DeleteResponsesEventCopyWithImpl<DeleteResponsesEvent>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ResponsesEvent.deleteResponses'))
      ..add(DiagnosticsProperty('formId', formId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteResponsesEvent &&
            (identical(other.formId, formId) || other.formId == formId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, formId);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResponsesEvent.deleteResponses(formId: $formId)';
  }
}

/// @nodoc
abstract mixin class $DeleteResponsesEventCopyWith<$Res>
    implements $ResponsesEventCopyWith<$Res> {
  factory $DeleteResponsesEventCopyWith(DeleteResponsesEvent value,
          $Res Function(DeleteResponsesEvent) _then) =
      _$DeleteResponsesEventCopyWithImpl;
  @useResult
  $Res call({String formId});
}

/// @nodoc
class _$DeleteResponsesEventCopyWithImpl<$Res>
    implements $DeleteResponsesEventCopyWith<$Res> {
  _$DeleteResponsesEventCopyWithImpl(this._self, this._then);

  final DeleteResponsesEvent _self;
  final $Res Function(DeleteResponsesEvent) _then;

  /// Create a copy of ResponsesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? formId = null,
  }) {
    return _then(DeleteResponsesEvent(
      null == formId
          ? _self.formId
          : formId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

ResponsesState _$ResponsesStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'initial':
      return ResponsesStateInitial.fromJson(json);
    case 'loading':
      return ResponsesStateLoading.fromJson(json);
    case 'loaded':
      return ResponsesStateLoaded.fromJson(json);
    case 'error':
      return ResponsesStateError.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ResponsesState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ResponsesState implements DiagnosticableTreeMixin {
  /// Serializes this ResponsesState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'ResponsesState'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ResponsesState);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResponsesState()';
  }
}

/// @nodoc
class $ResponsesStateCopyWith<$Res> {
  $ResponsesStateCopyWith(ResponsesState _, $Res Function(ResponsesState) __);
}

/// @nodoc
@JsonSerializable()
class ResponsesStateInitial extends ResponsesState
    with DiagnosticableTreeMixin {
  const ResponsesStateInitial({final String? $type})
      : $type = $type ?? 'initial',
        super._();
  factory ResponsesStateInitial.fromJson(Map<String, dynamic> json) =>
      _$ResponsesStateInitialFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  Map<String, dynamic> toJson() {
    return _$ResponsesStateInitialToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'ResponsesState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ResponsesStateInitial);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResponsesState.initial()';
  }
}

/// @nodoc
@JsonSerializable()
class ResponsesStateLoading extends ResponsesState
    with DiagnosticableTreeMixin {
  const ResponsesStateLoading({final String? $type})
      : $type = $type ?? 'loading',
        super._();
  factory ResponsesStateLoading.fromJson(Map<String, dynamic> json) =>
      _$ResponsesStateLoadingFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  Map<String, dynamic> toJson() {
    return _$ResponsesStateLoadingToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'ResponsesState.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ResponsesStateLoading);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResponsesState.loading()';
  }
}

/// @nodoc
@JsonSerializable()
class ResponsesStateLoaded extends ResponsesState with DiagnosticableTreeMixin {
  const ResponsesStateLoaded(
      {required final Map<String, dynamic> aggregation,
      required this.form,
      final String? $type})
      : _aggregation = aggregation,
        $type = $type ?? 'loaded',
        super._();
  factory ResponsesStateLoaded.fromJson(Map<String, dynamic> json) =>
      _$ResponsesStateLoadedFromJson(json);

  final Map<String, dynamic> _aggregation;
  Map<String, dynamic> get aggregation {
    if (_aggregation is EqualUnmodifiableMapView) return _aggregation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_aggregation);
  }

  final FormModel form;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of ResponsesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResponsesStateLoadedCopyWith<ResponsesStateLoaded> get copyWith =>
      _$ResponsesStateLoadedCopyWithImpl<ResponsesStateLoaded>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ResponsesStateLoadedToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ResponsesState.loaded'))
      ..add(DiagnosticsProperty('aggregation', aggregation))
      ..add(DiagnosticsProperty('form', form));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResponsesStateLoaded &&
            const DeepCollectionEquality()
                .equals(other._aggregation, _aggregation) &&
            (identical(other.form, form) || other.form == form));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_aggregation), form);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResponsesState.loaded(aggregation: $aggregation, form: $form)';
  }
}

/// @nodoc
abstract mixin class $ResponsesStateLoadedCopyWith<$Res>
    implements $ResponsesStateCopyWith<$Res> {
  factory $ResponsesStateLoadedCopyWith(ResponsesStateLoaded value,
          $Res Function(ResponsesStateLoaded) _then) =
      _$ResponsesStateLoadedCopyWithImpl;
  @useResult
  $Res call({Map<String, dynamic> aggregation, FormModel form});

  $FormModelCopyWith<$Res> get form;
}

/// @nodoc
class _$ResponsesStateLoadedCopyWithImpl<$Res>
    implements $ResponsesStateLoadedCopyWith<$Res> {
  _$ResponsesStateLoadedCopyWithImpl(this._self, this._then);

  final ResponsesStateLoaded _self;
  final $Res Function(ResponsesStateLoaded) _then;

  /// Create a copy of ResponsesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? aggregation = null,
    Object? form = null,
  }) {
    return _then(ResponsesStateLoaded(
      aggregation: null == aggregation
          ? _self._aggregation
          : aggregation // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      form: null == form
          ? _self.form
          : form // ignore: cast_nullable_to_non_nullable
              as FormModel,
    ));
  }

  /// Create a copy of ResponsesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FormModelCopyWith<$Res> get form {
    return $FormModelCopyWith<$Res>(_self.form, (value) {
      return _then(_self.copyWith(form: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class ResponsesStateError extends ResponsesState with DiagnosticableTreeMixin {
  const ResponsesStateError(this.message, {final String? $type})
      : $type = $type ?? 'error',
        super._();
  factory ResponsesStateError.fromJson(Map<String, dynamic> json) =>
      _$ResponsesStateErrorFromJson(json);

  final String message;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of ResponsesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResponsesStateErrorCopyWith<ResponsesStateError> get copyWith =>
      _$ResponsesStateErrorCopyWithImpl<ResponsesStateError>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ResponsesStateErrorToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ResponsesState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResponsesStateError &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResponsesState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ResponsesStateErrorCopyWith<$Res>
    implements $ResponsesStateCopyWith<$Res> {
  factory $ResponsesStateErrorCopyWith(
          ResponsesStateError value, $Res Function(ResponsesStateError) _then) =
      _$ResponsesStateErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ResponsesStateErrorCopyWithImpl<$Res>
    implements $ResponsesStateErrorCopyWith<$Res> {
  _$ResponsesStateErrorCopyWithImpl(this._self, this._then);

  final ResponsesStateError _self;
  final $Res Function(ResponsesStateError) _then;

  /// Create a copy of ResponsesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(ResponsesStateError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
