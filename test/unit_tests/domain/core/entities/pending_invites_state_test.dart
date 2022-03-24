// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/domain/core/entities/pending_invites_state.dart';

import '../../../../mocks/mocks.dart';

void main() {
  group('PendingInvitesState', () {
    test('expects to convert PendingInvitesState from json', () {
      final PendingInvitesState mockNotificationDetails =
          PendingInvitesState.fromJson(mockPendingInvites);
      expect(mockNotificationDetails, isA<PendingInvitesState>());
      expect(PendingInvitesState.initial(), isA<PendingInvitesState>());
    });
  });
}
