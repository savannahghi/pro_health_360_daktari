import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/application/redux/states/practitioner_kyc_state.dart';
import 'package:async_redux/async_redux.dart';

class PractitionerKYCStateViewModel extends Vm {
  final PractitionerKYCState state;
  final Wait wait;

  PractitionerKYCStateViewModel({required this.state, required this.wait});

  static PractitionerKYCStateViewModel fromState(AppState state) {
    return PractitionerKYCStateViewModel(
      state: state.practitionerKYCState!,
      wait: state.wait!,
    );
  }

  @override
  int get hashCode => state.hashCode;

  @override
  bool operator ==(Object old) {
    return identical(this, old) ||
        old is PractitionerKYCStateViewModel &&
            runtimeType == old.runtimeType &&
            state.individualPractitioner == old.state.individualPractitioner &&
            state.organizationPractitioner ==
                old.state.organizationPractitioner;
  }
}
