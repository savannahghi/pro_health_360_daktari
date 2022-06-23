import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';

class BottomNavItem {
  const BottomNavItem({
    required this.iconUrl,
    required this.text,
    required this.onTapRoute,
    required this.index,
    this.onTapRouteArguments,
  });

  final String iconUrl;
  final int index;
  final String onTapRoute;
  final Map<String, dynamic>? onTapRouteArguments;
  final String text;
}

enum BottomNavIndex { home, communities, notifications }

List<BottomNavItem> bottomNavItems = <BottomNavItem>[
  BottomNavItem(
    iconUrl: homeIconSvgPath,
    text: 'Home',
    onTapRoute: AppRoutes.homePage,
    index: BottomNavIndex.home.index,
  ),
  BottomNavItem(
    iconUrl: communityIconSvgPath,
    text: 'Conversations',
    onTapRoute: AppRoutes.communityPage,
    index: BottomNavIndex.communities.index,
  ),
  BottomNavItem(
    iconUrl: notificationIconSvgPath,
    text: 'Notifications',
    onTapRoute: AppRoutes.notificationsPage,
    index: BottomNavIndex.notifications.index,
  ),
];
