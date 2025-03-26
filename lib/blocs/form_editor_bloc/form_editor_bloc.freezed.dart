// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_editor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FormEditorEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FormEditorEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FormEditorEvent()';
  }
}

/// @nodoc
class $FormEditorEventCopyWith<$Res> {
  $FormEditorEventCopyWith(
      FormEditorEvent _, $Res Function(FormEditorEvent) __);
}

/// @nodoc

class LoadFormEvent implements FormEditorEvent {
  const LoadFormEvent(this.form);

  final FormModel form;

  /// Create a copy of FormEditorEvent
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
    return 'FormEditorEvent.loadForm(form: $form)';
  }
}

/// @nodoc
abstract mixin class $LoadFormEventCopyWith<$Res>
    implements $FormEditorEventCopyWith<$Res> {
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

  /// Create a copy of FormEditorEvent
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

  /// Create a copy of FormEditorEvent
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

class UpdateFormEvent implements FormEditorEvent {
  const UpdateFormEvent(this.form);

  final FormModel form;

  /// Create a copy of FormEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateFormEventCopyWith<UpdateFormEvent> get copyWith =>
      _$UpdateFormEventCopyWithImpl<UpdateFormEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateFormEvent &&
            (identical(other.form, form) || other.form == form));
  }

  @override
  int get hashCode => Object.hash(runtimeType, form);

  @override
  String toString() {
    return 'FormEditorEvent.updateForm(form: $form)';
  }
}

/// @nodoc
abstract mixin class $UpdateFormEventCopyWith<$Res>
    implements $FormEditorEventCopyWith<$Res> {
  factory $UpdateFormEventCopyWith(
          UpdateFormEvent value, $Res Function(UpdateFormEvent) _then) =
      _$UpdateFormEventCopyWithImpl;
  @useResult
  $Res call({FormModel form});

  $FormModelCopyWith<$Res> get form;
}

/// @nodoc
class _$UpdateFormEventCopyWithImpl<$Res>
    implements $UpdateFormEventCopyWith<$Res> {
  _$UpdateFormEventCopyWithImpl(this._self, this._then);

  final UpdateFormEvent _self;
  final $Res Function(UpdateFormEvent) _then;

  /// Create a copy of FormEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? form = null,
  }) {
    return _then(UpdateFormEvent(
      null == form
          ? _self.form
          : form // ignore: cast_nullable_to_non_nullable
              as FormModel,
    ));
  }

  /// Create a copy of FormEditorEvent
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

class AddQuestionEvent implements FormEditorEvent {
  const AddQuestionEvent(this.type);

  final QuestionType type;

  /// Create a copy of FormEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddQuestionEventCopyWith<AddQuestionEvent> get copyWith =>
      _$AddQuestionEventCopyWithImpl<AddQuestionEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddQuestionEvent &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  @override
  String toString() {
    return 'FormEditorEvent.addQuestion(type: $type)';
  }
}

/// @nodoc
abstract mixin class $AddQuestionEventCopyWith<$Res>
    implements $FormEditorEventCopyWith<$Res> {
  factory $AddQuestionEventCopyWith(
          AddQuestionEvent value, $Res Function(AddQuestionEvent) _then) =
      _$AddQuestionEventCopyWithImpl;
  @useResult
  $Res call({QuestionType type});

  $QuestionTypeCopyWith<$Res> get type;
}

/// @nodoc
class _$AddQuestionEventCopyWithImpl<$Res>
    implements $AddQuestionEventCopyWith<$Res> {
  _$AddQuestionEventCopyWithImpl(this._self, this._then);

  final AddQuestionEvent _self;
  final $Res Function(AddQuestionEvent) _then;

  /// Create a copy of FormEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
  }) {
    return _then(AddQuestionEvent(
      null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as QuestionType,
    ));
  }

  /// Create a copy of FormEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuestionTypeCopyWith<$Res> get type {
    return $QuestionTypeCopyWith<$Res>(_self.type, (value) {
      return _then(_self.copyWith(type: value));
    });
  }
}

/// @nodoc

class DeleteQuestionEvent implements FormEditorEvent {
  const DeleteQuestionEvent(this.questionId);

  final String questionId;

