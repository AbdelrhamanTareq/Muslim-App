// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:muslim_app/features/azkar/data/repo/azkar_repo.dart';

import '../../../data/models/azkar.dart';

part 'azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {
  final AzkarRepo _azkarRepo;
  AzkarCubit(
    this._azkarRepo,
  ) : super(AzkarInitial());

  Future getAllAzkarData() async {
    emit(GetAzkarDataLoading());
    try {
      final data = await _azkarRepo.getAzkarDate();
      log("$data");
      emit(GetAzkarDataSuccess(data));
    } catch (e) {
      emit(GetAzkarDataError(e.toString()));
    }
  }

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
