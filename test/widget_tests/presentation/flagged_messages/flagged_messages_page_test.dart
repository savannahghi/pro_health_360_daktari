// Flutter imports:
// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/flagged_messages/pages/flagged_messages_page.dart';
import 'package:mycarehubpro/presentation/flagged_messages/widgets/flagged_messages_list_item.dart';

import '../../../mocks/test_helpers.dart';

void main() {
  group('Flagged Messages Page', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: Builder(
          builder: (BuildContext context) {
            return StoreProvider<AppState>(
              store: store,
              child: const FlaggedMessagesPage(),
            );
          },
        ),
      );

      expect(find.text(flaggedMessagesString), findsOneWidget);
      expect(find.text(groupTitle), findsOneWidget);
      expect(find.text(flaggedMessagesDescription), findsOneWidget);
      expect(find.byType(FlaggedMessagesListItem), findsWidgets);
    });
  });
}
