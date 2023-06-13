import 'package:get_it/get_it.dart';
import 'package:muslim_app/core/data/app_local_data.dart';
import 'package:muslim_app/features/hadith/data/repo/hadith_reop.dart';
import 'package:muslim_app/features/hadith/view/logic/cubit/hadith_cubit.dart';
import 'package:muslim_app/features/prayer_time/data/local_data/prayer_time_local_data.dart';
import 'package:muslim_app/features/prayer_time/data/network/app_api.dart';
import 'package:muslim_app/features/prayer_time/data/repo/prayer_time_repo.dart';
import 'package:muslim_app/features/prayer_time/presentation/logic/cubit/prayer_time_cubit.dart';
import 'package:muslim_app/features/quran/data/local_data/quran_local_data.dart';
import 'package:muslim_app/features/sebha/presentation/logic/cubit/sebha_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/prayer_time/data/network/dio_factory.dart';

final GetIt instance = GetIt.instance;

Future<void> initGetIt() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  instance.registerLazySingleton<DioFactory>(() => DioFactory());

  final dio = await instance<DioFactory>().initDio();

  instance.registerLazySingleton<QuranLocalData>(
      () => QuranLocalDataImpl(sharedPreferences));

  instance.registerLazySingleton<HadithRepo>(() => HadithRepoImpl());
  instance.registerLazySingleton<PrayerTimeLocalDate>(
    () => PrayerTimeLocalDateImpl(),
  );
  instance.registerLazySingleton<PrayerTimeRepo>(
    () => PrayerTimeRepoImpl(
      instance(),
      instance(),
    ),
  );
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  instance.registerFactory<HadithCubit>(
    () => HadithCubit(
      instance(),
    ),
  );
  instance.registerFactory<SebhaCubit>(
    () => SebhaCubit(),
  );
  instance.registerFactory<PrayerTimeCubit>(
    () => PrayerTimeCubit(
      instance(),
    ),
  );
  //final Box box = await Hive.openBox("data");
  instance.registerLazySingleton<AppLocalData>(() => AppLocalDataImpl());
}
