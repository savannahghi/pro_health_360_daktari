// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/kyc_utils.dart';
import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('kyc_utils', () {
    late Store<CoreState> store;

    setUp(() {
      store = Store<CoreState>(initialState: AppState.initial());
    });

    group('File Upload', () {
      testWidgets('should pass to getUploadId', (WidgetTester tester) async {
        final MockSILGraphQlClient mockSILGraphQlClient =
            MockSILGraphQlClient();
        late String uploadID;
        final Map<String, dynamic> fileData = <String, dynamic>{
          'contentType': 'jpg',
          'title': 'test',
          'base64data': 'test'
        };

        await tester.runAsync(() async {
          await buildTestWidget(
            tester: tester,
            store: store,
            graphQlClient: mockSILGraphQlClient,
            widget: Builder(
              builder: (BuildContext context) {
                return SILPrimaryButton(
                    buttonKey: const Key('get_upload_id'),
                    onPressed: () async {
                      uploadID = await uploadFileAndGetId(
                        fileData: fileData,
                        context: context,
                      );
                    });
              },
            ),
          );
          await tester.pumpAndSettle();

          await tester.tap(find.byKey(const Key('get_upload_id')));
          await tester.pumpAndSettle();
          expect(uploadID, '1r1idoAs54kbZ90l9KkHSK7GKva');
        });
      });

      testWidgets(
          'validateKYCFields method returns snackBar when idUploadId is null',
          (WidgetTester tester) async {
        late bool result;

        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: mockSILGraphQlClient,
          widget: Builder(
            builder: (BuildContext context) {
              return SILPrimaryButton(
                  buttonKey: const Key('validate_kyc_fields'),
                  onPressed: () async {
                    result =
                        validateKYCFields(context: context, idType: 'Passport');
                  });
            },
          ),
        );

        await tester.pumpAndSettle();

        expect(find.byKey(const Key('validate_kyc_fields')), findsOneWidget);
        await tester.tap(find.byKey(const Key('validate_kyc_fields')));

        expect(result, false);
      });

      testWidgets(
          'validateKYCFields method returns snackBar when kraUploadId is null',
          (WidgetTester tester) async {
        late bool result;

        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: mockSILGraphQlClient,
          widget: Builder(
            builder: (BuildContext context) {
              return SILPrimaryButton(
                  buttonKey: const Key('validate_kyc_fields'),
                  onPressed: () async {
                    result = validateKYCFields(
                        context: context,
                        idType: 'Passport',
                        idUploadId: 'not null');
                  });
            },
          ),
        );

        await tester.pumpAndSettle();

        expect(find.byKey(const Key('validate_kyc_fields')), findsOneWidget);
        await tester.tap(find.byKey(const Key('validate_kyc_fields')));

        expect(result, false);
      });
    });
  });
}
