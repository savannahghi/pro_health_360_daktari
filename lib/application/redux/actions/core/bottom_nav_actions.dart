// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:healthcloud/application/redux/states/afyamoja_misc_state.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';

// Project imports:
import 'package:healthcloud/domain/core/entities/home/bottom_nav_obj.dart';

class BottomNavAction extends ReduxAction<CoreState> {
  BottomNavAction({required this.currentBottomNavIndex});

  final int currentBottomNavIndex;

  @override
  AppState reduce() {
    final AppState appState = state as AppState;

    final AfyaMojaMiscState newAfyaMojaMisc =
        appState.afyaMojaMiscState!.copyWith.call(
      bottomNavObj: BottomNavObj(currentBottomNavIndex: currentBottomNavIndex),
    );
    final AppState newState = appState.copyWith(
      afyaMojaMiscState: newAfyaMojaMisc,
    );
    return newState;
  }
}
