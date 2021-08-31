import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:healthcloud/application/redux/actions/flags/app_flags.dart';
import 'package:healthcloud/application/redux/actions/kyc_state_actions/organization/organization_practitioner_kyc_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_page_header.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_supporting_documents.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/organization/organization_practitioner_step_four.dart';
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:shared_ui_components/platform_loader.dart';

import '../../../../../../mocks/mock_utils.dart';
import '../../../../../../mocks/mocks.dart';
import '../../../../../../mocks/test_helpers.dart';

void main() {
  group('organizationPractitioner stepFour', () {
    final Store<CoreState> store =
        Store<CoreState>(initialState: AppState.initial());

    final List<MethodCall> methodCalls = <MethodCall>[];

    setUpAll(() {
      AppBrand().appLogo.add(cameraIconUrl);
      setupFileUploadMock(methodCalls);
      store.dispatch(
        OrganizationPractitionerKYCAction(
            idNumber: 'some-id',
            idDocID: 'some-doc-id',
            idType: 'some-id-type',
            kraPin: 'some-pin',
            kraPinDocID: 'some-pin-doc-id',
            organizationTypeName: 'TRUST',
            certificateOfIncorporation: 'some-incorporation-certificate',
            certificateOfIncorporationDocID:
                'some-incorporation-certificate-doc-id',
            supportingDocumentTitle: 'some-supporting-doc-title',
            supportingDocumentDescription: 'some-supporting-doc-description',
            supportingDocumentUpload: 'some-supporting-doc-id'),
      );
    });

    testWidgets('should enter the form fields correctly and save kyc details',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await buildTestWidget(
            tester: tester,
            store: store,
            graphQlClient: mockSILGraphQlClient,
            widget: const OrganizationPractitionerKYCStepFour());

        // expect to find the rendered widgets
        expect(
            find.byType(OrganizationPractitionerKYCStepFour), findsOneWidget);
        expect(find.byType(KYCPageHeader), findsOneWidget);
        expect(find.byType(Form), findsOneWidget);
        expect(find.byType(KYCSupportingDocuments), findsWidgets);

        //add the supporting documents
        final Finder supportingDocumentButtonUpload =
            find.byKey(kycAddSupportingDocumentButton);
        expect(supportingDocumentButtonUpload, findsOneWidget);

        expect(find.byType(ElevatedButton), findsWidgets);
        final ElevatedButton button = find
            .widgetWithText(ElevatedButton, tapToAddDoc)
            .evaluate()
            .first
            .widget as ElevatedButton;
        button.onPressed!();
        await tester.pumpAndSettle();

        expect(find.byKey(kycSupportingDocumentTitle), findsOneWidget);

        await tester.enterText(find.byKey(kycSupportingDocumentTitle),
            testKYCSupportingDocumentTitle);
        await tester.pump();
        expect(find.byKey(kycSupportingDocumentDescription), findsOneWidget);

        await tester.enterText(find.byKey(kycSupportingDocumentDescription),
            testKYCSupportingDocumentDescription);
        await tester.pump();

        expect(find.byKey(kycSupportingDocumentUpload), findsOneWidget);
        await tester.tap(find.byKey(kycSupportingDocumentUpload));
        await tester.pump();

        //tap done adding documents to upload the supporting documents
        expect(find.byType(RawMaterialButton), findsWidgets);
        final RawMaterialButton addIdsButton = find
            .widgetWithText(RawMaterialButton, doneAddingDoc)
            .evaluate()
            .first
            .widget as RawMaterialButton;
        addIdsButton.onPressed!();
        await tester.pumpAndSettle();

        //expect to find the uploaded supporting document
        expect(find.text(testKYCSupportingDocumentTitle), findsOneWidget);
        expect(find.text(testKYCSupportingDocumentDescription), findsOneWidget);

        expect(methodCalls.length, 1);
        expect(
          methodCalls.first,
          isMethodCall(
            'pickImage',
            arguments: <String, dynamic>{
              'source': 1,
              'maxWidth': null,
              'maxHeight': null,
              'imageQuality': 50,
              'cameraDevice': 0,
            },
          ),
        );
        expect(find.byType(SILPlatformLoader), findsNothing);

        expect(find.byType(RawMaterialButton), findsWidgets);
        final RawMaterialButton saveButton = find
            .widgetWithText(RawMaterialButton, saveText)
            .evaluate()
            .first
            .widget as RawMaterialButton;
        saveButton.onPressed!();
        await tester.pumpAndSettle();

        expect(find.byType(SnackBar), findsOneWidget);
      });
    });

    testWidgets('should validate the form fields correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester,
          store: store,
          widget: const OrganizationPractitionerKYCStepFour());

      // expect to find the rendered widgets
      expect(find.byType(OrganizationPractitionerKYCStepFour), findsOneWidget);
      expect(find.byType(Form), findsOneWidget);
      expect(find.byType(KYCSupportingDocuments), findsWidgets);

      //tap to add supporting document
      expect(find.byType(ElevatedButton), findsWidgets);
      final ElevatedButton button = find
          .widgetWithText(ElevatedButton, tapToAddDoc)
          .evaluate()
          .first
          .widget as ElevatedButton;
      button.onPressed!();
      await tester.pumpAndSettle();
      expect(find.byKey(kycSupportingDocumentTitle), findsOneWidget);

      await tester.enterText(find.byKey(kycSupportingDocumentTitle), '');
      await tester.pump();
      expect(find.byKey(kycSupportingDocumentDescription), findsOneWidget);

      await tester.enterText(find.byKey(kycSupportingDocumentDescription), '');
      await tester.pump();

      //tap done adding documents
      expect(find.byType(RawMaterialButton), findsWidgets);
      final RawMaterialButton addIdsButton = find
          .widgetWithText(RawMaterialButton, doneAddingDoc)
          .evaluate()
          .first
          .widget as RawMaterialButton;
      addIdsButton.onPressed!();
      await tester.pumpAndSettle();

      expect(find.text(allFieldsRequired), findsOneWidget);
    });

    testWidgets('should remove supporting document',
        (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: mockSILGraphQlClient,
          widget: const OrganizationPractitionerKYCStepFour());

      // expect to find the rendered widgets
      expect(find.byType(OrganizationPractitionerKYCStepFour), findsOneWidget);
      //add the supporting documents
      final Finder supportingDocumentButtonUpload =
          find.byKey(kycAddSupportingDocumentButton);
      expect(supportingDocumentButtonUpload, findsOneWidget);

      expect(find.byType(ElevatedButton), findsWidgets);
      final ElevatedButton button = find
          .widgetWithText(ElevatedButton, tapToAddDoc)
          .evaluate()
          .first
          .widget as ElevatedButton;
      button.onPressed!();
      await tester.pumpAndSettle();

      expect(find.byKey(kycSupportingDocumentTitle), findsOneWidget);

      await tester.enterText(find.byKey(kycSupportingDocumentTitle),
          testKYCSupportingDocumentTitle);
      await tester.pump();
      expect(find.byKey(kycSupportingDocumentDescription), findsOneWidget);

      await tester.enterText(find.byKey(kycSupportingDocumentDescription),
          testKYCSupportingDocumentDescription);
      await tester.pump();

      expect(find.byKey(kycSupportingDocumentUpload), findsOneWidget);
      await tester.tap(find.byKey(kycSupportingDocumentUpload));
      await tester.pump();

      //tap done adding documents
      expect(find.byType(RawMaterialButton), findsWidgets);
      final RawMaterialButton addIdsButton = find
          .widgetWithText(RawMaterialButton, doneAddingDoc)
          .evaluate()
          .first
          .widget as RawMaterialButton;
      addIdsButton.onPressed!();
      await tester.pumpAndSettle();

      expect(find.text(testKYCSupportingDocumentTitle), findsWidgets);
      expect(find.text(testKYCSupportingDocumentDescription), findsWidgets);

      //delete the supporting documents
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
      expect(find.text(testKYCSupportingDocumentTitle), findsNothing);
      expect(find.text(testKYCSupportingDocumentDescription), findsNothing);
    });

    testWidgets('should render silPlatformLoader when kycSavingFlag is set',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: Builder(
          builder: (BuildContext context) {
            StoreProvider.dispatch<CoreState>(
                context,
                WaitAction<CoreState>.add(
                  kycSavingFlag,
                  ref: '${kycSavingFlag}_ref',
                ));

            return const OrganizationPractitionerKYCStepFour();
          },
        ),
      );

      expect(find.byType(OrganizationPractitionerKYCStepFour), findsOneWidget);
      expect(find.byType(Form), findsOneWidget);

      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });
  });
}
