import 'package:flutter/material.dart';
import 'package:shared_themes/colors.dart';

final ThemeData afyaMojaProAndroidTheme = buildTheme();
//use accordingly with guidance from the title
ThemeData buildTheme() {
  final ThemeData base = ThemeData.light();

  const ButtonThemeData buttonTheme = ButtonThemeData();

  return base.copyWith(
    // cyan
    accentColor: healthcloudAccentColor,

    primaryColor: healthcloudPrimaryColor,

    // grey
    backgroundColor: healthcloudBackgroundColor,

    // red
    errorColor: dangerColor,

    // text color
    textSelectionTheme: const TextSelectionThemeData(
        selectionColor: healthcloudTextColor,
        selectionHandleColor: healthcloudTextColorPurple),

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
