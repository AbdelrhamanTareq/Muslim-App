import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/injection_container.dart';
import 'package:muslim_app/features/quran/data/local_data/quran_local_data.dart';

import 'quran_settings_state.dart';

class QuranSettingsCubit extends Cubit<QuranSettingsState> {
  QuranSettingsCubit(this._quranLocalData)
      : super(QuranSettingsState(
          lastRead: instance<QuranLocalData>().getLastReadQuranSurh(),
        ));

  final QuranLocalData _quranLocalData;

  void changeQuranTextSize(double quranTextSize) {
    _quranLocalData.setQuranTextSize(quranTextSize);
    emit(state.copyWith(quranTextSize: quranTextSize));
  }

// last read update methed
  void updateLastRead(String lastRead, int index) {
    _quranLocalData.setLastReadQuranSurh(lastRead);
    _quranLocalData.setLastReadQuranSurhIndex(index);
    emit(state.copyWith(lastRead: lastRead));
  }

  // double getQuranTextSize() {
  //   final double val = instance<QuranLocalData>().getQuranTextSize();
  //   emit(state.copyWith(quranTextSize: val));
  //   return val;
  // }
}
