// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/domain/core/entities/register_client/register_client_payload.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('RegisterClientPayload', () {
    test('fromJson works', () {
      final RegisterClientPayload mockRegisterClientResponse =
          RegisterClientPayload.fromJson(mockRegisterPayload);
      expect(mockRegisterClientResponse, isA<RegisterClientPayload>());
    });
  });
}
