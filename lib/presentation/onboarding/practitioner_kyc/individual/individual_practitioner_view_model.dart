// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/application/redux/states/practitioner_kyc_state.dart';
import 'package:healthcloud/domain/core/entities/supporting_documents.dart';

class IndividualPractitionerViewModel extends Vm {
  IndividualPractitionerViewModel({
    required this.registrationNo,
    required this.license,
    required this.cadre,
    required this.services,
    required this.idType,
    required this.idNumber,
    required this.idDocId,
    required this.kraPinNumber,
    required this.kraPinDocId,
    this.supportingDocuments,
    required this.wait,
  }) : super(equals: <Object?>[
          registrationNo,
          license,
          cadre,
          services,
          idType,
          idNumber,
          idDocId,
          kraPinNumber,
          kraPinDocId,
          supportingDocuments,
          wait
        ]);

  final String? cadre;
  final String? idDocId;
  final String? idNumber;
  final String? idType;
  final String? kraPinDocId;
  final String? kraPinNumber;
  final String? license;
  final String? registrationNo;
  final List<String>? services;
  final List<SupportingDocument>? supportingDocuments;
  final Wait wait;

  static IndividualPractitionerViewModel fromState(AppState appState) {
    final PractitionerKYCState practitionerState =
        appState.practitionerKYCState!;

    return IndividualPractitionerViewModel(
      registrationNo: practitionerState.registrationNumber,
      license: practitionerState.practiceLicenseID,
      cadre: practitionerState.cadre,
      services: practitionerState.practiceServices,
      idType: practitionerState.identificationDoc!.type,
      idNumber: practitionerState.identificationDoc!.docNumber,
      idDocId: practitionerState.identificationDoc!.uploadID,
      kraPinNumber: practitionerState.kraPin,
      kraPinDocId: practitionerState.kraPinUploadId,
      supportingDocuments: practitionerState.supportingDocuments,
      wait: appState.wait!,
    );
  }
}
