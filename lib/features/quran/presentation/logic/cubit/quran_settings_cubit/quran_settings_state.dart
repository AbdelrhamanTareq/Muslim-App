import 'package:equatable/equatable.dart';

// part of 'quran_settings_cubit.dart';

class QuranSettingsState extends Equatable {
  @override
  List<Object> get props => [
        quranTextSize,
      ];

  final double quranTextSize;

  const QuranSettingsState({
    this.quranTextSize = 25,
  });

  QuranSettingsState copyWith({
    double? quranTextSize,
  }) {
    return QuranSettingsState(
      quranTextSize: quranTextSize ?? this.quranTextSize,
    );
  }
}
