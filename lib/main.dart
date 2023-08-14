import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:muslim_app/core/utils/app_notifications.dart';
import 'package:muslim_app/features/prayer_time/data/models/prayer_time.dart';

import 'app.dart';
import 'core/bloc_observer.dart';
import 'core/constant/app_constatnt.dart';
import 'core/injection_container.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initGetIt();
  await Hive.initFlutter();
  await Hive.openBox(bookmarksKey);
  await AppNotification().initialize();
  Hive.registerAdapter(TimingsAdapter());
  await Hive.openBox(prayerTimesKey);
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}
