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
    return IconButton(
      onPressed: () {
        onPressed();
      },
      icon: const Icon(
        Icons.bookmark,
        size: 30,
      ),
    );
  }
}
