// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'phone_login_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PhoneLoginResponse _$PhoneLoginResponseFromJson(Map<String, dynamic> json) {
  return _PhoneLoginResponse.fromJson(json);
}

/// @nodoc
class _$PhoneLoginResponseTearOff {
  const _$PhoneLoginResponseTearOff();

  _PhoneLoginResponse call(
      {@JsonKey(name: 'code') int? code,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'response') UserResponse? userResponse}) {
    return _PhoneLoginResponse(
      code: code,
      message: message,
      userResponse: userResponse,
    );
  }

  PhoneLoginResponse fromJson(Map<String, Object?> json) {
    return PhoneLoginResponse.fromJson(json);
  }
}

/// @nodoc
const $PhoneLoginResponse = _$PhoneLoginResponseTearOff();

/// @nodoc
mixin _$PhoneLoginResponse {
  @JsonKey(name: 'code')
  int? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'response')
  UserResponse? get userResponse => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhoneLoginResponseCopyWith<PhoneLoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneLoginResponseCopyWith<$Res> {
  factory $PhoneLoginResponseCopyWith(
          PhoneLoginResponse value, $Res Function(PhoneLoginResponse) then) =
      _$PhoneLoginResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'code') int? code,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'response') UserResponse? userResponse});

  $UserResponseCopyWith<$Res>? get userResponse;
}

/// @nodoc
class _$PhoneLoginResponseCopyWithImpl<$Res>
    implements $PhoneLoginResponseCopyWith<$Res> {
  _$PhoneLoginResponseCopyWithImpl(this._value, this._then);

  final PhoneLoginResponse _value;
  // ignore: unused_field
  final $Res Function(PhoneLoginResponse) _then;

  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
    Object? userResponse = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      userResponse: userResponse == freezed
          ? _value.userResponse
          : userResponse // ignore: cast_nullable_to_non_nullable
              as UserResponse?,
    ));
  }

  @override
  $UserResponseCopyWith<$Res>? get userResponse {
    if (_value.userResponse == null) {
      return null;
    }

    return $UserResponseCopyWith<$Res>(_value.userResponse!, (value) {
      return _then(_value.copyWith(userResponse: value));
    });
  }
}

/// @nodoc
abstract class _$PhoneLoginResponseCopyWith<$Res>
    implements $PhoneLoginResponseCopyWith<$Res> {
  factory _$PhoneLoginResponseCopyWith(
          _PhoneLoginResponse value, $Res Function(_PhoneLoginResponse) then) =
      __$PhoneLoginResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'code') int? code,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'response') UserResponse? userResponse});

  @override
  $UserResponseCopyWith<$Res>? get userResponse;
}

/// @nodoc
class __$PhoneLoginResponseCopyWithImpl<$Res>
    extends _$PhoneLoginResponseCopyWithImpl<$Res>
    implements _$PhoneLoginResponseCopyWith<$Res> {
  __$PhoneLoginResponseCopyWithImpl(
      _PhoneLoginResponse _value, $Res Function(_PhoneLoginResponse) _then)
      : super(_value, (v) => _then(v as _PhoneLoginResponse));

  @override
  _PhoneLoginResponse get _value => super._value as _PhoneLoginResponse;

  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
    Object? userResponse = freezed,
  }) {
    return _then(_PhoneLoginResponse(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      userResponse: userResponse == freezed
          ? _value.userResponse
          : userResponse // ignore: cast_nullable_to_non_nullable
              as UserResponse?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PhoneLoginResponse implements _PhoneLoginResponse {
  _$_PhoneLoginResponse(
      {@JsonKey(name: 'code') this.code,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'response') this.userResponse});

  factory _$_PhoneLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$$_PhoneLoginResponseFromJson(json);

  @override
  @JsonKey(name: 'code')
  final int? code;
  @override
  @JsonKey(name: 'message')
  final String? message;
  @override
  @JsonKey(name: 'response')
  final UserResponse? userResponse;

  @override
  String toString() {
    return 'PhoneLoginResponse(code: $code, message: $message, userResponse: $userResponse)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PhoneLoginResponse &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality()
                .equals(other.userResponse, userResponse));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(userResponse));

  @JsonKey(ignore: true)
  @override
  _$PhoneLoginResponseCopyWith<_PhoneLoginResponse> get copyWith =>
      __$PhoneLoginResponseCopyWithImpl<_PhoneLoginResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PhoneLoginResponseToJson(this);
  }
}

abstract class _PhoneLoginResponse implements PhoneLoginResponse {
  factory _PhoneLoginResponse(
          {@JsonKey(name: 'code') int? code,
          @JsonKey(name: 'message') String? message,
          @JsonKey(name: 'response') UserResponse? userResponse}) =
      _$_PhoneLoginResponse;

  factory _PhoneLoginResponse.fromJson(Map<String, dynamic> json) =
      _$_PhoneLoginResponse.fromJson;

  @override
  @JsonKey(name: 'code')
  int? get code;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'response')
  UserResponse? get userResponse;
  @override
  @JsonKey(ignore: true)
  _$PhoneLoginResponseCopyWith<_PhoneLoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
