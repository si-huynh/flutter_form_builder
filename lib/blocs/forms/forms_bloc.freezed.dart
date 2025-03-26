// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forms_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FormsEvent implements DiagnosticableTreeMixin {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'FormsEvent'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FormsEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FormsEvent()';
  }
}

/// @nodoc
class $FormsEventCopyWith<$Res> {
  $FormsEventCopyWith(FormsEvent _, $Res Function(FormsEvent) __);
}

/// @nodoc

class FormsEventLoads with DiagnosticableTreeMixin implements FormsEvent {
  const FormsEventLoads();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'FormsEvent.loadForms'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FormsEventLoads);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FormsEvent.loadForms()';
  }
}

/// @nodoc

class FormsEventAddForm with DiagnosticableTreeMixin implements FormsEvent {
  const FormsEventAddForm(this.form);

  final FormModel form;

  /// Create a copy of FormsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FormsEventAddFormCopyWith<FormsEventAddForm> get copyWith =>
      _$FormsEventAddFormCopyWithImpl<FormsEventAddForm>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'FormsEvent.addForm'))
      ..add(DiagnosticsProperty('form', form));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FormsEventAddForm &&
            (identical(other.form, form) || other.form == form));
  }

  @override
  int get hashCode => Object.hash(runtimeType, form);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FormsEvent.addForm(form: $form)';
  }
}

/// @nodoc
abstract mixin class $FormsEventAddFormCopyWith<$Res>
    implements $FormsEventCopyWith<$Res> {
  factory $FormsEventAddFormCopyWith(
          FormsEventAddForm value, $Res Function(FormsEventAddForm) _then) =
      _$FormsEventAddFormCopyWithImpl;
  @useResult
  $Res call({FormModel form});

  $FormModelCopyWith<$Res> get form;
}

/// @nodoc
class _$FormsEventAddFormCopyWithImpl<$Res>
    implements $FormsEventAddFormCopyWith<$Res> {
  _$FormsEventAddFormCopyWithImpl(this._self, this._then);

  final FormsEventAddForm _self;
  final $Res Function(FormsEventAddForm) _then;

  /// Create a copy of FormsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? form = null,
  }) {
    return _then(FormsEventAddForm(
      null == form
          ? _self.form
          : form // ignore: cast_nullable_to_non_nullable
              as FormModel,
    ));
  }

  /// Create a copy of FormsEvent
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

class FormsEventUpdateForm with DiagnosticableTreeMixin implements FormsEvent {
  const FormsEventUpdateForm(this.form);

  final FormModel form;

  /// Create a copy of FormsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FormsEventUpdateFormCopyWith<FormsEventUpdateForm> get copyWith =>
      _$FormsEventUpdateFormCopyWithImpl<FormsEventUpdateForm>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'FormsEvent.updateForm'))
      ..add(DiagnosticsProperty('form', form));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FormsEventUpdateForm &&
            (identical(other.form, form) || other.form == form));
  }

  @override
  int get hashCode => Object.hash(runtimeType, form);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FormsEvent.updateForm(form: $form)';
  }
}

/// @nodoc
abstract mixin class $FormsEventUpdateFormCopyWith<$Res>
    implements $FormsEventCopyWith<$Res> {
  factory $FormsEventUpdateFormCopyWith(FormsEventUpdateForm value,
          $Res Function(FormsEventUpdateForm) _then) =
      _$FormsEventUpdateFormCopyWithImpl;
  @useResult
  $Res call({FormModel form});

  $FormModelCopyWith<$Res> get form;
}

/// @nodoc
class _$FormsEventUpdateFormCopyWithImpl<$Res>
    implements $FormsEventUpdateFormCopyWith<$Res> {
  _$FormsEventUpdateFormCopyWithImpl(this._self, this._then);

  final FormsEventUpdateForm _self;
  final $Res Function(FormsEventUpdateForm) _then;

  /// Create a copy of FormsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? form = null,
  }) {
    return _then(FormsEventUpdateForm(
      null == form
          ? _self.form
          : form // ignore: cast_nullable_to_non_nullable
              as FormModel,
    ));
  }

  /// Create a copy of FormsEvent
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

class FormsEventDeleteForm with DiagnosticableTreeMixin implements FormsEvent {
  const FormsEventDeleteForm(this.formId);

  final String formId;

  /// Create a copy of FormsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FormsEventDeleteFormCopyWith<FormsEventDeleteForm> get copyWith =>
      _$FormsEventDeleteFormCopyWithImpl<FormsEventDeleteForm>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'FormsEvent.deleteForm'))
      ..add(DiagnosticsProperty('formId', formId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FormsEventDeleteForm &&
            (identical(other.formId, formId) || other.formId == formId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, formId);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FormsEvent.deleteForm(formId: $formId)';
  }
}

/// @nodoc
abstract mixin class $FormsEventDeleteFormCopyWith<$Res>
    implements $FormsEventCopyWith<$Res> {
  factory $FormsEventDeleteFormCopyWith(FormsEventDeleteForm value,
          $Res Function(FormsEventDeleteForm) _then) =
      _$FormsEventDeleteFormCopyWithImpl;
  @useResult
  $Res call({String formId});
}

