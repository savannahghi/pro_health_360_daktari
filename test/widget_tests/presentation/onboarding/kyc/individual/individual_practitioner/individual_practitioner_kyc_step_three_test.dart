import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:healthcloud/application/redux/actions/flags/app_flags.dart';
import 'package:healthcloud/application/redux/actions/kyc_state_actions/individual_practitioner_kyc_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_page_bottom_actions.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_page_header.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_supporting_documents.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/supporting_documents_result_card.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/individual/individual_practitioner_step_three.dart';
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:shared_ui_components/platform_loader.dart';

import '../../../../../../mocks/mock_utils.dart';
import '../../../../../../mocks/test_helpers.dart';

void main() {
  group('Individual Practitioner KYC step three', () {
    TestWidgetsFlutterBinding.ensureInitialized();

    late Store<CoreState> store;

    final List<MethodCall> methodCalls = <MethodCall>[];

    setUp(() {
      AppBrand().appLogo.add(cameraIconUrl);
      store = Store<CoreState>(initialState: AppState.initial());
      setupFileUploadMock(methodCalls);
      methodCalls.clear();

      store.dispatch(
        IndividualPractitionerKYCAction(
          idNumber: '12345678',
          kraPin: 'some-pin',
          idDocID: 'some-doc-id',
          idType: 'some-id-type',
          kraPinDocID: 'some-pin-doc-id',
          supportingDocumentTitle: 'some-supporting-doc-title',
          supportingDocumentDescription: 'some-supporting-doc-description',
          supportingDocumentUpload: 'some-supporting-doc-id',
        ),
      );
    });

    testWidgets('should enter the form fields correctly',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await buildTestWidget(
            tester: tester,
            store: store,
            widget: const IndividualPractitionerKYCStepThree());

        // expect to find the rendered widgets
        expect(find.byType(IndividualPractitionerKYCStepThree), findsOneWidget);
        expect(find.byType(KYCPageHeader), findsOneWidget);
        expect(find.byType(Form), findsOneWidget);
        expect(find.byType(KYCSupportingDocuments), findsOneWidget);
        expect(find.byType(SupportingDocumentsResultCard), findsOneWidget);

        await tester.pump();

        /// add to open  supporting documents widget
        await tester.tap(find.byKey(kycAddSupportingDocumentButtonKey));
        await tester.pumpAndSettle();

        ///expect to find supporting document widget
        expect(find.byKey(kycSupportingDocumentTitleKey), findsOneWidget);

        expect(find.byKey(kycSupportingDocumentDescriptionKey), findsOneWidget);

        expect(find.byKey(kycSupportingDocumentUploadKey), findsOneWidget);

        await tester.enterText(
            find.byKey(kycSupportingDocumentTitleKey), 'some-title');
        await tester.pump();

        await tester.enterText(
            find.byKey(kycSupportingDocumentDescriptionKey), 'some-description');
        await tester.pump();

        await tester.tap(find.byKey(kycSupportingDocumentUploadKey));
        await tester.pumpAndSettle();

        //tap done adding documents to upload the supporting documents
        expect(find.byType(RawMaterialButton), findsWidgets);
        final RawMaterialButton addIdsButton = find
            .widgetWithText(RawMaterialButton, doneAddingDoc)
            .evaluate()
            .first
            .widget as RawMaterialButton;
        addIdsButton.onPressed!();
        await tester.pumpAndSettle();

        expect(find.text('some-title'), findsOneWidget);
        expect(find.text('some-description'), findsOneWidget);

        //save the supporting documents
        expect(find.byType(RawMaterialButton), findsWidgets);
        final RawMaterialButton saveButton = find
            .widgetWithText(RawMaterialButton, saveText)
            .evaluate()
            .first
            .widget as RawMaterialButton;
        saveButton.onPressed!();
        await tester.pumpAndSettle();

        expect(methodCalls.length, 1);
        expect(find.text('some-title'), findsWidgets);
        expect(find.text('some-description'), findsWidgets);
        expect(find.byType(SnackBar), findsOneWidget);
      });
    });

    testWidgets('should validate the form fields correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester,
          store: store,
          widget: const IndividualPractitionerKYCStepThree());

      await tester.pumpAndSettle();

      // expect to find the rendered widgets
      expect(find.byType(IndividualPractitionerKYCStepThree), findsOneWidget);
      expect(find.byType(Form), findsOneWidget);
      expect(find.byType(KYCSupportingDocuments), findsOneWidget);
      expect(find.byType(KYCPagesBottomActions), findsOneWidget);

      await tester.pumpAndSettle();

      /// add to open  supporting documents widget
      await tester.tap(find.byKey(kycAddSupportingDocumentButtonKey));
      await tester.pumpAndSettle();

      ///expect to find supporting document widget
      expect(find.byKey(kycSupportingDocumentTitleKey), findsOneWidget);

      expect(find.byKey(kycSupportingDocumentDescriptionKey), findsOneWidget);

      expect(find.byKey(kycSupportingDocumentUploadKey), findsOneWidget);

      await tester.enterText(find.byKey(kycSupportingDocumentTitleKey), '');
      await tester.pump();

      await tester.enterText(find.byKey(kycSupportingDocumentDescriptionKey), '');
      await tester.pump();
      await tester.tap(find.byKey(kycSupportingDocumentUploadKey));
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

      /// save supporting documents
      expect(find.byType(RawMaterialButton), findsWidgets);
      final RawMaterialButton saveButton = find
          .widgetWithText(RawMaterialButton, saveText)
          .evaluate()
          .first
          .widget as RawMaterialButton;
      saveButton.onPressed!();
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text(allFieldsRequired), findsWidgets);
    });

    testWidgets('should remove a supporting document',
        (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester,
          store: store,
          widget: const IndividualPractitionerKYCStepThree());

      expect(find.byType(IndividualPractitionerKYCStepThree), findsOneWidget);

      /// add to open  supporting documents widget
      await tester.tap(find.byKey(kycAddSupportingDocumentButtonKey));
      await tester.pumpAndSettle();

      ///expect to find
      expect(find.byKey(kycSupportingDocumentTitleKey), findsOneWidget);

      expect(find.byKey(kycSupportingDocumentDescriptionKey), findsOneWidget);

      expect(find.byKey(kycSupportingDocumentUploadKey), findsOneWidget);

      await tester.enterText(
          find.byKey(kycSupportingDocumentTitleKey), 'some-title');
      await tester.pump();

      await tester.enterText(
          find.byKey(kycSupportingDocumentDescriptionKey), 'some-description');
      await tester.pump();

      await tester.tap(find.byKey(kycSupportingDocumentUploadKey));
      await tester.pump();

      /// Tap Add supporting documents button
      expect(find.byType(RawMaterialButton), findsWidgets);
      final RawMaterialButton addIdsButton = find
          .widgetWithText(RawMaterialButton, doneAddingDoc)
          .evaluate()
          .first
          .widget as RawMaterialButton;
      addIdsButton.onPressed!();
      await tester.pumpAndSettle();

      expect(methodCalls.length, 1);
      expect(find.text('some-title'), findsWidgets);
      expect(find.text('some-description'), findsWidgets);
      expect(find.byType(SILPlatformLoader), findsNothing);

      /// delete the supporting documents
      expect(find.byType(InkResponse), findsWidgets);
      final InkResponse removeIDButton = find
          .widgetWithIcon(InkResponse, Icons.delete)
          .evaluate()
          .first
          .widget as InkResponse;
      removeIDButton.onTap!();
      await tester.pumpAndSettle();

      /// Remove other documents if they were more than one
      final InkResponse removeOtherID = find
          .widgetWithIcon(InkResponse, Icons.delete)
          .evaluate()
          .first
          .widget as InkResponse;
      removeOtherID.onTap!();
      await tester.pumpAndSettle();

      expect(find.text('some-title'), findsNothing);
      expect(find.text('some-description'), findsNothing);
      expect(find.text(addSupportingDocs), findsOneWidget);
    });

    testWidgets('should render SILPlatformLoader when kycSavingFlag is set',
        (WidgetTester tester) async {
      store.dispatch(WaitAction<CoreState>.add(
        kycSavingFlag,
        ref: '${kycSavingFlag}_ref',
      ));

      await buildTestWidget(
          tester: tester,
          store: store,
          widget: const IndividualPractitionerKYCStepThree());

      expect(find.byType(IndividualPractitionerKYCStepThree), findsOneWidget);
      expect(find.byType(Form), findsOneWidget);
      expect(find.byType(KYCSupportingDocuments), findsOneWidget);
      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });
  });
}
