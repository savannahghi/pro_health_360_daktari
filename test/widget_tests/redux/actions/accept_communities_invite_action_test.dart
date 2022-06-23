// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
// Project imports:
import 'package:prohealth360_daktari/application/redux/actions/communities/accept_communities_invite_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';

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
        AcceptCommunitiesInviteAction(
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
          await storeTester.waitUntil(AcceptCommunitiesInviteAction);

      expect(
        (info.error! as UserException).msg,
        somethingWentWrongText,
      );
    });

    test('should fail to accept an invitation is response is not correct',
        () async {
      storeTester.dispatch(
        AcceptCommunitiesInviteAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, dynamic>{
                'data': <String, dynamic>{
                  'acceptInvitation': null,
                }
              }),
              500,
            ),
          ),
          communityID: '',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(AcceptCommunitiesInviteAction);

      expect(
        (info.error! as UserException).msg,
        genericErrorOccurred,
      );
    });
  });
}
