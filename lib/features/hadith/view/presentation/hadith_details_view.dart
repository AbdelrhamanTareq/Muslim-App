import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/errors/error_widget.dart';
import 'package:muslim_app/core/widgets/bookmark_widget.dart';
import 'package:muslim_app/features/hadith/view/logic/cubit/hadith_cubit.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../core/function.dart';
import '../../../../core/injection_container.dart';
import '../../../../core/utils/app_strings.dart';
import '../../data/local_data/hadith_local_data.dart';
import 'widgets/hadith_details_list_builder.dart';

class HadithDetailsView extends StatefulWidget {
  final String bookName;
  final String bookPath;
  const HadithDetailsView(
      {super.key, required this.bookName, required this.bookPath});

  @override
  State<HadithDetailsView> createState() => _HadithDetailsViewState();
}

class _HadithDetailsViewState extends State<HadithDetailsView> {
  final ItemScrollController itemScrollController = ItemScrollController();
  @override
  void initState() {
    BlocProvider.of<HadithCubit>(context).getHadithData(widget.bookPath);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.bookName),
        actions: [
          BookmarkWidget(
              scrollItemName: widget.bookName,
              onPressed: () {
                final bookmark = instance<HadithLocalData>()
                    .getHadithesBookmarkedNames(widget.bookName);
                if (bookmark == null || bookmark[0] != widget.bookName) {
                  showSnackBar(context, text: AppStrings.noBookmarkHadith);
                  return;
                }
                final double index = bookmark[1];
                itemScrollController.scrollTo(
                  index: index.toInt(),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              }),
          DropDownMenu(
            deletedBookmarkName: widget.bookName,
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<HadithCubit, HadithState>(
          builder: (context, state) {
            if (state is GetSahihElbokharyDataErrorState) {
              return AppErrorWidget(
                error: state.error,
              );
            } else if (state is GetSahihElbokharyDataSuccesState) {
              return HadithDetailsListBuilder(
                state: state,
                itemScrollController: itemScrollController,
                name: widget.bookName,
              );
            } else {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
          },
        ),
      ),
    );
  }
}

class DropDownMenu extends StatelessWidget {
  const DropDownMenu({
    super.key,
    required this.deletedBookmarkName,
  });

  final String deletedBookmarkName;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      position: PopupMenuPosition.under,
      itemBuilder: (context) => <PopupMenuItem>[
        PopupMenuItem(
          child: ElevatedButton.icon(
            onPressed: () async {
              bool val = await instance<HadithLocalData>()
                  .removeHadithBookmark(deletedBookmarkName);
              if (val) {
                showToast("تم حذف العلامة");
              } else {
                showToast("لا يوجد العلامة");
              }
            },
            icon: const Icon(Icons.delete_forever),
            label: Text("مسح العلامة"),
          ),
        ),
      ],
    );
  }
}
