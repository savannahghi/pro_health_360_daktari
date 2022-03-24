import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/domain/core/entities/core/communities_state.dart';

import '../../../mocks/mocks.dart';

void main() {
  test('CommunitiesState convert from json', () {
    final CommunitiesState communitiesState =
        CommunitiesState.fromJson(mockCommunitiesState);

    expect(communitiesState.invitedCommunities!.length, 1);
  });
}
