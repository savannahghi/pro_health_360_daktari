import 'package:healthcloud/domain/core/entities/identification.dart';
import 'package:healthcloud/domain/core/entities/kra_details.dart';
import 'package:healthcloud/domain/core/entities/supporting_documents.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:healthcloud/domain/core/value_objects/app_enums.dart';

part 'practitioner_kyc_state.freezed.dart';
part 'practitioner_kyc_state.g.dart';

@freezed
class PractitionerKYCState with _$PractitionerKYCState {
  @Implements(KRADetails)
  factory PractitionerKYCState({
    Identification? identificationDoc,
    List<SupportingDocument>? supportingDocuments,
    String? registrationNumber,
    String? practiceLicenseID,
    String? practiceLicenseUploadID,
    List<String>? practiceServices,
    String? cadre,
    @Default(false) bool practitionerSetupComplete,
    @Default(false) bool kycSubmitted,
    required String kraPin,
    required String kraPinUploadId,
    @JsonKey(unknownEnumValue: KYCType.Unknown, defaultValue: KYCType.Unknown)
        required KYCType kycType,
  }) = _PractitionerKYCState;

  factory PractitionerKYCState.fromJson(Map<String, dynamic> json) =>
      _$PractitionerKYCStateFromJson(json);

  factory PractitionerKYCState.initial() => PractitionerKYCState(
        kycType: KYCType.Unknown,
        practitionerSetupComplete: false,
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
