// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/error_alert_box.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

// Project imports:
import 'package:healthcloud/application/redux/actions/kyc_state_actions/individual_practitioner_kyc_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_license_reg_page.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/individual/individual_practitioner_step_one.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/individual/individual_practitioner_step_two.dart';
import '../../../../../../mocks/mock_utils.dart';
import '../../../../../../mocks/test_helpers.dart';

void main() {
  group('Individual Practitioner KYC Step One', () {
    late Store<CoreState> store;

    TestWidgetsFlutterBinding.ensureInitialized();

    final List<MethodCall> methodCalls = <MethodCall>[];

    setUp(() {
      AppBrand().appLogo.add(cameraIconUrl);
      store = Store<CoreState>(initialState: AppState.initial());
      setupFileUploadMock(methodCalls);
      methodCalls.clear();
    });

    testWidgets('should validate inputs', (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          widget: IndividualPractitionerKYCStepOne(),
        );

        await tester.pumpAndSettle();

        expect(find.text('What is your profession?'), findsOneWidget);

        expect(find.byKey(clinicalOfficerRadioKey), findsOneWidget);

        await tester.enterText(find.byKey(kycRegNumberKey), '');
        await tester.pump();

        // display an error message
        // expect to find the next button and navigate to step three
        final Finder nextButton =
            find.byKey(kycNextButtonKey, skipOffstage: false);
        await tester.ensureVisible(nextButton);

        await tester.tap(nextButton);
        await tester.pumpAndSettle();

        expect(find.byType(ErrorAlertBox), findsOneWidget);
        expect(find.byType(SnackBar), findsOneWidget);
        expect(
          find.text('Please provide all the required information'),
          findsOneWidget,
        );
      });
    });

    testWidgets(
        'should fill the KYC details correctly for a doctor and navigate to step two',
        (WidgetTester tester) async {
      store.dispatch(
        IndividualPractitionerKYCAction(
          practiceLicenseID: 'some-id',
          practiceLicenseDocID: 'some-doc-id',
          idNumber: 'some-id',
          idDocID: 'some-doc-id',
          idType: 'some-id-type',
          kraPin: 'some-pin',
          kraPinDocID: 'some-pin-doc-id',
          registrationNumber: 'some-reg-number',
          cadre: 'NURSE',
          practiceServices: <String>[
            'OUTPATIENT_SERVICES',
            'INPATIENT_SERVICES'
          ],
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: IndividualPractitionerKYCStepOne(),
      );

      expect(find.text('What is your profession?'), findsOneWidget);
      expect(find.byType(KYCLicenceAndRegistrationNumber), findsOneWidget);
      expect(find.byKey(kycRegNumberKey), findsOneWidget);
      expect(find.byKey(kycLicenceNumberKey), findsOneWidget);
      expect(find.byKey(kycLicenceNumberKey), findsOneWidget);

      await tester.tap(find.byKey(kycLicenceNumUploadKey));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(kycRegNumberKey), '123456789');
      await tester.pump();

      await tester.enterText(find.byKey(kycLicenceNumberKey), '123456789');
      await tester.pumpAndSettle();

      // uncheck confirmed checkbox
      await tester.tap(find.byKey(Key(practiceServicesList[0].value)));
      await tester.pump();

      await tester.tap(find.byKey(doctorRadioKey));
      await tester.pump();

      expect(
        find.text('Please tick all services that you offer'),
        findsOneWidget,
      );

      for (int i = 0; i < practiceServicesList.length; i++) {
        final Finder checkBox =
            find.byKey(Key(practiceServicesList[i].value), skipOffstage: false);
        await tester.ensureVisible(checkBox);
        await tester.tap(checkBox);
        await tester.pump();
      }

      expect((store.state as AppState).practitionerKYCState!.cadre, 'NURSE');
      expect(
        (store.state as AppState).practitionerKYCState!.registrationNumber,
        'some-reg-number',
      );
      expect(
        (store.state as AppState).practitionerKYCState!.practiceLicenseUploadID,
        'some-doc-id',
      );
      expect(
        (store.state as AppState).practitionerKYCState!.practiceLicenseID,
        'some-id',
      );

      // Perform the license upload
      final Finder fileUpload =
          find.byKey(kycLicenceNumUploadKey, skipOffstage: false);
      await tester.ensureVisible(fileUpload);

      await tester.tap(fileUpload);
      await tester.pumpAndSettle();

      // expect to find the next button and navigate to step three
      final Finder nextButton =
          find.byKey(kycNextButtonKey, skipOffstage: false);
      await tester.ensureVisible(nextButton);

      await tester.tap(nextButton);
      await tester.pumpAndSettle();

      expect(find.byType(IndividualPractitionerKYCStepTwo), findsOneWidget);
    });

    testWidgets(
        'should fill the KYC details correctly for a clinical officer and navigate to step two',
        (WidgetTester tester) async {
      store.dispatch(
        IndividualPractitionerKYCAction(
          practiceLicenseID: 'some-id',
          practiceLicenseDocID: 'some-doc-id',
          idNumber: 'some-id',
          idDocID: 'some-doc-id',
          idType: 'some-id-type',
          kraPin: 'some-pin',
          kraPinDocID: 'some-pin-doc-id',
          registrationNumber: 'some-reg-number',
          cadre: 'NURSE',
          practiceServices: <String>[
            'OUTPATIENT_SERVICES',
            'INPATIENT_SERVICES'
          ],
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: IndividualPractitionerKYCStepOne(),
      );

      expect(find.text('What is your profession?'), findsOneWidget);
      expect(find.byType(KYCLicenceAndRegistrationNumber), findsOneWidget);
      expect(find.byKey(kycRegNumberKey), findsOneWidget);
      expect(find.byKey(kycLicenceNumberKey), findsOneWidget);
      expect(find.byKey(kycLicenceNumberKey), findsOneWidget);

      await tester.tap(find.byKey(kycLicenceNumUploadKey));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(kycRegNumberKey), '123456789');
      await tester.pump();

      await tester.enterText(find.byKey(kycLicenceNumberKey), '123456789');
      await tester.pumpAndSettle();

      // uncheck confirmed checkbox
      await tester.tap(find.byKey(Key(practiceServicesList[0].value)));
      await tester.pump();

      await tester.tap(find.byKey(clinicalOfficerRadioKey));
      await tester.pump();

      expect(
        find.text('Please tick all services that you offer'),
        findsOneWidget,
      );

      for (int i = 0; i < practiceServicesList.length; i++) {
        final Finder checkBox =
            find.byKey(Key(practiceServicesList[i].value), skipOffstage: false);
        await tester.ensureVisible(checkBox);
        await tester.tap(checkBox);
        await tester.pump();
      }

      expect((store.state as AppState).practitionerKYCState!.cadre, 'NURSE');
      expect(
        (store.state as AppState).practitionerKYCState!.registrationNumber,
        'some-reg-number',
      );
      expect(
        (store.state as AppState).practitionerKYCState!.practiceLicenseUploadID,
        'some-doc-id',
      );
      expect(
        (store.state as AppState).practitionerKYCState!.practiceLicenseID,
        'some-id',
      );

      // Perform the license upload
      final Finder fileUpload =
          find.byKey(kycLicenceNumUploadKey, skipOffstage: false);
      await tester.ensureVisible(fileUpload);

      await tester.tap(fileUpload);
      await tester.pumpAndSettle();

      // expect to find the next button and navigate to step three
      final Finder nextButton =
          find.byKey(kycNextButtonKey, skipOffstage: false);
      await tester.ensureVisible(nextButton);

      await tester.tap(nextButton);
      await tester.pumpAndSettle();

      expect(find.byType(IndividualPractitionerKYCStepTwo), findsOneWidget);
    });

    testWidgets(
        'should fill the KYC details correctly for a nurse and navigate to step two',
        (WidgetTester tester) async {
      store.dispatch(
        IndividualPractitionerKYCAction(
          practiceLicenseID: 'some-id',
          practiceLicenseDocID: 'some-doc-id',
          idNumber: 'some-id',
          idDocID: 'some-doc-id',
          idType: 'some-id-type',
          kraPin: 'some-pin',
          kraPinDocID: 'some-pin-doc-id',
          registrationNumber: 'some-reg-number',
          cadre: 'NURSE',
          practiceServices: <String>[
            'OUTPATIENT_SERVICES',
            'INPATIENT_SERVICES'
          ],
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: IndividualPractitionerKYCStepOne(),
      );

      expect(find.text('What is your profession?'), findsOneWidget);
      expect(find.byType(KYCLicenceAndRegistrationNumber), findsOneWidget);
      expect(find.byKey(kycRegNumberKey), findsOneWidget);
      expect(find.byKey(kycLicenceNumberKey), findsOneWidget);
      expect(find.byKey(kycLicenceNumberKey), findsOneWidget);

      await tester.tap(find.byKey(kycLicenceNumUploadKey));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(kycRegNumberKey), '123456789');
      await tester.pump();

      await tester.enterText(find.byKey(kycLicenceNumberKey), '123456789');
      await tester.pumpAndSettle();

      // uncheck confirmed checkbox
      await tester.tap(find.byKey(Key(practiceServicesList[0].value)));
      await tester.pump();

      await tester.tap(find.byKey(nurseRadioKey));
      await tester.pump();

      expect(
        find.text('Please tick all services that you offer'),
        findsOneWidget,
      );

      for (int i = 0; i < practiceServicesList.length; i++) {
        final Finder checkBox =
            find.byKey(Key(practiceServicesList[i].value), skipOffstage: false);
        await tester.ensureVisible(checkBox);
        await tester.tap(checkBox);
        await tester.pump();
      }

      expect((store.state as AppState).practitionerKYCState!.cadre, 'NURSE');
      expect(
        (store.state as AppState).practitionerKYCState!.registrationNumber,
        'some-reg-number',
      );
      expect(
        (store.state as AppState).practitionerKYCState!.practiceLicenseUploadID,
        'some-doc-id',
      );
      expect(
        (store.state as AppState).practitionerKYCState!.practiceLicenseID,
        'some-id',
      );

      // Perform the license upload
      final Finder fileUpload =
          find.byKey(kycLicenceNumUploadKey, skipOffstage: false);
      await tester.ensureVisible(fileUpload);

      await tester.tap(fileUpload);
      await tester.pumpAndSettle();

      // expect to find the next button and navigate to step three
      final Finder nextButton =
          find.byKey(kycNextButtonKey, skipOffstage: false);
      await tester.ensureVisible(nextButton);

      await tester.tap(nextButton);
      await tester.pumpAndSettle();

      expect(find.byType(IndividualPractitionerKYCStepTwo), findsOneWidget);
    });
  });
}
