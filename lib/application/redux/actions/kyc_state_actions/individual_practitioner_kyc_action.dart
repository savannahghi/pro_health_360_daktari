import 'package:healthcloud/application/redux/states/practitioner_kyc_state.dart';
import 'package:healthcloud/domain/core/entities/identification.dart';
import 'package:healthcloud/domain/core/entities/supporting_documents.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/kyc_utils.dart';
import 'package:async_redux/async_redux.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';

class IndividualPractitionerKYCAction extends ReduxAction<CoreState> {
  final String? practiceLicenseID;
  final String? practiceLicenseDocID;

  final String? registrationNumber;

  final String? kraPin;
  final String? kraPinDocID;

  final String? idNumber;
  final String? idDocID;
  final String? idType;

  final String? cadre;
  final List<String>? practiceServices;
  final String? supportingDocumentTitle;
  final String? supportingDocumentDescription;
  final String? supportingDocumentUpload;

  final List<SupportingDocument>? supportingDocsBatchUpdate;

  IndividualPractitionerKYCAction({
    this.cadre,
    this.practiceServices,
    this.kraPin,
    this.kraPinDocID,
    this.idDocID,
    this.idNumber,
    this.idType,
    this.practiceLicenseDocID,
    this.practiceLicenseID,
    this.registrationNumber,
    this.supportingDocumentTitle,
    this.supportingDocumentDescription,
    this.supportingDocumentUpload,
    this.supportingDocsBatchUpdate,
  });

  @override
  AppState reduce() {
    final AppState appState = state as AppState;

    final PractitionerKYCState? individualPractitionerFromState =
        appState.practitionerKYCState;

    final SupportingDocument? supportingDocument = getSupportingDoc(
      supportingDocumentTitle,
      supportingDocumentDescription,
      supportingDocumentUpload,
    );

    final PractitionerKYCState? newKycState =
        appState.practitionerKYCState?.copyWith.call(
      identificationDoc: Identification(
        docNumber: idNumber ??
            individualPractitionerFromState!.identificationDoc!.docNumber,
        uploadID: idDocID ??
            individualPractitionerFromState!.identificationDoc!.uploadID,
        type:
            idType ?? individualPractitionerFromState!.identificationDoc!.type,
      ),
      kraPin: kraPin ?? individualPractitionerFromState!.kraPin,
      kraPinUploadId:
          kraPinDocID ?? individualPractitionerFromState!.kraPinUploadId,
      practiceLicenseID: practiceLicenseID ??
          individualPractitionerFromState!.practiceLicenseID,
      practiceLicenseUploadID: practiceLicenseDocID ??
          individualPractitionerFromState!.practiceLicenseUploadID,
      registrationNumber: registrationNumber ??
          individualPractitionerFromState!.registrationNumber,
      cadre: cadre ?? individualPractitionerFromState!.cadre,
      practiceServices:
          practiceServices ?? individualPractitionerFromState!.practiceServices,
      supportingDocuments: supportingDocsBatchUpdate ??
          deconstructSupportingDocuments(
              newSupportingDocument: supportingDocument,
              supportingDocumentsFromState:
                  individualPractitionerFromState!.supportingDocuments!),
    );

    final AppState newState =
        appState.copyWith.call(practitionerKYCState: newKycState);
    return newState;
  }
}
