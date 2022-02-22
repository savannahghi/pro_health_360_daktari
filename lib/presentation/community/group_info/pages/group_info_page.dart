import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthcloud/application/core/services/utils.dart';
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/core/app_bar/custom_app_bar.dart';
import 'package:shared_themes/spaces.dart';

class GroupInfoPage extends StatelessWidget {
  const GroupInfoPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: groupInfoText,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(24, 0, 10, 10),
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SvgPicture.asset(
                    groupInfoImage,
                    height: 200.0,
                    width: 200.0,
                  ),
                  Text(
                    groupTitle,
                    style: boldSize20Text(AppColors.lightBlackTextColor),
                  ),
                  verySmallVerticalSizedBox,
                  Text(
                    getGroupMembersNumber(230),
                    style: const TextStyle(
                      color: AppColors.greyTextColor,
                      fontSize: 16,
                    ),
                  ),
                  largeVerticalSizedBox,
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      groupMembersText,
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  largeVerticalSizedBox,
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: membersList.length,
                    itemBuilder: (_, int index) {
                      return membersList[index];
                    },
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.fromLTRB(12, 0, 12, 20),
              width: double.infinity,
              height: 48,
              child: MyAfyaHubPrimaryButton(
                text: inviteMembers,
                buttonKey: inviteMembersButtonKey,
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('$inviteMembers $comingSoonText'),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
