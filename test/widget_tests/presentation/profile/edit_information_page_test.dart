// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/application/core/services/utils.dart';
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/profile/pages/edit_information_page.dart';
import 'package:healthcloud/presentation/router/routes.dart';

// Project imports:
import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('EditInformationPage', () {
    late Store<AppState> store;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('button is activated only when a field is entered',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: Builder(
          builder: (BuildContext context) {
            return RawMaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.editInformationPage,
                  arguments: <String, dynamic>{
                    'editInformationItem': nickNameEditInfo('Test'),
                  },
                );
              },
            );
          },
        ),
      );
      await tester.tap(find.byType(RawMaterialButton));
      await tester.pumpAndSettle();

      expect(find.byType(EditInformationPage), findsOneWidget);

      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();

      expect(
        (tester.firstWidget(find.byType(MyAfyaHubPrimaryButton))
                as MyAfyaHubPrimaryButton)
            .buttonColor,
        Colors.grey,
      );

      final Finder nickNameInputField = find.byType(CustomTextField);
      expect(find.byType(CustomTextField), findsOneWidget);

      await tester.showKeyboard(nickNameInputField);
      await tester.enterText(nickNameInputField, 'Test');
      await tester.pumpAndSettle();

      expect(
        (tester.firstWidget(find.byType(MyAfyaHubPrimaryButton))
                as MyAfyaHubPrimaryButton)
            .buttonColor,
        AppColors.secondaryColor,
      );

      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();
      expect(find.byType(EditInformationPage), findsOneWidget);

      await tester.tap(find.byKey(closeEditInformationPageBtnKey));
      await tester.pumpAndSettle();
      expect(find.byType(EditInformationPage), findsNothing);
    });
  });
}
