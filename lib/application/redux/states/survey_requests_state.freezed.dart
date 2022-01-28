// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'survey_requests_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServiceRequestState _$ServiceRequestStateFromJson(Map<String, dynamic> json) {
  return _ServiceRequestState.fromJson(json);
}

/// @nodoc
class _$ServiceRequestStateTearOff {
  const _$ServiceRequestStateTearOff();

  _ServiceRequestState call() {
    return _ServiceRequestState();
  }

  ServiceRequestState fromJson(Map<String, Object> json) {
    return ServiceRequestState.fromJson(json);
  }
}

/// @nodoc
const $ServiceRequestState = _$ServiceRequestStateTearOff();

/// @nodoc
mixin _$ServiceRequestState {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceRequestStateCopyWith<$Res> {
  factory $ServiceRequestStateCopyWith(
          ServiceRequestState value, $Res Function(ServiceRequestState) then) =
      _$ServiceRequestStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ServiceRequestStateCopyWithImpl<$Res>
    implements $ServiceRequestStateCopyWith<$Res> {
  _$ServiceRequestStateCopyWithImpl(this._value, this._then);

  final ServiceRequestState _value;
  // ignore: unused_field
  final $Res Function(ServiceRequestState) _then;
}

/// @nodoc
abstract class _$ServiceRequestStateCopyWith<$Res> {
  factory _$ServiceRequestStateCopyWith(_ServiceRequestState value,
          $Res Function(_ServiceRequestState) then) =
      __$ServiceRequestStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$ServiceRequestStateCopyWithImpl<$Res>
    extends _$ServiceRequestStateCopyWithImpl<$Res>
    implements _$ServiceRequestStateCopyWith<$Res> {
  __$ServiceRequestStateCopyWithImpl(
      _ServiceRequestState _value, $Res Function(_ServiceRequestState) _then)
      : super(_value, (v) => _then(v as _ServiceRequestState));

  @override
  _ServiceRequestState get _value => super._value as _ServiceRequestState;
}

/// @nodoc
@JsonSerializable()
class _$_ServiceRequestState implements _ServiceRequestState {
  _$_ServiceRequestState();

  factory _$_ServiceRequestState.fromJson(Map<String, dynamic> json) =>
      _$_$_ServiceRequestStateFromJson(json);

  @override
  String toString() {
    return 'ServiceRequestState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ServiceRequestState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ServiceRequestStateToJson(this);
  }
}

abstract class _ServiceRequestState implements ServiceRequestState {
  factory _ServiceRequestState() = _$_ServiceRequestState;

  factory _ServiceRequestState.fromJson(Map<String, dynamic> json) =
      _$_ServiceRequestState.fromJson;
}
