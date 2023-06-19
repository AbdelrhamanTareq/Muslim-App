import 'package:muslim_app/core/data/app_local_data.dart';
import 'package:muslim_app/features/prayer_time/data/local_data/cached_item.dart';
import 'package:muslim_app/features/prayer_time/data/models/prayer_time.dart';

const String cachedPrayerTimeKey = "CACHED_PRAYER_TIME_KEY";

abstract class PrayerTimeLocalDate {
  Future<void> setMonthPrayerTimesCacheData(PrayerTime prayerTime);
  PrayerTime getMonthPrayerTimesCacheData();

  Future<void> setMonthPrayerTimesLocalData(
      {required dynamic prayerTimes, required String key});
  Map<int, Timings> getMonthPrayerTimesLocalDataMap();
}

class PrayerTimeLocalDateImpl extends PrayerTimeLocalDate {
  final AppLocalData _appLocalData;

  static const int _cachedTime = 10 * 60; // every 10 minutes

  Map<String, dynamic> _cachedData = {};

  PrayerTimeLocalDateImpl(this._appLocalData);

  @override
  PrayerTime getMonthPrayerTimesCacheData() {
    CachedItem? cachedItem = _cachedData[cachedPrayerTimeKey];
    if (cachedItem != null && cachedItem.isValid(_cachedTime)) {
      return cachedItem.data;
    } else {
      throw "errer";
    }
  }

  @override
  Future<void> setMonthPrayerTimesCacheData(PrayerTime prayerTime) async {
    _cachedData[cachedPrayerTimeKey] = CachedItem(prayerTime);
  }

  @override
  Map<int, Timings> getMonthPrayerTimesLocalDataMap() {
    return _appLocalData.getPrayerTimesDataMap();
  }

  @override
  Future<void> setMonthPrayerTimesLocalData(
      {required dynamic prayerTimes, required String key}) async {
    return _appLocalData.setPrayerTimesData(key: key, value: prayerTimes);
  }
}
