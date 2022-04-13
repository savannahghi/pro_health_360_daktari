import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/services/utils.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/actions/search_users/assign_roles_action.dart';
import 'package:mycarehubpro/application/redux/actions/search_users/invite_staff_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/view_models/search/search_view_model.dart';
import 'package:mycarehubpro/domain/core/entities/search_user/roles_list.dart';
import 'package:mycarehubpro/domain/core/entities/search_user/search_user_response.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/router/routes.dart';
import 'package:mycarehubpro/presentation/search/widgets/search_details_information_widget.dart';
import 'package:shared_themes/spaces.dart';
import 'package:mycarehubpro/domain/core/entities/search_user/role.dart';

class StaffSearchWidget extends StatefulWidget {
  const StaffSearchWidget({required this.rolesList});

  final RolesList rolesList;

  @override
  State<StaffSearchWidget> createState() => _StaffSearchWidgetState();
}

Map<String, bool> roleFields = <String, bool>{};

void createRoleFields(RolesList rolesList) {
  final List<String> rolesFromState = <String>[];
  for (final Role role in rolesList.roles!) {
    rolesFromState.add(roleToString(role.name!));
  }

  for (final RoleValue role in RoleValue.values) {
    final String key = capitalizeFirst(role.name);
    if (rolesFromState.contains(key)) {
      roleFields[key] = true;
    } else {
      roleFields[key] = false;
    }
  }
}

class _StaffSearchWidgetState extends State<StaffSearchWidget> {
  @override
  void initState() {
    super.initState();
    createRoleFields(widget.rolesList);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StoreConnector<AppState, SearchViewModel>(
        converter: (Store<AppState> store) => SearchViewModel.fromStore(store),
        builder: (BuildContext context, SearchViewModel vm) {
          final SearchUserResponse selectedSearchUserResponse =
              vm.selectedSearchUserResponse!;

          return (vm.wait.isWaitingFor(searchStaffMemberFlag))
              ? Container(
                  height: 300,
                  padding: const EdgeInsets.all(20),
                  child: const PlatformLoader(),
                )
              : Column(
                  children: <Widget>[
                    SearchDetailsInformationWidget(
                      searchUserResponse: selectedSearchUserResponse,
                      isClient: false,
                    ),
                    const Divider(),
                    mediumVerticalSizedBox,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            actions,
                            style: boldSize18Text(AppColors.greyTextColor),
                          ),
                          smallVerticalSizedBox,
                          Text(
                            '1. $myCareHubInviteText',
                            style: boldSize16Text(AppColors.greyTextColor),
                          ),
                          smallVerticalSizedBox,
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 14.0),
                            child: Text(
                              tapBelowToInvite(
                                selectedSearchUserResponse.user!.userName!,
                              ),
                              style: normalSize15Text(AppColors.greyTextColor),
                            ),
                          ),
                          mediumVerticalSizedBox,
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 14.0),
                            width: double.infinity,
                            child: MyAfyaHubPrimaryButton(
                              buttonKey: inviteStaffToMyCareHubButtonKey,
                              customChild:
                                  (vm.wait.isWaitingFor(inviteStaffFlag))
                                      ? const PlatformLoader()
                                      : Text(
                                          inviteToMyCareHubString,
                                          style: veryBoldSize15Text(
                                            AppColors.whiteColor,
                                          ),
                                        ),
                              onPressed: () {
                                StoreProvider.dispatch(
                                  context,
                                  InviteStaffAction(
                                    clientResponse: selectedSearchUserResponse,
                                    client: AppWrapperBase.of(context)!
                                        .graphQLClient,
                                    onSuccess: (String name) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            '$inviteSent ${selectedSearchUserResponse.user?.userName}',
                                          ),
                                        ),
                                      );
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil(
                                        AppRoutes.homePage,
                                        (Route<dynamic> route) => false,
                                      );
                                    },
                                    onFailure: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(unableToSendInvite),
                                        ),
                                      );
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil(
                                        AppRoutes.homePage,
                                        (Route<dynamic> route) => false,
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                          mediumVerticalSizedBox,
                          const Divider(),
                          smallVerticalSizedBox,
                          Text(
                            userRoles,
                            style: boldSize18Text(AppColors.greyTextColor),
                          ),
                          Wrap(
                            children: roleFields.entries
                                .map<Widget>((MapEntry<String, bool> entry) {
                              return CheckboxListTile(
                                key: Key(entry.key),
                                activeColor: AppColors.primaryColor,
                                selectedTileColor: AppColors.primaryColor,
                                title: Text(
                                  entry.key,
                                  style:
                                      normalSize15Text(AppColors.greyTextColor),
                                ),
                                value: entry.value,
                                onChanged: (bool? value) {
                                  setState(() {
                                    roleFields[entry.key] = value ?? false;
                                  });
                                },
                              );
                            }).toList(),
                          ),
                          mediumVerticalSizedBox,
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 14.0),
                            width: double.infinity,
                            child: MyAfyaHubPrimaryButton(
                              buttonKey: updateRolesButtonKey,
                              customChild:
                                  (vm.wait.isWaitingFor(assignRolesFlag))
                                      ? const PlatformLoader()
                                      : Text(
                                          updateRoles,
                                          style: veryBoldSize15Text(
                                            AppColors.whiteColor,
                                          ),
                                        ),
                              onPressed: () {
                                StoreProvider.dispatch(
                                  context,
                                  AssignRolesAction(
                                    client: AppWrapperBase.of(context)!
                                        .graphQLClient,
                                    searchUserResponse:
                                        selectedSearchUserResponse,
                                    roles: roleFields,
                                    onFailure: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(genericErrorOccurred),
                                        ),
                                      );
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil(
                                        AppRoutes.homePage,
                                        (Route<dynamic> route) => false,
                                      );
                                    },
                                    onSuccess: (String name) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            '$rolesAssigned ${selectedSearchUserResponse.user!.userName}',
                                          ),
                                        ),
                                      );
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil(
                                        AppRoutes.homePage,
                                        (Route<dynamic> route) => false,
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
