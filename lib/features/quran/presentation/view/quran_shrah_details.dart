import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/constant/app_constatnt.dart';
import 'package:muslim_app/core/injection_container.dart';
import 'package:muslim_app/core/themes/app_colors.dart';
import 'package:muslim_app/core/utils/app_extensions.dart';
import 'package:muslim_app/core/utils/app_strings.dart';
import 'package:muslim_app/core/widgets/remove_bookmark_elevated_icon.dart';
import 'package:muslim_app/features/app_drawer/presentation/logic/cubit/app_drawer_cubit.dart';
import 'package:muslim_app/features/quran/data/local_data/quran_local_data.dart';
import 'package:muslim_app/features/quran/data/models/quran.dart';

import '../../../../core/functions.dart';
import '../logic/cubit/quran_settings_cubit/quran_settings_cubit.dart';
import '../logic/cubit/quran_settings_cubit/quran_settings_state.dart';
import 'widgets/basmala.dart';
import '../../../../core/widgets/bookmark_widget.dart';
import 'widgets/surh_with_text_span.dart';

class QuranSurahDetails extends StatelessWidget {
  final int index;
  final List<Quran>? data;

  const QuranSurahDetails({
    this.data,
    required this.index,
    super.key,
  });

  // double _val = 25;
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final int index = this.index;
    final List<Quran> data = this.data ?? [];
    final String surahName = data[index].name;
    final List surahAyat = data[index].array;
    return BlocBuilder<AppDrawerCubit, AppDrawerState>(
        builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: (state.isDarkMode)
              ? Colors.black54
              : AppColors.quranBackgroundAppBar,
          // actionsIconTheme: IconThemeData(color: AppColors.black),
          // EDITED FOR DARK THEME
          iconTheme: IconThemeData(color: context.blackLightColor),
          elevation: 5,
          title: Text(
            surahName,
            style: TextStyle(color: context.blackLightColor),
          ),
          actions: [
            // EDITED
            Padding(
              padding: const EdgeInsets.only(left: appBarLeftPadding),
              child: BookmarkWidget(
                scrollItemName: surahName,
                onPressed: () {
                  final double appBarHight = AppBar().preferredSize.height;
                  final bookmark = instance<QuranLocalData>()
                      .getQuranBookmarkedNames(surahName);
                  if (bookmark == null || bookmark[0] != surahName) {
                    AppFunctions.showSnackBar(context);
                    return;
                  }
                  final double position = bookmark[1];
                  scrollController.animateTo(position - appBarHight - 80,
                      duration: const Duration(milliseconds: scrollDuration),
                      curve: curvesType);
                },
              ),
            ),
            // EDITED
            DropDownMenu(
              deletedBookmarkName: surahName,
              // text: "تغيير حجم الايات",
              // sliderValue: size,
              // onChangedSlider: (val) {
              //   s(() {
              //     BlocProvider.of<QuranSettingsCubit>(context)
              //         .changeQuranTextSize(val);
              //   });
              // },
            ),
          ],
        ),
        backgroundColor:
            (state.isDarkMode) ? AppColors.black : AppColors.quranBackground,
        // backgroundColor: const Color(0xfffff8f3),
        body: Padding(
          padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
          child: Center(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  // surh el fatah or surh el tobah
                  surahAyat.length == 129
                      ? const Text("")
                      : (surahAyat.length == 7)
                          ? const BasmalaFataha()
                          : const Basmala(),
                  const SizedBox(
                    height: 8,
                  ),
                  // TEST it in Mobile
                  // Test sensitvity
                  // For switching between Sur
                  GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      //TODO
                      if (details.delta.dx < -7) {
                        if (index <= 0) return;
                        AppFunctions.navToOtherSurhaWithReplace(context,
                            index: index - 1, data: data);
                      } else if (details.delta.dx > 7) {
                        if (index > data.length) return;
                        AppFunctions.navToOtherSurhaWithReplace(context,
                            index: index + 1, data: data);
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
    });
  }
}

// Dorp down menu with slider to change text size
class DropDownMenu extends StatelessWidget {
  const DropDownMenu({
    super.key,
    required this.deletedBookmarkName,
  });

  final String deletedBookmarkName;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      position: PopupMenuPosition.under,
      itemBuilder: (context) => <PopupMenuItem>[
        PopupMenuItem(
          child: BlocBuilder<QuranSettingsCubit, QuranSettingsState>(
            builder: (context, state) {
              return Column(
                children: [
                  const Text(
                    AppStrings.changeAyatSize,
                  ),
                  Slider.adaptive(
                    value: instance<QuranLocalData>().getQuranTextSize(),
                    onChanged: (val) =>
                        BlocProvider.of<QuranSettingsCubit>(context)
                            .changeQuranTextSize(val),
                    divisions: 10,
                    min: 25,
                    max: 50,
                  ),
                  RemoveBookmarkElevatedButton(onPressed: () async {
                    bool val = await instance<QuranLocalData>()
                        .removeQuranBookmark(deletedBookmarkName);
                    AppFunctions.removeBookmark(val);
                  }),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
