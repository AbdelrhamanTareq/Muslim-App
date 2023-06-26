import 'package:flutter/material.dart';
import 'package:muslim_app/core/themes/app_colors.dart';

import 'widgets/actions_row.dart';
import 'widgets/zekr_actions_row.dart';
import 'widgets/zekr_indicator.dart';
import 'widgets/zekr_text_field.dart';

class SebhaMainView extends StatelessWidget {
  const SebhaMainView({super.key});

  // double _initValue = 0;
  // double _maxValue = 33;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ZkerTextFiled(),
              SizedBox(
                height: 50,
              ),
              ZekrIndictor(),
              SizedBox(
                height: 30,
              ),
              ZekrActionsRow(),
              SizedBox(
                height: 30,
              ),
              ActionsRow()
            ],
          ),
        ),
      ),
    );
  }
}
