// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserState _$UserStateFromJson(Map<String, dynamic> json) {
  return _UserState.fromJson(json);
}

/// @nodoc
class _$UserStateTearOff {
  const _$UserStateTearOff();

  _UserState call(
      {UserProfile? userProfile,
      Customer? customerProfile,
      CommunicationSettings? communicationSettings,
      AuthCredentialResponse? auth,
      bool? isSignedIn,
      String? signedInTime,
      String? inActivitySetInTime,
      String? tokenExpiryTime}) {
    return _UserState(
      userProfile: userProfile,
      customerProfile: customerProfile,
      communicationSettings: communicationSettings,
      auth: auth,
      isSignedIn: isSignedIn,
      signedInTime: signedInTime,
      inActivitySetInTime: inActivitySetInTime,
      tokenExpiryTime: tokenExpiryTime,
    );
  }

  UserState fromJson(Map<String, Object> json) {
    return UserState.fromJson(json);
  }
}

/// @nodoc
const $UserState = _$UserStateTearOff();

/// @nodoc
mixin _$UserState {
// sourced from the response fo login
  UserProfile? get userProfile => throw _privateConstructorUsedError;
  Customer? get customerProfile => throw _privateConstructorUsedError;
  CommunicationSettings? get communicationSettings =>
      throw _privateConstructorUsedError;
  AuthCredentialResponse? get auth =>
      throw _privateConstructorUsedError; // generate from the app
  bool? get isSignedIn => throw _privateConstructorUsedError;
  String? get signedInTime => throw _privateConstructorUsedError;
  String? get inActivitySetInTime => throw _privateConstructorUsedError;
  String? get tokenExpiryTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserStateCopyWith<UserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res>;
  $Res call(
      {UserProfile? userProfile,
      Customer? customerProfile,
      CommunicationSettings? communicationSettings,
      AuthCredentialResponse? auth,
      bool? isSignedIn,
      String? signedInTime,
      String? inActivitySetInTime,
      String? tokenExpiryTime});

  $UserProfileCopyWith<$Res>? get userProfile;
  $CustomerCopyWith<$Res>? get customerProfile;
  $CommunicationSettingsCopyWith<$Res>? get communicationSettings;
  $AuthCredentialResponseCopyWith<$Res>? get auth;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res> implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  final UserState _value;
  // ignore: unused_field
  final $Res Function(UserState) _then;

  @override
  $Res call({
    Object? userProfile = freezed,
    Object? customerProfile = freezed,
    Object? communicationSettings = freezed,
    Object? auth = freezed,
    Object? isSignedIn = freezed,
    Object? signedInTime = freezed,
    Object? inActivitySetInTime = freezed,
    Object? tokenExpiryTime = freezed,
  }) {
    return _then(_value.copyWith(
      userProfile: userProfile == freezed
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile?,
      customerProfile: customerProfile == freezed
          ? _value.customerProfile
          : customerProfile // ignore: cast_nullable_to_non_nullable
              as Customer?,
      communicationSettings: communicationSettings == freezed
          ? _value.communicationSettings
          : communicationSettings // ignore: cast_nullable_to_non_nullable
              as CommunicationSettings?,
      auth: auth == freezed
          ? _value.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as AuthCredentialResponse?,
      isSignedIn: isSignedIn == freezed
          ? _value.isSignedIn
          : isSignedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      signedInTime: signedInTime == freezed
          ? _value.signedInTime
          : signedInTime // ignore: cast_nullable_to_non_nullable
              as String?,
      inActivitySetInTime: inActivitySetInTime == freezed
          ? _value.inActivitySetInTime
          : inActivitySetInTime // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenExpiryTime: tokenExpiryTime == freezed
          ? _value.tokenExpiryTime
          : tokenExpiryTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $UserProfileCopyWith<$Res>? get userProfile {
    if (_value.userProfile == null) {
      return null;
    }

    return $UserProfileCopyWith<$Res>(_value.userProfile!, (value) {
      return _then(_value.copyWith(userProfile: value));
    });
  }

  @override
  $CustomerCopyWith<$Res>? get customerProfile {
    if (_value.customerProfile == null) {
      return null;
    }

    return $CustomerCopyWith<$Res>(_value.customerProfile!, (value) {
      return _then(_value.copyWith(customerProfile: value));
    });
  }

  @override
  $CommunicationSettingsCopyWith<$Res>? get communicationSettings {
    if (_value.communicationSettings == null) {
      return null;
    }

    return $CommunicationSettingsCopyWith<$Res>(_value.communicationSettings!,
        (value) {
      return _then(_value.copyWith(communicationSettings: value));
    });
  }

  @override
  $AuthCredentialResponseCopyWith<$Res>? get auth {
    if (_value.auth == null) {
      return null;
    }

    return $AuthCredentialResponseCopyWith<$Res>(_value.auth!, (value) {
      return _then(_value.copyWith(auth: value));
    });
  }
}

/// @nodoc
abstract class _$UserStateCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory _$UserStateCopyWith(
          _UserState value, $Res Function(_UserState) then) =
      __$UserStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {UserProfile? userProfile,
      Customer? customerProfile,
      CommunicationSettings? communicationSettings,
      AuthCredentialResponse? auth,
      bool? isSignedIn,
      String? signedInTime,
      String? inActivitySetInTime,
      String? tokenExpiryTime});

  @override
  $UserProfileCopyWith<$Res>? get userProfile;
  @override
  $CustomerCopyWith<$Res>? get customerProfile;
  @override
  $CommunicationSettingsCopyWith<$Res>? get communicationSettings;
  @override
  $AuthCredentialResponseCopyWith<$Res>? get auth;
}

/// @nodoc
class __$UserStateCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$UserStateCopyWith<$Res> {
  __$UserStateCopyWithImpl(_UserState _value, $Res Function(_UserState) _then)
      : super(_value, (v) => _then(v as _UserState));

  @override
  _UserState get _value => super._value as _UserState;

  @override
  $Res call({
    Object? userProfile = freezed,
    Object? customerProfile = freezed,
    Object? communicationSettings = freezed,
    Object? auth = freezed,
    Object? isSignedIn = freezed,
    Object? signedInTime = freezed,
    Object? inActivitySetInTime = freezed,
    Object? tokenExpiryTime = freezed,
  }) {
    return _then(_UserState(
      userProfile: userProfile == freezed
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile?,
      customerProfile: customerProfile == freezed
          ? _value.customerProfile
          : customerProfile // ignore: cast_nullable_to_non_nullable
              as Customer?,
      communicationSettings: communicationSettings == freezed
          ? _value.communicationSettings
          : communicationSettings // ignore: cast_nullable_to_non_nullable
              as CommunicationSettings?,
      auth: auth == freezed
          ? _value.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as AuthCredentialResponse?,
      isSignedIn: isSignedIn == freezed
          ? _value.isSignedIn
          : isSignedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      signedInTime: signedInTime == freezed
          ? _value.signedInTime
          : signedInTime // ignore: cast_nullable_to_non_nullable
              as String?,
      inActivitySetInTime: inActivitySetInTime == freezed
          ? _value.inActivitySetInTime
          : inActivitySetInTime // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenExpiryTime: tokenExpiryTime == freezed
          ? _value.tokenExpiryTime
          : tokenExpiryTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserState implements _UserState {
  _$_UserState(
      {this.userProfile,
      this.customerProfile,
      this.communicationSettings,
      this.auth,
      this.isSignedIn,
      this.signedInTime,
      this.inActivitySetInTime,
      this.tokenExpiryTime});

  factory _$_UserState.fromJson(Map<String, dynamic> json) =>
      _$_$_UserStateFromJson(json);

  @override // sourced from the response fo login
  final UserProfile? userProfile;
  @override
  final Customer? customerProfile;
  @override
  final CommunicationSettings? communicationSettings;
  @override
  final AuthCredentialResponse? auth;
  @override // generate from the app
  final bool? isSignedIn;
  @override
  final String? signedInTime;
  @override
  final String? inActivitySetInTime;
  @override
  final String? tokenExpiryTime;

  @override
  String toString() {
    return 'UserState(userProfile: $userProfile, customerProfile: $customerProfile, communicationSettings: $communicationSettings, auth: $auth, isSignedIn: $isSignedIn, signedInTime: $signedInTime, inActivitySetInTime: $inActivitySetInTime, tokenExpiryTime: $tokenExpiryTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserState &&
            (identical(other.userProfile, userProfile) ||
                const DeepCollectionEquality()
                    .equals(other.userProfile, userProfile)) &&
            (identical(other.customerProfile, customerProfile) ||
                const DeepCollectionEquality()
                    .equals(other.customerProfile, customerProfile)) &&
            (identical(other.communicationSettings, communicationSettings) ||
                const DeepCollectionEquality().equals(
                    other.communicationSettings, communicationSettings)) &&
            (identical(other.auth, auth) ||
                const DeepCollectionEquality().equals(other.auth, auth)) &&
            (identical(other.isSignedIn, isSignedIn) ||
                const DeepCollectionEquality()
                    .equals(other.isSignedIn, isSignedIn)) &&
            (identical(other.signedInTime, signedInTime) ||
                const DeepCollectionEquality()
                    .equals(other.signedInTime, signedInTime)) &&
            (identical(other.inActivitySetInTime, inActivitySetInTime) ||
                const DeepCollectionEquality()
                    .equals(other.inActivitySetInTime, inActivitySetInTime)) &&
            (identical(other.tokenExpiryTime, tokenExpiryTime) ||
                const DeepCollectionEquality()
                    .equals(other.tokenExpiryTime, tokenExpiryTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userProfile) ^
      const DeepCollectionEquality().hash(customerProfile) ^
      const DeepCollectionEquality().hash(communicationSettings) ^
      const DeepCollectionEquality().hash(auth) ^
      const DeepCollectionEquality().hash(isSignedIn) ^
      const DeepCollectionEquality().hash(signedInTime) ^
      const DeepCollectionEquality().hash(inActivitySetInTime) ^
      const DeepCollectionEquality().hash(tokenExpiryTime);

  @JsonKey(ignore: true)
  @override
  _$UserStateCopyWith<_UserState> get copyWith =>
      __$UserStateCopyWithImpl<_UserState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserStateToJson(this);
  }
}

abstract class _UserState implements UserState {
  factory _UserState(
      {UserProfile? userProfile,
      Customer? customerProfile,
      CommunicationSettings? communicationSettings,
      AuthCredentialResponse? auth,
      bool? isSignedIn,
      String? signedInTime,
      String? inActivitySetInTime,
      String? tokenExpiryTime}) = _$_UserState;

  factory _UserState.fromJson(Map<String, dynamic> json) =
      _$_UserState.fromJson;

  @override // sourced from the response fo login
  UserProfile? get userProfile => throw _privateConstructorUsedError;
  @override
  Customer? get customerProfile => throw _privateConstructorUsedError;
  @override
  CommunicationSettings? get communicationSettings =>
      throw _privateConstructorUsedError;
  @override
  AuthCredentialResponse? get auth => throw _privateConstructorUsedError;
  @override // generate from the app
  bool? get isSignedIn => throw _privateConstructorUsedError;
  @override
  String? get signedInTime => throw _privateConstructorUsedError;
  @override
  String? get inActivitySetInTime => throw _privateConstructorUsedError;
  @override
  String? get tokenExpiryTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserStateCopyWith<_UserState> get copyWith =>
      throw _privateConstructorUsedError;
}
