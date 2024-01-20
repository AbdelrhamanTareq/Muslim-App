import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:muslim_app/features/favorite/data/models/fav_hadith_model.dart';

import '../../../../core/constant/app_constatnt.dart';

abstract class FavoritesLocalData {
  setFavHadithLocalData({required FavHadithModel val});
  FavHadithModel? getFavHadithLocalData();
  setFavZakerLocalData();
  getFavZakerLocalData();
}

class FavoritesLocalDataImpl implements FavoritesLocalData {
  static const _favHadithKey = "FAV_HADITH";

  @override
  setFavHadithLocalData({required FavHadithModel val}) async {
    return await Hive.box(favoriteKey).put(UniqueKey().toString(), val);
  }

  @override
  FavHadithModel? getFavHadithLocalData() {
    return Hive.box(favoriteKey).get(_favHadithKey) ?? null;
  }

  @override
  setFavZakerLocalData() {
    // TODO: implement setFavZakerLocalData
    throw UnimplementedError();
  }

  @override
  getFavZakerLocalData() {
    // TODO: implement getFavZakerLocalData
    throw UnimplementedError();
  }
}
