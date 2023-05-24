import 'package:flutter/material.dart';

import 'app.dart';
import 'core/injection_container.dart';
import 'features/hadith/view/logic/cubit/hadith_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initGetIt();
  runApp(const MyApp());
}



