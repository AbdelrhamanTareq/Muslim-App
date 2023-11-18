// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:muslim_app/core/errors/erros.dart';
import 'package:muslim_app/core/utils/app_notifications.dart';
import 'package:muslim_app/core/utils/app_strings.dart';
import 'package:muslim_app/features/prayer_time/data/local_data/prayer_time_local_data.dart';

import 'package:muslim_app/features/prayer_time/data/models/prayer_time.dart';
import 'package:muslim_app/features/prayer_time/data/repo/prayer_time_repo.dart';

import '../../../../../core/data/app_local_data.dart';
import '../../../../../core/functions.dart';
import '../../../../../core/injection_container.dart';
import '../../../../../core/themes/app_colors.dart';

part 'prayer_time_state.dart';

class PrayerTimeCubit extends Cubit<PrayerTimeState> {
  PrayerTimeCubit(this._prayerTimeRepo) : super(const PrayerTimeState());

  final PrayerTimeRepo _prayerTimeRepo;

  final _prayerTimeLocalDataInstance = instance<PrayerTimeLocalDate>();

  getPrayerTimeData({
    required String city,
    required String country,
    required int methods,
  }) async {
    emit(state.copyWith(isLoading: true));
    final dataOrError = await _prayerTimeRepo.getPrayerTimeData(
        city: city, country: country, methods: methods);
    dataOrError.fold(
      (error) {
        //print(error.errorMessage);
        if (city != "" && country != "") {
          emit(state.copyWith(
              error: error.errorMessage,
              isLoading: false,
              failureAction: FaliureAction.navBack));
        } else {
          emit(state.copyWith(
              error: error.errorMessage,
              isLoading: false,
              failureAction: FaliureAction.relaod));
        }
      },
      (data) {
        // prayerScheduleTimesNotifaction(data: data);
        emit(
          state.copyWith(data: data, isLoading: false),
        );
      },
    );
  }

  getPrayerTimeDataByLocation(
      {required String lat, required String long, required int methods}) async {
    emit(state.copyWith(isLoading: true));
    final dataOrError = await _prayerTimeRepo.getPrayerTimeDataByLatLong(
        lat: lat, long: long, methods: methods);
    dataOrError.fold(
      (error) {
        //print(error.errorMessage);
        emit(state.copyWith(error: error.errorMessage, isLoading: false));
      },
      (data) {
        prayerScheduleTimesNotifaction(data: data);

        emit(
          state.copyWith(data: data, isLoading: false),
        );
      },
    );
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      AppFunctions.showToast(AppStrings.locationServicesDisabledText,
          color: AppColors.error);
      emit(state.copyWith(
          error: AppStrings.locationServicesDisabledText,
          isLoadingGetLocation: false));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        AppFunctions.showToast(AppStrings.locationServicesDeniedText,
            color: AppColors.error);
        emit(state.copyWith(
            error: AppStrings.locationServicesDeniedText,
            isLoadingGetLocation: false));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      AppFunctions.showToast(AppStrings.locationServicesPermentDeniedText,
          color: AppColors.error);
      emit(state.copyWith(
          error: AppStrings.locationServicesPermentDeniedText,
          isLoadingGetLocation: false));
      return false;
    }
    return true;
  }

  Future<void> getCurrentPosition() async {
    emit(state.copyWith(isLoadingGetLocation: true));
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    if (await InternetConnectionChecker().hasConnection) {
      try {
        final position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);

        final placemark = await getAddressFromLatLng(position);
        // print(position.latitude);
        // print(position.longitude);

        _prayerTimeLocalDataInstance.setLatAndLong(
            lat: position.latitude, long: position.longitude);
        emit(state.copyWith(
            position: position,
            isLoadingGetLocation: false,
            addres: placemark));
        AppFunctions.showToast(AppStrings.locationFounded);
      } catch (e) {
        emit(state.copyWith(error: e.toString(), isLoadingGetLocation: false));
      }
    } else {
      AppFunctions.showToast(OtherFaliure().errorMessage,
          color: AppColors.error);
      emit(state.copyWith(
          error: OtherFaliure().errorMessage, isLoadingGetLocation: false));
    }
  }

  Future<Placemark> getAddressFromLatLng(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    emit(state.copyWith(addres: placemarks[0]));
    _prayerTimeLocalDataInstance.setAddress(data: placemarks[0].toJson());
    return placemarks[0];
  }

  getCity(String city) async {
    emit(state.copyWith(city: city));
  }

  getCountry(String country) async {
    emit(state.copyWith(country: country));
  }

  saveCityAndCountry({required String city, required String country}) async {
    await _prayerTimeLocalDataInstance.setCity(data: city);
    await _prayerTimeLocalDataInstance.setCountry(data: country);
  }

  changePrayerTimesMethods(int method) async {
    await _prayerTimeLocalDataInstance.setPrayerTimesMethoed(data: method);
    emit(state.copyWith(methods: method));
  }

  void prayerScheduleTimesNotifaction({required Map<String, Timings>? data}) {
    if (data == null || data == {} || data.isEmpty) {
      return;
    }
    String todayDate = AppFunctions.todayFormatter();
    Timings? timings = data[todayDate];
    ;

    final prayerTimesSoundsEnable =
        instance<AppLocalData>().getPrayerTimesSound();
    // final prayerTimesList = [
    //   // AppFunctions.toTimeOfDay(stringDate: data[finalDate]?.fajr),
    //   // AppFunctions.toTimeOfDay(stringDate: data[finalDate]?.dhuhr),
    //   // AppFunctions.toTimeOfDay(stringDate: data[finalDate]?.asr),
    //   // AppFunctions.toTimeOfDay(stringDate: data[finalDate]?.maghrib),
    //   // AppFunctions.toTimeOfDay(stringDate: data[finalDate]?.isha),
    // ];
    final prayerTimesList = AppFunctions.prayerTimesList(
      fajr: timings!.fajr,
      dhuhr: timings.dhuhr,
      asr: timings.asr,
      maghrib: timings.maghrib,
      isha: timings.isha,
    );
    for (var i = 0; i < prayerTimesList.length; i++) {
      AppNotification().showScheduleNotification(
        id: i,
        hour: prayerTimesList[i].hour,
        minutes: prayerTimesList[i].minute,
        title: _getTitle(i),
        body: _getBody(i),
        playSound: prayerTimesSoundsEnable[i] ? true : false,
      );
    }
  }

  String _getTitle(int i) {
    switch (i) {
      case 0:
        return "صلاة الفجر";
      case 1:
        return "صلاة الظهر";
      case 2:
        return "صلاة العصر";
      case 3:
        return "صلاة المغرب";
      case 4:
        return "صلاة العشاء";
      default:
        return "صلاة الفجر";
    }
  }

  String _getBody(int i) {
    switch (i) {
      case 0:
        return "حان الان موعد صلاة الفجر";
      case 1:
        return " حان الان موعد صلاة الظهر";
      case 2:
        return " حان الان موعد صلاة العصر";
      case 3:
        return " حان الان موعد صلاة المغرب";
      case 4:
        return "حان الان موعد صلاة العشاء";
      default:
        return "حان الان موعد صلاة الفجر";
    }
  }
}
