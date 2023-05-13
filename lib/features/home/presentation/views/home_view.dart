import 'package:flutter/material.dart';

import 'widgets/main_action_list.dart';
import 'widgets/main_header_doaa.dart';

class HomwView extends StatelessWidget {
  const HomwView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffedebf2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
      ),
      body: const Column(
        children: [
          MainHeaderDoaa(),
          SizedBox(
            height: 20,
          ),
          MainActionList()
        ],
      ),
    );
  }
}
