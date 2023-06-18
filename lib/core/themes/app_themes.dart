import 'package:flutter/material.dart';
import 'package:muslim_app/core/themes/texts_styles.dart';
import 'package:muslim_app/core/themes/theme_constant.dart';

class AppTheme {
  const AppTheme._();

  static const double _outlineBorderWidth = 1;
  static const double _outlineBorderRadius = 16;
  static const Color _focusColors = Colors.purple;
  static const Color _focusErrorColors = Colors.red;

  static ThemeData lightThem() {
    return ThemeData(
      useMaterial3: true,
      // app bar theme
      appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
      fontFamily: ThemeConstant.defaultFont,
      textTheme: const TextTheme(
        headlineMedium: AppTextsStyle.reqularText18,
        headlineLarge: AppTextsStyle.reqularText22,
      ),

      inputDecorationTheme: const InputDecorationTheme(
        // content padding
        contentPadding: EdgeInsets.all(16),
        // hint style
        // hintStyle: getRegularStyle(
        //     color: ColorManager.ligthGrey, fontSize: FontSize.s14),
        // labelStyle: getMediumStyle(
        //     color: ColorManager.ligthGrey, fontSize: FontSize.s14),
        // errorStyle: getRegularStyle(color: ColorManager.error),
        // prefixIconColor: ColorManager.ligthGrey,
        // // filled color
        // filled: true,
        // fillColor: ColorManager.grey,
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
