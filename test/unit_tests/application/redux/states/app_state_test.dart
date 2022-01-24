// Package imports:
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/application/redux/states/user_state.dart';
import 'package:test/test.dart';

void main() {
  group('AppState', () {
    test('equality test', () {
      AppState state = AppState.initial();
      expect(state, AppState.initial());

      state = state.copyWith(
        staffState: StaffState.initial().copyWith(
          userState: UserState.initial().copyWith(isSignedIn: true),
        ),
      );

      expect(state, isNot(equals(AppState.initial())));
    });
  });
}
