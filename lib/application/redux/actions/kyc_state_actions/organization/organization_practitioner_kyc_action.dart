import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/application/redux/states/practitioner_kyc_models/practitioner.dart';
import 'package:healthcloud/application/redux/states/practitioner_kyc_state.dart';
import 'package:healthcloud/domain/core/entities/identification.dart';
import 'package:healthcloud/domain/core/entities/supporting_documents.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/kyc_utils.dart';
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';

class OrganizationPractitionerKYCAction extends ReduxAction<CoreState> {
  final String? kraPin;
  final String? kraPinDocID;

  final String? cadre;
  final String? registrationNumber;

  final String? practiceLicenseID;
  final String? practiceLicenseDocID;

  final List<String>? practiceServices;

  final String? certificateOfIncorporation;
  final String? certificateOfIncorporationDocID;

  final String? idNumber;
  final String? idDocID;
  final String? idType;
  final String? organizationTypeName;

  final String? supportingDocumentTitle;
  final String? supportingDocumentDescription;
  final String? supportingDocumentUpload;

  final List<SupportingDocument>? supportingDocsBatchUpdate;
  final List<Identification>? directorIdentificationsBatchUpdate;

  OrganizationPractitionerKYCAction(
      {this.idDocID,
      this.idNumber,
      this.idType,
      this.kraPin,
      this.kraPinDocID,
      this.practiceLicenseDocID,
      this.practiceLicenseID,
      this.registrationNumber,
      this.certificateOfIncorporation,
      this.certificateOfIncorporationDocID,
      this.organizationTypeName,
      this.cadre,
      this.practiceServices,
      this.supportingDocumentTitle,
      this.supportingDocumentDescription,
      this.supportingDocumentUpload,
      this.supportingDocsBatchUpdate,
      this.directorIdentificationsBatchUpdate});

  @override
  AppState reduce() {
    final AppState appState = state as AppState;

    final OrganizationPractitioner organizationPractitionerFromState =
        appState.practitionerKYCState!.organizationPractitioner!;

    final Identification? newIdentification = getIdentificationDoc(
      idType,
      idNumber,
      idDocID,
    );

    final SupportingDocument? supportingDocument = getSupportingDoc(
      supportingDocumentTitle,
      supportingDocumentDescription,
      supportingDocumentUpload,
    );

    final PractitionerKYCState? newKycState =
        appState.practitionerKYCState?.copyWith.call(
      organizationPractitioner: OrganizationPractitioner(
        certificateOfIncorporation: certificateOfIncorporation ??
            organizationPractitionerFromState.certificateOfIncorporation,
        certificateOfInCorporationUploadID: certificateOfIncorporationDocID ??
            organizationPractitionerFromState
                .certificateOfInCorporationUploadID,
        directorIdentifications: directorIdentificationsBatchUpdate ??
            deconstructIdentificationDocuments(
              identificationsFromState:
                  organizationPractitionerFromState.directorIdentifications!,
              newIdentification: newIdentification,
            ),
        kraPin: kraPin ?? organizationPractitionerFromState.kraPin,
        organizationTypeName: organizationTypeName ??
            organizationPractitionerFromState.organizationTypeName,
        supportingDocuments: supportingDocsBatchUpdate ??
            deconstructSupportingDocuments(
                newSupportingDocument: supportingDocument,
                supportingDocumentsFromState:
                    organizationPractitionerFromState.supportingDocuments!),
        kraPinUploadId:
            kraPinDocID ?? organizationPractitionerFromState.kraPinUploadId,
        practiceLicenseID: practiceLicenseID ??
            organizationPractitionerFromState.practiceLicenseID,
        practiceLicenseUploadID: practiceLicenseDocID ??
            organizationPractitionerFromState.practiceLicenseUploadID,
        registrationNumber: registrationNumber ??
            organizationPractitionerFromState.registrationNumber,
        cadre: cadre ?? organizationPractitionerFromState.cadre,
        practiceServices: practiceServices ??
            organizationPractitionerFromState.practiceServices,
      ),
    );

    return appState.copyWith.call(practitionerKYCState: newKycState);
  }
}
