import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/injection_container.dart';
import 'package:muslim_app/core/themes/app_colors.dart';
import 'package:muslim_app/features/quran/data/local_data/quran_local_data.dart';
import 'package:muslim_app/features/quran/data/models/quran.dart';

import '../logic/cubit/quran_settings_cubit/quran_settings_cubit.dart';
import '../logic/cubit/quran_settings_cubit/quran_settings_state.dart';
import 'widgets/basmala.dart';
import 'widgets/bookmark_widget.dart';
import 'widgets/surh_with_text_span.dart';

class QuranSurahDetails extends StatelessWidget {
  final int index;
  final List<Quran>? data;

  const QuranSurahDetails({
    this.data,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    final int index = this.index;
    final List<Quran> data = this.data ?? [];
    final String surahName = data[index].name;
    final List surahAyat = data[index].array;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.quranBackgroundAppBar,
        title: Text(surahName),
        actions: [
          BookmarkWidget(
              surhName: surahName, scrollController: scrollController),
          // EDITED
          DropDownMenu(
            text: "تغيير حجم الايات",
            sliderValue: instance<QuranLocalData>().getQuranTextSize(),
            onChangedSlider: (val) {
              BlocProvider.of<QuranSettingsCubit>(context)
                  .changeQuranTextSize(val);
            },
          ),
        ],
      ),
      backgroundColor: AppColors.quranBackground,
      // backgroundColor: const Color(0xfffff8f3),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
        child: Center(
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                // surh el fatah or surh el tobah
                surahAyat.length == 7 || surahAyat.length == 129
                    ? const Text("")
                    : const Basmala(),
                const SizedBox(
                  height: 8,
                ),
                // TEST it in Mobile
                // For switching between Sur
                GestureDetector(
                  onHorizontalDragEnd: (details) {
                    if (details.velocity.pixelsPerSecond.dx < 0) {
                      if (index > data.length) return;
                      _navToOtherSurha(context, index: index - 1, data: data);
                    } else {
                      if (index <= 0) return;
                      _navToOtherSurha(context, index: index + 1, data: data);
                    }
                  },
                  child: SurhWithTextSpan(
                    surhName: surahName,
                    surahAyat: surahAyat as List<Array>,
                    scrollController: scrollController,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _navToOtherSurha(context, {required int index, required List<Quran> data}) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => QuranSurahDetails(
          index: index,
          data: data,
        ),
      ),
    );
  }
}

// EDITED
class DropDownMenu extends StatelessWidget {
  const DropDownMenu({
    super.key,
    required this.text,
    required this.sliderValue,
    required this.onChangedSlider,
  });

  final String text;
  final double sliderValue;
  final Function(double)? onChangedSlider;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      position: PopupMenuPosition.under,
      itemBuilder: (context) => [
        PopupMenuItem(
          child: BlocBuilder<QuranSettingsCubit, QuranSettingsState>(
              builder: (context, state) {
            return Column(
              children: [
                Text(text),
                // Slider.adaptive(
                //   value: sliderValue,
                //   onChanged: onChangedSlider,
                //   divisions: 10,
                //   min: 25,
                //   max: 50,
                // ),
                Slider.adaptive(
                  value: instance<QuranLocalData>().getQuranTextSize(),
                  onChanged: (val) =>
                      BlocProvider.of<QuranSettingsCubit>(context)
                          .changeQuranTextSize(val),
                  divisions: 10,
                  min: 25,
                  max: 50,
                ),
              ],
            );
          }),
        ),
      ],
    );
  }
}
