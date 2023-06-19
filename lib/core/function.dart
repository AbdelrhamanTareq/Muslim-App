import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../features/prayer_time/data/models/prayer_time.dart';

String dateFormater(DateTime dateTime) {
  final newDate = DateFormat("dd/MM/yyyy").format(dateTime);
  return newDate;
}

DateTime prayerTimeConverter(String prayerTime) {
  final date = prayerTime.split(" ")[0];
  final newDate = DateFormat("hh:mm").parse(date);

  return newDate;
}

DateTime toTimeOfDay(List<DateTime> prayerTimes, Timings prayerTimesMap) {
  final stringTime = getPrayerTimeDate(prayerTimes, prayerTimesMap);
  final time = stringTime.split(" ")[0];
  List<String> timeSplit = time.split(":");
  int hour = int.parse(timeSplit.first);
  int minute = int.parse(timeSplit.last);

  final timeOfDay = TimeOfDay(hour: hour, minute: minute);
  final now = DateTime.now();
  return DateTime(
      now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
}

String getPrayerName(List<DateTime> prayerTimes) {
  final now = DateTime.now();
  for (var element in prayerTimes) {
    print(element.hour);
  }
  if (now.hour >= prayerTimes[0].hour && now.hour < prayerTimes[1].hour) {
    return "الظهر";
  } else if (now.hour > prayerTimes[1].hour && now.hour < prayerTimes[2].hour) {
    return "العصر";
  } else if (now.hour > prayerTimes[2].hour && now.hour < prayerTimes[3].hour) {
    return "المغرب";
  } else if (now.hour > prayerTimes[3].hour &&
      now.hour <= prayerTimes[4].hour) {
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
