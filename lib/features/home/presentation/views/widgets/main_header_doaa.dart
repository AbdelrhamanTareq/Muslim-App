import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';

class MainHeaderDoaa extends StatelessWidget {
  const MainHeaderDoaa({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //TODO add to app settings
    HijriCalendar.setLocal("ar");
    var today = HijriCalendar.now();
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding: const EdgeInsets.all(8),
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            today.toFormat("dd MMMM yyyy"),
            //"استغفر الله العظيم الذي لا اله الا هو الحي القيوم و اتوب اليه",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          const Text(
            "استغفر الله العظيم الذي لا اله الا هو الحي القيوم و اتوب اليه",
            style: TextStyle(),
          ),
        ],
      ),
    );
  }
}
