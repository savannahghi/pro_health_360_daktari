import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/domain/core/entities/search_user/search_user_response.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/search/widgets/client_search_widget.dart';
import 'package:shared_themes/spaces.dart';

class InActiveUserActions extends StatelessWidget {
  const InActiveUserActions({
    Key? key,
    required this.names,
    required this.isLoading,
    required this.searchUserResponse,
  }) : super(key: key);

  final bool isLoading;
  final String? names;
  final SearchUserResponse searchUserResponse;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          deactivatedUserString,
          style: boldSize18Text(AppColors.greyTextColor),
        ),
        smallVerticalSizedBox,
        Text(
          '$names $deactivatedUserPageDescriptionString',
          style: normalSize14Text(AppColors.greyTextColor),
        ),
        mediumVerticalSizedBox,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          width: double.infinity,
          child: isLoading
              ? const PlatformLoader()
              : MyAfyaHubPrimaryButton(
                  customChild: Text(
                    reactivateUserString,
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
      ],
    );
  }
}
