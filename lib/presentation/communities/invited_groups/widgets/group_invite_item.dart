import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';

class GroupInviteItem extends StatelessWidget {
  const GroupInviteItem({
    required this.groupName,
    required this.numberOfMembers,
    required this.groupId,
  });

  final String groupName;
  final int numberOfMembers;
  final String groupId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.acceptGroupInvitesPage,
          arguments: <String, dynamic>{
            'groupId': groupId,
            'groupName': groupName,
            'numberOfMembers': numberOfMembers,
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.14),
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              groupName,
              style: boldSize18Text(AppColors.blackColor.withOpacity(0.8)),
            ),
            smallVerticalSizedBox,
            Text(
              '$numberOfMembers members',
              style: normalSize14Text(AppColors.greyTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
