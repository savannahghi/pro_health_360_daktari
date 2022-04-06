import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/community/group_info/widgets/member_list_actions_dialog.dart';
import 'package:shared_themes/spaces.dart';

import 'group_member_badge.dart';

class GroupMemberItem extends StatelessWidget {
  const GroupMemberItem({
    required this.userName,
    required this.memberID,
    required this.communityId,
    required this.communityName,
    this.isModerator = false,
    this.canModerate = false,
    this.isBanned = false,
    this.itemKey,
  });

  final String userName;
  final String memberID;
  final String communityId;
  final String communityName;
  final bool isModerator;
  final bool canModerate;
  final bool isBanned;
  final Key? itemKey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: itemKey,
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (canModerate) {
          showDialog(
            context: context,
            builder: (_) {
              return MemberListActionsDialog(
                memberID: memberID,
                communityId: communityId,
                communityName: communityName,
                memberName: name,
                isBanned: isBanned,
              );
            },
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 38,
                  width: 38,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.galleryColor,
                  ),
                  child: Center(
                    child: Text(
                      userName.isNotEmpty
                          ? userName.trim()[0].toUpperCase()
                          : 'U',
                      style: boldSize14Text(AppColors.primaryColor),
                    ),
                  ),
                ),
                size15HorizontalSizedBox,
                Text(
                  userName.isNotEmpty ? userName : UNKNOWN,
                  style: boldSize12Text(
                    isBanned ? AppColors.lightGrey.withOpacity(0.6) : null,
                  ),
                ),
              ],
            ),
            if (isModerator)
              const GroupMemberBadge(
                text: moderatorText,
                color: AppColors.greenHappyColor,
              )
            else if (isBanned)
              const GroupMemberBadge(
                text: bannedString,
                color: AppColors.warningColor,
              )
          ],
        ),
      ),
    );
  }
}
