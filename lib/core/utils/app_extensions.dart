import 'package:flutter/material.dart';

extension ThemeShortcut on BuildContext {
  get theme => Theme.of(this);
  get textThmem => Theme.of(this).textTheme;
  get bodyMedium => textThmem.bodyMedium;
}
