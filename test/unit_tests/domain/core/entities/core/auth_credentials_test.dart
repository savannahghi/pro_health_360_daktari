// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:prohealth360_daktari/domain/core/entities/core/auth_credentials.dart';

void main() {
  group('AuthCredentials', () {
    test('fromJson works correctly', () {
      final AuthCredentials mockAuthCredentials =
          AuthCredentials.fromJson(AuthCredentials.initial().toJson());

      expect(mockAuthCredentials, isA<AuthCredentials>());
    });
  });
}
