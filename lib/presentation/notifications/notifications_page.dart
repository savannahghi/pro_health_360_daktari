// Flutter imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:afya_moja_core/domain/core/entities/icon_details.dart';
import 'package:afya_moja_core/domain/core/entities/notification_actions.dart';
import 'package:afya_moja_core/notification_list_item.dart';
import 'package:healthcloud/application/core/services/utils.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';

// Project imports:
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/core/app_bar/custom_app_bar.dart';
import 'package:healthcloud/presentation/engagement/home/widgets/afyamoja_bottom_navigation_bar.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage();

  @override
  Widget build(BuildContext context) {
    final Store<AppState> _store =
        Store<AppState>(initialState: AppState.initial());
    return StoreProvider<AppState>(
      store: _store,
      child: Scaffold(
        appBar: const CustomAppBar(title: notificationsText),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (BuildContext context, int index) {
              final String description =
                  notifications.elementAt(index).description;
              final String date = notifications.elementAt(index).date;
              final IconDetails icon = notifications.elementAt(index).icon;
              final List<NotificationActions>? actions =
                  notifications.elementAt(index).actions;
              final String? status = notifications.elementAt(index).status;

              return Padding(
                padding: const EdgeInsets.only(top: 15),
                child: NotificationListItem(
                  icon: icon,
                  actions: actions,
                  status: status,
                  description: description,
                  date: date,
                ),
              );
            },
          ),
        ),
        bottomNavigationBar: const AfyaMojaBottomNavigationBar(),
      ),
    );
  }
}
