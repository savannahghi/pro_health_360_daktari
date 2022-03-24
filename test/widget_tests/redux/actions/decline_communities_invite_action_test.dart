// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/redux/actions/communities/decline_communities_invite_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';

import '../../../mocks/mocks.dart';

void main() {
  group('AcceptDeclineCommunitiesInviteAction', () {
    late StoreTester<AppState> storeTester;

    setUpAll(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should throw error if api call is not 200', () async {
      storeTester.dispatch(
        DeclineCommunitiesInviteAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'error occured'}),
              500,
            ),
          ),
          communityID: '',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(DeclineCommunitiesInviteAction);

      expect(
        (info.error! as UserException).msg,
        somethingWentWrongText,
      );
    });

    test('should fail to reject an invitation if response is not correct',
        () async {
      storeTester.dispatch(
        DeclineCommunitiesInviteAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, dynamic>{
                'data': <String, dynamic>{
                  'rejectInvitation': null,
                }
              }),
              500,
            ),
          ),
          communityID: '',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(DeclineCommunitiesInviteAction);

      expect(
        (info.error! as UserException).msg,
        genericErrorOccurred,
      );
    });
  });
}
