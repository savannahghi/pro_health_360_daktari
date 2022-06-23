import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/communities/stream_token_provider.dart';
import 'package:prohealth360_daktari/infrastructure/endpoints.dart';
import 'package:http/http.dart';

import '../../../mocks/mocks.dart';

void main() {
  group('StreamTokenProvider', () {
    test('should return token if request successful', () async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, dynamic>{'getStreamToken': 'some-token'}),
          200,
        ),
      );

      final StreamTokenProvider tokenProvider = StreamTokenProvider(
        client: client,
        endpoint: kTestRefreshStreamTokenEndpoint,
      );

      final String newToken = await tokenProvider.tokenProvider('userId');

      expect(newToken, 'some-token');
    });

    test('should return empty string if not successful', () async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, dynamic>{'error': 'some error'}),
          400,
        ),
      );

      final StreamTokenProvider tokenProvider = StreamTokenProvider(
        client: client,
        endpoint: kTestRefreshStreamTokenEndpoint,
      );

      final String newToken = await tokenProvider.tokenProvider('userId');

      expect(newToken, '');
    });
  });
}
