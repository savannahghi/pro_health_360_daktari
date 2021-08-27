import 'package:domain_objects/value_objects.dart';
import 'package:healthcloud/application/redux/states/practitioner_kyc_models/practitioner.dart';
import 'package:healthcloud/domain/core/entities/identification.dart';
import 'package:healthcloud/domain/core/entities/supporting_documents.dart';
import 'package:test/test.dart';

void main() {
  group('IndividualPractitioner:', () {
    test('equality test', () {
      final IndividualPractitioner state = IndividualPractitioner.initial();

      expect(state, IndividualPractitioner.initial());
    });

    test('should convert data from json to a IndividualPractitioner class', () {
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

      expect(
          IndividualPractitioner.fromJson(data), isA<IndividualPractitioner>());
    });
  });
}
