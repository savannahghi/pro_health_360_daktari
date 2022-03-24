import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/service_requests/widgets/identity_verification_action_dialog.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/client_pin_reset_requests_page.dart';
import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('PinResetRequestsPage', () {
    testWidgets('accepting service request shows success message',
        (WidgetTester tester) async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'verifyPinResetServiceRequest': true,
              'getServiceRequests': <Map<String, dynamic>>[
                <String, dynamic>{
                  'ID': 'some-id',
                  'RequestType': 'PIN_RESET',
                  'ClientName': 'John Doe',
                  'ClientContact': '+254798000000',
                  'Status': 'PENDING',
                  'Meta': <String, dynamic>{
                    'ccc_number': '12345678',
                    'is_ccc_number_valid': true,
                  }
                },
                <String, dynamic>{
                  'ID': 'some-id-2',
                  'RequestType': 'PIN_RESET',
                  'ClientName': 'Jane Doe',
                  'ClientContact': '+254798123456',
                  'Status': 'PENDING',
                  'Meta': <String, dynamic>{
                    'ccc_number': '98745612',
                    'is_ccc_number_valid': true,
                  }
                }
              ],
            }
          }),
          201,
        ),
      );
      await buildTestWidget(
        tester: tester,
        graphQlClient: client,
        widget: const PinResetRequestsPage(),
      );
      await tester.pumpAndSettle();

      expect(find.byType(PinResetRequestsPage), findsOneWidget);

      final Finder acceptFinder =
          find.byKey(const ValueKey<String>('accept_key_0'));

      expect(acceptFinder, findsOneWidget);

      await tester.tap(acceptFinder);
      await tester.pumpAndSettle();
      expect(find.text(pinApprovedSuccessText), findsOneWidget);
    });
    testWidgets(
        'accepting service request shows dialog when cccNumber is not valid',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'verifyPinResetServiceRequest': true,
              'getServiceRequests': <Map<String, dynamic>>[
                <String, dynamic>{
                  'ID': 'some-id',
                  'RequestType': 'PIN_RESET',
                  'ClientName': 'John Doe',
                  'ClientContact': '+254798000000',
                  'Status': 'PENDING',
                  'Meta': <String, dynamic>{
                    'ccc_number': '12345678',
                    'is_ccc_number_valid': false,
                  }
                },
              ],
            }
          }),
          201,
        ),
      );
      await buildTestWidget(
        tester: tester,
        graphQlClient: mockShortGraphQlClient,
        widget: const PinResetRequestsPage(),
      );
      await tester.pumpAndSettle();

      expect(find.byType(PinResetRequestsPage), findsOneWidget);

      final Finder acceptFinder =
          find.byKey(const ValueKey<String>('accept_key_0'));

      expect(acceptFinder, findsOneWidget);

      await tester.tap(acceptFinder);
      await tester.pumpAndSettle();
      expect(find.byType(IdentityVerificationActionDialog), findsOneWidget);

      final Finder checkbox = find.byKey(verifyPhysicalIdentityCheckboxKey);

      Checkbox checkboxFinder = tester.firstWidget(checkbox) as Checkbox;
      expect(checkboxFinder.value, false);

      await tester.tap(checkbox);
      await tester.pump();

      checkboxFinder = tester.firstWidget(checkbox) as Checkbox;
      expect(checkboxFinder.value, true);

      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();
      expect(find.text(pinApprovedSuccessText), findsOneWidget);
    });

    testWidgets('rejecting shows reject success message',
        (WidgetTester tester) async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'verifyPinResetServiceRequest': true,
              'getServiceRequests': <Map<String, dynamic>>[
                <String, dynamic>{
                  'ID': 'some-id',
                  'RequestType': 'PIN_RESET',
                  'ClientName': 'John Doe',
                  'ClientContact': '+254798000000',
                  'Status': 'PENDING',
                },
                <String, dynamic>{
                  'ID': 'some-id-2',
                  'RequestType': 'PIN_RESET',
                  'ClientName': 'Jane Doe',
                  'ClientContact': '+254798123456',
                  'Status': 'PENDING',
                }
              ],
            }
          }),
          201,
        ),
      );

      await buildTestWidget(
        tester: tester,
        graphQlClient: client,
        widget: const PinResetRequestsPage(),
      );
      await tester.pumpAndSettle();

      expect(find.byType(PinResetRequestsPage), findsOneWidget);

      final Finder rejectFinder =
          find.byKey(const ValueKey<String>('reject_key_0'));

      expect(rejectFinder, findsOneWidget);

      await tester.tap(rejectFinder);
      await tester.pumpAndSettle();
      expect(find.text(pinRejectedSuccessText), findsOneWidget);
    });

    testWidgets('should show zero state if no more requests',
        (WidgetTester tester) async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getServiceRequests': <Map<String, dynamic>>[],
            }
          }),
          201,
        ),
      );

      await buildTestWidget(
        tester: tester,
        graphQlClient: client,
        widget: const PinResetRequestsPage(),
      );
      await tester.pumpAndSettle();

      expect(find.byType(GenericErrorWidget), findsOneWidget);
      final Finder buttonTextFinder = find.text(actionTextGenericNoData);
      expect(buttonTextFinder, findsOneWidget);

      await tester.tap(buttonTextFinder);
      await tester.pumpAndSettle();
      expect(find.byType(PinResetRequestsPage), findsNothing);
    });

    testWidgets('tapping call button launches dialler',
        (WidgetTester tester) async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'verifyPinResetServiceRequest': true,
              'getServiceRequests': <Map<String, dynamic>>[
                <String, dynamic>{
                  'ID': 'some-id',
                  'RequestType': 'PIN_RESET',
                  'ClientName': 'John Doe',
                  'ClientContact': '+254798000000',
                  'Status': 'PENDING',
                  'Meta': <String, dynamic>{
                    'ccc_number': '12345678',
                    'is_ccc_number_valid': true,
                  }
                },
              ],
            }
          }),
          201,
        ),
      );

      await buildTestWidget(
        tester: tester,
        graphQlClient: client,
        widget: const PinResetRequestsPage(),
      );
      await tester.pumpAndSettle();

      expect(find.byType(PinResetRequestsPage), findsOneWidget);

      final Finder phoneIcon = find.byIcon(Icons.phone_outlined);
      expect(phoneIcon, findsOneWidget);

      await tester.tap(phoneIcon);
      await tester.pumpAndSettle();
    });
  });
}
