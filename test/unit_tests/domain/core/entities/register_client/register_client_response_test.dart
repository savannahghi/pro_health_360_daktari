// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:myharehubpro/domain/core/entities/register_client/register_client_response.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('RegisterClientResponse', () {
    test('expects to convert NotificationDetails from json', () {
      final RegisterClientResponse mockRegisterClientResponse =
          RegisterClientResponse.fromJson(mockRegisterClient);
      expect(mockRegisterClientResponse, isA<RegisterClientResponse>());
    });
  });
}
