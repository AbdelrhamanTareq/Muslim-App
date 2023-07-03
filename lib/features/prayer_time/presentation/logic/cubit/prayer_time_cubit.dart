// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
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

  getPrayerTimeData({required String city, required String country}) async {
    emit(state.copyWith(isLoading: true));
    final dataOrError =
        await _prayerTimeRepo.getPrayerTimeData(city: city, country: country);
    dataOrError.fold(
      (error) {
        //print(error.errorMessage);
        emit(state.copyWith(error: error.errorMessage, isLoading: false));
      },
      (data) {
        emit(
          state.copyWith(data: data, isLoading: false),
        );
      },
    );
  }

  getPrayerTimeDataByLocation(
      {required String lat, required String long}) async {
    // final List<String> list = instance<AppLocalData>().getLatAndLong() ?? [];
    // String latttuide = (list[0].isNotEmpty) ? list[0] : lat!;
    // String longitude = (list[0].isNotEmpty) ? list[1] : long!;
    emit(state.copyWith(isLoading: true));
    final dataOrError =
        await _prayerTimeRepo.getPrayerTimeDataByLatLong(lat: lat, long: long);
    dataOrError.fold(
      (error) {
        //print(error.errorMessage);
        emit(state.copyWith(error: error.errorMessage, isLoading: false));
      },
      (data) {
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
//TODO add internet connection checker
    emit(state.copyWith(isLoadingGetLocation: true));
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    try {
      final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      final placemark = await getAddressFromLatLng(position);
      // print(position.latitude);
      // print(position.longitude);
      instance<AppLocalData>()
          .setLatAndLong(lat: position.latitude, long: position.longitude);
      emit(state.copyWith(
          position: position, isLoadingGetLocation: false, addres: placemark));
      showToast("تم ايجاد الموقع");
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoadingGetLocation: false));
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
}
