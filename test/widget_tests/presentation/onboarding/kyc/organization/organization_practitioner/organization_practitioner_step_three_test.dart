import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:healthcloud/application/redux/actions/kyc_state_actions/organization/organization_practitioner_kyc_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/director_identifications.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_id_doc_and_kra.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/organization/organization_practitioner_step_four.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/organization/organization_practitioner_step_three.dart';
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:misc_utilities/file_manager.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import '../../../../../../mocks/mock_utils.dart';
import '../../../../../../mocks/mocks.dart';
import '../../../../../../mocks/test_helpers.dart';

void main() {
  group('Organization Practitioner stepThree', () {
    final Store<CoreState> store =
        Store<CoreState>(initialState: AppState.initial());

    final List<MethodCall> methodCalls = <MethodCall>[];

    setUpAll(() {
      AppBrand().appLogo.add(cameraIconUrl);
      setupFileUploadMock(methodCalls);
      store.dispatch(
        OrganizationPractitionerKYCAction(
          organizationTypeName: 'LIMITED_COMPANY',
          practiceLicenseID: 'some-id',
          idNumber: 'some-id',
          idDocID: 'some-doc-id',
          idType: 'some-id-type',
          kraPin: 'some-pin',
          kraPinDocID: 'some-pin-doc-id',
        ),
      );
    });

    testWidgets('should enter form fields correctly and navigate to step four',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await buildTestWidget(
            tester: tester,
            store: store,
            graphQlClient: mockSILGraphQlClient,
            widget: const OrganizationPractitionerKYCStepThree());

        expect(find.text(orgPractitionerKYCHeaderTitle), findsOneWidget);
        expect(find.byType(KYCIdDocAndKraPIN), findsOneWidget);
        expect(find.byType(KYCDirectorIdentifications), findsOneWidget);
        await tester.enterText(find.byKey(kycKraNumber), testKYCKraNumber);
        await tester.pump();

        await tester.tap(find.byKey(kycKraNumberUpload));
        await tester.pump();

        //add the director identification documents
        final Finder directorIdentificationButtonUpload =
            find.byKey(kycAddDirectorIdentificationButton);

        expect(directorIdentificationButtonUpload, findsOneWidget);
        await tester.tap(directorIdentificationButtonUpload);
        await tester.pump();

        expect(find.byType(ElevatedButton), findsWidgets);
        final ElevatedButton button = find
            .widgetWithText(ElevatedButton, tapToAddDoc)
            .evaluate()
            .first
            .widget as ElevatedButton;
        button.onPressed!();
        await tester.pumpAndSettle();
        await tester.enterText(find.byKey(kycIdNumber), testKYCIdNumber);
        await tester.pump();

        expect(find.byKey(kycIdOptions), findsOneWidget);
        await tester.tap(find.byKey(kycIdOptions));
        await tester.pump();

        expect(find.text(testKYCIdType), findsWidgets);
        await tester.tap(find.text(testKYCIdType).first);
        await tester.pumpAndSettle();

        expect(find.text(testKYCIdType), findsOneWidget);

        expect(find.byKey(kycIdOptionUpload), findsOneWidget);
        await tester.tap(find.byKey(kycIdOptionUpload));
        await tester.pump();

        //tap done adding documents to upload the ID documents
        expect(find.byType(RawMaterialButton), findsWidgets);
        final RawMaterialButton addIdsButton = find
            .widgetWithText(RawMaterialButton, doneAddingDoc)
            .evaluate()
            .first
            .widget as RawMaterialButton;
        addIdsButton.onPressed!();
        await tester.pumpAndSettle();

        //expect to find the id document with the id number
        expect(find.text(testKYCIdNumber), findsOneWidget);
        expect(methodCalls.length, 2);

        //expect to find the next button and navigate to step three
        expect(find.byType(RawMaterialButton), findsWidgets);
        final RawMaterialButton nextButton = find
            .widgetWithText(RawMaterialButton, next)
            .evaluate()
            .first
            .widget as RawMaterialButton;
        nextButton.onPressed!();
        await tester.pumpAndSettle();

        expect(
            find.byType(OrganizationPractitionerKYCStepFour), findsOneWidget);
      });
    });

    testWidgets('should validate the form fields correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester,
          store: store,
          widget: const OrganizationPractitionerKYCStepThree());

      expect(find.byType(OrganizationPractitionerKYCStepThree), findsOneWidget);
      expect(find.byType(Form), findsOneWidget);
      expect(find.byType(FileManager), findsWidgets);
      await tester.enterText(find.byKey(kycKraNumber), '');
      await tester.pump();

      expect(find.byKey(kycAddDirectorIdentificationButton), findsOneWidget);
      await tester.tap(find.byKey(kycAddDirectorIdentificationButton));
      await tester.pump();

      expect(find.byType(ElevatedButton), findsWidgets);
      final ElevatedButton button = find
          .widgetWithText(ElevatedButton, tapToAddDoc)
          .evaluate()
          .first
          .widget as ElevatedButton;
      button.onPressed!();
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(kycIdNumber), '');
      await tester.pump();

      //tap done adding documents to upload the ID documents
      expect(find.byType(RawMaterialButton), findsWidgets);
      final RawMaterialButton addIdsButton = find
          .widgetWithText(RawMaterialButton, doneAddingDoc)
          .evaluate()
          .first
          .widget as RawMaterialButton;
      addIdsButton.onPressed!();
      await tester.pumpAndSettle();

      //expect to find the id document with the id number
      expect(find.text(allFieldsRequired), findsOneWidget);
    });

    testWidgets('should remove a director identification document',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return const OrganizationPractitionerKYCStepThree();
          },
        ),
      );

      expect(find.byType(OrganizationPractitionerKYCStepThree), findsOneWidget);
      expect(find.byType(FileManager), findsWidgets);
      expect(find.byType(KYCDirectorIdentifications), findsOneWidget);

      final Finder directorIdentificationButtonUpload =
          find.byKey(kycAddDirectorIdentificationButton);

      expect(directorIdentificationButtonUpload, findsOneWidget);
      await tester.tap(directorIdentificationButtonUpload);
      await tester.pump();

      expect(find.byType(ElevatedButton), findsWidgets);
      final ElevatedButton button = find
          .widgetWithText(ElevatedButton, tapToAddDoc)
          .evaluate()
          .first
          .widget as ElevatedButton;
      button.onPressed!();
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(kycIdNumber), testKYCIdNumber);
      await tester.pump();

      expect(find.byKey(kycIdOptions), findsOneWidget);
      await tester.tap(find.byKey(kycIdOptions));
      await tester.pump();

      expect(find.text(testKYCIdType), findsWidgets);
      await tester.tap(find.text(testKYCIdType).first);
      await tester.pumpAndSettle();

      expect(find.text(testKYCIdType), findsOneWidget);

      expect(find.byKey(kycIdOptionUpload), findsOneWidget);
      await tester.tap(find.byKey(kycIdOptionUpload));
      await tester.pump();

      //tap done adding documents to upload the ID documents
      expect(find.byType(RawMaterialButton), findsWidgets);
      final RawMaterialButton addIdsButton = find
          .widgetWithText(RawMaterialButton, doneAddingDoc)
          .evaluate()
          .first
          .widget as RawMaterialButton;
      addIdsButton.onPressed!();
      await tester.pumpAndSettle();

      expect(find.text(testKYCIdNumber), findsWidgets);

      //delete the identification documents
      expect(find.byType(InkResponse), findsWidgets);
      final InkResponse removeIDButton = find
          .widgetWithIcon(InkResponse, Icons.delete)
          .evaluate()
          .first
          .widget as InkResponse;
      removeIDButton.onTap!();
      await tester.pumpAndSettle();

      final InkResponse removeOtherID = find
          .widgetWithIcon(InkResponse, Icons.delete)
          .evaluate()
          .first
          .widget as InkResponse;
      removeOtherID.onTap!();
      await tester.pumpAndSettle();
      expect(find.text(testKYCIdNumber), findsNothing);
    });
  });
}
