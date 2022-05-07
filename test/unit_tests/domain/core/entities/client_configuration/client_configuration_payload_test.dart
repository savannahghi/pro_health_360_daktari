// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/domain/core/entities/surveys/client_configuration_payload.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('ClientConfigurationPayload', () {
    test('fromJson works', () {
      final ClientConfigurationPayload mockClientConfigurationResponse =
          ClientConfigurationPayload.fromJson(mockClientConfigurationPayload);
      expect(
        mockClientConfigurationResponse,
        isA<ClientConfigurationPayload>(),
      );
    });
  });
}
