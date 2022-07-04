import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/facility.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/staff_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/profile/pages/add_facility_contact_page.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('FacilityContactsPage', () {
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(
        initialState: AppState.initial().copyWith(
          staffState: StaffState(
            defaultFacility: 'test',
            defaultFacilityName: 'test',
            facilities: <Facility>[
              Facility(name: 'test', id: 'test', phone: '0712345678')
            ],
          ),
        ),
      );
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const AddFacilityContactPage(
          phoneNumber: '0712',
        ),
      );
      await tester.pumpAndSettle();

      final Finder phoneInput = find.byType(TextFormField);
      final Finder saveContactBtn = find.text(saveContactString);
      expect(phoneInput, findsOneWidget);
      expect(saveContactBtn, findsOneWidget);

      await tester.enterText(phoneInput, '071234');
      await tester.pumpAndSettle();

      await tester.ensureVisible(saveContactBtn);
      await tester.tap(saveContactBtn);
      await tester.pumpAndSettle();
      expect(find.text(invalidPhoneNumber), findsOneWidget);

      await tester.enterText(phoneInput, '0712345678');
      await tester.pumpAndSettle();
      await tester.tap(saveContactBtn);
      await tester.pumpAndSettle();
      expect(find.byType(AddFacilityContactPage), findsNothing);
    });

    testWidgets(
        'shows snackbar with error message when error occurs while updating facility contact',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'errors': 'error'}),
          201,
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: const AddFacilityContactPage(
          phoneNumber: '071234567',
        ),
      );
      await tester.pumpAndSettle();
      final Finder phoneInput = find.byType(TextFormField);
      final Finder saveContactBtn = find.text(saveContactString);

      await tester.ensureVisible(saveContactBtn);
      await tester.enterText(phoneInput, '0712345678');
      await tester.pumpAndSettle();
      await tester.tap(saveContactBtn);
      await tester.pump(const Duration(seconds: 4));
      expect(find.byType(SnackBar), findsOneWidget);
      expect(
        find.text(getErrorMessage("updating your facility's contact")),
        findsOneWidget,
      );
    });

    testWidgets(
        'shows snackbar with error message when response is false while updating facility contact',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'addFacilityContact': false,
              }
            },
          ),
          201,
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: const AddFacilityContactPage(
          phoneNumber: '071234567',
        ),
      );
      await tester.pumpAndSettle();
      final Finder phoneInput = find.byType(TextFormField);
      final Finder saveContactBtn = find.text(saveContactString);

      await tester.ensureVisible(saveContactBtn);
      await tester.enterText(phoneInput, '0712345678');
      await tester.pumpAndSettle();
      await tester.tap(saveContactBtn);
      await tester.pump(const Duration(seconds: 4));
      expect(find.byType(SnackBar), findsOneWidget);
      expect(
        find.text(getErrorMessage("updating your facility's contact")),
        findsOneWidget,
      );
    });
  });
}
