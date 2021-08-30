import 'dart:convert';
import 'package:healthcloud/application/core/graphql/mutations.dart';
import 'package:healthcloud/application/redux/actions/kyc_state_actions/save_kyc_details_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:async_redux/async_redux.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  late Store<CoreState> store;

  setUpAll(() {
    store = Store<CoreState>(
      initialState: AppState.initial(),
    );
  });

  testWidgets('SaveKYCDetailsAction', (WidgetTester tester) async {
    dynamic result;

    final MockShortSILGraphQlClient graphQlClient =
        MockShortSILGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'kraPIN': <String>['12345678'],
                'organizationTypeName': 'Demo Organization',
                'certificateOfIncorporation': '',
                'certificateOfInCorporationUploadID': '',
                'organizationCertificate': '',
                'cadre': '',
                'getFeed': mockFeedContent,
              }
            },
          ),
          201),
    );
    await mockNetworkImages(
      () async {
        await buildTestWidget(
          tester: tester,
          graphQlClient: graphQlClient,
          widget: Builder(
            builder: (BuildContext context) {
              return TextButton(
                onPressed: () async {
                  result = await store.dispatch(
                    SaveKYCDetailsAction(
                      context: context,
                      queryString: addOrganizationPractitionerKYCMutation,
                      variables: organizationPractitionerKYCMutationVariables(
                          payload: (StoreProvider.state<CoreState>(context)
                                  as AppState?)!
                              .practitionerKYCState!
                              .organizationPractitioner!),
                      kycName: organizationPractitionerKYCString,
                    ),
                  );
                },
                child: const Text('Tap button'),
              );
            },
          ),
        );

        await tester.tap(find.byType(TextButton));
        await tester.pumpAndSettle();

        expect(result, null);
      },
    );
  });
}
