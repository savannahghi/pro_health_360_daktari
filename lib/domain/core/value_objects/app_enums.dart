import 'package:flutter/foundation.dart';

enum MeetingType { Zoom, GoogleMeet, Unknown }

enum ChatStatus { Unknown, Accept, Reject }

enum AppRequestTypes { POST, GET, PUT, PATCH }

extension AppRequestTypesEx on AppRequestTypes {
  String get name => describeEnum(this).toUpperCase();
}

enum SetPinStatus { IsChangingPin, IsSettingPin, IsResettingPin }
enum AuthTokenStatus { okay, requiresLogin, requiresPin }

/// The type of contact being used
enum ContactType { PHONE, EMAIL, UNKNOWN }
