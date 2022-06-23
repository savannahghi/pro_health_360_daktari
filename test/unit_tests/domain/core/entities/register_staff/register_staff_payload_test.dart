import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/domain/core/entities/register_staff/register_staff_payload.dart';

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
