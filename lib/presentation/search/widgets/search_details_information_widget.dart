import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/domain/core/entities/search_user/search_user_response.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:shared_themes/spaces.dart';

class SearchDetailsInformationWidget extends StatelessWidget {
  const SearchDetailsInformationWidget({
    required this.searchUserResponse,
    required this.isClient,
  });

  final bool isClient;
  final SearchUserResponse? searchUserResponse;

  @override
  Widget build(BuildContext context) {
    final String username = searchUserResponse?.user?.userName ?? UNKNOWN;
    final String phoneNumber =
        searchUserResponse?.user?.primaryContact?.value ?? noNumberAvailable;
    final String number = isClient
        ? 'CCC# ${searchUserResponse?.clientCCCNumber}'
        : 'Staff Number ${searchUserResponse?.staffNumber}';

    return Column(
      children: <Widget>[
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryColor.withOpacity(0.4),
          ),
          child: Center(
            child: Text(
              username.trim()[0].toUpperCase(),
              style: boldSize30Text(AppColors.primaryColor),
            ),
          ),
        ),
        mediumVerticalSizedBox,
        Text(
          username,
          style: veryBoldSize20Text(AppColors.blackColor),
        ),
        smallVerticalSizedBox,
        Text(
          number,
          style: normalSize15Text(AppColors.greyTextColor),
        ),
        size15VerticalSizedBox,
        Text(
          phoneNumber,
          style: normalSize15Text(AppColors.greyTextColor),
        ),
      ],
    );
  }
}
