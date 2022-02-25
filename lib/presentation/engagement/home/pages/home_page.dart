// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:healthcloud/application/core/services/utils.dart';
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/application/redux/view_models/staff_state_view_model.dart';
import 'package:healthcloud/domain/core/entities/core/staff_state.dart';
// Project imports:
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/core/bottom_nav/bottom_nav_bar.dart';
import 'package:healthcloud/presentation/engagement/home/widgets/action_card.dart';
import 'package:healthcloud/presentation/engagement/home/widgets/appbar_user.dart';
import 'package:healthcloud/presentation/router/routes.dart';
import 'package:healthcloud/presentation/service_requests/widgets/service_request_action_card.dart';
import 'package:misc_utilities/misc.dart' as misc;
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
            final StaffState? staffState = vm.staffState;
            final String firstName = staffState?.user?.firstName ?? UNKNOWN;

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
                          misc.getGreetingMessage(
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
                        title: addNewUserText,
                        iconUrl: addNewUserIconSvg,
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.addNewPatientPage);
                        },
                      ),
                      const ServiceRequestActionCard(),
                      ActionCard(
                        title: createGroupText,
                        iconUrl: newGroupImage,
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.addNewGroupPage);
                        },
                      )
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
