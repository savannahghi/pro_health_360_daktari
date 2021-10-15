// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/application/redux/states/practitioner_kyc_state.dart';

class PractitionerKYCStateViewModel extends Vm {
  PractitionerKYCStateViewModel({
    required this.state,
    required this.wait,
    required this.kycSubmitted,
  });

  final bool kycSubmitted;
  final PractitionerKYCState state;
  final Wait wait;

  @override
  bool operator ==(Object old) {
    return identical(this, old) ||
        old is PractitionerKYCStateViewModel &&
            runtimeType == old.runtimeType &&
            state.identificationDoc == old.state.identificationDoc &&
            state.supportingDocuments == old.state.supportingDocuments &&
            state.registrationNumber == old.state.registrationNumber &&
            state.practiceLicenseID == old.state.practiceLicenseID &&
            state.practiceLicenseUploadID ==
                old.state.practiceLicenseUploadID &&
            state.practiceServices == old.state.practiceServices &&
            state.cadre == old.state.cadre &&
            state.practitionerSetupComplete ==
                old.state.practitionerSetupComplete &&
            state.kraPin == old.state.kraPin &&
            state.kraPinUploadId == old.state.kraPinUploadId &&
            state.kycType == old.state.kycType;
  }

  @override
  int get hashCode => state.hashCode;

  static PractitionerKYCStateViewModel fromState(AppState state) {
    return PractitionerKYCStateViewModel(
      state: state.practitionerKYCState!,
      wait: state.wait!,
      kycSubmitted: state.practitionerKYCState!.kycSubmitted,
    );
  }
}
