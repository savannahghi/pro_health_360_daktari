import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/presentation/core/bottom_nav/bottom_nav_items.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';

class DeepLinkAction extends ReduxAction<AppState> {
  @override
  AppState? reduce() {
    String initialRoute = state.miscState?.initialRoute ?? AppRoutes.loginPage;

    final bool isPhoneLogin = initialRoute.compareTo(AppRoutes.loginPage) == 0;

    if (!isPhoneLogin) {
      final int bottomNavIndex =
          state.bottomNavigationState?.currentBottomNavIndex ?? 0;
      initialRoute = bottomNavItems[bottomNavIndex].onTapRoute;
    }

    dispatch(
      NavigateAction<AppState>.pushReplacementNamed(initialRoute),
    );

    return null;
  }
}
