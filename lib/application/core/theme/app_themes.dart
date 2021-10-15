// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/colors.dart';

final ThemeData afyaMojaProAndroidTheme = buildTheme();
//use accordingly with guidance from the title
ThemeData buildTheme() {
  final ThemeData base = ThemeData.light();

  const ButtonThemeData buttonTheme = ButtonThemeData();

  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(secondary: AppColors.secondaryColor),

    primaryColor: AppColors.primaryColor,

    // grey
    backgroundColor: AppColors.lightGreyBackgroundColor,

    // red
    errorColor: dangerColor,

    // text color
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: healthcloudTextColor,
      selectionHandleColor: healthcloudTextColorPurple,
    ),

    // Button theme
    buttonTheme: buttonTheme.copyWith(
      buttonColor: sILButtonColor,
      // disabled color
      disabledColor: disabledButtonColor,
      // text color
      textTheme: ButtonTextTheme.normal,
      // height and width configurations
      minWidth: 88,
      height: 42,
    ),
  );
}

class AppColors {
  static const Color primaryColor = Color(0xFF1CA4A6);
  static const Color secondaryColor = Color(0xFF5F2788);
  static const Color accentColor = Color(0xFFA3C717);
  static const Color lightGreyBackgroundColor = Color(0xFFF6F6F6);
  static const Color listItemBackgroundColor = Color(0xFF707070);
  static const Color profileListCardColor = Color(0xfff9f2fe);
  static const Color userDetailsCardBackgroundColor = Color(0xff0097c4);
  static const Color textInputFillColor = Color(0xFFF9F2FE);
  static const Color textAltColor = Color(0xFF5F2788);
  static const Color malachiteColor = Color(0xff00BE33);
  static const Color lightGreyColor = Color(0xffd6d6d6);
  static const Color greyTextColor = Color(0xff707070);
  static const Color inputBackgroundColor = Color(0xFFF9F2FE);
}

BoxDecoration decoration({required BuildContext context}) => BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
      ),
    );
