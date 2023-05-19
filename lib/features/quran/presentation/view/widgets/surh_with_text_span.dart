import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:muslim_app/core/utils/arabic_num_converter.dart';

import '../../../data/models/quran.dart';

class SurhWithTextSpan extends StatelessWidget {
  const SurhWithTextSpan({
    super.key,
    required List<Array> surahAyat,
    required ScrollController scrollController,
  }) : _scrollController = scrollController, _surahAyat = surahAyat;

  final List<Array> _surahAyat;
  final ScrollController _scrollController;

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
                                    IconButton(
                                      onPressed: () {
                                        print(_scrollController.offset -
                                            details.globalPosition.dy);
                                      },
                                      icon: const Icon(Icons.bookmark),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        _scrollController
                                            .jumpTo(2184.1868161757807);
                                      },
                                      icon: const Icon(Icons.share),
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
      style: const TextStyle(
        fontSize: 25,
        fontFamily: "me_quran",
        height: 2,
        color: Color.fromARGB(196, 44, 44, 44),
      ),
      textAlign: TextAlign.center,
    );
  }
}