  /// Create a copy of FormEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteQuestionEventCopyWith<DeleteQuestionEvent> get copyWith =>
      _$DeleteQuestionEventCopyWithImpl<DeleteQuestionEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteQuestionEvent &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, questionId);

  @override
  String toString() {
    return 'FormEditorEvent.deleteQuestion(questionId: $questionId)';
  }
}

/// @nodoc
abstract mixin class $DeleteQuestionEventCopyWith<$Res>
    implements $FormEditorEventCopyWith<$Res> {
  factory $DeleteQuestionEventCopyWith(
          DeleteQuestionEvent value, $Res Function(DeleteQuestionEvent) _then) =
      _$DeleteQuestionEventCopyWithImpl;
  @useResult
  $Res call({String questionId});
}

/// @nodoc
class _$DeleteQuestionEventCopyWithImpl<$Res>
    implements $DeleteQuestionEventCopyWith<$Res> {
  _$DeleteQuestionEventCopyWithImpl(this._self, this._then);

  final DeleteQuestionEvent _self;
  final $Res Function(DeleteQuestionEvent) _then;

  /// Create a copy of FormEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? questionId = null,
  }) {
    return _then(DeleteQuestionEvent(
      null == questionId
          ? _self.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ReorderQuestionsEvent implements FormEditorEvent {
  const ReorderQuestionsEvent(this.oldIndex, this.newIndex);

  final int oldIndex;
  final int newIndex;

  /// Create a copy of FormEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReorderQuestionsEventCopyWith<ReorderQuestionsEvent> get copyWith =>
      _$ReorderQuestionsEventCopyWithImpl<ReorderQuestionsEvent>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReorderQuestionsEvent &&
            (identical(other.oldIndex, oldIndex) ||
                other.oldIndex == oldIndex) &&
            (identical(other.newIndex, newIndex) ||
                other.newIndex == newIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, oldIndex, newIndex);

  @override
  String toString() {
    return 'FormEditorEvent.reorderQuestions(oldIndex: $oldIndex, newIndex: $newIndex)';
  }
}

/// @nodoc
abstract mixin class $ReorderQuestionsEventCopyWith<$Res>
    implements $FormEditorEventCopyWith<$Res> {
  factory $ReorderQuestionsEventCopyWith(ReorderQuestionsEvent value,
          $Res Function(ReorderQuestionsEvent) _then) =
      _$ReorderQuestionsEventCopyWithImpl;
  @useResult
  $Res call({int oldIndex, int newIndex});
}

/// @nodoc
class _$ReorderQuestionsEventCopyWithImpl<$Res>
    implements $ReorderQuestionsEventCopyWith<$Res> {
  _$ReorderQuestionsEventCopyWithImpl(this._self, this._then);

  final ReorderQuestionsEvent _self;
  final $Res Function(ReorderQuestionsEvent) _then;

  /// Create a copy of FormEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? oldIndex = null,
    Object? newIndex = null,
  }) {
    return _then(ReorderQuestionsEvent(
      null == oldIndex
          ? _self.oldIndex
          : oldIndex // ignore: cast_nullable_to_non_nullable
              as int,
      null == newIndex
          ? _self.newIndex
          : newIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class AddOptionEvent implements FormEditorEvent {
  const AddOptionEvent(this.questionId, this.option);

  final String questionId;
  final String option;

  /// Create a copy of FormEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddOptionEventCopyWith<AddOptionEvent> get copyWith =>
      _$AddOptionEventCopyWithImpl<AddOptionEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddOptionEvent &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.option, option) || other.option == option));
  }

  @override
  int get hashCode => Object.hash(runtimeType, questionId, option);

  @override
  String toString() {
    return 'FormEditorEvent.addOption(questionId: $questionId, option: $option)';
  }
}

/// @nodoc
abstract mixin class $AddOptionEventCopyWith<$Res>
    implements $FormEditorEventCopyWith<$Res> {
  factory $AddOptionEventCopyWith(
          AddOptionEvent value, $Res Function(AddOptionEvent) _then) =
      _$AddOptionEventCopyWithImpl;
  @useResult
  $Res call({String questionId, String option});
}

/// @nodoc
class _$AddOptionEventCopyWithImpl<$Res>
    implements $AddOptionEventCopyWith<$Res> {
  _$AddOptionEventCopyWithImpl(this._self, this._then);

  final AddOptionEvent _self;
  final $Res Function(AddOptionEvent) _then;

  /// Create a copy of FormEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? questionId = null,
    Object? option = null,
  }) {
    return _then(AddOptionEvent(
      null == questionId
          ? _self.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      null == option
          ? _self.option
          : option // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class DeleteOptionEvent implements FormEditorEvent {
  const DeleteOptionEvent(this.questionId, this.optionIndex);

  final String questionId;
  final int optionIndex;

  /// Create a copy of FormEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteOptionEventCopyWith<DeleteOptionEvent> get copyWith =>
      _$DeleteOptionEventCopyWithImpl<DeleteOptionEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteOptionEvent &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.optionIndex, optionIndex) ||
                other.optionIndex == optionIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, questionId, optionIndex);

  @override
  String toString() {
    return 'FormEditorEvent.deleteOption(questionId: $questionId, optionIndex: $optionIndex)';
  }
}

