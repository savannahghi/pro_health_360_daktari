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
    colorScheme: base.colorScheme.copyWith(secondary: healthcloudAccentColor),

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

BoxDecoration decoration({required BuildContext context}) => BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
      ),
    );
