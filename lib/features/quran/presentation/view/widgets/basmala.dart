import 'package:flutter/material.dart';

class Basmala extends StatelessWidget {
  const Basmala({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ",
        style: TextStyle(
          height: 2,
          fontSize: 25,
          fontFamily: "me_quran",
          color: Color.fromARGB(196, 44, 44, 44),
        ),
      ),
    );
  }
}