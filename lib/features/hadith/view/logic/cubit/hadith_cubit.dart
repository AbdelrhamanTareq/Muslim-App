// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:muslim_app/features/hadith/data/models/hadith.dart';

import 'package:muslim_app/features/hadith/data/repo/hadith_reop.dart';

part 'hadith_state.dart';

class HadithCubit extends Cubit<HadithState> {
  final HadithRepo hadithRepo;
  HadithCubit(
    this.hadithRepo,
  ) : super(HadithInitial());

  Future getHadithData(String hadihPath) async {
    emit(GetSahihElbokharyDataLoadingState());
    final dataOrError = await hadithRepo.getSahihElbokharyData(hadihPath);

    dataOrError.fold(
      (error) => emit(GetSahihElbokharyDataErrorState(error.errorMessage)),
      (data) => emit(
        GetSahihElbokharyDataSuccesState(data),
      ),
    );
  }

  Future addHadithDataToDatabase() async {
    emit(AddHaithDataToDatabaseLoadingState());

    final dataOrError = await hadithRepo.addHadithsBooksToDatabase();
    dataOrError.fold(
        (error) => emit(AddHaithDataToDatabaseErrorState(error.errorMessage)),
        (r) => emit(const AddHaithDataToDatabaseSuccessState()));

    // dataOrError.fold(
    //   (error) => emit(GetSahihElbokharyDataErrorState(error.errorMessage)),
    //   (data) => emit(
    //     GetSahihElbokharyDataSuccesState(data),
    //   ),
    // );
  }
}
