// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:

// Project imports:
import 'package:healthcloud/presentation/core/app_bar/app_bar_back_button.dart';
import 'package:healthcloud/presentation/core/app_bar/app_bar_more_button.dart';
import 'package:healthcloud/presentation/core/app_bar/app_bar_notification.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// [CustomAppBar] is a custom [AppBar] used for navigation and showing basic
  /// user controls
  ///
  /// [leadingWidget] defaults to [AppBarBackButton] if no widget is provided.
  ///
  /// [trailingWidget] defaults to [AppBarMoreButton] no widget is provided.
  ///
  const CustomAppBar({
    this.leadingWidget,
    this.title,
    this.trailingWidget = const AppBarMoreButton(),
    this.showMoreButton = false,
    this.showNotificationIcon = false,
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

  @override
  Size get preferredSize => const Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: showMoreButton
              ? Theme.of(context).colorScheme.secondary
              : Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              blurRadius: 5,
              spreadRadius: 1,
              offset: const Offset(0.35, 0),
              color: Colors.grey.withOpacity(0.2),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            leadingWidget ??
                AppBarBackButton(
                  color: showMoreButton
                      ? Colors.white
                      : Theme.of(context).colorScheme.secondary,
                ),

            Text(
              title ?? '',
              style: veryBoldSize16Text(
                showMoreButton
                    ? Colors.white
                    : Theme.of(context).colorScheme.secondary,
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
