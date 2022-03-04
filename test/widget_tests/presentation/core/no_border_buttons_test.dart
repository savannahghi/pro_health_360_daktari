import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myharehubpro/presentation/core/widgets/no_border_button.dart';

void main() {
  group('NoBorderButton', () {
    testWidgets('should render correctly', (WidgetTester tester) async {
      bool isActionTapped = false;
      bool isLongPressed = false;

      const Key buttonKey = Key('button_key');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Builder(
                builder: (BuildContext context) {
                  return NoBorderButton(
                    buttonKey: buttonKey,
                    onPressed: () {
                      isActionTapped = true;
                    },
                    onLongPress: () {
                      isLongPressed = true;
                    },
                    text: 'Next',
                  );
                },
              ),
            ),
          ),
        ),
      );

      expect(find.byType(TextButton), findsOneWidget);

      await tester.tap(find.byKey(buttonKey));
      await tester.pumpAndSettle();
      expect(isActionTapped, true);

      await tester.longPress(find.byKey(buttonKey));
      await tester.pumpAndSettle();
      expect(isLongPressed, true);
    });

    testWidgets('should show assertion error', (WidgetTester tester) async {
      expect(
        () => NoBorderButton(onPressed: null, text: null),
        throwsAssertionError,
      );
    });
  });
}
