import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/domain/core/entities/profile/client_response.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/search/widgets/client_details_information_widget.dart';
import 'package:shared_themes/spaces.dart';

class ClientSearchWidget extends StatelessWidget {
  const ClientSearchWidget({
    required this.clientResponse,
    required this.cccNumber,
  });

  final ClientResponse clientResponse;
  final String cccNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ClientDetailsInformationWidget(
          clientResponse: clientResponse,
          cccNumber: cccNumber,
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
                style: boldSize15Text(AppColors.greyTextColor),
              ),
              verySmallVerticalSizedBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Text(
                  tapBelowToInvite,
                  style: normalSize14Text(AppColors.greyTextColor),
                ),
              ),
              mediumVerticalSizedBox,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                width: double.infinity,
                child: MyAfyaHubPrimaryButton(
                  text: inviteToMyCareHubString,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text(comingSoonText)),
                    );
                  },
                ),
              ),
              mediumVerticalSizedBox,
              Text(
                '2. $consent ',
                style: boldSize15Text(AppColors.greyTextColor),
              ),
              verySmallVerticalSizedBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Text(
                  '${clientResponse.userName!.split(' ').first} $hasAgreedToUse',
                  style: normalSize14Text(AppColors.greyTextColor),
                ),
              ),
              smallVerticalSizedBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SvgPicture.asset(doneIconSvgPath),
                    verySmallHorizontalSizedBox,
                    Text(
                      consentRecorded,
                      style: normalSize12Text(AppColors.malachiteColor),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
