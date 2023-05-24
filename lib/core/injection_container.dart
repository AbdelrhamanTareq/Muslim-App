import 'package:get_it/get_it.dart';
import 'package:muslim_app/features/hadith/data/repo/hadith_reop.dart';
import 'package:muslim_app/features/hadith/view/logic/cubit/hadith_cubit.dart';
import 'package:muslim_app/features/quran/data/local_data/quran_local_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt instance = GetIt.instance;

Future<void> initGetIt() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  instance.registerLazySingleton<QuranLocalData>(
      () => QuranLocalDataImpl(sharedPreferences));

  instance.registerLazySingleton<HadithRepo>(() => HadithRepoImpl());

  instance.registerFactory<HadithCubit>(
    () => HadithCubit(
      instance(),
    ),
  );
}
