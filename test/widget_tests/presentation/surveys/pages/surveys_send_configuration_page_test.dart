// Flutter imports:
// Package imports:
import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
// Project imports:
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/surveys/survey.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/surveys/pages/successful_survey_submission.dart';
import 'package:mycarehubpro/presentation/surveys/pages/surveys_send_configuration_page.dart';
import 'package:mycarehubpro/presentation/surveys/widgets/surveys_card.dart';

import '../../../../mocks/mocks.dart';
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
        graphQlClient: MockTestGraphQlClient(),
        widget: SurveysSendConfigurationsPage(
          survey: Survey.initial(),
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
    testWidgets('send to all clients works correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: SurveysSendConfigurationsPage(
          survey: Survey.initial(),
        ),
      );
      final Finder mentalHealthSurveyButton =
          find.byKey(mentalHealthSurveyButtonKey);
      expect(mentalHealthSurveyButton, findsOneWidget);

      await tester.tap(mentalHealthSurveyButton);

      await tester.pumpAndSettle();
      expect(find.byType(SuccessfulSurveySubmission), findsOneWidget);
    });
    testWidgets(
        'should show a loading indicator when sending survey links',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'loading': true}
          }),
          201,
        ),
      );
      store.dispatch(
        WaitAction<AppState>.add(sendSurveysFlag),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: SurveysSendConfigurationsPage(
          survey: Survey.initial(),
        ),
      );

      expect(find.byType(PlatformLoader), findsNWidgets(2));
    });
    testWidgets(
      'should show an error snackbar when sending links to all clients',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{'error': 'some error occurred'}),
            201,
          ),
        );

        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: mockShortGraphQlClient,
          widget: SurveysSendConfigurationsPage(
            survey: Survey.initial(),
          ),
        );

        final Finder mentalHealthSurveyButton =
            find.byKey(mentalHealthSurveyButtonKey);
        expect(mentalHealthSurveyButton, findsOneWidget);

        await tester.tap(mentalHealthSurveyButton);

        await tester.pumpAndSettle();
        expect(find.byType(SnackBar), findsOneWidget);
      },
    );
    testWidgets(
      'should show an error snackbar when sending links to specific clients',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(
              <String, dynamic>{
                'data': <String, dynamic>{
                  'sendClientSurveyLinks': false,
                }
              },
            ),
            201,
          ),
        );

        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: mockShortGraphQlClient,
          widget: SurveysSendConfigurationsPage(
            survey: Survey.initial(),
          ),
        );

        await tester.fling(
          find.byType(SurveysCard).first,
          const Offset(0.0, 300.0),
          1000.0,
        );
        await tester.pumpAndSettle();
        final Finder submitSurveyFinder = find.byKey(sendSurveyButtonKey);
        await tester.ensureVisible(submitSurveyFinder);
        await tester.tap(submitSurveyFinder);

        await tester.pumpAndSettle();
        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text(getErrorMessage('sending surveys')), findsOneWidget);
      },
    );
  });
}
