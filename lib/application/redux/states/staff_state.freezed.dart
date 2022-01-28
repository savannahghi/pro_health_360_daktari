// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'staff_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StaffState _$StaffStateFromJson(Map<String, dynamic> json) {
  return _StaffState.fromJson(json);
}

/// @nodoc
class _$StaffStateTearOff {
  const _$StaffStateTearOff();

  _StaffState call({UserState? userState}) {
    return _StaffState(
      userState: userState,
    );
  }

  StaffState fromJson(Map<String, Object> json) {
    return StaffState.fromJson(json);
  }
}

/// @nodoc
const $StaffState = _$StaffStateTearOff();

/// @nodoc
mixin _$StaffState {
  UserState? get userState => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StaffStateCopyWith<StaffState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffStateCopyWith<$Res> {
  factory $StaffStateCopyWith(
          StaffState value, $Res Function(StaffState) then) =
      _$StaffStateCopyWithImpl<$Res>;
  $Res call({UserState? userState});

  $UserStateCopyWith<$Res>? get userState;
}

/// @nodoc
class _$StaffStateCopyWithImpl<$Res> implements $StaffStateCopyWith<$Res> {
  _$StaffStateCopyWithImpl(this._value, this._then);

  final StaffState _value;
  // ignore: unused_field
  final $Res Function(StaffState) _then;

  @override
  $Res call({
    Object? userState = freezed,
  }) {
    return _then(_value.copyWith(
      userState: userState == freezed
          ? _value.userState
          : userState // ignore: cast_nullable_to_non_nullable
              as UserState?,
    ));
  }

  @override
  $UserStateCopyWith<$Res>? get userState {
    if (_value.userState == null) {
      return null;
    }

    return $UserStateCopyWith<$Res>(_value.userState!, (value) {
      return _then(_value.copyWith(userState: value));
    });
  }
}

/// @nodoc
abstract class _$StaffStateCopyWith<$Res> implements $StaffStateCopyWith<$Res> {
  factory _$StaffStateCopyWith(
          _StaffState value, $Res Function(_StaffState) then) =
      __$StaffStateCopyWithImpl<$Res>;
  @override
  $Res call({UserState? userState});

  @override
  $UserStateCopyWith<$Res>? get userState;
}

/// @nodoc
class __$StaffStateCopyWithImpl<$Res> extends _$StaffStateCopyWithImpl<$Res>
    implements _$StaffStateCopyWith<$Res> {
  __$StaffStateCopyWithImpl(
      _StaffState _value, $Res Function(_StaffState) _then)
      : super(_value, (v) => _then(v as _StaffState));

  @override
  _StaffState get _value => super._value as _StaffState;

  @override
  $Res call({
    Object? userState = freezed,
  }) {
    return _then(_StaffState(
      userState: userState == freezed
          ? _value.userState
          : userState // ignore: cast_nullable_to_non_nullable
              as UserState?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StaffState implements _StaffState {
  _$_StaffState({this.userState});

  factory _$_StaffState.fromJson(Map<String, dynamic> json) =>
      _$_$_StaffStateFromJson(json);

  @override
  final UserState? userState;

  @override
  String toString() {
    return 'StaffState(userState: $userState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StaffState &&
            (identical(other.userState, userState) ||
                const DeepCollectionEquality()
                    .equals(other.userState, userState)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(userState);

  @JsonKey(ignore: true)
  @override
  _$StaffStateCopyWith<_StaffState> get copyWith =>
      __$StaffStateCopyWithImpl<_StaffState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StaffStateToJson(this);
  }
}

abstract class _StaffState implements StaffState {
  factory _StaffState({UserState? userState}) = _$_StaffState;

  factory _StaffState.fromJson(Map<String, dynamic> json) =
      _$_StaffState.fromJson;

  @override
  UserState? get userState => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StaffStateCopyWith<_StaffState> get copyWith =>
      throw _privateConstructorUsedError;
}
