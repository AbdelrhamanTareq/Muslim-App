import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/utils/app_strings.dart';
import 'package:muslim_app/features/azkar/presentation/logic/cubit/azkar_cubit.dart';
import 'package:muslim_app/features/azkar/presentation/view/azkar_main_view.dart';

import 'widgets/main_action_list.dart';
import 'widgets/main_header_doaa.dart';

class HomwView extends StatefulWidget {
  const HomwView({super.key});

  @override
  State<HomwView> createState() => _HomwViewState();
}

class _HomwViewState extends State<HomwView> {
  @override
  void initState() {
    BlocProvider.of<AzkarCubit>(context).getAllAzkarData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffedebf2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const MainHeaderDoaa(),
            const SizedBox(
              height: 20,
            ),
            const MainActionList(),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all( 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.alazkar,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      AppStrings.allAzkar,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                ],
              ),
            ),
            const AzkarMainView(),
          ],
        ),
      ),
    );
  }
}
