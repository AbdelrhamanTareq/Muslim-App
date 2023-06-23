import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/injection_container.dart';
import 'package:muslim_app/features/azkar/presentation/logic/cubit/azkar_cubit.dart';
import 'package:muslim_app/features/azkar/presentation/view/akar_details_view.dart';
import 'package:muslim_app/features/hadith/view/logic/cubit/hadith_cubit.dart';
import 'package:muslim_app/features/hadith/view/presentation/hadith_details_view.dart';
import 'package:muslim_app/features/hadith/view/presentation/hadith_view.dart';
import 'package:muslim_app/features/home/presentation/views/home_view.dart';
import 'package:muslim_app/features/prayer_time/presentation/logic/cubit/prayer_time_cubit.dart';
import 'package:muslim_app/features/prayer_time/presentation/view/prayer_time_view.dart';
import 'package:muslim_app/features/qibla/presentation/view/qibla_main_view.dart';
import 'package:muslim_app/features/quran/presentation/view/quran_surahs_view.dart';
import 'package:muslim_app/features/sebha/presentation/logic/cubit/sebha_cubit.dart';
import 'package:muslim_app/features/sebha/presentation/view/sebha_main_view.dart';

abstract class Routes {
  //static const String splashRoute = "/";

  static const String home = "/";
  static const String quranPath = "/quran";
  static const String hadithPath = "/hadith";
  static const String hadithDeatilsPath = "/hadith-details";
  static const String qiblaPath = "/qibla";
  static const String sebhaPath = "/sebha";
  static const String prayerTimePath = "/prayer-time";
  static const String azkarDetailsPath = "/azkar-details";
}

abstract class AppRoutes {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => const HomwView(),
        );
      case Routes.quranPath:
        return MaterialPageRoute(
          builder: (context) => const QuranSurahsView(),
        );
      case Routes.hadithPath:
        return MaterialPageRoute(
          builder: (context) => const HadithView(),
        );
      case Routes.hadithDeatilsPath:
        // TODO make map object
        final Map<String, dynamic> book =
            settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => BlocProvider<HadithCubit>(
            create: (context) => instance<HadithCubit>(),
            child: HadithDetailsView(
              bookName: book["bookName"],
              bookPath: book["bookPath"],
            ),
          ),
        );
      case Routes.sebhaPath:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<SebhaCubit>(
            create: (context) => instance<SebhaCubit>(),
            child: const SebhaMainView(),
          ),
        );
      case Routes.qiblaPath:
        return MaterialPageRoute(
          builder: (context) => const QiblaMainView(),
        );
      case Routes.prayerTimePath:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<PrayerTimeCubit>(
            create: (context) => instance<PrayerTimeCubit>(),
            child: const PrayerTimeView(),
          ),
        );
      case Routes.azkarDetailsPath:
        final Map<String, dynamic> args =
            settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => BlocProvider<AzkarCubit>(
            create: (context) => instance<AzkarCubit>(),
            child: AzkarDetailsView(
              zkerTitle: args["zkerTitle"],
              data: args["data"],
            ),
          ),
        );

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(
                    "No Route Found"), // todo move this string to strings manager
              ),
              body: const Center(
                  child: Text(
                      "No Route Found")), // todo move this string to strings manager
            ));
  }
}
