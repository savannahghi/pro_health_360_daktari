// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/profile/pages/edit_information_page.dart';
import 'package:prohealth360_daktari/presentation/profile/pages/settings_page.dart';
import 'package:prohealth360_daktari/presentation/profile/widgets/edit_info_button_widget.dart';
import 'package:http/http.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('SettingsPage', () {
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(initialState: AppState.initial());
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
    });
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: SettingsPage(),
      );

      expect(find.byType(CustomAppBar), findsOneWidget);
      expect(find.text(editString), findsOneWidget);
    });

    testWidgets('navigates to Edit Information page',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: SettingsPage(),
      );

      expect(find.byType(CustomAppBar), findsOneWidget);
      await tester.tap(find.byType(EditInformationButtonWidget));
      await tester.pumpAndSettle();
      expect(find.byType(EditInformationPage), findsOneWidget);
    });

    testWidgets('Sets a user nickname', (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'setNickName': true,
            }
          }),
          201,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortSILGraphQlClient,
        widget: SettingsPage(),
      );

      expect(find.byType(CustomAppBar), findsOneWidget);
      await tester.tap(find.byType(EditInformationButtonWidget));
      await tester.pumpAndSettle();
      expect(find.byType(EditInformationPage), findsOneWidget);

      final Finder nickNameInputField = find.byType(CustomTextField);
      expect(find.byType(CustomTextField), findsOneWidget);

      await tester.showKeyboard(nickNameInputField);
      await tester.enterText(nickNameInputField, 'Test nickname');
      await tester.pumpAndSettle();

      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();
      expect(find.byType(EditInformationPage), findsNothing);
      expect(store.state.staffState!.user!.username, 'Test nickname');
    });

    testWidgets('original nickname is returned to state incase of an error',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'errors': <Object>[
              <String, dynamic>{
                'message': '4: error',
              }
            ]
          }),
          401,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortSILGraphQlClient,
        widget: SettingsPage(),
      );

      expect(find.byType(CustomAppBar), findsOneWidget);
      await tester.tap(find.byType(EditInformationButtonWidget));
      await tester.pumpAndSettle();
      expect(find.byType(EditInformationPage), findsOneWidget);

      final Finder nickNameInputField = find.byType(CustomTextField);
      expect(find.byType(CustomTextField), findsOneWidget);

      await tester.showKeyboard(nickNameInputField);
      await tester.enterText(nickNameInputField, 'Test nickname');
      await tester.pumpAndSettle();

      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();
      expect(find.byType(EditInformationPage), findsNothing);
      expect(store.state.staffState!.user!.username, UNKNOWN);
    });
  });
}
