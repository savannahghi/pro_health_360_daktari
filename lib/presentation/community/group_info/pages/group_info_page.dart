import 'dart:ui';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycarehubpro/application/core/services/helpers.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/application/redux/actions/communities/fetch_group_members_action.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/view_models/groups/groups_view_model.dart';
import 'package:mycarehubpro/domain/core/entities/community_members/group_member.dart';
import 'package:mycarehubpro/domain/core/entities/core/role.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/community/group_info/widgets/group_member_item.dart';
import 'package:mycarehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:mycarehubpro/presentation/router/routes.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_themes/constants.dart';
import 'package:shared_themes/spaces.dart';

class GroupInfoPage extends StatefulWidget {
  const GroupInfoPage({required this.payload});

  final Map<String, dynamic> payload;

  @override
  State<GroupInfoPage> createState() => _GroupInfoPageState();
}

class _GroupInfoPageState extends State<GroupInfoPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    StoreProvider.dispatch<AppState>(
      context,
      FetchGroupMembersAction(
        context,
        client: AppWrapperBase.of(context)!.graphQLClient,
        variables: <String, dynamic>{
          'communityID': widget.payload['channelId'] as String,
        },
        onError: (String? error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(getErrorMessage(groupMembersText.toLowerCase())),
              duration: const Duration(seconds: kShortSnackBarDuration),
            ),
          );
          Sentry.captureException(
            UserException(error),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String channelName = widget.payload['channelName'] as String;
    return Scaffold(
      appBar: const CustomAppBar(title: groupInfoText),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SvgPicture.asset(
                      groupInfoImage,
                      height: 200.0,
                      width: 200.0,
                    ),
                    Text(
                      channelName,
                      style: boldSize20Text(AppColors.lightBlackTextColor),
                    ),
                    verySmallVerticalSizedBox,
                    Text(
                      getGroupMembersNumber(
                        widget.payload['memberCount'] as int,
                      ),
                      style: boldSize16Text(AppColors.greyTextColor),
                    ),
                    StoreConnector<AppState, GroupsViewModel>(
                      converter: (Store<AppState> store) =>
                          GroupsViewModel.fromStore(store),
                      builder: (BuildContext context, GroupsViewModel vm) {
                        if (vm.wait.isWaitingFor(fetchGroupMembersFlag)) {
                          return const Padding(
                            padding: EdgeInsets.only(
                              top: 50,
                            ),
                            child: PlatformLoader(),
                          );
                        }

                        final List<GroupMember?>? groupMembers =
                            vm.groupMembers;
                        final List<Role>? staffRoles = vm.staffRoles;

                        return Column(
                          children: <Widget>[
                            largeVerticalSizedBox,
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                groupMembersText,
                                style: boldSize20Text(
                                  AppColors.blackColor,
                                ),
                              ),
                            ),
                            largeVerticalSizedBox,
                            ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: groupMembers!.length,
                              itemBuilder: (BuildContext context, int index) {
                                final GroupMember currentMember =
                                    groupMembers.elementAt(index)!;

                                final String name =
                                    currentMember.memberDetails?.username ?? '';
                                final String id =
                                    currentMember.memberDetails?.id ?? '';

                                final bool isModerator =
                                    currentMember.isModerator;

                                final bool canModerate = staffRoles != null &&
                                    staffRoles.isNotEmpty &&
                                    staffRoles
                                        .contains(communityManagementRole);
                                        final bool isBanned = currentMember
                                        .memberDetails?.banStatus?.value ??
                                    false;

                                return GroupMemberItem(
                                  itemKey: ValueKey<int>(index),
                                  userName: name,
                                  memberID: id,
                                  communityId:
                                      widget.payload['channelId'] as String,
                                  communityName: channelName,
                                  isModerator: isModerator && canModerate,
                                  isBanned: isBanned,
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.primaryColor.withOpacity(0.14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    flaggedMessagesText,
                    style: TextStyle(
                      color: AppColors.lightBlackTextColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 14),
                  Text(
                    tapToViewFlaggedMessagesText,
                    style: TextStyle(
                      color: AppColors.grey50,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  key: inviteMembersButtonKey,
                  child: const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Text(inviteMembers),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.inviteMembersPage,
                      arguments: widget.payload['channelId'] as String,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
