// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/domain/core/entities/profile/client_response.dart';

// Project imports:

import '../../../../mocks/mocks.dart';

void main() {
  group('ClientResponse', () {
    test('expects to convert ClientResponse from json', () {
      final ClientResponse mockResponse =
          ClientResponse.fromJson(mockClientResponse);
      expect(mockResponse, isA<ClientResponse>());
      expect(ClientResponse.initial(), isA<ClientResponse>());
    });
  });
}
