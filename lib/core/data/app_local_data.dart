import 'package:hive/hive.dart';

abstract class AppLocalData {
  Future<void> setBookmarkedNames(
      {required String key, required dynamic value});

  getBookmarkedNames(String key);
}

class AppLocalDataImpl extends AppLocalData {
  // final Box box ;

  // AppLocalDataImpl(this.box);
  @override
  setBookmarkedNames({required String key, required dynamic value}) async {
    await Hive.box("bookmarks").put(key, value);
  }

  @override
  getBookmarkedNames(String key) {
   return Hive.box("bookmarks").get(key);
  }
}
