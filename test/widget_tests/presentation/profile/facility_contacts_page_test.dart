import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/facility.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/staff_state.dart';
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
  });
}