/// @nodoc
abstract mixin class $DeleteOptionEventCopyWith<$Res>
    implements $FormEditorEventCopyWith<$Res> {
  factory $DeleteOptionEventCopyWith(
          DeleteOptionEvent value, $Res Function(DeleteOptionEvent) _then) =
      _$DeleteOptionEventCopyWithImpl;
  @useResult
  $Res call({String questionId, int optionIndex});
}

/// @nodoc
class _$DeleteOptionEventCopyWithImpl<$Res>
    implements $DeleteOptionEventCopyWith<$Res> {
  _$DeleteOptionEventCopyWithImpl(this._self, this._then);

  final DeleteOptionEvent _self;
  final $Res Function(DeleteOptionEvent) _then;

  /// Create a copy of FormEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? questionId = null,
    Object? optionIndex = null,
  }) {
    return _then(DeleteOptionEvent(
      null == questionId
          ? _self.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      null == optionIndex
          ? _self.optionIndex
          : optionIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class ToggleOtherOptionEvent implements FormEditorEvent {
  const ToggleOtherOptionEvent(this.questionId, this.hasOther);

  final String questionId;
  final bool hasOther;

  /// Create a copy of FormEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleOtherOptionEventCopyWith<ToggleOtherOptionEvent> get copyWith =>
      _$ToggleOtherOptionEventCopyWithImpl<ToggleOtherOptionEvent>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleOtherOptionEvent &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.hasOther, hasOther) ||
                other.hasOther == hasOther));
  }

  @override
  int get hashCode => Object.hash(runtimeType, questionId, hasOther);

  @override
  String toString() {
    return 'FormEditorEvent.toggleOtherOption(questionId: $questionId, hasOther: $hasOther)';
  }
}

/// @nodoc
abstract mixin class $ToggleOtherOptionEventCopyWith<$Res>
    implements $FormEditorEventCopyWith<$Res> {
  factory $ToggleOtherOptionEventCopyWith(ToggleOtherOptionEvent value,
          $Res Function(ToggleOtherOptionEvent) _then) =
      _$ToggleOtherOptionEventCopyWithImpl;
  @useResult
  $Res call({String questionId, bool hasOther});
}

/// @nodoc
class _$ToggleOtherOptionEventCopyWithImpl<$Res>
    implements $ToggleOtherOptionEventCopyWith<$Res> {
  _$ToggleOtherOptionEventCopyWithImpl(this._self, this._then);

  final ToggleOtherOptionEvent _self;
  final $Res Function(ToggleOtherOptionEvent) _then;

  /// Create a copy of FormEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? questionId = null,
    Object? hasOther = null,
  }) {
    return _then(ToggleOtherOptionEvent(
      null == questionId
          ? _self.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      null == hasOther
          ? _self.hasOther
          : hasOther // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

FormEditorState _$FormEditorStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'initial':
      return FormEditorStateInitial.fromJson(json);
    case 'loading':
      return FormEditorStateLoading.fromJson(json);
    case 'loaded':
      return FormEditorStateLoaded.fromJson(json);
    case 'error':
      return FormEditorStateError.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'FormEditorState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$FormEditorState {
  /// Serializes this FormEditorState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FormEditorState);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FormEditorState()';
  }
}

/// @nodoc
class $FormEditorStateCopyWith<$Res> {
  $FormEditorStateCopyWith(
      FormEditorState _, $Res Function(FormEditorState) __);
}

/// @nodoc
@JsonSerializable()
class FormEditorStateInitial extends FormEditorState {
  const FormEditorStateInitial({final String? $type})
      : $type = $type ?? 'initial',
        super._();
  factory FormEditorStateInitial.fromJson(Map<String, dynamic> json) =>
      _$FormEditorStateInitialFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  Map<String, dynamic> toJson() {
    return _$FormEditorStateInitialToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FormEditorStateInitial);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FormEditorState.initial()';
  }
}

