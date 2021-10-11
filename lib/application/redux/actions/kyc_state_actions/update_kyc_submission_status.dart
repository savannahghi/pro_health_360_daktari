// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';

// Project imports:
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/application/redux/states/practitioner_kyc_state.dart';

class UpdateKYCSubmissionStatusAction extends ReduxAction<CoreState> {
  UpdateKYCSubmissionStatusAction({required this.kycSubmitted});

  final bool kycSubmitted;

  @override
  AppState reduce() {
    final AppState appState = state as AppState;

    final PractitionerKYCState? newKycState = appState
        .practitionerKYCState?.copyWith
        .call(kycSubmitted: kycSubmitted);

    final AppState newState =
        appState.copyWith.call(practitionerKYCState: newKycState);

    return newState;
  }
}
