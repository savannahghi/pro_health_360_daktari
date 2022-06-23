// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:prohealth360_daktari/application/redux/states/misc_state.dart';
import '../../../../mocks/mocks.dart';

void main() {
  group('MiscState', () {
    test('fromJson', () {
      expect(
        MiscState.fromJson(mockMiscState).communityMembers?.isEmpty,
        true,
      );
      expect(
        MiscState.fromJson(mockMiscState)
            .profileFAQsContentState
            ?.errorFetchingFAQs,
        false,
      );

      final MiscState updatedMiscState =
          MiscState.fromJson(mockMiscState).copyWith.call(
        communityMembers: <Member>[Member.initial()],
      );

      expect(updatedMiscState.communityMembers?.length, 1);
      expect(updatedMiscState.communityMembers?.isEmpty, false);
      expect(updatedMiscState.communityMembers?.first.id, UNKNOWN);

      expect(GroupMember.initial().isModerator, false);
    });
  });
}
