import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:myharehubpro/application/core/theme/app_themes.dart';
import 'package:myharehubpro/application/redux/actions/communities/fetch_group_members_action.dart';
import 'package:myharehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:myharehubpro/application/redux/states/app_state.dart';
import 'package:myharehubpro/application/redux/view_models/groups/groups_view_model.dart';
import 'package:myharehubpro/domain/core/entities/community_members/group_member.dart';
import 'package:myharehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:myharehubpro/domain/core/value_objects/app_strings.dart';
import 'package:myharehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:myharehubpro/presentation/community/group_info/widgets/group_member_item.dart';
import 'package:myharehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:myharehubpro/presentation/router/routes.dart';
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
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback(
      (Duration timeStamp) async {
        await StoreProvider.dispatch<AppState>(
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
                  content:
                      Text(getErrorMessage(groupMembersText.toLowerCase())),
                  duration: const Duration(seconds: kShortSnackBarDuration),
                ),
              );
              Sentry.captureException(
                UserException(error),
              );
            },
          ),
        );
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: groupInfoText,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(24, 0, 10, 10),
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SvgPicture.asset(
                    groupInfoImage,
                    height: 200.0,
                    width: 200.0,
                  ),
                  Text(
                    groupTitle,
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
                      final List<GroupMember?>? groupMembers = vm.groupMembers;
                      return vm.wait.isWaitingFor(fetchGroupMembersFlag)
                          ? const Padding(
                              padding: EdgeInsets.only(
                                top: 50,
                              ),
                              child: PlatformLoader(),
                            )
                          : groupMembers == null || groupMembers.isEmpty
                              ? const SizedBox()
                              : Column(
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
                                      itemCount: groupMembers.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final GroupMember currentMember =
                                            groupMembers.elementAt(index)!;

                                        final String name =
                                            currentMember.memberDetails?.name ??
                                                '';
                                        final String id =
                                            currentMember.memberDetails?.id ??
                                                '';
                                        return GroupMemberItem(
                                          userName: name,
                                          memberID: id,
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.fromLTRB(12, 0, 12, 20),
              width: double.infinity,
              height: 48,
              child: MyAfyaHubPrimaryButton(
                text: inviteMembers,
                buttonKey: inviteMembersButtonKey,
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.inviteMembersPage,
                    arguments: widget.payload['channelId'] as String,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}