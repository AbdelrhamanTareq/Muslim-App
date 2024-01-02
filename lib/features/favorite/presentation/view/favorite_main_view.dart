import 'package:flutter/material.dart';
import 'package:muslim_app/core/utils/app_assets.dart';
import 'package:muslim_app/core/utils/app_router.dart';

import '../../../../core/utils/app_strings.dart';
import 'widgets/favorite_container_widget.dart';

class FavoriteMainView extends StatelessWidget {
  const FavoriteMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.favorite,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            FavoriteItemContainer(
              text: AppStrings.favoriteHadith,
              iconPath: AppAssets.hadithSvgPath,
              routeName: Routes.favoritesHadith,
            ),
            SizedBox(
              height: 20,
            ),
            FavoriteItemContainer(
              text: AppStrings.favoriteZaker,
              iconPath: AppAssets.seb7aSvgPath,
              routeName: Routes.favoritesAzkar,
            ),
          ],
        ),
      ),
    );
  }
}
