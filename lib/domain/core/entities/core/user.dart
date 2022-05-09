// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycarehubpro/domain/core/entities/core/contact.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  factory User({
    @JsonKey(name: 'userID') String? userId,
    @JsonKey(name: 'userName') String? username, // This is the nickname
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'firstName') String? firstName,
    @JsonKey(name: 'lastName') String? lastName,
    @JsonKey(name: 'userType') String? userType,
    @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
        Gender? gender,
    @JsonKey(name: 'active', defaultValue: false) bool? active,
    @JsonKey(name: 'primaryContact') Contact? primaryContact,
    @JsonKey(name: 'lastSuccessfulLogin') String? lastSuccessfulLogin,
    @JsonKey(name: 'lastFailedLogin') String? lastFailedLogin,
    @JsonKey(name: 'failedLoginCount') int? failedLoginCount,
    @JsonKey(name: 'nextAllowedLogin') String? nextAllowedLogin,
    @JsonKey(name: 'pinChangeRequired') bool? pinChangeRequired,
    @JsonKey(name: 'hasSetPin') bool? hasSetPin,
    @JsonKey(name: 'isPhoneVerified') bool? isPhoneVerified,
    @JsonKey(name: 'hasSetSecurityQuestions') bool? hasSetSecurityQuestions,
    @JsonKey(name: 'termsAccepted') bool? termsAccepted,
    @JsonKey(name: 'acceptedTermsID') int? acceptedTermsID,
    @JsonKey(name: 'suspended') bool? suspended,
    @JsonKey(name: 'avatar') String? avatar,
    @JsonKey(name: 'roles') List<Role>? roles,

    /// Used to indicate that the user's PIN has been reset by someone else
    ///
    /// This is used to trigger the change PIN workflow
    @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
        bool? pinUpdateRequired,
    String? chatRoomToken,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.initial() => User(
        userId: UNKNOWN,
        username: UNKNOWN,
        name: UNKNOWN,
        firstName: UNKNOWN,
        lastName: UNKNOWN,
        userType: UNKNOWN,
        gender: Gender.unknown,
        active: false,
        primaryContact: Contact.initial(),
        lastSuccessfulLogin: UNKNOWN,
        lastFailedLogin: UNKNOWN,
        failedLoginCount: 0,
        nextAllowedLogin: UNKNOWN,
        pinChangeRequired: false,
        hasSetPin: false,
        isPhoneVerified: false,
        hasSetSecurityQuestions: false,
        termsAccepted: false,
        acceptedTermsID: 0,
        suspended: false,
        avatar: UNKNOWN,
        roles: <Role>[],
        pinUpdateRequired: false,
      );
}
