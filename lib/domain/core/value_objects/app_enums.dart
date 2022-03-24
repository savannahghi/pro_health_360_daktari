import 'package:flutter/foundation.dart';

enum ChatStatus { Unknown, Accept, Reject }

enum SetPinStatus { IsChangingPin, IsSettingPin, IsResettingPin }
enum AuthTokenStatus { okay, requiresLogin, requiresPin }

/// The type of contact being used
enum ContactType { PHONE, EMAIL, UNKNOWN }

enum ClientType {
  PMTCT,
  OVC,
  OTZ,
  OTZ_PLUS,
  HVL,
  DREAMS,
  HIGH_RISK,
  SPOUSES,
  YOUTH
}

extension ClientTypeEx on ClientType {
  String get name {
    return describeEnum(this);
  }
}

enum ServiceRequestType {
  RED_FLAG,
  CLIENT_PIN_RESET,
  STAFF_PIN_RESET,
  PROFILE_UPDATE,
  UNKNOWN,
}

extension ServiceRequestTypeEx on ServiceRequestType {
  String get name {
    return describeEnum(this);
  }
}

enum RequestStatus { PENDING, RESOLVED, IN_PROGRESS, UNKNOWN }

extension RequestStatusEx on RequestStatus {
  String get name {
    return describeEnum(this);
  }
}

enum Role {
  SYSTEM_ADMINISTRATOR,
  COMMUNITY_MANAGEMENT,
  CONTENT_MANAGEMENT,
  CLIENT_MANAGEMENT,
}

extension RoleName on Role {
  String get name {
    return describeEnum(this).split('_').join(' ');
  }
}

enum PinResetState { APPROVED, REJECTED }

extension PinResetStateExtension on PinResetState {
  String get name {
    return describeEnum(this);
  }
}

/// The current onboarding workflow that is running
///
/// [Login] stage is when a user is signing up normally. It was combined and
///  tweaked to handle signup as well because once a user has been invited they
///  will still have to login
///
/// [ChangePin] is used when the user's PIN has been changed by someone else
///  like their HCW or an admin
///
/// [PINExpired] is used when a user's PIN has expired
///
/// The [CurrentOnboardingStage] is stored in the [onboardingState] and must be
///  changed at the end of each workflow
enum CurrentOnboardingStage { Login, ResetPIN, PINExpired }
