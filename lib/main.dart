import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:muslim_app/core/functions.dart';
import 'package:muslim_app/core/utils/app_notifications.dart';
import 'package:muslim_app/features/prayer_time/data/models/prayer_time.dart';
import 'package:muslim_app/features/quran/data/local_data/quran_local_data.dart';
import 'features/hadith/data/models/hadith.dart';

import 'app.dart';
import 'core/bloc_observer.dart';
import 'core/constant/app_constatnt.dart';
import 'core/injection_container.dart';
import 'features/favorite/data/models/fav_hadith_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initGetIt();
  // initialize Hive
  await Hive.initFlutter();
  // open hadith boxes
  await openHadithBoxes();
  // open quran box
  await Hive.openBox(quranHiveBox);
  // open fav box
  await Hive.openBox(favoriteKey);
  await AppNotification().initialize();
  Hive.registerAdapter(TimingsAdapter());
  Hive.registerAdapter(FavHadithModelAdapter());
  Hive.registerAdapter(HadithAdapter());
  await Hive.openBox(prayerTimesKey);
  await Hive.openBox(hadithKey);
  Bloc.observer = MyBlocObserver();
  AppFunctions.getPrayerTimesSoundsStateFirstTime();
  runApp(const MyApp());
}
