// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/application/redux/actions/core/bottom_nav_action.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/actions/notifications/fetch_notifications_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/view_models/notifications/notifications_view_model.dart';
// Project imports:
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:mycarehubpro/presentation/core/bottom_nav/bottom_nav_bar.dart';
import 'package:mycarehubpro/presentation/core/bottom_nav/bottom_nav_items.dart';
import 'package:mycarehubpro/presentation/notifications/notification_list_item.dart'
    as pro;
import 'package:mycarehubpro/presentation/router/routes.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: notificationsText,
        showBackButton: false,
      ),
      backgroundColor: AppColors.whiteColor,
      body: StoreConnector<AppState, NotificationsViewModel>(
        onInit: (Store<AppState> store) {
          store.dispatch(
            FetchNotificationsAction(
              client: AppWrapperBase.of(context)!.graphQLClient,
            ),
          );
        },
        converter: (Store<AppState> store) =>
            NotificationsViewModel.fromStore(store),
        builder: (BuildContext context, NotificationsViewModel vm) {
          if (vm.wait.isWaitingFor(fetchNotificationsFlag)) {
            return Container(
              height: 300,
              padding: const EdgeInsets.all(20),
              child: const PlatformLoader(),
            );
          } else {
            final List<NotificationDetails?> notifications = vm.notifications;
            return Padding(
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
                          AppRoutes.homePage,
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
                  : RefreshIndicator(
                      onRefresh: () async {
                        StoreProvider.dispatch<AppState>(
                          context,
                          FetchNotificationsAction(
                            client: AppWrapperBase.of(context)!.graphQLClient,
                          ),
                        );
                      },
                      child: ListView.builder(
                        itemCount: notifications.length,
                        itemBuilder: (BuildContext context, int index) {
                          final NotificationDetails?
                              currentNotificationDetails =
                              notifications.elementAt(index);

                          return pro.NotificationListItem(
                            notificationDetails: currentNotificationDetails,
                          );
                        },
                      ),
                    ),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavBar(
        bottomNavIndex: BottomNavIndex.notifications.index,
      ),
    );
  }
}
