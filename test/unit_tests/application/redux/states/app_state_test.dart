// Package imports:
// Project imports:
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/entities/core/staff_state.dart';
import 'package:healthcloud/domain/core/entities/core/user.dart';
import 'package:test/test.dart';

import '../../../../mocks/mocks.dart';

void main() {
  group('AppState', () {
    test('equality test', () {
      AppState state = AppState.initial();
      expect(state, AppState.initial());

      state = state.copyWith(
        staffState: StaffState.initial().copyWith(
          user: User.initial().copyWith(active: true),
        ),
      );

      expect(state, isNot(equals(AppState.initial())));
    });

    test('fromJson', () {
      expect(
        AppState.fromJson(appstateMock),
        AppState.initial().copyWith(wait: null),
      );
    });
  });
}
