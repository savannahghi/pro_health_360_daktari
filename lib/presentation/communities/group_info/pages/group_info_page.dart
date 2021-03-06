import 'dart:async';
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/services/helpers.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/communities/check_user_is_moderator_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/communities/fetch_group_members_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/community/entities/age_range.dart';
import 'package:prohealth360_daktari/domain/core/entities/community_members/community.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
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
                    StoreConnector<AppState, GroupsViewModel>(
                      converter: (Store<AppState> store) =>
                          GroupsViewModel.fromStore(store),
                      builder: (BuildContext context, GroupsViewModel vm) {
                        final Community? community = vm.communities?.first;

                        if (community == null) return const SizedBox();

                        final bool hasClientTypes =
                            community.clientType?.isNotEmpty ?? false;
                        final bool hasAgeRange = community.ageRange != null;
                        final bool hasGenders =
                            community.gender?.isNotEmpty ?? false;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Text(
                                getGroupMembersNumber(
                                  vm.groupMembers?.length ?? 0,
                                ),
                                style: boldSize16Text(AppColors.greyTextColor),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                groupInformationText,
                                style: boldSize20Text(AppColors.blackColor),
                              ),
                            ),
                            const SizedBox(height: 20),
                            if (hasClientTypes) ...<Widget>[
                              Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  clientTypesText,
                                  style: normalSize17Text(
                                    AppColors.greyTextColor,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              _getClientTypesRow(community.clientType!),
                            ],
                            if (hasAgeRange) ...<Widget>[
                              const SizedBox(height: 20),
                              Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  ageGroupsText,
                                  style: normalSize17Text(
                                    AppColors.greyTextColor,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              _getAgeRangeRow(community.ageRange!),
                              const SizedBox(height: 20),
                            ],
                            if (hasGenders) ...<Widget>[
                              Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  genderText,
                                  style:
                                      normalSize17Text(AppColors.greyTextColor),
                                ),
                              ),
                              const SizedBox(height: 8),
                              _genderRow(community.gender!),
                            ]
                          ],
                        );
                      },
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
                            if (vm.isModerator ?? false) ...<Widget>[
                              const SizedBox(height: 16),
                              const Divider(height: 2),
                              const SizedBox(height: 16),
                              InkWell(
                                onTap: () {
                                  _navigateToPage(
                                    context,
                                    channel,
                                    const FlaggedMessagesPage(),
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppColors.primaryColor
                                        .withOpacity(0.14),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const <Widget>[
                                      Text(
                                        flaggedMessagesString,
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
                              const Divider(height: 2),
                            ],
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
                              largeVerticalSizedBox,
                            ],
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

                                final String userType = currentMember
                                        .memberDetails
                                        ?.extraData
                                        ?.userType
                                        ?.name ??
                                    '';

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

  Widget _genderRow(List<Gender> genders) {
    final List<Widget> widgets = <Widget>[];
    for (final Gender gender in genders) {
      widgets.add(
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.4),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Text(
            capitalizeFirst(gender.name),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      );
    }

    return Wrap(
      spacing: 12,
      runSpacing: 4,
      children: widgets,
    );
  }

  Widget _getAgeRangeRow(AgeRange ageRange) {
    final int lowerBound = ageRange.lowerBound ?? 14;
    final int upperBound = ageRange.upperBound ?? 24;

    return Wrap(
      spacing: 12,
      runSpacing: 4,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.4),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Text(
            '$lowerBound - $upperBound Yrs',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _getClientTypesRow(List<ClientType> clientTypes) {
    final List<Widget> widgets = <Widget>[];
    for (final ClientType clientType in clientTypes) {
      widgets.add(
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.4),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Text(
            clientType.name,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      );
    }

    return Wrap(spacing: 12, runSpacing: 4, children: widgets);
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
