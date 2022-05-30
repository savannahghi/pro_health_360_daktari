import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/presentation/core/widgets/edit_widget.dart';

import '../../../mocks/test_helpers.dart';

void main() {
  group('Edit Widget test', () {
    testWidgets('should display correctly', (WidgetTester tester) async {
      int tapped = 0;

      await buildTestWidget(
        tester: tester,
        widget: EditWidget(
          buttonKey: const Key('test_key'),
          onTap: () => tapped++,
        ),
      );

      final Finder key = find.byKey(const Key('test_key'));
      expect(key, findsOneWidget);
      await tester.tap(key);

      expect(tapped, 1);
    });
  });
}
