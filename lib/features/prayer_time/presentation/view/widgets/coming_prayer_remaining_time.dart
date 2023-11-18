import 'dart:async';

import 'package:flutter/material.dart';
import 'package:muslim_app/core/utils/app_extensions.dart';
import 'package:muslim_app/core/widgets/text_widget.dart';

import '../../../../../core/functions.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../data/models/prayer_time.dart';

class ComingPrayerRemainingTime extends StatefulWidget {
  const ComingPrayerRemainingTime({
    Key? key,
    required this.state,
  }) : super(key: key);
  // final GetPrayerTimeDataSuccess state;
  final Map<String, Timings> state;

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
    Map<String, Timings> prayerTimes = widget.state;
    String finalDate = AppFunctions.todayFormatter();
    Timings? timings = prayerTimes[finalDate];

    // final prayerTimesList = [
    //   AppFunctions.toTimeOfDay(stringDate: prayerTimes[finalDate]!.fajr),
    //   AppFunctions.toTimeOfDay(stringDate: prayerTimes[finalDate]!.dhuhr),
    //   AppFunctions.toTimeOfDay(stringDate: prayerTimes[finalDate]!.asr),
    //   AppFunctions.toTimeOfDay(stringDate: prayerTimes[finalDate]!.maghrib),
    //   AppFunctions.toTimeOfDay(stringDate: prayerTimes[finalDate]!.isha),
    // ] as List<DateTime>;
    final prayerTimesList = AppFunctions.prayerTimesList(
      fajr: timings?.fajr,
      dhuhr: timings?.dhuhr,
      asr: timings?.asr,
      maghrib: timings?.maghrib,
      isha: timings?.isha,
    );
    return Column(
      children: [
        // _buildText(context),
        TextWidget(
          text: AppStrings.remaining,
          style: _textStyle(),
        ),
        const SizedBox(
          height: 8,
        ),
        TextWidget(
          text: AppFunctions.formatDuration(
            AppFunctions.toTimeOfDay(
                    prayerTimes: prayerTimesList,
                    prayerTimesMap: prayerTimes[finalDate]!)
                .difference(DateTime.now()),
          ),
          style: _textStyle(),
        )
        // Text(
        //   AppFunctions.formatDuration(
        //     AppFunctions.toTimeOfDay(
        //             prayerTimes: prayerTimesList,
        //             prayerTimesMap: prayerTimes[finalDate]!)
        //         .difference(DateTime.now()),
        //   ),
        //   style: Theme.of(context).textTheme.headlineLarge!.copyWith(
        //         fontWeight: FontWeight.w700,
        //         color: AppColors.white,
        //       ),
        // ),
      ],
    );
  }

  TextStyle _textStyle() => context.headlineMedium!.copyWith(
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      );
  // Text _buildText(BuildContext context) {
  //   return Text(
  //     AppStrings.remaining,
  //     style: context.headlineMedium!.copyWith(
  //       fontWeight: FontWeight.w700,
  //       color: AppColors.white,
  //     ),
  //   );
  // }
}
