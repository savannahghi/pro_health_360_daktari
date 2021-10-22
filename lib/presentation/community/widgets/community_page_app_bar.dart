import 'package:flutter/material.dart';
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/presentation/core/app_bar/app_bar_back_button.dart';
import 'package:healthcloud/presentation/core/app_bar/app_bar_more_button.dart';
import 'package:shared_themes/text_themes.dart';

class CommunityPageAppBar extends StatelessWidget with PreferredSizeWidget {
  const CommunityPageAppBar({this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.accentColor,
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
            const AppBarBackButton(color: Colors.white),
            Text(
              title ?? '',
              style: TextThemes.veryBoldSize16Text(Colors.white),
            ),
            const AppBarMoreButton()
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
