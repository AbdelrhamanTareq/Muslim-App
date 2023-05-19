import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:muslim_app/core/utils/arabic_num_converter.dart';
import 'package:muslim_app/features/quran/data/models/quran.dart';

import '../../../../core/function.dart';
import 'widgets/basmala.dart';
import 'widgets/surh.dart';

class QuranSurahDetails extends StatefulWidget {
  final List<Array> _surahAyat;

  const QuranSurahDetails(
    this._surahAyat, {
    super.key,
  });

  @override
  State<QuranSurahDetails> createState() => _QuranSurahDetailsState();
}

class _QuranSurahDetailsState extends State<QuranSurahDetails> {
  final GlobalKey _textKey = GlobalKey();
  final TextSelection textSelection =
      const TextSelection(baseOffset: 17, extentOffset: 21);
  @override
  Widget build(BuildContext context) {
    String surhText = "";

    for (var element in widget._surahAyat) {
      surhText += "${element.ar}\uFD3F${(element.id).toArabicNumbers}\uFD3E";
    }

    ScrollController _scrollController = ScrollController();
   

    //this is y - I think it's what you want
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 252, 206),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          width: double.infinity,
          //height: double.infinity,
          alignment: widget._surahAyat.length < 20
              ? Alignment.center
              : Alignment.topCenter,
          padding: widget._surahAyat.length < 20
              ? EdgeInsets.zero
              : const EdgeInsets.symmetric(vertical: 40, horizontal: 8),
          child: Column(
            children: [
              widget._surahAyat.length == 7 || widget._surahAyat.length == 129
                  ? const Text("")
                  : const Basmala(),
              const SizedBox(
                height: 8,
              ),
              Text.rich(
                TextSpan(
                  children: widget._surahAyat
                      .map(
                        (e) => TextSpan(
                          children: [
                            TextSpan(
                                text: e.ar,
                                recognizer: TapGestureRecognizer()
                                  ..onTapDown = (details) {
                                    var globalPositionDx =
                                        details.globalPosition.dx;
                                    var globalPositionDy =
                                        details.globalPosition.dy;
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                print(_scrollController.offset  - details.globalPosition.dy);
                                                },
                                                icon:
                                                    const Icon(Icons.bookmark),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  _scrollController.jumpTo(
                                                      2184.1868161757807);
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
                          // style: TextStyle(backgroundColor: color),
                          // text: "${e.ar}\uFD3F${e.id.toArabicNumbers}\uFD3E",
                        ),
                      )
                      .toList(),
                ),
                key: _textKey,
                style: const TextStyle(
                  fontSize: 25,
                  fontFamily: "me_quran",
                  height: 2,
                  color: Color.fromARGB(196, 44, 44, 44),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),

          // ListView(
          //   padding: EdgeInsets.zero,
          //   shrinkWrap: true,
          //   controller: _scrollController,
          //   children: [
          //     Row(
          //       children: [
          //         Expanded(
          //             child: Column(
          //           children: [
          //             _surahAyat.length == 7 || _surahAyat.length == 129
          //                 ? const Text("")
          //                 : const Basmala(),
          //             const SizedBox(
          //               height: 8,
          //             ),
          //             SurhWidget(
          //                 scrollController: _scrollController,
          //                 surhText: surhText),
          //           ],
          //         ))
          //       ],
          //     )
          //   ],
          // ),
        ),
      ),
    );
  }

  Rect _getSelectionRect() =>
      (_textKey.currentContext!.findRenderObject() as RenderParagraph)
          .getBoxesForSelection(textSelection)
          .fold(
            null,
            (Rect? previous, TextBox textBox) => Rect.fromLTRB(
              min(previous?.left ?? textBox.left, textBox.left),
              min(previous?.top ?? textBox.top, textBox.top),
              max(previous?.right ?? textBox.right, textBox.right),
              max(previous?.bottom ?? textBox.bottom, textBox.bottom),
            ),
          ) ??
      Rect.zero;
}
