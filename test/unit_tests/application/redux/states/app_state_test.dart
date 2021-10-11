// Package imports:
import 'package:bewell_pro_core/application/redux/states/clinical_state.dart';
import 'package:test/test.dart';

// Project imports:
import 'package:healthcloud/application/redux/states/app_state.dart';

void main() {
  group('AppState', () {
    test('equality test', () {
      AppState state = AppState.initial();
      expect(state, AppState.initial());

      state = state.copyWith(
        clinicalState:
            ClinicalState.initial().copyWith(patientSearchFound: true),
      );

      expect(state, isNot(equals(AppState.initial())));
    });
  });
}
