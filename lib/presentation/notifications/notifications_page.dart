// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myharehubpro/application/core/theme/app_themes.dart';
import 'package:myharehubpro/application/redux/actions/core/bottom_nav_action.dart';
import 'package:myharehubpro/application/redux/states/app_state.dart';
// Project imports:
import 'package:myharehubpro/domain/core/entities/notification/notification_details.dart';
import 'package:myharehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:myharehubpro/domain/core/value_objects/app_strings.dart';
import 'package:myharehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:myharehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:myharehubpro/presentation/core/bottom_nav/bottom_nav_bar.dart';
import 'package:myharehubpro/presentation/core/bottom_nav/bottom_nav_items.dart';

class NotificationsPage extends StatelessWidget {
  final List<NotificationDetails> notifications;

  const NotificationsPage({required this.notifications});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: notificationsText,
        showBackButton: false,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: notifications.isEmpty
            ? GenericErrorWidget(
                actionKey: helpNoDataWidgetKey,
                actionText: actionTextGenericNoData,
                recoverCallback: () async {
                  StoreProvider.dispatch<AppState>(
                    context,
                    BottomNavAction(currentBottomNavIndex: 0),
                  );
                  Navigator.pushReplacementNamed(
                    context,
                    bottomNavItems[0].onTapRoute,
                  );
                },
                headerIconSvgUrl: noNotificationsImageSvgPath,
                messageTitle: noNotificationsTitle,
                messageBody: <TextSpan>[
                  TextSpan(
                    text: noNotificationsDescription,
                    style: normalSize16Text(
                      AppColors.greyTextColor,
                    ),
                  ),
                ],
              )
            : ListView.builder(
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
                      descriptionColor: AppColors.buttonAltColor,
                      date: date,
                    ),
                  );
                },
              ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
