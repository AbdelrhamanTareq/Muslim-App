import 'package:flutter/material.dart';
import 'package:muslim_app/core/themes/theme_constant.dart';

abstract class AppTextsStyle {
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
}
