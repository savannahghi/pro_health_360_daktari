import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:myharehubpro/application/core/theme/app_themes.dart';
import 'package:myharehubpro/presentation/community/group_info/widgets/member_list_actions_dialog.dart';
import 'package:shared_themes/spaces.dart';

class GroupMemberItem extends StatelessWidget {
  const GroupMemberItem({
    required this.userName,
    required this.memberID,
  });
  final String userName;
  final String memberID;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return MemberListActionsDialog(memberID: memberID);
          },
        );
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
                      userName.isNotEmpty ?  userName.trim()[0].toUpperCase() : 'U',
                      style: boldSize14Text(AppColors.primaryColor),
                    ),
                  ),
                ),
                size15HorizontalSizedBox,
                Text(
                  userName.isNotEmpty ? userName : UNKNOWN,
                  style: boldSize12Text(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
