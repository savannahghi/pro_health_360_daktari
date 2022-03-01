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
      @JsonKey(name: 'credentials') AuthCredentials? credentials,
      @JsonKey(name: 'staffProfile') StaffState? staffState,
      @JsonKey(name: 'getStreamToken') String? streamToken}) {
    return _PhoneLoginResponse(
      code: code,
      message: message,
      credentials: credentials,
      staffState: staffState,
      streamToken: streamToken,
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
  @JsonKey(name: 'credentials')
  AuthCredentials? get credentials => throw _privateConstructorUsedError;
  @JsonKey(name: 'staffProfile')
  StaffState? get staffState => throw _privateConstructorUsedError;
  @JsonKey(name: 'getStreamToken')
  String? get streamToken => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'credentials') AuthCredentials? credentials,
      @JsonKey(name: 'staffProfile') StaffState? staffState,
      @JsonKey(name: 'getStreamToken') String? streamToken});

  $AuthCredentialsCopyWith<$Res>? get credentials;
  $StaffStateCopyWith<$Res>? get staffState;
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
    Object? credentials = freezed,
    Object? staffState = freezed,
    Object? streamToken = freezed,
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
      credentials: credentials == freezed
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as AuthCredentials?,
      staffState: staffState == freezed
          ? _value.staffState
          : staffState // ignore: cast_nullable_to_non_nullable
              as StaffState?,
      streamToken: streamToken == freezed
          ? _value.streamToken
          : streamToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $AuthCredentialsCopyWith<$Res>? get credentials {
    if (_value.credentials == null) {
      return null;
    }

    return $AuthCredentialsCopyWith<$Res>(_value.credentials!, (value) {
      return _then(_value.copyWith(credentials: value));
    });
  }

  @override
  $StaffStateCopyWith<$Res>? get staffState {
    if (_value.staffState == null) {
      return null;
    }

    return $StaffStateCopyWith<$Res>(_value.staffState!, (value) {
      return _then(_value.copyWith(staffState: value));
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
      @JsonKey(name: 'credentials') AuthCredentials? credentials,
      @JsonKey(name: 'staffProfile') StaffState? staffState,
      @JsonKey(name: 'getStreamToken') String? streamToken});

  @override
  $AuthCredentialsCopyWith<$Res>? get credentials;
  @override
  $StaffStateCopyWith<$Res>? get staffState;
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
    Object? credentials = freezed,
    Object? staffState = freezed,
    Object? streamToken = freezed,
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
      credentials: credentials == freezed
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as AuthCredentials?,
      staffState: staffState == freezed
          ? _value.staffState
          : staffState // ignore: cast_nullable_to_non_nullable
              as StaffState?,
      streamToken: streamToken == freezed
          ? _value.streamToken
          : streamToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PhoneLoginResponse implements _PhoneLoginResponse {
  _$_PhoneLoginResponse(
      {@JsonKey(name: 'code') this.code,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'credentials') this.credentials,
      @JsonKey(name: 'staffProfile') this.staffState,
      @JsonKey(name: 'getStreamToken') this.streamToken});

  factory _$_PhoneLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$$_PhoneLoginResponseFromJson(json);

  @override
  @JsonKey(name: 'code')
  final int? code;
  @override
  @JsonKey(name: 'message')
  final String? message;
  @override
  @JsonKey(name: 'credentials')
  final AuthCredentials? credentials;
  @override
  @JsonKey(name: 'staffProfile')
  final StaffState? staffState;
  @override
  @JsonKey(name: 'getStreamToken')
  final String? streamToken;

  @override
  String toString() {
    return 'PhoneLoginResponse(code: $code, message: $message, credentials: $credentials, staffState: $staffState, streamToken: $streamToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PhoneLoginResponse &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality()
                .equals(other.credentials, credentials) &&
            const DeepCollectionEquality()
                .equals(other.staffState, staffState) &&
            const DeepCollectionEquality()
                .equals(other.streamToken, streamToken));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(credentials),
      const DeepCollectionEquality().hash(staffState),
      const DeepCollectionEquality().hash(streamToken));

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
          @JsonKey(name: 'credentials') AuthCredentials? credentials,
          @JsonKey(name: 'staffProfile') StaffState? staffState,
          @JsonKey(name: 'getStreamToken') String? streamToken}) =
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
  @JsonKey(name: 'credentials')
  AuthCredentials? get credentials;
  @override
  @JsonKey(name: 'staffProfile')
  StaffState? get staffState;
  @override
  @JsonKey(name: 'getStreamToken')
  String? get streamToken;
  @override
  @JsonKey(ignore: true)
  _$PhoneLoginResponseCopyWith<_PhoneLoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
