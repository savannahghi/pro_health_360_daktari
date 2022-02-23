// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/surveys/widgets/share_classification_widget.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('ShareClassification Widget', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: Builder(
          builder: (BuildContext context) {
            return StoreProvider<AppState>(
              store: store,
              child: const ShareClassificationWidget(),
            );
          },
        ),
      );

      expect(find.text(shareToString), findsOneWidget);
      expect(find.byType(SelectOptionField), findsWidgets);

      await tester.tap(find.byKey(bandSelectOptionFieldKey));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Female').last);
      await tester.pumpAndSettle();
      expect(find.byType(ScaffoldMessenger), findsOneWidget);

      await tester.tap(find.byKey(ageSelectOptionFieldKey));
      await tester.pumpAndSettle();
      await tester.tap(find.text('16-20yrs').last);
      await tester.pumpAndSettle();
      expect(find.byType(ScaffoldMessenger), findsOneWidget);

      await tester.tap(find.byKey(locationSelectOptionFieldKey));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Ruiru').last);
      await tester.pumpAndSettle();
      expect(find.byType(ScaffoldMessenger), findsOneWidget);

      await tester.tap(find.byKey(clinicSelectOptionFieldKey));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Ruiru Level iv Hospital').last);
      await tester.pumpAndSettle();
      expect(find.byType(ScaffoldMessenger), findsOneWidget);
    });
  });
}
