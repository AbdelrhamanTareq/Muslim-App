import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/themes/app_colors.dart';
import 'package:muslim_app/features/prayer_time/data/models/prayer_time.dart';
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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const PrayerTimeHeaderWidget(),
                PrayerTimesWidget(
                  state: state,
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
    print(finalDate);
    Map<String, Timings> data = {};
    // final date = state.data.data.forEach((element) {
    //   var date = int.parse(element.date.timestamp);
    //   print("date ===== $date");
    //   if (date == finalDate) {
    //     Map<String, Timings> entery = {element.date.timestamp: element.timings};
    //     data.addEntries(entery.entries);
    //   }
    // });
    print("data = $data");
    var prayerTimes = state.data;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 16),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildListTile(
            context,
            name: "الفجر",
            time: prayerTimes[finalDate]!.fajr.split(" ")[0],
          ),
          _buildListTile(
            context,
            name: "الشروق",
            time: prayerTimes[finalDate]!.sunrise
                // subString from fist index = 0 to the index of charchter you want to split it
                .substring(0, prayerTimes[finalDate]!.sunrise.indexOf(" ")),
          ),
          _buildListTile(
            context,
            name: "الظهر",
            time: prayerTimes[finalDate]!.dhuhr.split(" ")[0],
          ),
          _buildListTile(
            context,
            name: "العصر",
            time: prayerTimes[finalDate]!.asr.split(" ")[0],
          ),
          _buildListTile(
            context,
            name: "المغرب",
            time: prayerTimes[finalDate]!.maghrib.split(" ")[0],
          ),
          _buildListTile(
            context,
            name: "العشاء",
            time: prayerTimes[finalDate]!.isha.split(" ")[0],
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(context,
      {required String name, required String time}) {
    return Container(
      color: AppColor.green,
      child: ListTile(
        leading: IconButton(
          icon: const Icon(
            Icons.alarm,
            size: 35,
          ),
          onPressed: () {},
        ),
        title: Text(
          name,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        trailing: Text(
          time,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}

class PrayerTimeHeaderWidget extends StatelessWidget {
  const PrayerTimeHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 0),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              "القاهرة",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              DateTime.now().toLocal().toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "الوقت المتبقي للظهر",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "1 ساعة",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Colors.deepPurple),
            ),
          ],
        ));
  }
}
