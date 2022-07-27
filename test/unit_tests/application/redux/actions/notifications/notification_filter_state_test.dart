// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:prohealth360_daktari/domain/core/entities/core/notification_filter_state.dart';

void main() {
  test('NotificationFilterState should convert to/from JSON', () {
    expect(
      NotificationFilterState.initial()
          .toJson()
          .containsKey('notificationFilters'),
      true,
    );
    final NotificationFilterState notificationFilterState =
        NotificationFilterState.fromJson(
      <String, dynamic>{'notificationFilters': <dynamic>[]},
    );

    expect(notificationFilterState.notificationFilters?.isEmpty ?? false, true);
  });
}
