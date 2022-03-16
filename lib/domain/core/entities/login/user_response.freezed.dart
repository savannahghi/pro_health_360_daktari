// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) {
  return _UserResponse.fromJson(json);
}

/// @nodoc
class _$UserResponseTearOff {
  const _$UserResponseTearOff();

  _UserResponse call(
      {@JsonKey(name: 'credentials') AuthCredentials? credentials,
      @JsonKey(name: 'staffProfile') StaffState? staffState,
      @JsonKey(name: 'getStreamToken') String? streamToken}) {
    return _UserResponse(
      credentials: credentials,
      staffState: staffState,
      streamToken: streamToken,
    );
  }

  UserResponse fromJson(Map<String, Object?> json) {
    return UserResponse.fromJson(json);
  }
}

/// @nodoc
const $UserResponse = _$UserResponseTearOff();

/// @nodoc
mixin _$UserResponse {
  @JsonKey(name: 'credentials')
  AuthCredentials? get credentials => throw _privateConstructorUsedError;
  @JsonKey(name: 'staffProfile')
  StaffState? get staffState => throw _privateConstructorUsedError;
  @JsonKey(name: 'getStreamToken')
  String? get streamToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserResponseCopyWith<UserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserResponseCopyWith<$Res> {
  factory $UserResponseCopyWith(
          UserResponse value, $Res Function(UserResponse) then) =
      _$UserResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'credentials') AuthCredentials? credentials,
      @JsonKey(name: 'staffProfile') StaffState? staffState,
      @JsonKey(name: 'getStreamToken') String? streamToken});

  $AuthCredentialsCopyWith<$Res>? get credentials;
  $StaffStateCopyWith<$Res>? get staffState;
}

/// @nodoc
class _$UserResponseCopyWithImpl<$Res> implements $UserResponseCopyWith<$Res> {
  _$UserResponseCopyWithImpl(this._value, this._then);

  final UserResponse _value;
  // ignore: unused_field
  final $Res Function(UserResponse) _then;

  @override
  $Res call({
    Object? credentials = freezed,
    Object? staffState = freezed,
    Object? streamToken = freezed,
  }) {
    return _then(_value.copyWith(
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
abstract class _$UserResponseCopyWith<$Res>
    implements $UserResponseCopyWith<$Res> {
  factory _$UserResponseCopyWith(
          _UserResponse value, $Res Function(_UserResponse) then) =
      __$UserResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'credentials') AuthCredentials? credentials,
      @JsonKey(name: 'staffProfile') StaffState? staffState,
      @JsonKey(name: 'getStreamToken') String? streamToken});

  @override
  $AuthCredentialsCopyWith<$Res>? get credentials;
  @override
  $StaffStateCopyWith<$Res>? get staffState;
}

/// @nodoc
class __$UserResponseCopyWithImpl<$Res> extends _$UserResponseCopyWithImpl<$Res>
    implements _$UserResponseCopyWith<$Res> {
  __$UserResponseCopyWithImpl(
      _UserResponse _value, $Res Function(_UserResponse) _then)
      : super(_value, (v) => _then(v as _UserResponse));

  @override
  _UserResponse get _value => super._value as _UserResponse;

  @override
  $Res call({
    Object? credentials = freezed,
    Object? staffState = freezed,
    Object? streamToken = freezed,
  }) {
    return _then(_UserResponse(
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
class _$_UserResponse implements _UserResponse {
  _$_UserResponse(
      {@JsonKey(name: 'credentials') this.credentials,
      @JsonKey(name: 'staffProfile') this.staffState,
      @JsonKey(name: 'getStreamToken') this.streamToken});

  factory _$_UserResponse.fromJson(Map<String, dynamic> json) =>
      _$$_UserResponseFromJson(json);

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
    return 'UserResponse(credentials: $credentials, staffState: $staffState, streamToken: $streamToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserResponse &&
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
      const DeepCollectionEquality().hash(credentials),
      const DeepCollectionEquality().hash(staffState),
      const DeepCollectionEquality().hash(streamToken));

  @JsonKey(ignore: true)
  @override
  _$UserResponseCopyWith<_UserResponse> get copyWith =>
      __$UserResponseCopyWithImpl<_UserResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserResponseToJson(this);
  }
}

abstract class _UserResponse implements UserResponse {
  factory _UserResponse(
      {@JsonKey(name: 'credentials') AuthCredentials? credentials,
      @JsonKey(name: 'staffProfile') StaffState? staffState,
      @JsonKey(name: 'getStreamToken') String? streamToken}) = _$_UserResponse;

  factory _UserResponse.fromJson(Map<String, dynamic> json) =
      _$_UserResponse.fromJson;

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
  _$UserResponseCopyWith<_UserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
