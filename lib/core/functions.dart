import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:muslim_app/core/themes/app_colors.dart';
import 'package:muslim_app/features/quran/presentation/logic/cubit/quran_settings_cubit/quran_settings_cubit.dart';

import '../features/prayer_time/data/models/prayer_time.dart';
import '../features/quran/data/models/quran.dart';
import '../features/quran/presentation/view/quran_shrah_details.dart';
import 'constant/app_constatnt.dart';
import 'data/app_local_data.dart';
import 'injection_container.dart';
import 'utils/app_strings.dart';

class AppFunctions {
  AppFunctions._();

  static const String fajr = "الفجر";
  static const String dhuhr = "الظهر";
  static const String asr = "العصر";
  static const String maghrib = "المغرب";
  static const String isha = "العشاء";

  // indication functions

  // show snackbar
  static void showSnackBar(context, {String? text}) {
    // hide current snackbar if there
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: Text(text ?? AppStrings.noBookmark),
      ),
    );
  }

  // show Toast
  static void showToast(String msg, {Color? color}) {
    Fluttertoast.showToast(
        msg: msg,
        backgroundColor: color ?? AppColors.green,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER);
  }
  ////////////////////////////////////////////////////////////////

  // Date functions

  // format date like 23/6/2005
  static String dateFormater(DateTime dateTime) {
    final newDate = DateFormat("dd/MM/yyyy").format(dateTime);
    return newDate;
  }

  static DateTime prayerTimeConverter(String prayerTime) {
    final date = prayerTime.split(" ")[0];
    final newDate = DateFormat("hh:mm").parse(date);

    return newDate;
  }

  static DateTime toTimeOfDay({
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

  static String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  static int convertDateToTimeStampInInt() {
    final now = DateTime.now();
    var newDate = DateTime(now.year, now.month, now.day, 09, 01, 01)
            .millisecondsSinceEpoch /
        1000;
    var newDateWithoutFractional = newDate.toStringAsFixed(0);
    var finalDate = int.parse(newDateWithoutFractional);
    return finalDate;
  }

  ////////////////////////////////////////////////////////////////////////

  // prayer times name and date functions
  static String getPrayerName(List<DateTime> prayerTimes) {
    final now = DateTime.now();

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

  static String getPrayerTimeDate(
      List<DateTime> prayerTimes, Timings prayerTimesMap) {
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

  static int getIndexOfPrayerTimeMethods(String value) {
    int i = 4;
    for (var element in prayerTimesMethods) {
      if (element["ar"] == value) {
        i = prayerTimesMethods.indexOf(element);
        break;
      }
    }
    return i;
  }

  static List<bool> getPrayerTimesSound() {
    return instance<AppLocalData>().getPrayerTimesSound();
  }

  static List<String> convertPrayerTimesToListOfString(List<bool> boolList) {
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

  static void getPrayerTimesSoundsStateFirstTime() async {
    if (!instance<AppLocalData>().getIsFirstTime(key: mainFirstTimeKey)) {
      final List<bool> prayerTimesSoundsEnalbe = getPrayerTimesSound();
      final List<String> stringList =
          convertPrayerTimesToListOfString(prayerTimesSoundsEnalbe);
      await instance<AppLocalData>().setPrayerTimesSound(data: stringList);
      await instance<AppLocalData>().setIsFirstTime(key: mainFirstTimeKey);
    }
  }

  // Others

  // nav to other surha and save surha name in shared prefrence
  static void navToOtherSurhaWithReplace(context,
      {required int index, required List<Quran> data}) {
    // save surha name and index
    _saveSurhaNameAndIndex(context, data, index);

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

  // nav to other surha and save surha name in shared prefrence
  static void navToOtherSurhaWithoutReplace(context,
      {required int index, required List<Quran> data}) {
    // save surha name and index
    _saveSurhaNameAndIndex(context, data, index);

    // nav to other surha
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuranSurahDetails(
          index: index,
          data: data,
        ),
      ),
    );
  }

  static void _saveSurhaNameAndIndex(context, List<Quran> data, int index) {
    // save surha name and index
    BlocProvider.of<QuranSettingsCubit>(context)
        .updateLastRead(data[index].name, index);
  }

  // remove bookmark
  static void removeBookmark(bool bookmarkDeletedVal) async {
    if (bookmarkDeletedVal) {
      AppFunctions.showToast(AppStrings.bookmarkDeleted);
    } else {
      AppFunctions.showToast(AppStrings.noBookmarks);
    }
  }
}
