part of 'app_drawer_cubit.dart';

class AppDrawerState extends Equatable {
  @override
  List<Object> get props => [quranTextSize,appTextSize,isDarkMode,enableNotifications,];

  final double quranTextSize;
  final double appTextSize;
  final bool isDarkMode;
  final bool enableNotifications;

  const AppDrawerState({
    this.appTextSize = 20,
    this.quranTextSize = 25,
    this.isDarkMode = false,
    this.enableNotifications = false,
  });

  AppDrawerState copyWith({
    double? quranTextSize,
    double? appTextSize,
    bool? isDarkMode,
    bool? enableNotifications,
  }) {
    return AppDrawerState(
      appTextSize: appTextSize ?? this.appTextSize,
      quranTextSize: quranTextSize ?? this.quranTextSize,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      enableNotifications: enableNotifications ?? this.enableNotifications,
    );
  }
}
