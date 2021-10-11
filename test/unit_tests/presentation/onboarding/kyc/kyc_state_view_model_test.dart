// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/practitioner_kyc_state_view_model.dart';

void main() {
  final AppState state = AppState.initial();
  final Store<AppState> store = Store<AppState>(initialState: state);
  test(
      'PractitionerKYCStateViewModels objects with similar values return true when tested for equality',
      () {
    final PractitionerKYCStateViewModel kycState =
        PractitionerKYCStateViewModel.fromState(store.state);
    expect(kycState, PractitionerKYCStateViewModel.fromState(store.state));
    expect(kycState.hashCode,
        PractitionerKYCStateViewModel.fromState(store.state).hashCode);
  });
}
