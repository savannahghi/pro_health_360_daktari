import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/facility.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/staff_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/user.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/profile/pages/add_facility_contact_page.dart';
import 'package:prohealth360_daktari/presentation/profile/pages/facility_contacts_page.dart';

import '../../../mocks/test_helpers.dart';

void main() {
  group('FacilityContactsPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(
        initialState: AppState.initial().copyWith(
          staffState: StaffState(
            defaultFacility: 'test',
            defaultFacilityName: 'test',
            facilities: <Facility>[
              Facility(name: 'test', id: 'test', phone: '0712345678')
            ],
            user: User(
              roles: <Role>[
                Role(
                  active: true,
                  name: RoleValue.SYSTEM_ADMINISTRATOR,
                  roleID: 'test',
                )
              ],
            ),
          ),
        ),
      );
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: Builder(
          builder: (BuildContext context) {
            return FacilityContactsPage();
          },
        ),
      );
      await tester.pumpAndSettle();
      final Finder updateContactBtn = find.text(updateContactString);
      await tester.ensureVisible(updateContactBtn);
      await tester.tap(updateContactBtn);
      await tester.pumpAndSettle();
      expect(find.byType(AddFacilityContactPage), findsOneWidget);
    });
    testWidgets('does not show update contact button for other staff',
        (WidgetTester tester) async {
      final Store<AppState> _store = Store<AppState>(
        initialState: AppState.initial().copyWith(
          staffState: StaffState(
            defaultFacility: 'test',
            defaultFacilityName: 'test',
            facilities: <Facility>[
              Facility(name: 'test', id: 'test', phone: '0712345678')
            ],
            user: User(
              roles: <Role>[
                Role(
                  active: true,
                  name: RoleValue.COMMUNITY_MANAGEMENT,
                  roleID: 'test',
                )
              ],
            ),
          ),
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: _store,
        widget: Builder(
          builder: (BuildContext context) {
            return FacilityContactsPage();
          },
        ),
      );
      await tester.pumpAndSettle();
      final Finder updateContactBtn = find.text(updateContactString);
      expect(updateContactBtn, findsNothing);
      expect(find.text(facilityContactsDescriptionString), findsOneWidget);
    });

    testWidgets('shows zero state when there is no contacts',
        (WidgetTester tester) async {
      final Store<AppState> _store =
          Store<AppState>(initialState: AppState.initial());
      await buildTestWidget(
        tester: tester,
        store: _store,
        widget: Builder(
          builder: (BuildContext context) {
            return FacilityContactsPage();
          },
        ),
      );
      await tester.pumpAndSettle();
      final Finder updateContactBtn = find.text(updateContactString);
      expect(updateContactBtn, findsNothing);
      expect(find.text(noFacilityContactsTitle), findsOneWidget);
    });
  });
}
