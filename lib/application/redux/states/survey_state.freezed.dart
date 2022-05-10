// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'survey_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SurveyState _$SurveyStateFromJson(Map<String, dynamic> json) {
  return _SurveyState.fromJson(json);
}

/// @nodoc
class _$SurveyStateTearOff {
  const _$SurveyStateTearOff();

  _SurveyState call({List<Survey?>? surveys}) {
    return _SurveyState(
      surveys: surveys,
    );
  }

  SurveyState fromJson(Map<String, Object?> json) {
    return SurveyState.fromJson(json);
  }
}

/// @nodoc
const $SurveyState = _$SurveyStateTearOff();

/// @nodoc
mixin _$SurveyState {
  List<Survey?>? get surveys => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SurveyStateCopyWith<SurveyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyStateCopyWith<$Res> {
  factory $SurveyStateCopyWith(
          SurveyState value, $Res Function(SurveyState) then) =
      _$SurveyStateCopyWithImpl<$Res>;
  $Res call({List<Survey?>? surveys});
}

/// @nodoc
class _$SurveyStateCopyWithImpl<$Res> implements $SurveyStateCopyWith<$Res> {
  _$SurveyStateCopyWithImpl(this._value, this._then);

  final SurveyState _value;
  // ignore: unused_field
  final $Res Function(SurveyState) _then;

  @override
  $Res call({
    Object? surveys = freezed,
  }) {
    return _then(_value.copyWith(
      surveys: surveys == freezed
          ? _value.surveys
          : surveys // ignore: cast_nullable_to_non_nullable
              as List<Survey?>?,
    ));
  }
}

/// @nodoc
abstract class _$SurveyStateCopyWith<$Res>
    implements $SurveyStateCopyWith<$Res> {
  factory _$SurveyStateCopyWith(
          _SurveyState value, $Res Function(_SurveyState) then) =
      __$SurveyStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Survey?>? surveys});
}

/// @nodoc
class __$SurveyStateCopyWithImpl<$Res> extends _$SurveyStateCopyWithImpl<$Res>
    implements _$SurveyStateCopyWith<$Res> {
  __$SurveyStateCopyWithImpl(
      _SurveyState _value, $Res Function(_SurveyState) _then)
      : super(_value, (v) => _then(v as _SurveyState));

  @override
  _SurveyState get _value => super._value as _SurveyState;

  @override
  $Res call({
    Object? surveys = freezed,
  }) {
    return _then(_SurveyState(
      surveys: surveys == freezed
          ? _value.surveys
          : surveys // ignore: cast_nullable_to_non_nullable
              as List<Survey?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SurveyState implements _SurveyState {
  _$_SurveyState({this.surveys});

  factory _$_SurveyState.fromJson(Map<String, dynamic> json) =>
      _$$_SurveyStateFromJson(json);

  @override
  final List<Survey?>? surveys;

  @override
  String toString() {
    return 'SurveyState(surveys: $surveys)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SurveyState &&
            const DeepCollectionEquality().equals(other.surveys, surveys));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(surveys));

  @JsonKey(ignore: true)
  @override
  _$SurveyStateCopyWith<_SurveyState> get copyWith =>
      __$SurveyStateCopyWithImpl<_SurveyState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SurveyStateToJson(this);
  }
}

abstract class _SurveyState implements SurveyState {
  factory _SurveyState({List<Survey?>? surveys}) = _$_SurveyState;

  factory _SurveyState.fromJson(Map<String, dynamic> json) =
      _$_SurveyState.fromJson;

  @override
  List<Survey?>? get surveys;
  @override
  @JsonKey(ignore: true)
  _$SurveyStateCopyWith<_SurveyState> get copyWith =>
      throw _privateConstructorUsedError;
}
