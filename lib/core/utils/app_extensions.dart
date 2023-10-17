import 'package:flutter/material.dart';

extension ThemeShortcut on BuildContext {
  get textThmem => Theme.of(this).textTheme;
  get bodyMedium => textThmem.bodyMedium;
}
