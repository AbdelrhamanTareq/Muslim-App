import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/themes/app_colors.dart';
import 'package:muslim_app/core/utils/app_assets.dart';

import 'package:muslim_app/features/azkar/presentation/view/azkar_main_view.dart';

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
      backgroundColor: AppColors.scaffoldColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
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
