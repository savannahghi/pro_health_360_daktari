// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/domain/core/entities/search_user/role.dart';

// Project imports:

import '../../../../mocks/mocks.dart';

void main() {
  group('Role', () {
    test('expects to convert Role from json', () {
      final Role mockResponse =
          Role.fromJson(mockRoleResponse);
      expect(mockResponse, isA<Role>());
      expect(Role.initial(), isA<Role>());
    });
  });
}
