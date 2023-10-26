import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/injection_container.dart';
import 'package:muslim_app/core/themes/app_themes.dart';
import 'package:muslim_app/core/utils/app_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:muslim_app/features/app_drawer/data/local_data/app_drawer_local_data.dart';
import 'package:muslim_app/features/app_drawer/presentation/logic/cubit/app_drawer_cubit.dart';
import 'package:muslim_app/features/azkar/presentation/logic/cubit/all_azkar_cubit.dart';

import 'features/quran/presentation/logic/cubit/quran_cubit/quran_cubit.dart';
import 'features/quran/presentation/logic/cubit/quran_settings_cubit/quran_settings_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<QuranCubit>(
          create: (_) => instance<QuranCubit>()..getAllQuranData(),
          lazy: false,
        ),
        BlocProvider<QuranSettingsCubit>(
          create: (_) => instance<QuranSettingsCubit>(),
        ),
        BlocProvider<AllAzkarCubit>(
          create: (_) => instance<AllAzkarCubit>()..getAllAzkarData(),
          lazy: false,
        ),
        BlocProvider<AppDrawerCubit>(
          create: (_) => instance<AppDrawerCubit>(),
        ),
      ],
      child: BlocBuilder<AppDrawerCubit, AppDrawerState>(
          builder: (context, state) {
        return MaterialApp(
          builder: (context, child) {
            // EDITED
            return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                    textScaleFactor:
                        instance<AppDrawerLocalData>().getAppTextSize()),
                child: child!);
          },
          onGenerateRoute: AppRoutes.getRoute,
          title: 'Muslim',
          debugShowCheckedModeBanner: false,
          theme:
              (instance<AppDrawerLocalData>().getAppTheme())
                  ? AppTheme.darkTheme()
                  : AppTheme.lightTheme()
          //  ThemeData(
          //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          //   useMaterial3: true,
          // )
          ,
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
        );
      }),
    );
  }
}
