import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/application/redux/actions/set_nick_name_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/presentation/engagement/home/pages/home_page.dart';
import 'package:healthcloud/presentation/router/routes.dart';
import 'package:http/http.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('SetNicknameAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should update onboarding state', () async {
      storeTester.dispatch(SetNicknameAction(client: MockTestGraphQlClient()));

      final TestInfo<AppState> info =
          await storeTester.waitUntil(SetNicknameAction);

      expect(info.state.onboardingState?.hasSetNickName, true);
    });

    test('should not update state if error occurs during API call', () async {
      storeTester.dispatch(
        SetNicknameAction(
          client: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              json.encode(<String, dynamic>{'errors': 'error'}),
              201,
            ),
          ),
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(SetNicknameAction);

      expect(info.state.onboardingState?.hasSetNickName, false);
    });

    test('navigates to next page successfully', () async {
      storeTester.dispatch(SetNicknameAction(client: MockTestGraphQlClient()));

      final TestInfo<AppState> info =
          await storeTester.waitUntil(NavigateAction);

      final NavigateAction<AppState>? actionDispatched =
          info.action as NavigateAction<AppState>?;

      final NavigatorDetails_PushNamedAndRemoveUntil? navDetails =
          actionDispatched?.details
              as NavigatorDetails_PushNamedAndRemoveUntil?;

      expect(navDetails?.newRouteName, AppRoutes.homePage);
      expect(
        navDetails?.predicate.call(
          MaterialPageRoute<HomePage>(
            builder: (BuildContext context) => const HomePage(),
          ),
        ),
        false,
      );
    });
  });
}
