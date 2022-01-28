// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:afya_moja_core/phone_input.dart';
// Package imports:
import 'package:async_redux/async_redux.dart';
// import 'package:bewell_pro_core/application/redux/actions/misc_state_actions/batch_update_misc_state_action.dart';
// import 'package:bewell_pro_core/application/redux/flags/flags.dart';
// import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
// import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
// import 'package:bewell_pro_core/presentation/onboarding/login/widgets/error_alert_box.dart';
// import 'package:bewell_pro_core/presentation/onboarding/profile/change_pin.dart';
import 'package:domain_objects/entities.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/application/redux/actions/core/batch_update_misc_state_action.dart';
import 'package:healthcloud/application/redux/actions/flags/app_flags.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/entities/common_behavior_object.dart';
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
// Project imports:
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/engagement/home/pages/home_page.dart';
import 'package:healthcloud/presentation/onboarding/login/pages/forgot_pin_page.dart';
import 'package:healthcloud/presentation/onboarding/login/pages/phone_login_page.dart';
import 'package:healthcloud/presentation/onboarding/login/widgets/error_alert_box.dart';
import 'package:http/http.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:shared_ui_components/platform_loader.dart';

import '../../../../mocks/mock_utils.dart';
import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('PhoneLogin', () {
    late Store<AppState> store;

    setUp(() {
      AppBrand().appLogo.add(cameraIconUrl);
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets(
        'should log in the user, update the user state and navigate to '
        'the home page', (WidgetTester tester) async {
      await mockNetworkImages(() async {
        setupFirebaseAuthMocks();
        await Firebase.initializeApp();
        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: mockSILGraphQlClient,
          widget: PhoneLoginPage(),
        );

        final Finder phoneLoginButton = find.byKey(loginKey);
        final Finder phoneInput = find.byKey(phoneLoginPinInputKey);

        expect(phoneLoginButton, findsOneWidget);
        expect(phoneInput, findsOneWidget);

        // Enter phone number
        await tester.enterText(find.byType(MyAfyaHubPhoneInput), '0712345678');

        // Enter PIN
        await tester.enterText(phoneInput, '1234');

        // Tap the login button
        await tester.ensureVisible(find.byKey(loginKey));
        await tester.tap(phoneLoginButton);
        await tester.pump();

        final UserResponse mockResponse =
            UserResponse.fromJson(mockAuthLoginResponse);

        expect(
          store.state.staffState!.userState!.userProfile,
          mockResponse.profile,
        );
        expect(
          store.state.staffState!.userState!.communicationSettings,
          mockResponse.communicationSettings,
        );
        expect(store.state.staffState!.userState!.auth, mockResponse.auth);

        await tester.pumpAndSettle();
        expect(find.byType(HomePage), findsOneWidget);
      });
    });

    testWidgets(
        'should show an error message if invalid credentials are entered',
        (WidgetTester tester) async {
      final MockShortGraphQlClient graphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(json.encode(<String, dynamic>{'code': 8}), 400),
      );

      await buildTestWidget(
        store: store,
        tester: tester,
        widget: PhoneLoginPage(),
        graphQlClient: graphQlClient,
      );

      expect(find.byType(MyAfyaHubPhoneInput), findsOneWidget);

      // Enter phone number
      await tester.enterText(find.byType(MyAfyaHubPhoneInput), '0712345678');

      // Enter PIN
      await tester.enterText(find.byKey(phoneLoginPinInputKey), '1234');

      // Tap the login button
      await tester.ensureVisible(find.byKey(loginKey));
      await tester.tap(find.byKey(loginKey));
      await tester.pumpAndSettle();

      expect(store.state.miscState!.invalidCredentials, true);
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Wrong login details provided'), findsOneWidget);
    });

    testWidgets(
        'shows the error alert widget when invalid credentials are provided',
        (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: PhoneLoginPage(),
      );
      await tester.pumpAndSettle();

      store.dispatch(BatchUpdateMiscStateAction(invalidCredentials: true));
      await tester.pumpAndSettle();

      expect(find.byType(ErrorAlertBox), findsOneWidget);

      // Enter PIN
      await tester.enterText(find.byKey(phoneLoginPinInputKey), '1234');

      expect(store.state.miscState!.invalidCredentials, false);
      expect(store.state.miscState!.unKnownPhoneNo, false);
    });

    testWidgets(
        'shows the error alert widget when an unknown phone number is added',
        (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: PhoneLoginPage(),
      );
      await tester.pumpAndSettle();

      store.dispatch(BatchUpdateMiscStateAction(unKnownPhoneNo: true));
      await tester.pumpAndSettle();

      expect(find.byType(ErrorAlertBox), findsOneWidget);

      await tester.enterText(find.byType(MyAfyaHubPhoneInput), '0712345678');

      expect(store.state.miscState!.invalidCredentials, false);
      expect(store.state.miscState!.unKnownPhoneNo, false);
    });

    testWidgets('shows a loading indicator when processing',
        (WidgetTester tester) async {
      store.dispatch(WaitAction<AppState>.add(phoneLoginStateFlag));
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: PhoneLoginPage(),
      );
      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });

    testWidgets('navigates to ForgotPinPage when back button is tapped',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: PhoneLoginPage(),
      );

      await tester.ensureVisible(find.byKey(forgotPinButton));
      await tester.tap(find.byKey(forgotPinButton));
      await tester.pumpAndSettle();

      expect(find.byType(ForgotPinPage), findsOneWidget);
      expect(find.byType(PhoneLoginPage), findsNothing);
    });
  });
}
