import 'package:healthcloud/application/redux/actions/kyc_state_actions/organization/organization_practitioner_kyc_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_page_bottom_actions.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/organization/organization_practitioner_step_three.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/organization/organization_practitioner_step_two.dart';
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/error_alert_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import '../../../../../../mocks/mock_utils.dart';
import '../../../../../../mocks/mocks.dart';
import '../../../../../../mocks/test_helpers.dart';

void main() {
  group('Organization Practitioner Step Two', () {
    late Store<CoreState> store;
    final List<MethodCall> methodCalls = <MethodCall>[];

    setUp(() {
      store = Store<CoreState>(initialState: AppState.initial());
      setupFileUploadMock(methodCalls);
      methodCalls.clear();
    });

    testWidgets('should validate the form fields correctly',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await buildTestWidget(
            tester: tester,
            store: store,
            widget: OrganizationPractitionerKYCStepTwo());

        expect(find.byType(OrganizationPractitionerKYCStepTwo), findsOneWidget);
        expect(find.byType(Form), findsOneWidget);

        expect(find.byKey(kycRegNumber), findsOneWidget);

        await tester.enterText(find.byKey(kycRegNumber), '');
        await tester.pump();

        //expect to find the next button and navigate to step three
        expect(find.byType(RawMaterialButton), findsWidgets);
        final RawMaterialButton nextButton = find
            .widgetWithText(RawMaterialButton, next)
            .evaluate()
            .first
            .widget as RawMaterialButton;
        nextButton.onPressed!();
        await tester.pumpAndSettle();

        expect(find.byType(ErrorAlertBox), findsOneWidget);
        expect(find.byType(SnackBar), findsOneWidget);
      });
    });

    testWidgets('should enter form field correctly and navigate to step three',
        (WidgetTester tester) async {
      store.dispatch(
        OrganizationPractitionerKYCAction(
            organizationTypeName: 'LIMITED_COMPANY',
            practiceLicenseID: 'some-id',
            idNumber: 'some-id',
            idDocID: 'some-doc-id',
            idType: 'some-id-type',
            kraPin: 'some-pin',
            kraPinDocID: 'some-pin-doc-id',
            practiceServices: <String>['Pharmacy', 'Maternity']),
      );
      await buildTestWidget(
          tester: tester,
          store: store,
          widget: OrganizationPractitionerKYCStepTwo());

      expect(find.byType(OrganizationPractitionerKYCStepTwo), findsOneWidget);
      expect(find.byType(Form), findsOneWidget);
      expect(find.byType(KYCPagesBottomActions), findsOneWidget);

      //  expect to find reg number  widgets
      expect(find.byKey(kycRegNumber), findsOneWidget);

      await tester.tap(find.byKey(doctorRadioKey));
      await tester.pump();

      await tester.tap(find.byKey(nurseRadioKey));
      await tester.pump();

      await tester.tap(find.byKey(clinicalOfficerRadioKey));
      await tester.pump();

      //expect to enter the registration number
      await tester.enterText(
          find.byKey(kycRegNumber), testKYCRegistrationNumber);
      await tester.pump();
      expect(find.text(testKYCRegistrationNumber), findsOneWidget);

      for (int i = 0; i < practiceServicesList.length; i++) {
        final Finder checkBox =
            find.byKey(Key(practiceServicesList[i].value), skipOffstage: false);
        await tester.ensureVisible(checkBox);
        await tester.tap(checkBox);
        await tester.pump();
      }

      // expect to find the next button and navigate to step three
      final Finder nextButton =
          find.byKey(nextStepKycButton, skipOffstage: false);
      await tester.ensureVisible(nextButton);

      await tester.tap(nextButton);
      await tester.pumpAndSettle();

      expect(find.byType(OrganizationPractitionerKYCStepThree), findsOneWidget);
    });

    testWidgets('back button works correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: OrganizationPractitionerKYCStepTwo(),
      );

      expect(find.byType(Form), findsOneWidget);
      expect(find.byKey(backKycButton), findsOneWidget);

      await tester.tap(find.byKey(backKycButton));
      await tester.pumpAndSettle();
      expect(find.text(orgPractitionerKYCHeaderTitle), findsOneWidget);
    });
  });
}
