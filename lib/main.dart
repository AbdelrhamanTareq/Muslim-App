import 'package:flutter/material.dart';

import 'app.dart';
import 'core/injection_container.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initGetIt();
  runApp(const MyApp());
}



