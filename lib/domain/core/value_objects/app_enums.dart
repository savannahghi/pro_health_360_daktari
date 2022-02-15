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

enum ServiceRequestType { RED_FLAG, PIN_RESET, PROFILE_UPDATE, UNKNOWN }
enum EditInformationInputType { Text, DropDown }
enum CaregiverType { Father, Mother, Sibling }

extension CaregiverTypeEx on CaregiverType {
  String get name {
    return describeEnum(this);
  }
}
