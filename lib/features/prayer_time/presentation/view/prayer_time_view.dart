import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/function.dart';
import 'package:muslim_app/core/themes/app_colors.dart';
import 'package:muslim_app/core/utils/app_assets.dart';
import 'package:muslim_app/features/prayer_time/presentation/logic/cubit/prayer_time_cubit.dart';

class PrayerTimeView extends StatefulWidget {
  const PrayerTimeView({super.key});

  @override
  State<PrayerTimeView> createState() => _PrayerTimeViewState();
}

class _PrayerTimeViewState extends State<PrayerTimeView> {
  @override
  void initState() {
    BlocProvider.of<PrayerTimeCubit>(context).getPrayerTimeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.gery,
      body: BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
        builder: (context, state) {
          if (state is GetPrayerTimeDataError) {
            return Center(
              child: Text(state.error),
            );
          } else if (state is GetPrayerTimeDataSuccess) {
            //print(state.data.data[0].date.timestamp);
            return Stack(
              // crossAxisAlignment: CrossAxisAlignment.center,
              alignment: Alignment.topCenter,
              children: [
                PrayerTimeHeaderWidget(
                  state: state,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: PrayerTimesWidget(
                    state: state,
                  ),
                )
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
        },
      ),
    );
  }
}

class PrayerTimesWidget extends StatelessWidget {
  const PrayerTimesWidget({super.key, required this.state});

  final GetPrayerTimeDataSuccess state;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    var newDate = DateTime(now.year, now.month, now.day, 09, 01, 01)
            .millisecondsSinceEpoch /
        1000;
    var newDateWithoutFractional = newDate.toStringAsFixed(0);
    var finalDate = int.parse(newDateWithoutFractional);

    var prayerTimes = state.data;
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.67,
      margin: const EdgeInsets.only(top: 16, left: 10, right: 10, bottom: 16),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildListTile(
            context,
            name: "الفجر",
            time: prayerTimes[finalDate]!.fajr.split(" ")[0],
          ),
          const Divider(height: 12),
          _buildListTile(
            context,
            name: "الشروق",
            time: prayerTimes[finalDate]!
                .sunrise
                // subString from fist index = 0 to the index of charchter you want to split it
                .substring(0, prayerTimes[finalDate]!.sunrise.indexOf(" ")),
          ),
          const Divider(height: 12),
          _buildListTile(
            context,
            name: "الظهر",
            time: prayerTimes[finalDate]!.dhuhr.split(" ")[0],
          ),
          const Divider(height: 12),
          _buildListTile(
            context,
            name: "العصر",
            time: prayerTimes[finalDate]!.asr.split(" ")[0],
          ),
          const Divider(height: 12),
          _buildListTile(
            context,
            name: "المغرب",
            time: prayerTimes[finalDate]!.maghrib.split(" ")[0],
          ),
          const Divider(height: 12),
          _buildListTile(
            context,
            name: "العشاء",
            time: prayerTimes[finalDate]!.isha.split(" ")[0],
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(context, {required String name, required String time}) {
    return ListTile(
      leading: IconButton(
        icon: const Icon(
          Icons.alarm,
          size: 35,
        ),
        onPressed: () {},
      ),
      title: Text(
        name,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      trailing: Text(
        time,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}

class PrayerTimeHeaderWidget extends StatelessWidget {
  const PrayerTimeHeaderWidget({
    super.key,
    required this.state,
  });
  final GetPrayerTimeDataSuccess state;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    var newDate = DateTime(now.year, now.month, now.day, 09, 01, 01)
            .millisecondsSinceEpoch /
        1000;
    var newDateWithoutFractional = newDate.toStringAsFixed(0);
    var finalDate = int.parse(newDateWithoutFractional);
    var prayerTimes = state.data;

    final dateList = [
      prayerTimeConverter(prayerTimes[finalDate]!.fajr),
      prayerTimeConverter(prayerTimes[finalDate]!.dhuhr),
      prayerTimeConverter(prayerTimes[finalDate]!.asr),
      prayerTimeConverter(prayerTimes[finalDate]!.maghrib),
      prayerTimeConverter(prayerTimes[finalDate]!.isha),
    ];
    log("${prayerTimeConverter(getPrayerTimeDate(dateList, prayerTimes[finalDate]!))}");
    //log("${toTimeOfDay(prayerTimes[finalDate]!.fajr)}");
    return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.3,
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColor.white,
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2),
              BlendMode.darken,
            ),
            fit: BoxFit.fill,
            image: const AssetImage(
              AppAssets.dayImagePath,
            ),
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
                Text(
                  getPrayerName(dateList),
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColor.white,
                      ),
                ),
                Text(
                  getPrayerTimeDate(dateList, prayerTimes[finalDate]!)
                      .split(" ")[0],
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColor.white,
                      ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Column(
                  children: [
                    Text(
                      "متبقي",
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColor.white,
                              ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      toTimeOfDay(dateList, prayerTimes[finalDate]!)
                          .difference(DateTime.now())
                          .toString()
                          .substring(0, 4),
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColor.white,
                              ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.place,
                        color: AppColor.white,
                      ),
                      Text(
                        "القاهرة مصر",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColor.white,
                            ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
