import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/injection_container.dart';
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
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
              fontSize: instance<QuranLocalData>().getQuranTextSize()),
        );
      }),
    );
  }
}
