// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:misc_utilities/misc.dart';
import 'package:misc_utilities/number_constants.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/engagement/home/widgets/action_card.dart';
import 'package:healthcloud/presentation/engagement/home/widgets/appbar_user.dart';
import 'package:healthcloud/presentation/engagement/home/widgets/search_widget.dart';

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
                        style: TextThemes.veryBoldSize28Text(Colors.white),
                      ),
                      Text(
                        getGreetingMessage(firstName),
                        style: TextThemes.boldSize24Text(Colors.white),
                      ),
                      size15VerticalSizedBox,
                      const SearchWidget(),
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
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(comingSoonText),
                          ),
                        );
                      },
                    ),
                    ActionCard(
                      counter: '12',
                      title: serviceRequestsText,
                      iconUrl: serviceRequestsIconSvg,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(comingSoonText),
                          ),
                        );
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
                      key: profileUpdateCardKey,
                      counter: '4',
                      title: profileUpdateText,
                      iconUrl: profileUpdateIconSvg,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(comingSoonText),
                          ),
                        );
                      },
                    ),
                    ActionCard(
                      key: contactRequestCardKey,
                      title: contactRequestText,
                      iconUrl: contactRequestIconSvg,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(comingSoonText),
                          ),
                        );
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
