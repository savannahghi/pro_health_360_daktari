import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/redux/actions/core/update_credentials_action.dart';
import 'package:mycarehubpro/application/redux/actions/core/update_user_action.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/onboarding/login/pages/phone_login_page.dart';
import 'package:mycarehubpro/presentation/resume_with_pin/resume_pin_connector.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('ResumePinConnector', () {
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(initialState: AppState.initial());
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
    });

    testWidgets('provides correct username', (WidgetTester tester) async {
      store.dispatch(
        UpdateUserAction(
          user: store.state.staffState?.user?.copyWith(username: 'John'),
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const ResumePinConnector(),
      );

      expect(find.text(welcomeBackUserText('John')), findsOneWidget);
    });

    testWidgets('provides correct loading', (WidgetTester tester) async {
      store.dispatch(WaitAction<AppState>.add(resumeWithPinFlag));

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const ResumePinConnector(),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });

    testWidgets('provides correct on submit', (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          jsonEncode(
            <String, dynamic>{
              'data': <String, bool>{'verifyPIN': true}
            },
          ),
          200,
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: const ResumePinConnector(),
      );

      final Finder pinInputField = find.byKey(const Key('pin_input_field'));

      await tester.enterText(pinInputField, '0000');
      await tester.pump();
      await tester.pump();

      expect(find.byType(PhoneLoginPage), findsOneWidget);
    });

    testWidgets('provides correct logout functionality',
        (WidgetTester tester) async {
      store.dispatch(UpdateCredentialsAction(idToken: 'some-id-token'));

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const ResumePinConnector(),
      );

      expect(store.state.credentials?.idToken, 'some-id-token');

      final Finder logoutBtn = find.byKey(const Key('logout_button'));
      await tester.tap(logoutBtn);

      expect(store.state.credentials?.idToken, UNKNOWN);
    });
  });
}
