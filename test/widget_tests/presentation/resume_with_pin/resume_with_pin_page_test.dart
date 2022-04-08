import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
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
