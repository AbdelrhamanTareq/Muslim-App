part of 'hadith_cubit.dart';

class HadithState extends Equatable {
  const HadithState({
    this.data = const [],
    this.error = "",
    this.isChangeFavState = false,
    this.isLoading = false,
    this.fav = const {},
  });

  final List<Hadith> data;
  final String error;
  final bool isChangeFavState;
  final bool isLoading;
  final Map<int, bool> fav;

  HadithState copyWith({
    List<Hadith>? data,
    String? error,
    bool? isChangeFavState,
    bool? isLoading,
    Map<int, bool>? fav,
  }) {
    return HadithState(
        data: data ?? this.data,
        error: error ?? this.error,
        isChangeFavState: isChangeFavState ?? this.isChangeFavState,
        isLoading: isLoading ?? this.isLoading,
        fav: fav ?? this.fav);
  }

  @override
  List<Object> get props => [data, error, isChangeFavState, isLoading];
}

// class HadithInitial extends HadithState {}

// class GetHadithDataByBooknamLoadingState extends HadithState {}

// class GetHadithDataByBooknamErrorState extends HadithState {
//   final String error;

//   const GetHadithDataByBooknamErrorState(this.error);
// }

// class GetHadithDataByBooknamSuccesState extends HadithState {
//   final List<Hadith> data;

//   const GetHadithDataByBooknamSuccesState(this.data);
// }

// class AddHaithDataToDatabaseLoadingState extends HadithState {}

// class AddHaithDataToDatabaseErrorState extends HadithState {
//   final String error;

//   const AddHaithDataToDatabaseErrorState(this.error);
// }

// class AddHaithDataToDatabaseSuccessState extends HadithState {
//   const AddHaithDataToDatabaseSuccessState();
// }

// class ChangeFavState extends HadithState {
//   const ChangeFavState();
// }
