part of 'prayer_time_cubit.dart';

// abstract class PrayerTimeState extends Equatable {
//   const PrayerTimeState();

//   @override
//   List<Object> get props => [];
// }

// class PrayerTimeInitial extends PrayerTimeState {}

// class GetPrayerTimeDataLoading extends PrayerTimeState {}

// class GetPrayerTimeDataSuccess extends PrayerTimeState {
//   final Map<int, Timings> data;

//   const GetPrayerTimeDataSuccess(this.data);
// }

// class GetLoactionByLocationServiceSucces2 extends PrayerTimeState {
//   final Position position;

//   const GetLoactionByLocationServiceSucces2(this.position);
// }
// class GetPrayerTimeDataError extends PrayerTimeState {
//   final String error;

//   const GetPrayerTimeDataError(this.error);
// }

class PrayerTimeState extends Equatable {
  final String error;
  final bool isLoading;
  final Position? position;
  final Map<int, Timings> data;
  final bool isLoadingGetLocation;
  final Placemark? addres;
  final String? country;
  final String? city;
  @override
  List<Object?> get props => [
        error,
        isLoading,
        position,
        data,
        isLoadingGetLocation,
        addres,
        country,
        city
      ];
  const PrayerTimeState({
    this.error = "",
    this.isLoading = false,
    this.position,
    this.data = const {},
    this.isLoadingGetLocation = false,
    this.addres,
    this.city,
    this.country,
  });

  PrayerTimeState copyWith({
    String? error,
    bool? isLoading,
    Position? position,
    Map<int, Timings>? data,
    bool? isLoadingGetLocation,
    Placemark? addres,
    String? country,
    String? city,
  }) {
    return PrayerTimeState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      position: position ?? this.position,
      data: data ?? this.data,
      isLoadingGetLocation: isLoadingGetLocation ?? this.isLoadingGetLocation,
      addres: addres ?? this.addres,
      country: country ?? this.country,
      city: city ?? city,
    );
  }
}
