import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/injection_container.dart';
import 'package:muslim_app/core/themes/app_colors.dart';
import 'package:muslim_app/core/widgets/remove_bookmark_elevated_icon.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.quranBackgroundAppBar,
        // actionsIconTheme: IconThemeData(color: AppColors.black),
        // EDITED FOR DARK THEME
        iconTheme: const IconThemeData(color: AppColors.black),
        title: Text(
          surahName,
          style: const TextStyle(color: AppColors.black),
        ),
        actions: [
          // EDITED
          BookmarkWidget(
            scrollItemName: surahName,
            onPressed: () {
              final double appBarHight = AppBar().preferredSize.height;
              final bookmark =
                  instance<QuranLocalData>().getQuranBookmarkedNames(surahName);
              if (bookmark == null || bookmark[0] != surahName) {
                AppFunctions.showSnackBar(context);
                return;
              }
              final double position = bookmark[1];
              scrollController.animateTo(position - appBarHight - 80,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn);
            },
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
      backgroundColor: AppColors.quranBackground,
      // backgroundColor: const Color(0xfffff8f3),
      body: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: Padding(
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
                        AppFunctions.navToOtherSurha(context,
                            index: index - 1, data: data);
                      } else if (details.delta.dx > 7) {
                        if (index > data.length) return;
                        AppFunctions.navToOtherSurha(context,
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
      ),
    );
  }
}

// Dorp down menu with slider to change text size
class DropDownMenu extends StatelessWidget {
  const DropDownMenu({
    super.key,
    required this.deletedBookmarkName,
    // required this.text,
    // required this.sliderValue,
    // required this.onChangedSlider,
  });

  final String deletedBookmarkName;

  // final String text;
  // final double sliderValue;
  // final void Function(double) onChangedSlider;

  @override
  Widget build(BuildContext context) {
    // print("sliderValue + ${widget.sliderValue}");
    return PopupMenuButton(
      position: PopupMenuPosition.under,
      itemBuilder: (context) => <PopupMenuItem>[
        PopupMenuItem(
          child: BlocBuilder<QuranSettingsCubit, QuranSettingsState>(
            builder: (context, state) {
              return Column(
                children: [
                  const Text(
                    "تغيير حجم الايات",
                  ),
                  // TODO
                  // Slider.adaptive(
                  //   value: sliderValue,
                  //   onChanged: (val) {
                  //     onChangedSlider(val);
                  //     state(() {});
                  //   },
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

// class TEST extends StatefulWidget {
//   const TEST({super.key});

//   @override
//   State<TEST> createState() => _TESTState();
// }

// class _TESTState extends State<TEST> {
//   double _val = 25;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Test"),
//         actions: [
//           PopupMenuButton(
//             key: UniqueKey(),
//             position: PopupMenuPosition.under,
//             itemBuilder: (context) => <PopupMenuItem>[
//               PopupMenuItem(
//                 child: StatefulBuilder(builder: (context, s) {
//                   return Column(
//                     children: [
//                       Text("widget.text"),
//                       Slider.adaptive(
//                         value: _val,
//                         onChanged: (val) {
//                           setState(() {
//                             _val = val;
//                           });
//                         },
//                         divisions: 10,
//                         min: 25,
//                         max: 50,
//                       ),
//                       // Slider.adaptive(
//                       //   value: instance<QuranLocalData>().getQuranTextSize(),
//                       //   onChanged: (val) =>
//                       //       BlocProvider.of<QuranSettingsCubit>(context)
//                       //           .changeQuranTextSize(val),
//                       //   divisions: 10,
//                       //   min: 25,
//                       //   max: 50,
//                       // ),
//                     ],
//                   );
//                 }),
//               ),
//             ],
//           )
//         ],
//       ),
//       body: Center(
//         child: Text("data"),
//       ),
//     );
//   }
// }
