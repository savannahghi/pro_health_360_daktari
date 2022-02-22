import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/community/group_info/pages/group_info_page.dart';

import '../../../mocks/test_helpers.dart';

void main() {
  group('Group info page', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const GroupInfoPage(),
      );

      expect(find.byKey(inviteMembersButtonKey), findsOneWidget);
      expect(find.text(groupTitle), findsOneWidget);
    });
    testWidgets('invite members button displays snackbar correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const GroupInfoPage(),
      );

      expect(find.byKey(inviteMembersButtonKey), findsOneWidget);
      expect(find.text(groupTitle), findsOneWidget);

      await tester.tap(find.byKey(inviteMembersButtonKey));
      await tester.pumpAndSettle();
      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}
