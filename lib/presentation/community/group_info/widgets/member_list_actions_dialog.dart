import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:myharehubpro/application/core/theme/app_themes.dart';
import 'package:myharehubpro/domain/core/value_objects/app_strings.dart';
import 'package:myharehubpro/domain/core/value_objects/app_widget_keys.dart';

import 'package:shared_themes/spaces.dart';

class MemberListActionsDialog extends StatelessWidget {
  const MemberListActionsDialog({required this.memberID});
  final String memberID;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 1,
      backgroundColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              actionsText,
              style: boldSize20Text(AppColors.blackColor),
            ),
            mediumVerticalSizedBox,
            SizedBox(
              width: double.infinity,
              child: MyAfyaHubPrimaryButton(
                onPressed: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(snackbar(content: comingSoonText));
                },
                buttonKey: promoteButtonKey,
                text: promoteToAdminText,
                buttonColor: Theme.of(context).primaryColor.withOpacity(0.2),
                textColor: AppColors.blackColor,
                borderColor: AppColors.primaryColor.withOpacity(0.3),
                textStyle: normalSize14Text(),
              ),
            ),
            smallVerticalSizedBox,
            SizedBox(
              width: double.infinity,
              child: MyAfyaHubPrimaryButton(
                onPressed: () {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackbar(content: comingSoonText));
                },
                text: removeFromGroupText,
                buttonColor: AppColors.lightRedColor.withOpacity(0.6),
                textColor: AppColors.blackColor,
                borderColor: AppColors.lightRedColor.withOpacity(0.9),
                textStyle: normalSize14Text(),
                buttonKey: removeButtonKey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
