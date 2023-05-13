import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constant/app_constatnt.dart';
import 'widgets/main_action_list.dart';
import 'widgets/main_header_doaa.dart';

class HomwView extends StatelessWidget {
  const HomwView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffedebf2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
      ),
      body:const Column(
        children: [
           MainHeaderDoaa(),
          MainActionList()
        ],
      ),
    );
  }
}

