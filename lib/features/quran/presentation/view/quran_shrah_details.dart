
import 'package:flutter/material.dart';
import 'package:muslim_app/features/quran/data/models/quran.dart';

import 'widgets/basmala.dart';
import 'widgets/surh_with_text_span.dart';

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
  @override
  Widget build(BuildContext context) {
    // String surhText = "";

    // for (var element in widget._surahAyat) {
    //   surhText += "${element.ar}\uFD3F${(element.id).toArabicNumbers}\uFD3E";
    // }

    ScrollController _scrollController = ScrollController();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 252, 206),
      body: Padding(
        padding: const EdgeInsets.only(top: 24, left: 2, right: 2),
        child: Center(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                widget._surahAyat.length == 7 || widget._surahAyat.length == 129
                    ? const Text("")
                    : const Basmala(),
                const SizedBox(
                  height: 8,
                ),
                SurhWithTextSpan(
                  surahAyat: widget._surahAyat,
                  scrollController: _scrollController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
