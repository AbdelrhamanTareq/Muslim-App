import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/features/home/presentation/views/home_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:muslim_app/features/quran/data/repo/quran_repo.dart';
import 'package:muslim_app/features/quran/presentation/logic/cubit/quran_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
            BlocProvider<QuranCubit>(
              create: (_) => QuranCubit(QuranRepoImpl())..getAllQuranData(),
              lazy: false,
            ),
          ],
      child: MaterialApp(
        title: 'Muslim',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Directionality(
            textDirection: TextDirection.rtl, child: HomwView()),
        locale: const Locale("ar"),
        supportedLocales: const [
          Locale("ar"),
          Locale("en"),
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (deviceLocale, supportedLocales) {
          for (var locale in supportedLocales) {
            if (deviceLocale != null &&
                deviceLocale.languageCode == locale.languageCode) {
              return deviceLocale;
            }
          }

          return supportedLocales.first;
        },
      ),
    );
  }
}
