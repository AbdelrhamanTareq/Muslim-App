part of 'hadith_cubit.dart';

abstract class HadithState extends Equatable {
  const HadithState();

  @override
  List<Object> get props => [];
}

class HadithInitial extends HadithState {}

class GetSahihElbokharyDataLoadingState extends HadithState {}

class GetSahihElbokharyDataErrorState extends HadithState {
  final String error;

  const GetSahihElbokharyDataErrorState(this.error);
}

class GetSahihElbokharyDataSuccesState extends HadithState {
  final List<dynamic> data;

  const GetSahihElbokharyDataSuccesState(this.data);
}

