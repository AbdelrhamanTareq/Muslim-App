import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'hadith_settings_state.dart';

class HadithSettingsCubit extends Cubit<HadithSettingsState> {
  HadithSettingsCubit() : super(HadithSettingsInitial());
}
