import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/domain/core/entities/profile/client_response.dart';
import 'package:shared_themes/spaces.dart';

class ClientDetailsInformationWidget extends StatelessWidget {
  const ClientDetailsInformationWidget({
    required this.clientResponse,
    required this.cccNumber,
  });

  final ClientResponse? clientResponse;
  final String? cccNumber;

  @override
  Widget build(BuildContext context) {
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
              clientResponse!.userName!.trim()[0].toUpperCase(),
              style: boldSize30Text(AppColors.primaryColor),
            ),
          ),
        ),
        mediumVerticalSizedBox,
        Text(
          clientResponse!.userName!,
          style: veryBoldSize20Text(AppColors.blackColor),
        ),
        smallVerticalSizedBox,
        Text(
          'CCC# $cccNumber!',
          style: normalSize15Text(AppColors.greyTextColor),
        ),
        size15VerticalSizedBox,
        Text(
          clientResponse!.primaryContact!.value!,
          style: normalSize15Text(AppColors.greyTextColor),
        ),
      ],
    );
  }
}
