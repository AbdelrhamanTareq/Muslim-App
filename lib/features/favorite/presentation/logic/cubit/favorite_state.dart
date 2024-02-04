part of 'favorite_cubit.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class GetFavoriteHadithLoadingState extends FavoriteState {}

class GetFavoriteHadithLoadedState extends FavoriteState {
  final List<FavHadithModel> favHadithModel;

  const GetFavoriteHadithLoadedState({required this.favHadithModel});
}

class GetFavoriteHadithErrorState extends FavoriteState {
  final String error;

  const GetFavoriteHadithErrorState({required this.error});
}

class GetFavoriteHadithByBookNameLoadingState extends FavoriteState {}


class GetFavoriteHadithByBookNameLoadedState extends FavoriteState {
  final List<FavHadithModel> favHadithModel;

  const GetFavoriteHadithByBookNameLoadedState({required this.favHadithModel});
}

class GetFavoriteHadithByBookNameErrorState extends FavoriteState {
  final String error;

  const GetFavoriteHadithByBookNameErrorState({required this.error});
}
