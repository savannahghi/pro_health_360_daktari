import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/domain/core/entities/core/invited_communities.dart';

import '../../../mocks/mocks.dart';

void main() {
  test('CommunitiesState convert from json', () {
    expect(InvitedCommunities.initial(), isA<InvitedCommunities>());
    final InvitedCommunities communitiesState =
        InvitedCommunities.fromJson(mockInvitedCommunities);

    expect(communitiesState.invitedCommunities!.length, 1);
  });
}
