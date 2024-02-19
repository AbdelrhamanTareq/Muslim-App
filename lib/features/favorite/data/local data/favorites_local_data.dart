import 'package:hive/hive.dart';
import 'package:muslim_app/features/favorite/data/models/fav_hadith_model.dart';

import '../../../../core/constant/app_constatnt.dart';

abstract class FavoritesLocalData {
  setFavHadithLocalData({required FavHadithModel val,required String key});
  deleteFavHadithLocalData({required String key});
  List<FavHadithModel> getFavHadithLocalData();
  List<FavHadithModel> getFavHadithBNameLocalData(String name);
  setFavZakerLocalData();
  getFavZakerLocalData();
}

class FavoritesLocalDataImpl implements FavoritesLocalData {
  // static const _favHadithKey = "FAV_HADITH";

  @override
  setFavHadithLocalData(
      {required FavHadithModel val, required String key}) async {
    return await Hive.box(favoriteKey).put(key, val);
  }

  @override
  deleteFavHadithLocalData({required  String key}) async {
    return await Hive.box(favoriteKey).delete(key);
  }

  @override
  List<FavHadithModel> getFavHadithLocalData() {
    List<FavHadithModel> data = [];
    Hive.box(favoriteKey).values.forEach((element) {
      data.add(element);
    });
    return data;
  }

  @override
  List<FavHadithModel> getFavHadithBNameLocalData(String name) {
    print("object");
    List<FavHadithModel> data = [];
    Hive.box(favoriteKey).values.forEach((element) {
      if (((element)).hadithBook == name) {
        data.add(element);
      }
    });
    return data;
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
