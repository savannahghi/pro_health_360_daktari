// Flutter imports:
// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/surveys/survey.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/surveys/pages/surveys_send_configuration_page.dart';
import 'package:prohealth360_daktari/presentation/surveys/pages/surveys_sender_list_page.dart';
import 'package:prohealth360_daktari/presentation/surveys/widgets/surveys_card.dart';

import '../../../../mocks/test_helpers.dart';

void main() {
  group('Surveys Sender List Page', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: Builder(
          builder: (BuildContext context) {
            return StoreProvider<AppState>(
              store: store,
              child: SurveysSenderListPage(
                survey: Survey.initial(),
              ),
            );
          },
        ),
      );

      expect(find.text(surveySenderListDescriptionString), findsOneWidget);
      expect(find.byType(SurveysCard), findsOneWidget);
    });

    testWidgets(
        'Tapping on Send To Clients card navigates to Surveys Send Configurations Page',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: Builder(
          builder: (BuildContext context) {
            return StoreProvider<AppState>(
              store: store,
              child: SurveysSenderListPage(
                survey: Survey.initial(),
              ),
            );
          },
        ),
      );

      final Finder sendToAllFinder = find.byKey(sendToAllButtonKey);

      await tester.ensureVisible(sendToAllFinder);
      await tester.pumpAndSettle();
      await tester.tap(sendToAllFinder);
      await tester.pumpAndSettle();
      expect(find.byType(SurveysSendConfigurationsPage), findsOneWidget);
    });
  });
}
