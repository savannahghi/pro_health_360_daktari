// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:myharehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:myharehubpro/domain/core/value_objects/app_widget_keys.dart';

class AppBarMoreButton extends StatelessWidget {
  const AppBarMoreButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        key: appBarMoreButtonKey,
        borderRadius: BorderRadius.circular(50),
        splashColor: Theme.of(context).colorScheme.secondary,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SvgPicture.asset(
            moreIconSvgPath,
            color: Colors.white,
            width: 24,
          ),
        ),
      ),
    );
  }
}
