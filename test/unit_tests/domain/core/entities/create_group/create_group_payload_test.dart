// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/domain/core/entities/create_group/create_group_payload.dart';

void main() {
  group('CreateGroupPayload', () {
    test('fromJson works', () {
      final CreateGroupPayload mockCreateGroupPayload =
          CreateGroupPayload.fromJson(<String, dynamic>{
        'name': 'Test',
        'description': 'Test group',
        'ageRange': <String, dynamic>{'lowerBound': 17.0, 'upperBound': 25.0},
        'gender': <String>['male', 'female'],
        'clientType': <String>['PMTCT', 'OVC'],
        'inviteOnly': false
      });

      expect(mockCreateGroupPayload, isA<CreateGroupPayload>());
    });
  });
}
