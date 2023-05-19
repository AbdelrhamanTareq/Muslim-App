import 'package:shared_preferences/shared_preferences.dart';

abstract class QuranLocalData {
  setBookmark(double value);
  double? getBookmark();
}

class QuranLocalDataImpl extends QuranLocalData {
  final SharedPreferences _sharedPreferences;

  QuranLocalDataImpl(this._sharedPreferences);
  @override
  double? getBookmark() {
    return _sharedPreferences.getDouble("bookmark");
  }

  @override
  setBookmark(double value) async {
    return await _sharedPreferences.setDouble("bookmark", value);
  }
}
