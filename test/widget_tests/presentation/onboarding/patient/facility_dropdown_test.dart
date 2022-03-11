import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/states/connectivity_state.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/onboarding/patient/widgets/facility_dropdown.dart';
import 'package:rxdart/rxdart.dart';

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
      String? currentValue = '';

      final BehaviorSubject<String> source = BehaviorSubject<String>();

      await buildTestWidget(
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        tester: tester,
        widget: FacilityDropdown(
          dropdownInputKey: facilitySelectOptionFieldKey,
          label: 'Preferred Facility',
          stream: source,
          onChanged: (String? value) {
            if (value != null) {
              currentValue = value;
              source.add(value);
            }
          },
        ),
      );
      await tester.pumpAndSettle();

      expect(currentValue, '');

      final Finder facilityFieldFinder =
          find.byKey(facilitySelectOptionFieldKey);
      expect(facilityFieldFinder, findsWidgets);

      await tester.tap(facilityFieldFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Kanairo').last);
      await tester.pumpAndSettle();

      expect(currentValue, 'Kanairo');
    });
  });
}
