// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:healthcloud/application/core/services/utils.dart';
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/application/redux/view_models/app_state_view_model.dart';
import 'package:healthcloud/domain/core/entities/core/staff_state.dart';
// Project imports:
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/engagement/home/widgets/action_card.dart';
import 'package:healthcloud/presentation/engagement/home/widgets/appbar_user.dart';
import 'package:healthcloud/presentation/router/routes.dart';
import 'package:healthcloud/presentation/service_requests/widgets/service_request_action_card.dart';
// Package imports:
import 'package:misc_utilities/misc.dart';
import 'package:misc_utilities/number_constants.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/spaces.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.galleryColor,
      body: SingleChildScrollView(
        child: StoreConnector<AppState, AppStateViewModel>(
          converter: (Store<AppState> store) =>
              AppStateViewModel.fromStore(store),
          builder: (BuildContext context, AppStateViewModel vm) {
            final StaffState? staffState = vm.state.staffState;
            final String firstName = staffState?.user?.firstName ?? UNKNOWN;

            return Column(
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
                      ? const EdgeInsets.fromLTRB(number20, 0, number20, 40)
                      : const EdgeInsets.fromLTRB(5, 0, 5, 10),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          ResponsiveWidget.preferredPaddingOnStretchedScreens(
                        context: context,
                      ),
                    ),
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

                        //TODO(eugene): Restore when ready
                        // size15VerticalSizedBox,

                        // SearchWidget(
                        //   onTap: () {
                        //     Navigator.pushNamed(context, AppRoutes.searchPage);
                        //   },
                        // ),
                        smallVerticalSizedBox,
                      ],
                    ),
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
                      ServiceRequestActionCard(),

                      ///TODO(eugene): Restore when POC is ready
                      // ActionCard(
                      //   key: surveysCardKey,
                      //   title: surveysString,
                      //   iconUrl: surveysImageSvgPath,
                      //   onTap: () {
                      //     Navigator.of(context).pushNamed(AppRoutes.surveysPage);
                      //   },
                      // ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
