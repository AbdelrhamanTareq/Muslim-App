import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../core/function.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../data/models/prayer_time.dart';

class ComingPrayerRemainingTime extends StatefulWidget {
  const ComingPrayerRemainingTime({
    Key? key,
    required this.state,
  }) : super(key: key);
  // final GetPrayerTimeDataSuccess state;
  final Map<int, Timings> state;

  @override
  State<ComingPrayerRemainingTime> createState() =>
      _ComingPrayerRemainingTimeState();
}

class _ComingPrayerRemainingTimeState extends State<ComingPrayerRemainingTime> {
  Timer? countdownTimer;
  Duration myDuration = const Duration(days: 2);

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    countdownTimer!.cancel();
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map<int, Timings> prayerTimes = widget.state;
    int finalDate = convertDateToTimeStampInInt();

    final prayerTimesList = [
      toTimeOfDay(stringDate: prayerTimes[finalDate]!.fajr),
      toTimeOfDay(stringDate: prayerTimes[finalDate]!.dhuhr),
      toTimeOfDay(stringDate: prayerTimes[finalDate]!.asr),
      toTimeOfDay(stringDate: prayerTimes[finalDate]!.maghrib),
      toTimeOfDay(stringDate: prayerTimes[finalDate]!.isha),
    ];
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
          formatDuration(
            toTimeOfDay(
                    prayerTimes: prayerTimesList,
                    prayerTimesMap: prayerTimes[finalDate]!)
                .difference(DateTime.now()),
          ),
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
        ),
      ],
    );
  }
}
