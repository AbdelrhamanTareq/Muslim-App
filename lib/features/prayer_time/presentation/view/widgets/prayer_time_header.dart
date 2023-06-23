import 'package:flutter/material.dart';
import 'package:muslim_app/core/utils/app_strings.dart';
import 'package:muslim_app/features/prayer_time/data/models/prayer_time.dart';

import '../../../../../core/function.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../logic/cubit/prayer_time_cubit.dart';

class PrayerTimeHeaderWidget extends StatefulWidget {
  const PrayerTimeHeaderWidget({
    super.key,
    required this.state,
  });
  final GetPrayerTimeDataSuccess state;

  @override
  State<PrayerTimeHeaderWidget> createState() => _PrayerTimeHeaderWidgetState();
}

class _PrayerTimeHeaderWidgetState extends State<PrayerTimeHeaderWidget> {
  late AssetImage day;
  late AssetImage night;

  @override
  void initState() {
    day = const AssetImage(AppAssets.dayImagePath);
    night = const AssetImage(AppAssets.nightImagePath);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    precacheImage(day, context);
    precacheImage(night, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Map<int, Timings> prayerTimes = widget.state.data;
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
            image: (DateTime.now().isAfter(toTimeOfDay(
                        stringDate: widget.state.data[finalDate]!.sunrise)) &&
                    DateTime.now().isBefore(toTimeOfDay(
                        stringDate: widget.state.data[finalDate]!.sunset)))
                ? day
                : night,
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
                _buildComingPrayerRemainingTime(
                    context, prayerTimesList, prayerTimes, finalDate),
                _buildPrayerTimesLocation(context)
              ],
            ),
          ],
        ));
  }

  Align _buildPrayerTimesLocation(BuildContext context) {
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
            "القاهرة,مصر",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.white,
                ),
          ),
        ],
      ),
    );
  }

  Column _buildComingPrayerRemainingTime(
      BuildContext context,
      List<DateTime> prayerTimesList,
      Map<int, Timings> prayerTimes,
      int finalDate) {
    return Column(
      children: [
        Text(
          AppStrings.remaining,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          toTimeOfDay(
                  prayerTimes: prayerTimesList,
                  prayerTimesMap: prayerTimes[finalDate]!)
              .difference(DateTime.now())
              .toString()
              .substring(0, 4),
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
        ),
      ],
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
