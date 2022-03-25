import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/domain/core/entities/core/role.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';

void main() {
  group('Role', () {
    test('fromJson', () {
      expect(
        Role.fromJson(<String, dynamic>{
          'name': 'SYSTEM_ADMINISTRATOR',
          'roleID': 'some-id',
          'active': true,
        }),
        Role(
          active: true,
          roleID: 'some-id',
          name: RoleValue.SYSTEM_ADMINISTRATOR,
        ),
      );
    });
  });
}
