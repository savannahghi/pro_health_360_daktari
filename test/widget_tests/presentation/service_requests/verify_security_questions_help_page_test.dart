import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/onboarding/login/pages/phone_login_page.dart';
import 'package:mycarehubpro/presentation/onboarding/login/pages/pin_request_sent_page.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/verify_security_questions_help_page.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('VerifySecurityQuestionsHelpPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
      store.dispatch(UpdateOnboardingStateAction(phoneNumber: '0712345678'));
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockGraphQlClient,
        widget: VerifySecurityQuestionsHelpPage(),
      );
      expect(find.byType(MyAfyaHubPrimaryButton), findsNWidgets(2));
    });

    testWidgets('try again button works correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return Scaffold(
              body: VerifySecurityQuestionsHelpPage(),
            );
          },
        ),
      );

      final Finder tryAgainButton = find.byKey(tryAgainButtonKey);
      expect(tryAgainButton, findsOneWidget);

      await tester.tap(tryAgainButton);
      await tester.pumpAndSettle();
      expect(find.byType(PhoneLoginPage), findsOneWidget);
    });

    testWidgets('should show snackbar with error message when an error occurs',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'error': 'some error occurred'}),
          400,
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: VerifySecurityQuestionsHelpPage(),
      );

      await tester.pumpAndSettle();

      final Finder tryAgainButton = find.byKey(tryAgainButtonKey);
      final Finder askForHelpButton = find.byKey(askForHelpButtonKey);

      expect(tryAgainButton, findsOneWidget);
      expect(askForHelpButton, findsOneWidget);

      await tester.tap(askForHelpButton);
      await tester.pumpAndSettle();

      await tester.tap(askForHelpButton);
      await tester.pump(const Duration(seconds: 4));
      expect(find.byType(SnackBar), findsOneWidget);
      expect(
        find.text(getErrorMessage(sendingPINResetRequestSting)),
        findsOneWidget,
      );
    });

    testWidgets(
        'should show snackbar with error message when status is not true',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'status': null}),
          201,
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return Scaffold(
              body: VerifySecurityQuestionsHelpPage(),
            );
          },
        ),
      );

      final Finder askForHelpButton = find.byKey(askForHelpButtonKey);
      expect(askForHelpButton, findsOneWidget);

      await tester.tap(askForHelpButton);
      await tester.pump(const Duration(seconds: 4));
      expect(find.byType(SnackBar), findsOneWidget);
      expect(
        find.text(getErrorMessage(sendingPINResetRequestSting)),
        findsOneWidget,
      );
    });

    testWidgets(
        'should show navigate to pin request sent page upon successful creation '
        'of a service request', (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'status': true}),
          201,
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return Scaffold(
              body: VerifySecurityQuestionsHelpPage(),
            );
          },
        ),
      );

      final Finder askForHelpButton = find.byKey(askForHelpButtonKey);
      expect(askForHelpButton, findsOneWidget);

      await tester.tap(askForHelpButton);
      await tester.pumpAndSettle();

      expect(find.byType(PinRequestSentPage), findsOneWidget);
    });

    testWidgets('should show a loading indicator when sending service request',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'loading': true}
          }),
          201,
        ),
      );
      store.dispatch(WaitAction<AppState>.add(staffPinResetServiceRequestFlag));
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: VerifySecurityQuestionsHelpPage(),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
  });
}
