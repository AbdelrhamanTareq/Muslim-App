import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'app.dart';
import 'core/bloc_observer.dart';
import 'core/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initGetIt();
  await Hive.initFlutter();
await Hive.openBox("bookmarks");
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}
