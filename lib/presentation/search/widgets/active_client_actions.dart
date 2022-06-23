import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/entities/search_user/search_user_response.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/search/widgets/client_search_widget.dart';

/// Contains a set of actions to perform for an active client
class ActiveClientActions extends StatelessWidget {
  const ActiveClientActions({
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

  // The names of the client
  final String? names;

  // The response payload from the search
  final SearchUserResponse searchUserResponse;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          actions,
          style: boldSize18Text(AppColors.greyTextColor),
        ),
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
                  buttonKey: sendClientInviteButtonKey,
                  customChild: Text(
                    inviteToMyCareHubString,
                    style: veryBoldSize15Text(
                      AppColors.whiteColor,
                    ),
                  ),
                  onPressed: () => clientSearchAction(
                    context: context,
                    selectedSearchUserResponse: searchUserResponse,
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
          child: isResendLoading
              ? const PlatformLoader()
              : MyAfyaHubPrimaryButton(
                  buttonKey: resendClientInviteButtonKey,
                  customChild: Text(
                    myCareHubAlternateInvite,
                    style: veryBoldSize15Text(
                      AppColors.whiteColor,
                    ),
                  ),
                  onPressed: () => clientSearchAction(
                    context: context,
                    selectedSearchUserResponse: searchUserResponse,
                    reinvite: true,
                  ),
                ),
        ),
        mediumVerticalSizedBox,
      ],
    );
  }
}
