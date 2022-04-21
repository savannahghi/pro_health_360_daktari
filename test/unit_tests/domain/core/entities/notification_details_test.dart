// Package imports:
import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:mycarehubpro/domain/core/entities/notification/notification_details.dart';

import '../../../../mocks/mocks.dart';

void main() {
  group('NotificationDetails', () {
    test('expects to convert NotificationDetails from json', () {
      expect(NotificationDetails.initial(), isA<NotificationDetails>());
      final NotificationDetails mockNotificationDetails =
          NotificationDetails.fromJson(mockNotification);
      expect(mockNotificationDetails, isA<NotificationDetails>());
    });
  });
}
