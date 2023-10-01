import 'package:shared_preferences/shared_preferences.dart';

abstract class AppDrawerLocalData {
  double getQuranTextSize();
  Future<bool> setQuranTextSize(double value);
  double getAppTextSize();
  Future<bool> setAppTextSize(double value);
}

class AppDrawerLocalDataImpl implements AppDrawerLocalData {
  final SharedPreferences _sharedPreferences;
  static const String quranTextSizeKey = "QURAN_TEXT_SIZE";
  static const String appTextSizeKey = "APP_TEXT_SIZE";

  AppDrawerLocalDataImpl(this._sharedPreferences);
  @override
  double getQuranTextSize() {
    return _sharedPreferences.getDouble(quranTextSizeKey) ?? 25.0;
  }

  @override
  Future<bool> setQuranTextSize(double value) async {
    return await _sharedPreferences.setDouble(quranTextSizeKey, value);
  }

  @override
  double getAppTextSize() {
    return _sharedPreferences.getDouble(appTextSizeKey) ?? 1;
  }

  @override
  Future<bool> setAppTextSize(double value) async {
    return await _sharedPreferences.setDouble(appTextSizeKey, value);
  }
}
