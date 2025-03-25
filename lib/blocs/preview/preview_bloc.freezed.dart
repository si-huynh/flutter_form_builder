// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preview_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PreviewEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PreviewEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PreviewEvent()';
  }
}

/// @nodoc
class $PreviewEventCopyWith<$Res> {
  $PreviewEventCopyWith(PreviewEvent _, $Res Function(PreviewEvent) __);
}

/// @nodoc

class LoadFormEvent implements PreviewEvent {
  const LoadFormEvent(this.form);

  final FormModel form;

  /// Create a copy of PreviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadFormEventCopyWith<LoadFormEvent> get copyWith =>
      _$LoadFormEventCopyWithImpl<LoadFormEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadFormEvent &&
            (identical(other.form, form) || other.form == form));
  }

  @override
  int get hashCode => Object.hash(runtimeType, form);

  @override
  String toString() {
    return 'PreviewEvent.loadForm(form: $form)';
  }
}

/// @nodoc
abstract mixin class $LoadFormEventCopyWith<$Res>
    implements $PreviewEventCopyWith<$Res> {
  factory $LoadFormEventCopyWith(
          LoadFormEvent value, $Res Function(LoadFormEvent) _then) =
      _$LoadFormEventCopyWithImpl;
  @useResult
  $Res call({FormModel form});

  $FormModelCopyWith<$Res> get form;
}

/// @nodoc
class _$LoadFormEventCopyWithImpl<$Res>
    implements $LoadFormEventCopyWith<$Res> {
  _$LoadFormEventCopyWithImpl(this._self, this._then);

  final LoadFormEvent _self;
  final $Res Function(LoadFormEvent) _then;

  /// Create a copy of PreviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? form = null,
  }) {
    return _then(LoadFormEvent(
      null == form
          ? _self.form
          : form // ignore: cast_nullable_to_non_nullable
              as FormModel,
    ));
  }

  /// Create a copy of PreviewEvent
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

class UpdateAnswerEvent implements PreviewEvent {
  const UpdateAnswerEvent(this.questionId, this.answer);

  final String questionId;
  final dynamic answer;

  /// Create a copy of PreviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateAnswerEventCopyWith<UpdateAnswerEvent> get copyWith =>
      _$UpdateAnswerEventCopyWithImpl<UpdateAnswerEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateAnswerEvent &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            const DeepCollectionEquality().equals(other.answer, answer));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, questionId, const DeepCollectionEquality().hash(answer));

  @override
  String toString() {
    return 'PreviewEvent.updateAnswer(questionId: $questionId, answer: $answer)';
  }
}

/// @nodoc
abstract mixin class $UpdateAnswerEventCopyWith<$Res>
    implements $PreviewEventCopyWith<$Res> {
  factory $UpdateAnswerEventCopyWith(
          UpdateAnswerEvent value, $Res Function(UpdateAnswerEvent) _then) =
      _$UpdateAnswerEventCopyWithImpl;
  @useResult
  $Res call({String questionId, dynamic answer});
}

/// @nodoc
class _$UpdateAnswerEventCopyWithImpl<$Res>
    implements $UpdateAnswerEventCopyWith<$Res> {
  _$UpdateAnswerEventCopyWithImpl(this._self, this._then);

  final UpdateAnswerEvent _self;
  final $Res Function(UpdateAnswerEvent) _then;

  /// Create a copy of PreviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? questionId = null,
    Object? answer = freezed,
  }) {
    return _then(UpdateAnswerEvent(
      null == questionId
          ? _self.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == answer
          ? _self.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class ValidateFormEvent implements PreviewEvent {
  const ValidateFormEvent();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ValidateFormEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PreviewEvent.validateForm()';
  }
}

/// @nodoc

class SubmitFormEvent implements PreviewEvent {
  const SubmitFormEvent({required this.onSuccess});

  final void Function(FormModel, Map<String, dynamic>) onSuccess;

  /// Create a copy of PreviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubmitFormEventCopyWith<SubmitFormEvent> get copyWith =>
      _$SubmitFormEventCopyWithImpl<SubmitFormEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubmitFormEvent &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, onSuccess);

  @override
  String toString() {
    return 'PreviewEvent.submitForm(onSuccess: $onSuccess)';
  }
}

/// @nodoc
abstract mixin class $SubmitFormEventCopyWith<$Res>
    implements $PreviewEventCopyWith<$Res> {
  factory $SubmitFormEventCopyWith(
          SubmitFormEvent value, $Res Function(SubmitFormEvent) _then) =
      _$SubmitFormEventCopyWithImpl;
  @useResult
  $Res call({void Function(FormModel, Map<String, dynamic>) onSuccess});
}

/// @nodoc
class _$SubmitFormEventCopyWithImpl<$Res>
    implements $SubmitFormEventCopyWith<$Res> {
  _$SubmitFormEventCopyWithImpl(this._self, this._then);

  final SubmitFormEvent _self;
  final $Res Function(SubmitFormEvent) _then;

  /// Create a copy of PreviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? onSuccess = null,
  }) {
    return _then(SubmitFormEvent(
      onSuccess: null == onSuccess
          ? _self.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as void Function(FormModel, Map<String, dynamic>),
    ));
  }
}

