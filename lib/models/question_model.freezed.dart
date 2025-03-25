// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'shortAnswer':
      return ShortAnswerQuestion.fromJson(json);
    case 'longAnswer':
      return LongAnswerQuestion.fromJson(json);
    case 'multipleChoice':
      return MultipleChoiceQuestion.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'QuestionModel',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$QuestionModel {
  String get id;
  String get text;
  bool get required;

  /// Create a copy of QuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuestionModelCopyWith<QuestionModel> get copyWith =>
      _$QuestionModelCopyWithImpl<QuestionModel>(
          this as QuestionModel, _$identity);

  /// Serializes this QuestionModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuestionModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.required, required) ||
                other.required == required));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, text, required);

  @override
  String toString() {
    return 'QuestionModel(id: $id, text: $text, required: $required)';
  }
}

/// @nodoc
abstract mixin class $QuestionModelCopyWith<$Res> {
  factory $QuestionModelCopyWith(
          QuestionModel value, $Res Function(QuestionModel) _then) =
      _$QuestionModelCopyWithImpl;
  @useResult
  $Res call({String id, String text, bool required});
}

/// @nodoc
class _$QuestionModelCopyWithImpl<$Res>
    implements $QuestionModelCopyWith<$Res> {
  _$QuestionModelCopyWithImpl(this._self, this._then);

  final QuestionModel _self;
  final $Res Function(QuestionModel) _then;

  /// Create a copy of QuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? required = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      required: null == required
          ? _self.required
          : required // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class ShortAnswerQuestion implements QuestionModel {
  const ShortAnswerQuestion(
      {required this.id,
      required this.text,
      this.required = false,
      final String? $type})
      : $type = $type ?? 'shortAnswer';
  factory ShortAnswerQuestion.fromJson(Map<String, dynamic> json) =>
      _$ShortAnswerQuestionFromJson(json);

  @override
  final String id;
  @override
  final String text;
  @override
  @JsonKey()
  final bool required;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of QuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ShortAnswerQuestionCopyWith<ShortAnswerQuestion> get copyWith =>
      _$ShortAnswerQuestionCopyWithImpl<ShortAnswerQuestion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ShortAnswerQuestionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShortAnswerQuestion &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.required, required) ||
                other.required == required));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, text, required);

  @override
  String toString() {
    return 'QuestionModel.shortAnswer(id: $id, text: $text, required: $required)';
  }
}

/// @nodoc
abstract mixin class $ShortAnswerQuestionCopyWith<$Res>
    implements $QuestionModelCopyWith<$Res> {
  factory $ShortAnswerQuestionCopyWith(
          ShortAnswerQuestion value, $Res Function(ShortAnswerQuestion) _then) =
      _$ShortAnswerQuestionCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String text, bool required});
}

/// @nodoc
class _$ShortAnswerQuestionCopyWithImpl<$Res>
    implements $ShortAnswerQuestionCopyWith<$Res> {
  _$ShortAnswerQuestionCopyWithImpl(this._self, this._then);

  final ShortAnswerQuestion _self;
  final $Res Function(ShortAnswerQuestion) _then;

  /// Create a copy of QuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? required = null,
  }) {
    return _then(ShortAnswerQuestion(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      required: null == required
          ? _self.required
          : required // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class LongAnswerQuestion implements QuestionModel {
  const LongAnswerQuestion(
      {required this.id,
      required this.text,
      this.required = false,
      final String? $type})
      : $type = $type ?? 'longAnswer';
  factory LongAnswerQuestion.fromJson(Map<String, dynamic> json) =>
      _$LongAnswerQuestionFromJson(json);

  @override
  final String id;
  @override
  final String text;
  @override
  @JsonKey()
  final bool required;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of QuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LongAnswerQuestionCopyWith<LongAnswerQuestion> get copyWith =>
      _$LongAnswerQuestionCopyWithImpl<LongAnswerQuestion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LongAnswerQuestionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LongAnswerQuestion &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.required, required) ||
                other.required == required));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, text, required);

  @override
  String toString() {
    return 'QuestionModel.longAnswer(id: $id, text: $text, required: $required)';
  }
}

/// @nodoc
abstract mixin class $LongAnswerQuestionCopyWith<$Res>
    implements $QuestionModelCopyWith<$Res> {
  factory $LongAnswerQuestionCopyWith(
          LongAnswerQuestion value, $Res Function(LongAnswerQuestion) _then) =
      _$LongAnswerQuestionCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String text, bool required});
}

