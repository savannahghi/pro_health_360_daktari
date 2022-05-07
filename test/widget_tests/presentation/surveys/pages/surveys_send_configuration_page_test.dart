// Flutter imports:
// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/surveys/pages/successful_survey_submission.dart';
import 'package:mycarehubpro/presentation/surveys/pages/surveys_send_configuration_page.dart';
import 'package:mycarehubpro/presentation/surveys/widgets/surveys_card.dart';

import '../../../../mocks/test_helpers.dart';

void main() {
  group('Surveys Send Configurations Page', () {
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
              child: const SurveysSendConfigurationsPage(),
            );
          },
        ),
      );

      expect(find.text(setClientConfigurationsString), findsOneWidget);
      expect(find.byType(SurveysCard), findsNWidgets(1));

      await tester.fling(
        find.byType(SurveysCard).first,
        const Offset(0.0, 300.0),
        1000.0,
      );
      await tester.pumpAndSettle();

      final Finder clientTypeFinder =
          find.byKey(ValueKey<String>(ClientType.PMTCT.name));
      await tester.ensureVisible(clientTypeFinder);
      expect(clientTypeFinder, findsOneWidget);
      await tester.tap(clientTypeFinder);
      await tester.pumpAndSettle();

      final Finder ageGroupFinder =
          find.byKey(const ValueKey<String>('14 - 16 yrs'));
      await tester.ensureVisible(ageGroupFinder);
      expect(ageGroupFinder, findsOneWidget);
      await tester.tap(ageGroupFinder);
      await tester.pumpAndSettle();

      final Finder submitSurveyFinder = find.byKey(sendSurveyButtonKey);
      await tester.ensureVisible(submitSurveyFinder);
      await tester.tap(submitSurveyFinder);

      await tester.pumpAndSettle();
      expect(find.byType(SuccessfulSurveySubmission), findsOneWidget);
    });
  });
}