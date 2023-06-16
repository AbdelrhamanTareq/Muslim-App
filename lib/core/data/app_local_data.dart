import 'package:hive/hive.dart';
import 'package:muslim_app/features/prayer_time/data/models/prayer_time.dart';

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
}

class AppLocalDataImpl extends AppLocalData {
  // final Box box ;

  // AppLocalDataImpl(this.box);
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
    print(Hive.box(prayerTimesKey).keys.first);
    final data = Hive.box(prayerTimesKey).toMap();

    Map<int, Timings> mappedData =
        data.map((key, value) => MapEntry(int.parse(key), value));
    print(mappedData);
    return mappedData;
  }

  @override
  Future<void> setPrayerTimesData({required String key, required value}) async {
    return await Hive.box(prayerTimesKey).put(key, value);
  }
}
