import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';

class GroupsViewModel extends Vm {
  final Wait wait;
  final List<GroupMember?>? groupMembers;
  final List<Role>? staffRoles;
  final bool? isModerator;

  GroupsViewModel({
    required this.wait,
    this.groupMembers,
    this.staffRoles,
    this.isModerator,
  }) : super(equals: <Object?>[wait, groupMembers, isModerator]);

  factory GroupsViewModel.fromStore(Store<AppState> store) {
    return GroupsViewModel(
      wait: store.state.wait!,
      groupMembers: store.state.miscState?.groupState?.groupMembers,
      staffRoles: store.state.staffState?.user?.roles,
      isModerator: store.state.miscState?.groupState?.isModerator,
    );
  }
}
