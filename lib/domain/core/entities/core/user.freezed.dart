// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: 'userID')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'userName')
  String? get username =>
      throw _privateConstructorUsedError; // This is the nickname
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'firstName')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'lastName')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'userType')
  String? get userType => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
  Gender? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'primaryContact')
  Contact? get primaryContact => throw _privateConstructorUsedError;
  @JsonKey(name: 'lastSuccessfulLogin')
  String? get lastSuccessfulLogin => throw _privateConstructorUsedError;
  @JsonKey(name: 'lastFailedLogin')
  String? get lastFailedLogin => throw _privateConstructorUsedError;
  @JsonKey(name: 'failedLoginCount')
  int? get failedLoginCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'nextAllowedLogin')
  String? get nextAllowedLogin => throw _privateConstructorUsedError;
  @JsonKey(name: 'pinChangeRequired')
  bool? get pinChangeRequired => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasSetPin')
  bool? get hasSetPin => throw _privateConstructorUsedError;
  @JsonKey(name: 'isPhoneVerified')
  bool? get isPhoneVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasSetSecurityQuestions')
  bool? get hasSetSecurityQuestions => throw _privateConstructorUsedError;
  @JsonKey(name: 'termsAccepted')
  bool? get termsAccepted => throw _privateConstructorUsedError;
  @JsonKey(name: 'acceptedTermsID')
  int? get acceptedTermsID => throw _privateConstructorUsedError;
  @JsonKey(name: 'suspended')
  bool? get suspended => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar')
  String? get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'roles')
  List<Role>? get roles => throw _privateConstructorUsedError;

  /// Used to indicate that the user's PIN has been reset by someone else
  ///
  /// This is used to trigger the change PIN workflow
  @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
  bool? get pinUpdateRequired => throw _privateConstructorUsedError;
  String? get chatRoomToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'userID')
          String? userId,
      @JsonKey(name: 'userName')
          String? username,
      @JsonKey(name: 'name')
          String? name,
      @JsonKey(name: 'firstName')
          String? firstName,
      @JsonKey(name: 'lastName')
          String? lastName,
      @JsonKey(name: 'userType')
          String? userType,
      @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
          Gender? gender,
      @JsonKey(name: 'active', defaultValue: false)
          bool? active,
      @JsonKey(name: 'primaryContact')
          Contact? primaryContact,
      @JsonKey(name: 'lastSuccessfulLogin')
          String? lastSuccessfulLogin,
      @JsonKey(name: 'lastFailedLogin')
          String? lastFailedLogin,
      @JsonKey(name: 'failedLoginCount')
          int? failedLoginCount,
      @JsonKey(name: 'nextAllowedLogin')
          String? nextAllowedLogin,
      @JsonKey(name: 'pinChangeRequired')
          bool? pinChangeRequired,
      @JsonKey(name: 'hasSetPin')
          bool? hasSetPin,
      @JsonKey(name: 'isPhoneVerified')
          bool? isPhoneVerified,
      @JsonKey(name: 'hasSetSecurityQuestions')
          bool? hasSetSecurityQuestions,
      @JsonKey(name: 'termsAccepted')
          bool? termsAccepted,
      @JsonKey(name: 'acceptedTermsID')
          int? acceptedTermsID,
      @JsonKey(name: 'suspended')
          bool? suspended,
      @JsonKey(name: 'avatar')
          String? avatar,
      @JsonKey(name: 'roles')
          List<Role>? roles,
      @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
          bool? pinUpdateRequired,
      String? chatRoomToken});

  $ContactCopyWith<$Res>? get primaryContact;
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? username = freezed,
    Object? name = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? userType = freezed,
    Object? gender = freezed,
    Object? active = freezed,
    Object? primaryContact = freezed,
    Object? lastSuccessfulLogin = freezed,
    Object? lastFailedLogin = freezed,
    Object? failedLoginCount = freezed,
    Object? nextAllowedLogin = freezed,
    Object? pinChangeRequired = freezed,
    Object? hasSetPin = freezed,
    Object? isPhoneVerified = freezed,
    Object? hasSetSecurityQuestions = freezed,
    Object? termsAccepted = freezed,
    Object? acceptedTermsID = freezed,
    Object? suspended = freezed,
    Object? avatar = freezed,
    Object? roles = freezed,
    Object? pinUpdateRequired = freezed,
    Object? chatRoomToken = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      userType: userType == freezed
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      primaryContact: primaryContact == freezed
          ? _value.primaryContact
          : primaryContact // ignore: cast_nullable_to_non_nullable
              as Contact?,
      lastSuccessfulLogin: lastSuccessfulLogin == freezed
          ? _value.lastSuccessfulLogin
          : lastSuccessfulLogin // ignore: cast_nullable_to_non_nullable
              as String?,
      lastFailedLogin: lastFailedLogin == freezed
          ? _value.lastFailedLogin
          : lastFailedLogin // ignore: cast_nullable_to_non_nullable
              as String?,
      failedLoginCount: failedLoginCount == freezed
          ? _value.failedLoginCount
          : failedLoginCount // ignore: cast_nullable_to_non_nullable
              as int?,
      nextAllowedLogin: nextAllowedLogin == freezed
          ? _value.nextAllowedLogin
          : nextAllowedLogin // ignore: cast_nullable_to_non_nullable
              as String?,
      pinChangeRequired: pinChangeRequired == freezed
          ? _value.pinChangeRequired
          : pinChangeRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetPin: hasSetPin == freezed
          ? _value.hasSetPin
          : hasSetPin // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPhoneVerified: isPhoneVerified == freezed
          ? _value.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetSecurityQuestions: hasSetSecurityQuestions == freezed
          ? _value.hasSetSecurityQuestions
          : hasSetSecurityQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      termsAccepted: termsAccepted == freezed
          ? _value.termsAccepted
          : termsAccepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      acceptedTermsID: acceptedTermsID == freezed
          ? _value.acceptedTermsID
          : acceptedTermsID // ignore: cast_nullable_to_non_nullable
              as int?,
      suspended: suspended == freezed
          ? _value.suspended
          : suspended // ignore: cast_nullable_to_non_nullable
              as bool?,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      roles: roles == freezed
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<Role>?,
      pinUpdateRequired: pinUpdateRequired == freezed
          ? _value.pinUpdateRequired
          : pinUpdateRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      chatRoomToken: chatRoomToken == freezed
          ? _value.chatRoomToken
          : chatRoomToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $ContactCopyWith<$Res>? get primaryContact {
    if (_value.primaryContact == null) {
      return null;
    }

    return $ContactCopyWith<$Res>(_value.primaryContact!, (value) {
      return _then(_value.copyWith(primaryContact: value));
    });
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'userID')
          String? userId,
      @JsonKey(name: 'userName')
          String? username,
      @JsonKey(name: 'name')
          String? name,
      @JsonKey(name: 'firstName')
          String? firstName,
      @JsonKey(name: 'lastName')
          String? lastName,
      @JsonKey(name: 'userType')
          String? userType,
      @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
          Gender? gender,
      @JsonKey(name: 'active', defaultValue: false)
          bool? active,
      @JsonKey(name: 'primaryContact')
          Contact? primaryContact,
      @JsonKey(name: 'lastSuccessfulLogin')
          String? lastSuccessfulLogin,
      @JsonKey(name: 'lastFailedLogin')
          String? lastFailedLogin,
      @JsonKey(name: 'failedLoginCount')
          int? failedLoginCount,
      @JsonKey(name: 'nextAllowedLogin')
          String? nextAllowedLogin,
      @JsonKey(name: 'pinChangeRequired')
          bool? pinChangeRequired,
      @JsonKey(name: 'hasSetPin')
          bool? hasSetPin,
      @JsonKey(name: 'isPhoneVerified')
          bool? isPhoneVerified,
      @JsonKey(name: 'hasSetSecurityQuestions')
          bool? hasSetSecurityQuestions,
      @JsonKey(name: 'termsAccepted')
          bool? termsAccepted,
      @JsonKey(name: 'acceptedTermsID')
          int? acceptedTermsID,
      @JsonKey(name: 'suspended')
          bool? suspended,
      @JsonKey(name: 'avatar')
          String? avatar,
      @JsonKey(name: 'roles')
          List<Role>? roles,
      @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
          bool? pinUpdateRequired,
      String? chatRoomToken});

  @override
  $ContactCopyWith<$Res>? get primaryContact;
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, (v) => _then(v as _$_User));

  @override
  _$_User get _value => super._value as _$_User;

  @override
  $Res call({
    Object? userId = freezed,
    Object? username = freezed,
    Object? name = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? userType = freezed,
    Object? gender = freezed,
    Object? active = freezed,
    Object? primaryContact = freezed,
    Object? lastSuccessfulLogin = freezed,
    Object? lastFailedLogin = freezed,
    Object? failedLoginCount = freezed,
    Object? nextAllowedLogin = freezed,
    Object? pinChangeRequired = freezed,
    Object? hasSetPin = freezed,
    Object? isPhoneVerified = freezed,
    Object? hasSetSecurityQuestions = freezed,
    Object? termsAccepted = freezed,
    Object? acceptedTermsID = freezed,
    Object? suspended = freezed,
    Object? avatar = freezed,
    Object? roles = freezed,
    Object? pinUpdateRequired = freezed,
    Object? chatRoomToken = freezed,
  }) {
    return _then(_$_User(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      userType: userType == freezed
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      primaryContact: primaryContact == freezed
          ? _value.primaryContact
          : primaryContact // ignore: cast_nullable_to_non_nullable
              as Contact?,
      lastSuccessfulLogin: lastSuccessfulLogin == freezed
          ? _value.lastSuccessfulLogin
          : lastSuccessfulLogin // ignore: cast_nullable_to_non_nullable
              as String?,
      lastFailedLogin: lastFailedLogin == freezed
          ? _value.lastFailedLogin
          : lastFailedLogin // ignore: cast_nullable_to_non_nullable
              as String?,
      failedLoginCount: failedLoginCount == freezed
          ? _value.failedLoginCount
          : failedLoginCount // ignore: cast_nullable_to_non_nullable
              as int?,
      nextAllowedLogin: nextAllowedLogin == freezed
          ? _value.nextAllowedLogin
          : nextAllowedLogin // ignore: cast_nullable_to_non_nullable
              as String?,
      pinChangeRequired: pinChangeRequired == freezed
          ? _value.pinChangeRequired
          : pinChangeRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetPin: hasSetPin == freezed
          ? _value.hasSetPin
          : hasSetPin // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPhoneVerified: isPhoneVerified == freezed
          ? _value.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetSecurityQuestions: hasSetSecurityQuestions == freezed
          ? _value.hasSetSecurityQuestions
          : hasSetSecurityQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      termsAccepted: termsAccepted == freezed
          ? _value.termsAccepted
          : termsAccepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      acceptedTermsID: acceptedTermsID == freezed
          ? _value.acceptedTermsID
          : acceptedTermsID // ignore: cast_nullable_to_non_nullable
              as int?,
      suspended: suspended == freezed
          ? _value.suspended
          : suspended // ignore: cast_nullable_to_non_nullable
              as bool?,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      roles: roles == freezed
          ? _value._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<Role>?,
      pinUpdateRequired: pinUpdateRequired == freezed
          ? _value.pinUpdateRequired
          : pinUpdateRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      chatRoomToken: chatRoomToken == freezed
          ? _value.chatRoomToken
          : chatRoomToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  _$_User(
      {@JsonKey(name: 'userID')
          this.userId,
      @JsonKey(name: 'userName')
          this.username,
      @JsonKey(name: 'name')
          this.name,
      @JsonKey(name: 'firstName')
          this.firstName,
      @JsonKey(name: 'lastName')
          this.lastName,
      @JsonKey(name: 'userType')
          this.userType,
      @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
          this.gender,
      @JsonKey(name: 'active', defaultValue: false)
          this.active,
      @JsonKey(name: 'primaryContact')
          this.primaryContact,
      @JsonKey(name: 'lastSuccessfulLogin')
          this.lastSuccessfulLogin,
      @JsonKey(name: 'lastFailedLogin')
          this.lastFailedLogin,
      @JsonKey(name: 'failedLoginCount')
          this.failedLoginCount,
      @JsonKey(name: 'nextAllowedLogin')
          this.nextAllowedLogin,
      @JsonKey(name: 'pinChangeRequired')
          this.pinChangeRequired,
      @JsonKey(name: 'hasSetPin')
          this.hasSetPin,
      @JsonKey(name: 'isPhoneVerified')
          this.isPhoneVerified,
      @JsonKey(name: 'hasSetSecurityQuestions')
          this.hasSetSecurityQuestions,
      @JsonKey(name: 'termsAccepted')
          this.termsAccepted,
      @JsonKey(name: 'acceptedTermsID')
          this.acceptedTermsID,
      @JsonKey(name: 'suspended')
          this.suspended,
      @JsonKey(name: 'avatar')
          this.avatar,
      @JsonKey(name: 'roles')
          final List<Role>? roles,
      @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
          this.pinUpdateRequired,
      this.chatRoomToken})
      : _roles = roles;

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  @JsonKey(name: 'userID')
  final String? userId;
  @override
  @JsonKey(name: 'userName')
  final String? username;
// This is the nickname
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'firstName')
  final String? firstName;
  @override
  @JsonKey(name: 'lastName')
  final String? lastName;
  @override
  @JsonKey(name: 'userType')
  final String? userType;
  @override
  @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
  final Gender? gender;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  final bool? active;
  @override
  @JsonKey(name: 'primaryContact')
  final Contact? primaryContact;
  @override
  @JsonKey(name: 'lastSuccessfulLogin')
  final String? lastSuccessfulLogin;
  @override
  @JsonKey(name: 'lastFailedLogin')
  final String? lastFailedLogin;
  @override
  @JsonKey(name: 'failedLoginCount')
  final int? failedLoginCount;
  @override
  @JsonKey(name: 'nextAllowedLogin')
  final String? nextAllowedLogin;
  @override
  @JsonKey(name: 'pinChangeRequired')
  final bool? pinChangeRequired;
  @override
  @JsonKey(name: 'hasSetPin')
  final bool? hasSetPin;
  @override
  @JsonKey(name: 'isPhoneVerified')
  final bool? isPhoneVerified;
  @override
  @JsonKey(name: 'hasSetSecurityQuestions')
  final bool? hasSetSecurityQuestions;
  @override
  @JsonKey(name: 'termsAccepted')
  final bool? termsAccepted;
  @override
  @JsonKey(name: 'acceptedTermsID')
  final int? acceptedTermsID;
  @override
  @JsonKey(name: 'suspended')
  final bool? suspended;
  @override
  @JsonKey(name: 'avatar')
  final String? avatar;
  final List<Role>? _roles;
  @override
  @JsonKey(name: 'roles')
  List<Role>? get roles {
    final value = _roles;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Used to indicate that the user's PIN has been reset by someone else
  ///
  /// This is used to trigger the change PIN workflow
  @override
  @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
  final bool? pinUpdateRequired;
  @override
  final String? chatRoomToken;

  @override
  String toString() {
    return 'User(userId: $userId, username: $username, name: $name, firstName: $firstName, lastName: $lastName, userType: $userType, gender: $gender, active: $active, primaryContact: $primaryContact, lastSuccessfulLogin: $lastSuccessfulLogin, lastFailedLogin: $lastFailedLogin, failedLoginCount: $failedLoginCount, nextAllowedLogin: $nextAllowedLogin, pinChangeRequired: $pinChangeRequired, hasSetPin: $hasSetPin, isPhoneVerified: $isPhoneVerified, hasSetSecurityQuestions: $hasSetSecurityQuestions, termsAccepted: $termsAccepted, acceptedTermsID: $acceptedTermsID, suspended: $suspended, avatar: $avatar, roles: $roles, pinUpdateRequired: $pinUpdateRequired, chatRoomToken: $chatRoomToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality().equals(other.userType, userType) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality().equals(other.active, active) &&
            const DeepCollectionEquality()
                .equals(other.primaryContact, primaryContact) &&
            const DeepCollectionEquality()
                .equals(other.lastSuccessfulLogin, lastSuccessfulLogin) &&
            const DeepCollectionEquality()
                .equals(other.lastFailedLogin, lastFailedLogin) &&
            const DeepCollectionEquality()
                .equals(other.failedLoginCount, failedLoginCount) &&
            const DeepCollectionEquality()
                .equals(other.nextAllowedLogin, nextAllowedLogin) &&
            const DeepCollectionEquality()
                .equals(other.pinChangeRequired, pinChangeRequired) &&
            const DeepCollectionEquality().equals(other.hasSetPin, hasSetPin) &&
            const DeepCollectionEquality()
                .equals(other.isPhoneVerified, isPhoneVerified) &&
            const DeepCollectionEquality().equals(
                other.hasSetSecurityQuestions, hasSetSecurityQuestions) &&
            const DeepCollectionEquality()
                .equals(other.termsAccepted, termsAccepted) &&
            const DeepCollectionEquality()
                .equals(other.acceptedTermsID, acceptedTermsID) &&
            const DeepCollectionEquality().equals(other.suspended, suspended) &&
            const DeepCollectionEquality().equals(other.avatar, avatar) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            const DeepCollectionEquality()
                .equals(other.pinUpdateRequired, pinUpdateRequired) &&
            const DeepCollectionEquality()
                .equals(other.chatRoomToken, chatRoomToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(userId),
        const DeepCollectionEquality().hash(username),
        const DeepCollectionEquality().hash(name),
        const DeepCollectionEquality().hash(firstName),
        const DeepCollectionEquality().hash(lastName),
        const DeepCollectionEquality().hash(userType),
        const DeepCollectionEquality().hash(gender),
        const DeepCollectionEquality().hash(active),
        const DeepCollectionEquality().hash(primaryContact),
        const DeepCollectionEquality().hash(lastSuccessfulLogin),
        const DeepCollectionEquality().hash(lastFailedLogin),
        const DeepCollectionEquality().hash(failedLoginCount),
        const DeepCollectionEquality().hash(nextAllowedLogin),
        const DeepCollectionEquality().hash(pinChangeRequired),
        const DeepCollectionEquality().hash(hasSetPin),
        const DeepCollectionEquality().hash(isPhoneVerified),
        const DeepCollectionEquality().hash(hasSetSecurityQuestions),
        const DeepCollectionEquality().hash(termsAccepted),
        const DeepCollectionEquality().hash(acceptedTermsID),
        const DeepCollectionEquality().hash(suspended),
        const DeepCollectionEquality().hash(avatar),
        const DeepCollectionEquality().hash(_roles),
        const DeepCollectionEquality().hash(pinUpdateRequired),
        const DeepCollectionEquality().hash(chatRoomToken)
      ]);

  @JsonKey(ignore: true)
  @override
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(this);
  }
}

abstract class _User implements User {
  factory _User(
      {@JsonKey(name: 'userID')
          final String? userId,
      @JsonKey(name: 'userName')
          final String? username,
      @JsonKey(name: 'name')
          final String? name,
      @JsonKey(name: 'firstName')
          final String? firstName,
      @JsonKey(name: 'lastName')
          final String? lastName,
      @JsonKey(name: 'userType')
          final String? userType,
      @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
          final Gender? gender,
      @JsonKey(name: 'active', defaultValue: false)
          final bool? active,
      @JsonKey(name: 'primaryContact')
          final Contact? primaryContact,
      @JsonKey(name: 'lastSuccessfulLogin')
          final String? lastSuccessfulLogin,
      @JsonKey(name: 'lastFailedLogin')
          final String? lastFailedLogin,
      @JsonKey(name: 'failedLoginCount')
          final int? failedLoginCount,
      @JsonKey(name: 'nextAllowedLogin')
          final String? nextAllowedLogin,
      @JsonKey(name: 'pinChangeRequired')
          final bool? pinChangeRequired,
      @JsonKey(name: 'hasSetPin')
          final bool? hasSetPin,
      @JsonKey(name: 'isPhoneVerified')
          final bool? isPhoneVerified,
      @JsonKey(name: 'hasSetSecurityQuestions')
          final bool? hasSetSecurityQuestions,
      @JsonKey(name: 'termsAccepted')
          final bool? termsAccepted,
      @JsonKey(name: 'acceptedTermsID')
          final int? acceptedTermsID,
      @JsonKey(name: 'suspended')
          final bool? suspended,
      @JsonKey(name: 'avatar')
          final String? avatar,
      @JsonKey(name: 'roles')
          final List<Role>? roles,
      @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
          final bool? pinUpdateRequired,
      final String? chatRoomToken}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  @JsonKey(name: 'userID')
  String? get userId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'userName')
  String? get username => throw _privateConstructorUsedError;
  @override // This is the nickname
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'firstName')
  String? get firstName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'lastName')
  String? get lastName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'userType')
  String? get userType => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
  Gender? get gender => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'primaryContact')
  Contact? get primaryContact => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'lastSuccessfulLogin')
  String? get lastSuccessfulLogin => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'lastFailedLogin')
  String? get lastFailedLogin => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'failedLoginCount')
  int? get failedLoginCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'nextAllowedLogin')
  String? get nextAllowedLogin => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'pinChangeRequired')
  bool? get pinChangeRequired => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'hasSetPin')
  bool? get hasSetPin => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'isPhoneVerified')
  bool? get isPhoneVerified => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'hasSetSecurityQuestions')
  bool? get hasSetSecurityQuestions => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'termsAccepted')
  bool? get termsAccepted => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'acceptedTermsID')
  int? get acceptedTermsID => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'suspended')
  bool? get suspended => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'avatar')
  String? get avatar => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'roles')
  List<Role>? get roles => throw _privateConstructorUsedError;
  @override

  /// Used to indicate that the user's PIN has been reset by someone else
  ///
  /// This is used to trigger the change PIN workflow
  @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
  bool? get pinUpdateRequired => throw _privateConstructorUsedError;
  @override
  String? get chatRoomToken => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
