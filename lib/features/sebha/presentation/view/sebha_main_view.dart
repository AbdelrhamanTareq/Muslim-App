import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
      // appBar: AppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(187, 42, 209, 47),
              Color.fromARGB(255, 14, 114, 18),
            ],
          ),
        ),
        child: const SafeArea(
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
      ),
    );
  }
}







