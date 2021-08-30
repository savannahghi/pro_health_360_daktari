import 'package:healthcloud/application/redux/states/practitioner_kyc_models/organization_details.dart';
import 'package:healthcloud/domain/core/entities/identification.dart';
import 'package:healthcloud/domain/core/entities/kra_details.dart';
import 'package:healthcloud/domain/core/entities/supporting_documents.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'practitioner.freezed.dart';
part 'practitioner.g.dart';

@freezed
class IndividualPractitioner with _$IndividualPractitioner {
  @Implements(KRADetails)
  factory IndividualPractitioner({
    Identification? identificationDoc,
    List<SupportingDocument>? supportingDocuments,
    String? registrationNumber,
    String? practiceLicenseID,
    String? practiceLicenseUploadID,
    List<String>? practiceServices,
    String? cadre,
    required String kraPin,
    required String kraPinUploadId,
  }) = _IndividualPractitioner;

  factory IndividualPractitioner.fromJson(Map<String, dynamic> json) =>
      _$IndividualPractitionerFromJson(json);

  factory IndividualPractitioner.initial() => IndividualPractitioner(
        kraPinUploadId: UNKNOWN,
        kraPin: UNKNOWN,
        identificationDoc: const Identification(
          type: UNKNOWN,
          docNumber: UNKNOWN,
          uploadID: UNKNOWN,
        ),
        cadre: UNKNOWN,
        practiceServices: <String>[],
        registrationNumber: UNKNOWN,
        practiceLicenseID: UNKNOWN,
        practiceLicenseUploadID: UNKNOWN,
        supportingDocuments: <SupportingDocument>[],
      );
}

@freezed
class OrganizationPractitioner with _$OrganizationPractitioner {
  @Implements(OrganizationDetails)
  factory OrganizationPractitioner({
    final String? registrationNumber,
    final String? practiceLicenseID,
    final String? practiceLicenseUploadID,
    final List<String>? practiceServices,
    final String? cadre,
    String? organizationTypeName,
    String? certificateOfIncorporation,
    String? certificateOfInCorporationUploadID,
    List<Identification>? directorIdentifications,
    List<SupportingDocument>? supportingDocuments,
    required String kraPin,
    required String kraPinUploadId,
  }) = _OrganizationPractitioner;

  factory OrganizationPractitioner.fromJson(Map<String, dynamic> json) =>
      _$OrganizationPractitionerFromJson(json);

  factory OrganizationPractitioner.initial() => OrganizationPractitioner(
        kraPinUploadId: UNKNOWN,
        kraPin: UNKNOWN,
        directorIdentifications: <Identification>[],
        certificateOfIncorporation: UNKNOWN,
        certificateOfInCorporationUploadID: UNKNOWN,
        organizationTypeName: UNKNOWN,
        supportingDocuments: <SupportingDocument>[],
        cadre: UNKNOWN,
        practiceServices: <String>[],
        registrationNumber: UNKNOWN,
        practiceLicenseID: UNKNOWN,
        practiceLicenseUploadID: UNKNOWN,
      );
}
