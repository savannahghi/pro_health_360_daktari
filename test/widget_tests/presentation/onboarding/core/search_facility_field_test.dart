import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/connectivity_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/onboarding/core/widgets/search_facility_field.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('SearchFacilityField', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(
        initialState: AppState.initial()
            .copyWith(connectivityState: ConnectivityState(isConnected: true)),
      );
    });
    testWidgets('Icon Button works correctly', (WidgetTester tester) async {
      String testValue = '';
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: SearchFacilityField(
          onChanged: (String facilityCode) => testValue = facilityCode,
          onFieldCleared: () {},
        ),
        graphQlClient: MockTestGraphQlClient(),
      );
      await tester.pumpAndSettle();

      final Finder facilityFieldFinder =
          find.byKey(facilitySelectOptionFieldKey);
      final Finder saveFacilityBtnFinder = find.byKey(saveFacilityBtnKey);
      final Finder searchFacilityIconBtnFinder =
          find.byKey(searchFacilityIconBtnKey);
      expect(facilityFieldFinder, findsOneWidget);
      await tester.tap(facilityFieldFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Kanairo').last);
      await tester.pumpAndSettle();
      await tester.tap(saveFacilityBtnFinder);
      await tester.pumpAndSettle();

      expect(store.state.miscState?.selectedFacility?.name, 'Kanairo');
      expect(
        find.text(
          store.state.miscState?.selectedFacility?.name ?? '',
        ),
        findsOneWidget,
      );

      await tester.tap(searchFacilityIconBtnFinder);
      await tester.pumpAndSettle();
      expect(find.text('Kanairo'), findsNothing);

      await tester.tap(searchFacilityIconBtnFinder);
      await tester.pumpAndSettle();
      expect(find.text('Kanairo'), findsOneWidget);
      expect(testValue, '5678');
    });
  });
}
