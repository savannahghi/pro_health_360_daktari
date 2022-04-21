import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/redux/actions/resume_with_pin_action/resume_with_pin_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/presentation/onboarding/pin_expired/pages/pin_expired_page.dart';
import 'package:mycarehubpro/presentation/resume_with_pin/resume_with_pin_page.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('ResumePinConnector', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('should call onDone with correct pin',
        (WidgetTester tester) async {
      String submittedPin = '';

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: ResumeWithPinPage(
          username: '',
          isLoading: false,
          onSubmit: (String pin) {
            submittedPin = pin;
          },
          logoutCallback: () {},
        ),
      );

      final Finder pinInputField = find.byKey(const Key('pin_input_field'));

      await tester.enterText(pinInputField, '0000');
      expect(submittedPin, '0000');
    });

    testWidgets('should handle expired pin', (WidgetTester tester) async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          jsonEncode(
            <String, dynamic>{'code': 48, 'error': '48: pin expired'},
          ),
          200,
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: client,
        widget: ResumeWithPinPage(
          username: '',
          isLoading: false,
          onSubmit: (String pin) {
            store.dispatch(
              ResumeWithPinAction(
                pin: '0000',
                httpClient: client,
                endpoint: '',
              ),
            );
          },
          logoutCallback: () {},
        ),
      );

      final Finder pinInputField = find.byKey(const Key('pin_input_field'));

      await tester.enterText(pinInputField, '0000');
      await tester.pumpAndSettle();

      await tester.pumpAndSettle();
      expect(find.byType(PinExpiredPage), findsOneWidget);
    });

    testWidgets('should call logout callback', (WidgetTester tester) async {
      int logoutCallback = 0;

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: ResumeWithPinPage(
          username: '',
          isLoading: false,
          onSubmit: (_) {},
          logoutCallback: () => logoutCallback++,
        ),
      );

      final Finder logoutBtn = find.byKey(const Key('logout_button'));

      await tester.tap(logoutBtn);
      expect(logoutCallback, 1);
    });
  });
}
