import 'package:flutter/material.dart';

class SurhWidget extends StatelessWidget {
  const SurhWidget({
    super.key,
    // required ScrollController scrollController,
    required this.surhText,
  }) : super();
  // :
  // _scrollController = scrollController;

  // final ScrollController _scrollController;
  final String surhText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        // final tapPostion = details.globalPosition;
        // final x = tapPostion.dx;
        // final y = tapPostion.dy;
        // print("x = $x ----- y = $y");
        // print("offset ${_scrollController.offset}");
      },
      child: Text(
        surhText, //mushaf mode
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        // style: const TextStyle(
        //   height: 2,
        //   fontSize: 25,
        //   fontFamily: "me_quran",
        //   color: Color.fromARGB(196, 44, 44, 44),
        // ),
      ),
    );
  }
}
