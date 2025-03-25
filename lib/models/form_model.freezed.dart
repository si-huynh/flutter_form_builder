// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FormModel {
  String get id;
  String get title;
  String get description;
  List<QuestionModel> get questions;

  /// Create a copy of FormModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FormModelCopyWith<FormModel> get copyWith =>
      _$FormModelCopyWithImpl<FormModel>(this as FormModel, _$identity);

  /// Serializes this FormModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FormModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.questions, questions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description,
      const DeepCollectionEquality().hash(questions));

  @override
  String toString() {
    return 'FormModel(id: $id, title: $title, description: $description, questions: $questions)';
  }
}

/// @nodoc
abstract mixin class $FormModelCopyWith<$Res> {
  factory $FormModelCopyWith(FormModel value, $Res Function(FormModel) _then) =
      _$FormModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      List<QuestionModel> questions});
}

/// @nodoc
class _$FormModelCopyWithImpl<$Res> implements $FormModelCopyWith<$Res> {
  _$FormModelCopyWithImpl(this._self, this._then);

  final FormModel _self;
  final $Res Function(FormModel) _then;

  /// Create a copy of FormModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? questions = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      questions: null == questions
          ? _self.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _FormModel implements FormModel {
  const _FormModel(
      {required this.id,
      required this.title,
      this.description = '',
      final List<QuestionModel> questions = const []})
      : _questions = questions;
  factory _FormModel.fromJson(Map<String, dynamic> json) =>
      _$FormModelFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  @JsonKey()
  final String description;
  final List<QuestionModel> _questions;
  @override
  @JsonKey()
  List<QuestionModel> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  /// Create a copy of FormModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FormModelCopyWith<_FormModel> get copyWith =>
      __$FormModelCopyWithImpl<_FormModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FormModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FormModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description,
      const DeepCollectionEquality().hash(_questions));

  @override
  String toString() {
    return 'FormModel(id: $id, title: $title, description: $description, questions: $questions)';
  }
}

/// @nodoc
abstract mixin class _$FormModelCopyWith<$Res>
    implements $FormModelCopyWith<$Res> {
  factory _$FormModelCopyWith(
          _FormModel value, $Res Function(_FormModel) _then) =
      __$FormModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      List<QuestionModel> questions});
}

/// @nodoc
class __$FormModelCopyWithImpl<$Res> implements _$FormModelCopyWith<$Res> {
  __$FormModelCopyWithImpl(this._self, this._then);

  final _FormModel _self;
  final $Res Function(_FormModel) _then;

  /// Create a copy of FormModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? questions = null,
  }) {
    return _then(_FormModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      questions: null == questions
          ? _self._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel>,
    ));
  }
}

// dart format on
