part of 'azkar_cubit.dart';

abstract class AzkarState extends Equatable {
  const AzkarState();

  @override
  List<Object> get props => [];
}

class AzkarInitial extends AzkarState {}

class GetAzkarDataLoading extends AzkarState {}

class GetAzkarDataError extends AzkarState {
  final String error;

  const GetAzkarDataError(this.error);
}

class GetAzkarDataSuccess extends AzkarState {
  final List<Azkar> data;

  const GetAzkarDataSuccess(this.data);
}
