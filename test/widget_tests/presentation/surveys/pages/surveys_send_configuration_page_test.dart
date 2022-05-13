// Flutter imports:
// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
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

      final Finder ageRangeSliderFinder = find.byKey(ageRangeSlider);
      final RangeSlider rangeSlider =
          ageRangeSliderFinder.evaluate().first.widget as RangeSlider;

      rangeSlider.onChanged?.call(const RangeValues(16, 25));
      await tester.ensureVisible(ageRangeSliderFinder);
      await tester.tap(ageRangeSliderFinder);
      await tester.pumpAndSettle();

      final Finder allGenderFinder =
          find.byKey(const ValueKey<String>(allText));
      await tester.ensureVisible(allGenderFinder);
      expect(allGenderFinder, findsOneWidget);
      await tester.tap(allGenderFinder);
      await tester.pumpAndSettle();

      await tester.tap(allGenderFinder);
      await tester.pumpAndSettle();

      final Finder maleGenderFinder =
          find.text(Gender.female.name.toUpperCase());
      await tester.ensureVisible(maleGenderFinder);
      expect(maleGenderFinder, findsOneWidget);
      await tester.tap(maleGenderFinder);
      await tester.pumpAndSettle();

      final Finder submitSurveyFinder = find.byKey(sendSurveyButtonKey);
      await tester.ensureVisible(submitSurveyFinder);
      await tester.tap(submitSurveyFinder);

      await tester.pumpAndSettle();
      expect(find.byType(SuccessfulSurveySubmission), findsOneWidget);
    });
  });
}
