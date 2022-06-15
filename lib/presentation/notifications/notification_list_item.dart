// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/services/utils.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
// Package imports:

/// [NotificationListItem] Displays the notifications with Icons and a short description
class NotificationListItem extends StatelessWidget {
  const NotificationListItem({required this.notificationDetails});

  final NotificationDetails? notificationDetails;

  @override
  Widget build(BuildContext context) {
    final NotificationType notificationType =
        notificationDetails?.type ?? NotificationType.UNKNOWN;

    final NotificationActionInfo notificationInfo =
        getNotificationInfo(notificationType);
    final String? actionTitle = notificationInfo.actionTitle;
    final double _width = MediaQuery.of(context).size.width - 60;
    return Column(
      children: <Widget>[
        mediumVerticalSizedBox,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 12,
              height: 12,
              margin: const EdgeInsets.only(
                right: 8.0,
                top: 1.5,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: notificationDetails?.isRead ?? false
                    ? Colors.transparent
                    : AppColors.greenHappyColor,
              ),
            ),
            SizedBox(
              width: _width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          notificationDetails?.title ?? '',
                          style: normalSize13Text(AppColors.secondaryColor),
                        ),
                      ),
                      Text(
                        summarizeDate(notificationDetails?.createdAt ?? ''),
                        style: normalSize12Text(
                          AppColors.greyTextColor.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                  smallVerticalSizedBox,
                  Text(
                    notificationDetails?.body ?? '',
                    style: normalSize12Text(
                      AppColors.greyTextColor.withOpacity(0.8),
                    ),
                  ),
                  if (actionTitle != null)
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10.0,
                      ),
                      height: 34,
                      child: MyAfyaHubPrimaryButton(
                        buttonKey: notificationItemActionKey,
                        buttonColor: AppColors.primaryColor.withOpacity(0.10),
                        text: actionTitle,
                        textStyle: normalSize12Text(AppColors.primaryColor),
                        borderColor: AppColors.primaryColor.withOpacity(0.14),
                        onPressed: notificationInfo.route != null
                            ? () =>
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                  notificationInfo.route!,
                                  (Route<dynamic> route) => false,
                                )
                            : null,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, left: 20),
          color: Theme.of(context).primaryColor.withOpacity(0.1),
          height: 1,
          width: _width,
        )
      ],
    );
  }
}
