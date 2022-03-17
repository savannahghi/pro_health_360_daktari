import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/pin_reset_requests_page.dart';
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
              'approvePinResetServiceRequest': true,
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

      final Finder acceptFinder =
          find.byKey(const ValueKey<String>('accept_key_0'));
      final Finder rejectFinder =
          find.byKey(const ValueKey<String>('reject_key_0'));

      expect(acceptFinder, findsOneWidget);
      expect(rejectFinder, findsOneWidget);

      await tester.tap(acceptFinder);
      await tester.pumpAndSettle();
      expect(find.text(pinApprovedSuccessText), findsOneWidget);
    });

    testWidgets('rejecting shows coming soon message',
        (WidgetTester tester) async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'approvePinResetServiceRequest': true,
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
      expect(find.text(comingSoonText), findsOneWidget);
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
  });
}
