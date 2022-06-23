import 'dart:async';
import 'dart:ui';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/services/helpers.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/communities/check_user_is_moderator_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/communities/fetch_group_members_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/communities/flagged_messages/pages/flagged_messages_page.dart';
import 'package:prohealth360_daktari/presentation/communities/group_info/pages/edit_group_info_page.dart';
import 'package:prohealth360_daktari/presentation/communities/group_info/pages/group_member_connector.dart';
import 'package:prohealth360_daktari/presentation/communities/view_models/groups_view_model.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/core/widgets/edit_widget.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';

import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class GroupInfoPage extends StatefulWidget {
  const GroupInfoPage({required this.channelName});

  final String channelName;

  @override
  State<GroupInfoPage> createState() => _GroupInfoPageState();
}

class _GroupInfoPageState extends State<GroupInfoPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final Channel channel = StreamChannel.of(context).channel;

    StoreProvider.dispatch<AppState>(
      context,
      CheckUserIsModeratorAction(channel: channel),
    );

    StoreProvider.dispatch<AppState>(
      context,
      FetchGroupMembersAction(
        client: AppWrapperBase.of(context)!.graphQLClient,
        channelId: channel.id!,
        onError: (String? error) {
          showTextSnackbar(
            ScaffoldMessenger.of(context),
            content: getErrorMessage(groupMembersText.toLowerCase()),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Channel channel = StreamChannel.of(context).channel;

    final String channelName = widget.channelName;

    return Scaffold(
      appBar: CustomAppBar(
        title: groupInfoText,
        trailingWidget: StoreConnector<AppState, GroupsViewModel>(
          converter: (Store<AppState> store) {
            return GroupsViewModel.fromStore(store);
          },
          builder: (BuildContext context, GroupsViewModel vm) {
            if (vm.isModerator ?? false) {
              return EditWidget(
                onTap: () {
                  _navigateToPage(context, channel, const EditGroupInfoPage());
                },
                icon: SvgPicture.asset(
                  pencilIconUrl,
                  color: Colors.black,
                  width: 25,
                  height: 20,
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
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
                      getGroupMembersNumber(channel.memberCount!),
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

                        final List<GroupMember?> groupMembers =
                            vm.groupMembers ?? <GroupMember>[];

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
                            if (vm.isModerator ?? false) ...<Widget>[
                              const SizedBox(height: 12),
                              const Text(
                                moderationHelpText,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.unSelectedReactionIconColor,
                                ),
                              ),
                            ],
                            largeVerticalSizedBox,
                            ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: groupMembers.length,
                              itemBuilder: (BuildContext context, int index) {
                                final GroupMember currentMember =
                                    groupMembers.elementAt(index)!;

                                final String userName =
                                    currentMember.memberDetails?.username ?? '';
                                final String id =
                                    currentMember.memberDetails?.id ?? '';

                                final bool isModerator =
                                    currentMember.isModerator;

                                final bool isBanned = currentMember
                                        .memberDetails?.extraData?.isBanned ??
                                    false;

                                final String userType =
                                    currentMember.userType?.name ??
                                        UserType.STAFF.name;

                                return GroupMemberConnector(
                                  itemKey: ValueKey<int>(index),
                                  userName: userName,
                                  memberID: id,
                                  communityId: channel.id!,
                                  communityName: channelName,
                                  userType: userType,
                                  isModerator: isModerator,
                                  canModerate: vm.isModerator ?? false,
                                  isBanned: isBanned,
                                  onError: (String errorMessage) {
                                    showTextSnackbar(
                                      ScaffoldMessenger.of(context),
                                      content: errorMessage,
                                    );
                                  },
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
            InkWell(
              onTap: () {
                _navigateToPage(context, channel, const FlaggedMessagesPage());
              },
              child: Container(
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
                      arguments: channel.id,
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

  Future<dynamic> _navigateToPage(
    BuildContext context,
    Channel channel,
    Widget page,
  ) {
    return Navigator.of(context).push(
      MaterialPageRoute<dynamic>(
        builder: (_) {
          return StreamChannel(
            channel: channel,
            child: page,
          );
        },
      ),
    );
  }
}
