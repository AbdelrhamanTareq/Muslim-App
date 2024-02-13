part of 'hadith_cubit.dart';

abstract class HadithState extends Equatable {
  const HadithState();

  @override
  List<Object> get props => [];
}

class HadithInitial extends HadithState {}

class GetHadithDataByBooknamLoadingState extends HadithState {}

class GetHadithDataByBooknamErrorState extends HadithState {
  final String error;

  const GetHadithDataByBooknamErrorState(this.error);
}

class GetHadithDataByBooknamSuccesState extends HadithState {
  final List<Hadith> data;

  const GetHadithDataByBooknamSuccesState(this.data);
}

class AddHaithDataToDatabaseLoadingState extends HadithState {}

class AddHaithDataToDatabaseErrorState extends HadithState {
  final String error;

  const AddHaithDataToDatabaseErrorState(this.error);
}

class AddHaithDataToDatabaseSuccessState extends HadithState {
  const AddHaithDataToDatabaseSuccessState();
}
