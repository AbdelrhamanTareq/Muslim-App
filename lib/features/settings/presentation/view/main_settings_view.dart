import 'package:flutter/material.dart';
import 'package:muslim_app/core/utils/app_strings.dart';

class MainSettingsView extends StatelessWidget {
  const MainSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.settings),
      ),
    );
  }
}