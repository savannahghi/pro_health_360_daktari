// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'misc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MiscState _$MiscStateFromJson(Map<String, dynamic> json) {
  return _MiscState.fromJson(json);
}

/// @nodoc
class _$MiscStateTearOff {
  const _$MiscStateTearOff();

  _MiscState call({String? initialRoute, String? error}) {
    return _MiscState(
      initialRoute: initialRoute,
      error: error,
    );
  }

  MiscState fromJson(Map<String, Object> json) {
    return MiscState.fromJson(json);
  }
}

/// @nodoc
const $MiscState = _$MiscStateTearOff();

/// @nodoc
mixin _$MiscState {
  String? get initialRoute => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MiscStateCopyWith<MiscState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MiscStateCopyWith<$Res> {
  factory $MiscStateCopyWith(MiscState value, $Res Function(MiscState) then) =
      _$MiscStateCopyWithImpl<$Res>;
  $Res call({String? initialRoute, String? error});
}

/// @nodoc
class _$MiscStateCopyWithImpl<$Res> implements $MiscStateCopyWith<$Res> {
  _$MiscStateCopyWithImpl(this._value, this._then);

  final MiscState _value;
  // ignore: unused_field
  final $Res Function(MiscState) _then;

  @override
  $Res call({
    Object? initialRoute = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      initialRoute: initialRoute == freezed
          ? _value.initialRoute
          : initialRoute // ignore: cast_nullable_to_non_nullable
              as String?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$MiscStateCopyWith<$Res> implements $MiscStateCopyWith<$Res> {
  factory _$MiscStateCopyWith(
          _MiscState value, $Res Function(_MiscState) then) =
      __$MiscStateCopyWithImpl<$Res>;
  @override
  $Res call({String? initialRoute, String? error});
}

/// @nodoc
class __$MiscStateCopyWithImpl<$Res> extends _$MiscStateCopyWithImpl<$Res>
    implements _$MiscStateCopyWith<$Res> {
  __$MiscStateCopyWithImpl(_MiscState _value, $Res Function(_MiscState) _then)
      : super(_value, (v) => _then(v as _MiscState));

  @override
  _MiscState get _value => super._value as _MiscState;

  @override
  $Res call({
    Object? initialRoute = freezed,
    Object? error = freezed,
  }) {
    return _then(_MiscState(
      initialRoute: initialRoute == freezed
          ? _value.initialRoute
          : initialRoute // ignore: cast_nullable_to_non_nullable
              as String?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MiscState implements _MiscState {
  _$_MiscState({this.initialRoute, this.error});

  factory _$_MiscState.fromJson(Map<String, dynamic> json) =>
      _$_$_MiscStateFromJson(json);

  @override
  final String? initialRoute;
  @override
  final String? error;

  @override
  String toString() {
    return 'MiscState(initialRoute: $initialRoute, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MiscState &&
            (identical(other.initialRoute, initialRoute) ||
                const DeepCollectionEquality()
                    .equals(other.initialRoute, initialRoute)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(initialRoute) ^
      const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  _$MiscStateCopyWith<_MiscState> get copyWith =>
      __$MiscStateCopyWithImpl<_MiscState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MiscStateToJson(this);
  }
}

abstract class _MiscState implements MiscState {
  factory _MiscState({String? initialRoute, String? error}) = _$_MiscState;

  factory _MiscState.fromJson(Map<String, dynamic> json) =
      _$_MiscState.fromJson;

  @override
  String? get initialRoute => throw _privateConstructorUsedError;
  @override
  String? get error => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MiscStateCopyWith<_MiscState> get copyWith =>
      throw _privateConstructorUsedError;
}
