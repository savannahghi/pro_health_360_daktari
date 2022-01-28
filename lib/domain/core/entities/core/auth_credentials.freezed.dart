// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'auth_credentials.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthCredentials _$AuthCredentialsFromJson(Map<String, dynamic> json) {
  return _AuthCredentials.fromJson(json);
}

/// @nodoc
class _$AuthCredentialsTearOff {
  const _$AuthCredentialsTearOff();

  _AuthCredentials call(
      {@JsonKey(name: 'idToken') String? idToken,
      @JsonKey(name: 'expiresIn') String? expiresIn,
      @JsonKey(name: 'refreshToken') String? refreshToken,
      @JsonKey(name: 'tokenExpiryTimestamp') String? tokenExpiryTimestamp,
      bool? isSignedIn,
      String? signedInTime}) {
    return _AuthCredentials(
      idToken: idToken,
      expiresIn: expiresIn,
      refreshToken: refreshToken,
      tokenExpiryTimestamp: tokenExpiryTimestamp,
      isSignedIn: isSignedIn,
      signedInTime: signedInTime,
    );
  }

  AuthCredentials fromJson(Map<String, Object> json) {
    return AuthCredentials.fromJson(json);
  }
}

/// @nodoc
const $AuthCredentials = _$AuthCredentialsTearOff();

/// @nodoc
mixin _$AuthCredentials {
  @JsonKey(name: 'idToken')
  String? get idToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiresIn')
  String? get expiresIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'refreshToken')
  String? get refreshToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'tokenExpiryTimestamp')
  String? get tokenExpiryTimestamp =>
      throw _privateConstructorUsedError; // Other supporting fields that are not returned by the backend
  bool? get isSignedIn => throw _privateConstructorUsedError;
  String? get signedInTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthCredentialsCopyWith<AuthCredentials> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthCredentialsCopyWith<$Res> {
  factory $AuthCredentialsCopyWith(
          AuthCredentials value, $Res Function(AuthCredentials) then) =
      _$AuthCredentialsCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'idToken') String? idToken,
      @JsonKey(name: 'expiresIn') String? expiresIn,
      @JsonKey(name: 'refreshToken') String? refreshToken,
      @JsonKey(name: 'tokenExpiryTimestamp') String? tokenExpiryTimestamp,
      bool? isSignedIn,
      String? signedInTime});
}

