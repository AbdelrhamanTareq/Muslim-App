import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:muslim_app/core/themes/app_colors.dart';
import 'package:muslim_app/core/utils/app_assets.dart';

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
      // height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        // color: Colors.white,
        // color: const Color(0xff9EB0A2),
        color: Color.fromARGB(255, 125, 222, 255),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      // EDITED
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            today.toFormat("dd MMMM yyyy"),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Divider(
            color: AppColors.black,
          ),
          Text(
            "استغفر الله العظيم الذي لا اله الا هو الحي القيوم و اتوب اليه",
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      AppAssets.quranSvgPath,
                      width: 25,
                      height: 25,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text("اخر قراءة"),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "سورة البقرة",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
