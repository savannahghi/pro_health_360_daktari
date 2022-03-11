import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/contact_admin/pages/contact_admin_page.dart';
import 'package:mycarehubpro/presentation/contact_admin/widgets/contact_admin_card.dart';

import '../../../mocks/test_helpers.dart';

void main() {
  group('Contact admin page', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: Builder(
          builder: (BuildContext context) {
            return const ContactAdminPage();
          },
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(ContactAdminPage), findsOneWidget);
      expect(find.byType(ContactAdminCard), findsNWidgets(2));
      final Finder backButton = find.byKey(appBarBackButtonKey);
      expect(backButton, findsOneWidget);
    });

    testWidgets('launches dialer correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: Builder(
          builder: (BuildContext context) {
            return const ContactAdminPage();
          },
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(ContactAdminPage), findsOneWidget);
      expect(find.byType(ContactAdminCard), findsNWidgets(2));

      final Finder callBtn = find.byKey(callAdminKey);
      expect(callBtn, findsOneWidget);

      await tester.tap(callBtn);
      await tester.pumpAndSettle();
    });

    testWidgets('email launcher launches correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: Builder(
          builder: (BuildContext context) {
            return const ContactAdminPage();
          },
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(ContactAdminPage), findsOneWidget);
      expect(find.byType(ContactAdminCard), findsNWidgets(2));

      final Finder sendEmailBtn = find.byKey(emailAdminKey);
      expect(sendEmailBtn, findsOneWidget);

      await tester.tap(sendEmailBtn);
      await tester.pump();
      await tester.pumpAndSettle(const Duration(seconds: 1));
    });
  });
}
