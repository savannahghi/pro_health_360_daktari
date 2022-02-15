import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/application/redux/states/connectivity_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/onboarding/patient/widgets/facility_dropdown.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('FacilityDropdown', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(
        initialState: AppState.initial()
            .copyWith(connectivityState: ConnectivityState(isConnected: true)),
      );
    });

    testWidgets('FacilityDropdown', (WidgetTester tester) async {
      Type typeOf<T>() {
        return T;
      }

      await buildTestWidget(
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        tester: tester,
        widget: FacilityDropdown(
          dropdownInputKey: facilitySelectOptionFieldKey,
          label: 'Preferred Facility',
          stream: Stream<String>.value('Kanairo'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byKey(facilitySelectOptionFieldKey), findsWidgets);
      expect(find.byType(DropdownButtonHideUnderline), findsOneWidget);
      expect(find.byType(typeOf<DropdownButton<String>>()), findsOneWidget);

      await tester.tap(find.text('Kanairo'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Test Facility').last);
      await tester.pumpAndSettle();
      expect(find.byType(ScaffoldMessenger), findsOneWidget);
    });
  });
}
