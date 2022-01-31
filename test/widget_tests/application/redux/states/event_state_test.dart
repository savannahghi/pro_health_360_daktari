// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:healthcloud/application/redux/states/event_state/event_state.dart';

void main() {
  group('EventObject', () {
    test('fromJson works correctly', () {
      final EventState mockEventState =
          EventState.fromJson(EventState.initial().toJson());

      expect(mockEventState, isA<EventState>());
    });
  });
}
