import 'package:flutter/material.dart';
import 'package:muslim_app/core/utils/app_extensions.dart';

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
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: const SafeArea(
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
