import 'package:flutter/material.dart';
import 'package:muslim_app/core/themes/app_colors.dart';
import 'package:muslim_app/core/themes/texts_styles.dart';
import 'package:muslim_app/core/themes/theme_constant.dart';

class AppTheme {
  const AppTheme._();

  static const double _outlineBorderWidth = 1;
  static const double _outlineBorderRadius = 16;
  static const Color _focusColors = AppColors.indigo;
  static const Color _focusErrorColors = AppColors.error;

  // light mode
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.scaffoldColor,

      // Helper Colors
      shadowColor: AppColors.black,
      splashColor: AppColors.white,

      // app bar theme
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      fontFamily: ThemeConstant.defaultFont,
      textTheme: TextTheme(
          headlineMedium: AppTextsStyles.headlineMediumText(),
          headlineLarge: AppTextsStyles.headlineLargText(),
          bodyMedium: AppTextsStyles.regularText(color: Colors.black),
          // quran style
          displayMedium: AppTextsStyles.quranTextStyle(),
          // sebha style
          labelMedium: AppTextsStyles.digitalStyle()),

      inputDecorationTheme: const InputDecorationTheme(
        // content padding
        contentPadding: EdgeInsets.all(16),

        // enabled border style
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: _focusColors, width: _outlineBorderWidth),
          borderRadius: BorderRadius.all(
            Radius.circular(_outlineBorderRadius),
          ),
        ),

        // focused border style
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: _focusColors, width: _outlineBorderWidth),
          borderRadius: BorderRadius.all(
            Radius.circular(_outlineBorderRadius),
          ),
        ),

        // error border style
        errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: _focusErrorColors, width: _outlineBorderWidth),
          borderRadius: BorderRadius.all(
            Radius.circular(_outlineBorderRadius),
          ),
        ),
        // focused border style
        focusedErrorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: _focusErrorColors, width: _outlineBorderWidth),
          borderRadius: BorderRadius.all(
            Radius.circular(_outlineBorderRadius),
          ),
        ),
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.black,

      // Helper Colors
      shadowColor: AppColors.white,
      splashColor: AppColors.black,

      // app bar theme
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      fontFamily: ThemeConstant.defaultFont,
      textTheme: TextTheme(
          headlineMedium: AppTextsStyles.headlineMediumText(),
          headlineLarge: AppTextsStyles.headlineLargText(),
          bodyMedium: AppTextsStyles.regularText(),
          // quran style
          displayMedium: AppTextsStyles.quranTextStyle(),
          // sebha style
          labelMedium: AppTextsStyles.digitalStyle()),

      inputDecorationTheme: const InputDecorationTheme(
        // content padding
        contentPadding: EdgeInsets.all(16),

        // enabled border style
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: _focusColors, width: _outlineBorderWidth),
          borderRadius: BorderRadius.all(
            Radius.circular(_outlineBorderRadius),
          ),
        ),

        // focused border style
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: _focusColors, width: _outlineBorderWidth),
          borderRadius: BorderRadius.all(
            Radius.circular(_outlineBorderRadius),
          ),
        ),

        // error border style
        errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: _focusErrorColors, width: _outlineBorderWidth),
          borderRadius: BorderRadius.all(
            Radius.circular(_outlineBorderRadius),
          ),
        ),
        // focused border style
        focusedErrorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: _focusErrorColors, width: _outlineBorderWidth),
          borderRadius: BorderRadius.all(
            Radius.circular(_outlineBorderRadius),
          ),
        ),
      ),
    );
  }
}
