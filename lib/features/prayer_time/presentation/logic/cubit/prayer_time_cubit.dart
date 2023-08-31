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

import 'package:muslim_app/features/prayer_time/data/models/prayer_time.dart';
import 'package:muslim_app/features/prayer_time/data/repo/prayer_time_repo.dart';

import '../../../../../core/data/app_local_data.dart';
import '../../../../../core/function.dart';
import '../../../../../core/injection_container.dart';
import '../../../../../core/themes/app_colors.dart';

part 'prayer_time_state.dart';

class PrayerTimeCubit extends Cubit<PrayerTimeState> {
  PrayerTimeCubit(this._prayerTimeRepo) : super(const PrayerTimeState());

  final PrayerTimeRepo _prayerTimeRepo;

  getPrayerTimeData(
      {required String city,
      required String country,
      required int methods}) async {
    emit(state.copyWith(isLoading: true));
    final dataOrError = await _prayerTimeRepo.getPrayerTimeData(
        city: city, country: country, methods: methods);
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
      showToast(AppStrings.locationServicesDisabledText,
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
        showToast(AppStrings.locationServicesDeniedText,
            color: AppColors.error);
        emit(state.copyWith(
            error: AppStrings.locationServicesDeniedText,
            isLoadingGetLocation: false));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      showToast(AppStrings.locationServicesPermentDeniedText,
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
        instance<AppLocalData>()
            .setLatAndLong(lat: position.latitude, long: position.longitude);
        emit(state.copyWith(
            position: position,
            isLoadingGetLocation: false,
            addres: placemark));
        showToast(AppStrings.locationFounded);
      } catch (e) {
        emit(state.copyWith(error: e.toString(), isLoadingGetLocation: false));
      }
    } else {
      showToast(OtherFaliure().errorMessage, color: AppColors.error);
      emit(state.copyWith(
          error: OtherFaliure().errorMessage, isLoadingGetLocation: false));
    }
  }

  Future<Placemark> getAddressFromLatLng(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    emit(state.copyWith(addres: placemarks[0]));
    instance<AppLocalData>().setAddress(data: placemarks[0].toJson());
    return placemarks[0];
  }

  getCity(String city) async {
    await instance<AppLocalData>().setCity(data: city);
    emit(state.copyWith(city: city));
  }

  getCountry(String country) async {
    await instance<AppLocalData>().setCountry(data: country);
    emit(state.copyWith(country: country));
  }

  changePrayerTimesMethods(int method) async {
    await instance<AppLocalData>().setPrayerTimesMethoed(data: method);
    emit(state.copyWith(methods: method));
  }

