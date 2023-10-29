import 'package:equatable/equatable.dart';
import 'package:muslim_app/core/injection_container.dart';
import 'package:muslim_app/features/quran/data/local_data/quran_local_data.dart';

// part of 'quran_settings_cubit.dart';

class QuranSettingsState extends Equatable {
  @override
  List<Object> get props => [
        quranTextSize,
        lastRead!,
      ];

  final double quranTextSize;
  final String? lastRead;

  const QuranSettingsState({
    this.quranTextSize = 25,
    this.lastRead,
  });

  QuranSettingsState copyWith({
    double? quranTextSize,
    String? lastRead,
  }) {
    return QuranSettingsState(
      quranTextSize: quranTextSize ?? this.quranTextSize,
      lastRead: lastRead ?? instance<QuranLocalData>().getLastReadQuranSurh(),
    );
  }
}
