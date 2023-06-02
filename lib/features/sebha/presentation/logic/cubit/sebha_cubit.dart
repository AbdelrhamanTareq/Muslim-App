import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vibration/vibration.dart';

part 'sebha_state.dart';

class SebhaCubit extends Cubit<SebhaState> {
  SebhaCubit() : super(const SebhaState());

  void add() {
    if (state.initValue < state.maxValue) {
      emit(state.copyWith(initValue: state.initValue + 1));
    }
    vibration();
  }

  void reset() {
    emit(
      state.copyWith(initValue: 0),
    );
  }

  void changeMaxValue(double maxValue) {
    state.copyWith(maxValue: maxValue);
  }

  void enableVibrate() {
    emit(
      state.copyWith(isVibrationEnalbe: true),
    );
  }

  void vibration() {
    if (state.isVibrationEnalbe) {
      if (state.initValue == state.maxValue && state.initValue != 0) {
        Vibration.vibrate();
      }
    }
  }
}
