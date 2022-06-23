import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/search_users/invite_staff_action.dart';
import 'package:prohealth360_daktari/domain/core/entities/search_user/search_user_response.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';

/// Contains a set of actions to perform for an active staff member
class ActiveStaffActions extends StatelessWidget {
  const ActiveStaffActions({
    Key? key,
    required this.names,
    required this.isSendLoading,
    required this.isResendLoading,
    required this.searchUserResponse,
  }) : super(key: key);

  /// Used to indicate a resend
  final bool isResendLoading;

  /// Used to indicate a send
  final bool isSendLoading;

  // The names of the staff member
  final String? names;

  // The response payload from the search
  final SearchUserResponse searchUserResponse;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(actions, style: boldSize18Text(AppColors.greyTextColor)),
        smallVerticalSizedBox,
        Text(
          '1. $myCareHubReInviteText',
          style: boldSize15Text(AppColors.greyTextColor),
        ),
        verySmallVerticalSizedBox,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Text(
            tapBelowToInvite(names ?? ''),
            style: normalSize14Text(AppColors.greyTextColor),
          ),
        ),
        smallVerticalSizedBox,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          width: double.infinity,
          child: isSendLoading
              ? const PlatformLoader()
              : MyAfyaHubPrimaryButton(
                  buttonKey: inviteStaffButtonKey,
                  customChild: Text(
                    inviteToMyCareHubString,
                    style: veryBoldSize15Text(AppColors.whiteColor),
                  ),
                  onPressed: () => staffSearchAction(
                    context: context,
                    searchUserResponse: searchUserResponse,
                  ),
                ),
        ),
        mediumVerticalSizedBox,
        Text(
          '2. $myCareHubAlternateInvite',
          style: boldSize15Text(AppColors.greyTextColor),
        ),
        verySmallVerticalSizedBox,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Text(
            tapToResendInvite(names ?? ''),
            style: normalSize14Text(AppColors.greyTextColor),
          ),
        ),
        smallVerticalSizedBox,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          width: double.infinity,
          child: MyAfyaHubPrimaryButton(
            buttonKey: reinviteStaffButtonKey,
            customChild: isResendLoading
                ? const PlatformLoader()
                : Text(
                    myCareHubAlternateInvite,
                    style: veryBoldSize15Text(AppColors.whiteColor),
                  ),
            onPressed: () => staffSearchAction(
              context: context,
              searchUserResponse: searchUserResponse,
              reinvite: true,
            ),
          ),
        ),
        mediumVerticalSizedBox,
      ],
    );
  }
}

/// Performs an invite to a staff member or reinvite based on the value of
/// [reinvite]
///
/// It sends an invite if [reinvite] is true and a reinvite if false
void staffSearchAction({
  required BuildContext context,
  required SearchUserResponse searchUserResponse,
  final bool reinvite = false,
}) {
  StoreProvider.dispatch(
    context,
    InviteStaffAction(
      clientResponse: searchUserResponse,
      client: AppWrapperBase.of(context)!.graphQLClient,
      reinvite: reinvite,
      onSuccess: (String name) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$inviteSent ${searchUserResponse.user?.userName}'),
          ),
        );
        Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoutes.homePage,
          (Route<dynamic> route) => false,
        );
      },
      onFailure: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text(unableToSendInvite)),
        );
        Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoutes.homePage,
          (Route<dynamic> route) => false,
        );
      },
    ),
  );
}
