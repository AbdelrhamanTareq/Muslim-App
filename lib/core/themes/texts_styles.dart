import 'package:flutter/material.dart';
import 'package:muslim_app/core/themes/theme_constant.dart';

class AppTextsStyle {
  const AppTextsStyle._();
  static const TextStyle quranTextStyle = TextStyle(
    fontFamily: ThemeConstant.quranFont,
    fontSize: 25,
    height: 2,
  );

  static const TextStyle surhsDetailsTextStyle = TextStyle(
    fontFamily: ThemeConstant.quranFont,
    fontSize: 20,
  );

  static const TextStyle surhsNamesTextStyle = TextStyle(
    fontFamily: ThemeConstant.uthmanFont,
    fontSize: 22,
  );

  static const TextStyle reqularText18 =
      TextStyle(fontSize: 18, color: Colors.black);

  static const TextStyle reqularText22 =
      TextStyle(fontSize: 22, color: Colors.black);
}
