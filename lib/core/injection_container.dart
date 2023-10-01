import 'package:get_it/get_it.dart';
import 'package:muslim_app/core/data/app_local_data.dart';
import 'package:muslim_app/features/app_drawer/data/local_data/app_drawer_local_data.dart';
import 'package:muslim_app/features/azkar/data/repo/azkar_repo.dart';
import 'package:muslim_app/features/azkar/presentation/logic/cubit/all_azkar_cubit.dart';
import 'package:muslim_app/features/azkar/presentation/logic/cubit/main_azkar_cubit.dart';
import 'package:muslim_app/features/hadith/data/repo/hadith_reop.dart';
import 'package:muslim_app/features/hadith/view/logic/cubit/hadith_cubit.dart';
import 'package:muslim_app/features/prayer_time/data/local_data/prayer_time_local_data.dart';
import 'package:muslim_app/features/prayer_time/data/network/prayer_times_api.dart';
import 'package:muslim_app/features/prayer_time/data/repo/prayer_time_repo.dart';
import 'package:muslim_app/features/prayer_time/presentation/logic/cubit/prayer_time_cubit.dart';
import 'package:muslim_app/features/quran/data/local_data/quran_local_data.dart';
import 'package:muslim_app/features/quran/data/repo/quran_repo.dart';
import 'package:muslim_app/features/sebha/presentation/logic/cubit/sebha_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/app_drawer/presentation/logic/cubit/app_drawer_cubit.dart';
import '../features/prayer_time/data/network/dio_factory.dart';
import '../features/quran/presentation/logic/cubit/quran_cubit/quran_cubit.dart';
import '../features/quran/presentation/logic/cubit/quran_settings_cubit/quran_settings_cubit.dart';

final GetIt instance = GetIt.instance;

Future<void> initGetIt() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  instance.registerLazySingleton<DioFactory>(() => DioFactory());

  final dio = await instance<DioFactory>().initDio();

  instance.registerLazySingleton<QuranLocalData>(
      () => QuranLocalDataImpl(sharedPreferences));

  instance.registerLazySingleton<AzkarRepo>(() => AzkarRepoImpl());

  instance.registerLazySingleton<HadithRepo>(() => HadithRepoImpl());

  instance.registerLazySingleton<QuranRepo>(() => QuranRepoImpl());

  instance.registerLazySingleton<PrayerTimeLocalDate>(
    () => PrayerTimeLocalDateImpl(
      instance(),
    ),
  );

  instance.registerLazySingleton<PrayerTimeRepo>(
    () => PrayerTimeRepoImpl(
      instance(),
      instance(),
    ),
  );

  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  instance.registerFactory<QuranCubit>(
    () => QuranCubit(
      instance(),
    ),
  );

  

  instance.registerFactory<QuranSettingsCubit>(
    () => QuranSettingsCubit(
      instance(),
    ),
  );

  instance.registerFactory<HadithCubit>(
    () => HadithCubit(
      instance(),
    ),
  );

  instance.registerFactory<MainAzkarCubit>(
    () => MainAzkarCubit(
      instance(),
    ),
  );
  instance.registerFactory<AllAzkarCubit>(
    () => AllAzkarCubit(
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

  instance.registerFactory<AppDrawerCubit>(
    () => AppDrawerCubit(instance()),
  );

  //final Box box = await Hive.openBox("data");
  instance.registerLazySingleton<AppLocalData>(
      () => AppLocalDataImpl(sharedPreferences));

  instance.registerLazySingleton<AppDrawerLocalData>(
      () => AppDrawerLocalDataImpl(sharedPreferences));
}
