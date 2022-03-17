import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:shared_themes/spaces.dart';

import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/domain/core/entities/profile/client_response.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/search/widgets/search_details_information_widget.dart';

class StaffSearchWidget extends StatefulWidget {
  const StaffSearchWidget({
    required this.staffNumber,
    required this.clientResponse,
  });

  final String staffNumber;
  final ClientResponse clientResponse;

  @override
  State<StaffSearchWidget> createState() => _StaffSearchWidgetState();
}

class _StaffSearchWidgetState extends State<StaffSearchWidget> {
  bool hasClientManagementRole = false;
  bool hasContentManagementRole = false;
  bool hasSystemAdministrationRole = false;
  bool hasCommunityManagementRole = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SearchDetailsInformationWidget(
            clientResponse: widget.clientResponse,
            idNumber: widget.staffNumber,
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
                  style: boldSize15Text(AppColors.greyTextColor),
                ),
                verySmallVerticalSizedBox,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Text(
                    tapBelowToInvite(widget.clientResponse.userName!),
                    style: normalSize14Text(AppColors.greyTextColor),
                  ),
                ),
                mediumVerticalSizedBox,
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  width: double.infinity,
                  child: MyAfyaHubPrimaryButton(
                    buttonKey: inviteStaffToMyCareHubButtonKey,
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
                    '${widget.clientResponse.userName!.split(' ').first} $hasAgreedToUse',
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
                ),
                mediumVerticalSizedBox,
                const Divider(),
                smallVerticalSizedBox,
                Text(
                  userRoles,
                  style: boldSize18Text(AppColors.greyTextColor),
                ),
                CheckboxListTile(
                  key: clientManagementKey,
                  title: Text(
                    clientManagement,
                    style: normalSize14Text(AppColors.greyTextColor),
                  ),
                  value: hasClientManagementRole,
                  onChanged: (bool? value) {
                    setState(() {
                      hasClientManagementRole = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  key: contentManagementKey,
                  title: Text(
                    contentManagement,
                    style: normalSize14Text(AppColors.greyTextColor),
                  ),
                  value: hasContentManagementRole,
                  onChanged: (bool? value) {
                    setState(() {
                      hasClientManagementRole = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  key: systemAdminstrationKey,
                  title: Text(
                    systemAdminstration,
                    style: normalSize14Text(AppColors.greyTextColor),
                  ),
                  value: hasSystemAdministrationRole,
                  onChanged: (bool? value) {
                    setState(() {
                      hasClientManagementRole = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  key: communityManagementKey,
                  title: Text(
                    communityManagement,
                    style: normalSize14Text(AppColors.greyTextColor),
                  ),
                  value: hasCommunityManagementRole,
                  onChanged: (bool? value) {
                    setState(() {
                      hasClientManagementRole = value!;
                    });
                  },
                ),
                mediumVerticalSizedBox,
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  width: double.infinity,
                  child: MyAfyaHubPrimaryButton(
                    buttonKey: updateRolesButtonKey,
                    text: updateRoles,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text(comingSoonText)),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
