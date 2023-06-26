import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../../core/data/app_local_data.dart';
import '../../../../../core/function.dart';
import '../../../../../core/injection_container.dart';
import '../../../../../core/utils/app_strings.dart';

class HadithBookmarkWidget extends StatelessWidget {
  const HadithBookmarkWidget({
    super.key,
    required ItemScrollController itemScrollController,
    required String bookName,
  })  : _itemScrollController = itemScrollController,
        _bookName = bookName;

  final ItemScrollController _itemScrollController;
  final String _bookName;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.bookmark,
      ),
      onPressed: () {
        final bookmark = instance<AppLocalData>().getBookmarkedNames(_bookName);
        if (bookmark == null || bookmark[0] != _bookName) {
          showSnackBar(context, text: AppStrings.noBookmarkHadith);
          return;
        }
        final double index = bookmark[1];
        _itemScrollController.scrollTo(
          index: index.toInt(),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      },
    );
  }
}
