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
    double fontSize = 30,
    Color color = AppColors.white,
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: ThemeConstant.quranFont,
      height: 2,
      wordSpacing: 2,
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

  static TextStyle digitalStyle({
    double fontSize = 35,
    Color color = AppColors.black,
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: ThemeConstant.digitalFont
    );
  }
}
