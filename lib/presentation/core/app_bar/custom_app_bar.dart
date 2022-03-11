// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:mycarehubpro/presentation/core/app_bar/app_bar_back_button.dart';
import 'package:mycarehubpro/presentation/core/app_bar/app_bar_more_button.dart';
import 'package:mycarehubpro/presentation/core/app_bar/app_bar_notification.dart';
import 'package:mycarehubpro/presentation/engagement/home/widgets/appbar_user.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// [CustomAppBar] is a custom [AppBar] used for navigation and showing basic
  /// user controls
  ///
  /// [leadingWidget] defaults to [AppBarBackButton] if no widget is provided.
  ///
  /// [trailingWidget] defaults to [AppBarMoreButton] no widget is provided.
  ///
  const CustomAppBar({
    this.leadingWidget = const AppbarUser(),
    this.title,
    this.trailingWidget = const AppBarMoreButton(),
    this.showMoreButton = false,
    this.showNotificationIcon = false,
    this.showShadow = true,
    this.showBackButton = true,
  });

  final Widget? leadingWidget;
  final String? title;
  final Widget? trailingWidget;

  // whether to show the more button. Defaults to false because
  // only the Community screens use it

  final bool showMoreButton;
  // whether to show the notification icon. Defaults to false because
  // only [RedFlagsPage] use it
  final bool showNotificationIcon;

  final bool showShadow;

  // whether to show the back button instead of the profile image. defaults to
  // true because most screens use it
  final bool showBackButton;

  @override
  Size get preferredSize => const Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: showMoreButton
              ? Theme.of(context).colorScheme.primary
              : Colors.white,
          boxShadow: showShadow
              ? <BoxShadow>[
                  BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: const Offset(0.35, 0),
                    color: Colors.grey.withOpacity(0.2),
                  )
                ]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            if (showBackButton)
              AppBarBackButton(
                color: showMoreButton
                    ? Colors.white
                    : Theme.of(context).colorScheme.primary,
              )
            else
              leadingWidget!,

            Text(
              title ?? '',
              style: veryBoldSize16Text(
                showMoreButton
                    ? Colors.white
                    : Theme.of(context).colorScheme.primary,
              ),
            ),

            // This can never be null because the default widget is already
            // set in the constructor
            if (showMoreButton)
              const AppBarMoreButton()
            else if (showNotificationIcon)
              const AppBarNotification()
            else
              trailingWidget!,
          ],
        ),
      ),
    );
  }
}
