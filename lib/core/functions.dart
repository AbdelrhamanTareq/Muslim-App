import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:muslim_app/core/themes/app_colors.dart';

import '../features/prayer_time/data/models/prayer_time.dart';
import '../features/quran/data/local_data/quran_local_data.dart';
import '../features/quran/data/models/quran.dart';
import '../features/quran/presentation/view/quran_shrah_details.dart';
import 'constant/app_constatnt.dart';
import 'data/app_local_data.dart';
import 'injection_container.dart';
import 'utils/app_strings.dart';

const String fajr = "الفجر";
const String dhuhr = "الظهر";
const String asr = "العصر";
const String maghrib = "المغرب";
const String isha = "العشاء";

void showSnackBar(context, {String? text}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 1),
      content: Text(text ?? AppStrings.noBookmark),
    ),
  );
}

void showToast(String msg, {Color? color}) {
  Fluttertoast.showToast(
      msg: msg,
      backgroundColor: color ?? AppColors.green,
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
  // TODO if string data == null get Data becuase month is over
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
    final subString = int.parse(stringTime.substring(1, 2));
    if (prayerTimes[0].hour == subString) {
      return DateTime(
          now.year, now.month, now.day + 1, timeOfDay.hour, timeOfDay.minute);
    }
    return DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
  }
}

String formatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
}

String getPrayerName(List<DateTime> prayerTimes) {
  final now = DateTime.now();

  // print(prayerTimes[0].hour);
  // print(prayerTimes[1].hour);
  // print(prayerTimes[2].hour);
  // print(prayerTimes[3].hour);
  // print(prayerTimes[4].hour);

  if (now.isAfter(prayerTimes[0]) && now.isBefore(prayerTimes[1])) {
    return dhuhr;
  } else if (now.isAfter(prayerTimes[1]) && now.isBefore(prayerTimes[2])) {
    return asr;
  } else if (now.isAfter(prayerTimes[2]) && now.isBefore(prayerTimes[3])) {
    return maghrib;
  } else if (now.isAfter(prayerTimes[3]) && now.isBefore(prayerTimes[4])) {
    return isha;
  } else {
    return fajr;
  }
}

String getPrayerTimeDate(List<DateTime> prayerTimes, Timings prayerTimesMap) {
  final name = getPrayerName(prayerTimes);
  switch (name) {
    case fajr:
      return prayerTimesMap.fajr;
    case dhuhr:
      return prayerTimesMap.dhuhr;

    case asr:
      return prayerTimesMap.asr;
    case maghrib:
      return prayerTimesMap.maghrib;
    case isha:
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

int getIndexOfPrayerTimeMethods(String value) {
  int i = 4;
  for (var element in prayerTimesMethods) {
    if (element["ar"] == value) {
      i = prayerTimesMethods.indexOf(element);
      break;
    }
  }
  return i;
}

List<bool> getPrayerTimesSound() {
  return instance<AppLocalData>().getPrayerTimesSound();
}

List<String> convertPrayerTimesToListOfString(List<bool> boolList) {
  final List<String> stringList = [];
  for (var e in boolList) {
    {
      if (e == true) {
        stringList.add("1");
      } else {
        stringList.add("0");
      }
    }
  }
  return stringList;
}

void getPrayerTimesSoundsStateFirstTime() async {
  if (!instance<AppLocalData>().getIsFirstTime(key: mainFirstTimeKey)) {
    final List<bool> prayerTimesSoundsEnalbe = getPrayerTimesSound();
    final List<String> stringList =
        convertPrayerTimesToListOfString(prayerTimesSoundsEnalbe);
    await instance<AppLocalData>().setPrayerTimesSound(data: stringList);
    await instance<AppLocalData>().setIsFirstTime(key: mainFirstTimeKey);
  }
}

// nav to other surha and save surha name in shared prefrence
navToOtherSurha(context, {required int index, required List<Quran> data}) {
  // save surha name
  instance<QuranLocalData>().setLastReadQuranSurh(data[index].name);

  // nav to other surha
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => QuranSurahDetails(
        index: index,
        data: data,
      ),
    ),
  );
}
