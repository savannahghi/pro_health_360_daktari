import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/domain/core/entities/register_staff/register_staff_payload.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('RegisterStaffPayload', () {
    test('fromJson works', () {
      final RegisterStaffPayload mockRegisterStaffResponse =
          RegisterStaffPayload.fromJson(mockRegisterStaff);

      expect(mockRegisterStaffResponse, isA<RegisterStaffPayload>());
    });
  });
}
