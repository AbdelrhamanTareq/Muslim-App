import 'package:flutter/material.dart';
import 'package:muslim_app/core/utils/app_notifications.dart';
import 'package:muslim_app/core/utils/app_strings.dart';

import '../../../../../core/function.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../data/models/prayer_time.dart';

class PrayerTimesWidget extends StatelessWidget {
  const PrayerTimesWidget({
    super.key,
    required this.state,
  });

  // final GetPrayerTimeDataSuccess state;
  final Map<int, Timings> state;

  @override
  Widget build(BuildContext context) {
    var finalDate = convertDateToTimeStampInInt();

    // Map<int, Timings> prayerTimes = state.data;
    Map<int, Timings> prayerTimes = state;
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.67,
      margin: const EdgeInsets.only(top: 16, left: 10, right: 10, bottom: 16),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildListTile(
            context,
            name: AppStrings.fajr,
            time: prayerTimes[finalDate]!.fajr.split(" ")[0],
          ),
          _divider(),
          _buildListTile(
            context,
            name: AppStrings.sunrise,
            time: prayerTimes[finalDate]!
                .sunrise
                // subString from fist index = 0 to the index of charchter you want to split it
                .substring(0, prayerTimes[finalDate]!.sunrise.indexOf(" ")),
          ),
          _divider(),
          _buildListTile(
            context,
            name: AppStrings.dhuhr,
            time: prayerTimes[finalDate]!.dhuhr.split(" ")[0],
          ),
          _divider(),
          _buildListTile(
            context,
            name: AppStrings.asr,
            time: prayerTimes[finalDate]!.asr.split(" ")[0],
          ),
          _divider(),
          _buildListTile(
            context,
            name: AppStrings.maghrib,
            time: prayerTimes[finalDate]!.maghrib.split(" ")[0],
          ),
          _divider(),
          _buildListTile(
            context,
            name: AppStrings.isha,
            time: prayerTimes[finalDate]!.isha.split(" ")[0],
          ),
        ],
      ),
    );
  }

  Divider _divider() => const Divider(height: 10);

  Widget _buildListTile(context, {required String name, required String time}) {
    return ListTile(
      leading: IconButton(
        icon: const Icon(
          Icons.alarm,
          size: 35,
        ),
        onPressed: () {
          AppNotification().showNotification(title: "Sample",body: "asdasdasdasdasdasdasdasdasdasdasdasd");
        },
      ),
      title: Text(
        name,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: AppColors.black),
      ),
      trailing: Text(
        time,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: AppColors.black),
      ),
    );
  }
}
