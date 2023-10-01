import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/features/quran/data/local_data/quran_local_data.dart';

import 'quran_settings_state.dart';


class QuranSettingsCubit extends Cubit<QuranSettingsState> {
  QuranSettingsCubit(this._quranLocalData) : super(const QuranSettingsState());

  final QuranLocalData _quranLocalData;

  void changeQuranTextSize(double quranTextSize) {
    _quranLocalData.setQuranTextSize(quranTextSize);
    emit(state.copyWith(quranTextSize: quranTextSize));
  }
}
