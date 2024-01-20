part of 'favorite_cubit.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class GetFavoriteHadithLoadingState extends FavoriteState {}

class GetFavoriteHadithLoadedState extends FavoriteState {
  final FavHadithModel favHadithModel;

  const GetFavoriteHadithLoadedState({required this.favHadithModel});
}

class GetFavoriteHadithErrorState extends FavoriteState {
  final String error;

  const GetFavoriteHadithErrorState({required this.error});
}