PreviewState _$PreviewStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'initial':
      return PreviewStateInitial.fromJson(json);
    case 'loading':
      return PreviewStateLoading.fromJson(json);
    case 'loaded':
      return PreviewStateLoaded.fromJson(json);
    case 'error':
      return PreviewStateError.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'PreviewState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$PreviewState {
  /// Serializes this PreviewState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PreviewState);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PreviewState()';
  }
}

/// @nodoc
class $PreviewStateCopyWith<$Res> {
  $PreviewStateCopyWith(PreviewState _, $Res Function(PreviewState) __);
}

/// @nodoc
@JsonSerializable()
class PreviewStateInitial extends PreviewState {
  const PreviewStateInitial({final String? $type})
      : $type = $type ?? 'initial',
        super._();
  factory PreviewStateInitial.fromJson(Map<String, dynamic> json) =>
      _$PreviewStateInitialFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  Map<String, dynamic> toJson() {
    return _$PreviewStateInitialToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PreviewStateInitial);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PreviewState.initial()';
  }
}

/// @nodoc
@JsonSerializable()
class PreviewStateLoading extends PreviewState {
  const PreviewStateLoading({final String? $type})
      : $type = $type ?? 'loading',
        super._();
  factory PreviewStateLoading.fromJson(Map<String, dynamic> json) =>
      _$PreviewStateLoadingFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  Map<String, dynamic> toJson() {
    return _$PreviewStateLoadingToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PreviewStateLoading);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PreviewState.loading()';
  }
}

/// @nodoc
@JsonSerializable()
class PreviewStateLoaded extends PreviewState {
  const PreviewStateLoaded(
      {required this.form,
      required final Map<String, dynamic> answers,
      required final Map<String, String?> errors,
      final String? $type})
      : _answers = answers,
        _errors = errors,
        $type = $type ?? 'loaded',
        super._();
  factory PreviewStateLoaded.fromJson(Map<String, dynamic> json) =>
      _$PreviewStateLoadedFromJson(json);

  final FormModel form;
  final Map<String, dynamic> _answers;
  Map<String, dynamic> get answers {
    if (_answers is EqualUnmodifiableMapView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_answers);
  }

  final Map<String, String?> _errors;
  Map<String, String?> get errors {
    if (_errors is EqualUnmodifiableMapView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_errors);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of PreviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PreviewStateLoadedCopyWith<PreviewStateLoaded> get copyWith =>
      _$PreviewStateLoadedCopyWithImpl<PreviewStateLoaded>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PreviewStateLoadedToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PreviewStateLoaded &&
            (identical(other.form, form) || other.form == form) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      form,
      const DeepCollectionEquality().hash(_answers),
      const DeepCollectionEquality().hash(_errors));

  @override
  String toString() {
    return 'PreviewState.loaded(form: $form, answers: $answers, errors: $errors)';
  }
}

/// @nodoc
abstract mixin class $PreviewStateLoadedCopyWith<$Res>
    implements $PreviewStateCopyWith<$Res> {
  factory $PreviewStateLoadedCopyWith(
          PreviewStateLoaded value, $Res Function(PreviewStateLoaded) _then) =
      _$PreviewStateLoadedCopyWithImpl;
  @useResult
  $Res call(
      {FormModel form,
      Map<String, dynamic> answers,
      Map<String, String?> errors});

  $FormModelCopyWith<$Res> get form;
}

/// @nodoc
class _$PreviewStateLoadedCopyWithImpl<$Res>
    implements $PreviewStateLoadedCopyWith<$Res> {
  _$PreviewStateLoadedCopyWithImpl(this._self, this._then);

  final PreviewStateLoaded _self;
  final $Res Function(PreviewStateLoaded) _then;

  /// Create a copy of PreviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? form = null,
    Object? answers = null,
    Object? errors = null,
  }) {
    return _then(PreviewStateLoaded(
      form: null == form
          ? _self.form
          : form // ignore: cast_nullable_to_non_nullable
              as FormModel,
      answers: null == answers
          ? _self._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      errors: null == errors
          ? _self._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<String, String?>,
    ));
  }

  /// Create a copy of PreviewState
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
class PreviewStateError extends PreviewState {
  const PreviewStateError(this.message, {final String? $type})
      : $type = $type ?? 'error',
        super._();
  factory PreviewStateError.fromJson(Map<String, dynamic> json) =>
      _$PreviewStateErrorFromJson(json);

  final String message;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of PreviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PreviewStateErrorCopyWith<PreviewStateError> get copyWith =>
      _$PreviewStateErrorCopyWithImpl<PreviewStateError>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PreviewStateErrorToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PreviewStateError &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'PreviewState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $PreviewStateErrorCopyWith<$Res>
    implements $PreviewStateCopyWith<$Res> {
  factory $PreviewStateErrorCopyWith(
          PreviewStateError value, $Res Function(PreviewStateError) _then) =
      _$PreviewStateErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$PreviewStateErrorCopyWithImpl<$Res>
    implements $PreviewStateErrorCopyWith<$Res> {
  _$PreviewStateErrorCopyWithImpl(this._self, this._then);

  final PreviewStateError _self;
  final $Res Function(PreviewStateError) _then;

  /// Create a copy of PreviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(PreviewStateError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
