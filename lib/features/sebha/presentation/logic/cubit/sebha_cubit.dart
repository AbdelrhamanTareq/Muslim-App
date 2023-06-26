import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:muslim_app/core/utils/app_assets.dart';
import 'package:vibration/vibration.dart';

part 'sebha_state.dart';

class SebhaCubit extends Cubit<SebhaState> {
  SebhaCubit() : super(const SebhaState());

  void add(context) {
    if (state.initValue < state.maxValue) {
      emit(state.copyWith(initValue: state.initValue + 1));
    }
    if (state.initValue == state.maxValue) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("تم الوصول لعدد التسبيح المطلوب")));
    }
    vibration();
  }

  void reset() {
    emit(
      state.copyWith(initValue: 0),
    );
  }

  void changeMaxValue(double maxValue) {
    emit(
      state.copyWith(maxValue: maxValue),
    );
  }

  void enableVibrate() {
    if (state.isVibrationEnalbe == false) {
      Vibration.vibrate();
    }
    emit(
      state.copyWith(isVibrationEnalbe: !state.isVibrationEnalbe),
    );
  }

  void enableMusic() {
    if (state.isMusicEnalbe == false) {
      AudioPlayer().play(AssetSource(AppAssets.clickSoundPath));
    }
    emit(
      state.copyWith(isMusicEnalbe: !state.isMusicEnalbe),
    );
  }

  void startMusicSound() {
    if (state.isMusicEnalbe) {
      AudioPlayer().play(AssetSource(AppAssets.clickSoundPath));
    }
  }

  void vibration() {
    if (state.isVibrationEnalbe) {
      if (state.initValue == state.maxValue && state.initValue != 0) {
        Vibration.vibrate();
      }
    }
  }
}
