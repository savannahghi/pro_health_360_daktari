import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/application/redux/actions/flags/app_flags.dart';
import 'package:healthcloud/application/redux/actions/invite_members/fetch_members_action.dart';
import 'package:healthcloud/application/redux/actions/invite_members/invite_members_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/application/redux/view_models/invite_members/invite_members_view_model.dart';
import 'package:healthcloud/domain/core/entities/community_members/member.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/core/app_bar/custom_app_bar.dart';
import 'package:healthcloud/presentation/core/widgets/generic_no_data_widget.dart';
import 'package:healthcloud/presentation/core/widgets/platform_loader.dart';
import 'package:healthcloud/presentation/create_group/invite_members/widgets/member_list_item.dart';
import 'package:shared_themes/spaces.dart';

class InviteMembersPage extends StatefulWidget {
  const InviteMembersPage({
    Key? key,
    required this.channelId,
  }) : super(key: key);
  final String channelId;

  @override
  State<InviteMembersPage> createState() => _InviteMembersPageState();
}

class _InviteMembersPageState extends State<InviteMembersPage> {
  final TextEditingController searchController = TextEditingController();
  List<String> inviteMemberIds = <String>[];
  bool isSearching = false;
  String memberSearchName = '';

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

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      StoreProvider.dispatch(
        context,
        FetchMembersAction(
          client: AppWrapperBase.of(context)!.graphQLClient,
          isSearching: isSearching,
          memberSearchName: memberSearchName,
          onFailure: (String message) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: const Text(
                    connectionLostText,
                  ),
                  duration: const Duration(seconds: 5),
                  action: dismissSnackBar(
                    closeString,
                    Colors.white,
                    context,
                  ),
                ),
              );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: inviteMembersTitle,
        showShadow: false,
      ),
      body: StoreConnector<AppState, InviteMembersViewModel>(
        converter: (Store<AppState> store) =>
            InviteMembersViewModel.fromStore(store),
        builder: (BuildContext context, InviteMembersViewModel vm) {
          if (vm.wait.isWaitingFor(fetchMembersFlag)) {
            return Container(
              height: 300,
              padding: const EdgeInsets.all(20),
              child: const PlatformLoader(),
            );
          } else {
            final List<Member> communityMembers = vm.membersList;

            if (communityMembers.isNotEmpty) {
              return Column(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Stack(
                        children: <Widget>[
                          SingleChildScrollView(
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
                                              ScaffoldMessenger.of(context)
                                                ..hideCurrentSnackBar()
                                                ..showSnackBar(
                                                  SnackBar(
                                                    content: const Text(
                                                      connectionLostText,
                                                    ),
                                                    duration: const Duration(
                                                      seconds: 5,
                                                    ),
                                                    action: dismissSnackBar(
                                                      closeString,
                                                      Colors.white,
                                                      context,
                                                    ),
                                                  ),
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
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: communityMembers.length,
                                  itemBuilder: (_, int index) {
                                    final String memberName =
                                        communityMembers[index].name ?? UNKNOWN;
                                    final String memberUserId =
                                        communityMembers[index]
                                                .userID
                                                ?.trim() ??
                                            '';
                                    return GestureDetector(
                                      child: MemberListItem(
                                        username: memberName.trim().isEmpty
                                            ? UNKNOWN
                                            : memberName,
                                        onClicked: (bool value) {
                                          if (value) {
                                            if (memberUserId.isNotEmpty) {
                                              inviteMemberIds.add(memberUserId);
                                            }
                                          } else if (value == false) {
                                            inviteMemberIds.removeWhere(
                                              (String element) =>
                                                  memberUserId == element,
                                            );
                                          }
                                        },
                                        // isChecked: true,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 20,
                        right: 10,
                        left: 10,
                      ),
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
                                  onFailure: (String message) {
                                    ScaffoldMessenger.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(
                                        SnackBar(
                                          content: const Text(
                                            connectionLostText,
                                          ),
                                          duration: const Duration(seconds: 5),
                                          action: dismissSnackBar(
                                            closeString,
                                            Colors.white,
                                            context,
                                          ),
                                        ),
                                      );
                                  },
                                  onSuccess: () {
                                    ScaffoldMessenger.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(
                                        SnackBar(
                                          content: const Text(
                                            inviteMembersSuccessfulText,
                                          ),
                                          duration: const Duration(seconds: 5),
                                          action: dismissSnackBar(
                                            closeString,
                                            Colors.white,
                                            context,
                                          ),
                                        ),
                                      );
                                  },
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.secondaryColor,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(inviteMembersTitle),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return GenericNoDataWidget(
                key: helpNoDataWidgetKey,
                actionText: isSearching ? actionTextGenericNoData : retryString,
                recoverCallback: () async {
                  StoreProvider.dispatch<AppState>(
                    context,
                    FetchMembersAction(
                      client: AppWrapperBase.of(context)!.graphQLClient,
                      isSearching: false,
                      memberSearchName: memberSearchName,
                      onFailure: (String message) {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              content: const Text(
                                connectionLostText,
                              ),
                              duration: const Duration(seconds: 5),
                              action: dismissSnackBar(
                                closeString,
                                Colors.white,
                                context,
                              ),
                            ),
                          );
                      },
                    ),
                  );
                },
                messageTitle: isSearching
                    ? noRecordFoundText
                    : getNoDataTile(availableMembersText),
                messageBody: isSearching ? '' : noAvailableMemberDescription,
              );
            }
          }
        },
      ),
    );
  }
}
