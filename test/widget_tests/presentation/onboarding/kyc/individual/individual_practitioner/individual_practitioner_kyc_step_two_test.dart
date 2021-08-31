import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:healthcloud/application/redux/actions/flags/app_flags.dart';
import 'package:healthcloud/application/redux/actions/kyc_state_actions/individual/individual_practitioner_kyc_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_page_bottom_actions.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/individual/individual_practitioner_step_three.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/individual/individual_practitioner_step_two.dart';
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:misc_utilities/file_manager.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:shared_ui_components/platform_loader.dart';

import '../../../../../../mocks/mock_utils.dart';
import '../../../../../../mocks/test_helpers.dart';

void main() {
  group('Individual Practitioner Step Two', () {
    late Store<CoreState> store;

    TestWidgetsFlutterBinding.ensureInitialized();

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

    testWidgets('should enter form fields correctly',
        (WidgetTester tester) async {
      store.dispatch(WaitAction<CoreState>.remove(kycSavingFlag,
          ref: '${kycSavingFlag}_ref'));

      await mockNetworkImages(() async {
        await buildTestWidget(
            tester: tester,
            store: store,
            widget: IndividualPractitionerKYCStepTwo());

        expect(find.byType(IndividualPractitionerKYCStepTwo), findsOneWidget);
        expect(find.text('Identification document details'), findsOneWidget);
        expect(find.byType(Form), findsOneWidget);
        expect(find.byType(FileManager), findsNWidgets(2));
        expect(find.byKey(kycIdNumber), findsOneWidget);
        expect(find.byKey(kycIdOptions), findsOneWidget);
        expect(find.text('National ID'), findsOneWidget);

        // Enter id number
        await tester.tap(find.text('National ID'));
        await tester.pump();
        await tester.enterText(find.byKey(kycIdNumber), '12345678');
        await tester.pump();

        // Enter KRA Pin
        await tester.enterText(find.byKey(kycKraNumber), 'QA8945wuhue');
        await tester.pump();

        // Here it is necessary to call `.last` as the first widget returned belongs to the
        // index stack and is not the desired one.
        await tester
            .tap(find.byKey(ValueKey<String>(DocumentType.Passport.name)).last);
        await tester.pumpAndSettle();

        expect(
            find.byWidgetPredicate((Widget widget) =>
                widget is DropdownButton<String> &&
                widget.value == DocumentType.Passport.name),
            findsOneWidget);

        // Upload KYC ID
        final Finder kycIdFileUpload = find.byKey(kycIdOptionUpload);
        expect(kycIdFileUpload, findsOneWidget);
        await tester.tap(kycIdFileUpload);
        await tester.pumpAndSettle();

        final Finder kraFileUploadId =
            find.byKey(kycKraNumberUpload, skipOffstage: false);
        await tester.ensureVisible(kraFileUploadId);
        await tester.tap(kraFileUploadId);
        await tester.pumpAndSettle();

        await tester
            .tap(find.byKey(ValueKey<String>(DocumentType.National_ID.name)));
        await tester.pumpAndSettle();

        /// expect to find the next button and navigate to step three
        final Finder nextButton =
            find.byKey(nextStepKycButton, skipOffstage: false);
        await tester.ensureVisible(nextButton);

        await tester.tap(nextButton);
        await tester.pumpAndSettle();

        //check if data has been saved to state
        expect(methodCalls.length, 2);
        expect(find.byType(SILPlatformLoader), findsNothing);
        expect(find.byType(IndividualPractitionerKYCStepThree), findsOneWidget);
      });
    });

    testWidgets('should validate the form fields correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester,
          store: store,
          widget: IndividualPractitionerKYCStepTwo());

      expect(find.byType(IndividualPractitionerKYCStepTwo), findsOneWidget);
      expect(find.byType(Form), findsOneWidget);
      expect(find.byType(FileManager), findsWidgets);
      expect(find.byType(KYCPagesBottomActions), findsOneWidget);
      expect(find.byKey(kycIdNumber), findsOneWidget);

      await tester.enterText(find.byKey(kycIdNumber), '');
      await tester.pump();

      await tester.enterText(find.byKey(kycKraNumber), '');
      await tester.pump();

      /// expect to find the next button and navigate to step three
      final Finder nextButton =
          find.byKey(nextStepKycButton, skipOffstage: false);
      await tester.ensureVisible(nextButton);

      await tester.tap(nextButton);
      await tester.pumpAndSettle();
    });

    testWidgets('should render silPlatformLoader when kycSavingFlag is set',
        (WidgetTester tester) async {
      store.dispatch(
        WaitAction<CoreState>.remove(kycSavingFlag,
            ref: '${kycSavingFlag}_ref'),
      );

      await buildTestWidget(
          tester: tester,
          store: store,
          widget: IndividualPractitionerKYCStepTwo());

      expect(find.byType(IndividualPractitionerKYCStepTwo), findsOneWidget);
      expect(find.byType(Form), findsOneWidget);
      expect(find.byType(FileManager), findsWidgets);

      // expect to find the next button and navigate to step three
      final Finder nextButton =
          find.byKey(nextStepKycButton, skipOffstage: false);
      await tester.ensureVisible(nextButton);

      await tester.tap(nextButton);
      await tester.pumpAndSettle();
    });
  });
}
