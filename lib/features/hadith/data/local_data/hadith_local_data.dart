import 'package:hive/hive.dart';

const String hadithHiveBox = "HADITH_BOX";

abstract class HadithLocalData {
  Future<void> setHadithesBookmarkedNames({
    required String key,
    required dynamic value,
  });

  getHadithesBookmarkedNames(String key);
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
}
