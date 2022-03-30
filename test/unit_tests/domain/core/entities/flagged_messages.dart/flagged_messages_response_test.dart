// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/domain/core/entities/flagged_messages/flagged_message.dart';
import 'package:mycarehubpro/domain/core/entities/flagged_messages/flagged_message_user.dart';
import 'package:mycarehubpro/domain/core/entities/flagged_messages/flagged_messages_response.dart';
import 'package:mycarehubpro/domain/core/entities/flagged_messages/message.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('NotificationDetails', () {
    test('expects to convert NotificationDetails from json', () {
      expect(
        FlaggedMessagesResponse.initial().copyWith(
          messages: <FlaggedMessage>[
            FlaggedMessage.initial(),
            FlaggedMessage.initial().copyWith(
              message: Message.initial().copyWith(
                user: FlaggedMessageUser.initial(),
              ),
            )
          ],
        ),
        isA<FlaggedMessagesResponse>(),
      );

      final FlaggedMessagesResponse mockFlaggedMessages =
          FlaggedMessagesResponse.fromJson(<String, dynamic>{
        'listFlaggedMessages': mockListFlaggedMessages
      });
      expect(mockFlaggedMessages, isA<FlaggedMessagesResponse>());
    });
  });
}
