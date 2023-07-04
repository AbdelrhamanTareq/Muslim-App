import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/errors/error_widget.dart';
import 'package:muslim_app/features/hadith/view/logic/cubit/hadith_cubit.dart';
import 'package:muslim_app/features/hadith/view/presentation/widgets/hadith_bookmark_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

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
  final ItemScrollController _itemScrollController = ItemScrollController();
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
          HadithBookmarkWidget(
              bookName: widget.bookName,
              itemScrollController: _itemScrollController)
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
                itemScrollController: _itemScrollController,
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
