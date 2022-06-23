// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';

class MoodItemData {
  MoodItemData({required this.color, required this.svgIconUrl});

  final Color color;
  final String svgIconUrl;

  factory MoodItemData.initial() => MoodItemData(
        color: AppColors.secondaryColor,
        svgIconUrl: happyIconSvgPath,
      );
}
