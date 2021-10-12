// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:test/test.dart';

// Project imports:
import 'package:healthcloud/application/redux/states/practitioner_kyc_state.dart';
import 'package:healthcloud/domain/core/entities/identification.dart';
import 'package:healthcloud/domain/core/entities/supporting_documents.dart';

void main() {
  group('PractitionerKYCState:', () {
    test('equality test', () {
      final PractitionerKYCState state = PractitionerKYCState.initial();

      expect(state, PractitionerKYCState.initial());
    });

    test('should convert data from json to a PractitionerKYCState class', () {
      final Map<String, dynamic> data = <String, dynamic>{
        'identificationDoc': const Identification(
                type: 'MILITARY', docNumber: '12345', uploadID: 'photoFilename')
            .toJson(),
        'supportingDocuments': <SupportingDocument>[],
        'registrationNumber': UNKNOWN,
        'practiceLicenseID': UNKNOWN,
        'practiceLicenseUploadID': UNKNOWN,
        'practiceServices': <String>[],
        'cadre': UNKNOWN,
        'kraPin': UNKNOWN,
        'kraPinUploadId': UNKNOWN
      };

      expect(PractitionerKYCState.fromJson(data), isA<PractitionerKYCState>());
    });
  });
}
