import 'package:intl/intl.dart';

String dateFormater(DateTime dateTime) {
  final newDate = DateFormat("dd/MM/yyyy").format(dateTime);
  return newDate;
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
  } else if (now.hour > prayerTimes[3].hour && now.hour <= prayerTimes[4].hour) {
    return "العشاء";
  } else {
    return "الفجر";
  }
}
