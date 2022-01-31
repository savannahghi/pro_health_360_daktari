// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:afya_moja_core/search_widget.dart';
import 'package:afya_moja_core/text_themes.dart';
import 'package:async_redux/async_redux.dart';
import 'package:misc_utilities/misc.dart';
import 'package:misc_utilities/number_constants.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/engagement/home/widgets/action_card.dart';
import 'package:healthcloud/presentation/engagement/home/widgets/appbar_user.dart';
import 'package:healthcloud/presentation/router/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Store<AppState> _store =
      Store<AppState>(initialState: AppState.initial());
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: _store,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
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
                        time,
                        style: veryBoldSize28Text(Colors.white),
                      ),
                      Text(
                        getGreetingMessage(firstName),
                        style: boldSize24Text(Colors.white),
                      ),
                      size15VerticalSizedBox,
                      SearchWidget(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.searchPage);
                        },
                      ),
                      smallVerticalSizedBox,
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 16.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ActionCard(
                      title: addNewUserText,
                      iconUrl: addNewUserIconSvg,
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(AppRoutes.addNewPatientPage);
                      },
                    ),
                    ActionCard(
                      counter: '12',
                      title: serviceRequestsText,
                      iconUrl: serviceRequestsIconSvg,
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(AppRoutes.serviceRequestsPage);
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ActionCard(
                      key: contentCardKey,
                      title: contentString,
                      iconUrl: contentPageImage,
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRoutes.contentPage);
                      },
                    ),
                    ActionCard(
                      key: surveysCardKey,
                      title: surveysString,
                      iconUrl: surveysImageSvgPath,
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRoutes.surveysPage);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
