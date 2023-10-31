import 'package:flutter/material.dart';
import 'package:muslim_app/core/functions.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../logic/cubit/quran_cubit/quran_cubit.dart';

class AllSurhsList extends StatelessWidget {
  const AllSurhsList({
    Key? key,
    required this.state,
    required this.scrollController,
  }) : super(key: key);

  final QuranGetAllDataSucces state;
  final ItemScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    var data = state.data;
    return ScrollablePositionedList.separated(
      itemScrollController: scrollController,
      itemCount: data.length,
      itemBuilder: (context, index) {
        var bodyMedium2 = Theme.of(context).textTheme.bodyMedium!
            // .copyWith(color: AppColors.black)
            ;
        var listData = data[index];
        return Container(
          padding: const EdgeInsets.all(8.0),
          // color: (index % 2 == 0)
          //     ? AppColors.quranBackground
          //     : AppColors.quranBackgroundAppBar,
          child: InkWell(
            onTap: () {
              AppFunctions.navToOtherSurhaWithoutReplace(context, index: index, data: data);
            },
            child: ListTile(
              leading: Text(
                "${index + 1}) ${listData.name}",
                style: bodyMedium2,
              ),
              trailing: FittedBox(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(AppStrings.noOfAyat, style: bodyMedium2),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          listData.array.length.toString(),
                          style: bodyMedium2,
                        )
                      ],
                    ),
                    Text(
                      (listData.type).toString(),
                      style: bodyMedium2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
