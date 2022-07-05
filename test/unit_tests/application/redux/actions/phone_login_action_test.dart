import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/phone_login_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/connectivity_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';

import '../../../../mocks/mocks.dart';

void main() {
  group('PhoneLoginAction', () {
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
        PhoneLoginAction(
          httpClient: MockTestGraphQlClient(),
          phoneLoginEndpoint: '',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(PhoneLoginAction);

      expect(info.state.wait!.isWaitingFor(phoneLoginStateFlag), false);
    });

    test('should show a generic error if any other error occurs', () async {
      storeTester.dispatch(
        PhoneLoginAction(
          httpClient: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(json.encode(<String, dynamic>{'code': 100}), 400),
          ),
          phoneLoginEndpoint: '',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(PhoneLoginAction);

      expect((info.error! as UserException).msg, somethingWentWrongText);
    });

    test(
        'should show a no user found text in case wrong credentials are provided',
        () async {
      storeTester.dispatch(
        PhoneLoginAction(
          httpClient: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(json.encode(<String, dynamic>{'code': 7}), 400),
          ),
          phoneLoginEndpoint: '',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(PhoneLoginAction);

      expect((info.error! as UserException).msg, noUserFound);
    });

    test('should change to new user workflow when pin update is required',
        () async {
      // ignore: avoid_dynamic_calls
      pinChangeRequiredMock['response']['staffProfile']['user']
          ['pinUpdateRequired'] = true;
      storeTester.dispatch(
        PhoneLoginAction(
          httpClient: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              jsonEncode(pinChangeRequiredMock),
              201,
            ),
          ),
          phoneLoginEndpoint: '',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(NavigateAction);

      final NavigateAction<AppState>? actionDispatched =
          info.action as NavigateAction<AppState>?;

      final NavigatorDetails_PushNamedAndRemoveAll? navDetails =
          actionDispatched?.details
              as NavigatorDetails_PushNamedAndRemoveAll?;

      expect(navDetails?.newRouteName, AppRoutes.verifyPhonePage);
      expect(
        navDetails,
        isNotNull,
      );
    });
  });
}
