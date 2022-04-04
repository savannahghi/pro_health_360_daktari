// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tb_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TBState _$TBStateFromJson(Map<String, dynamic> json) {
  return _TBState.fromJson(json);
}

/// @nodoc
class _$TBStateTearOff {
  const _$TBStateTearOff();

  _TBState call({List<ScreeningQuestionsList>? screeningQuestionItems}) {
    return _TBState(
      screeningQuestionItems: screeningQuestionItems,
    );
  }

  TBState fromJson(Map<String, Object?> json) {
    return TBState.fromJson(json);
  }
}

/// @nodoc
const $TBState = _$TBStateTearOff();

/// @nodoc
mixin _$TBState {
  List<ScreeningQuestionsList>? get screeningQuestionItems =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TBStateCopyWith<TBState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TBStateCopyWith<$Res> {
  factory $TBStateCopyWith(TBState value, $Res Function(TBState) then) =
      _$TBStateCopyWithImpl<$Res>;
  $Res call({List<ScreeningQuestionsList>? screeningQuestionItems});
}

/// @nodoc
class _$TBStateCopyWithImpl<$Res> implements $TBStateCopyWith<$Res> {
  _$TBStateCopyWithImpl(this._value, this._then);

  final TBState _value;
  // ignore: unused_field
  final $Res Function(TBState) _then;

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
abstract class _$TBStateCopyWith<$Res> implements $TBStateCopyWith<$Res> {
  factory _$TBStateCopyWith(_TBState value, $Res Function(_TBState) then) =
      __$TBStateCopyWithImpl<$Res>;
  @override
  $Res call({List<ScreeningQuestionsList>? screeningQuestionItems});
}

/// @nodoc
class __$TBStateCopyWithImpl<$Res> extends _$TBStateCopyWithImpl<$Res>
    implements _$TBStateCopyWith<$Res> {
  __$TBStateCopyWithImpl(_TBState _value, $Res Function(_TBState) _then)
      : super(_value, (v) => _then(v as _TBState));

  @override
  _TBState get _value => super._value as _TBState;

  @override
  $Res call({
    Object? screeningQuestionItems = freezed,
  }) {
    return _then(_TBState(
      screeningQuestionItems: screeningQuestionItems == freezed
          ? _value.screeningQuestionItems
          : screeningQuestionItems // ignore: cast_nullable_to_non_nullable
              as List<ScreeningQuestionsList>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TBState implements _TBState {
  _$_TBState({this.screeningQuestionItems});

  factory _$_TBState.fromJson(Map<String, dynamic> json) =>
      _$$_TBStateFromJson(json);

  @override
  final List<ScreeningQuestionsList>? screeningQuestionItems;

  @override
  String toString() {
    return 'TBState(screeningQuestionItems: $screeningQuestionItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TBState &&
            const DeepCollectionEquality()
                .equals(other.screeningQuestionItems, screeningQuestionItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(screeningQuestionItems));

  @JsonKey(ignore: true)
  @override
  _$TBStateCopyWith<_TBState> get copyWith =>
      __$TBStateCopyWithImpl<_TBState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TBStateToJson(this);
  }
}

abstract class _TBState implements TBState {
  factory _TBState({List<ScreeningQuestionsList>? screeningQuestionItems}) =
      _$_TBState;

  factory _TBState.fromJson(Map<String, dynamic> json) = _$_TBState.fromJson;

  @override
  List<ScreeningQuestionsList>? get screeningQuestionItems;
  @override
  @JsonKey(ignore: true)
  _$TBStateCopyWith<_TBState> get copyWith =>
      throw _privateConstructorUsedError;
}
