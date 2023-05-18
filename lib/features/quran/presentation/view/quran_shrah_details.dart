import 'package:flutter/material.dart';
import 'package:muslim_app/features/quran/data/models/quran.dart';

import '../../../../core/function.dart';
import 'widgets/basmala.dart';
import 'widgets/surh.dart';

class QuranSurahDetails extends StatelessWidget {
  final List<Array> _surahAyat;

  const QuranSurahDetails(
    this._surahAyat, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String surhText = "";

    for (var element in _surahAyat) {
      surhText +=
          "${element.ar}\uFD3F${convertToArabicNumbers(element.id)}\uFD3E";
    }

    ScrollController _scrollController = ScrollController();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 252, 206),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment:
            _surahAyat.length < 20 ? Alignment.center : Alignment.topCenter,
        padding: _surahAyat.length < 20
            ? EdgeInsets.zero
            : const EdgeInsets.symmetric(vertical: 40, horizontal: 8),
        child: ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          controller: _scrollController,
          children: [
            Row(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    _surahAyat.length == 7 || _surahAyat.length == 129
                        ? const Text("")
                        : const Basmala(),
                    const SizedBox(
                      height: 8,
                    ),
                    SurhWidget(
                        scrollController: _scrollController,
                        surhText: surhText),
                  ],
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
