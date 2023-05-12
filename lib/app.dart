import 'package:flutter/material.dart';
import 'package:muslim_app/features/home/presentation/views/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Muslim',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Directionality(
          textDirection: TextDirection.rtl, child: HomwView()),
    );
  }
}
