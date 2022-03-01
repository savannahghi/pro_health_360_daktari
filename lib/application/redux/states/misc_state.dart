import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:healthcloud/domain/core/entities/community_members/member.dart';
import 'package:healthcloud/presentation/router/routes.dart';

part 'misc_state.freezed.dart';
part 'misc_state.g.dart';

@freezed
class MiscState with _$MiscState {
  factory MiscState({
    String? initialRoute,
    String? error,
    FAQsContentState? profileFAQsContentState,
    List<Member>? communityMembers,
  }) = _MiscState;

  factory MiscState.fromJson(Map<String, dynamic> json) =>
      _$MiscStateFromJson(json);

  factory MiscState.initial() => MiscState(
        initialRoute: AppRoutes.loginPage,
        profileFAQsContentState: FAQsContentState.initial(),
        communityMembers: <Member>[],
      );
}
