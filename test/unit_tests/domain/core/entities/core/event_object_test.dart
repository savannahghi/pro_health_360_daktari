// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/domain/core/entities/core/event_object.dart';

void main() {
  group('EventObject', () {
    test('fromJson works correctly', () {
      final EventObject mockEventObject =
          EventObject.fromJson(EventObject.initial().toJson());

      expect(mockEventObject, isA<EventObject>());
    });
  });
}
