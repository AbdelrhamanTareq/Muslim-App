import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/data/app_local_data.dart';
import 'package:muslim_app/core/injection_container.dart';
import 'package:muslim_app/core/utils/app_strings.dart';
import 'package:muslim_app/features/prayer_time/presentation/logic/cubit/prayer_time_cubit.dart';
import '../../../../../core/function.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../data/models/prayer_time.dart';

class PrayerTimesWidget extends StatefulWidget {
  const PrayerTimesWidget({
    super.key,
    required this.state,
  });

  // final GetPrayerTimeDataSuccess state;
  final Map<int, Timings> state;

  @override
  State<PrayerTimesWidget> createState() => _PrayerTimesWidgetState();
}

class _PrayerTimesWidgetState extends State<PrayerTimesWidget> {
  @override
  Widget build(BuildContext context) {
    var finalDate = convertDateToTimeStampInInt();

    // Map<int, Timings> prayerTimes = state.data;
    Map<int, Timings> prayerTimes = widget.state;
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
            color: _getIconColor(0),
            name: AppStrings.fajr,
            time: prayerTimes[finalDate]!.fajr.split(" ")[0],
            onPressed: () async {
              _enableOrDisablePrayerTimesSound(0, context);
              setState(() {
                
              });
            },
          ),
          _divider(),
          _buildListTile(
            context,
            name: AppStrings.sunrise,
            isIcon: false,
            time: prayerTimes[finalDate]!
                .sunrise
                // subString from fist index = 0 to the index of charchter you want to split it
                .substring(0, prayerTimes[finalDate]!.sunrise.indexOf(" ")),
            onPressed: () {},
          ),
          _divider(),
          _buildListTile(
            context,
            name: AppStrings.dhuhr,
            color: _getIconColor(1),
            time: prayerTimes[finalDate]!.dhuhr.split(" ")[0],
            onPressed: () {
              _enableOrDisablePrayerTimesSound(1, context);
               setState(() {
                
              });
            },
          ),
          _divider(),
          _buildListTile(
            context,
            name: AppStrings.asr,
            color: _getIconColor(2),
            time: prayerTimes[finalDate]!.asr.split(" ")[0],
            onPressed: () {
              _enableOrDisablePrayerTimesSound(2, context);
               setState(() {
                
              });
            },
          ),
          _divider(),
          _buildListTile(
            context,
            name: AppStrings.maghrib,
            color: _getIconColor(3),
            time: prayerTimes[finalDate]!.maghrib.split(" ")[0],
            onPressed: () {
              _enableOrDisablePrayerTimesSound(3, context);
               setState(() {
                
              });
            },
          ),
          _divider(),
          _buildListTile(
            context,
            name: AppStrings.isha,
            color: _getIconColor(4),
            time: prayerTimes[finalDate]!.isha.split(" ")[0],
            onPressed: () {
              _enableOrDisablePrayerTimesSound(4, context);
               setState(() {
                
              });
            },
          ),
        ],
      ),
    );
  }

  Color _getIconColor(index) =>
      getPrayerTimesSound()[index] ? Colors.black : Colors.grey;

  _enableOrDisablePrayerTimesSound(int index, context) async {
    final List<bool> prayerTimesSoundsEnalbe = getPrayerTimesSound();
    prayerTimesSoundsEnalbe[index] = !prayerTimesSoundsEnalbe[index];
    final List<String> stringList =
        convertPrayerTimesToListOfString(prayerTimesSoundsEnalbe);

    await instance<AppLocalData>().setPrayerTimesSound(data: stringList);
    BlocProvider.of<PrayerTimeCubit>(context).prayerScheduleTimesNotifaction(
        data: instance<AppLocalData>().getPrayerTimesDataMap());
  }

  Divider _divider() => const Divider(height: 10);

  Widget _buildListTile(context,
      {required String name,
      required String time,
      Color? color,
      bool isIcon = true,
      required Function()? onPressed}) {
    return ListTile(
      leading: isIcon
          ? IconButton(
              icon: Icon(
                Icons.alarm,
                size: 35,
                color: color,
              ),
              onPressed: onPressed,
            )
          : SizedBox(width: 40,),
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
