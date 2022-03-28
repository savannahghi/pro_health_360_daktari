import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/community/group_info/widgets/member_list_actions_dialog.dart';
import 'package:shared_themes/spaces.dart';

class GroupMemberItem extends StatelessWidget {
  const GroupMemberItem({
    required this.userName,
    required this.memberID,
    required this.communityId,
    required this.communityName,
    this.isModerator = false,
    this.itemKey,
    required this.isBanned,
  });

  final String userName;
  final String memberID;
  final String communityId;
  final String communityName;
  final bool isModerator;
  final bool isBanned;
  final Key? itemKey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: itemKey,
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (isModerator) {
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      userName.isNotEmpty ? userName : UNKNOWN,
                      style:
                          boldSize12Text(isBanned ? AppColors.lightGrey.withOpacity(0.6) : null),
                    ),
                    if (isBanned)
                      Text(
                        bannedString,
                        style: boldSize12Text(AppColors.redColor.withOpacity(0.6)),
                      ),
                  ],
                ),
              ],
            ),
            if (isModerator)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.lightGrey),
                ),
                padding: const EdgeInsets.all(4),
                child: const Text(
                  moderatorText,
                  style: TextStyle(fontSize: 11, color: AppColors.lightGrey),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
