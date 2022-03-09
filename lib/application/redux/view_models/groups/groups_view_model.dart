import 'package:async_redux/async_redux.dart';
import 'package:myharehubpro/application/redux/states/app_state.dart';
import 'package:myharehubpro/domain/core/entities/community_members/group_member.dart';

class GroupsViewModel extends Vm {
  final Wait wait;
  final List<GroupMember?>? groupMembers;

  GroupsViewModel({
    required this.wait,
    this.groupMembers,
  }) : super(
          equals: <Object?>[
            wait,
            groupMembers,
          ],
        );

  factory GroupsViewModel.fromStore(Store<AppState> store) {
    return GroupsViewModel(
      wait: store.state.wait!,
      groupMembers: store.state.miscState?.groupState?.groupMembers,
    );
  }
}
