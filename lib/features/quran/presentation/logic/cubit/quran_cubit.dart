import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:muslim_app/features/quran/data/models/quran.dart';
import 'package:muslim_app/features/quran/data/repo/quran_repo.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
final QuranRepo _quranRepo;

  QuranCubit(this._quranRepo) : super(QuranInitial());

  Future getAllQuranData()async{
    emit(QuranGetAllDataLoading());
    try {
    final data =await _quranRepo.getAllQuranData();
    emit(QuranGetAllDataSucces(data));
      
    } catch (e) {
      emit(QuranGetAllDataError(e.toString()));
    }
  }


}
