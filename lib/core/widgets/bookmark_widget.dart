import 'package:flutter/material.dart';

class BookmarkWidget extends StatelessWidget {
  const BookmarkWidget({
    super.key,
    required this.scrollItemName,
    // required this.scrollController,
    required this.onPressed,
  });

  final String scrollItemName;

  // final ScrollController scrollController;

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    // final appBarHight = AppBar().preferredSize.height;

    // print(appBarHight);

    return IconButton(
      onPressed: () {
        onPressed();
        // final bookmark =
        //     instance<QuranLocalData>().getQuranBookmarkedNames(surhName);
        // if (bookmark == null || bookmark[0] != surhName) {
        //   showSnackBar(context);
        //   return;
        // }
        // final double position = bookmark[1];
        // _scrollController.animateTo(position - appBarHight - 80,
        //     duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      },
      icon: const Icon(
        Icons.bookmark,
        size: 30,
      ),
    );
  }
}
