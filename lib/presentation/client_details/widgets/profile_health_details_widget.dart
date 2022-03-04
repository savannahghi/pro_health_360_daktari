// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:myharehubpro/application/core/theme/app_themes.dart';

class ProfileHealthDetailsWidget extends StatelessWidget {
  ///[ProfileHealthDetailsWidget] displays profile health details widget
  final String svgPath;
  final String title;
  final String descriptionSubScript;
  final String description;

  const ProfileHealthDetailsWidget({
    required this.svgPath,
    required this.title,
    required this.description,
    required this.descriptionSubScript,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                SvgPicture.asset(
                  svgPath,
                  width: 15,
                  height: 15,
                ),
                verySmallHorizontalSizedBox,
                Text(
                  title,
                  style: normalSize14Text(AppColors.buttonAltColor),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: RichText(
                  text: TextSpan(
                    text: description,
                    style: veryBoldSize32Text(
                      AppColors.buttonAltColor,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: descriptionSubScript,
                        style: normalSize14Text(
                          AppColors.buttonAltColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
