import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:hive/hive.dart';
import 'package:muslim_app/features/prayer_time/data/models/prayer_time.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/app_constatnt.dart';

abstract class AppLocalData {
  Future<void> setBookmarkedNames({
    required String key,
    required dynamic value,
  });

  getBookmarkedNames(String key);
  Future<void> setPrayerTimesData({
    required String key,
    required dynamic value,
  });

  Map<int, Timings> getPrayerTimesDataMap();
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
}

const String latLongKey = "LAT_LONG";
const String addressKey = "ADDRESS";
const String cityKey = "CITY";
const String countryKey = "COUNTRY";
const String methodesKey = "METHODES";

class AppLocalDataImpl extends AppLocalData {
  // final Box box ;

  // AppLocalDataImpl(this.box);

  final SharedPreferences _sharedPreferences;

  AppLocalDataImpl(this._sharedPreferences);
  @override
  setBookmarkedNames({required String key, required dynamic value}) async {
    await Hive.box(bookmarksKey).put(key, value);
  }

  @override
  getBookmarkedNames(String key) {
    return Hive.box(bookmarksKey).get(key);
  }

  @override
  Map<int, Timings> getPrayerTimesDataMap() {
    //print(Hive.box(prayerTimesKey).keys.first);
    final data = Hive.box(prayerTimesKey).toMap();

    Map<int, Timings> mappedData =
        data.map((key, value) => MapEntry(int.parse(key), value));
    // print(mappedData);
    return mappedData;
  }

  @override
  Future<void> setPrayerTimesData({required String key, required value}) async {
    return await Hive.box(prayerTimesKey).put(key, value);
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
}
