// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'create_pin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreatePINState _$CreatePINStateFromJson(Map<String, dynamic> json) {
  return _CreatePINState.fromJson(json);
}

/// @nodoc
class _$CreatePINStateTearOff {
  const _$CreatePINStateTearOff();

  _CreatePINState call({String? newPIN, String? confirmPIN}) {
    return _CreatePINState(
      newPIN: newPIN,
      confirmPIN: confirmPIN,
    );
  }

  CreatePINState fromJson(Map<String, Object> json) {
    return CreatePINState.fromJson(json);
  }
}

/// @nodoc
const $CreatePINState = _$CreatePINStateTearOff();

/// @nodoc
mixin _$CreatePINState {
  String? get newPIN => throw _privateConstructorUsedError;
  String? get confirmPIN => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreatePINStateCopyWith<CreatePINState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePINStateCopyWith<$Res> {
  factory $CreatePINStateCopyWith(
          CreatePINState value, $Res Function(CreatePINState) then) =
      _$CreatePINStateCopyWithImpl<$Res>;
  $Res call({String? newPIN, String? confirmPIN});
}

/// @nodoc
class _$CreatePINStateCopyWithImpl<$Res>
    implements $CreatePINStateCopyWith<$Res> {
  _$CreatePINStateCopyWithImpl(this._value, this._then);

  final CreatePINState _value;
  // ignore: unused_field
  final $Res Function(CreatePINState) _then;

  @override
  $Res call({
    Object? newPIN = freezed,
    Object? confirmPIN = freezed,
  }) {
    return _then(_value.copyWith(
      newPIN: newPIN == freezed
          ? _value.newPIN
          : newPIN // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPIN: confirmPIN == freezed
          ? _value.confirmPIN
          : confirmPIN // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$CreatePINStateCopyWith<$Res>
    implements $CreatePINStateCopyWith<$Res> {
  factory _$CreatePINStateCopyWith(
          _CreatePINState value, $Res Function(_CreatePINState) then) =
      __$CreatePINStateCopyWithImpl<$Res>;
  @override
  $Res call({String? newPIN, String? confirmPIN});
}

/// @nodoc
class __$CreatePINStateCopyWithImpl<$Res>
    extends _$CreatePINStateCopyWithImpl<$Res>
    implements _$CreatePINStateCopyWith<$Res> {
  __$CreatePINStateCopyWithImpl(
      _CreatePINState _value, $Res Function(_CreatePINState) _then)
      : super(_value, (v) => _then(v as _CreatePINState));

  @override
  _CreatePINState get _value => super._value as _CreatePINState;

  @override
  $Res call({
    Object? newPIN = freezed,
    Object? confirmPIN = freezed,
  }) {
    return _then(_CreatePINState(
      newPIN: newPIN == freezed
          ? _value.newPIN
          : newPIN // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPIN: confirmPIN == freezed
          ? _value.confirmPIN
          : confirmPIN // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreatePINState implements _CreatePINState {
  _$_CreatePINState({this.newPIN, this.confirmPIN});

  factory _$_CreatePINState.fromJson(Map<String, dynamic> json) =>
      _$_$_CreatePINStateFromJson(json);

  @override
  final String? newPIN;
  @override
  final String? confirmPIN;

  @override
  String toString() {
    return 'CreatePINState(newPIN: $newPIN, confirmPIN: $confirmPIN)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CreatePINState &&
            (identical(other.newPIN, newPIN) ||
                const DeepCollectionEquality().equals(other.newPIN, newPIN)) &&
            (identical(other.confirmPIN, confirmPIN) ||
                const DeepCollectionEquality()
                    .equals(other.confirmPIN, confirmPIN)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(newPIN) ^
      const DeepCollectionEquality().hash(confirmPIN);

  @JsonKey(ignore: true)
  @override
  _$CreatePINStateCopyWith<_CreatePINState> get copyWith =>
      __$CreatePINStateCopyWithImpl<_CreatePINState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CreatePINStateToJson(this);
  }
}

abstract class _CreatePINState implements CreatePINState {
  factory _CreatePINState({String? newPIN, String? confirmPIN}) =
      _$_CreatePINState;

  factory _CreatePINState.fromJson(Map<String, dynamic> json) =
      _$_CreatePINState.fromJson;

  @override
  String? get newPIN => throw _privateConstructorUsedError;
  @override
  String? get confirmPIN => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CreatePINStateCopyWith<_CreatePINState> get copyWith =>
      throw _privateConstructorUsedError;
}
