import 'package:healthcloud/domain/core/entities/identification.dart';
import 'package:healthcloud/domain/core/entities/supporting_documents.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/kyc_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('kyc_utils', () {
    test('removeSupportingDoc removes the intended SupportingDocument', () {
      const List<SupportingDocument> supportingDocs = <SupportingDocument>[
        SupportingDocument(
            description: 'first description',
            title: 'first title',
            upload: 'first upload'),
        SupportingDocument(
            description: 'second description',
            title: 'second title',
            upload: 'second upload'),
        SupportingDocument(
            description: 'third description',
            title: 'third title',
            upload: 'third upload'),
      ];

      List<SupportingDocument> removedDocs =
          removeSupportingDoc(supportingDocs, 'nonexisting title', '');
      expect(removedDocs, supportingDocs);

      removedDocs = removeSupportingDoc(
          supportingDocs, 'first title', 'first description');
      expect(removedDocs, supportingDocs.skip(1).toList());

      removedDocs = removeSupportingDoc(
          supportingDocs, 'second title', 'third description');
      expect(removedDocs, <SupportingDocument>[supportingDocs.first]);
    });

    test('addOrRemoveService functions correctly', () {
      final List<String> servicesList = <String>[
        'OUTPATIENT_SERVICES',
        'PHARMACY'
      ];

      expect(
          addOrRemoveService(
                  services: servicesList, value: 'PHARMACY', shouldAdd: false)
              .length,
          1);
      expect(
          addOrRemoveService(
                  services: servicesList, shouldAdd: true, value: 'PHARMACY')
              .length,
          2);
    });

    test('removeIdentificationDoc', () {
      const List<Identification> identifications = <Identification>[
        Identification(type: 'type 1', docNumber: 'number 1', uploadID: 'id 1'),
        Identification(type: 'type 2', docNumber: 'number 2', uploadID: 'id 2'),
      ];

      expect(removeIdentificationDoc(identifications, ''), identifications);
      expect(removeIdentificationDoc(identifications, 'number 1'),
          identifications.skip(1).toList());
    });
  });
}
