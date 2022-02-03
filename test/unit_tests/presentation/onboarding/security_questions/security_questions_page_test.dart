// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/onboarding/security_questions/security_questions_page.dart';
import '../../../../mocks/mocks.dart';

void main() {
  group('SecurityQuestions', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue =
          typicalLargePhoneScreenSizePortrait;
      TestWidgetsFlutterBinding.ensureInitialized();

      await tester.pumpWidget(
        const MaterialApp(
          home: SecurityQuestionsPage(),
        ),
      );

      expect(find.text(securityQuestionsDescriptionString), findsOneWidget);
      expect(find.text(setSecurityQuestionsString), findsOneWidget);
      expect(find.byType(ExpandableQuestion), findsWidgets);
      expect(find.byType(MyAfyaHubPrimaryButton), findsOneWidget);

      await tester.tap(find.text(whereWereYouBornString));
      await tester.pumpAndSettle();

      final Finder textFormField = find.byType(TextFormField);
      expect(textFormField, findsOneWidget);
      await tester.showKeyboard(textFormField);
      await tester.enterText(textFormField, 'text');
      await tester.pumpAndSettle();

      expect(find.byType(ScaffoldMessenger), findsOneWidget);
      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets('ExpandableQuestion TextFormField allow input correctly',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue =
          typicalLargePhoneScreenSizePortrait;
      TestWidgetsFlutterBinding.ensureInitialized();

      await tester.pumpWidget(
        const MaterialApp(
          home: SecurityQuestionsPage(),
        ),
      );
      expect(find.text(securityQuestionsDescriptionString), findsOneWidget);
      expect(find.text(setSecurityQuestionsString), findsOneWidget);
      expect(find.byType(ExpandableQuestion), findsWidgets);
      expect(find.byType(MyAfyaHubPrimaryButton), findsOneWidget);

      await tester.tap(find.text(whereWereYouBornString));
      await tester.pumpAndSettle();

      final Finder textFormField = find.byType(TextFormField);
      expect(textFormField, findsOneWidget);
      await tester.showKeyboard(textFormField);
      await tester.enterText(textFormField, 'text');
      await tester.pumpAndSettle();

      expect(find.byType(ScaffoldMessenger), findsOneWidget);
      await tester.tap(find.text(whereWereYouBornString));
      await tester.pumpAndSettle();

      await tester.tap(find.text(whatsTheNameOfYourPetString));
      await tester.pumpAndSettle();

      final Finder petTextFormField = find.byType(TextFormField);
      expect(petTextFormField, findsOneWidget);
      await tester.showKeyboard(petTextFormField);
      await tester.enterText(petTextFormField, 'text');
      await tester.pumpAndSettle();

      expect(find.byType(ScaffoldMessenger), findsOneWidget);
      await tester.tap(find.text(whatsTheNameOfYourPetString));
      await tester.pumpAndSettle();

      await tester.tap(find.text(whatsYourFavoriteFoodString));
      await tester.pumpAndSettle();

      final Finder favoriteFoodTextFormField = find.byType(TextFormField);
      expect(favoriteFoodTextFormField, findsOneWidget);
      await tester.showKeyboard(favoriteFoodTextFormField);
      await tester.enterText(favoriteFoodTextFormField, 'text');
      await tester.pumpAndSettle();

      expect(find.byType(ScaffoldMessenger), findsOneWidget);
      await tester.tap(find.text(whatsYourFavoriteFoodString));
      await tester.pumpAndSettle();

      await tester.tap(find.text(whereDidYouFirstLiveString));
      await tester.pumpAndSettle();

      final Finder firstLivedTextFormField = find.byType(TextFormField);
      expect(firstLivedTextFormField, findsOneWidget);
      await tester.showKeyboard(firstLivedTextFormField);
      await tester.enterText(firstLivedTextFormField, 'text');
      await tester.pumpAndSettle();

      expect(find.byType(ScaffoldMessenger), findsOneWidget);
      await tester.tap(find.text(whereDidYouFirstLiveString));
      await tester.pumpAndSettle();

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });
  });
}
