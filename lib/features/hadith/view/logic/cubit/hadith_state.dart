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
  final List<Hadith> data;

  const GetSahihElbokharyDataSuccesState(this.data);
}

class AddHaithDataToDatabaseLoadingState extends HadithState {}

class AddHaithDataToDatabaseErrorState extends HadithState {
  final String error;

  const AddHaithDataToDatabaseErrorState(this.error);
}

class AddHaithDataToDatabaseSuccessState extends HadithState {
  const AddHaithDataToDatabaseSuccessState();
}
