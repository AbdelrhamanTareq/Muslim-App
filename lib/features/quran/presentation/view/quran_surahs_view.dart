// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/errors/error_widget.dart';

import 'package:muslim_app/core/utils/app_strings.dart';
import 'package:muslim_app/features/quran/presentation/logic/cubit/quran_cubit.dart';

import 'widgets/all_surhs_list.dart';

class QuranSurahsView extends StatefulWidget {
  const QuranSurahsView({super.key});

  @override
  State<QuranSurahsView> createState() => _QuranSurahsViewState();
}

class _QuranSurahsViewState extends State<QuranSurahsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.holyQuran),
        //backgroundColor: AppColors.quranBackgroundAppBar,
      ),
      body: SafeArea(child: BlocBuilder<QuranCubit, QuranState>(
        builder: (context, state) {
          if (state is QuranGetAllDataError) {
            return AppErrorWidget(
              error: state.error,
            );
          } else if (state is QuranGetAllDataSucces) {
            return AllSurhsList(state: state);
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

