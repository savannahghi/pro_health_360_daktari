// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'alcohol_substance_use_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AlcoholSubstanceUseState _$AlcoholSubstanceUseStateFromJson(
    Map<String, dynamic> json) {
  return _AlcoholSubstanceUseState.fromJson(json);
}

/// @nodoc
class _$AlcoholSubstanceUseStateTearOff {
  const _$AlcoholSubstanceUseStateTearOff();

  _AlcoholSubstanceUseState call(
      {List<ScreeningQuestionsList>? screeningQuestionItems}) {
    return _AlcoholSubstanceUseState(
      screeningQuestionItems: screeningQuestionItems,
    );
  }

  AlcoholSubstanceUseState fromJson(Map<String, Object?> json) {
    return AlcoholSubstanceUseState.fromJson(json);
  }
}

/// @nodoc
const $AlcoholSubstanceUseState = _$AlcoholSubstanceUseStateTearOff();

/// @nodoc
mixin _$AlcoholSubstanceUseState {
  List<ScreeningQuestionsList>? get screeningQuestionItems =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlcoholSubstanceUseStateCopyWith<AlcoholSubstanceUseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlcoholSubstanceUseStateCopyWith<$Res> {
  factory $AlcoholSubstanceUseStateCopyWith(AlcoholSubstanceUseState value,
          $Res Function(AlcoholSubstanceUseState) then) =
      _$AlcoholSubstanceUseStateCopyWithImpl<$Res>;
  $Res call({List<ScreeningQuestionsList>? screeningQuestionItems});
}

/// @nodoc
class _$AlcoholSubstanceUseStateCopyWithImpl<$Res>
    implements $AlcoholSubstanceUseStateCopyWith<$Res> {
  _$AlcoholSubstanceUseStateCopyWithImpl(this._value, this._then);

  final AlcoholSubstanceUseState _value;
  // ignore: unused_field
  final $Res Function(AlcoholSubstanceUseState) _then;

  @override
  $Res call({
    Object? screeningQuestionItems = freezed,
  }) {
    return _then(_value.copyWith(
      screeningQuestionItems: screeningQuestionItems == freezed
          ? _value.screeningQuestionItems
          : screeningQuestionItems // ignore: cast_nullable_to_non_nullable
              as List<ScreeningQuestionsList>?,
    ));
  }
}

/// @nodoc
abstract class _$AlcoholSubstanceUseStateCopyWith<$Res>
    implements $AlcoholSubstanceUseStateCopyWith<$Res> {
  factory _$AlcoholSubstanceUseStateCopyWith(_AlcoholSubstanceUseState value,
          $Res Function(_AlcoholSubstanceUseState) then) =
      __$AlcoholSubstanceUseStateCopyWithImpl<$Res>;
  @override
  $Res call({List<ScreeningQuestionsList>? screeningQuestionItems});
}

/// @nodoc
class __$AlcoholSubstanceUseStateCopyWithImpl<$Res>
    extends _$AlcoholSubstanceUseStateCopyWithImpl<$Res>
    implements _$AlcoholSubstanceUseStateCopyWith<$Res> {
  __$AlcoholSubstanceUseStateCopyWithImpl(_AlcoholSubstanceUseState _value,
      $Res Function(_AlcoholSubstanceUseState) _then)
      : super(_value, (v) => _then(v as _AlcoholSubstanceUseState));

  @override
  _AlcoholSubstanceUseState get _value =>
      super._value as _AlcoholSubstanceUseState;

  @override
  $Res call({
    Object? screeningQuestionItems = freezed,
  }) {
    return _then(_AlcoholSubstanceUseState(
      screeningQuestionItems: screeningQuestionItems == freezed
          ? _value.screeningQuestionItems
          : screeningQuestionItems // ignore: cast_nullable_to_non_nullable
              as List<ScreeningQuestionsList>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AlcoholSubstanceUseState implements _AlcoholSubstanceUseState {
  _$_AlcoholSubstanceUseState({this.screeningQuestionItems});

  factory _$_AlcoholSubstanceUseState.fromJson(Map<String, dynamic> json) =>
      _$$_AlcoholSubstanceUseStateFromJson(json);

  @override
  final List<ScreeningQuestionsList>? screeningQuestionItems;

  @override
  String toString() {
    return 'AlcoholSubstanceUseState(screeningQuestionItems: $screeningQuestionItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AlcoholSubstanceUseState &&
            const DeepCollectionEquality()
                .equals(other.screeningQuestionItems, screeningQuestionItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(screeningQuestionItems));

  @JsonKey(ignore: true)
  @override
  _$AlcoholSubstanceUseStateCopyWith<_AlcoholSubstanceUseState> get copyWith =>
      __$AlcoholSubstanceUseStateCopyWithImpl<_AlcoholSubstanceUseState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AlcoholSubstanceUseStateToJson(this);
  }
}

abstract class _AlcoholSubstanceUseState implements AlcoholSubstanceUseState {
  factory _AlcoholSubstanceUseState(
          {List<ScreeningQuestionsList>? screeningQuestionItems}) =
      _$_AlcoholSubstanceUseState;

  factory _AlcoholSubstanceUseState.fromJson(Map<String, dynamic> json) =
      _$_AlcoholSubstanceUseState.fromJson;

  @override
  List<ScreeningQuestionsList>? get screeningQuestionItems;
  @override
  @JsonKey(ignore: true)
  _$AlcoholSubstanceUseStateCopyWith<_AlcoholSubstanceUseState> get copyWith =>
      throw _privateConstructorUsedError;
}
