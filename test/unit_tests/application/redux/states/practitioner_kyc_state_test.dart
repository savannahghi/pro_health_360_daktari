import 'package:domain_objects/value_objects.dart';
import 'package:healthcloud/application/redux/states/practitioner_kyc_models/practitioner.dart';
import 'package:healthcloud/application/redux/states/practitioner_kyc_state.dart';
import 'package:healthcloud/domain/core/entities/identification.dart';
import 'package:healthcloud/domain/core/entities/supporting_documents.dart';
import 'package:healthcloud/domain/core/value_objects/app_enums.dart';
import 'package:test/test.dart';

void main() {
  group('PractitionerKYCState:', () {
    test('equality test', () {
      final PractitionerKYCState state = PractitionerKYCState.initial();

      expect(state, PractitionerKYCState.initial());
    });

    test('should convert data from json to a KYCRequestsState class', () {
      final Map<String, dynamic> practitionerKYCState = <String, dynamic>{
        'kycType': KYCType.unknown,
        'individualPractitioner': IndividualPractitioner(
          supportingDocuments: <SupportingDocument>[],
          registrationNumber: UNKNOWN,
          practiceLicenseID: UNKNOWN,
          practiceLicenseUploadID: UNKNOWN,
          practiceServices: <String>[],
          cadre: UNKNOWN,
          kraPin: UNKNOWN,
          kraPinUploadId: UNKNOWN,
        ).toJson(),
        'organizationPractitioner': OrganizationPractitioner(
          registrationNumber: UNKNOWN,
          practiceLicenseID: UNKNOWN,
          practiceLicenseUploadID: UNKNOWN,
          practiceServices: <String>[],
          cadre: UNKNOWN,
          organizationTypeName: UNKNOWN,
          certificateOfIncorporation: UNKNOWN,
          certificateOfInCorporationUploadID: UNKNOWN,
          directorIdentifications: <Identification>[],
          supportingDocuments: <SupportingDocument>[],
          kraPin: UNKNOWN,
          kraPinUploadId: UNKNOWN,
        ).toJson()
      };

      expect(PractitionerKYCState.fromJson(practitionerKYCState),
          isA<PractitionerKYCState>());
    });
  });
}
