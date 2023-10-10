import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String quranHiveBox = "QURAN_BOX";

abstract class QuranLocalData {
  // setBookmark({required double value, required String key});
  // double? getBookmark(String key);
  // setBookMarkedName({required String name, required String key});
  // String? getBookMarkedName(String key);

  Future<void> setQuranBookmarkedNames({
    required String key,
    required dynamic value,
  });

  getQuranBookmarkedNames(String key);

  Future<void> removeQuranBookmark(String key);
  Future<int> removeAllQuranBookmarks();

  double getQuranTextSize();
  Future<bool> setQuranTextSize(double value);
}

class QuranLocalDataImpl extends QuranLocalData {
  static const String quranTextSizeKey = "QURAN_TEXT_SIZE_1";

  final SharedPreferences _sharedPreferences;

  QuranLocalDataImpl(this._sharedPreferences);

  // @override
  // String? getBookMarkedName(String key) {
  //   return _sharedPreferences.getString(key);
  // }

  // @override
  // setBookMarkedName({required String name, required String key}) async {
  //   return await _sharedPreferences.setString(key, name);
  // }

  // EDITED
  @override
  double getQuranTextSize() {
    return _sharedPreferences.getDouble(quranTextSizeKey) ?? 25.0;
  }

  @override
  Future<bool> setQuranTextSize(double value) async {
    return await _sharedPreferences.setDouble(quranTextSizeKey, value);
  }

  @override
  getQuranBookmarkedNames(String key) {
    return Hive.box(quranHiveBox).get(key);
  }

  @override
  Future<void> setQuranBookmarkedNames(
      {required String key, required value}) async {
    await Hive.box(quranHiveBox).put(key, value);
  }

  @override
  Future<void> removeQuranBookmark(String key) async {
    return await Hive.box(quranHiveBox).delete(key);
  }

  @override
  Future<int> removeAllQuranBookmarks()async {
    return await Hive.box(quranHiveBox).clear();
  }
}