/// @nodoc
class _$AuthCredentialsCopyWithImpl<$Res>
    implements $AuthCredentialsCopyWith<$Res> {
  _$AuthCredentialsCopyWithImpl(this._value, this._then);

  final AuthCredentials _value;
  // ignore: unused_field
  final $Res Function(AuthCredentials) _then;

  @override
  $Res call({
    Object? idToken = freezed,
    Object? expiresIn = freezed,
    Object? refreshToken = freezed,
    Object? tokenExpiryTimestamp = freezed,
    Object? isSignedIn = freezed,
    Object? signedInTime = freezed,
  }) {
    return _then(_value.copyWith(
      idToken: idToken == freezed
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresIn: expiresIn == freezed
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenExpiryTimestamp: tokenExpiryTimestamp == freezed
          ? _value.tokenExpiryTimestamp
          : tokenExpiryTimestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      isSignedIn: isSignedIn == freezed
          ? _value.isSignedIn
          : isSignedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      signedInTime: signedInTime == freezed
          ? _value.signedInTime
          : signedInTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$AuthCredentialsCopyWith<$Res>
    implements $AuthCredentialsCopyWith<$Res> {
  factory _$AuthCredentialsCopyWith(
          _AuthCredentials value, $Res Function(_AuthCredentials) then) =
      __$AuthCredentialsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'idToken') String? idToken,
      @JsonKey(name: 'expiresIn') String? expiresIn,
      @JsonKey(name: 'refreshToken') String? refreshToken,
      @JsonKey(name: 'tokenExpiryTimestamp') String? tokenExpiryTimestamp,
      bool? isSignedIn,
      String? signedInTime});
}

/// @nodoc
class __$AuthCredentialsCopyWithImpl<$Res>
    extends _$AuthCredentialsCopyWithImpl<$Res>
    implements _$AuthCredentialsCopyWith<$Res> {
  __$AuthCredentialsCopyWithImpl(
      _AuthCredentials _value, $Res Function(_AuthCredentials) _then)
      : super(_value, (v) => _then(v as _AuthCredentials));

  @override
  _AuthCredentials get _value => super._value as _AuthCredentials;

  @override
  $Res call({
    Object? idToken = freezed,
    Object? expiresIn = freezed,
    Object? refreshToken = freezed,
    Object? tokenExpiryTimestamp = freezed,
    Object? isSignedIn = freezed,
    Object? signedInTime = freezed,
  }) {
    return _then(_AuthCredentials(
      idToken: idToken == freezed
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresIn: expiresIn == freezed
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenExpiryTimestamp: tokenExpiryTimestamp == freezed
          ? _value.tokenExpiryTimestamp
          : tokenExpiryTimestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      isSignedIn: isSignedIn == freezed
          ? _value.isSignedIn
          : isSignedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      signedInTime: signedInTime == freezed
          ? _value.signedInTime
          : signedInTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthCredentials implements _AuthCredentials {
  _$_AuthCredentials(
      {@JsonKey(name: 'idToken') this.idToken,
      @JsonKey(name: 'expiresIn') this.expiresIn,
      @JsonKey(name: 'refreshToken') this.refreshToken,
      @JsonKey(name: 'tokenExpiryTimestamp') this.tokenExpiryTimestamp,
      this.isSignedIn,
      this.signedInTime});

  factory _$_AuthCredentials.fromJson(Map<String, dynamic> json) =>
      _$_$_AuthCredentialsFromJson(json);

  @override
  @JsonKey(name: 'idToken')
  final String? idToken;
  @override
  @JsonKey(name: 'expiresIn')
  final String? expiresIn;
  @override
  @JsonKey(name: 'refreshToken')
  final String? refreshToken;
  @override
  @JsonKey(name: 'tokenExpiryTimestamp')
  final String? tokenExpiryTimestamp;
  @override // Other supporting fields that are not returned by the backend
  final bool? isSignedIn;
  @override
  final String? signedInTime;

  @override
  String toString() {
    return 'AuthCredentials(idToken: $idToken, expiresIn: $expiresIn, refreshToken: $refreshToken, tokenExpiryTimestamp: $tokenExpiryTimestamp, isSignedIn: $isSignedIn, signedInTime: $signedInTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthCredentials &&
            (identical(other.idToken, idToken) ||
                const DeepCollectionEquality()
                    .equals(other.idToken, idToken)) &&
            (identical(other.expiresIn, expiresIn) ||
                const DeepCollectionEquality()
                    .equals(other.expiresIn, expiresIn)) &&
            (identical(other.refreshToken, refreshToken) ||
                const DeepCollectionEquality()
                    .equals(other.refreshToken, refreshToken)) &&
            (identical(other.tokenExpiryTimestamp, tokenExpiryTimestamp) ||
                const DeepCollectionEquality().equals(
                    other.tokenExpiryTimestamp, tokenExpiryTimestamp)) &&
            (identical(other.isSignedIn, isSignedIn) ||
                const DeepCollectionEquality()
                    .equals(other.isSignedIn, isSignedIn)) &&
            (identical(other.signedInTime, signedInTime) ||
                const DeepCollectionEquality()
                    .equals(other.signedInTime, signedInTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(idToken) ^
      const DeepCollectionEquality().hash(expiresIn) ^
      const DeepCollectionEquality().hash(refreshToken) ^
      const DeepCollectionEquality().hash(tokenExpiryTimestamp) ^
      const DeepCollectionEquality().hash(isSignedIn) ^
      const DeepCollectionEquality().hash(signedInTime);

  @JsonKey(ignore: true)
  @override
  _$AuthCredentialsCopyWith<_AuthCredentials> get copyWith =>
      __$AuthCredentialsCopyWithImpl<_AuthCredentials>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AuthCredentialsToJson(this);
  }
}

abstract class _AuthCredentials implements AuthCredentials {
  factory _AuthCredentials(
      {@JsonKey(name: 'idToken') String? idToken,
      @JsonKey(name: 'expiresIn') String? expiresIn,
      @JsonKey(name: 'refreshToken') String? refreshToken,
      @JsonKey(name: 'tokenExpiryTimestamp') String? tokenExpiryTimestamp,
      bool? isSignedIn,
      String? signedInTime}) = _$_AuthCredentials;

  factory _AuthCredentials.fromJson(Map<String, dynamic> json) =
      _$_AuthCredentials.fromJson;

  @override
  @JsonKey(name: 'idToken')
  String? get idToken => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'expiresIn')
  String? get expiresIn => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'refreshToken')
  String? get refreshToken => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'tokenExpiryTimestamp')
  String? get tokenExpiryTimestamp => throw _privateConstructorUsedError;
  @override // Other supporting fields that are not returned by the backend
  bool? get isSignedIn => throw _privateConstructorUsedError;
  @override
  String? get signedInTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AuthCredentialsCopyWith<_AuthCredentials> get copyWith =>
      throw _privateConstructorUsedError;
}
