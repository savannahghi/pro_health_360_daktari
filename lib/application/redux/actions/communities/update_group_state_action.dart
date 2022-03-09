import 'package:async_redux/async_redux.dart';
import 'package:myharehubpro/application/redux/states/app_state.dart';
import 'package:myharehubpro/application/redux/states/groups_state.dart';
import 'package:myharehubpro/domain/core/entities/community_members/group_member.dart';

class UpdateGroupStateAction extends ReduxAction<AppState> {
  final List<GroupMember?>? groupMembers;

  UpdateGroupStateAction({
    this.groupMembers,
  });

  @override
  Future<AppState> reduce() async {
    final GroupState? groupState =
        state.miscState?.groupState?.copyWith(
      groupMembers: groupMembers ??
          state.miscState?.groupState?.groupMembers,
    );

    final AppState newState = state.copyWith(
      miscState: state.miscState?.copyWith(
        groupState: groupState,
      ),
    );

    return newState;
  }
}
