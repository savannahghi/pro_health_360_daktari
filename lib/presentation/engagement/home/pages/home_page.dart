// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/services/utils.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/view_models/staff_state_view_model.dart';
// Project imports:
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/core/bottom_nav/bottom_nav_bar.dart';
import 'package:mycarehubpro/presentation/engagement/home/widgets/action_card.dart';
import 'package:mycarehubpro/presentation/engagement/home/widgets/appbar_user.dart';
import 'package:mycarehubpro/presentation/router/routes.dart';
// Package imports:
import 'package:shared_themes/spaces.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.galleryColor,
      body: SingleChildScrollView(
        child: StoreConnector<AppState, StaffStateViewModel>(
          converter: (Store<AppState> store) =>
              StaffStateViewModel.fromStore(store),
          builder: (BuildContext context, StaffStateViewModel vm) {
            final String firstName = vm.staffState?.user?.firstName ?? UNKNOWN;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                        Colors.red.withOpacity(1.0),
                        BlendMode.dstATop,
                      ),
                      image: const AssetImage(blendedBackgroundImg),
                      fit: BoxFit.cover,
                    ),
                  ),
                  padding: ResponsiveWidget.isLargeScreen(context)
                      ? const EdgeInsets.fromLTRB(20, 0, 20, 40)
                      : const EdgeInsets.fromLTRB(5, 0, 5, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      mediumVerticalSizedBox,
                      veryLargeVerticalSizedBox,
                      const AppbarUser(),
                      veryLargeVerticalSizedBox,
                      veryLargeVerticalSizedBox,
                      Text(
                        removeTailingComma(
                          getGreetingMessage(
                            firstName == UNKNOWN ? '' : firstName,
                          ),
                        ),
                        style: boldSize24Text(Colors.white),
                      ),
                      smallVerticalSizedBox,
                    ],
                  ),
                ),

                // Add new user section
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16.0,
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Wrap(
                    children: <Widget>[
                      ActionCard(
                        title: addNewClientText,
                        iconUrl: addNewStaffImageSvg,
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.addNewPatientPage);
                        },
                      ),
                      ActionCard(
                        title: addNewStaffText,
                        iconUrl: addNewUserIconSvg,
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.addNewStaffPage);
                        },
                      ),
                     ActionCard(
                        iconUrl: serviceRequestsIconSvg,
                        title: serviceRequestsText,
                        onTap: () => Navigator.of(context).pushNamed(
                          AppRoutes.serviceRequestsPage,
                        ),
                      ),
                      ActionCard(
                        title: createGroupText,
                        iconUrl: newGroupImage,
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.addNewGroupPage);
                        },
                      ),
                      ActionCard(
                        key: searchActionCardKey,
                        title: searchString,
                        iconUrl: searchSvgPath,
                        onTap: () {
                          Navigator.of(context).pushNamed(AppRoutes.searchPage);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
