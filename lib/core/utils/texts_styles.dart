import 'package:flutter/material.dart';
import 'package:muslim_app/core/utils/app_strings.dart';

abstract class AppTextsStyle {
  static const TextStyle quranTextStyle = TextStyle(
    fontFamily: AppStrings.quranFont,
    fontSize: 25,
    height: 2,
  );

  static const TextStyle surhsDetailsTextStyle = TextStyle(
    fontFamily: AppStrings.quranFont,
    fontSize: 20,
  );

  static const TextStyle surhsNamesTextStyle = TextStyle(
    fontFamily: AppStrings.uthmanFont,
    fontSize: 22,
  );
}
