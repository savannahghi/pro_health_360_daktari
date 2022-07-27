import 'package:flutter/material.dart';
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/notifications/fetch_notifications_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/notifications/fetch_notifications_filters_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/notifications/update_notification_filter_state.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/notifications/notifications_view_model.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/core/bottom_nav/bottom_nav_bar.dart';
import 'package:prohealth360_daktari/presentation/core/bottom_nav/bottom_nav_items.dart';
import 'package:prohealth360_daktari/presentation/notifications/notification_list_item.dart'
    as pro;
import 'package:afya_moja_core/src/domain/core/entities/notifications/notification_filter.dart';
import 'package:prohealth360_daktari/presentation/notifications/widgets/custom_chip_widget.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          const CustomAppBar(title: notificationsText, showBackButton: false),
      backgroundColor: AppColors.whiteColor,
      body: StoreConnector<AppState, NotificationsViewModel>(
        onInit: (Store<AppState> store) {
          store.dispatch(
            FetchNotificationFiltersAction(
              client: AppWrapperBase.of(context)!.graphQLClient,
            ),
          );
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
          }
          final List<NotificationDetails?> notifications = vm.notifications;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    height: 50,
                    child: ListView.builder(
                      key: notificationFiltersKey,
                      scrollDirection: Axis.horizontal,
                      itemCount: vm
                          .notificationFilterState?.notificationFilters?.length,
                      itemBuilder: (BuildContext context, int index) {
                        final List<NotificationFilter?>? filterList =
                            vm.notificationFilterState?.notificationFilters;

                        final bool isSelected = filterList?[index] ==
                            vm.notificationFilterState?.selectedFilter;

                        bool isRead = false;
                        if (filterList?[index]?.name?.compareTo(unread) != 0) {
                          isRead = true;
                        }
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 12,
                          ),
                          child: CustomChipWidget(
                            title: filterList?[index]?.name ?? '',
                            gestureKey: Key(index.toString()),
                            isSelected: isSelected,
                            onTap: () {
                              StoreProvider.dispatch(
                                context,
                                UpdateNotificationFilterStateAction(
                                  selectedFilter: filterList?[index],
                                ),
                              );
                              StoreProvider.dispatch(
                                context,
                                FetchNotificationsAction(
                                  client:
                                      AppWrapperBase.of(context)!.graphQLClient,
                                  filters: filterList?[index]?.type?.name,
                                  isRead: isRead,
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  if (notifications.isEmpty)
                    GenericErrorWidget(
                      actionKey: helpNoDataWidgetKey,
                      recoverCallback: () async {
                        StoreProvider.dispatch<AppState>(
                          context,
                          FetchNotificationsAction(
                            client: AppWrapperBase.of(context)!.graphQLClient,
                          ),
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
                  else
                    RefreshIndicator(
                      child: ListView.builder(
                        key: notificationsListViewKey,
                        shrinkWrap: true,
                        itemCount: notifications.length,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          final NotificationDetails?
                              currentNotificationDetails =
                              notifications.elementAt(index);

                          return pro.NotificationListItem(
                            notificationDetails: currentNotificationDetails,
                          );
                        },
                      ),
                      onRefresh: () async {
                        StoreProvider.dispatch(
                          context,
                          FetchNotificationsAction(
                            client: AppWrapperBase.of(context)!.graphQLClient,
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(
        bottomNavIndex: BottomNavIndex.notifications.index,
      ),
    );
  }
}
