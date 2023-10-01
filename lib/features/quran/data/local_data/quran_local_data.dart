import 'package:shared_preferences/shared_preferences.dart';

abstract class QuranLocalData {
  setBookmark({required double value, required String key});
  double? getBookmark(String key);
  setBookMarkedName({required String name, required String key});
  String? getBookMarkedName(String key);

  
  double getQuranTextSize();
  Future<bool> setQuranTextSize(double value);
}

class QuranLocalDataImpl extends QuranLocalData {
  static const String quranTextSizeKey = "QURAN_TEXT_SIZE_1";

  final SharedPreferences _sharedPreferences;

  QuranLocalDataImpl(this._sharedPreferences);
  @override
  double? getBookmark(String key) {
    return _sharedPreferences.getDouble(key);
  }

  @override
  setBookmark({required double value, required String key}) async {
    return await _sharedPreferences.setDouble(key, value);
  }

  @override
  String? getBookMarkedName(String key) {
    return _sharedPreferences.getString(key);
  }

  @override
  setBookMarkedName({required String name, required String key}) async {
    return await _sharedPreferences.setString(key, name);
  }

  // EDITED
  @override
  double getQuranTextSize() {
    return _sharedPreferences.getDouble(quranTextSizeKey) ?? 25.0;
  }

  @override
  Future<bool> setQuranTextSize(double value) async {
    return await _sharedPreferences.setDouble(quranTextSizeKey, value);
  }
}
