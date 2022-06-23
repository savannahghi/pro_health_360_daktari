import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/bottom_nav/bottom_nav_items.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({required this.bottomNavIndex});
  final int bottomNavIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      key: bottomNavKey,
      currentIndex: bottomNavIndex,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Theme.of(context).colorScheme.secondary,
      unselectedItemColor: AppColors.secondaryColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (int currentIndex) {
        if (bottomNavIndex != currentIndex) {
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
  }
}
