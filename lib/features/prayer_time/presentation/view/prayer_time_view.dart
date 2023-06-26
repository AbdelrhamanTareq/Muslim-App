import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/themes/app_colors.dart';
import 'package:muslim_app/features/prayer_time/presentation/logic/cubit/prayer_time_cubit.dart';
import 'package:muslim_app/features/prayer_time/presentation/view/widgets/prayer_time_header.dart';

import 'widgets/prayer_times_widget.dart';

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
      backgroundColor: AppColors.grey,
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

