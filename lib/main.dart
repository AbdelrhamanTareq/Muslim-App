import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'app.dart';
import 'core/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initGetIt();
  await Hive.initFlutter();
await Hive.openBox("bookmarks");
  runApp(const MyApp());
}
