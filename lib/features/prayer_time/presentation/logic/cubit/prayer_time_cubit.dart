// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:muslim_app/features/prayer_time/data/models/prayer_time.dart';
import 'package:muslim_app/features/prayer_time/data/repo/prayer_time_repo.dart';

part 'prayer_time_state.dart';

class PrayerTimeCubit extends Cubit<PrayerTimeState> {
  PrayerTimeCubit(
    this._prayerTimeRepo,
  ) : super(PrayerTimeInitial());

  final PrayerTimeRepo _prayerTimeRepo;

  getPrayerTimeData() async {
    emit(GetPrayerTimeDataLoading());
    final dataOrError = await _prayerTimeRepo.getPrayerTimeData();
    dataOrError.fold(
      (error) {
        print(error.errorMessage);
        emit(GetPrayerTimeDataError(error.errorMessage));
      },
      (data) {
        emit(
          GetPrayerTimeDataSuccess(data),
        );
      },
    );
  }

  // getPrayerTimeData() async {
  //   emit(GetPrayerTimeDataLoading());
  //   final dataOrError = await _prayerTimeRepo.getPostsData();
  //   dataOrError.fold(
  //     (error) {
  //       print(error.errorMessage);
  //       emit(GetPrayerTimeDataError(error.errorMessage));
  //     },
  //     (data) {
  //       emit(
  //       GetPrayerTimeDataSuccess(data),
  //     );
  //     },
  //   );
  // }
}
