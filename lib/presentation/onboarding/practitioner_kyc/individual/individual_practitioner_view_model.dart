import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/application/redux/states/practitioner_kyc_state.dart';
import 'package:healthcloud/domain/core/entities/supporting_documents.dart';
import 'package:async_redux/async_redux.dart';

class IndividualPractitionerViewModel extends Vm {
  final String? registrationNo;
  final String? license;
  final String? cadre;
  final List<String>? services;

  final String? idType;
  final String? idNumber;
  final String? idDocId;

  final String? kraPinNumber;
  final String? kraPinDocId;
  final List<SupportingDocument>? supportingDocuments;

  final Wait wait;

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
