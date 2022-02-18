import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/create_group/create_group.dart';

import '../../../mocks/test_helpers.dart';

void main() {
  group('CreateGroup', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(tester: tester, widget: const CreateGroupPage());

      final Finder ageRangeSliderFinder = find.byKey(ageRangeSlider);
      final RangeSlider rangeSlider =
          ageRangeSliderFinder.evaluate().first.widget as RangeSlider;

      rangeSlider.onChanged?.call(const RangeValues(16, 25));
      await tester.tap(ageRangeSliderFinder);
      await tester.pumpAndSettle();

      await tester.tap(find.text('Male'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Female'));
      await tester.pumpAndSettle();

      final Finder inviteOnlyBox = find.byKey(inviteOnlyKey);
      await tester.ensureVisible(inviteOnlyBox.first);
      await tester.tap(inviteOnlyBox);
      await tester.pumpAndSettle();

      final Finder submitBtn = find.byKey(createGroupBtnKey);
      await tester.ensureVisible(submitBtn);
      await tester.tap(submitBtn);
      await tester.pumpAndSettle();
    });
  });
}
