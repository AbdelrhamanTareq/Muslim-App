import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sebha_state.dart';

class SebhaCubit extends Cubit<SebhaState> {
  SebhaCubit() : super(const SebhaState());

  void add() {
    if (state.initValue <= state.maxValue) {
      emit(state.copyWith(initValue: state.initValue + 1));
    }
  }

  void reset() {
    emit(
      state.copyWith(initValue: 0),
    );
  }

  void changeMaxValue(double maxValue) {
    state.copyWith(maxValue: maxValue);
  }
}
