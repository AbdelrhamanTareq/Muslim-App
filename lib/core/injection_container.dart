import 'package:get_it/get_it.dart';
import 'package:muslim_app/features/quran/data/local_data/quran_local_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt instance = GetIt.instance;

Future<void> initGetIt() async {
  final  SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();

  instance.registerLazySingleton<QuranLocalData>(() => QuranLocalDataImpl(_sharedPreferences));
}