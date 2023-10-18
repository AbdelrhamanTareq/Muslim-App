import 'package:flutter/material.dart';

extension ThemeShortcut on BuildContext {
  get theme => Theme.of(this);
  get textThmem => Theme.of(this).textTheme;
  get bodyMedium => textThmem.bodyMedium;
  get displayMedium => textThmem.displayMedium;
  get scaffoldBackGroundColor => theme.scaffoldBackgroundColor;
  get blackLightColor => theme.shadowColor;
  get whiteLightColor => theme.splashColor;
}
