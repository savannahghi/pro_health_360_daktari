// Project imports:
import 'package:bewell_pro_core/application/redux/states/user_state.dart';
import 'package:domain_objects/value_objects.dart';
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

String getDisplayName(UserState state) {
  final String firstName =
      state.userProfile?.userBioData?.firstName?.getValue() ?? UNKNOWN;
  final String formattedFirstName = firstName.replaceAll(' ', '');

  final String lastName =
      state.userProfile?.userBioData?.lastName?.getValue() ?? UNKNOWN;
  final String formattedLastName = lastName.replaceAll(' ', '');

  return '$formattedFirstName $formattedLastName';
}
