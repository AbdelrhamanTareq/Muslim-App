import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:muslim_app/core/functions.dart';
import 'package:muslim_app/core/injection_container.dart';
import 'package:muslim_app/core/utils/app_strings.dart';
import 'package:muslim_app/core/utils/arabic_num_converter.dart';
import 'package:muslim_app/features/quran/data/local_data/quran_local_data.dart';
import 'package:share_plus/share_plus.dart';

import '../../../data/models/quran.dart';
import '../../logic/cubit/quran_settings_cubit/quran_settings_cubit.dart';
import '../../logic/cubit/quran_settings_cubit/quran_settings_state.dart';

class SurhWithTextSpan extends StatelessWidget {
  const SurhWithTextSpan({
    super.key,
    required List<Array> surahAyat,
    required ScrollController scrollController,
    required String surhName,
  })  : _scrollController = scrollController,
        _surhName = surhName,
        _surahAyat = surahAyat;

  final List<Array> _surahAyat;
  final ScrollController _scrollController;
  final String _surhName;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranSettingsCubit, QuranSettingsState>(
        builder: (context, state) {
      return Text.rich(
        TextSpan(
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
              fontSize: instance<QuranLocalData>().getQuranTextSize()),
          children: _surahAyat
              .map(
                (e) => TextSpan(
                  children: [
                    TextSpan(
                        text: e.ar,
                        // long press to show action menu for save bookmark or share aya
                        recognizer: LongPressGestureRecognizer()
                          ..onLongPressEnd = (details) {
                            var globalPositionDx = details.globalPosition.dx;
                            var globalPositionDy = details.globalPosition.dy;
                            showMenu(
                              elevation: 10,
                              context: context,
                              position: RelativeRect.fromLTRB(
                                globalPositionDx - 10,
                                globalPositionDy - 10,
                                globalPositionDx,
                                globalPositionDy,
                              ),
                              items: [
                                PopupMenuItem(
                                  padding: EdgeInsets.zero,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          IconButton(
                                            onPressed: () async {
                                              await instance<QuranLocalData>()
                                                  .setQuranBookmarkedNames(
                                                      key: _surhName,
                                                      value: [
                                                    _surhName,
                                                    _scrollController.offset +
                                                        details.globalPosition
                                                            .distance,
                                                  ]);
                                              AppFunctions.showToast(
                                                  AppStrings.addedBookmark);
                                              if (context.mounted) {
                                                Navigator.pop(context);
                                              }
                                            },
                                            icon: const Icon(Icons.bookmark),
                                          ),
                                          const Text(AppStrings.bookmark)
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              Share.share(e.ar);
                                            },
                                            icon: const Icon(Icons.share),
                                          ),
                                          const Text(AppStrings.share)
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }),
                    TextSpan(
                      text: e.id.toArabicNumbers,
                      // text: "\uFD3F${e.id.toArabicNumbers}\uFD3E",
                      // EDITED
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                              fontSize: instance<QuranLocalData>()
                                  .getQuranTextSize()),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
        // style: TextStyle(fontSize: 35, color: Colors.black, wordSpacing: 2),
        style: Theme.of(context).textTheme.displayMedium,
        textAlign: TextAlign.center,
      );
    });
  }
}
