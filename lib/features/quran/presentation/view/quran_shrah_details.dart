import 'package:flutter/material.dart';
import 'package:muslim_app/core/data/app_local_data.dart';
import 'package:muslim_app/features/quran/data/models/quran.dart';

import '../../../../core/injection_container.dart';
import 'widgets/basmala.dart';
import 'widgets/sura_name_shape.dart';
import 'widgets/surh_with_text_span.dart';

class QuranSurahDetails extends StatefulWidget {
  final List<Array> _surahAyat;
  final String _surahName;

  const QuranSurahDetails(
    this._surahAyat,
    this._surahName, {
    super.key,
  });

  @override
  State<QuranSurahDetails> createState() => _QuranSurahDetailsState();
}

class _QuranSurahDetailsState extends State<QuranSurahDetails> {
  @override
  Widget build(BuildContext context) {
    // String surhText = "";

    // for (var element in widget._surahAyat) {
    //   surhText += "${element.ar}\uFD3F${(element.id).toArabicNumbers}\uFD3E";
    // }

    ScrollController _scrollController = ScrollController();
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 252, 252, 206),
      backgroundColor: const Color(0xfffff8f3),
      body: SafeArea(
        child: Stack(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: IconButton(
                      onPressed: () {
                        final bookmark = instance<AppLocalData>()
                            .getBookmarkedNames(widget._surahName);
                        if (bookmark == null ||
                            bookmark[0] != widget._surahName) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("لا يوجد علامة في هذة الصورة"),
                            ),
                          );
                          return;
                        }
                        final double position = bookmark[1];
                        _scrollController.animateTo(position - 240,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn);

                        // final _bookmarkedSurhName =
                        //     instance<QuranLocalData>().getBookMarkedName("BOOKMARKED_SURH_NAME");
                        // if (_bookmarkedSurhName != widget._surahName) {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(
                        //       content: Text("لا يوجد علامة في هذة الصورة"),
                        //     ),
                        //   );
                        //   return;
                        // }
                        // final double _position =
                        //     instance<QuranLocalData>().getBookmark("QURAN_BOOKMARK") ?? 0;
                        // _scrollController.animateTo(_position - 240,
                        //     duration: const Duration(milliseconds: 300),
                        //     curve: Curves.easeIn);
                      },
                      icon: const Icon(
                        Icons.bookmark,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 100,
                    child: CustomPaint(
                      painter: SurhNameCustomPainter(),
                      child: Align(
                        alignment: Alignment.center,
                        child: FittedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(
                              widget._surahName,
                              style: const TextStyle(fontSize: 22),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 124, left: 2, right: 2),
              child: Center(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      widget._surahAyat.length == 7 ||
                              widget._surahAyat.length == 129
                          ? const Text("")
                          : const Basmala(),
                      const SizedBox(
                        height: 8,
                      ),
                      SurhWithTextSpan(
                        surhName: widget._surahName,
                        surahAyat: widget._surahAyat,
                        scrollController: _scrollController,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
