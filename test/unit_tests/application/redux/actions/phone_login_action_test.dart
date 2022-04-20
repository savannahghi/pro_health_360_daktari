import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/redux/actions/core/phone_login_action.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/states/connectivity_state.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/onboarding/verify_phone/pages/verify_phone_page.dart';
import 'package:mycarehubpro/presentation/router/routes.dart';

import '../../../../mocks/mocks.dart';

void main() {
  group('PhoneLoginAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial()
            .copyWith(connectivityState: ConnectivityState(isConnected: true)),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
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

      expect(
        (info.error! as UserException).msg,
        somethingWentWrongText,
      );
    });

    test('should change to new user workflow when pin update is required',
        () async {
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

      final NavigatorDetails_PushNamedAndRemoveUntil? navDetails =
          actionDispatched?.details
              as NavigatorDetails_PushNamedAndRemoveUntil?;

      expect(navDetails?.newRouteName, AppRoutes.verifyPhonePage);
      expect(
        navDetails?.predicate.call(
          MaterialPageRoute<VerifyPhonePage>(
            builder: (BuildContext context) => VerifyPhonePage(),
          ),
        ),
        false,
      );
    });
  });
}
