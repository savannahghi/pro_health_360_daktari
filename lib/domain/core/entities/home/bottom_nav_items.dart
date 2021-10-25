// Project imports:
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/presentation/router/routes.dart';

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

enum BottomNavIndex { home, community, notifications }

List<BottomNavItem> bottomNavItems = <BottomNavItem>[
  BottomNavItem(
    iconUrl: homeIconSvgPath,
    text: 'Home',
    onTapRoute: homePage,
    index: BottomNavIndex.home.index,
  ),
  BottomNavItem(
    iconUrl: communityIconSvgPath,
    text: 'Community',
    onTapRoute: communityPage,
    index: BottomNavIndex.community.index,
  ),
  BottomNavItem(
    iconUrl: notificationsIconSvgPath,
    text: 'Notifications',
    onTapRoute: notificationsPage,
    index: BottomNavIndex.notifications.index,
  ),
];
