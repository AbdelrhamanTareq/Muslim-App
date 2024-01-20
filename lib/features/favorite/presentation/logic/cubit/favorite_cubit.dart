// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:muslim_app/features/favorite/data/local%20data/favorites_local_data.dart';
import 'package:muslim_app/features/favorite/data/models/fav_hadith_model.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.favoritesLocalData) : super(FavoriteInitial());
  final FavoritesLocalData favoritesLocalData;

  void getFavHadithData() {
    emit(GetFavoriteHadithLoadingState());
    final data = favoritesLocalData.getFavHadithLocalData();
    if (data != null) {
      emit(GetFavoriteHadithLoadedState(favHadithModel: data));
    } else {
      emit(const GetFavoriteHadithErrorState(error: "No Data"));
    }
  }
}