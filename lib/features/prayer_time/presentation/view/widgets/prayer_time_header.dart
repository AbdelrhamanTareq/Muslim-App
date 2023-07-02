// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

import 'package:muslim_app/features/prayer_time/data/models/prayer_time.dart';

import '../../../../../core/function.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/utils/app_assets.dart';
import 'coming_prayer_remaining_time.dart';

class PrayerTimeHeaderWidget extends StatelessWidget {
  const PrayerTimeHeaderWidget({
    super.key,
    required this.state,
    required this.position,
  });
  // final GetPrayerTimeDataSuccess state;
  final Map<int, Timings> state;
  final Placemark position;

  @override
  Widget build(BuildContext context) {
    Map<int, Timings> prayerTimes = state;
    // Map<int, Timings> prayerTimes = state.data;
    int finalDate = convertDateToTimeStampInInt();

    final prayerTimesList = [
      toTimeOfDay(stringDate: prayerTimes[finalDate]!.fajr),
      toTimeOfDay(stringDate: prayerTimes[finalDate]!.dhuhr),
      toTimeOfDay(stringDate: prayerTimes[finalDate]!.asr),
      toTimeOfDay(stringDate: prayerTimes[finalDate]!.maghrib),
      toTimeOfDay(stringDate: prayerTimes[finalDate]!.isha),
    ];

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
            image: (DateTime.now().isAfter(
                        toTimeOfDay(stringDate: state[finalDate]!.sunrise)) &&
                    DateTime.now().isBefore(
                        toTimeOfDay(stringDate: state[finalDate]!.sunset)))
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
                _buildPrayerTimesLocation(context,position)
              ],
            ),
          ],
        ));
  }

  Align _buildPrayerTimesLocation(BuildContext context, Placemark position) {
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
            "${position.country},${position.administrativeArea}",
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
      getPrayerTimeDate(prayerTimesList, prayerTimes[finalDate]!).split(" ")[0],
      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
    );
  }

  Text _buildComingPrayerName(
      List<DateTime> prayerTimesList, BuildContext context) {
    return Text(
      getPrayerName(prayerTimesList),
      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
    );
  }
}
