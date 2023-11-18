import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:hive/hive.dart';
import 'package:muslim_app/features/prayer_time/data/models/prayer_time.dart';
import 'package:muslim_app/features/prayer_time/presentation/view/widgets/prayer_country_picker_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constant/app_constatnt.dart';

const String cachedPrayerTimeKey = "CACHED_PRAYER_TIME_KEY";

abstract class PrayerTimeLocalDate {
  Future<void> setPrayerTimesData({
    required String key,
    required dynamic value,
  });
  Map<String, Timings> getPrayerTimesDataMap();

  Future<void> setMonthPrayerTimesLocalData(
      {required dynamic prayerTimes, required String key});
  Map<String, Timings> getMonthPrayerTimesLocalDataMap();
  Map<String, Timings> getMonthPrayerTimesLocalDataMap2();

  Future setLatAndLong({required double lat, required double long});
  List<String>? getLatAndLong();
  Future setAddress({required Map<String, dynamic> data});
  getAddress();
  Future setCity({required String data});
  String? getCity();
  Future setCountry({required String data});
  String? getCountry();

  Future setPrayerTimesMethoed({required int data});
  int? getPrayerTimesMethoed();

  Future<bool> setPrayerTimesDataGetterPeriod(String val);
  String getPrayerTimesDataGetterPeriod();
}

class PrayerTimeLocalDateImpl extends PrayerTimeLocalDate {
  static const String prayerTimeDataGetterPeriodKey =
      "PRAYER_TIME_DATA_GETTER_PERIOD";
  static const String latLongKey = "LAT_LONG";
  static const String addressKey = "ADDRESS";
  static const String cityKey = "CITY";
  static const String countryKey = "COUNTRY";
  static const String methodesKey = "METHODES";

  final SharedPreferences _sharedPreferences;

  // static const int _cachedTime = 10 * 60; // every 10 minutes

  // Map<String, dynamic> _cachedData = {};

  PrayerTimeLocalDateImpl(this._sharedPreferences);

  @override
  Future<void> setPrayerTimesData({required String key, required value}) async {
    return await Hive.box(prayerTimesKey).put(key, value);
  }

  @override
  Map<String, Timings> getPrayerTimesDataMap() {
    //print(Hive.box(prayerTimesKey).keys.first);
    final data = Hive.box(prayerTimesKey).toMap();

    // Map<int, Timings> mappedData =
    //     data.map((key, value) => MapEntry(int.parse(key), value));
    Map<String, Timings> mappedData =
        data.map((key, value) => MapEntry(key, value));
    // print(mappedData);
    // return mappedData;
    return mappedData;
  }

  @override
  Map<String, Timings> getMonthPrayerTimesLocalDataMap2() {
    final data = Hive.box(prayerTimesKey).toMap();

    Map<String, Timings> mappedData =
        data.map((key, value) => MapEntry(key, value));
    // print(mappedData);
    return mappedData;
  }

  @override
  Map<String, Timings> getMonthPrayerTimesLocalDataMap() {
    return getPrayerTimesDataMap();
  }

  @override
  Future<void> setMonthPrayerTimesLocalData({
    required dynamic prayerTimes,
    required String key,
  }) async {
    return setPrayerTimesData(key: key, value: prayerTimes);
  }

  @override
  List<String>? getLatAndLong() {
    //final data = _sharedPreferences.getStringList(latLongKey);
    return _sharedPreferences.getStringList(latLongKey);
  }

  @override
  Future setLatAndLong({required double lat, required double long}) async {
    return await _sharedPreferences.setStringList(
      latLongKey,
      [
        lat.toString(),
        long.toString(),
      ],
    );
  }

  @override
  getAddress() {
    final String? data = _sharedPreferences.getString(addressKey);
    if (data != null) {
      final map = jsonDecode(data);
      return Placemark.fromMap(map);
    } else {
      return null;
    }
  }

  @override
  Future setAddress({required Map<String, dynamic> data}) async {
    return await _sharedPreferences.setString(addressKey, jsonEncode(data));
  }

  @override
  String? getCity() {
    return _sharedPreferences.getString(cityKey);
  }

  @override
  String? getCountry() {
    return _sharedPreferences.getString(countryKey);
  }

  @override
  Future setCity({required String data}) async {
    return await _sharedPreferences.setString(cityKey, data);
  }

  @override
  Future setCountry({required String data}) async {
    return await _sharedPreferences.setString(countryKey, data);
  }

  @override
  int? getPrayerTimesMethoed() {
    return _sharedPreferences.getInt(methodesKey);
  }

  @override
  Future setPrayerTimesMethoed({required int data}) async {
    return await _sharedPreferences.setInt(methodesKey, data);
  }

  @override
  getPrayerTimesDataGetterPeriod() {
    return _sharedPreferences.getString(prayerTimeDataGetterPeriodKey) ??
        RadioChoice.monthly.name;
  }

  @override
  Future<bool> setPrayerTimesDataGetterPeriod(String val) async {
    return await _sharedPreferences.setString(
        prayerTimeDataGetterPeriodKey, val);
  }
}
