import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myharehubpro/application/core/theme/app_themes.dart';
import 'package:myharehubpro/application/redux/actions/core/bottom_nav_action.dart';
import 'package:myharehubpro/application/redux/states/app_state.dart';
import 'package:myharehubpro/application/redux/view_models/bottom_nav_view_model.dart';
import 'package:myharehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:myharehubpro/presentation/core/bottom_nav/bottom_nav_items.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

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
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          unselectedItemColor: AppColors.secondaryColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (int currentIndex) {
            StoreProvider.dispatch<AppState>(
              context,
              BottomNavAction(currentBottomNavIndex: currentIndex),
            );

            if (vm.currentIndex != currentIndex) {
              Navigator.pushReplacementNamed(
                context,
                bottomNavItems[currentIndex].onTapRoute,
              );
            }
          },
          items: bottomNavItems
              .map(
                (BottomNavItem navItem) => BottomNavigationBarItem(
                  icon: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: SvgPicture.asset(
                          navItem.iconUrl,
                          color: AppColors.secondaryColor.withOpacity(0.8),
                        ),
                      ),
                      Text(
                        navItem.text,
                        style: normalSize12Text(
                          AppColors.secondaryColor.withOpacity(0.8),
                        ),
                      )
                    ],
                  ),
                  activeIcon: Container(
                    padding: const EdgeInsets.all(8.0),
                    width: 65,
                    decoration: BoxDecoration(
                      color: AppColors.selectedBottomNavColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: SvgPicture.asset(
                            navItem.iconUrl,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          navItem.text,
                          style: normalSize12Text(Colors.white),
                        )
                      ],
                    ),
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
