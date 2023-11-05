import 'package:shared_preferences/shared_preferences.dart';

abstract class AppLocalData {
  Future<bool> setPrayerTimesSound({required List<String> data});
  List<bool> getPrayerTimesSound();

  Future<bool> setIsFirstTime({required String key});
  bool getIsFirstTime({required String key});
}

const String prayerTimesSoundKey = "PRAYER_TIMES_SOUND";
const String mainFirstTimeKey = "MAIN_FIRST_TIME";

class AppLocalDataImpl extends AppLocalData {
  // final Box box ;

  // AppLocalDataImpl(this.box);

  final SharedPreferences _sharedPreferences;

  AppLocalDataImpl(this._sharedPreferences);

  @override
  List<bool> getPrayerTimesSound() {
    List<bool> data = [];
    final savedList =
        _sharedPreferences.getStringList(prayerTimesSoundKey) ?? [];
    for (var element in savedList) {
      if (element == "1") {
        data.add(true);
      } else {
        data.add(false);
      }
    }
    return data;
  }

  @override
  Future<bool> setPrayerTimesSound({required List<String>? data}) async {
    if (data == null || data.isEmpty) {
      data = [
        "1",
        "1",
        "1",
        "1",
        "1",
      ];
    }
    return await _sharedPreferences.setStringList(prayerTimesSoundKey, data);
  }

  @override
  Future<bool> setIsFirstTime({required String key}) async {
    return await _sharedPreferences.setBool(key, true);
  }

  @override
  bool getIsFirstTime({required String key}) {
    return _sharedPreferences.getBool(key) ?? false;
  }
}
