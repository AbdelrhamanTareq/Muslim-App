part of 'prayer_time_cubit.dart';

abstract class PrayerTimeState extends Equatable {
  const PrayerTimeState();

  @override
  List<Object> get props => [];
}

class PrayerTimeInitial extends PrayerTimeState {}

class GetPrayerTimeDataLoading extends PrayerTimeState {}

class GetPrayerTimeDataSuccess extends PrayerTimeState {
  final PrayerTime data;

  GetPrayerTimeDataSuccess(this.data);
}

class GetPrayerTimeDataError extends PrayerTimeState {
  final String error;

  const GetPrayerTimeDataError(this.error);
}
