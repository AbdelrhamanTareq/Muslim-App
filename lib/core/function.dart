import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:muslim_app/core/themes/app_colors.dart';

import '../features/prayer_time/data/models/prayer_time.dart';
import 'utils/app_strings.dart';

void showSnackBar(context, {String? text}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 1),
      content: Text(text ?? AppStrings.noBookmark),
    ),
  );
}

void showToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      backgroundColor: AppColors.green,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER);
}

String dateFormater(DateTime dateTime) {
  final newDate = DateFormat("dd/MM/yyyy").format(dateTime);
  return newDate;
}

DateTime prayerTimeConverter(String prayerTime) {
  final date = prayerTime.split(" ")[0];
  final newDate = DateFormat("hh:mm").parse(date);

  return newDate;
}

DateTime toTimeOfDay({
  List<DateTime>? prayerTimes,
  Timings? prayerTimesMap,
  String? stringDate,
}) {
  if (stringDate != null) {
    final time = stringDate.split(" ")[0];
    List<String> timeSplit = time.split(":");
    int hour = int.parse(timeSplit.first);
    int minute = int.parse(timeSplit.last);
    final timeOfDay = TimeOfDay(hour: hour, minute: minute);
    final now = DateTime.now();
    return DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
  } else {
    final stringTime = getPrayerTimeDate(prayerTimes!, prayerTimesMap!);
    final time = stringTime.split(" ")[0];
    List<String> timeSplit = time.split(":");
    int hour = int.parse(timeSplit.first);
    int minute = int.parse(timeSplit.last);

    final timeOfDay = TimeOfDay(hour: hour, minute: minute);
    final now = DateTime.now();
    return DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
  }
}

String getPrayerName(List<DateTime> prayerTimes) {
  final now = DateTime.now();
  // for (var element in prayerTimes) {
  //   //print(element.hour);
  //   print(element.hour);
  // }
  final int nowHour = now.hour;
  print(prayerTimes[0].hour);
  print(prayerTimes[1].hour);
  print(prayerTimes[2].hour);
  print(prayerTimes[3].hour);
  print(prayerTimes[4].hour);
  if (nowHour >= prayerTimes[0].hour && nowHour < prayerTimes[1].hour) {
    return "الضهر";
  } else if (nowHour >= prayerTimes[1].hour && nowHour < prayerTimes[2].hour) {
    return "العصر";
  } else if (nowHour >= prayerTimes[2].hour && nowHour < prayerTimes[3].hour) {
    return "المغرب";
  } else if (nowHour >= prayerTimes[3].hour && nowHour <= prayerTimes[4].hour) {
    return "العشاء";
  } else {
    return "الفجر";
  }
}

String getPrayerTimeDate(List<DateTime> prayerTimes, Timings prayerTimesMap) {
  final name = getPrayerName(prayerTimes);
  //Map<int, Timings> prayerTimesMap;
  switch (name) {
    case "الفجر":
      return prayerTimesMap.fajr;
    case "الظهر":
      return prayerTimesMap.dhuhr;

    case "العصر":
      return prayerTimesMap.asr;
    case "المغرب":
      return prayerTimesMap.maghrib;
    case "العشاء":
      return prayerTimesMap.isha;
    default:
      return prayerTimesMap.isha;
  }
}

int convertDateToTimeStampInInt() {
  final now = DateTime.now();
  var newDate = DateTime(now.year, now.month, now.day, 09, 01, 01)
          .millisecondsSinceEpoch /
      1000;
  var newDateWithoutFractional = newDate.toStringAsFixed(0);
  var finalDate = int.parse(newDateWithoutFractional);
  return finalDate;
}
