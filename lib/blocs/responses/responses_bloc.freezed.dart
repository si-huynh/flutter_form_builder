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
mixin _$ResponsesEvent {
  FormModel get form;

  /// Create a copy of ResponsesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResponsesEventCopyWith<ResponsesEvent> get copyWith =>
      _$ResponsesEventCopyWithImpl<ResponsesEvent>(
          this as ResponsesEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResponsesEvent &&
            (identical(other.form, form) || other.form == form));
  }

  @override
  int get hashCode => Object.hash(runtimeType, form);

  @override
  String toString() {
    return 'ResponsesEvent(form: $form)';
  }
}

/// @nodoc
abstract mixin class $ResponsesEventCopyWith<$Res> {
  factory $ResponsesEventCopyWith(
          ResponsesEvent value, $Res Function(ResponsesEvent) _then) =
      _$ResponsesEventCopyWithImpl;
  @useResult
  $Res call({FormModel form});

  $FormModelCopyWith<$Res> get form;
}

/// @nodoc
class _$ResponsesEventCopyWithImpl<$Res>
    implements $ResponsesEventCopyWith<$Res> {
  _$ResponsesEventCopyWithImpl(this._self, this._then);

  final ResponsesEvent _self;
  final $Res Function(ResponsesEvent) _then;

  /// Create a copy of ResponsesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
  }) {
    return _then(_self.copyWith(
      form: null == form
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

class LoadResponsesEvent implements ResponsesEvent {
  const LoadResponsesEvent(this.form);

  @override
  final FormModel form;

  /// Create a copy of ResponsesEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadResponsesEventCopyWith<LoadResponsesEvent> get copyWith =>
      _$LoadResponsesEventCopyWithImpl<LoadResponsesEvent>(this, _$identity);

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
  String toString() {
    return 'ResponsesEvent.loadResponses(form: $form)';
  }
}

/// @nodoc
abstract mixin class $LoadResponsesEventCopyWith<$Res>
    implements $ResponsesEventCopyWith<$Res> {
  factory $LoadResponsesEventCopyWith(
          LoadResponsesEvent value, $Res Function(LoadResponsesEvent) _then) =
      _$LoadResponsesEventCopyWithImpl;
  @override
  @useResult
  $Res call({FormModel form});

  @override
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
  @override
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

class AddResponseEvent implements ResponsesEvent {
  const AddResponseEvent(this.response, this.form);

  final ResponseModel response;
  @override
  final FormModel form;

  /// Create a copy of ResponsesEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddResponseEventCopyWith<AddResponseEvent> get copyWith =>
      _$AddResponseEventCopyWithImpl<AddResponseEvent>(this, _$identity);

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
  String toString() {
    return 'ResponsesEvent.addResponse(response: $response, form: $form)';
  }
}

/// @nodoc
abstract mixin class $AddResponseEventCopyWith<$Res>
    implements $ResponsesEventCopyWith<$Res> {
  factory $AddResponseEventCopyWith(
          AddResponseEvent value, $Res Function(AddResponseEvent) _then) =
      _$AddResponseEventCopyWithImpl;
  @override
  @useResult
  $Res call({ResponseModel response, FormModel form});

  $ResponseModelCopyWith<$Res> get response;
  @override
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
  @override
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

class DeleteResponseEvent implements ResponsesEvent {
  const DeleteResponseEvent(this.responseId, this.form);

  final String responseId;
  @override
  final FormModel form;

  /// Create a copy of ResponsesEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteResponseEventCopyWith<DeleteResponseEvent> get copyWith =>
      _$DeleteResponseEventCopyWithImpl<DeleteResponseEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteResponseEvent &&
            (identical(other.responseId, responseId) ||
                other.responseId == responseId) &&
            (identical(other.form, form) || other.form == form));
  }

  @override
  int get hashCode => Object.hash(runtimeType, responseId, form);

  @override
  String toString() {
    return 'ResponsesEvent.deleteResponse(responseId: $responseId, form: $form)';
  }
}

/// @nodoc
abstract mixin class $DeleteResponseEventCopyWith<$Res>
    implements $ResponsesEventCopyWith<$Res> {
  factory $DeleteResponseEventCopyWith(
          DeleteResponseEvent value, $Res Function(DeleteResponseEvent) _then) =
      _$DeleteResponseEventCopyWithImpl;
  @override
  @useResult
  $Res call({String responseId, FormModel form});

  @override
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
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? responseId = null,
    Object? form = null,
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
mixin _$ResponsesState {
  /// Serializes this ResponsesState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ResponsesState);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ResponsesState()';
  }
}

/// @nodoc
class $ResponsesStateCopyWith<$Res> {
  $ResponsesStateCopyWith(ResponsesState _, $Res Function(ResponsesState) __);
}

/// @nodoc
@JsonSerializable()
class ResponsesStateInitial extends ResponsesState {
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ResponsesStateInitial);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ResponsesState.initial()';
  }
}

/// @nodoc
@JsonSerializable()
class ResponsesStateLoading extends ResponsesState {
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ResponsesStateLoading);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ResponsesState.loading()';
  }
}

/// @nodoc
@JsonSerializable()
class ResponsesStateLoaded extends ResponsesState {
  const ResponsesStateLoaded(
      {required final List<ResponseModel> responses,
      required final Map<String, dynamic> aggregation,
      final String? $type})
      : _responses = responses,
        _aggregation = aggregation,
        $type = $type ?? 'loaded',
        super._();
  factory ResponsesStateLoaded.fromJson(Map<String, dynamic> json) =>
      _$ResponsesStateLoadedFromJson(json);

  final List<ResponseModel> _responses;
  List<ResponseModel> get responses {
    if (_responses is EqualUnmodifiableListView) return _responses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_responses);
  }

  final Map<String, dynamic> _aggregation;
  Map<String, dynamic> get aggregation {
    if (_aggregation is EqualUnmodifiableMapView) return _aggregation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_aggregation);
  }

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResponsesStateLoaded &&
            const DeepCollectionEquality()
                .equals(other._responses, _responses) &&
            const DeepCollectionEquality()
                .equals(other._aggregation, _aggregation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_responses),
      const DeepCollectionEquality().hash(_aggregation));

  @override
  String toString() {
    return 'ResponsesState.loaded(responses: $responses, aggregation: $aggregation)';
  }
}

/// @nodoc
abstract mixin class $ResponsesStateLoadedCopyWith<$Res>
    implements $ResponsesStateCopyWith<$Res> {
  factory $ResponsesStateLoadedCopyWith(ResponsesStateLoaded value,
          $Res Function(ResponsesStateLoaded) _then) =
      _$ResponsesStateLoadedCopyWithImpl;
  @useResult
  $Res call({List<ResponseModel> responses, Map<String, dynamic> aggregation});
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
    Object? responses = null,
    Object? aggregation = null,
  }) {
    return _then(ResponsesStateLoaded(
      responses: null == responses
          ? _self._responses
          : responses // ignore: cast_nullable_to_non_nullable
              as List<ResponseModel>,
      aggregation: null == aggregation
          ? _self._aggregation
          : aggregation // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class ResponsesStateError extends ResponsesState {
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
  String toString() {
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
