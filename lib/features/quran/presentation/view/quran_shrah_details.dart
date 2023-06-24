import 'package:flutter/material.dart';
import 'package:muslim_app/core/themes/app_colors.dart';
import 'package:muslim_app/features/quran/data/models/quran.dart';

import 'widgets/basmala.dart';
import 'widgets/bookmark_widget.dart';
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
    ScrollController scrollController = ScrollController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.quranBackgroundAppBar,
        title: Text(widget._surahName),
        actions: [
          BookmarkWidget(
              surhName: widget._surahName, scrollController: scrollController),
        ],
      ),
      backgroundColor: AppColors.quranBackground,
      // backgroundColor: const Color(0xfffff8f3),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
        child: Center(
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                // surh el fatah or surh el tobah
                widget._surahAyat.length == 7 || widget._surahAyat.length == 129
                    ? const Text("")
                    : const Basmala(),
                const SizedBox(
                  height: 8,
                ),
                SurhWithTextSpan(
                  surhName: widget._surahName,
                  surahAyat: widget._surahAyat,
                  scrollController: scrollController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
