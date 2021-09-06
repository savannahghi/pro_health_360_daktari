import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/entities/supporting_documents.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_supporting_documents.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/supporting_documents_result_card.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:misc_utilities/file_manager.dart';
import 'package:shared_ui_components/buttons.dart';

import '../../../../mocks/test_helpers.dart';

void main() {
  group('Supporting Documents page', () {
    final Store<AppState> store =
        Store<AppState>(initialState: AppState.initial());

    testWidgets('Supporting documents renders correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: KYCSupportingDocuments(
          docs: const <SupportingDocument>[
            SupportingDocument(
                title: 'title', description: 'description', upload: 'upload')
          ],
          supportingDocOnChanged: () {},
          removeDocumentFunc: ({String description = '', String title = ''}) {},
        ),
      );

      /// expect to find the rendered widgets
      expect(find.byType(KYCSupportingDocuments), findsOneWidget);
      expect(find.byType(Text), findsWidgets);

      expect(find.byType(SupportingDocumentsResultCard), findsOneWidget);

      /// click button to open supporting document page
      await tester.tap(find.byType(SILSecondaryButton));
      await tester.pumpAndSettle();

      /// Enter text for supporting document page
      await tester.enterText(find.byKey(kycSupportingDocumentTitleKey), 'title');
      await tester.pump();

      await tester.enterText(find.byKey(kycSupportingDocumentTitleKey), '');
      await tester.pump();

      await tester.enterText(
          find.byKey(kycSupportingDocumentDescriptionKey), 'description');
      await tester.pump();

      await tester.enterText(
          find.byKey(kycSupportingDocumentDescriptionKey), 'description');
      await tester.pump();

      /// Find the supporting document form fields and widgets
      expect(find.text(doneAddingDoc), findsOneWidget);

      expect(find.byKey(kycSupportingDocumentTitleKey), findsOneWidget);
      expect(find.byKey(kycSupportingDocumentDescriptionKey), findsOneWidget);
      expect(find.byKey(kycSupportingDocumentUploadKey), findsOneWidget);
      expect(find.byKey(kycAddSupportingDocumentButtonKey), findsOneWidget);

      /// find other widgets
      expect(find.byType(FileManager), findsOneWidget);
      expect(find.byType(SILPrimaryButton), findsOneWidget);
      expect(find.byType(Navigator), findsOneWidget);

      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();
    });

    testWidgets('Supporting documents should upload correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: KYCSupportingDocuments(
          docs: const <SupportingDocument>[
            SupportingDocument(
                title: 'title', description: 'description', upload: 'upload')
          ],
          supportingDocOnChanged: () {},
          removeDocumentFunc: ({String description = '', String title = ''}) {},
        ),
      );

      /// expect to find the rendered widgets
      expect(find.byType(KYCSupportingDocuments), findsOneWidget);
      expect(find.byType(Text), findsWidgets);

      expect(find.byType(SupportingDocumentsResultCard), findsOneWidget);

      /// click button to open supporting document page
      await tester.tap(find.byType(SILSecondaryButton));
      await tester.pumpAndSettle();

      /// Enter text for supporting document page

      await tester.enterText(find.byKey(kycSupportingDocumentTitleKey), '');
      await tester.pump();

      await tester.enterText(find.byKey(kycSupportingDocumentDescriptionKey), '');
      await tester.pump();

      await tester.enterText(find.byKey(kycSupportingDocumentDescriptionKey), '');
      await tester.pump();

      /// Find the supporting document form fields and widgets
      expect(find.text(doneAddingDoc), findsOneWidget);
      expect(find.byKey(kycSupportingDocumentTitleKey), findsOneWidget);
      expect(find.byKey(kycSupportingDocumentDescriptionKey), findsOneWidget);
      expect(
          find.byKey(
            kycSupportingDocumentUploadKey,
          ),
          findsOneWidget);
      expect(find.byKey(kycAddSupportingDocumentButtonKey), findsOneWidget);

      /// find other widgets
      expect(find.byType(FileManager), findsOneWidget);
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();
    });
  });
}
