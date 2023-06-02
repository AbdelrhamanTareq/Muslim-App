part of 'sebha_cubit.dart';

class SebhaState extends Equatable {
  @override
  List<Object> get props =>
      [initValue, maxValue, isMusicEnalbe, isVibrationEnalbe];

  final double initValue;
  final double maxValue;
  final bool isVibrationEnalbe;
  final bool isMusicEnalbe;

  const SebhaState({
    this.initValue = 0,
    this.maxValue = 33,
    this.isMusicEnalbe = false,
    this.isVibrationEnalbe = false,
  });

  SebhaState copyWith({
    double? initValue,
    double? maxValue,
    bool? isMusicEnalbe,
    bool? isVibrationEnalbe,
  }) {
    return SebhaState(
      initValue: initValue ?? this.initValue,
      maxValue: maxValue ?? this.maxValue,
      isMusicEnalbe: isMusicEnalbe ?? this.isMusicEnalbe,
      isVibrationEnalbe: isVibrationEnalbe ?? this.isVibrationEnalbe,
    );
  }
}
