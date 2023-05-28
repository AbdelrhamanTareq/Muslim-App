import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/data/app_local_data.dart';
import 'package:muslim_app/core/injection_container.dart';
import 'package:muslim_app/features/hadith/view/logic/cubit/hadith_cubit.dart';
import 'package:muslim_app/features/quran/data/local_data/quran_local_data.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'widgets/hadith_details_list_builder.dart';

class HadithDetailsView extends StatefulWidget {
  final String hadihPath;
  const HadithDetailsView({super.key, required this.hadihPath});

  @override
  State<HadithDetailsView> createState() => _HadithDetailsViewState();
}

class _HadithDetailsViewState extends State<HadithDetailsView> {
  final ItemScrollController _itemScrollController = ItemScrollController();
  @override
  void initState() {
    BlocProvider.of<HadithCubit>(context)
        .getSahihElbokharyData(widget.hadihPath);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("صحيح البخاري"),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.bookmark,
            ),
            onPressed: () {
              final bookmark = instance<AppLocalData>()
                      .getBookmarkedNames(widget.hadihPath) ??
                  [];
              if (bookmark[0] != widget.hadihPath) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("لا يوجد علامة"),
                  ),
                );
                return;
              }
              final double index = bookmark[1];
              _itemScrollController.scrollTo(
                  index: index.toInt(),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn);
              // final bookName =
              // instance<AppLocalData>()
              //         .getBookmarkedNames(widget.hadihPath) ??
              //     "";
              // // instance<QuranLocalData>()
              // //         .getBookMarkedName("HADITH_BOOKMARKED_NAME") ??
              // //     "";
              // if (bookName == "" || bookName != widget.hadihPath) {
              //   ScaffoldMessenger.of(context).showSnackBar(
              //     const SnackBar(
              //       content: Text("لا يوجد علامة"),
              //     ),
              //   );
              //   return;
              // }
              // final double index =
              //     instance<QuranLocalData>().getBookmark("HADITH_BOOKMARK") ??
              //         -1;
              // _itemScrollController.scrollTo(
              //     index: index.toInt(),
              //     duration: const Duration(milliseconds: 300),
              //     curve: Curves.easeIn);
            },
          )
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<HadithCubit, HadithState>(
          builder: (context, state) {
            if (state is GetSahihElbokharyDataErrorState) {
              return Center(
                child: Text(state.error),
              );
            } else if (state is GetSahihElbokharyDataSuccesState) {
              return HadithDetailsListBuilder(
                state: state,
                itemScrollController: _itemScrollController,
                name: widget.hadihPath,
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
