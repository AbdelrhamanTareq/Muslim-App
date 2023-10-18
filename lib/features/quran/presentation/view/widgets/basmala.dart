import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/injection_container.dart';
import 'package:muslim_app/core/utils/app_extensions.dart';
import 'package:muslim_app/core/utils/arabic_num_converter.dart';
import 'package:muslim_app/features/quran/data/local_data/quran_local_data.dart';

import '../../logic/cubit/quran_settings_cubit/quran_settings_cubit.dart';
import '../../logic/cubit/quran_settings_cubit/quran_settings_state.dart';

class Basmala extends StatelessWidget {
  const Basmala({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<QuranSettingsCubit, QuranSettingsState>(
          builder: (context, state) {
        return Text(
          "بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ",
          // EDITED
          style: context.displayMedium!.copyWith(
              fontSize: instance<QuranLocalData>().getQuranTextSize(), color: context.blackLightColor),
        );
      }),
    );
  }
}

// basmal for fataha
// remove basmal aya from json file
//(make it empty string so that the count still work)

class BasmalaFataha extends StatelessWidget {
  const BasmalaFataha({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<QuranSettingsCubit, QuranSettingsState>(
          builder: (context, state) {
        return Text(
          "بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ${1.toArabicNumbers}",
          // EDITED
          style: context.displayMedium!.copyWith(
              fontSize: instance<QuranLocalData>().getQuranTextSize(), color: context.blackLightColor),
        );
      }),
    );
  }
}
