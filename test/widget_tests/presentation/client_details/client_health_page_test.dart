// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/client_details/pages/client_health_page.dart';
import 'package:mycarehubpro/presentation/client_details/widgets/client_details_card_widget.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('ClientHealthPage', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: Builder(
          builder: (BuildContext context) {
            return ClientHealthPage();
          },
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(ClientDetailsCard), findsWidgets);

      final Finder newEntryButton = find.byKey(newEntryButtonKey);
      final Finder addButton = find.byKey(addButtonKey);
      final Finder viewProfileButton = find.byKey(viewProfileButtonKey);
      expect(newEntryButton, findsOneWidget);

      await tester.tap(newEntryButton);
      await tester.pumpAndSettle();
      expect(addButton, findsOneWidget);

      await tester.tap(addButton);
      await tester.pumpAndSettle();
      expect(viewProfileButton, findsOneWidget);

      await tester.tap(viewProfileButton);
      await tester.pumpAndSettle();
      expect(viewProfileButton, findsNothing);
    });
  });
}
