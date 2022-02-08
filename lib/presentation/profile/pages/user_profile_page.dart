// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart' as afyamoja;
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// Project imports:
import 'package:healthcloud/application/core/services/utils.dart';
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/application/redux/view_models/app_state_view_model.dart';
import 'package:healthcloud/domain/core/entities/core/staff_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/core/app_bar/custom_app_bar.dart';
import 'package:healthcloud/presentation/core/widgets/logout_button.dart';
import 'package:healthcloud/presentation/profile/widgets/user_details_card_widget.dart'
    as local;
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
                  ),
                  mediumVerticalSizedBox,

                  /// [userProfileItems] is a list of the UserProfilePage ListTile items
                  ...List<Widget>.generate(userProfileItems.length,
                      (int index) {
                    final String iconPath =
                        userProfileItems.elementAt(index).iconAssetPath;
                    final String title =
                        userProfileItems.elementAt(index).title;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: afyamoja.InformationListCard(
                        title: Text(
                          title,
                          maxLines: 2,
                          style: afyamoja.veryBoldSize14Text(
                            Theme.of(context).primaryColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        iconBackgroundColor: AppColors.profileListCardColor,
                        leadingIcon: Container(
                          width: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SvgPicture.asset(
                            iconPath,
                            width: 20,
                            height: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    );
                  }),
                  mediumVerticalSizedBox,
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
