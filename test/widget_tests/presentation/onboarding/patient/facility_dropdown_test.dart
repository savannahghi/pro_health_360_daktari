// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/onboarding/patient/widgets/facility_dropdown.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('FacilityDropdown', () {
    testWidgets('FacilityDropdown', (WidgetTester tester) async {
      Type typeOf<T>() {
        return T;
      }

      await buildTestWidget(
        graphQlClient: MockTestGraphQlClient(),
        tester: tester,
        widget: FacilityDropdown(
          dropdownInputKey: facilitySelectOptionFieldKey,
          label: 'Prefered Facility',
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
