import 'package:hive/hive.dart';

const String hadithHiveBox = "HADITH_BOX";

abstract class HadithLocalData {
  Future<void> setHadithesBookmarkedNames({
    required String key,
    required dynamic value,
  });

  getHadithesBookmarkedNames(String key);

  Future<bool> removeHadithBookmark(String key);
  Future<int> removeAllHadithBookmarks();
}

class HadithLocalDataImpl implements HadithLocalData {
  // set bookmark for hadith by using (hive box local data) and sotre hadith number as key and hadith data as value
  @override
  setHadithesBookmarkedNames({
    required String key,
    required dynamic value,
  }) async {
    await Hive.box(hadithHiveBox).put(key, value);
  }

  // get bookmark for hadith by using (hive box local data) and sotre hadith number as key and hadith data as value
  @override
  getHadithesBookmarkedNames(String key) {
    return Hive.box(hadithHiveBox).get(key);
  }

  @override
  Future<bool> removeHadithBookmark(String key) async {
    if (Hive.box(hadithHiveBox).isEmpty) return false;
    await Hive.box(hadithHiveBox).delete(key);
    return true;
  }

  @override
  Future<int> removeAllHadithBookmarks() async {
    return await Hive.box(hadithHiveBox).clear();
  }
}
