import 'package:afya_moja_core/community_list_item.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/community/widgets/community_page_app_bar.dart';
import 'package:healthcloud/presentation/engagement/home/widgets/afyamoja_bottom_navigation_bar.dart';

class CommunityListViewPage extends StatelessWidget {
  const CommunityListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Placeholder
    const String dontMissAppointmentMessage =
        "Don't miss your appointment tomorrow";
    const AssetImage avatarImage = AssetImage('assets/images/doctor-2.jpg');
    const String date = 'July 12 2021';

    const List<Widget> items = <Widget>[
      CommunityListItem(
        title: 'Ruaka Questions group',
        unreadNotificationCount: 4,
        isGroupMessage: true,
        message: dontMissAppointmentMessage,
        avatarImage: avatarImage,
        lastMessageDate: date,
      ),
      CommunityListItem(
        title: 'Ruaka Questions group',
        isGroupMessage: true,
        message: dontMissAppointmentMessage,
        avatarImage: avatarImage,
        lastMessageDate: date,
      ),
      CommunityListItem(
        title: 'My Afya Guide',
        message: dontMissAppointmentMessage,
        avatarImage: avatarImage,
        lastMessageDate: date,
      ),
    ];

    final Store<AppState> _store =
        Store<AppState>(initialState: AppState.initial());

    return StoreProvider<AppState>(
      store: _store,
      child: Scaffold(
        appBar: const CommunityPageAppBar(),
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            ListView.builder(
              key: communityListViewKey,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (_, int index) {
                return GestureDetector(child: items[index]);
              },
            ),
          ],
        ),
        bottomNavigationBar: const AfyaMojaBottomNavigationBar(),
      ),
    );
  }
}
