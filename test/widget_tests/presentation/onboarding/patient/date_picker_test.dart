import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/core/widgets/date_picker.dart';
import 'package:intl/intl.dart';

void main() {
  group('DatePickerTest', () {
    final DateTime now = DateTime.now();
    final int thisYear = now.year;

    testWidgets('should return correct date', (WidgetTester tester) async {
      final DateTime now = DateTime.now();
      final int thisYear = now.year;
      final int eligibleYear = thisYear - 18;

      const Key formKey = Key('select_option_field');
      const Key testKey = Key('test_key');

      final TextEditingController datePickerController =
          TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return Scaffold(
                body: Form(
                  key: formKey,
                  child: DatePickerField(
                    gestureDateKey: testKey,
                    hintText: 'Enter dob',
                    allowEligibleDate: true,
                    controller: datePickerController,
                    keyboardType: TextInputType.datetime,
                    onChanged: (dynamic val) {
                      datePickerController.text;
                    },
                  ),
                ),
              );
            },
          ),
        ),
      );

      expect(find.byKey(formKey), findsOneWidget);
      expect(find.byKey(testKey), findsOneWidget);

      await tester.tap(find.byKey(testKey));
      await tester.pumpAndSettle();

      expect(find.text(eligibleYear.toString()), findsOneWidget);

      await tester.tap(find.text(eligibleYear.toString()));
      await tester.pumpAndSettle();

      expect(find.text(currentDay.toString()), findsOneWidget);
      await tester.tap(find.text(currentDay.toString()));

      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      expect(
        datePickerController.text,
        DateFormat(datePickerFormat)
            .format(DateTime(eligibleYear, currentMonth, currentDay)),
      );
    });

    testWidgets('should render ios date picker', (WidgetTester tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      final DateFormat formatter = DateFormat('MMMM');
      final String _month = formatter.format(now);
      const Key materialKey = Key('material_key');

      final TextEditingController controller = TextEditingController();
      const Key key = Key('datePickerKey');

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return Material(
                key: materialKey,
                child: DatePickerField(
                  controller: controller,
                  gestureDateKey: key,
                  onChanged: (dynamic val) {
                    controller.text;
                  },
                ),
              );
            },
          ),
        ),
      );

      expect(find.byKey(key), findsOneWidget);
      await tester.tap(find.byKey(key));
      await tester.pumpAndSettle();
      expect(find.byType(Container), findsWidgets);
      expect(find.byType(CupertinoDatePicker), findsOneWidget);

      expect(find.text(_month), findsOneWidget);
      await tester.drag(find.text(_month), const Offset(0, 70.0));

      await tester.pumpAndSettle();

      await tester.tap(find.byKey(key));
      await tester.pumpAndSettle();

      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('should render ios date picker with allowed current year',
        (WidgetTester tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

      final TextEditingController controller = TextEditingController();
      const Key key = Key('datePickerKey');

      final int nextFourYears = thisYear + 4;

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return Material(
                child: DatePickerField(
                  controller: controller,
                  gestureDateKey: key,
                  allowCurrentYear: true,
                  onChanged: (dynamic val) {
                    controller.text;
                  },
                ),
              );
            },
          ),
        ),
      );

      expect(find.byKey(key), findsOneWidget);
      await tester.tap(find.byKey(key));
      await tester.pumpAndSettle();
      expect(find.byType(Container), findsWidgets);
      expect(find.byType(CupertinoDatePicker), findsWidgets);

      expect(find.text(thisYear.toString()), findsOneWidget);
      expect(find.text(nextFourYears.toString()), findsNothing);

      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('should render android date picker with allowed Future years',
        (WidgetTester tester) async {
      final TextEditingController controller = TextEditingController();
      const Key key = Key('datePickerKey');

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return Material(
                child: DatePickerField(
                  controller: controller,
                  gestureDateKey: key,
                  onChanged: (dynamic val) {
                    controller.text;
                  },
                  allowFutureYears: true,
                ),
              );
            },
          ),
        ),
      );

      expect(find.byKey(key), findsOneWidget);
      await tester.tap(find.byKey(key));
      await tester.pumpAndSettle();

      expect(find.text(eligibleYear.year.toString()), findsOneWidget);

      await tester.tap(find.text(eligibleYear.year.toString()));
      await tester.pumpAndSettle();

      expect(find.text('3'), findsOneWidget);
      await tester.tap(find.text('3'));

      expect(find.text('OK'), findsOneWidget);
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      expect(
        controller.text,
        DateFormat(datePickerFormat)
            .format(DateTime(eligibleYear.year, currentMonth, 3)),
      );
    });

    testWidgets('should render android date picker with allowed current years',
        (WidgetTester tester) async {
      final TextEditingController controller = TextEditingController();
      const Key key = Key('datePickerKey');

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return Material(
                child: DatePickerField(
                  controller: controller,
                  gestureDateKey: key,
                  onChanged: (dynamic val) {
                    controller.text;
                  },
                  allowCurrentYear: true,
                ),
              );
            },
          ),
        ),
      );

      expect(find.byKey(key), findsOneWidget);
      await tester.tap(find.byKey(key));
      await tester.pumpAndSettle();

      expect(find.text(thisYear.toString()), findsOneWidget);

      await tester.tap(find.text(thisYear.toString()));
      await tester.pumpAndSettle();

      expect(find.text(currentDay.toString()), findsOneWidget);
      await tester.tap(find.text(currentDay.toString()));

      expect(find.text('OK'), findsOneWidget);
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      expect(
        controller.text,
        DateFormat(datePickerFormat)
            .format(DateTime(thisYear, currentMonth, currentDay)),
      );
    });
  });
}
