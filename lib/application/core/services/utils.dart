// Project imports:
import 'package:bewell_pro_core/application/redux/states/user_state.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:afya_moja_core/domain/core/entities/icon_details.dart';
import 'package:healthcloud/domain/core/entities/notification/notification_details.dart';
import 'package:healthcloud/domain/core/entities/user_profile_item_obj.dart';
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/router/routes.dart';
import 'package:healthcloud/domain/core/entities/request_item.dart';

final List<UserProfileItemObj> userProfileItems = <UserProfileItemObj>[
  UserProfileItemObj(
    iconAssetPath: mySavedIconSvgPath,
    route: kycIntroPageRoute,
    title: 'Surveys',
  ),
  UserProfileItemObj(
    iconAssetPath: appointmentIconSvgPath,
    route: kycIntroPageRoute,
    title: 'Appointments',
  ),
  UserProfileItemObj(
    iconAssetPath: helpCircleIcon,
    route: kycIntroPageRoute,
    title: 'Help/Contact Admin',
  ),
  UserProfileItemObj(
    iconAssetPath: feedbackIconSvgPath,
    route: kycIntroPageRoute,
    title: 'Resolved Requests',
  ),
  UserProfileItemObj(
    iconAssetPath: faqsIconSvgPath,
    route: kycIntroPageRoute,
    title: 'FAQs',
  ),
  UserProfileItemObj(
    iconAssetPath: settingsIconSvgPath,
    route: kycIntroPageRoute,
    title: 'Settings',
  ),
];

String getDisplayName(UserState state) {
  final String firstName =
      state.userProfile?.userBioData?.firstName?.getValue() ?? UNKNOWN;
  final String formattedFirstName = firstName.replaceAll(' ', '');

  final String lastName =
      state.userProfile?.userBioData?.lastName?.getValue() ?? UNKNOWN;
  final String formattedLastName = lastName.replaceAll(' ', '');

  return '$formattedFirstName $formattedLastName';
}

final List<RequestItem> serviceRequestItems = <RequestItem>[
  RequestItem(
    route: kycIntroPageRoute,
    title: 'Pin Reset',
    imageAssetPath: pinResetImageSvgPath,
    totalNumber: 5,
  ),
  RequestItem(
    route: kycIntroPageRoute,
    title: 'Red Flags',
    imageAssetPath: redFlagImageSvgPath,
    totalNumber: 3,
  ),
  RequestItem(
    route: kycIntroPageRoute,
    title: 'Profile Update',
    imageAssetPath: profileUpdateImageSvgPath,
    totalNumber: 4,
  ),
];

String? userPinValidator(dynamic val) {
  final String value = val as String;
  if (value.isEmpty) {
    return 'A PIN is required';
  }
  if (!RegExp(r'^-?[0-9]+$').hasMatch(value)) {
    return 'Only digits are allowed, 0-9';
  }
  if (value.length < 4) {
    return 'Enter a four digit PIN';
  }
  return null;
}

bool confirmPinValidator(String pin, String confirmPin) {
  if (pin != confirmPin) {
    return false;
  }
  return true;
}

List<NotificationDetails> notifications = <NotificationDetails>[
  NotificationDetails(
    icon: IconDetails(iconUrlSvgPath: surveyCollectionNotificationIcon),
    description: 'Your Survey is collecting responses',
    date: customDate,
  ),
  NotificationDetails(
    icon: IconDetails(iconUrlSvgPath: teleConsultVideoNotificationIcon),
    description: 'Upcoming tele-consult with Dennis Kilonzo at 2.00pm.',
    date: customDate,
  ),
  NotificationDetails(
    icon: IconDetails(iconUrlSvgPath: teleConsultNotificationIcon),
    description: 'New tele-consult request',
    date: customDate,
  ),
];
