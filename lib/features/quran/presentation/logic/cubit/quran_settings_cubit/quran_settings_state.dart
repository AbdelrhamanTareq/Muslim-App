import 'package:equatable/equatable.dart';
import 'package:muslim_app/core/utils/app_strings.dart';

// part of 'quran_settings_cubit.dart';

class QuranSettingsState extends Equatable {
  @override
  List<Object> get props => [
        quranTextSize,
      ];

  final double quranTextSize;
  final String lastRead;

  const QuranSettingsState({
    this.quranTextSize = 25,
    this.lastRead = AppStrings.noLastRead,
  });

  QuranSettingsState copyWith({
    double? quranTextSize,
    String? lastRead,
  }) {
    return QuranSettingsState(
      quranTextSize: quranTextSize ?? this.quranTextSize,
      lastRead: lastRead ?? this.lastRead,
    );
  }
}
