import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:shared_themes/spaces.dart';

class MemberListActionsDialog extends StatelessWidget {
  const MemberListActionsDialog({
    required this.memberID,
    required this.communityId,
    required this.communityName,
    required this.memberName,
    this.isBanned = false,
    this.isPromoting = false,
    this.isBanning = false,
    this.isRemoving = false,
    this.onPromoteTapped,
    this.onBanTapped,
    this.onRemoveTapped,
  });

  final String memberID;
  final String communityId;
  final String communityName;
  final String memberName;
  final bool isBanned;
  final bool isPromoting;
  final bool isBanning;
  final bool isRemoving;
  final VoidCallback? onPromoteTapped;
  final VoidCallback? onBanTapped;
  final VoidCallback? onRemoveTapped;

  @override
  Widget build(BuildContext context) {
    Widget promotionButton;
    Widget banButton;
    Widget removeButton;

    if (isPromoting) {
      promotionButton = const PlatformLoader();
    } else {
      promotionButton = MyAfyaHubPrimaryButton(
        onPressed: onPromoteTapped,
        buttonKey: promoteButtonKey,
        text: promoteToModeratorText,
        buttonColor: Theme.of(context).primaryColor.withOpacity(0.2),
        textColor: AppColors.blackColor,
        borderColor: AppColors.primaryColor.withOpacity(0.3),
        textStyle: normalSize14Text(),
      );
    }

    if (isBanning) {
      banButton = const PlatformLoader();
    } else {
      banButton = MyAfyaHubPrimaryButton(
        onPressed: onBanTapped,
        buttonKey: banButtonKey,
        text: isBanned ? unBanUserText : banUserText,
        buttonColor: AppColors.lightRedColor.withOpacity(0.6),
        textColor: AppColors.blackColor,
        borderColor: AppColors.lightRedColor.withOpacity(0.9),
        textStyle: boldSize14Text(AppColors.redColor),
      );
    }

    if (isRemoving) {
      removeButton = const PlatformLoader();
    } else {
      removeButton = MyAfyaHubPrimaryButton(
        buttonColor: AppColors.lightRedColor.withOpacity(0.6),
        borderColor: AppColors.lightRedColor.withOpacity(0.9),
        buttonKey: removeButtonKey,
        text: removeFromGroupText,
        textStyle: boldSize14Text(AppColors.redColor),
        onPressed: onRemoveTapped,
      );
    }

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
            smallVerticalSizedBox,
            SizedBox(
              width: double.infinity,
              height: 48,
              child: promotionButton,
            ),
            smallVerticalSizedBox,
            SizedBox(
              width: double.infinity,
              height: 48,
              child: banButton,
            ),
            smallVerticalSizedBox,
            SizedBox(
              width: double.infinity,
              height: 48,
              child: removeButton,
            ),
          ],
        ),
      ),
    );
  }
}
