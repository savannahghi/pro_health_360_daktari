// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/view_models/app_state_view_model.dart';
import 'package:mycarehubpro/domain/core/entities/core/staff_state.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:mycarehubpro/presentation/core/widgets/logout_button.dart';
import 'package:mycarehubpro/presentation/profile/widgets/user_details_card_widget.dart'
    as local;
import 'package:mycarehubpro/presentation/router/routes.dart';
import 'package:shared_themes/spaces.dart';

// Project imports:

class UserProfilePage extends StatelessWidget {
  /// [UserProfilePage] is used to display the user information
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGreyBackgroundColor,
      appBar: const CustomAppBar(
        title: myProfileString,
        showNotificationIcon: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: StoreConnector<AppState, AppStateViewModel>(
            converter: (Store<AppState> store) =>
                AppStateViewModel.fromStore(store),
            builder: (BuildContext context, AppStateViewModel vm) {
              final StaffState? staffState = vm.state.staffState;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  mediumVerticalSizedBox,
                  local.UserDetailsCard(
                    clinicName: UNKNOWN,
                    gender: staffState?.user?.gender ?? Gender.unknown,
                    name: staffState?.user?.name ?? UNKNOWN,
                    licenseNumber: staffState?.staffNumber ?? UNKNOWN,
                    phoneNumber:
                        staffState?.user?.primaryContact?.value ?? UNKNOWN,
                    profession: profession,
                    defaultHospitalName:
                        staffState?.defaultFacilityName ?? UNKNOWN,
                  ),
                  mediumVerticalSizedBox,
                  // conversation invites
                  UserProfileItem(
                    iconPath: communityIconSvgPath,
                    title: conversationsInvitesTitle,
                    itemBackgroundColor: AppColors.profileListCardColor,
                    onTap: () => Navigator.of(context)
                        .pushNamed(AppRoutes.groupInvitesPage),
                  ),
                  // contact admin
                  UserProfileItem(
                    iconPath: helpCircleIcon,
                    title: helpContactAdminString,
                    itemBackgroundColor: AppColors.profileListCardColor,
                    onTap: () => Navigator.of(context)
                        .pushNamed(AppRoutes.contactAdminPage),
                  ),
                  // resolved requests
                  UserProfileItem(
                    iconPath: feedbackIconSvgPath,
                    title: resolvedRequestsString,
                    itemBackgroundColor: AppColors.profileListCardColor,
                    onTap: () => Navigator.of(context)
                        .pushNamed(AppRoutes.resolvedServiceRequestsPage),
                  ),
                  // faqs
                  UserProfileItem(
                    iconPath: faqsIconSvgPath,
                    title: faqsText,
                    itemBackgroundColor: AppColors.profileListCardColor,
                    onTap: () =>
                        Navigator.pushNamed(context, AppRoutes.profileFaqsPage),
                  ),
                  // settings
                  UserProfileItem(
                    iconPath: settingsIconSvgPath,
                    title: settingsString,
                    itemBackgroundColor: AppColors.profileListCardColor,
                    onTap: () =>
                        Navigator.pushNamed(context, AppRoutes.settingsPage),
                  ),
                  mediumVerticalSizedBox,
                  // logout button
                  const SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: LogoutButton(),
                  ),
                  mediumVerticalSizedBox,

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Text(
                          copyrightString,
                          style: normalSize10Text(Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Center(
                        child: Text(
                          '$appVersionString $APPVERSION',
                          style: normalSize9Text(Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
