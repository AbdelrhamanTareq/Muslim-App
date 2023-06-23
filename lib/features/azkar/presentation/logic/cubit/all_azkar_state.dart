part of 'all_azkar_cubit.dart';

abstract class AllAzkarState extends Equatable {
  const AllAzkarState();

  @override
  List<Object> get props => [];
}

class AllAzkarInitial extends AllAzkarState {}


class GetAllAzkarDataLoading extends AllAzkarState {}

class GetAllAzkarDataError extends AllAzkarState {
  final String error;

  const GetAllAzkarDataError(this.error);
}

class GetAllAzkarDataSuccess extends AllAzkarState {
  final List<Azkar> data;

  const GetAllAzkarDataSuccess(this.data);
}