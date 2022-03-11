// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';

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
            style: normalSize14Text(),
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
