import 'package:flutter/material.dart';

class Basmala extends StatelessWidget {
  const Basmala({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  Text(
        "بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ",
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}
