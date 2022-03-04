// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myharehubpro/application/redux/states/app_state.dart';

// Project imports:

class BottomNavAction extends ReduxAction<AppState> {
  BottomNavAction({required this.currentBottomNavIndex});

  final int currentBottomNavIndex;

  @override
  AppState reduce() {
    final AppState newState = state.copyWith.bottomNavigationState!
        .call(currentBottomNavIndex: currentBottomNavIndex);

    return newState;
  }
}
