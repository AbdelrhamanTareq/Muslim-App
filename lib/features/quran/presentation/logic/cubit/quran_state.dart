part of 'quran_cubit.dart';

@immutable
abstract class QuranState extends Equatable {}

class QuranInitial extends QuranState {
  @override
  List<Object?> get props => [];
}

class QuranGetAllDataLoading extends QuranState {
  @override
  List<Object?> get props => [];
}
class QuranGetAllDataSucces extends QuranState {
  final List<Quran> data;

  QuranGetAllDataSucces(this.data);
  @override
  List<Object?> get props => [data];
}
class QuranGetAllDataError extends QuranState {
  final String error;

  QuranGetAllDataError(this.error);
  @override
  List<Object?> get props => [error];
}
