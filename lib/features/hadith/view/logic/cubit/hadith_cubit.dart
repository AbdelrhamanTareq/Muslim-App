// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:muslim_app/features/favorite/data/local%20data/favorites_local_data.dart';
import 'package:muslim_app/features/favorite/data/models/fav_hadith_model.dart';
import 'package:muslim_app/features/hadith/data/models/hadith.dart';

import 'package:muslim_app/features/hadith/data/repo/hadith_reop.dart';

part 'hadith_state.dart';

class HadithCubit extends Cubit<HadithState> {
  final HadithRepo hadithRepo;
  final FavoritesLocalData favoritesLocalData;
  HadithCubit(
    this.hadithRepo,
    this.favoritesLocalData,
  ) : super(const HadithState());

  Map<int, bool> _favorites = {};

  Future getHadithDataByBookName(String bookName) async {
    emit(state.copyWith(isLoading: true));
    final dataOrError = await hadithRepo.getHadithDatabyBookName(bookName);

    dataOrError.fold(
      (error) =>
          emit(state.copyWith(error: error.errorMessage, isLoading: false)),
      (data) {
        for (var e in data) {
          _favorites.addAll({e.number: e.isFavorite});
        }
        log("$_favorites");
        emit(state.copyWith(isLoading: false, data: data, fav: _favorites));
      },
    );
  }

  addOrRemvoeFavorite({
    required int number,
    required String bookPathInDB,
    required String bookName,
    required Hadith newdata,
  }) {
    bool oldVal = _favorites[number]!;
    _favorites[number] = !_favorites[number]!;
    bool newVal = !oldVal;
    emit(state.copyWith(isChangeFavState: !state.isChangeFavState));
    var box = Hive.box(bookPathInDB);
    // box.

    box.putAt(number - 1, newdata.copyWith(isFavorite: newVal));
    final String key = "$bookPathInDB + ${newdata.number}";
    if (newVal) {
      favoritesLocalData.setFavHadithLocalData(
          val: FavHadithModel(
              hadithData: newdata.arab,
              hadithBook: bookName,
              hadithNumber: newdata.number,
              key: key,
              bookPath: bookPathInDB),
          key: key);
    } else {
      favoritesLocalData.deleteFavHadithLocalData(key: key);
    }

    log("${box.length}");
    // log("${box.}");
    // box.put(id, !_favorites[id]!);
    // box.values.forEach((element) {
    //   log("${element.toString()}");
    // });

    // List<Hadith> data = box.get(bookPathInDB);
  }

  Future addHadithDataToDatabase() async {
    emit(state.copyWith(isLoading: true));

    final dataOrError = await hadithRepo.addHadithsBooksToDatabase();
    dataOrError.fold(
        (error) =>
            emit(state.copyWith(error: error.errorMessage, isLoading: false)),
        (r) => emit(state.copyWith(isLoading: false)));

    // dataOrError.fold(
    //   (error) => emit(GetSahihElbokharyDataErrorState(error.errorMessage)),
    //   (data) => emit(
    //     GetSahihElbokharyDataSuccesState(data),
    //   ),
    // );
  }
}
