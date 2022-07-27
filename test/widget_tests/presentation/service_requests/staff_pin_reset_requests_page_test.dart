import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/staff_pin_reset_requests_page.dart';
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
              'verifyStaffPinResetServiceRequest': true,
              'getServiceRequests': <Map<String, dynamic>>[
                <String, dynamic>{
                  'ID': 'some-id',
                  'RequestType': 'STAFF_PIN_RESET',
                  'StaffName': 'John Doe',
                  'StaffContact': '+254798000000',
                  'Status': 'PENDING',
                },
                <String, dynamic>{
                  'ID': 'some-id-2',
                  'RequestType': 'STAFF_PIN_RESET',
                  'StaffName': 'John Doe',
                  'StaffContact': '+254798000000',
                  'Status': 'PENDING',
                }
              ],
              'searchServiceRequests': <Map<String, dynamic>>[
                <String, dynamic>{
                  'ID': 'some-id',
                  'RequestType': 'STAFF_PIN_RESET',
                  'StaffName': 'John Doe',
                  'StaffContact': '+254798000000',
                  'Status': 'PENDING',
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
        widget: const StaffPinResetRequestsPage(),
      );
      await tester.pumpAndSettle();

      expect(find.byType(StaffPinResetRequestsPage), findsOneWidget);

      final Finder acceptFinder = find.text('Approve');

      expect(acceptFinder, findsNWidgets(2));

      await tester.tap(acceptFinder.first);
      await tester.pumpAndSettle();
      expect(find.text(pinApprovedSuccessText), findsOneWidget);

      final Finder searchNameFinder = find.byType(CustomTextField);
      final Finder searchIconButton = find.byKey(searchIconButtonKey);
      expect(searchNameFinder, findsOneWidget);
      await tester.tap(searchNameFinder);
      await tester.enterText(searchNameFinder, 'test');

      await tester.tap(searchIconButton);
      await tester.pumpAndSettle();
      expect(find.text(pinApprovedSuccessText), findsOneWidget);
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
        widget: const StaffPinResetRequestsPage(),
      );
      await tester.pumpAndSettle();

      expect(find.byType(GenericErrorWidget), findsOneWidget);
      final Finder buttonTextFinder = find.text(actionTextGenericNoData);
      expect(buttonTextFinder, findsOneWidget);

      await tester.tap(buttonTextFinder);
      await tester.pumpAndSettle();
      expect(find.byType(StaffPinResetRequestsPage), findsNothing);
    });

    testWidgets('tapping call button launches dialler',
        (WidgetTester tester) async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'verifyStaffPinResetServiceRequest': true,
              'getServiceRequests': <Map<String, dynamic>>[
                <String, dynamic>{
                  'ID': 'some-id',
                  'RequestType': 'STAFF_PIN_RESET',
                  'StaffName': 'John Doe',
                  'StaffContact': '+254798000000',
                  'Status': 'PENDING',
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
        widget: const StaffPinResetRequestsPage(),
      );
      await tester.pumpAndSettle();

      expect(find.byType(StaffPinResetRequestsPage), findsOneWidget);

      final Finder phoneIcon = find.byIcon(Icons.phone_outlined);
      expect(phoneIcon, findsOneWidget);

      await tester.tap(phoneIcon);
      await tester.pumpAndSettle();
    });

    testWidgets(
      'should show GenericErrorWidget when there is no staff PIN resets when searching',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'getServiceRequests': <Map<String, dynamic>>[
                  <String, dynamic>{
                    'ID': 'some-id',
                    'RequestType': 'STAFF_PIN_RESET',
                    'StaffName': 'John Doe',
                    'StaffContact': '+254798000000',
                    'Status': 'PENDING',
                  }
                ],
                'searchServiceRequests': <dynamic>[]
              }
            }),
            201,
          ),
        );

        await buildTestWidget(
          tester: tester,
          graphQlClient: mockShortGraphQlClient,
          widget: const StaffPinResetRequestsPage(),
        );
        await tester.pumpAndSettle();

        expect(find.byType(StaffPinResetRequestsPage), findsOneWidget);

        final Finder acceptFinder = find.text('Approve');

        expect(acceptFinder, findsOneWidget);

        final Finder searchNameFinder = find.byType(CustomTextField);
        final Finder searchIconButton = find.byKey(searchIconButtonKey);
        expect(searchNameFinder, findsOneWidget);
        await tester.tap(searchNameFinder);
        await tester.enterText(searchNameFinder, 'test');

        await tester.tap(searchIconButton);
        await tester.pumpAndSettle();

        expect(acceptFinder, findsNothing);
        expect(find.byType(GenericErrorWidget), findsOneWidget);
      },
    );
      testWidgets(
      'should show an error widget when fetching staff PIN reset requests',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{'error': 'some error occurred'}),
            201,
          ),
        );

        await buildTestWidget(
          tester: tester,
          graphQlClient: mockShortGraphQlClient,
          widget: const StaffPinResetRequestsPage(),
        );

        await tester.pumpAndSettle();
        final Finder genericNoDataButton = find.byKey(helpNoDataWidgetKey);

        expect(genericNoDataButton, findsOneWidget);

        /// Refresh and expect the same thing
        await tester.ensureVisible(genericNoDataButton);
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(helpNoDataWidgetKey));

        await tester.pumpAndSettle();
        expect(genericNoDataButton, findsOneWidget);
      },
    );
  });
}
