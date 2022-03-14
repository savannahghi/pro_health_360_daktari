import 'package:async_redux/async_redux.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/community_members/member.dart';

class InviteMembersViewModel extends Vm {
  final Wait wait;
  final List<Member> membersList;

  InviteMembersViewModel({
    required this.wait,
    required this.membersList,
  }) : super(equals: <Object?>[wait, membersList]);

  factory InviteMembersViewModel.fromStore(Store<AppState> store) {
    return InviteMembersViewModel(
      wait: store.state.wait!,
      membersList: store.state.miscState?.communityMembers ?? <Member>[],
    );
  }
}
