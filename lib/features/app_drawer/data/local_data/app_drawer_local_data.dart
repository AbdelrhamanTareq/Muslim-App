import 'package:shared_preferences/shared_preferences.dart';

abstract class AppDrawerLocalData {
  double getQuranTextSize();
  Future<bool> setQuranTextSize(double value);
  double getAppTextSize();
  Future<bool> setAppTextSize(double value);
  bool getAppTheme();
  Future<bool> setAppTheme(bool value);
}

class AppDrawerLocalDataImpl implements AppDrawerLocalData {
  final SharedPreferences _sharedPreferences;
  static const String _quranTextSizeKey = "QURAN_TEXT_SIZE";
  static const String _appTextSizeKey = "APP_TEXT_SIZE";
  static const String _appThemeKey = "APP_THEME";

  AppDrawerLocalDataImpl(this._sharedPreferences);
  @override
  double getQuranTextSize() {
    return _sharedPreferences.getDouble(_quranTextSizeKey) ?? 25.0;
  }

  @override
  Future<bool> setQuranTextSize(double value) async {
    return await _sharedPreferences.setDouble(_quranTextSizeKey, value);
  }

  @override
  double getAppTextSize() {
    return _sharedPreferences.getDouble(_appTextSizeKey) ?? 1;
  }

  @override
  Future<bool> setAppTextSize(double value) async {
    return await _sharedPreferences.setDouble(_appTextSizeKey, value);
  }

  @override
  bool getAppTheme() {
    return _sharedPreferences.getBool(_appThemeKey) ?? false;
  }

  @override
  Future<bool> setAppTheme(bool value) async {
    return await _sharedPreferences.setBool(_appThemeKey, value);
  }
}