/// @nodoc
class _$FormsEventDeleteFormCopyWithImpl<$Res>
    implements $FormsEventDeleteFormCopyWith<$Res> {
  _$FormsEventDeleteFormCopyWithImpl(this._self, this._then);

  final FormsEventDeleteForm _self;
  final $Res Function(FormsEventDeleteForm) _then;

  /// Create a copy of FormsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? formId = null,
  }) {
    return _then(FormsEventDeleteForm(
      null == formId
          ? _self.formId
          : formId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

FormsState _$FormsStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'initial':
      return FormsStateInitial.fromJson(json);
    case 'loading':
      return FormsStateLoading.fromJson(json);
    case 'loaded':
      return FormsStateLoaded.fromJson(json);
    case 'error':
      return FormsStateError.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'FormsState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$FormsState implements DiagnosticableTreeMixin {
  /// Serializes this FormsState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'FormsState'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FormsState);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FormsState()';
  }
}

/// @nodoc
class $FormsStateCopyWith<$Res> {
  $FormsStateCopyWith(FormsState _, $Res Function(FormsState) __);
}

/// @nodoc
@JsonSerializable()
class FormsStateInitial extends FormsState with DiagnosticableTreeMixin {
  const FormsStateInitial({final String? $type})
      : $type = $type ?? 'initial',
        super._();
  factory FormsStateInitial.fromJson(Map<String, dynamic> json) =>
      _$FormsStateInitialFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  Map<String, dynamic> toJson() {
    return _$FormsStateInitialToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'FormsState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FormsStateInitial);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FormsState.initial()';
  }
}

/// @nodoc
@JsonSerializable()
class FormsStateLoading extends FormsState with DiagnosticableTreeMixin {
  const FormsStateLoading({final String? $type})
      : $type = $type ?? 'loading',
        super._();
  factory FormsStateLoading.fromJson(Map<String, dynamic> json) =>
      _$FormsStateLoadingFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  Map<String, dynamic> toJson() {
    return _$FormsStateLoadingToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'FormsState.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FormsStateLoading);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FormsState.loading()';
  }
}

/// @nodoc
@JsonSerializable()
class FormsStateLoaded extends FormsState with DiagnosticableTreeMixin {
  const FormsStateLoaded(
      {required final List<FormModel> forms, final String? $type})
      : _forms = forms,
        $type = $type ?? 'loaded',
        super._();
  factory FormsStateLoaded.fromJson(Map<String, dynamic> json) =>
      _$FormsStateLoadedFromJson(json);

  final List<FormModel> _forms;
  List<FormModel> get forms {
    if (_forms is EqualUnmodifiableListView) return _forms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_forms);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of FormsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FormsStateLoadedCopyWith<FormsStateLoaded> get copyWith =>
      _$FormsStateLoadedCopyWithImpl<FormsStateLoaded>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FormsStateLoadedToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'FormsState.loaded'))
      ..add(DiagnosticsProperty('forms', forms));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FormsStateLoaded &&
            const DeepCollectionEquality().equals(other._forms, _forms));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_forms));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FormsState.loaded(forms: $forms)';
  }
}

/// @nodoc
abstract mixin class $FormsStateLoadedCopyWith<$Res>
    implements $FormsStateCopyWith<$Res> {
  factory $FormsStateLoadedCopyWith(
          FormsStateLoaded value, $Res Function(FormsStateLoaded) _then) =
      _$FormsStateLoadedCopyWithImpl;
  @useResult
  $Res call({List<FormModel> forms});
}

/// @nodoc
class _$FormsStateLoadedCopyWithImpl<$Res>
    implements $FormsStateLoadedCopyWith<$Res> {
  _$FormsStateLoadedCopyWithImpl(this._self, this._then);

  final FormsStateLoaded _self;
  final $Res Function(FormsStateLoaded) _then;

  /// Create a copy of FormsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? forms = null,
  }) {
    return _then(FormsStateLoaded(
      forms: null == forms
          ? _self._forms
          : forms // ignore: cast_nullable_to_non_nullable
              as List<FormModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class FormsStateError extends FormsState with DiagnosticableTreeMixin {
  const FormsStateError(this.message, {final String? $type})
      : $type = $type ?? 'error',
        super._();
  factory FormsStateError.fromJson(Map<String, dynamic> json) =>
      _$FormsStateErrorFromJson(json);

  final String message;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of FormsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FormsStateErrorCopyWith<FormsStateError> get copyWith =>
      _$FormsStateErrorCopyWithImpl<FormsStateError>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FormsStateErrorToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'FormsState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FormsStateError &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FormsState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $FormsStateErrorCopyWith<$Res>
    implements $FormsStateCopyWith<$Res> {
  factory $FormsStateErrorCopyWith(
          FormsStateError value, $Res Function(FormsStateError) _then) =
      _$FormsStateErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$FormsStateErrorCopyWithImpl<$Res>
    implements $FormsStateErrorCopyWith<$Res> {
  _$FormsStateErrorCopyWithImpl(this._self, this._then);

  final FormsStateError _self;
  final $Res Function(FormsStateError) _then;

  /// Create a copy of FormsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(FormsStateError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
