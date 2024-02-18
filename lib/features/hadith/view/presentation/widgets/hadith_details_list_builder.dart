import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/functions.dart';
import 'package:muslim_app/core/themes/app_colors.dart';
import 'package:muslim_app/core/utils/app_extensions.dart';
import 'package:muslim_app/core/utils/app_strings.dart';

import 'package:muslim_app/features/hadith/data/local_data/hadith_local_data.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../core/injection_container.dart';
import '../../logic/cubit/hadith_cubit.dart';

class HadithDetailsListBuilder extends StatelessWidget {
  const HadithDetailsListBuilder({
    super.key,
    // required this.state,
    required this.itemScrollController,
    required this.name,
    required this.bookPathInDB,
  });

  // final HadithState state;
  final ItemScrollController itemScrollController;
  final String name;
  final String bookPathInDB;

  // List<FavHadithModel> favHaditdata = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HadithCubit, HadithState>(builder: (context, state) {
      var data = state.data;
      return ScrollablePositionedList.separated(
        itemScrollController: itemScrollController,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.grey,
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            // color: Color.fromARGB(255, 9, 109, 12),
                            color: AppColors.green),
                        child: Text(
                          data[index].number.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        color: AppColors.black,
                        onPressed: () {
                          instance<HadithLocalData>()
                              .setHadithesBookmarkedNames(
                                  key: name, value: [name, index.toDouble()]);
                          AppFunctions.showToast(AppStrings.addedBookmark);
                        },
                        icon: const Icon(Icons.bookmark),
                      ),
                      IconButton(
                        color: AppColors.indigo,
                        onPressed: () {
                          Share.share(data[index].arab);
                        },
                        icon: const Icon(Icons.share),
                      ),
                      BlocBuilder<HadithCubit, HadithState>(
                          builder: (context, state) {
                        final favData = state.fav;
                        return IconButton(
                          color: (favData.isNotEmpty &&
                                  favData[data[index].number] != false)
                              ? AppColors.favColor
                              : AppColors.black,
                          onPressed: () async {
                            BlocProvider.of<HadithCubit>(context)
                                .addOrRemvoeFavorite(
                                    number: data[index].number,
                                    bookPathInDB: bookPathInDB,
                                    newdata: data[index]);
                            // String key =
                            //     "${widget.name + data[index].number.toString()}";
                            // (favData.isNotEmpty &&
                            //         favData.contains(data[index].arab))
                            //     ? instance<FavoritesLocalData>()
                            //         .deleteFavHadithLocalData(key: key)
                            //     : instance<FavoritesLocalData>()
                            //         .setFavHadithLocalData(
                            //         key: key,
                            //         val: FavHadithModel(
                            //           key: key,
                            //           hadithData: data[index].arab,
                            //           hadithBook: widget.name,
                            //           hadithNumber: data[index].number,
                            //         ),
                            //       );
                            // setState(() {});
                          },
                          icon: (favData.isNotEmpty &&
                                  favData[data[index].number] != false)
                              ? const Icon(Icons.favorite)
                              : const Icon(Icons.favorite_border),
                        );
                      }),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  data[index].arab,
                  style: context.displayMedium!
                      .copyWith(color: context.blackLightColor),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, i) => const Divider(
          height: 2,
        ),
        itemCount: data.length,
      );
    });
  }
}
