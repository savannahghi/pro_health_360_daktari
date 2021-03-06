import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';

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
