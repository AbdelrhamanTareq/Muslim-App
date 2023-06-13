import 'package:muslim_app/features/prayer_time/data/local_data/cached_item.dart';
import 'package:muslim_app/features/prayer_time/data/models/prayer_time.dart';

const String cachedPrayerTimeKey = "CACHED_PRAYER_TIME_KEY";

abstract class PrayerTimeLocalDate {
  Future<void> setMonthPrayerTimesLocalData(PrayerTime prayerTime);
  PrayerTime getMonthPrayerTimesLocalData();
}

class PrayerTimeLocalDateImpl extends PrayerTimeLocalDate {
  static const int _cachedTime = 24 * 60 * 60; // every month

  Map<String, dynamic> _cachedData = {};

  @override
  PrayerTime getMonthPrayerTimesLocalData() {
    CachedItem? cachedItem = _cachedData[cachedPrayerTimeKey];
    if (cachedItem != null && cachedItem.isValid(_cachedTime)) {
      return cachedItem.data;
    } else {
      throw "errer";
    }
  }

  @override
  Future<void> setMonthPrayerTimesLocalData(PrayerTime prayerTime) async {
    _cachedData[cachedPrayerTimeKey] = CachedItem(prayerTime);
  }
}
