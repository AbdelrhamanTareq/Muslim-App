import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:muslim_app/features/app_drawer/data/local_data/app_drawer_local_data.dart';

part 'app_drawer_state.dart';

class AppDrawerCubit extends Cubit<AppDrawerState> {
  final AppDrawerLocalData _appDrawerLocalData;
  AppDrawerCubit(this._appDrawerLocalData) : super(const AppDrawerState());

  void changeQuranTextSize(double textSize, BuildContext context) {
    _appDrawerLocalData.setQuranTextSize(textSize);
    emit(state.copyWith(quranTextSize: textSize));
  }

  void changeAppTextSize(double textSize) {
    _appDrawerLocalData.setAppTextSize(textSize);
    emit(state.copyWith(appTextSize: textSize));
  }

  void changeToDarkMode(bool isDarkMode) {
    emit(state.copyWith(isDarkMode: isDarkMode));
  }

  void enableNotifications(bool enableNotifications) {
    emit(state.copyWith(enableNotifications: enableNotifications));
  }
}
