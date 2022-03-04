import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/core/widgets/generic_no_data_widget.dart';

void main() {
  group('GenericNoDataWidget', () {
    testWidgets('should render correctly', (WidgetTester tester) async {
      String testString = '';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Builder(
                builder: (BuildContext context) {
                  return GenericNoDataWidget(
                    recoverCallback: () {
                      testString = 'text';
                    },
                  );
                },
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text(retryString));
      expect(testString, 'text');
    });
  });
}