/// @nodoc
@JsonSerializable()
class FormEditorStateLoading extends FormEditorState {
  const FormEditorStateLoading({final String? $type})
      : $type = $type ?? 'loading',
        super._();
  factory FormEditorStateLoading.fromJson(Map<String, dynamic> json) =>
      _$FormEditorStateLoadingFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  Map<String, dynamic> toJson() {
    return _$FormEditorStateLoadingToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FormEditorStateLoading);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FormEditorState.loading()';
  }
}

/// @nodoc
@JsonSerializable()
class FormEditorStateLoaded extends FormEditorState {
  const FormEditorStateLoaded(this.form, {final String? $type})
      : $type = $type ?? 'loaded',
        super._();
  factory FormEditorStateLoaded.fromJson(Map<String, dynamic> json) =>
      _$FormEditorStateLoadedFromJson(json);

  final FormModel form;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of FormEditorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FormEditorStateLoadedCopyWith<FormEditorStateLoaded> get copyWith =>
      _$FormEditorStateLoadedCopyWithImpl<FormEditorStateLoaded>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FormEditorStateLoadedToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FormEditorStateLoaded &&
            (identical(other.form, form) || other.form == form));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, form);

  @override
  String toString() {
    return 'FormEditorState.loaded(form: $form)';
  }
}

/// @nodoc
abstract mixin class $FormEditorStateLoadedCopyWith<$Res>
    implements $FormEditorStateCopyWith<$Res> {
  factory $FormEditorStateLoadedCopyWith(FormEditorStateLoaded value,
          $Res Function(FormEditorStateLoaded) _then) =
      _$FormEditorStateLoadedCopyWithImpl;
  @useResult
  $Res call({FormModel form});

  $FormModelCopyWith<$Res> get form;
}

/// @nodoc
class _$FormEditorStateLoadedCopyWithImpl<$Res>
    implements $FormEditorStateLoadedCopyWith<$Res> {
  _$FormEditorStateLoadedCopyWithImpl(this._self, this._then);

  final FormEditorStateLoaded _self;
  final $Res Function(FormEditorStateLoaded) _then;

  /// Create a copy of FormEditorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? form = null,
  }) {
    return _then(FormEditorStateLoaded(
      null == form
          ? _self.form
          : form // ignore: cast_nullable_to_non_nullable
              as FormModel,
    ));
  }

  /// Create a copy of FormEditorState
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
class FormEditorStateError extends FormEditorState {
  const FormEditorStateError(this.message, {final String? $type})
      : $type = $type ?? 'error',
        super._();
  factory FormEditorStateError.fromJson(Map<String, dynamic> json) =>
      _$FormEditorStateErrorFromJson(json);

  final String message;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of FormEditorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FormEditorStateErrorCopyWith<FormEditorStateError> get copyWith =>
      _$FormEditorStateErrorCopyWithImpl<FormEditorStateError>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FormEditorStateErrorToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FormEditorStateError &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'FormEditorState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $FormEditorStateErrorCopyWith<$Res>
    implements $FormEditorStateCopyWith<$Res> {
  factory $FormEditorStateErrorCopyWith(FormEditorStateError value,
          $Res Function(FormEditorStateError) _then) =
      _$FormEditorStateErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$FormEditorStateErrorCopyWithImpl<$Res>
    implements $FormEditorStateErrorCopyWith<$Res> {
  _$FormEditorStateErrorCopyWithImpl(this._self, this._then);

  final FormEditorStateError _self;
  final $Res Function(FormEditorStateError) _then;

  /// Create a copy of FormEditorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(FormEditorStateError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
