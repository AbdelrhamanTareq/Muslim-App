import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/injection_container.dart';
import 'package:muslim_app/features/hadith/view/logic/cubit/hadith_cubit.dart';
import 'package:muslim_app/features/hadith/view/presentation/hadith_details_view.dart';
import 'package:muslim_app/features/hadith/view/presentation/hadith_view.dart';
import 'package:muslim_app/features/home/presentation/views/home_view.dart';
import 'package:muslim_app/features/quran/presentation/view/quran_surahs_view.dart';

abstract class Routes {
  //static const String splashRoute = "/";

  static const String home = "/";
  static const String quranPath = "/quran";
  static const String hadithPath = "/hadith";
  static const String hadithDeatilsPath = "/hadith-details";
  static const String compassPath = "/compass";
  static const String sebhaPath = "/sebha";
  static const String prayerTimePath = "/prayer-time";
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
        return MaterialPageRoute(
          builder: (context) => BlocProvider<HadithCubit>(
            create: (context) => instance<HadithCubit>(),
            child: const HadithDetailsView(),
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
