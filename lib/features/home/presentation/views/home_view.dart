import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/utils/app_assets.dart';
import 'package:muslim_app/core/utils/app_router.dart';

import 'package:muslim_app/features/azkar/presentation/view/azkar_main_view.dart';

import '../../../app_drawer/presentation/view/app_drawer.dart';
import '../../../azkar/presentation/logic/cubit/main_azkar_cubit.dart';
import '../../../azkar/presentation/view/widgets/azkar_header_row_texts.dart';
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
    BlocProvider.of<MainAzkarCubit>(context).getMainAzkarData();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // preload prayer times image
    precacheImage(const AssetImage(AppAssets.dayImagePath), context);
    precacheImage(const AssetImage(AppAssets.nightImagePath), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      // backgroundColor: AppColors.scaffoldColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (ctx) {
          return Row(
            children: [
              IconButton(
                padding: const EdgeInsets.only(right: 10),
                onPressed: () {
                  Scaffold.of(ctx).openDrawer();
                  // Navigator.pushNamed(context, Routes.settingPath);
                },
                icon: const Icon(Icons.menu),
              ),
            ],
          );
        }),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.favoritePath);
            },
            icon: const Icon(Icons.favorite),
            color: Colors.red,
          ),
        ],
      ),
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            MainHeaderDoaa(),
            SizedBox(
              height: 20,
            ),
            MainActionList(),
            SizedBox(
              height: 20,
            ),
            AzkarHeaderRowTexts(),
            AzkarMainView(),
          ],
        ),
      ),
    );
  }
}
