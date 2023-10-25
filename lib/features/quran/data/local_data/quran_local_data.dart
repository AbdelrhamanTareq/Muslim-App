import 'package:hive/hive.dart';
import 'package:muslim_app/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String quranHiveBox = "QURAN_BOX";

abstract class QuranLocalData {
  Future<void> setQuranBookmarkedNames({
    required String key,
    required dynamic value,
  });
  getQuranBookmarkedNames(String key);

  Future<bool> removeQuranBookmark(String key);
  Future<int> removeAllQuranBookmarks();

  String getLastReadQuranSurh();
  Future<bool> setLastReadQuranSurh(String name);

  int getLastReadQuranSurhIndex();
  Future<bool> setLastReadQuranSurhIndex(int index);

  double getQuranTextSize();
  Future<bool> setQuranTextSize(double value);
}

class QuranLocalDataImpl extends QuranLocalData {
  static const String quranTextSizeKey = "QURAN_TEXT_SIZE_1";
  static const String lastReadKey = "LAST_READ_KEY";
  static const String lastReadIndexKey = "LAST_READ_INDEX_KEY";

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
  Future<bool> removeQuranBookmark(String key) async {
    if (Hive.box(quranHiveBox).isEmpty) return false;
    await Hive.box(quranHiveBox).delete(key);
    return true;
  }

  @override
  Future<int> removeAllQuranBookmarks() async {
    return await Hive.box(quranHiveBox).clear();
  }

  @override
  String getLastReadQuranSurh() {
    return _sharedPreferences.getString(lastReadKey) ?? AppStrings.noLastRead;
  }

  @override
  Future<bool> setLastReadQuranSurh(String name) async {
    return await _sharedPreferences.setString(lastReadKey, name);
  }

  @override
  int getLastReadQuranSurhIndex() {
    return _sharedPreferences.getInt(lastReadIndexKey) ?? 0;
  }

  @override
  Future<bool> setLastReadQuranSurhIndex(int index) async {
    return await _sharedPreferences.setInt(lastReadIndexKey, index);
  }
}
