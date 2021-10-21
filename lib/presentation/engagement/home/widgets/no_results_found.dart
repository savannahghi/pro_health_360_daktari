// Flutter imports:
import 'package:afya_moja_core/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';

// Package imports:
import 'package:shared_themes/spaces.dart';

// Project imports
import 'package:shared_themes/text_themes.dart';

class NoResultsFound extends StatelessWidget {
  const NoResultsFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          smallVerticalSizedBox,
          SvgPicture.asset(
            noResultsFoundImage,
          ),
          mediumVerticalSizedBox,
          Text(
            noResultsFoundText,
            style: TextThemes.normalSize14Text(),
          ),
          mediumVerticalSizedBox,
          const MyAfyaHubPrimaryButton(
            text: addNewPatientText,
            buttonColor: AppColors.accentColor,
            borderColor: AppColors.accentColor,
          ),
        ],
      ),
    );
  }
}
