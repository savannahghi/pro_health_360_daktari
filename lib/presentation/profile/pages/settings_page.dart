// Flutter imports:
// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:healthcloud/application/core/services/utils.dart';
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/application/redux/actions/set_nick_name_action.dart';
import 'package:healthcloud/application/redux/actions/update_user_profile_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/application/redux/view_models/staff_state_view_model.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/core/app_bar/custom_app_bar.dart';
import 'package:healthcloud/presentation/profile/widgets/edit_info_button_widget.dart';
import 'package:healthcloud/presentation/profile/widgets/edit_information_item.dart';
import 'package:healthcloud/presentation/profile/widgets/personal_information_widget.dart';
// Project imports:
import 'package:shared_themes/spaces.dart';

/// [SettingsPage] is used to display the client's settings
///
/// the nickname will be accessed from the state
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: const CustomAppBar(title: settingsPageTitle),
      body: SafeArea(
        child: StoreConnector<AppState, StaffStateViewModel>(
          converter: (Store<AppState> store) =>
              StaffStateViewModel.fromStore(store),
          builder: (BuildContext context, StaffStateViewModel vm) {
            final String initialNickName =
                vm.staffState?.user?.username ?? UNKNOWN;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        largeVerticalSizedBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              nickNameString,
                              style: boldSize15Text(
                                AppColors.secondaryColor,
                              ),
                            ),
                            EditInformationButtonWidget(
                              editInformationItem: nickNameEditInfo(
                                initialNickName,
                              ),
                              submitFunction: (
                                EditInformationItem editInformationItem,
                              ) async {
                                ///Set username/NickName to the new nickname
                                StoreProvider.dispatch<AppState>(
                                  context,
                                  UpdateUserProfileAction(
                                    nickName: editInformationItem
                                        .editInformationInputItem[0]
                                        .inputController
                                        .text,
                                  ),
                                );

                                await StoreProvider.dispatch<AppState>(
                                  context,
                                  SetNicknameAction(
                                    client: AppWrapperBase.of(context)!
                                        .graphQLClient,
                                    onSuccess: () {
                                      ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(
                                          const SnackBar(
                                            content:
                                                Text(nicknameSuccessString),
                                            duration: Duration(seconds: 2),
                                          ),
                                        );
                                    },
                                    onError: () {
                                      StoreProvider.dispatch<AppState>(
                                        context,
                                        UpdateUserProfileAction(
                                          nickName: initialNickName,
                                        ),
                                      );
                                    },
                                    shouldNavigate: false,
                                  ),
                                );

                                ///Will return to the previous page after submitting
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                        smallVerticalSizedBox,
                        PersonalInformationWidget(
                          description: initialNickName,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
