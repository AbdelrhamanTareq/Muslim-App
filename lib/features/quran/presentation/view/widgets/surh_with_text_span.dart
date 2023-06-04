import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:muslim_app/core/data/app_local_data.dart';
import 'package:muslim_app/core/injection_container.dart';
import 'package:muslim_app/core/utils/arabic_num_converter.dart';
import 'package:muslim_app/core/themes/texts_styles.dart';
import 'package:muslim_app/features/quran/data/local_data/quran_local_data.dart';

import '../../../data/models/quran.dart';

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
    return Text.rich(
      TextSpan(
        children: _surahAyat
            .map(
              (e) => TextSpan(
                children: [
                  TextSpan(
                      text: e.ar,
                      recognizer: TapGestureRecognizer()
                        ..onTapDown = (details) {
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
                                            // print(_scrollController.offset);
                                            // print(details.globalPosition.distance);
                                            // print(
                                            //     MediaQuery.of(context).padding.top);
                                            // await instance<QuranLocalData>()
                                            //     .setBookmark(
                                            //       key: "QURAN_BOOKMARK",
                                            //         value: _scrollController
                                            //                 .offset +
                                            //             details.globalPosition
                                            //                 .distance);
                                            // await instance<QuranLocalData>()
                                            //     .setBookMarkedName(
                                            //       name:  _surhName, key: "BOOKMARKED_SURH_NAME");

                                            await instance<AppLocalData>()
                                                .setBookmarkedNames(
                                                    key: _surhName,
                                                    value: [
                                                  _surhName,
                                                  _scrollController.offset +
                                                      details.globalPosition
                                                          .distance,
                                                ]);
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(Icons.bookmark),
                                        ),
                                        Text("علامة")
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.share),
                                        ),
                                        const Text("مشاركة")
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                  TextSpan(
                    text: "\uFD3F${e.id.toArabicNumbers}\uFD3E",
                    style: const TextStyle(fontSize: 27),
                  ),
                ],
              ),
            )
            .toList(),
      ),
      style: AppTextsStyle.quranTextStyle,
      textAlign: TextAlign.center,
    );
  }
}
