import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:healthcloud/application/redux/actions/kyc_state_actions/organization/organization_practitioner_kyc_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_license_reg_page.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/organization/organization_practitioner_step_one.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/organization/organization_practitioner_step_two.dart';
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import '../../../../../../mocks/mock_utils.dart';
import '../../../../../../mocks/mocks.dart';
import '../../../../../../mocks/test_helpers.dart';

void main() {
  group('organization Practitioner Step One', () {
    TestWidgetsFlutterBinding.ensureInitialized();

    late Store<CoreState> store;

    final List<MethodCall> methodCalls = <MethodCall>[];

    setUp(() {
      AppBrand().appLogo.add(cameraIconUrl);
      store = Store<CoreState>(initialState: AppState.initial());
      setupFileUploadMock(methodCalls);
      methodCalls.clear();
      store.dispatch(
        OrganizationPractitionerKYCAction(
          organizationTypeName: 'TRUST',
          certificateOfIncorporation: 'some-incorporation-certificate',
          certificateOfIncorporationDocID:
              'some-incorporation-certificate-doc-id',
        ),
      );
    });

    testWidgets('should enter form fields correctly and navigate to step two',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await buildTestWidget(
            tester: tester,
            store: store,
            widget: const OrganizationPractitionerKYCStepOne());

        expect(find.text(orgPractitionerKYCHeaderTitle), findsOneWidget);
        expect(find.byType(KYCLicenceAndRegistrationNumber), findsOneWidget);
        expect(find.text(orgTypeName), findsOneWidget);
        expect(
            find.byKey(kycOrganizationLimitedCompRadioButton), findsOneWidget);

        await tester.tap(find.byKey(kycOrganizationTrustRadioButton));
        await tester.pump();

        await tester.tap(find.byKey(kycOrganizationUniversityRadioButton));
        await tester.pump();

        await tester.tap(find.byKey(kycOrganizationLimitedCompRadioButton));
        await tester.pump();

        // expect to find incorporation certificate widgets
        await tester.enterText(find.byKey(kycOrganizationCertIncorporation),
            testKYCCertificateOfIncorporationNumber);
        await tester.pump();
        expect(
            find.text(testKYCCertificateOfIncorporationNumber), findsOneWidget);

        //  expect to find license number  widgets
        expect(find.byKey(kycLicenceNumber), findsOneWidget);
        await tester.enterText(
            find.byKey(kycLicenceNumber), testKYCLicenceNumber);
        await tester.pump();

        // Certificate of Incorporation upload
        final Finder certificateUpload = find
            .byKey(kycOrganizationCertIncorporationUpload, skipOffstage: false);
        await tester.ensureVisible(certificateUpload);
        await tester.tap(certificateUpload);
        await tester.pumpAndSettle();

        // Perform the license upload
        final Finder licenseUpload =
            find.byKey(kycLicenceNumUpload, skipOffstage: false);
        await tester.ensureVisible(licenseUpload);

        await tester.tap(licenseUpload);
        await tester.pumpAndSettle();

        // expect to find the next button and navigate
        final Finder nextButton =
            find.byKey(nextStepKycButton, skipOffstage: false);
        await tester.ensureVisible(nextButton);
        await tester.tap(nextButton);
        await tester.pumpAndSettle();

        expect(methodCalls.length, 2);
        expect(find.byType(OrganizationPractitionerKYCStepTwo), findsOneWidget);
      });
    });

    testWidgets('should validate the form fields correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester,
          store: store,
          widget: const OrganizationPractitionerKYCStepOne());

      expect(find.byType(OrganizationPractitionerKYCStepOne), findsOneWidget);
      expect(find.byType(Form), findsOneWidget);
      await tester.enterText(find.byKey(kycLicenceNumber), '');
      await tester.pump();

      await tester.enterText(find.byKey(kycOrganizationCertIncorporation), '');
      await tester.pump();

      expect(find.byType(RawMaterialButton), findsWidgets);
      final RawMaterialButton nextButton = find
          .widgetWithText(RawMaterialButton, next)
          .evaluate()
          .first
          .widget as RawMaterialButton;
      nextButton.onPressed!();
      await tester.pumpAndSettle();

      expect(find.text(licRequired), findsOneWidget);
      expect(find.text(orgTypeRequired), findsOneWidget);
    });
  });
}
