// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/constant/app_constatnt.dart';
import 'package:muslim_app/core/errors/error_widget.dart';
import 'package:muslim_app/core/injection_container.dart';

import 'package:muslim_app/core/utils/app_strings.dart';
import 'package:muslim_app/features/quran/data/local_data/quran_local_data.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../logic/cubit/quran_cubit/quran_cubit.dart';
import 'widgets/all_surhs_list.dart';

class QuranSurahsView extends StatefulWidget {
  const QuranSurahsView({super.key});

  @override
  State<QuranSurahsView> createState() => _QuranSurahsViewState();
}

class _QuranSurahsViewState extends State<QuranSurahsView> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final int lastReadIndex =
      instance<QuranLocalData>().getLastReadQuranSurhIndex();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.holyQuran),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: appBarLeftPadding),
            child: IconButton(
                onPressed: () {
                  itemScrollController.scrollTo(
                    index: lastReadIndex,
                    duration: const Duration(milliseconds: scrollDuration),
                    curve: curvesType,
                  );
                },
                icon: const Icon(Icons.bookmarks)),
          )
        ],
        //backgroundColor: AppColors.quranBackgroundAppBar,
      ),
      body: SafeArea(child: BlocBuilder<QuranCubit, QuranState>(
        builder: (context, state) {
          if (state is QuranGetAllDataError) {
            return AppErrorWidget(
              error: state.error,
            );
          } else if (state is QuranGetAllDataSucces) {
            return AllSurhsList(
              state: state,
              scrollController: itemScrollController,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      )),
    );
  }
}
