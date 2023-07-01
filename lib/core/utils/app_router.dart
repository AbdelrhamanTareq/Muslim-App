import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:muslim_app/core/injection_container.dart';
import 'package:muslim_app/features/azkar/data/models/azkar.dart';
import 'package:muslim_app/features/azkar/presentation/logic/cubit/all_azkar_cubit.dart';
import 'package:muslim_app/features/azkar/presentation/logic/cubit/main_azkar_cubit.dart';
import 'package:muslim_app/features/azkar/presentation/view/akar_details_view.dart';
import 'package:muslim_app/features/azkar/presentation/view/all_azkar_view.dart';
import 'package:muslim_app/features/hadith/data/models/hadith_book_object.dart';
import 'package:muslim_app/features/hadith/view/logic/cubit/hadith_cubit.dart';
import 'package:muslim_app/features/hadith/view/presentation/hadith_details_view.dart';
import 'package:muslim_app/features/hadith/view/presentation/hadith_view.dart';
import 'package:muslim_app/features/home/presentation/views/home_view.dart';
import 'package:muslim_app/features/prayer_time/presentation/logic/cubit/prayer_time_cubit.dart';
import 'package:muslim_app/features/prayer_time/presentation/view/prayer_time_view.dart';
import 'package:muslim_app/features/prayer_time/presentation/view/widgets/prayer_country_picker_view.dart';
import 'package:muslim_app/features/qibla/presentation/view/qibla_main_view.dart';
import 'package:muslim_app/features/quran/presentation/view/quran_surahs_view.dart';
import 'package:muslim_app/features/sebha/presentation/logic/cubit/sebha_cubit.dart';
import 'package:muslim_app/features/sebha/presentation/view/sebha_main_view.dart';

import '../../features/azkar/data/models/azkar_map.dart';

abstract class Routes {
  //static const String splashRoute = "/";

  static const String home = "/";
  static const String quranPath = "/quran";
  static const String hadithPath = "/hadith";
  static const String hadithDeatilsPath = "/hadith-details";
  static const String qiblaPath = "/qibla";
  static const String sebhaPath = "/sebha";
  static const String prayerTimePath = "/prayer-time";
  static const String prayerTimeCountryPickerPath =
      "/prayer-time-country-picker";
  static const String azkarDetailsPath = "/azkar-details";
  static const String allAzkarPath = "/all-azkar";
}

abstract class AppRoutes {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<MainAzkarCubit>(
            create: (context) => instance<MainAzkarCubit>(),
            child: const HomwView(),
          ),
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
        final HadithBookObject book = settings.arguments as HadithBookObject;
        return MaterialPageRoute(
          builder: (context) => BlocProvider<HadithCubit>(
            create: (context) => instance<HadithCubit>(),
            child: HadithDetailsView(
              bookName: book.name,
              bookPath: book.path,
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
        final Placemark arg = settings.arguments as Placemark;
        return MaterialPageRoute(
          builder: (context) => BlocProvider<PrayerTimeCubit>(
            create: (context) => instance<PrayerTimeCubit>(),

            //child: const PrayerTimeView(),
            child: PrayerTimeView(
              address: arg,
            ),
          ),
        );
      case Routes.prayerTimeCountryPickerPath:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<PrayerTimeCubit>(
            create: (context) => instance<PrayerTimeCubit>(),
            // child: const PrayerTimeView(),
            child: const PrayerCountryPickerView(),
          ),
        );
      case Routes.azkarDetailsPath:
        final AzkarMap args = settings.arguments as AzkarMap;
        return MaterialPageRoute(
          builder: (context) => BlocProvider<MainAzkarCubit>(
            create: (context) => instance<MainAzkarCubit>(),
            child: AzkarDetailsView(
              zkerTitle: args.zkerTitle,
              data: args.data,
            ),
          ),
        );
      case Routes.allAzkarPath:
        final data = settings.arguments as List<Azkar>;
        return MaterialPageRoute(
          builder: (context) => BlocProvider<AllAzkarCubit>(
            create: (context) => instance<AllAzkarCubit>(),
            child: AllAzkarView(
              data: data,
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
                    "No Route Found"), // TODO move this string to strings manager
              ),
              body: const Center(
                  child: Text(
                      "No Route Found")), // TODO move this string to strings manager
            ));
  }
}
