import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/application/redux/states/groups_state.dart';
import 'package:prohealth360_daktari/application/redux/states/search_user_response_state.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';

part 'misc_state.freezed.dart';
part 'misc_state.g.dart';

@freezed
class MiscState with _$MiscState {
  factory MiscState({
    String? initialRoute,
    String? error,
    FAQsContentState? profileFAQsContentState,
    ListContentCategory? categoriesList,
    List<Member>? communityMembers,
    GroupState? groupState,
    SearchUserResponseState? searchUserResponseState,
    String? inactiveTime,
    bool? resumeWithPin,
  }) = _MiscState;

  factory MiscState.fromJson(Map<String, dynamic> json) =>
      _$MiscStateFromJson(json);

  factory MiscState.initial() => MiscState(
        initialRoute: AppRoutes.loginPage,
        profileFAQsContentState: FAQsContentState.initial(),
        communityMembers: <Member>[],
        groupState: GroupState.initial(),
        searchUserResponseState: SearchUserResponseState.initial(),
        inactiveTime: UNKNOWN,
        resumeWithPin: false,
        categoriesList: ListContentCategory.initial(),
      );
}
