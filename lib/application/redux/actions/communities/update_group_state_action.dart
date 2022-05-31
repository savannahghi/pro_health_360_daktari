import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/states/groups_state.dart';

class UpdateGroupStateAction extends ReduxAction<AppState> {
  final List<GroupMember?>? groupMembers;
  final bool? isModerator;
  final bool? isOwner;

  UpdateGroupStateAction({this.groupMembers, this.isModerator, this.isOwner});

  @override
  AppState reduce() {
    final GroupState? oldState = state.miscState?.groupState;

    final GroupState? groupState = state.miscState?.groupState?.copyWith(
      groupMembers: groupMembers ?? oldState?.groupMembers,
      isModerator: isModerator ?? oldState?.isModerator,
      isOwner: isOwner ?? oldState?.isOwner,
    );

    final AppState newState = state.copyWith(
      miscState: state.miscState?.copyWith(
        groupState: groupState,
      ),
    );

    return newState;
  }
}
