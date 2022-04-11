// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/domain/core/entities/flagged_messages/flagged_messages_response.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('FlaggedMessagesResponse', () {
    test('expects to convert FlaggedMessagesResponse from json', () {
      final FlaggedMessagesResponse mockFlaggedMessages =
          FlaggedMessagesResponse.fromJson(<String, dynamic>{
        'listFlaggedMessages': mockListFlaggedMessages
      });
      expect(mockFlaggedMessages, isA<FlaggedMessagesResponse>());
    });
  });
}
