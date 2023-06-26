import 'package:flutter/material.dart';
import 'package:muslim_app/core/function.dart';

import '../../../../../core/data/app_local_data.dart';
import '../../../../../core/injection_container.dart';

class BookmarkWidget extends StatelessWidget {
  const BookmarkWidget({
    super.key,
    required this.surhName,
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  final String surhName;

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    final appBarHight = AppBar().preferredSize.height;

    print(appBarHight);

    return IconButton(
      onPressed: () {
        final bookmark = instance<AppLocalData>().getBookmarkedNames(surhName);
        if (bookmark == null || bookmark[0] != surhName) {
          showSnackBar(context);
          return;
        }
        final double position = bookmark[1];
        _scrollController.animateTo(position - appBarHight - 80,
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      },
      icon: const Icon(
        Icons.bookmark,
        size: 30,
      ),
    );
  }
}
