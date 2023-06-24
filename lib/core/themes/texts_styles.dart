import 'package:flutter/material.dart';
import 'package:muslim_app/core/themes/app_colors.dart';
import 'package:muslim_app/core/themes/theme_constant.dart';

class AppTextsStyles {
  const AppTextsStyles._();

  static TextStyle regularText({
    double fontSize = 18,
    Color color = AppColors.white,
  }) {
    return TextStyle(fontSize: fontSize, color: color);
  }

  static TextStyle quranTextStyle({
    double fontSize = 25,
    Color color = AppColors.white,
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: ThemeConstant.quranFont,
      height: 2,
    );
  }

  static TextStyle headlineLargText({
    double fontSize = 25,
    Color color = AppColors.white,
  }) {
    return TextStyle(
        fontSize: fontSize, color: color, fontWeight: FontWeight.bold);
  }

  static TextStyle headlineMediumText({
    double fontSize = 20,
    Color color = AppColors.white,
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
    );
  }

  // static const TextStyle quranTextStyle = TextStyle(
  //   fontFamily: ThemeConstant.quranFont,
  //   fontSize: 25,
  //   height: 2,
  // );

  // static const TextStyle surhsDetailsTextStyle = TextStyle(
  //   fontFamily: ThemeConstant.quranFont,
  //   fontSize: 20,
  // );

  // static const TextStyle surhsNamesTextStyle = TextStyle(
  //   fontFamily: ThemeConstant.uthmanFont,
  //   fontSize: 22,
  // );

  // static const TextStyle reqularText18 =
  //     TextStyle(fontSize: 18, color: Colors.black);

  // static const TextStyle reqularText22 =
  //     TextStyle(fontSize: 22, color: Colors.black);
}
