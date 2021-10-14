// Project imports:
import 'package:healthcloud/domain/core/entities/user_profile_item_obj.dart';
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/presentation/router/routes.dart';

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
