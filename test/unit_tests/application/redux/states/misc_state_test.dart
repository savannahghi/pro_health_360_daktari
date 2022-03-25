// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/application/redux/states/groups_state.dart';

// Project imports:
import 'package:mycarehubpro/application/redux/states/misc_state.dart';
import 'package:mycarehubpro/domain/core/entities/community_members/group_member.dart';
import '../../../../mocks/mocks.dart';

void main() {
  group('MiscState', () {
    test('fromJson', () {
      expect(
        MiscState.fromJson(mockMiscState),
        MiscState.initial().copyWith(
          groupState: GroupState.initial().copyWith(
            groupMembers: <GroupMember>[
              GroupMember.initial().copyWith(isModerator: true)
            ],
          ),
        ),
      );
    });
  });
}
