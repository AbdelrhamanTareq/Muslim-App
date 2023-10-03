import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:muslim_app/core/function.dart';
import 'package:muslim_app/core/utils/app_notifications.dart';
import 'package:muslim_app/features/hadith/data/local_data/hadith_local_data.dart';
import 'package:muslim_app/features/prayer_time/data/models/prayer_time.dart';
import 'package:muslim_app/features/quran/data/local_data/quran_local_data.dart';

import 'app.dart';
import 'core/bloc_observer.dart';
import 'core/constant/app_constatnt.dart';
import 'core/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initGetIt();
  // initialize Hive
  await Hive.initFlutter();
  // open hadith box
  await Hive.openBox(hadithHiveBox);
  // open quran box
  await Hive.openBox(quranHiveBox);
  await AppNotification().initialize();
  Hive.registerAdapter(TimingsAdapter());
  await Hive.openBox(prayerTimesKey);
  Bloc.observer = MyBlocObserver();
  getPrayerTimesSoundsStateFirstTime();
  runApp(const MyApp());
}
