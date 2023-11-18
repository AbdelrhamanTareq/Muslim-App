part of 'prayer_time_cubit.dart';

// if failure happens what action button do
enum FaliureAction {
  relaod, // reload or call the function again
  navBack, // nav back to change settings and call function again
}

class PrayerTimeState extends Equatable {
  final String error;
  final bool isLoading;
  final Position? position;
  // final Map<int, Timings> data;
  final Map<String, Timings> data;
  final bool isLoadingGetLocation;
  final Placemark? addres;
  final String? country;
  final String? city;
  final int methods;
  final FaliureAction failureAction;
  @override
  List<Object?> get props => [
        error,
        isLoading,
        position,
        data,
        isLoadingGetLocation,
        addres,
        country,
        city,
        methods,
        failureAction,
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
    this.methods = 4,
    this.failureAction = FaliureAction.relaod,
  });

  PrayerTimeState copyWith({
    String? error,
    bool? isLoading,
    Position? position,
    // Map<int, Timings>? data,
    Map<String, Timings>? data,
    bool? isLoadingGetLocation,
    Placemark? addres,
    String? country,
    String? city,
    int? methods,
    FaliureAction? failureAction,
  }) {
    return PrayerTimeState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      position: position ?? this.position,
      data: data ?? this.data,
      isLoadingGetLocation: isLoadingGetLocation ?? this.isLoadingGetLocation,
      addres: addres ?? this.addres,
      country: country ?? this.country,
      city: city ?? this.city,
      methods: methods ?? this.methods,
      failureAction: failureAction ?? this.failureAction,
    );
  }
}
