import 'package:flutter/material.dart';
import 'package:muslim_app/core/utils/texts_styles.dart';

class Basmala extends StatelessWidget {
  const Basmala({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ",
        style: AppTextsStyle.quranTextStyle,
      ),
    );
  }
}