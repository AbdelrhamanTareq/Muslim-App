import 'package:flutter/material.dart';
import 'package:muslim_app/core/functions.dart';
import 'package:muslim_app/core/themes/app_colors.dart';
import 'package:muslim_app/core/utils/app_extensions.dart';
import 'package:muslim_app/core/utils/app_strings.dart';
import 'package:muslim_app/features/favorite/data/local%20data/favorites_local_data.dart';
import 'package:muslim_app/features/favorite/data/models/fav_hadith_model.dart';
import 'package:muslim_app/features/hadith/data/local_data/hadith_local_data.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../core/injection_container.dart';
import '../../logic/cubit/hadith_cubit.dart';

class HadithDetailsListBuilder extends StatelessWidget {
  final GetSahihElbokharyDataSuccesState state;
  const HadithDetailsListBuilder({
    super.key,
    required this.state,
    required this.itemScrollController,
    required this.name,
  });

  final ItemScrollController itemScrollController;
  final String name;

  @override
  Widget build(BuildContext context) {
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
                        state.data[index].number.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      color: AppColors.black,
                      onPressed: () {
                        instance<HadithLocalData>().setHadithesBookmarkedNames(
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
                    IconButton(
                      color: AppColors.favColor,
                      onPressed: () async {
                        await instance<FavoritesLocalData>()
                            .setFavHadithLocalData(
                          val: 
                          FavHadithModel(
                            hadithData: data[index].arab,
                            hadithBook: name,
                            hadithNumber: data[index].number,
                          ),
                        );
                      },
                      icon: const Icon(Icons.favorite_border),
                    ),
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
  }
}
