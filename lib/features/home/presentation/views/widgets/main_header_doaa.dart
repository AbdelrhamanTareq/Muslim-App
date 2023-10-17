import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:muslim_app/core/themes/app_colors.dart';
import 'package:muslim_app/core/utils/app_assets.dart';
import 'package:muslim_app/core/utils/app_strings.dart';
import 'package:muslim_app/features/quran/presentation/logic/cubit/quran_settings_cubit/quran_settings_cubit.dart';
import 'package:muslim_app/features/quran/presentation/logic/cubit/quran_settings_cubit/quran_settings_state.dart';

import '../../../../../core/injection_container.dart';
import '../../../../quran/data/local_data/quran_local_data.dart';

class MainHeaderDoaa extends StatelessWidget {
  const MainHeaderDoaa({
    super.key,
  });

  // String _lastRead = instance<QuranLocalData>().getLastReadQuranSurh();
  @override
  Widget build(BuildContext context) {
    //TODO add to app settings
    HijriCalendar.setLocal("ar");
    var today = HijriCalendar.now();
    var _textTheme = Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(color: AppColors.white);
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
            style: _textTheme,
          ),
          const Divider(
            color: AppColors.white,
          ),
          Text(
            "استغفر الله العظيم الذي لا اله الا هو الحي القيوم و اتوب اليه",
            style: _textTheme,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
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
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      AppStrings.lastRead,
                      style: _textTheme,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    BlocBuilder<QuranSettingsCubit, QuranSettingsState>(
                        builder: (context, state) {
                      return Text(
                        "سورة ${instance<QuranLocalData>().getLastReadQuranSurh()}",
                        style: _textTheme,
                        textAlign: TextAlign.center,
                      );
                    }),
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
