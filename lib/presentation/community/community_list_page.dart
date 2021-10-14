import 'package:afya_moja_core/community_list_item.dart';
import 'package:flutter/material.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';

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

    return Scaffold(
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
    );
  }
}