/// @nodoc
class _$LongAnswerQuestionCopyWithImpl<$Res>
    implements $LongAnswerQuestionCopyWith<$Res> {
  _$LongAnswerQuestionCopyWithImpl(this._self, this._then);

  final LongAnswerQuestion _self;
  final $Res Function(LongAnswerQuestion) _then;

  /// Create a copy of QuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? required = null,
  }) {
    return _then(LongAnswerQuestion(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      required: null == required
          ? _self.required
          : required // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class MultipleChoiceQuestion implements QuestionModel {
  const MultipleChoiceQuestion(
      {required this.id,
      required this.text,
      this.required = false,
      final List<String> options = const [],
      this.other = false,
      final String? $type})
      : _options = options,
        $type = $type ?? 'multipleChoice';
  factory MultipleChoiceQuestion.fromJson(Map<String, dynamic> json) =>
      _$MultipleChoiceQuestionFromJson(json);

  @override
  final String id;
  @override
  final String text;
  @override
  @JsonKey()
  final bool required;
  final List<String> _options;
  @JsonKey()
  List<String> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @JsonKey()
  final bool other;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of QuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MultipleChoiceQuestionCopyWith<MultipleChoiceQuestion> get copyWith =>
      _$MultipleChoiceQuestionCopyWithImpl<MultipleChoiceQuestion>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MultipleChoiceQuestionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MultipleChoiceQuestion &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.required, required) ||
                other.required == required) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.other, this.other) || other.other == this.other));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, text, required,
      const DeepCollectionEquality().hash(_options), other);

  @override
  String toString() {
    return 'QuestionModel.multipleChoice(id: $id, text: $text, required: $required, options: $options, other: $other)';
  }
}

/// @nodoc
abstract mixin class $MultipleChoiceQuestionCopyWith<$Res>
    implements $QuestionModelCopyWith<$Res> {
  factory $MultipleChoiceQuestionCopyWith(MultipleChoiceQuestion value,
          $Res Function(MultipleChoiceQuestion) _then) =
      _$MultipleChoiceQuestionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String text,
      bool required,
      List<String> options,
      bool other});
}

/// @nodoc
class _$MultipleChoiceQuestionCopyWithImpl<$Res>
    implements $MultipleChoiceQuestionCopyWith<$Res> {
  _$MultipleChoiceQuestionCopyWithImpl(this._self, this._then);

  final MultipleChoiceQuestion _self;
  final $Res Function(MultipleChoiceQuestion) _then;

  /// Create a copy of QuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? required = null,
    Object? options = null,
    Object? other = null,
  }) {
    return _then(MultipleChoiceQuestion(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      required: null == required
          ? _self.required
          : required // ignore: cast_nullable_to_non_nullable
              as bool,
      options: null == options
          ? _self._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
      other: null == other
          ? _self.other
          : other // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

QuestionType _$QuestionTypeFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'multipleChoice':
      return MultipleChoice.fromJson(json);
    case 'paragraph':
      return Paragraph.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'QuestionType',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$QuestionType {
  /// Serializes this QuestionType to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is QuestionType);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'QuestionType()';
  }
}

/// @nodoc
class $QuestionTypeCopyWith<$Res> {
  $QuestionTypeCopyWith(QuestionType _, $Res Function(QuestionType) __);
}

/// @nodoc
@JsonSerializable()
class MultipleChoice implements QuestionType {
  const MultipleChoice({final String? $type})
      : $type = $type ?? 'multipleChoice';
  factory MultipleChoice.fromJson(Map<String, dynamic> json) =>
      _$MultipleChoiceFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  Map<String, dynamic> toJson() {
    return _$MultipleChoiceToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MultipleChoice);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'QuestionType.multipleChoice()';
  }
}

/// @nodoc
@JsonSerializable()
class Paragraph implements QuestionType {
  const Paragraph({final String? $type}) : $type = $type ?? 'paragraph';
  factory Paragraph.fromJson(Map<String, dynamic> json) =>
      _$ParagraphFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  Map<String, dynamic> toJson() {
    return _$ParagraphToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Paragraph);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'QuestionType.paragraph()';
  }
}

// dart format on
