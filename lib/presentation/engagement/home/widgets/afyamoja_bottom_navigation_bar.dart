// Flutter imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/application/redux/actions/core/bottom_nav_actions.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/application/redux/view_models/bottom_nav_view_model.dart';
import 'package:healthcloud/domain/core/entities/home/bottom_nav_items.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/router/routes.dart';

class AfyaMojaBottomNavigationBar extends StatelessWidget {
  const AfyaMojaBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, BottomNavViewModel>(
      converter: (Store<AppState> store) => BottomNavViewModel.fromStore(store),
      builder: (BuildContext context, BottomNavViewModel vm) {
        return BottomNavigationBar(
          key: bottomNavKey,
          currentIndex: vm.currentIndex,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.secondaryColor,
          unselectedItemColor: AppColors.secondaryColor,
          onTap: (int currentIndex) {
            StoreProvider.dispatch<CoreState>(
              context,
              BottomNavAction(currentBottomNavIndex: currentIndex),
            );

            if (BottomNavIndex.home.index == currentIndex) {
              Navigator.pushNamed(context, homePage);
            }
            if (BottomNavIndex.community.index == currentIndex) {
              Navigator.pushNamed(context, communityPage);
            }
            if (BottomNavIndex.notifications.index == currentIndex) {
              Navigator.pushNamed(context, notificationsPage);
            }
          },
          items: bottomNavItems
              .map(
                (BottomNavItem navItem) => BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    navItem.iconUrl,
                    color: AppColors.secondaryColor.withOpacity(0.8),
                  ),
                  activeIcon: SvgPicture.asset(
                    navItem.iconUrl,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  label: navItem.text,
                ),
              )
              .toList(),
        );
      },
    );
  }
}
