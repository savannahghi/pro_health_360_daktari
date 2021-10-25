// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:healthcloud/application/redux/states/app_state.dart';

class BottomNavViewModel {
  BottomNavViewModel({
    required this.currentIndex,
  });

  final int currentIndex;

  static BottomNavViewModel fromStore(Store<AppState> store) {
    return BottomNavViewModel(
      currentIndex:
          store.state.afyaMojaMiscState?.bottomNavObj?.currentBottomNavIndex ??
              0,
    );
  }
}
