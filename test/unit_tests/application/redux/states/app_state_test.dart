import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/staff_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/user.dart';

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
      final AppState appStateJson = AppState.fromJson(appStateMock);

      expect(appStateJson.onboardingState!.pin, UNKNOWN);
      expect(appStateJson.onboardingState!.confirmPIN, UNKNOWN);
    });
  });
}
