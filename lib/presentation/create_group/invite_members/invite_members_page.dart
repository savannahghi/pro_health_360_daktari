import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/services/helpers.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/invite_members/fetch_members_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/invite_members/invite_members_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/invite_members/invite_members_view_model.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/create_group/invite_members/widgets/member_list_item.dart';

class InviteMembersPage extends StatefulWidget {
  const InviteMembersPage({required this.channelId});

  final String channelId;

  @override
  State<InviteMembersPage> createState() => _InviteMembersPageState();
}

class _InviteMembersPageState extends State<InviteMembersPage> {
  List<String> inviteMemberIds = <String>[];
  bool isSearching = false;
  String memberSearchName = '';
  final TextEditingController searchController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    StoreProvider.dispatch(
      context,
      FetchMembersAction(
        client: AppWrapperBase.of(context)!.graphQLClient,
        isSearching: isSearching,
        memberSearchName: memberSearchName,
        onFailure: (String message) {
          showTextSnackbar(
            ScaffoldMessenger.of(context),
            content: message,
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    searchController.addListener(() async {
      if (searchController.text.isEmpty) {
        setState(() {
          isSearching = false;
          memberSearchName = '';
        });
      } else {
        setState(() {
          isSearching = true;
          memberSearchName = searchController.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: inviteMembersTitle,
        showShadow: false,
        showNotificationIcon: true,
      ),
      body: StoreConnector<AppState, InviteMembersViewModel>(
        converter: (Store<AppState> store) =>
            InviteMembersViewModel.fromStore(store),
        builder: (BuildContext context, InviteMembersViewModel vm) {
          if (vm.wait.isWaitingFor(fetchMembersFlag) ||
              vm.wait.isWaitingFor(inviteMembersFlag)) {
            return Container(
              height: 300,
              padding: const EdgeInsets.all(20),
              child: const PlatformLoader(),
            );
          }

          final List<Member> communityMembers = vm.membersList;

          if (communityMembers.isEmpty && !isSearching) {
            return GenericErrorWidget(
              actionKey: helpNoDataWidgetKey,
              recoverCallback: () {
                StoreProvider.dispatch<AppState>(
                  context,
                  FetchMembersAction(
                    client: AppWrapperBase.of(context)!.graphQLClient,
                    memberSearchName: memberSearchName,
                    onFailure: (String message) {
                      showTextSnackbar(
                        ScaffoldMessenger.of(context),
                        content: message,
                      );
                    },
                  ),
                );
              },
              messageTitle: getNoDataTile(availableMembersText),
              messageBody: <TextSpan>[
                TextSpan(
                  text: noAvailableMemberDescription,
                  style: normalSize16Text(
                    AppColors.greyTextColor,
                  ),
                ),
              ],
            );
          }

          return Column(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        const Text(
                          inviteMembersDescription,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.greyTextColor,
                          ),
                        ),
                        mediumVerticalSizedBox,
                        CustomTextField(
                          controller: searchController,
                          hintText: searchMembersString,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(
                              right: 4.0,
                            ),
                            child: IconButton(
                              onPressed: () {
                                StoreProvider.dispatch(
                                  context,
                                  FetchMembersAction(
                                    client: AppWrapperBase.of(context)!
                                        .graphQLClient,
                                    isSearching: isSearching,
                                    memberSearchName: memberSearchName,
                                    onFailure: (String message) {
                                      showTextSnackbar(
                                        ScaffoldMessenger.of(context),
                                        content: message,
                                      );
                                    },
                                  ),
                                );
                              },
                              icon: const Icon(Icons.search),
                            ),
                          ),
                          borderColor: Colors.white,
                          customFillColor: AppColors.galleryColor,
                          onChanged: (String val) {},
                        ),
                        const SizedBox(height: 24),
                        if (communityMembers.isNotEmpty)
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: communityMembers.length,
                            itemBuilder: (_, int index) {
                              final String memberName =
                                  communityMembers[index].username ?? UNKNOWN;
                              final String memberUserId =
                                  communityMembers[index].id?.trim() ?? '';

                              final String userType =
                                  communityMembers[index].userType ?? UNKNOWN;

                              return MemberListItem(
                                username: memberName.trim().isEmpty
                                    ? UNKNOWN
                                    : memberName,
                                userType: userType,
                                onClicked: (bool value) {
                                  if (value) {
                                    if (memberUserId.isNotEmpty) {
                                      inviteMemberIds.add(memberUserId);
                                    }
                                  } else {
                                    inviteMemberIds.removeWhere(
                                      (String element) =>
                                          memberUserId == element,
                                    );
                                  }
                                },
                              );
                            },
                          ),
                        if (communityMembers.isEmpty && isSearching)
                          GenericErrorWidget(
                            actionKey: const Key('search_not_found_key'),
                            headerIconSvgUrl: searchNotFoundImage,
                            padding: EdgeInsets.zero,
                            recoverCallback: () {
                              StoreProvider.dispatch<AppState>(
                                context,
                                FetchMembersAction(
                                  client:
                                      AppWrapperBase.of(context)!.graphQLClient,
                                  isSearching: isSearching,
                                  memberSearchName: memberSearchName,
                                  onFailure: (String message) {
                                    showTextSnackbar(
                                      ScaffoldMessenger.of(context),
                                      content: message,
                                    );
                                  },
                                ),
                              );
                            },
                            messageTitle: noMemberFoundText,
                            messageBody: <TextSpan>[
                              TextSpan(
                                text: couldNotFindAMemberText,
                                style: normalSize16Text(
                                  AppColors.greyTextColor,
                                ),
                              ),
                              TextSpan(
                                text: memberSearchName,
                                style: boldSize18Text(
                                  AppColors.greyTextColor,
                                ),
                              ),
                              TextSpan(
                                text: confirmTheNamesAreCorrectText,
                                style: normalSize16Text(
                                  AppColors.greyTextColor,
                                ),
                              )
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              if (communityMembers.isNotEmpty &&
                  !vm.wait.isWaitingFor(inviteMembersFlag))
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 20, right: 10, left: 10),
                    child: SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        key: inviteMembersBtnKey,
                        onPressed: () {
                          if (inviteMemberIds.isNotEmpty) {
                            StoreProvider.dispatch(
                              context,
                              InviteMembersAction(
                                client:
                                    AppWrapperBase.of(context)!.graphQLClient,
                                variables: <String, dynamic>{
                                  'communityID': widget.channelId,
                                  'memberIDs': inviteMemberIds
                                },
                                onFailure: (String message) => showTextSnackbar(
                                  ScaffoldMessenger.of(context),
                                  content: message,
                                ),
                                onSuccess: () {
                                  showTextSnackbar(
                                    ScaffoldMessenger.of(context),
                                    content: inviteMembersSuccessfulText,
                                  );

                                  Navigator.of(context).pop();
                                },
                              ),
                            );
                          }
                        },
                        child: const Text(inviteMembersTitle),
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
