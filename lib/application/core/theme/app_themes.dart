// Flutter imports:
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getAppTheme() {
    return ThemeData(
      fontFamily: 'Sora',
      primaryColor: AppColors.themeColors.primaryColor,
      primaryColorDark: AppColors.themeColors.primaryDark,
      colorScheme: ColorScheme.light(
        primary: AppColors.themeColors.primaryColor,
        secondary: AppColors.themeColors.accentColor,
      ),
      backgroundColor: AppColors.themeColors.backgroundColor,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: AppColors.themeColors.textSelectionColor,
      ),
    ).copyWith(
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        },
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: AppColors.primaryColor,
          textStyle: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class AppColors {
  static ThemeColors themeColors = ThemeColors(
    primaryColor,
    primaryColor,
    accentColor,
    lightGreyBackgroundColor,
    const Color(0xff0e2153),
  );
  static const Color blackColor = Color(0xFF000000);
  static const Color easternBlueColor = Color(0xFF1CA4A6);
  static const Color dodgerBlueColor = Color(0xFF407BFC);
  static const Color lightSkyBlueColor = Color(0xFFF6F7FB);
  static const Color galleryColor = Color(0xFFEBEBEB);
  static const Color primaryColor = Color(0xFF9269AD);
  static const Color secondaryColor = Color(0xFF5F2788);
  static const Color accentColor = Color(0xFFA3C717);
  static const Color lightGreyBackgroundColor = Color(0xFFF6F6F6);
  static const Color listItemBackgroundColor = Color(0xFF707070);
  static const Color profileListCardColor = Color(0xfff9f2fe);
  static const Color userDetailsCardBackgroundColor = Color(0xff0097c4);
  static const Color clientDetailsCardBackgroundColor = Color(0xff119496);
  static const Color textInputFillColor = Color(0xFFF9F2FE);
  static const Color textAltColor = Color(0xFF5F2788);
  static const Color malachiteColor = Color(0xff00BE33);
  static const Color mountainMeadowColor = Color(0xff1DBE71);
  static const Color lightGreyColor = Color(0xffd6d6d6);
  static const Color greyTextColor = Color(0xff707070);
  static const Color inputBackgroundColor = Color(0xFFF9F2FE);
  static const Color buttonAltColor = Color(0xFF06103B);
  static const Color blueBerryColor = Color(0xff407bfc);
  static const Color newGroupLabelColor = Color(0xFF407BFC);
  static const Color diaryListCardColor = Color(0xff17d1d4);
  static const Color dangerColor = Color(0xffb00020);
  static const Color redColor = Color(0xfff02532);
  static const Color lightRedColor = Color(0xfffac8c9);
  static const Color lightBlackTextColor = Color(0xFF555555);
  static const Color blueChillColor = Color(0xFF119496);
}

class ThemeColors {
  final Color primaryColor;
  final Color primaryDark;
  final Color accentColor;
  final Color backgroundColor;
  final Color textSelectionColor;

  ThemeColors(
    this.primaryColor,
    this.primaryDark,
    this.accentColor,
    this.backgroundColor,
    this.textSelectionColor,
  );
}
