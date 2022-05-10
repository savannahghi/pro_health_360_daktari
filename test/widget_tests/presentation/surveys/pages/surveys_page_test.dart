// Flutter imports:
// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/surveys/pages/surveys_page.dart';
import 'package:mycarehubpro/presentation/surveys/pages/surveys_sender_list_page.dart';
import 'package:mycarehubpro/presentation/surveys/widgets/surveys_card.dart';

import '../../../../mocks/test_helpers.dart';

void main() {
  group('Surveys Page', () {
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
              child: const SurveysPage(),
            );
          },
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text(surveysInvitedToString), findsOneWidget);
      expect(find.byType(SurveysCard), findsNWidgets(2));
    });

    testWidgets(
        'Survey Card button pressed navigates Surveys Sender List Page ',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: Builder(
          builder: (BuildContext context) {
            return StoreProvider<AppState>(
              store: store,
              child: const SurveysPage(),
            );
          },
        ),
      );
      await tester.pumpAndSettle();

      final Finder mentalHealthSurveyFinder =
          find.byType(MyAfyaHubPrimaryButton).first;

      await tester.ensureVisible(mentalHealthSurveyFinder);
      await tester.pumpAndSettle();
      await tester.tap(mentalHealthSurveyFinder);
      await tester.pumpAndSettle();
      expect(find.byType(SurveysSenderListPage), findsOneWidget);
    });
  });
}
