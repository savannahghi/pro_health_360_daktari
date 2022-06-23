import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/invite_members/invite_members_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/update_connectivity_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/connectivity_state.dart';
import 'package:http/http.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('InviteMembersAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() async {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial()
            .copyWith(connectivityState: ConnectivityState(isConnected: true)),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
    });

    test('should run successfully', () async {
      storeTester.dispatch(
        InviteMembersAction(
          client: MockTestGraphQlClient(),
          variables: <String, dynamic>{},
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(InviteMembersAction);

      expect(info.state.wait!.isWaitingFor(inviteMembersFlag), false);
    });

    test('should throw error if api call is not 200', () async {
      storeTester.dispatch(
        InviteMembersAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'error occurred'}),
              500,
            ),
          ),
          variables: <String, dynamic>{},
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(InviteMembersAction);

      expect(
        info.state,
        AppState.initial()
            .copyWith(connectivityState: ConnectivityState(isConnected: true)),
      );
      expect(
        (info.error! as UserException).msg,
        'Sorry, an unknown error occurred, please try again or get help from our '
        'help center.',
      );
    });

    test('should throw error if response has error', () async {
      storeTester.dispatch(
        InviteMembersAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'error occurred'}),
              200,
            ),
          ),
          variables: <String, dynamic>{},
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(InviteMembersAction);

      expect(
        info.state,
        AppState.initial()
            .copyWith(connectivityState: ConnectivityState(isConnected: true)),
      );
      expect(
        (info.error! as UserException).msg,
        getErrorMessage('inviting members'),
      );
    });

    test('should throw error if connection error', () async {
      storeTester.dispatch(UpdateConnectivityAction(hasConnection: false));
      String failureMessage = '';

      storeTester.dispatch(
        InviteMembersAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'error occurred'}),
              200,
            ),
          ),
          variables: <String, dynamic>{},
          onFailure: (String message) => failureMessage = message,
        ),
      );

      expect(failureMessage, '');

      final TestInfo<AppState> info =
          await storeTester.waitUntil(InviteMembersAction);

      expect(failureMessage, 'connection failure');

      expect(
        info.state,
        AppState.initial()
            .copyWith(connectivityState: ConnectivityState(isConnected: false)),
      );
    });
  });
}
