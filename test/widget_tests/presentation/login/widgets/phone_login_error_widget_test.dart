import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/onboarding/login/pages/forgot_pin_page.dart';
import 'package:prohealth360_daktari/presentation/onboarding/login/widgets/phone_login_error_widget.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  final Store<AppState> store = Store<AppState>(
    initialState: AppState.initial(),
  );

  testWidgets('PhoneLoginErrorWidget navigates correctly',
      (WidgetTester tester) async {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    store.dispatch(
      UpdateOnboardingStateAction(
        currentOnboardingStage: CurrentOnboardingStage.ResetPIN,
      ),
    );
    await buildTestWidget(
      tester: tester,
      store: store,
      graphQlClient: MockTestGraphQlClient(),
      widget: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            body: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  CustomTextField(
                    formFieldKey: pinInputKey,
                    borderColor: Colors.grey[200],
                    maxLength: 4,
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    validator: userPinValidator,
                    autovalidateMode: AutovalidateMode.disabled,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                  PhoneLoginErrorWidget(
                    formKey: formKey,
                    phone: '0712345678',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );

    await tester.pump();

    final Finder pinInputField = find.byType(CustomTextField);
    await tester.showKeyboard(pinInputField);
    await tester.enterText(pinInputField, '1234');
    await tester.pumpAndSettle();

    final Finder resetPINButton = find.byKey(resetPINButtonKey);

    expect(resetPINButton, findsOneWidget);

    await tester.tap(resetPINButton);
    await tester.pumpAndSettle();

    expect(find.byType(ForgotPinPage), findsOneWidget);
  });
}
