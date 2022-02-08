// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/onboarding/patient/widgets/facility_dropdown.dart';

void main() {
  group('FacilityDropdown', () {
    testWidgets('FacilityDropdown', (WidgetTester tester) async {
      Type typeOf<T>() {
        return T;
      }

      const Key formKey = Key('select_option_field');

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return const Scaffold(
                body: Form(
                  key: formKey,
                  child: FacilityDropdown(
                    label: 'Prefered Facility',
                  ),
                ),
              );
            },
          ),
        ),
      );

      expect(find.byKey(formKey), findsWidgets);

      expect(find.byKey(selectOptionFieldKey), findsWidgets);
      expect(find.byType(DropdownButtonHideUnderline), findsOneWidget);
      expect(find.byType(typeOf<DropdownButton<String>>()), findsOneWidget);

      await tester.tap(find.text('Nairobi'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Kisumu').last);
      await tester.pumpAndSettle();
      expect(find.byType(ScaffoldMessenger), findsOneWidget);
    });
  });
}
