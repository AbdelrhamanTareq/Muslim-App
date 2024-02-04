import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/constant/app_constatnt.dart';
import 'package:muslim_app/core/errors/error_widget.dart';
import 'package:muslim_app/core/widgets/bookmark_widget.dart';
import 'package:muslim_app/core/widgets/remove_bookmark_elevated_icon.dart';
import 'package:muslim_app/features/favorite/presentation/logic/cubit/favorite_cubit.dart';
import 'package:muslim_app/features/hadith/view/logic/cubit/hadith_cubit.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../core/functions.dart';
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
                  AppFunctions.showSnackBar(context,
                      text: AppStrings.noBookmarkHadith);
                  return;
                }
                final double index = bookmark[1];
                itemScrollController.scrollTo(
                  index: index.toInt(),
                  duration: const Duration(milliseconds: scrollDuration),
                  curve: curvesType,
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
              return BlocProvider<FavoriteCubit>(
                create: (context) => instance<FavoriteCubit>()
                // ..getFavHadithDataByBookName(name: widget.bookName)
                ,
                child: HadithDetailsListBuilder(
                  state: state,
                  itemScrollController: itemScrollController,
                  name: widget.bookName,
                ),
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
          child: RemoveBookmarkElevatedButton(onPressed: () async {
            bool val = await instance<HadithLocalData>()
                .removeHadithBookmark(deletedBookmarkName);
            AppFunctions.removeBookmark(val);
          }),
        ),
      ],
    );
  }
}
