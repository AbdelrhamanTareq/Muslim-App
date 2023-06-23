// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:muslim_app/features/azkar/data/repo/azkar_repo.dart';

import '../../../data/models/azkar.dart';

part 'main_azkar_state.dart';

class MainAzkarCubit extends Cubit<MainAzkarState> {
  final AzkarRepo _azkarRepo;
  MainAzkarCubit(
    this._azkarRepo,
  ) : super(AzkarInitial());

 

  Future getMainAzkarData() async {
    emit(GetMainAzkarDataLoading());
    try {
      final data = await _azkarRepo.getMainAzkarDate();
      log("$data");
      emit(GetMainAzkarDataSuccess(data));
    } catch (e) {
      emit(GetMainAzkarDataError(e.toString()));
    }
  }
}