  void prayerScheduleTimesNotifaction({required Map<int, Timings>? data}) {
    if (data == null || data == {} || data.isEmpty) {
      return;
    }
    // final now = DateTime.now();
    int finalDate = convertDateToTimeStampInInt();

    final prayerTimesSoundsEnable =
        instance<AppLocalData>().getPrayerTimesSound();
    final prayerTimesList = [
      toTimeOfDay(stringDate: data[finalDate]?.fajr),
      toTimeOfDay(stringDate: data[finalDate]?.dhuhr),
      toTimeOfDay(stringDate: data[finalDate]?.asr),
      toTimeOfDay(stringDate: data[finalDate]?.maghrib),
      toTimeOfDay(stringDate: data[finalDate]?.isha),
      // DateTime(now.year, now.month, now.day, 12, 30, 00),
      // DateTime(now.year, now.month, now.day, 12, 31, 00),
      // DateTime(now.year, now.month, now.day, 12, 32, 00),
      // DateTime(now.year, now.month, now.day, 12, 33, 00),
      // DateTime(now.year, now.month, now.day, 12, 34, 00),
      
      
      
    ];
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
  // void prayerTimesNotifaction1() {
  //   final now = DateTime.now();
  //   // int finalDate = convertDateToTimeStampInInt();
  //   // AppNotification().showScheduleNotification(title: "yyyyyyyyyy",body: "fghfghgfhfghfgh");
  //   final timesList = [
  //     DateTime(now.year, now.month, now.day, 11, 15, 00),
  //     DateTime(now.year, now.month, now.day, 11, 20, 00),
  //     DateTime(now.year, now.month, now.day, 11, 25, 00),
  //     DateTime(now.year, now.month, now.day, 11, 30, 00),
  //     DateTime(now.year, now.month, now.day, 11, 35, 00),
  //   ];
  //   for (var i = 0; i < timesList.length; i++) {
  //     AppNotification().showScheduleNotification(
  //         id: i,
  //         hour: timesList[i].hour,
  //         minutes: timesList[i].minute,
  //         title: _getTitle(i),
  //         body: _getBody(i));
  //   }
  // }

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

  void prayerTimesNotifaction({Map<int, Timings>? data}) {
    // Timer timer;
    // var finalDate = convertDateToTimeStampInInt();
    // final prayerTimesList = [
    //   toTimeOfDay(stringDate: data[finalDate]!.fajr),
    //   toTimeOfDay(stringDate: data[finalDate]!.dhuhr),
    //   toTimeOfDay(stringDate: data[finalDate]!.asr),
    //   toTimeOfDay(stringDate: data[finalDate]!.maghrib),
    //   toTimeOfDay(stringDate: data[finalDate]!.isha),
    // ];
    //final now = DateTime.now();
    // final AppNotification appNotification = AppNotification();

    // print(prayerTimes[0].hour);
    // print(prayerTimes[1].hour);
    // print(prayerTimes[2].hour);
    // print(prayerTimes[3].hour);
    // print(prayerTimes[4].hour);

    //   if (now == (prayerTimesList[1])) {
    //     appNotification.showNotification(
    //         title: "اذان الظهر", body: "حان الان موعد اذان الظهر");
    //   } else if (now == (prayerTimesList[2])) {
    //     appNotification.showNotification(
    //         title: "اذان العصر", body: "حان الان موعد اذان العصر");
    //   } else if (now == (prayerTimesList[3])) {
    //     appNotification.showNotification(
    //         title: "اذان المغرب", body: "حان الان موعد اذان المغرب");
    //   } else if (now == (prayerTimesList[4])) {
    //     appNotification.showNotification(
    //         title: "اذان العشاء", body: "حان الان موعد اذان العشاء");
    //   } else if (now == (prayerTimesList[0])) {
    //     appNotification.showNotification(
    //         title: "اذان الفجر", body: "حان الان موعد اذان الفجر");
    //   }
    //   timer = Timer.periodic(Duration(hours: 1), (timer) {
    //     print("xxxxxxxxxx");

    //     // AppNotification().showNotification(title: "اذان الظهر", body: "حان الان موعد اذان الظهر");
    //     if (now.hour == DateTime(now.year, now.month, now.day, 13, 0, 0).hour) {
    //       AppNotification().showNotification(
    //           title: "اذان الظهر", body: "حان الان موعد اذان الظهر");
    //       print("22");
    //     } else if (now.hour ==
    //         DateTime(now.year, now.month, now.day, 16, 30, 0).hour) {
    //       AppNotification().showNotification(
    //           title: "اذان العصر", body: "حان الان موعد اذان العصر");
    //       print("33");
    //     } else if (now.hour ==
    //         DateTime(now.year, now.month, now.day, 20, 0, 0).hour) {
    //       AppNotification().showNotification(
    //           title: "اذان المغرب", body: "حان الان موعد اذان المغرب");
    //       print("44");
    //     } else if (now.hour ==
    //         DateTime(now.year, now.month, now.day, 21, 30, 0).hour) {
    //       AppNotification().showNotification(
    //           title: "اذان العشاء", body: "حان الان موعد اذان العشاء");
    //       print("55");
    //     } else if (now.hour ==
    //         DateTime(now.year, now.month, now.day, 4, 30, 0).hour) {
    //       AppNotification().showNotification(
    //           title: "اذان الفجر", body: "حان الان موعد اذان الفجر");
    //       print("11");
    //     }
    //   });
  }
}
