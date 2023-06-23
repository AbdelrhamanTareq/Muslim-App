// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/azkar.dart';
import '../../../data/repo/azkar_repo.dart';

part 'all_azkar_state.dart';

class AllAzkarCubit extends Cubit<AllAzkarState> {
  AllAzkarCubit(
    this._azkarRepo,
  ) : super(AllAzkarInitial());

  final AzkarRepo _azkarRepo;

  Future getAllAzkarData() async {
    emit(GetAllAzkarDataLoading());
    try {
      final data = await _azkarRepo.getAllAzkarDate();

      emit(GetAllAzkarDataSuccess(data));
    } catch (e) {
      emit(GetAllAzkarDataError(e.toString()));
    }
  }
}
