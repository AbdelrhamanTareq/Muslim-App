import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:muslim_app/core/data/app_local_data.dart';
import 'package:muslim_app/core/function.dart';
import 'package:muslim_app/core/injection_container.dart';
import 'package:muslim_app/core/utils/app_strings.dart';
import 'package:muslim_app/core/utils/arabic_num_converter.dart';
import 'package:share_plus/share_plus.dart';

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
        style: Theme.of(context).textTheme.displayMedium,
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
                                            await instance<AppLocalData>()
                                                .setBookmarkedNames(
                                                    key: _surhName,
                                                    value: [
                                                  _surhName,
                                                  _scrollController.offset +
                                                      details.globalPosition
                                                          .distance,
                                                ]);
                                            showToast(
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
                    style: const TextStyle(fontSize: 30, color: Colors.black, wordSpacing: 2),
                  ),
                ],
              ),
            )
            .toList(),
      ),
      style: Theme.of(context).textTheme.displayMedium,
      textAlign: TextAlign.center,
    );
  }
}
