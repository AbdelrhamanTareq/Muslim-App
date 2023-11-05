// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:muslim_app/core/utils/app_extensions.dart';

import 'package:muslim_app/features/prayer_time/data/models/prayer_time.dart';

import '../../../../../core/functions.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/utils/app_assets.dart';
import 'coming_prayer_remaining_time.dart';

class PrayerTimeHeaderWidget extends StatelessWidget {
  const PrayerTimeHeaderWidget({
    super.key,
    required this.state,
    this.position,
    this.city,
    this.country,
  });
  // final GetPrayerTimeDataSuccess state;
  final Map<int, Timings> state;
  final Placemark? position;
  final String? city;
  final String? country;

  @override
  Widget build(BuildContext context) {
    Map<int, Timings> prayerTimes = state;
    // Map<int, Timings> prayerTimes = state.data;
    int finalDate = AppFunctions.convertDateToTimeStampInInt();

    final prayerTimesList = [
      AppFunctions.toTimeOfDay(stringDate: prayerTimes[finalDate]!.fajr),
      AppFunctions.toTimeOfDay(stringDate: prayerTimes[finalDate]!.dhuhr),
      AppFunctions.toTimeOfDay(stringDate: prayerTimes[finalDate]!.asr),
      AppFunctions.toTimeOfDay(stringDate: prayerTimes[finalDate]!.maghrib),
      AppFunctions.toTimeOfDay(stringDate: prayerTimes[finalDate]!.isha),
    ] as List<DateTime>;

    return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.3,
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2),
              BlendMode.darken,
            ),
            fit: BoxFit.fill,
            image: (DateTime.now().isAfter(AppFunctions.toTimeOfDay(
                        stringDate: state[finalDate]!.sunrise)) &&
                    DateTime.now().isBefore(AppFunctions.toTimeOfDay(
                        stringDate: state[finalDate]!.sunset)))
                ? const AssetImage(AppAssets.dayImagePath)
                : const AssetImage(AppAssets.nightImagePath),
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildComingPrayerName(prayerTimesList, context),
                _buildComingPrayerTime(
                    prayerTimesList, prayerTimes, finalDate, context),
                const SizedBox(
                  height: 8,
                ),
                ComingPrayerRemainingTime(state: state),
                _buildPrayerTimesLocation(context,
                    position: position, city: city, country: country)
              ],
            ),
          ],
        ));
  }

  Align _buildPrayerTimesLocation(BuildContext context,
      {Placemark? position, String? city, String? country}) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Row(
        children: [
          const Icon(
            Icons.place,
            color: AppColors.white,
          ),
          // TODO
          Text(
            "${position?.country ?? country},${position?.administrativeArea ?? city}",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.white,
                ),
          ),
        ],
      ),
    );
  }

  Text _buildComingPrayerTime(List<DateTime> prayerTimesList,
      Map<int, Timings> prayerTimes, int finalDate, BuildContext context) {
    return Text(
      AppFunctions.getPrayerTimeDate(prayerTimesList, prayerTimes[finalDate]!)
          .split(" ")[0],
      style: context.headlineLarge!.copyWith(
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      ),
    );
  }

  Text _buildComingPrayerName(
      List<DateTime> prayerTimesList, BuildContext context) {
    return Text(
      AppFunctions.getPrayerName(prayerTimesList),
      style: context.headlineLarge!.copyWith(
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      ),
    );
  }
}
