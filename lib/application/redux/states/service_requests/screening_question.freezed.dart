// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'screening_question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScreeningQuestion _$ScreeningQuestionFromJson(Map<String, dynamic> json) {
  return _ScreeningQuestion.fromJson(json);
}

/// @nodoc
mixin _$ScreeningQuestion {
  String? get questionText => throw _privateConstructorUsedError;
  String? get answer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScreeningQuestionCopyWith<ScreeningQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScreeningQuestionCopyWith<$Res> {
  factory $ScreeningQuestionCopyWith(
          ScreeningQuestion value, $Res Function(ScreeningQuestion) then) =
      _$ScreeningQuestionCopyWithImpl<$Res>;
  $Res call({String? questionText, String? answer});
}

/// @nodoc
class _$ScreeningQuestionCopyWithImpl<$Res>
    implements $ScreeningQuestionCopyWith<$Res> {
  _$ScreeningQuestionCopyWithImpl(this._value, this._then);

  final ScreeningQuestion _value;
  // ignore: unused_field
  final $Res Function(ScreeningQuestion) _then;

  @override
  $Res call({
    Object? questionText = freezed,
    Object? answer = freezed,
  }) {
    return _then(_value.copyWith(
      questionText: questionText == freezed
          ? _value.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String?,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ScreeningQuestionCopyWith<$Res>
    implements $ScreeningQuestionCopyWith<$Res> {
  factory _$$_ScreeningQuestionCopyWith(_$_ScreeningQuestion value,
          $Res Function(_$_ScreeningQuestion) then) =
      __$$_ScreeningQuestionCopyWithImpl<$Res>;
  @override
  $Res call({String? questionText, String? answer});
}

/// @nodoc
class __$$_ScreeningQuestionCopyWithImpl<$Res>
    extends _$ScreeningQuestionCopyWithImpl<$Res>
    implements _$$_ScreeningQuestionCopyWith<$Res> {
  __$$_ScreeningQuestionCopyWithImpl(
      _$_ScreeningQuestion _value, $Res Function(_$_ScreeningQuestion) _then)
      : super(_value, (v) => _then(v as _$_ScreeningQuestion));

  @override
  _$_ScreeningQuestion get _value => super._value as _$_ScreeningQuestion;

  @override
  $Res call({
    Object? questionText = freezed,
    Object? answer = freezed,
  }) {
    return _then(_$_ScreeningQuestion(
      questionText: questionText == freezed
          ? _value.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String?,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScreeningQuestion implements _ScreeningQuestion {
  _$_ScreeningQuestion({this.questionText, this.answer});

  factory _$_ScreeningQuestion.fromJson(Map<String, dynamic> json) =>
      _$$_ScreeningQuestionFromJson(json);

  @override
  final String? questionText;
  @override
  final String? answer;

  @override
  String toString() {
    return 'ScreeningQuestion(questionText: $questionText, answer: $answer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScreeningQuestion &&
            const DeepCollectionEquality()
                .equals(other.questionText, questionText) &&
            const DeepCollectionEquality().equals(other.answer, answer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(questionText),
      const DeepCollectionEquality().hash(answer));

  @JsonKey(ignore: true)
  @override
  _$$_ScreeningQuestionCopyWith<_$_ScreeningQuestion> get copyWith =>
      __$$_ScreeningQuestionCopyWithImpl<_$_ScreeningQuestion>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScreeningQuestionToJson(this);
  }
}

abstract class _ScreeningQuestion implements ScreeningQuestion {
  factory _ScreeningQuestion(
      {final String? questionText,
      final String? answer}) = _$_ScreeningQuestion;

  factory _ScreeningQuestion.fromJson(Map<String, dynamic> json) =
      _$_ScreeningQuestion.fromJson;

  @override
  String? get questionText => throw _privateConstructorUsedError;
  @override
  String? get answer => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ScreeningQuestionCopyWith<_$_ScreeningQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}
