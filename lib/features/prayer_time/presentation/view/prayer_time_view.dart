// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:muslim_app/core/data/app_local_data.dart';
import 'package:muslim_app/core/injection_container.dart';

import 'package:muslim_app/core/themes/app_colors.dart';
import 'package:muslim_app/features/prayer_time/presentation/logic/cubit/prayer_time_cubit.dart';
import 'package:muslim_app/features/prayer_time/presentation/view/widgets/prayer_time_header.dart';

import 'widgets/prayer_times_widget.dart';

class PrayerTimeView extends StatefulWidget {
  const PrayerTimeView({
    Key? key,
    // required this.lat,
    // required this.long,
    required this.address,
    this.lat,
    this.long,
  }) : super(key: key);
  // final String lat;
  // final String long;
  final Placemark? address;
  final String? lat;
  final String? long;

  @override
  State<PrayerTimeView> createState() => _PrayerTimeViewState();
}

class _PrayerTimeViewState extends State<PrayerTimeView> {
  @override
  void initState() {
    if ((widget.lat != null && widget.long != null) ||
        instance<AppLocalData>().getLatAndLong() != null) {
      BlocProvider.of<PrayerTimeCubit>(context)
          .getPrayerTimeDataByLocation(lat: widget.lat!, long: widget.long!);
    } else {
      BlocProvider.of<PrayerTimeCubit>(context).getPrayerTimeData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
        builder: (context, state) {
          if (state.error != "") {
            return Center(
              child: Text(state.error),
            );
          } else if (state.data.isNotEmpty) {
            //print(state.data.data[0].date.timestamp);
            return Stack(
              // crossAxisAlignment: CrossAxisAlignment.center,
              alignment: Alignment.topCenter,
              children: [
                PrayerTimeHeaderWidget(
                  state: state.data,
                  position: widget.address!,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: PrayerTimesWidget(
                    state: state.data,
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
