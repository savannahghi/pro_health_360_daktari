import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/redux/actions/communities/update_communities_state_action.dart';
import 'package:mycarehubpro/application/redux/actions/flagged_messages/delete_community_message_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/states/connectivity_state.dart';
import 'package:mycarehubpro/domain/core/entities/flagged_messages/flagged_message.dart';
import 'package:mycarehubpro/domain/core/entities/flagged_messages/message.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('DeleteCommunityMessageAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial().copyWith(
          connectivityState: ConnectivityState(isConnected: true),
        ),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should update communities state', () async {
      storeTester.dispatch(
        UpdateCommunitiesStateAction(
          flaggedMessages: <FlaggedMessage>[
            FlaggedMessage(
              message: Message.initial().copyWith(
                messageID: 'id-1',
              ),
            ),
            FlaggedMessage(
              message: Message.initial().copyWith(
                messageID: 'id-2',
              ),
            ),
          ],
        ),
      );

      storeTester.dispatch(
        DeleteCommunityMessageAction(
          client: MockTestGraphQlClient(),
          messageID: 'id-2',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(DeleteCommunityMessageAction);

      expect(
        info.state.staffState?.communitiesState?.flaggedMessages?.length,
        1,
      );
    });

    test('should not update state if error occurs during API call', () async {
      storeTester.dispatch(
        DeleteCommunityMessageAction(
          client: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              json.encode(<String, dynamic>{'errors': 'error'}),
              201,
            ),
          ),
          messageID: 'message-id',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(DeleteCommunityMessageAction);

      expect(
        (info.error! as UserException).msg,
        somethingWentWrongText,
      );
    });
  });
}
