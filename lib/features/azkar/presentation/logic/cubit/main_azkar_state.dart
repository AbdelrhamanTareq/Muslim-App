part of 'main_azkar_cubit.dart';

abstract class MainAzkarState extends Equatable {
  const MainAzkarState();

  @override
  List<Object> get props => [];
}

class AzkarInitial extends MainAzkarState {}


class GetMainAzkarDataLoading extends MainAzkarState {}

class GetMainAzkarDataError extends MainAzkarState {
  final String error;

  const GetMainAzkarDataError(this.error);
}

class GetMainAzkarDataSuccess extends MainAzkarState {
  final List<Azkar> data;

  const GetMainAzkarDataSuccess(this.data);
}
