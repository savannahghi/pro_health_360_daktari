// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
// Project imports:
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({this.color = Colors.black});

  final Color color;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        key: appBarBackButtonKey,
        borderRadius: BorderRadius.circular(50),
        splashColor: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
        onTap: () async {
          if (Navigator.canPop(context)) {
            Navigator.of(context).pop();
          }
        },
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15, top: 10, bottom: 10, right: 15),
          child: SvgPicture.asset(
            backIconSvgPath,
            color: color,
            width: 25,
          ),
        ),
      ),
    );
  }
}
