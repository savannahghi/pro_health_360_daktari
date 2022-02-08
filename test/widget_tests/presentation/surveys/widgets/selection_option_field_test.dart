// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/surveys/widgets/selection_option_field.dart';

void main() {
  group('SelectOptionField', () {
    testWidgets('SelectOptionField', (WidgetTester tester) async {
      Type typeOf<T>() {
        return T;
      }

      const String _selectedGender = 'Male';
      const Key formKey = Key('select_option_field');
      final List<String> options = <String>[
        'Male',
        'Female',
        'Unknown',
        'Other'
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return Scaffold(
                body: Form(
                  key: formKey,
                  child: SelectOptionField(
                    dropDownInputKey: selectOptionFieldKey,
                    hintText: 'Select gender',
                    value: _selectedGender,
                    options: options,
                    onSaved: (dynamic value) {},
                    onChanged: (dynamic val) {},
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

      await tester.tap(find.text('Select gender'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Female').last);
      await tester.pumpAndSettle();
    });
  });
}
