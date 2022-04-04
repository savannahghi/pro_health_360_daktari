// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'screening_questions_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScreeningQuestionsList _$ScreeningQuestionsListFromJson(
    Map<String, dynamic> json) {
  return _ScreeningQuestionsList.fromJson(json);
}

/// @nodoc
class _$ScreeningQuestionsListTearOff {
  const _$ScreeningQuestionsListTearOff();

  _ScreeningQuestionsList call(
      {String? name,
      String? date,
      List<ScreeningQuestion>? screeningQuestionsList}) {
    return _ScreeningQuestionsList(
      name: name,
      date: date,
      screeningQuestionsList: screeningQuestionsList,
    );
  }

  ScreeningQuestionsList fromJson(Map<String, Object?> json) {
    return ScreeningQuestionsList.fromJson(json);
  }
}

/// @nodoc
const $ScreeningQuestionsList = _$ScreeningQuestionsListTearOff();

/// @nodoc
mixin _$ScreeningQuestionsList {
  String? get name => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  List<ScreeningQuestion>? get screeningQuestionsList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScreeningQuestionsListCopyWith<ScreeningQuestionsList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScreeningQuestionsListCopyWith<$Res> {
  factory $ScreeningQuestionsListCopyWith(ScreeningQuestionsList value,
          $Res Function(ScreeningQuestionsList) then) =
      _$ScreeningQuestionsListCopyWithImpl<$Res>;
  $Res call(
      {String? name,
      String? date,
      List<ScreeningQuestion>? screeningQuestionsList});
}

/// @nodoc
class _$ScreeningQuestionsListCopyWithImpl<$Res>
    implements $ScreeningQuestionsListCopyWith<$Res> {
  _$ScreeningQuestionsListCopyWithImpl(this._value, this._then);

  final ScreeningQuestionsList _value;
  // ignore: unused_field
  final $Res Function(ScreeningQuestionsList) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? date = freezed,
    Object? screeningQuestionsList = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      screeningQuestionsList: screeningQuestionsList == freezed
          ? _value.screeningQuestionsList
          : screeningQuestionsList // ignore: cast_nullable_to_non_nullable
              as List<ScreeningQuestion>?,
    ));
  }
}

/// @nodoc
abstract class _$ScreeningQuestionsListCopyWith<$Res>
    implements $ScreeningQuestionsListCopyWith<$Res> {
  factory _$ScreeningQuestionsListCopyWith(_ScreeningQuestionsList value,
          $Res Function(_ScreeningQuestionsList) then) =
      __$ScreeningQuestionsListCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? name,
      String? date,
      List<ScreeningQuestion>? screeningQuestionsList});
}

/// @nodoc
class __$ScreeningQuestionsListCopyWithImpl<$Res>
    extends _$ScreeningQuestionsListCopyWithImpl<$Res>
    implements _$ScreeningQuestionsListCopyWith<$Res> {
  __$ScreeningQuestionsListCopyWithImpl(_ScreeningQuestionsList _value,
      $Res Function(_ScreeningQuestionsList) _then)
      : super(_value, (v) => _then(v as _ScreeningQuestionsList));

  @override
  _ScreeningQuestionsList get _value => super._value as _ScreeningQuestionsList;

  @override
  $Res call({
    Object? name = freezed,
    Object? date = freezed,
    Object? screeningQuestionsList = freezed,
  }) {
    return _then(_ScreeningQuestionsList(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      screeningQuestionsList: screeningQuestionsList == freezed
          ? _value.screeningQuestionsList
          : screeningQuestionsList // ignore: cast_nullable_to_non_nullable
              as List<ScreeningQuestion>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScreeningQuestionsList implements _ScreeningQuestionsList {
  _$_ScreeningQuestionsList(
      {this.name, this.date, this.screeningQuestionsList});

  factory _$_ScreeningQuestionsList.fromJson(Map<String, dynamic> json) =>
      _$$_ScreeningQuestionsListFromJson(json);

  @override
  final String? name;
  @override
  final String? date;
  @override
  final List<ScreeningQuestion>? screeningQuestionsList;

  @override
  String toString() {
    return 'ScreeningQuestionsList(name: $name, date: $date, screeningQuestionsList: $screeningQuestionsList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScreeningQuestionsList &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality()
                .equals(other.screeningQuestionsList, screeningQuestionsList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(screeningQuestionsList));

  @JsonKey(ignore: true)
  @override
  _$ScreeningQuestionsListCopyWith<_ScreeningQuestionsList> get copyWith =>
      __$ScreeningQuestionsListCopyWithImpl<_ScreeningQuestionsList>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScreeningQuestionsListToJson(this);
  }
}

abstract class _ScreeningQuestionsList implements ScreeningQuestionsList {
  factory _ScreeningQuestionsList(
          {String? name,
          String? date,
          List<ScreeningQuestion>? screeningQuestionsList}) =
      _$_ScreeningQuestionsList;

  factory _ScreeningQuestionsList.fromJson(Map<String, dynamic> json) =
      _$_ScreeningQuestionsList.fromJson;

  @override
  String? get name;
  @override
  String? get date;
  @override
  List<ScreeningQuestion>? get screeningQuestionsList;
  @override
  @JsonKey(ignore: true)
  _$ScreeningQuestionsListCopyWith<_ScreeningQuestionsList> get copyWith =>
      throw _privateConstructorUsedError;
}
